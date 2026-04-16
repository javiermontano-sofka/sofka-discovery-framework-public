---
name: realtime-data-sync
author: "Javier Montaño (JM Labs)"
version: "2.0.0"
description: >
  Design and implement real-time data synchronization: WebSocket vs SSE vs long
  polling decision, Supabase Realtime, Firebase RTDB, optimistic updates,
  conflict resolution, and connection resilience patterns.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - Agent
tags: [realtime, websocket, sse, supabase-realtime, firebase, optimistic-updates, conflict-resolution, crdt]
---

# Realtime Data Sync

> *"Real-time sync is about maintaining an illusion of consistency across an inherently distributed system — design for failure, not success."*

## TL;DR

Five-step procedure to design a real-time sync architecture: transport selection,
optimistic update patterns, conflict resolution strategy, connection lifecycle
management, and server-sent vs. bidirectional trade-offs.

---

## Step 1 — Transport Selection

### Decision Framework

| Criterion | WebSocket | SSE | Long Polling |
|-----------|-----------|-----|-------------|
| Browser support | All modern | All modern (IE11 excl.) | All |
| Direction | Bidirectional | Server → Client only | Server → Client |
| Protocol | TCP framing | HTTP/1.1 or HTTP/2 | HTTP |
| Load balancer friendly | Sticky sessions required | Standard HTTP routing | Standard HTTP routing |
| Message size | Any | Text only (natively) | Text only |
| Auto-reconnect | Manual | Native EventSource | Manual |
| Proxy/firewall issues | Some corporate firewalls block | Rare | Never |
| Use case | Chat, collaborative editing, gaming | Notifications, feeds, dashboards | Simple polling fallback |

### When to Use Each

- **WebSocket**: Collaborative editing (Google Docs-like), multiplayer, chat with typing indicators, cursor sharing.
- **SSE**: Notification streams, live dashboards, CI/CD build logs, stock tickers where client rarely sends data.
- **Long Polling**: Legacy environments, max compatibility needed, simple status updates.
- **Supabase Realtime**: Postgres CDC on existing Supabase projects — rows/changes streamed via Phoenix Channels.
- **Firebase RTDB / Firestore listeners**: Mobile-first apps with offline-first requirements.

---

## Step 2 — Optimistic Updates

Optimistic updates apply mutations to local state immediately before server confirmation.

### Pattern: Optimistic + Rollback

```typescript
// hooks/useOptimisticMutation.ts
import { useMutation, useQueryClient } from '@tanstack/react-query';

export function useUpdateTodo(todoId: string) {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: (update: Partial<Todo>) =>
      fetch(`/api/todos/${todoId}`, {
        method: 'PATCH',
        body: JSON.stringify(update),
      }).then(r => r.json()),

    // Apply optimistically before API call
    onMutate: async (update) => {
      await queryClient.cancelQueries({ queryKey: ['todos'] });
      const previous = queryClient.getQueryData<Todo[]>(['todos']);

      queryClient.setQueryData<Todo[]>(['todos'], (old) =>
        old?.map(todo => todo.id === todoId ? { ...todo, ...update } : todo) ?? []
      );

      return { previous };  // Snapshot for rollback
    },

    onError: (_err, _vars, context) => {
      // Roll back to pre-mutation state
      queryClient.setQueryData(['todos'], context?.previous);
    },

    onSettled: () => {
      // Sync with server reality regardless of outcome
      queryClient.invalidateQueries({ queryKey: ['todos'] });
    },
  });
}
```

### Temporary ID Pattern

```typescript
// When creating new records optimistically
const tempId = `temp-${crypto.randomUUID()}`;
const optimisticTodo: Todo = { id: tempId, title, completed: false };

// After server responds, replace tempId with real id
queryClient.setQueryData<Todo[]>(['todos'], (old) =>
  old?.map(todo => todo.id === tempId ? serverResponse : todo) ?? []
);
```

---

## Step 3 — Supabase Realtime Integration

```typescript
// lib/realtime.ts
import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL!,
  process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
);

// Subscribe to Postgres changes (CDC)
export function subscribeToTodos(
  userId: string,
  onInsert: (todo: Todo) => void,
  onUpdate: (todo: Todo) => void,
  onDelete: (id: string) => void,
) {
  const channel = supabase
    .channel(`todos:${userId}`)
    .on(
      'postgres_changes',
      {
        event: '*',
        schema: 'public',
        table: 'todos',
        filter: `user_id=eq.${userId}`,
      },
      (payload) => {
        switch (payload.eventType) {
          case 'INSERT': onInsert(payload.new as Todo); break;
          case 'UPDATE': onUpdate(payload.new as Todo); break;
          case 'DELETE': onDelete(payload.old.id as string); break;
        }
      }
    )
    .subscribe((status) => {
      if (status === 'CHANNEL_ERROR') {
        console.error('Realtime channel error — will retry');
      }
    });

  return () => supabase.removeChannel(channel);
}

// Presence — who is online
export function usePresence(roomId: string) {
  const channel = supabase.channel(`room:${roomId}`);

  channel
    .on('presence', { event: 'sync' }, () => {
      const state = channel.presenceState();
      // { userId: [{ online_at, ... }] }
    })
    .subscribe(async (status) => {
      if (status === 'SUBSCRIBED') {
        await channel.track({ user_id: currentUserId, online_at: new Date().toISOString() });
      }
    });
}
```

