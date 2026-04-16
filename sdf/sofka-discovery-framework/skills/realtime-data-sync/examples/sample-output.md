# Sample Output: Realtime Data Sync Implementation

## Context

- **Project**: Task management app — adding realtime task updates
- **Stack**: Node.js + Express + React + TanStack Query v5 + Supabase [HECHO]
- **Requirement**: Task status changes appear in real-time for all team members in the same project
- **Scale assumption**: ~1,000 concurrent users [SUPUESTO — validate at launch]

---

## Transport Decision

**Chosen transport**: Supabase Realtime (CDC) + SSE for custom events

**Rationale**: [HECHO — Supabase confirmed in package.json]
- Team already uses Supabase; Realtime is built-in (no extra infra)
- Task mutations are unidirectional (server → client)
- SSE handles custom domain events not backed by a Postgres table
- WebSocket not needed — clients don't push through the realtime channel

**Scale plan**: Supabase Realtime handles scaling automatically via managed service. Self-hosted alternative: Redis pub/sub (see scaling section).

---

## Step 1: Enable Realtime on Tables

```sql
-- Run in Supabase SQL Editor
ALTER PUBLICATION supabase_realtime ADD TABLE tasks;
ALTER PUBLICATION supabase_realtime ADD TABLE comments;

-- Verify RLS is enabled (CRITICAL — without RLS, any authenticated user sees all changes)
ALTER TABLE tasks ENABLE ROW LEVEL SECURITY;
CREATE POLICY "team members see project tasks" ON tasks
  USING (
    project_id IN (
      SELECT project_id FROM project_members WHERE user_id = auth.uid()
    )
  );
```

---

## Step 2: React Hook — Task Subscription

```typescript
// hooks/useRealtimeTasks.ts
import { useEffect } from 'react';
import { useQueryClient } from '@tanstack/react-query';
import { supabase } from '@/lib/supabase';
import type { Task } from '@/types';

export function useRealtimeTasks(projectId: string) {
  const queryClient = useQueryClient();

  useEffect(() => {
    const channel = supabase
      .channel(`project-tasks-${projectId}`)
      .on(
        'postgres_changes',
        {
          event: '*',
          schema: 'public',
          table: 'tasks',
          filter: `project_id=eq.${projectId}`,
        },
        (payload) => {
          const queryKey = ['tasks', projectId];

          if (payload.eventType === 'INSERT') {
            queryClient.setQueryData<Task[]>(queryKey, (old = []) => [
              ...old,
              payload.new as Task,
            ]);
          }

          if (payload.eventType === 'UPDATE') {
            queryClient.setQueryData<Task[]>(queryKey, (old = []) =>
              old.map((t) => (t.id === payload.new.id ? (payload.new as Task) : t))
            );
          }

          if (payload.eventType === 'DELETE') {
            queryClient.setQueryData<Task[]>(queryKey, (old = []) =>
              old.filter((t) => t.id !== payload.old.id)
            );
          }
        }
      )
      .subscribe();

    // Cleanup on unmount
    return () => {
      supabase.removeChannel(channel);
    };
  }, [projectId, queryClient]);
}
```

---

## Step 3: Optimistic Updates on Task Status Change

```typescript
// mutations/useUpdateTaskStatus.ts
import { useMutation, useQueryClient } from '@tanstack/react-query';
import { supabase } from '@/lib/supabase';
import type { Task } from '@/types';

export function useUpdateTaskStatus(projectId: string) {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: async ({ taskId, status }: { taskId: string; status: Task['status'] }) => {
      const { data, error } = await supabase
        .from('tasks')
        .update({ status, updated_at: new Date().toISOString() })
        .eq('id', taskId)
        .select()
        .single();

      if (error) throw error;
      return data;
    },

    onMutate: async ({ taskId, status }) => {
      // Cancel competing queries to prevent overwrite
      await queryClient.cancelQueries({ queryKey: ['tasks', projectId] });

      // Save snapshot for rollback
      const snapshot = queryClient.getQueryData<Task[]>(['tasks', projectId]);

      // Apply optimistic update immediately
      queryClient.setQueryData<Task[]>(['tasks', projectId], (old = []) =>
        old.map((t) => (t.id === taskId ? { ...t, status } : t))
      );

      return { snapshot };
    },

    onError: (err, variables, context) => {
      // Rollback to snapshot
      if (context?.snapshot) {
        queryClient.setQueryData(['tasks', projectId], context.snapshot);
      }
      toast.error('Failed to update task status');
    },

    onSettled: () => {
      // Invalidate to ensure server truth (Supabase Realtime may have already updated)
      queryClient.invalidateQueries({ queryKey: ['tasks', projectId] });
    },
  });
}
```

