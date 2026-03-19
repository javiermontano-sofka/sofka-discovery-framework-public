# State of the Art: Realtime Data Sync (2025-2026)

## Current Landscape

WebSocket and SSE remain the dominant transports. The ecosystem has consolidated around
managed realtime services (Supabase Realtime, Ably, Pusher) for most use cases, with
self-hosted WebSocket servers for specialized needs. CRDT libraries like Yjs have matured
into production-grade solutions for collaborative editing.

---

## Key 2025-2026 Developments

### Supabase Realtime v3 (2024)

Significant performance improvements: support for 500k concurrent connections per project,
broadcast latency under 50ms globally, and new `presence` API for tracking online users:

```typescript
// New: Multiplexed channels (single WebSocket connection for multiple subscriptions)
const client = createClient(url, key);
// All channels share one underlying WebSocket connection
const channelA = client.channel('room-a');
const channelB = client.channel('room-b');
```

### Yjs Ecosystem Maturity

Yjs v14+ is now stable and production-tested by Notion-like applications:

```typescript
import * as Y from 'yjs';
import { WebsocketProvider } from 'y-websocket';
import { IndexeddbPersistence } from 'y-indexeddb';

const doc = new Y.Doc();

// Offline-first: persist to IndexedDB, sync when online
const indexeddbProvider = new IndexeddbPersistence('doc-id', doc);
const wsProvider = new WebsocketProvider('wss://sync.example.com', 'doc-id', doc);

// Awareness (presence + cursor positions)
wsProvider.awareness.setLocalState({
  user: { name: 'Alice', color: '#FF7E08' },
  cursor: { anchor: 42, head: 50 },
});
```

### PartyKit — Edge-First WebSocket Hosting (2024-2025)

PartyKit deploys WebSocket servers to Cloudflare's edge network (300+ PoPs):

```typescript
// partykit/server.ts
import type * as Party from 'partykit/server';

export default class ChatRoom implements Party.Server {
  constructor(readonly room: Party.Room) {}

  onConnect(conn: Party.Connection) {
    this.room.broadcast(`User ${conn.id} joined`, [conn.id]);
  }

  onMessage(message: string, sender: Party.Connection) {
    this.room.broadcast(message);  // Broadcast to all in room
  }
}
```

### Socket.io v5 — Namespace + Room Improvements

Socket.io 5.x adds better TypeScript support and simplified namespace management:

```typescript
// Type-safe events
interface ServerToClientEvents {
  postUpdated: (post: Post) => void;
}
interface ClientToServerEvents {
  updatePost: (update: Partial<Post>) => void;
}

const io = new Server<ClientToServerEvents, ServerToClientEvents>(httpServer);
io.on('connection', (socket) => {
  socket.on('updatePost', (update) => {
    socket.to(`post:${update.id}`).emit('postUpdated', update);
  });
});
```

### Cloudflare Durable Objects for Stateful Realtime

Durable Objects provide strongly consistent, stateful compute at the edge:

```typescript
export class DocumentRoom implements DurableObject {
  state: DurableObjectState;
  sessions: Map<string, WebSocket> = new Map();

  constructor(state: DurableObjectState) {
    this.state = state;
  }

  async fetch(request: Request): Promise<Response> {
    const [client, server] = Object.values(new WebSocketPair());
    this.state.acceptWebSocket(server);
    return new Response(null, { status: 101, webSocket: client });
  }

  async webSocketMessage(ws: WebSocket, message: string) {
    // Broadcast to all sessions in this room
    this.state.getWebSockets().forEach(s => s.send(message));
  }
}
```

---

## Best Current Practices (2025)

1. **SSE over WebSocket** when unidirectional (notifications, feeds) — simpler, standard HTTP.
2. **Supabase Realtime** for Postgres-backed apps — built-in CDC without infra overhead.
3. **Yjs for collaborative editing** — production-proven CRDT, don't implement custom OT.
4. **Exponential backoff with jitter** on all reconnection logic — prevents thundering herd.
5. **Optimistic updates with TanStack Query** — cancel-snapshot-apply-rollback pattern.
6. **Redis pub/sub for WebSocket horizontal scaling** — necessary beyond single server.
7. **Separate broadcast / state sync / presence** — each has different reliability requirements.
8. **PartyKit or Cloudflare Durable Objects** for edge-native realtime (< 20ms latency globally).

---

## Latency Benchmarks (2025)

- WebSocket message (same DC): < 1ms round-trip
- Supabase Realtime broadcast (global avg): ~40-80ms
- SSE (server push): ~5ms from emit to client receive
- Long polling: ~100-300ms average (worst case: full timeout)
- PartyKit (Cloudflare edge): ~15-30ms from any region
- Yjs sync (peer convergence): typically 1-3 round trips (~100ms on typical connection)
