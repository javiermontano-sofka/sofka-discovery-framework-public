# Body of Knowledge: PWA Architecture

## Core Concepts

### Service Worker Lifecycle

```
Registration → Installation → Activation → Idle ↔ Fetch/Push

Install:  precache() — downloads and caches the app shell
Activate: clients.claim() — takes control of existing pages
          deleteOldCaches() — removes stale caches
Fetch:    intercepts network requests — applies cache strategy
Push:     receives server push, calls showNotification()
Sync:     background sync replays queued requests
```

The most important lifecycle subtlety: a new SW **waits** until all pages
using the old SW are closed before activating. This is why `skipWaiting()` +
`clients.claim()` is used for immediate update takeover, but requires careful
handling of in-flight requests.

### Caching Strategy Deep Dive

**Cache First** (Stale While Always Fresh):
```
Cache hit? → Return from cache (fast)
            → Fetch in background, update cache
Cache miss? → Fetch from network, cache response, return
```
Best for: CSS, JS bundles with content hashes, images, fonts.
Risk: Stale content shown until next visit.

**Network First** (Fresh When Possible):
```
Try network (with timeout) → Cache on success, return
Network timeout/offline? → Return from cache
```
Best for: API data, HTML pages.
Risk: Slower (must wait for network timeout).

**Stale While Revalidate**:
```
Cache hit? → Return immediately
            → Fetch in background, update cache
Cache miss? → Fetch from network, cache, return
```
Best for: User avatars, non-critical API data.
Risk: User may see stale data for one visit.

### Web Push Architecture

```
Browser ←→ Push Service (Browser Vendor: FCM for Chrome, APNs for Safari)
              ↑
         App Server (generates push message with VAPID keys)
```

VAPID (Voluntary Application Server Identification) prevents push spam:
```typescript
// Generate keys ONCE and store in secrets
import webpush from 'web-push';
const vapidKeys = webpush.generateVAPIDKeys();
// { publicKey: '...', privateKey: '...' }

// Send push from server
webpush.setVapidDetails('mailto:admin@example.com', PUBLIC_KEY, PRIVATE_KEY);
await webpush.sendNotification(subscription, JSON.stringify({
  title: 'New message',
  body: 'You have a new message from Alice',
  icon: '/icons/icon-192.png',
  url: '/messages/123',
}));
```

### Install Criteria (Installability)

Chrome's install criteria (as of 2024):
1. Served over HTTPS (or localhost).
2. `manifest.webmanifest` with required fields: `name`, `short_name`, `start_url`,
   `display` (not `browser`), `icons` (192px and 512px PNG).
3. Service worker registered with fetch handler.
4. Not already installed.
5. User interaction signal (Chrome 116+: browser decides timing).

Safari iOS (16.4+): Add to Home Screen manually; no install prompt API.
Safari macOS (14+): PWA install via browser menu.

### Background Sync API

```javascript
// Register sync tag when offline mutation queued
self.registration.sync.register('post-form-data');

// In service worker — triggered when online
self.addEventListener('sync', (event) => {
  if (event.tag === 'post-form-data') {
    event.waitUntil(flushMutationQueue());
  }
});

async function flushMutationQueue() {
  const queue = await db.getAll('mutation-queue');
  for (const mutation of queue) {
    const response = await fetch(mutation.url, {
      method: mutation.method,
      body: mutation.body,
      headers: mutation.headers,
    });
    if (response.ok) {
      await db.delete('mutation-queue', mutation.id);
    }
  }
}
```

### Offline Storage Options

| Storage | Size Limit | Persistence | Use Case |
|---------|-----------|------------|---------|
| Cache API | Varies (GBs) | Until cleared | Response cache (SW) |
| IndexedDB | Varies (GBs) | Until cleared | Structured data, queue |
| localStorage | 5-10MB | Until cleared | Small config data |
| sessionStorage | 5-10MB | Session only | Temporary state |

For PWA offline data: **IndexedDB** (with idb library for Promise API).

### Maskable Icons

Android adaptive icons have a "safe zone" — the inner 80% of the icon.
All content must be within the safe zone to avoid being clipped by the OS.

```json
// manifest.webmanifest
{
  "icons": [
    {
      "src": "/icons/icon-maskable.png",
      "sizes": "512x512",
      "purpose": "maskable"   // OS can mask/clip edges
    },
    {
      "src": "/icons/icon.png",
      "sizes": "512x512",
      "purpose": "any"        // Used where no masking applied
    }
  ]
}
```

Use Maskable.app to verify safe zone compliance.

## Common Patterns

### Periodic Background Sync

```javascript
// Register periodic background sync (requires user permission)
const registration = await navigator.serviceWorker.ready;
await registration.periodicSync.register('sync-news', {
  minInterval: 24 * 60 * 60 * 1000, // Daily minimum
});

// In service worker
self.addEventListener('periodicsync', (event) => {
  if (event.tag === 'sync-news') {
    event.waitUntil(updateNewsCache());
  }
});
```

### Share Target (Receiving Shared Content)

```json
// manifest.webmanifest
{
  "share_target": {
    "action": "/share-target",
    "method": "POST",
    "enctype": "multipart/form-data",
    "params": {
      "title": "title",
      "text": "text",
      "url": "url",
      "files": [{ "name": "image", "accept": ["image/*"] }]
    }
  }
}
```

## References

- [web.dev PWA](https://web.dev/progressive-web-apps/)
- [Workbox Documentation](https://developer.chrome.com/docs/workbox/)
- [MDN Service Worker API](https://developer.mozilla.org/en-US/docs/Web/API/Service_Worker_API)
- [PWA Builder](https://www.pwabuilder.com/)
- [Maskable.app](https://maskable.app/)
