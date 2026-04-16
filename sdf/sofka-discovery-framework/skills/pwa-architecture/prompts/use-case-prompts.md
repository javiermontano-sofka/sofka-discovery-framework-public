# Use Case Prompts — PWA Architecture

## Scenario 1: Convert Existing React App to PWA

```
Convert an existing Vite + React application to a PWA with full offline support.

Current state:
- Vite 5 + React 18 SPA
- No service worker
- No manifest
- API calls to /api/* (GET for data, POST for mutations)

Requirements:
- Install prompt with good UX (triggered by button, not on page load)
- App shell cached for offline access
- API GET responses cached with 5-minute TTL
- Offline indicator UI component
- Update prompt when new version available

Deliver:
1. manifest.webmanifest with correct fields and icons spec
2. vite.config.ts with vite-plugin-pwa configuration
3. useInstallPrompt hook
4. UpdatePrompt component
5. OfflineIndicator component
6. Workbox caching strategy map
```

## Scenario 2: Add Web Push to PWA

```
Add Web Push notifications to an existing PWA (Next.js, already installed, HTTPS).

Current state:
- PWA installed with Lighthouse score 90
- Users want notifications for: new messages, order updates, price drops

Infrastructure:
- Node.js/Express API server
- PostgreSQL database
- Redis for caching

Deliver:
1. VAPID key generation instructions
2. Client-side push subscription code with permission UX
3. Server-side subscription storage (DB schema + API endpoint)
4. Server-side push sending with web-push library
5. Service worker push event handler
6. notificationclick handler with deep linking
7. Subscription management UI (enable/disable per notification type)
```

## Scenario 3: Audit PWA Lighthouse Score

```
The PWA currently scores 67 in Lighthouse PWA audit. Identify all failing checks.

Known issues:
- manifest.webmanifest exists but only has name and start_url
- Service worker registered but has no fetch handler (empty SW)
- App served on HTTP in staging (HTTPS in production only)
- Icons: only a single 32x32 favicon.ico

Identify all failing Lighthouse PWA checks and provide specific fixes for each.

Deliver:
1. Complete list of failing checks with explanation
2. Fixed manifest.webmanifest
3. Service worker with Workbox NetworkFirst for navigation
4. Icon generation spec (which sizes, which purposes)
5. Expected score after fixes
```

## Scenario 4: Offline-First Data Sync

```
Design an offline-first architecture for a field inspection app.
Inspectors work in locations with no internet. They must be able to:
- Create inspections offline
- Attach photos offline
- Submit when connectivity returns
- See previously loaded inspection templates offline

Deliver:
1. Data architecture: what goes in IndexedDB vs Cache API vs service worker cache
2. Background Sync implementation for inspection submissions
3. Optimistic local state pattern
4. Conflict resolution strategy (offline edits vs server updates)
5. Photo handling (IndexedDB Blob storage)
6. Sync status UI indicators
```

## Scenario 5: PWA on iOS — Limitations and Workarounds

```
Our PWA works well on Android Chrome but has issues on iOS Safari.
Users report: push notifications not working, install prompt missing,
service worker state inconsistencies.

Explain:
1. iOS Safari PWA limitations vs Chrome Android
2. Web Push on iOS requirements (iOS 16.4+, must be installed)
3. How to detect iOS and show custom install instructions
4. Service worker lifecycle differences on iOS
5. localStorage vs IndexedDB persistence behavior on iOS
6. How to test PWA on iOS without a real device

Deliver:
1. iOS vs Android PWA capability matrix
2. iOS-specific install instruction component
3. Platform detection code
4. iOS service worker gotchas and mitigations
```
