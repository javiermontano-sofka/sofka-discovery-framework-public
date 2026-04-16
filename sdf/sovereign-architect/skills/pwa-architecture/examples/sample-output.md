# Sample Output: Vite React App → PWA Conversion

## PWA Readiness Assessment

- **Manifest**: Missing [HECHO — no manifest.webmanifest found]
- **Service Worker**: Missing [HECHO — no SW registration in main.tsx]
- **HTTPS**: Yes (production) [HECHO — from .env.production]
- **Install criteria**: NOT MET — manifest and SW required

---

## Generated `public/manifest.webmanifest`

```json
{
  "name": "MyApp — Task Manager",
  "short_name": "MyApp",
  "description": "Manage your tasks and projects, even offline.",
  "start_url": "/?source=pwa",
  "display": "standalone",
  "display_override": ["window-controls-overlay", "standalone", "minimal-ui"],
  "background_color": "#ffffff",
  "theme_color": "#1a1a2e",
  "orientation": "any",
  "lang": "en",
  "icons": [
    {
      "src": "/icons/icon-192-maskable.png",
      "sizes": "192x192",
      "type": "image/png",
      "purpose": "maskable"
    },
    {
      "src": "/icons/icon-512-maskable.png",
      "sizes": "512x512",
      "type": "image/png",
      "purpose": "maskable"
    },
    {
      "src": "/icons/icon-192.png",
      "sizes": "192x192",
      "type": "image/png",
      "purpose": "any"
    },
    {
      "src": "/icons/icon-512.png",
      "sizes": "512x512",
      "type": "image/png",
      "purpose": "any"
    }
  ],
  "screenshots": [
    {
      "src": "/screenshots/desktop.png",
      "sizes": "1280x800",
      "form_factor": "wide"
    },
    {
      "src": "/screenshots/mobile.png",
      "sizes": "390x844",
      "form_factor": "narrow"
    }
  ]
}
```

---

## Generated `vite.config.ts` (Workbox Configuration)

```typescript
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import { VitePWA } from 'vite-plugin-pwa';

export default defineConfig({
  plugins: [
    react(),
    VitePWA({
      registerType: 'prompt',   // Show update prompt, don't auto-reload
      injectRegister: 'auto',
      manifest: false,          // Use our own manifest.webmanifest
      workbox: {
        globPatterns: ['**/*.{js,css,html,ico,png,svg,woff2}'],
        navigateFallback: '/index.html',
        navigateFallbackDenylist: [/^\/api\//],
        runtimeCaching: [
          {
            urlPattern: /^https:\/\/api\.myapp\.com\/v1\//,
            handler: 'NetworkFirst',
            options: {
              cacheName: 'api-cache',
              networkTimeoutSeconds: 3,
              expiration: {
                maxEntries: 200,
                maxAgeSeconds: 5 * 60,  // 5 minutes
              },
              cacheableResponse: { statuses: [0, 200] },
            },
          },
          {
            urlPattern: /^https:\/\/avatars\.myapp\.com\//,
            handler: 'StaleWhileRevalidate',
            options: {
              cacheName: 'avatars',
              expiration: {
                maxEntries: 100,
                maxAgeSeconds: 60 * 60 * 24 * 30,  // 30 days
              },
            },
          },
        ],
      },
    }),
  ],
});
```

---

## Caching Strategy Map

| URL Pattern | Strategy | TTL | Rationale |
|-------------|---------|-----|----------|
| App shell (HTML/JS/CSS) | Precache + CacheFirst | Immutable (hash) | Fast startup |
| `/api/v1/*` GET | NetworkFirst | 5 min | Fresh data, offline fallback |
| Avatars | StaleWhileRevalidate | 30 days | Speed + freshness balance |
| Navigation (SPA) | NetworkFirst + `/index.html` fallback | — | SPA routing |
| API POST/PUT/DELETE | NetworkOnly + BackgroundSync | — | Mutations must hit server |

---

## Generated `src/hooks/useInstallPrompt.ts`

```typescript
import { useEffect, useState, useCallback } from 'react';

type BeforeInstallPromptEvent = Event & {
  prompt(): Promise<void>;
  userChoice: Promise<{ outcome: 'accepted' | 'dismissed' }>;
};

export function useInstallPrompt() {
  const [prompt, setPrompt] = useState<BeforeInstallPromptEvent | null>(null);
  const [installed, setInstalled] = useState(
    window.matchMedia('(display-mode: standalone)').matches
  );

  useEffect(() => {
    const handlePrompt = (e: Event) => {
      e.preventDefault();
      setPrompt(e as BeforeInstallPromptEvent);
    };
    const handleInstalled = () => {
      setInstalled(true);
      setPrompt(null);
    };

    window.addEventListener('beforeinstallprompt', handlePrompt);
    window.addEventListener('appinstalled', handleInstalled);
    return () => {
      window.removeEventListener('beforeinstallprompt', handlePrompt);
      window.removeEventListener('appinstalled', handleInstalled);
    };
  }, []);

  const install = useCallback(async () => {
    if (!prompt) return 'not-available';
    await prompt.prompt();
    const { outcome } = await prompt.userChoice;
    setPrompt(null);
    return outcome;
  }, [prompt]);

  return {
    canInstall: !!prompt && !installed,
    install,
    installed,
  };
}
```

---

## Generated `src/components/UpdatePrompt.tsx`

```typescript
import { useRegisterSW } from 'virtual:pwa-register/react';

export function UpdatePrompt() {
  const {
    needRefresh: [needRefresh, setNeedRefresh],
    updateServiceWorker,
  } = useRegisterSW({
    onRegisteredSW(swUrl) {
      setInterval(async () => {
        const reg = await navigator.serviceWorker.getRegistration(swUrl);
        await reg?.update();
      }, 60 * 60 * 1000); // Hourly check
    },
  });

  if (!needRefresh) return null;

  return (
    <div
      role="alert"
      className="fixed bottom-4 left-4 right-4 bg-blue-600 text-white p-4 rounded-lg
                 flex items-center justify-between shadow-lg z-50"
    >
      <p className="text-sm font-medium">A new version is available.</p>
      <div className="flex gap-2 ml-4">
        <button
          onClick={() => updateServiceWorker(true)}
          className="bg-white text-blue-600 px-3 py-1 rounded text-sm font-medium"
        >
          Update
        </button>
        <button
          onClick={() => setNeedRefresh(false)}
          className="text-white/80 px-2 py-1 text-sm"
        >
          Later
        </button>
      </div>
    </div>
  );
}
```

---

## Quality Gate Checklist

- [x] Manifest has `name`, `short_name`, `start_url`, `display: standalone`
- [x] Icons: 192px and 512px with both `maskable` and `any` purpose
- [x] `start_url` includes `?source=pwa` for analytics
- [x] Workbox configured: app shell precached, API NetworkFirst
- [x] `registerType: 'prompt'` — user informed of updates
- [x] Navigation fallback for SPA routing
- [ ] Offline fallback page at `/offline` (implement separately)
- [ ] Icon files generated with correct safe zone for maskable (use maskable.app)
- [ ] Lighthouse PWA audit: run after deployment

---

## Next Steps

1. Generate icon files: use pwabuilder.com or sharp to create all required sizes.
2. Verify maskable icons at [maskable.app](https://maskable.app).
3. Run `npx lighthouse https://myapp.com --only-categories=pwa`.
4. Add Background Sync for form submissions if offline mutations needed.
5. Implement push notifications if notification feature is in roadmap.
