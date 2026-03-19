# Use-Case Prompts — Scaffold React App

## Scenario 1: SaaS Dashboard for a Fintech Startup

**Context**: 3-person frontend team, all with TypeScript experience. Backend is a Node.js REST API on Railway. Needs dark mode, data tables, charts. Will deploy to Vercel. No existing codebase.

**Prompt**:
```
Scaffold a React app for a fintech SaaS dashboard. Requirements:
- Vite 5 + React 19 + TypeScript strict
- TanStack Query for API calls (base URL: VITE_API_BASE_URL)
- Zustand for UI state (sidebar collapse, theme preference)
- React Router v7 with lazy-loaded routes: /dashboard, /transactions, /analytics, /settings
- Tailwind CSS v4 + shadcn/ui (use neutral base, dark mode class strategy)
- Recharts for line/bar charts in analytics
- React Hook Form + Zod for all forms
- Vitest + RTL + MSW + Playwright
- GitHub Actions CI

The app will have: auth (JWT in httpOnly cookies via BFF), protected routes, and a real-time notifications panel using WebSocket.

Generate the full scaffold with feature-first folder structure.
```

---

## Scenario 2: Internal Admin Tool Migration from CRA

**Context**: Legacy Create React App project, 8-person team, React 17, no TypeScript. Migrating to Vite + TypeScript over 6 sprints. Team has mixed TypeScript experience. Cannot break existing functionality during migration.

**Prompt**:
```
I have an existing Create React App project (React 17, JavaScript only) that I need to migrate to Vite + TypeScript. Team is 8 developers with varying TS experience.

Migration strategy requirements:
- Incremental TypeScript adoption (start with allowJs: true, migrate file by file)
- Keep existing Redux store (do NOT migrate to Zustand yet — too risky mid-project)
- Replace React Router v5 with v7 (document breaking changes)
- Set up Vitest as drop-in Jest replacement with minimal test rewrites
- Provide codemods or scripts for the most common migration patterns

Generate:
1. New tsconfig.json with allowJs: true and strict: false initially
2. New vite.config.ts with CommonJS interop for legacy imports
3. Migration checklist (file by file priority order)
4. ADR documenting the migration decisions
```

---

## Scenario 3: E-commerce Product Page (Performance-Critical SPA)

**Context**: High-traffic e-commerce product page. Core Web Vitals are a KPI. LCP target <2.5s, INP <200ms. Will be embedded as a micro-frontend inside a larger portal. Team size: 2 developers.

**Prompt**:
```
Scaffold a performance-critical React SPA for an e-commerce product page.
Constraints:
- Bundle size budget: 120KB gzipped initial load
- LCP <2.5s on mobile 3G (Lighthouse)
- No SSR available — pure SPA served from CDN
- Will be loaded as a micro-frontend via Module Federation

Requirements:
- Vite with manual chunk splitting (vendor, ui, feature chunks)
- React.lazy + Suspense for route-level code splitting
- Image component with WebP + AVIF format selection + lazy loading
- TanStack Query with staleTime: Infinity for product data (rarely changes)
- Tailwind with aggressive content paths
- Bundle analyzer output (rollup-plugin-visualizer)

Generate vite.config.ts with chunk strategy, performance-focused tsconfig, and a sample product card component that scores well on Web Vitals.
```

---

## Scenario 4: Real-Time Collaboration App (WebSocket + Optimistic UI)

**Context**: A document collaboration tool (think Notion-lite). Multiple users editing simultaneously. Needs optimistic updates, conflict resolution UI, and offline detection. 5-person team, senior engineers, greenfield project.

**Prompt**:
```
Scaffold a React app for real-time document collaboration.
Technical requirements:
- Vite 5 + React 19 + TypeScript strict + TanStack Router (type-safe routes matter here)
- Zustand for: presence state (who's online), local document state, undo/redo stack
- TanStack Query for: document metadata, user list, version history
- WebSocket integration: custom useWebSocket hook with reconnection logic + exponential backoff
- Optimistic updates pattern: mutations update Zustand immediately, rollback on WS error
- Offline detection: useNetworkStatus hook with banner component

Generate:
1. Full scaffold with the above stack
2. src/hooks/useWebSocket.ts with reconnection logic
3. src/features/document/stores/documentStore.ts with undo/redo
4. src/features/presence/hooks/usePresence.ts
5. Unit tests for the WebSocket hook using vi.useFakeTimers for backoff
```

---

## Scenario 5: Component Library with Storybook

**Context**: Platform team building a shared React component library for 5 product teams. Needs Storybook, automated visual regression, published to private NPM registry. Not an app — a library package.

**Prompt**:
```
Scaffold a React component library (not an app) with:
- Vite in library mode (not app mode) — builds to ESM + CJS
- TypeScript with declaration file generation (emitDeclarationOnly)
- Tailwind CSS with a design system config — exported tokens as CSS variables
- Storybook 8 for development and documentation
- Vitest for component unit tests
- Chromatic for visual regression testing on PRs
- Automated publish to @myorg/ui via GitHub Actions on version tag

Generate:
1. vite.config.ts in lib mode with proper externals (react, react-dom NOT bundled)
2. tsconfig.json for declaration file output
3. package.json with exports map (main, module, types)
4. A sample Button component with: variants, size, loading state, accessible roles
5. Button.stories.tsx with all variants documented
6. Button.test.tsx with a11y tests using jest-axe
7. GitHub Actions publish workflow
```