---

## Step 4 — Conflict Resolution

### Last-Write-Wins (LWW)

```typescript
// Simple: highest timestamp wins
function mergeUpdates<T extends { updatedAt: string }>(local: T, remote: T): T {
  return new Date(local.updatedAt) > new Date(remote.updatedAt) ? local : remote;
}
```

### Operational Transform (OT) Lite — for text

```typescript
// For collaborative text editing without full OT library
// Position-based transforms
function transformInsert(
  op: InsertOp,
  against: InsertOp | DeleteOp
): InsertOp {
  if (against.type === 'insert' && against.position <= op.position) {
    return { ...op, position: op.position + against.text.length };
  }
  if (against.type === 'delete' && against.position < op.position) {
    return { ...op, position: op.position - against.length };
  }
  return op;
}
// For production: use Yjs (CRDT) or ShareDB (OT)
```

### CRDT with Yjs (Production Collaborative Editing)

```typescript
import * as Y from 'yjs';
import { WebsocketProvider } from 'y-websocket';

const doc = new Y.Doc();
const provider = new WebsocketProvider(
  'wss://your-yjs-server.com',
  `document:${docId}`,
  doc,
  { connect: true }
);

// Shared types — CRDT-safe
const text = doc.getText('content');
const map = doc.getMap('metadata');

// Bind to editor (e.g., TipTap, CodeMirror)
provider.awareness.setLocalStateField('user', {
  name: currentUser.name,
  color: '#' + Math.floor(Math.random() * 16777215).toString(16),
});
```

---

## Step 5 — Connection Resilience

### WebSocket Reconnection with Exponential Backoff

```typescript
// lib/ws-client.ts
export class ReliableWebSocket {
  private ws: WebSocket | null = null;
  private reconnectAttempt = 0;
  private maxAttempts = 10;

  constructor(
    private url: string,
    private handlers: {
      onMessage: (data: unknown) => void;
      onReconnect: () => void;
    }
  ) {
    this.connect();
  }

  private connect() {
    this.ws = new WebSocket(this.url);

    this.ws.onopen = () => {
      this.reconnectAttempt = 0;
      this.handlers.onReconnect();  // Re-subscribe to rooms
    };

    this.ws.onmessage = (event) => {
      this.handlers.onMessage(JSON.parse(event.data));
    };

    this.ws.onclose = (event) => {
      if (event.code !== 1000 && this.reconnectAttempt < this.maxAttempts) {
        const delay = Math.min(1000 * 2 ** this.reconnectAttempt, 30000);
        const jitter = Math.random() * 1000;
        setTimeout(() => {
          this.reconnectAttempt++;
          this.connect();
        }, delay + jitter);
      }
    };
  }

  send(data: unknown) {
    if (this.ws?.readyState === WebSocket.OPEN) {
      this.ws.send(JSON.stringify(data));
    } else {
      // Queue for when connection restores
      this.messageQueue.push(data);
    }
  }
}
```

### Cursor Sync with Throttling (Presence)

```typescript
// Throttle mouse movements — never send every mousemove event
import { throttle } from 'lodash-es';

const sendCursorPosition = throttle((x: number, y: number) => {
  ws.send({ type: 'cursor', x, y, userId });
}, 50);  // Max 20 updates/second per user

document.addEventListener('mousemove', (e) => {
  sendCursorPosition(e.clientX, e.clientY);
});
```

---

## Quality Criteria

1. **Reconnection with exponential backoff** — WebSocket clients never hammer server on disconnect.
2. **Optimistic updates with rollback** — UI responds instantly; server errors roll back cleanly.
3. **Message deduplication** — Idempotency keys on mutations; duplicate messages don't cause double-apply.
4. **Presence throttled** — Cursor/typing indicators throttled to ≤20Hz; not raw mousemove events.
5. **Channel cleanup on unmount** — Supabase/Firebase subscriptions removed when component unmounts.
6. **Conflict resolution strategy defined** — LWW, OT, or CRDT chosen explicitly, not accidentally.
7. **Offline queue for mutations** — Writes queued when offline, replayed on reconnect.
8. **Load test at expected concurrent connections** — WebSocket servers have different scaling limits than HTTP.

---

## Anti-Patterns

- **WebSocket without reconnection logic** — Network blips silently break sync; users see stale data indefinitely without knowing.
- **Subscribing to all table changes without filters** — `supabase.channel('*')` for a multi-tenant app streams every tenant's data to every user; always filter by `user_id` or `org_id`.
- **Optimistic updates without error rollback** — Applying optimistic state and never rolling back on failure shows the user data that doesn't exist on the server.
- **Throttling with `debounce` instead of `throttle` for cursor/presence** — Debounce delays all events until pause; cursor appears frozen during continuous movement.
- **Not handling `visibilitychange`** — Page hidden → connection often drops silently; reconnect when visibility returns.
- **Broadcasting all state on reconnect** — Re-sending the full document on reconnect causes thundering herd if 1000 clients reconnect simultaneously; use sequence numbers and delta sync.
