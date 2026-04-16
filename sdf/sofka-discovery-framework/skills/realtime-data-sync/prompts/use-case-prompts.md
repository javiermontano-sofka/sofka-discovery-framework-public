# Use Case Prompts — Realtime Data Sync

## Scenario 1: Choose Transport for Notification System

```
Choose the right realtime transport for this notification system:
- Server sends notifications when: new message received, task assigned, PR approved
- Clients never send data through the notification channel
- System runs behind Nginx reverse proxy and AWS ALB
- Expected concurrent users: ~5,000
- Team uses Node.js + Express + React

Options to evaluate:
1. WebSocket
2. Server-Sent Events (SSE)
3. Supabase Realtime (CDC)

For each option:
1. Evaluate fit against the requirements
2. Show server implementation (minimal working code)
3. Show client connection setup
4. Explain load balancer considerations
5. Recommend one option with rationale
```

## Scenario 2: Fix N+1 Optimistic Update Bug

```
This mutation runs correctly but the UI reverts to the old value for ~300ms after clicking:

const mutation = useMutation({
  mutationFn: (title: string) =>
    fetch(`/api/posts/${postId}`, { method: 'PATCH', body: JSON.stringify({ title }) }),
  onSuccess: () => {
    queryClient.invalidateQueries(['post', postId]);
  },
});

Requirements:
- UI should update instantly on click (optimistic)
- On network error, revert to previous value
- After server responds, ensure UI shows server truth (not stale client state)

Deliver:
1. Diagnosis of why the UI reverts (missing onMutate)
2. Fixed mutation with full onMutate / onError / onSettled pattern
3. Explain why cancelQueries is necessary before the optimistic update
4. Add TypeScript types to the mutation
```

## Scenario 3: Scale WebSocket Server to Multiple Instances

```
Current implementation:
- Single Node.js server with ws library
- connections Map<userId, WebSocket> in memory
- Works fine for 1 server, but deployment needs 3 instances behind a load balancer
- When a user on server A sends a message to a user on server B, it doesn't deliver

Design the multi-server solution:
1. Explain why the current approach fails (connection affinity problem)
2. Implement Redis pub/sub bridge:
   - subscriber receives messages from Redis, delivers to local connections
   - publisher sends to Redis channel when broadcasting
3. Show the complete flow: User A (server 1) → sends message → User B (server 2)
4. What happens to connection state if a server restarts?
5. Should the load balancer use sticky sessions? Why or why not?
```

## Scenario 4: Implement Collaborative Document Editing

```
Build collaborative text editing for a note-taking app:
- Multiple users can edit the same document simultaneously
- Changes must converge (no "last write wins" overwrites)
- Offline editing: changes sync when reconnected
- Show cursor positions of other users

Stack: Next.js + TypeScript + Supabase (for auth + storage)

Deliver:
1. Explain why Last Write Wins fails for concurrent text editing
2. Yjs setup: ydoc, WebsocketProvider, IndexeddbPersistence
3. Awareness API for cursor position sharing
4. Where to run the y-websocket server (Vercel, Railway, or custom)
5. How to persist document state to Supabase for new user initial load
6. What happens to the Yjs state if the y-websocket server crashes?
```

## Scenario 5: Add Supabase Realtime to Existing Dashboard

```
Existing dashboard:
- React app with TanStack Query, polling every 5 seconds
- PostgreSQL on Supabase
- Shows: live order status, current inventory levels, recent alerts table

Problem:
- 5s polling feels too slow for order status updates
- High server load from polling (200 clients × 12 requests/minute = 2400 req/min)

Migrate to Supabase Realtime:
1. Which tables need ALTER PUBLICATION supabase_realtime ADD TABLE?
2. Show the useEffect hook for subscribing to orders table changes
3. Handle INSERT, UPDATE, DELETE events separately for the alerts table
4. Show how to remove channel subscription on component unmount
5. What's the security implication of enabling realtime on a table with RLS disabled?
6. Estimate the reduction in DB queries after migration
```