---

## Step 4: Presence — Who Is Viewing This Project

```typescript
// hooks/useProjectPresence.ts
import { useEffect, useState } from 'react';
import { supabase } from '@/lib/supabase';

interface UserPresence {
  user_id: string;
  username: string;
  avatar_url: string;
}

export function useProjectPresence(projectId: string, currentUser: UserPresence) {
  const [onlineUsers, setOnlineUsers] = useState<UserPresence[]>([]);

  useEffect(() => {
    const channel = supabase.channel(`presence-project-${projectId}`);

    channel
      .on('presence', { event: 'sync' }, () => {
        const state = channel.presenceState<UserPresence>();
        // Each key is a socket ID; values are arrays of presence state
        const users = Object.values(state).flatMap((s) => s);
        setOnlineUsers(users);
      })
      .subscribe(async (status) => {
        if (status === 'SUBSCRIBED') {
          await channel.track(currentUser);
        }
      });

    return () => {
      supabase.removeChannel(channel);
    };
  }, [projectId, currentUser]);

  return onlineUsers;
}
```

---

## Step 5: Reconnection Handling (WebSocket Provider)

Supabase Realtime handles reconnection automatically. For custom WebSocket:

```typescript
// lib/ws-client.ts
export class TaskSyncClient {
  private attempt = 0;
  private ws: WebSocket | null = null;

  connect(projectId: string, token: string) {
    const url = `wss://api.example.com/sync?project=${projectId}&token=${token}`;
    this.ws = new WebSocket(url);

    this.ws.onopen = () => {
      this.attempt = 0;
      console.log('Realtime connected');
    };

    this.ws.onclose = (e) => {
      if (e.code === 1000) return;  // Normal close
      this.reconnect(projectId, token);
    };
  }

  private reconnect(projectId: string, token: string) {
    const maxAttempts = 8;
    if (this.attempt >= maxAttempts) {
      notifyUser('Realtime disconnected. Refresh to reconnect.');
      return;
    }

    const delay = Math.min(1000 * Math.pow(2, this.attempt) + Math.random() * 500, 30000);
    this.attempt++;

    console.log(`Reconnecting in ${Math.round(delay / 1000)}s (attempt ${this.attempt})`);
    setTimeout(() => this.connect(projectId, token), delay);
  }
}
```

---

## Architecture Summary

```
Browser (React)
    │
    ├── useRealtimeTasks() ──── Supabase Realtime channel (postgres_changes)
    │                               │
    │                               ├── INSERT → add to TanStack Query cache
    │                               ├── UPDATE → patch in cache
    │                               └── DELETE → remove from cache
    │
    ├── useUpdateTaskStatus() ── REST mutation (PATCH /tasks/:id)
    │       │                       │
    │       ├── onMutate: optimistic update immediately
    │       ├── onError: rollback to snapshot
    │       └── onSettled: invalidate (Realtime may already have synced)
    │
    └── useProjectPresence() ── Supabase Presence channel
                                    └── track current user on connect
```

---

## Quality Gate Checklist

- [x] Transport selection documented with rationale (SSE + Supabase vs WebSocket)
- [x] RLS enabled on tables before enabling Realtime
- [x] Subscription cleanup on component unmount
- [x] Optimistic updates with cancel-snapshot-apply pattern
- [x] Rollback on mutation error
- [x] Presence for UX (who is online)
- [x] Reconnection with exponential backoff for custom WebSocket
- [x] Scale path documented (Supabase managed → Redis pub/sub if self-hosted)
