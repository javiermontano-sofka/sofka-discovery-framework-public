# Body of Knowledge: Realtime Data Sync

## Transport Selection

### Comparison Matrix

| Dimension | WebSocket | Server-Sent Events (SSE) | Long Polling | HTTP/2 Push |
|-----------|-----------|--------------------------|--------------|-------------|
| Direction | Bidirectional | Server → Client only | Server → Client | Server → Client |
| Protocol | WS/WSS | HTTP | HTTP | HTTP/2 |
| Load balancer support | Requires sticky sessions or pub/sub broker | Standard HTTP (sticky optional) | Standard HTTP | Standard HTTP/2 |
| Mobile battery impact | Higher (persistent TCP) | Medium | Higher (frequent reconnect) | Low |
| Firewall/proxy issues | Common (port 80/443 tunneling needed) | Rare | Rare | Rare |
| Browser support | All modern | All modern (polyfill for IE) | All | Limited |
| Max connections per origin | No limit (one socket) | 6 (HTTP/1.1) / unlimited (HTTP/2) | 6 / unlimited | unlimited |
| Reconnection | Manual | Automatic (EventSource API) | Manual | — |

### Decision Guide

```
Does the client need to SEND data through the same channel?
  YES → WebSocket
  NO →
    Is the update rate < 1/sec and simplicity matters?
      YES → SSE
    Is this legacy infrastructure without WS support?
      YES → Long Polling
    Otherwise → SSE (simpler than WebSocket, built-in reconnect)
```

---

## WebSocket Architecture

### Node.js Server with Authentication

```typescript
import { WebSocketServer, WebSocket } from 'ws';
import { verifyJWT } from './auth';

const wss = new WebSocketServer({ noServer: true });

// Map of userId → Set<WebSocket> (multiple tabs)
const connections = new Map<string, Set<WebSocket>>();

// Upgrade HTTP → WebSocket with auth
server.on('upgrade', (req, socket, head) => {
  const token = new URL(req.url!, 'http://localhost').searchParams.get('token');
  const user = verifyJWT(token);
  if (!user) return socket.destroy();

  wss.handleUpgrade(req, socket, head, (ws) => {
    wss.emit('connection', ws, user);
  });
});

wss.on('connection', (ws: WebSocket, user: { id: string }) => {
  // Register
  if (!connections.has(user.id)) connections.set(user.id, new Set());
  connections.get(user.id)!.add(ws);

  ws.on('close', () => {
    connections.get(user.id)?.delete(ws);
  });

  // Heartbeat
  ws.isAlive = true;
  ws.on('pong', () => { ws.isAlive = true; });
});

// Heartbeat interval — detect dead connections
setInterval(() => {
  wss.clients.forEach((ws: any) => {
    if (!ws.isAlive) return ws.terminate();
    ws.isAlive = false;
    ws.ping();
  });
}, 30_000);

// Send to specific user (all tabs)
export function sendToUser(userId: string, message: object) {
  connections.get(userId)?.forEach((ws) => {
    if (ws.readyState === WebSocket.OPEN) {
      ws.send(JSON.stringify(message));
    }
  });
}
```

### WebSocket in Horizontally Scaled Systems

Single server → Map works. Multiple servers → need a broker:

```typescript
// Redis pub/sub bridge (simplified)
import Redis from 'ioredis';
const pub = new Redis();
const sub = new Redis();

sub.subscribe('ws:broadcast');
sub.on('message', (_, message) => {
  const { userId, data } = JSON.parse(message);
  // Deliver to local connections for this userId
  connections.get(userId)?.forEach((ws) => ws.send(data));
});

// From any server in the cluster
export function broadcastToUser(userId: string, data: object) {
  pub.publish('ws:broadcast', JSON.stringify({ userId, data: JSON.stringify(data) }));
}
```

---

## Server-Sent Events (SSE)

### Node.js / Express SSE Endpoint

