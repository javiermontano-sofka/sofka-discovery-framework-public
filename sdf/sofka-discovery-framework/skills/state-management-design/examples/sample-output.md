# State Management Design — Sample Output

## Context
A project management tool (React SPA) needs state management for: task boards with drag-and-drop, real-time collaboration (multiple users viewing the same board), filters and search, user preferences, and form-heavy task creation/editing.

## Output

### State Taxonomy

| State | Category | Source of Truth | Lifecycle | Strategy |
|-------|---------|----------------|-----------|----------|
| Tasks, Projects, Users | Server State | REST API / PostgreSQL | Persistent | TanStack Query |
| Board column order | Server State | API | Persistent | TanStack Query + Optimistic |
| Drag-and-drop position | Client State (ephemeral) | Component | Ephemeral | Local state (useState) |
| Active filters | URL State | URL search params | Session | nuqs (URL state library) |
| Search query | URL State | URL search params | Session | nuqs + debounced API call |
| Modal open/close | Client State | Component | Ephemeral | Local state (useState) |
| Task edit form | Client State | Form | Ephemeral | React Hook Form |
| Theme preference | Client State (persistent) | localStorage | Persistent | Zustand + persist middleware |
| Notification count | Server State (real-time) | WebSocket | Session | Zustand (WebSocket-driven) |
| Board collaborator cursors | Client State (real-time) | WebSocket | Ephemeral | useRef + WebSocket |

### Architecture Diagram

```
┌──────────────────────────────────────────────────┐
│                   React App                       │
│                                                    │
│  ┌─────────────┐  ┌──────────┐  ┌──────────────┐ │
│  │ TanStack     │  │ Zustand  │  │ URL State    │ │
│  │ Query Cache  │  │ Store    │  │ (nuqs)       │ │
│  │              │  │          │  │              │ │
│  │ - tasks      │  │ - theme  │  │ - filters    │ │
│  │ - projects   │  │ - notifs │  │ - search     │ │
│  │ - users      │  │ - sidebar│  │ - sort       │ │
│  │ - board cols │  │          │  │ - page       │ │
│  └──────┬───────┘  └────┬─────┘  └──────────────┘ │
│         │               │                          │
│  ┌──────▼───────┐  ┌────▼─────┐                   │
│  │ REST API     │  │WebSocket │                    │
│  │ (fetch)      │  │ Client   │                    │
│  └──────┬───────┘  └────┬─────┘                   │
└─────────┼───────────────┼──────────────────────────┘
          │               │
    ┌─────▼─────┐   ┌─────▼─────┐
    │ API Server│   │ WS Server │
    └───────────┘   └───────────┘
```

### Server State Management (TanStack Query)

```typescript
// Task queries with background refresh
const useTasksQuery = (projectId: string, filters: TaskFilters) =>
  useQuery({
    queryKey: ['tasks', projectId, filters],
    queryFn: () => api.getTasks(projectId, filters),
    staleTime: 30_000,       // 30s before refetch
    gcTime: 5 * 60_000,      // 5min cache retention
    refetchOnWindowFocus: true,
  });

// Optimistic drag-and-drop reorder
const useReorderTask = () =>
  useMutation({
    mutationFn: api.reorderTask,
    onMutate: async (variables) => {
      // Cancel outgoing refetches
      await queryClient.cancelQueries({ queryKey: ['tasks', variables.projectId] });

      // Snapshot previous value
      const previous = queryClient.getQueryData(['tasks', variables.projectId]);

      // Optimistically update the cache
      queryClient.setQueryData(['tasks', variables.projectId], (old) =>
        reorderInPlace(old, variables.taskId, variables.newPosition)
      );

      return { previous };
    },
    onError: (err, variables, context) => {
      // Rollback on error
      queryClient.setQueryData(
        ['tasks', variables.projectId],
        context.previous
      );
      toast.error('Failed to reorder task. Reverted.');
    },
    onSettled: (data, error, variables) => {
      // Refetch to ensure server consistency
      queryClient.invalidateQueries({ queryKey: ['tasks', variables.projectId] });
    },
  });
```

### Real-Time Collaboration

| Event | Direction | Payload | Handler |
|-------|-----------|---------|---------|
| `task.updated` | Server → Client | `{ taskId, changes, userId }` | Invalidate task query cache |
| `task.moved` | Server → Client | `{ taskId, fromCol, toCol, position }` | Update cache directly (no refetch) |
| `cursor.moved` | Client → Server → Others | `{ userId, position, boardId }` | Update collaborator cursor ref |
| `user.presence` | Server → Client | `{ userId, status, boardId }` | Update active collaborators list |

**Implementation**: WebSocket connection managed in a Zustand store with automatic reconnection. Server events trigger TanStack Query cache updates via `queryClient.setQueryData` for immediate UI response.

### URL State Design

```
/projects/proj_123/board?status=in_progress,review&assignee=user_456&sort=priority_desc&page=2
```

| Param | Type | Default | Serialization |
|-------|------|---------|---------------|
| `status` | string[] | `['todo','in_progress','review','done']` | Comma-separated |
| `assignee` | string | (none) | Direct |
| `sort` | enum | `'position_asc'` | Direct |
| `page` | number | `1` | Direct |
| `search` | string | `''` | URL-encoded, debounced 300ms |

**Benefit**: Filters survive page refresh, bookmarking, and sharing via URL.
