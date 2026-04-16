---
name: pwa-architecture
author: "Javier Montaño (JM Labs)"
version: "2.0.0"
description: >
  Design and implement Progressive Web App architecture: service worker caching
  strategies, offline patterns, Web Push notifications, install prompt UX,
  background sync, and Workbox configuration for production.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - Agent
tags: [pwa, service-worker, workbox, offline, push-notifications, install-prompt, web-app-manifest]
---

# PWA Architecture

> *"A PWA that's only slightly better than a website isn't worth the complexity — commit fully to offline-first or stick to web-only."*

## TL;DR

Five-step procedure to architect a production PWA: Web App Manifest, service worker
registration, Workbox caching strategy selection, offline UX patterns, push notification
subscription flow, and background sync for resilient writes.

---

## Step 1 — Installability Foundation

### Web App Manifest

```json
// public/manifest.webmanifest
{
  "name": "MyApp — Full Application Name",
  "short_name": "MyApp",
  "description": "Under 80 characters — shown in app stores.",
  "start_url": "/?source=pwa",
  "display": "standalone",
  "display_override": ["window-controls-overlay", "standalone", "minimal-ui"],
  "background_color": "#ffffff",
  "theme_color": "#1a1a2e",
  "orientation": "any",
  "icons": [
    { "src": "/icons/icon-192.png", "sizes": "192x192", "type": "image/png", "purpose": "maskable any" },
    { "src": "/icons/icon-512.png", "sizes": "512x512", "type": "image/png", "purpose": "maskable any" },
    { "src": "/icons/icon.svg", "sizes": "any", "type": "image/svg+xml", "purpose": "any" }
  ],
  "screenshots": [
    { "src": "/screenshots/desktop.png", "sizes": "1280x800", "type": "image/png", "form_factor": "wide" },
    { "src": "/screenshots/mobile.png", "sizes": "390x844", "type": "image/png", "form_factor": "narrow" }
  ],
  "shortcuts": [
    { "name": "New Task", "url": "/tasks/new", "icons": [{ "src": "/icons/new-task.png", "sizes": "96x96" }] }
  ]
}
```

### Install Prompt UX

```typescript
// hooks/useInstallPrompt.ts
type BeforeInstallPromptEvent = Event & {
  prompt: () => Promise<void>;
  userChoice: Promise<{ outcome: 'accepted' | 'dismissed' }>;
};

export function useInstallPrompt() {
  const [prompt, setPrompt] = useState<BeforeInstallPromptEvent | null>(null);
  const [installed, setInstalled] = useState(false);

  useEffect(() => {
    const handler = (e: Event) => { e.preventDefault(); setPrompt(e as BeforeInstallPromptEvent); };
    window.addEventListener('beforeinstallprompt', handler);
    window.addEventListener('appinstalled', () => setInstalled(true));
    return () => window.removeEventListener('beforeinstallprompt', handler);
  }, []);

  const install = async () => {
    if (!prompt) return;
    await prompt.prompt();
    const { outcome } = await prompt.userChoice;
    if (outcome === 'accepted') setInstalled(true);
    setPrompt(null);
    analytics.track('pwa_install_prompt', { outcome });
  };

  return { canInstall: !!prompt && !installed, install, installed };
}
```

---

## Step 2 — Service Worker Caching Strategies

### Workbox Strategy Selection

| Asset Type | Strategy | Rationale |
|-----------|---------|----------|
| App shell (HTML/JS/CSS) | `StaleWhileRevalidate` | Fast startup, background update |
| API GET requests | `NetworkFirst` (fallback cache) | Fresh data preferred, offline fallback |
| Static assets (images, fonts) | `CacheFirst` (long TTL) | Immutable with content hash |
| Dynamic images (user avatars) | `StaleWhileRevalidate` | Speed + freshness balance |
| Non-GET API | Never cache | Mutations must reach server |

### Workbox Configuration (vite-plugin-pwa)

```typescript
// vite.config.ts
import { VitePWA } from 'vite-plugin-pwa';

export default defineConfig({
  plugins: [
    VitePWA({
      registerType: 'prompt',  // 'autoUpdate' for silent, 'prompt' for user control
      workbox: {
        globPatterns: ['**/*.{js,css,html,ico,png,svg,woff2}'],
        runtimeCaching: [
          {
            urlPattern: /^https:\/\/api\.example\.com\/v1\//,
            handler: 'NetworkFirst',
            options: {
              cacheName: 'api-cache',
              networkTimeoutSeconds: 3,
              expiration: { maxEntries: 100, maxAgeSeconds: 5 * 60 },
              cacheableResponse: { statuses: [0, 200] },
            },
          },
          {
            urlPattern: /^https:\/\/fonts\.googleapis\.com\//,
            handler: 'CacheFirst',
            options: {
              cacheName: 'google-fonts',
              expiration: { maxAgeSeconds: 60 * 60 * 24 * 365 },
            },
          },
        ],
      },
    }),
  ],
});
```