```typescript
import express from 'express';
const router = express.Router();

router.get('/events', authenticate, (req, res) => {
  res.setHeader('Content-Type', 'text/event-stream');
  res.setHeader('Cache-Control', 'no-cache');
  res.setHeader('Connection', 'keep-alive');
  res.setHeader('X-Accel-Buffering', 'no');  // Nginx: disable buffering
  res.flushHeaders();

  const userId = req.user.id;
  const clientId = registerSSEClient(userId, res);

  req.on('close', () => unregisterSSEClient(userId, clientId));
});

function sendSSE(res: express.Response, event: string, data: object) {
  res.write(`event: ${event}\n`);
  res.write(`data: ${JSON.stringify(data)}\n\n`);
}
```

### Browser SSE Client

```typescript
const es = new EventSource('/events?token=...', { withCredentials: true });

es.addEventListener('post.updated', (e) => {
  const post = JSON.parse(e.data);
  updatePostInUI(post);
});

es.addEventListener('error', () => {
  // EventSource auto-reconnects after ~3s by default
  console.log('SSE connection lost, will auto-reconnect');
});
```

---

## Supabase Realtime

### Change Data Capture (CDC) via Postgres Logical Replication

Supabase Realtime captures WAL changes and broadcasts to subscribed clients:

```typescript
import { createClient } from '@supabase/supabase-js';
const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

// Subscribe to all changes on a table (requires REALTIME publication)
const channel = supabase
  .channel('public:posts')
  .on(
    'postgres_changes',
    { event: '*', schema: 'public', table: 'posts' },
    (payload) => {
      if (payload.eventType === 'INSERT') addPost(payload.new);
      if (payload.eventType === 'UPDATE') updatePost(payload.new);
      if (payload.eventType === 'DELETE') removePost(payload.old.id);
    }
  )
  .subscribe();

// Subscribe to a specific row (for user-specific updates)
const userChannel = supabase
  .channel('user-notifications')
  .on(
    'postgres_changes',
    { event: 'INSERT', schema: 'public', table: 'notifications',
      filter: `user_id=eq.${userId}` },
    (payload) => showNotification(payload.new)
  )
  .subscribe();

// Cleanup
return () => supabase.removeChannel(channel);
```

### Enabling Realtime on Tables

```sql
-- In Supabase: enable replication for table
ALTER PUBLICATION supabase_realtime ADD TABLE posts;

-- Row-level security still applies to realtime (important!)
-- Clients only receive changes to rows they can SELECT
```

---

## Optimistic Updates

### TanStack Query v5 Optimistic Updates

```typescript
const queryClient = useQueryClient();

const mutation = useMutation({
  mutationFn: (update: { id: string; title: string }) =>
    fetch(`/api/posts/${update.id}`, {
      method: 'PATCH',
      body: JSON.stringify(update),
    }).then(r => r.json()),

  onMutate: async (update) => {
    // Cancel in-flight refetches to avoid overwriting optimistic update
    await queryClient.cancelQueries({ queryKey: ['posts', update.id] });

    // Snapshot previous value for rollback
    const previousPost = queryClient.getQueryData(['posts', update.id]);

    // Apply optimistic update
    queryClient.setQueryData(['posts', update.id], (old: Post) => ({
      ...old,
      ...update,
    }));

    return { previousPost };
  },

  onError: (err, update, context) => {
    // Rollback on failure
    queryClient.setQueryData(['posts', update.id], context?.previousPost);
    toast.error('Failed to update post');
  },

  onSettled: (data, error, update) => {
    // Always refetch to sync with server truth
    queryClient.invalidateQueries({ queryKey: ['posts', update.id] });
  },
});
```

---

## Conflict Resolution

### Last Write Wins (LWW)

Simplest: compare timestamps, highest wins. Problem: clock skew on clients.

```typescript
function mergeWithLWW<T extends { updatedAt: string }>(local: T, remote: T): T {
  return new Date(local.updatedAt) > new Date(remote.updatedAt) ? local : remote;
}
```

