# State of the Art: PWA Architecture (2025-2026)

## Current Landscape

PWA capabilities have expanded significantly with iOS 16.4+ adding Web Push support
and iOS 17 adding Home Screen PWA improvements. The gap between PWA and native apps
has narrowed substantially.

## Key 2025-2026 Developments

### iOS 16.4+ Web Push (2023, Widespread 2024)

Safari on iOS 16.4+ supports Web Push Notifications for PWAs installed to the Home Screen:
- Requires the PWA to be installed (Add to Home Screen).
- Uses APNs as the push service (different from Chrome/Firefox which use FCM).
- VAPID keys work across all platforms.
- Push permission request must follow user gesture.
- Limited to PWAs — not available for websites in Safari browser.

### Window Controls Overlay (WCO)

WCO allows PWAs to extend content into the title bar area on desktop:
```json
{
  "display_override": ["window-controls-overlay", "standalone"]
}
```
```css
/* CSS environment variables for WCO */
:root {
  --titlebar-area-height: env(titlebar-area-height, 0px);
}
.titlebar {
  height: var(--titlebar-area-height);
  -webkit-app-region: drag;
}
```

### File System Access API

PWAs can now read/write local files (with permission):
```typescript
const fileHandle = await window.showOpenFilePicker();
const file = await fileHandle.getFile();
const contents = await file.text();
```
Enables desktop-class experiences: text editors, image editors, IDEs as PWAs.

### vite-plugin-pwa Maturity

`vite-plugin-pwa` has become the standard for Vite-based PWAs:
- Automatic service worker generation via Workbox.
- `registerType: 'prompt'` | `'autoUpdate'` strategies.
- `injectManifest` mode for custom service workers.
- Works with Vite, Astro, SvelteKit, Nuxt, Remix.

### App Badging API

```typescript
// Set a badge count (e.g., unread notifications)
await navigator.setAppBadge(5);

// Clear badge
await navigator.clearAppBadge();
```
Supported on iOS 16.4+, Chrome, Edge. Shows count on app icon.

## Best Current Practices (2025)

1. **`registerType: 'prompt'`** — Always inform users of updates; don't silently reload.
2. **Maskable icons** — Required for correct display on Android adaptive icon systems.
3. **`display_override: ['window-controls-overlay', 'standalone']`** — Enables WCO on supporting platforms while falling back to standalone.
4. **Background Sync via Workbox** — Don't implement manually; Workbox handles the retry logic.
5. **VAPID key rotation plan** — Web push subscriptions expire when VAPID keys change; plan for graceful re-subscription.
6. **App Badging** — Use for notification counts; highly effective retention mechanic.

## Browser Support Matrix (2025)

| Feature | Chrome | Firefox | Safari iOS | Safari macOS |
|---------|--------|---------|-----------|-------------|
| Install prompt | Yes | No | No (manual) | Yes |
| Service Workers | Yes | Yes | Yes (16+) | Yes |
| Web Push | Yes | Yes | Yes (16.4+) | Yes (14+) |
| Background Sync | Yes | No | No | No |
| Periodic Sync | Chrome | No | No | No |
| File System Access | Yes | No | No | No |
| App Badging | Yes | No | Yes (16.4+) | Yes |

## Performance Benchmarks (2025)

- Service worker install time (Workbox precache, 50 files): 0.5-2s
- Cached page load (SW cache hit): 50-200ms
- Network-first API response: 100-500ms (network dependent)
- Push notification delivery (Chrome/FCM): < 1s typically
- Background sync replay (on reconnect): 1-5s