---

## Step 3 — Offline UX Patterns

### Offline Fallback Page

```typescript
// Workbox NavigationRoute with offline fallback
import { NavigationRoute, registerRoute } from 'workbox-routing';
import { NetworkOnly } from 'workbox-strategies';

const handler = new NetworkOnly({
  plugins: [{
    handlerDidError: async () => caches.match('/offline') ?? Response.error(),
  }],
});

registerRoute(new NavigationRoute(handler));
```

### Background Sync (Resilient Writes)

```typescript
// Queues failed POST requests and replays when online
import { BackgroundSyncPlugin } from 'workbox-background-sync';
import { NetworkOnly } from 'workbox-strategies';
import { registerRoute } from 'workbox-routing';

const bgSyncPlugin = new BackgroundSyncPlugin('mutation-queue', {
  maxRetentionTime: 24 * 60,  // Retry for 24 hours
});

registerRoute(
  ({ url, request }) => url.pathname.startsWith('/api/') && request.method !== 'GET',
  new NetworkOnly({ plugins: [bgSyncPlugin] }),
  'POST'
);
```

### Update Prompt Pattern

```typescript
// components/UpdatePrompt.tsx
import { useRegisterSW } from 'virtual:pwa-register/react';

export function UpdatePrompt() {
  const { needRefresh: [needRefresh], updateServiceWorker } = useRegisterSW({
    onRegisteredSW(swUrl) {
      // Poll for updates every hour in production
      setInterval(async () => {
        const reg = await navigator.serviceWorker.getRegistration(swUrl);
        await reg?.update();
      }, 60 * 60 * 1000);
    },
  });

  if (!needRefresh) return null;

  return (
    <div role="alert" className="update-banner">
      <p>A new version is available.</p>
      <button onClick={() => updateServiceWorker(true)}>Update now</button>
    </div>
  );
}
```

---

## Step 4 — Web Push Notifications

### Subscription Flow

```typescript
// lib/push.ts
export async function subscribeToPush(userId: string): Promise<void> {
  if (!('PushManager' in window)) return;

  const permission = await Notification.requestPermission();
  if (permission !== 'granted') return;

  const registration = await navigator.serviceWorker.ready;
  const subscription = await registration.pushManager.subscribe({
    userVisibleOnly: true,  // Required — no silent pushes in Chrome
    applicationServerKey: urlBase64ToUint8Array(import.meta.env.VITE_VAPID_PUBLIC_KEY),
  });

  await fetch('/api/push/subscribe', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ userId, subscription }),
  });
}

// In service worker — handle push event
self.addEventListener('push', (event: PushEvent) => {
  const data = event.data?.json();
  event.waitUntil(
    self.registration.showNotification(data.title, {
      body: data.body,
      icon: '/icons/icon-192.png',
      badge: '/icons/badge-72.png',
      data: { url: data.url },
      actions: [
        { action: 'open', title: 'View' },
        { action: 'dismiss', title: 'Dismiss' },
      ],
    })
  );
});
```

---

## Step 5 — Audit & Validation

```bash
# Lighthouse PWA audit
npx lighthouse https://your-app.com \
  --only-categories=pwa \
  --output=html \
  --output-path=./pwa-audit.html

# Verify manifest and service worker registration
# DevTools > Application > Manifest — check for errors
# DevTools > Application > Service Workers — verify "activated"

# Test offline: DevTools > Network > Offline > reload page
```

---

## Quality Criteria

1. **Lighthouse PWA score 100** — All required checks pass: manifest, SW, HTTPS.
2. **Offline fallback functional** — Navigation to cached routes works without network.
3. **Update prompt on new SW** — Users notified and can update without confusion.
4. **Icons include maskable purpose** — Safe zone (80%) works on Android adaptive icons.
5. **`start_url` includes `?source=pwa`** — Install analytics trackable separately.
6. **Push notification permission not requested on page load** — Triggered by explicit user action only.
7. **Background sync covers all mutation API calls** — Writes are queued, not silently dropped.
8. **Cache size bounded** — All runtime caches have `maxEntries` or `maxAgeSeconds` set.

---

## Anti-Patterns

- **Requesting notification permission immediately on page load** — Highest rejection rate; must follow a meaningful user action.
- **Caching POST/PUT/DELETE API calls** — Mutations replayed from cache can cause duplicate operations; only cache GETs.
- **`registerType: 'autoUpdate'` without user communication** — Silent SW swap can break in-flight network requests; always inform users.
- **No cache size limits** — Unconstrained caches consume device storage and can be evicted by the browser; always set `maxEntries`.
- **Serving HTTP in production** — Service workers require HTTPS (except localhost); all PWA features silently fail on HTTP.
- **Not testing on real Android** — iOS Safari has different SW lifecycle; Web Push only works on iOS 16.4+.
- **`display: browser` in manifest** — Defeats installability; use `standalone` or `minimal-ui`.