### Operational Transform (OT)

Used by Google Docs. Complex to implement correctly. Libraries: `ot.js`, `sharedb`.
Suitable for: collaborative text editing.

### CRDT with Yjs

Conflict-free replicated data types — mathematically guaranteed convergence:

```typescript
import * as Y from 'yjs';
import { WebsocketProvider } from 'y-websocket';

const ydoc = new Y.Doc();
const provider = new WebsocketProvider('wss://sync.example.com', 'room-id', ydoc);

// Y.Map for key-value sync (converges automatically)
const ymap = ydoc.getMap('document');
ymap.set('title', 'New Title');

// Y.Text for collaborative text (OT-like convergence)
const ytext = ydoc.getText('content');
ytext.insert(0, 'Hello world');

// Observe changes from any peer
ymap.observe((event) => {
  event.changes.keys.forEach((change, key) => {
    if (change.action === 'update') updateField(key, ymap.get(key));
  });
});

// Persistence: encode/decode state
const state = Y.encodeStateAsUpdate(ydoc);  // Uint8Array
Y.applyUpdate(ydoc, savedState);  // Restore from DB
```

---

## Reconnection with Exponential Backoff

```typescript
class ReconnectingWebSocket {
  private ws: WebSocket | null = null;
  private attempt = 0;
  private maxAttempts = 10;
  private baseDelay = 1000;  // 1s
  private maxDelay = 30_000; // 30s
  private handlers = new Map<string, Set<Function>>();

  constructor(private url: string) {
    this.connect();
  }

  private connect() {
    this.ws = new WebSocket(this.url);

    this.ws.onopen = () => {
      this.attempt = 0;
      this.emit('connected');
    };

    this.ws.onmessage = (e) => {
      this.emit('message', JSON.parse(e.data));
    };

    this.ws.onclose = (e) => {
      if (e.code === 1000) return;  // Normal close, don't reconnect
      this.scheduleReconnect();
    };
  }

  private scheduleReconnect() {
    if (this.attempt >= this.maxAttempts) {
      this.emit('failed');
      return;
    }

    // Exponential backoff with jitter
    const delay = Math.min(
      this.baseDelay * Math.pow(2, this.attempt) + Math.random() * 1000,
      this.maxDelay
    );

    this.attempt++;
    this.emit('reconnecting', { attempt: this.attempt, delay });
    setTimeout(() => this.connect(), delay);
  }

  on(event: string, handler: Function) {
    if (!this.handlers.has(event)) this.handlers.set(event, new Set());
    this.handlers.get(event)!.add(handler);
  }

  private emit(event: string, data?: any) {
    this.handlers.get(event)?.forEach(h => h(data));
  }

  send(data: object) {
    if (this.ws?.readyState === WebSocket.OPEN) {
      this.ws.send(JSON.stringify(data));
    }
  }

  close() { this.ws?.close(1000); }
}
```

---

## Presence — Who Is Online

Pattern: ephemeral presence state with heartbeat expiry.

```typescript
// Supabase Presence (built-in)
const channel = supabase.channel('room-1');

channel
  .on('presence', { event: 'sync' }, () => {
    const state = channel.presenceState();
    // state = { userId1: [{ user_id, online_at, ... }], userId2: [...] }
    updateOnlineUsers(Object.keys(state));
  })
  .subscribe(async (status) => {
    if (status === 'SUBSCRIBED') {
      await channel.track({
        user_id: currentUserId,
        online_at: new Date().toISOString(),
      });
    }
  });
```

---

## Broadcast vs State Sync vs Presence

| Mode | Use Case | Delivery | Persistence |
|------|----------|----------|-------------|
| Broadcast | Ephemeral events (mouse position, typing) | At-most-once | None |
| State sync | Document/entity state | Exactly-once critical | DB |
| Presence | Who is connected | Best-effort | Ephemeral (TTL) |

Choose the correct mode — mixing them creates unnecessary complexity.
