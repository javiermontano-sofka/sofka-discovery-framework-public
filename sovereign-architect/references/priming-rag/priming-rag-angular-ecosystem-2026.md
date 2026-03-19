# Priming-RAG: Angular Ecosystem 2026
> Sovereign Architect — Angular ecosystem knowledge for RAG consumption
> Generated: 2026-03-18 | Version: v1.0

---

## Executive Summary
- Angular 18+ with Signals as primary reactivity model [HECHO]
- Standalone components are the default (NgModules optional) [HECHO]
- SSR with full hydration is production-ready [HECHO]
- Zoneless change detection eliminates zone.js overhead [HECHO]
- Nx is the dominant monorepo tool for Angular enterprise [HECHO]

## Key Patterns

### Signals
- `signal()` for writable state, `computed()` for derived [HECHO]
- `effect()` for side effects (replaces many RxJS subscriptions) [HECHO]
- `input()` and `output()` as signal-based component I/O [HECHO]
- `toSignal()` / `toObservable()` for RxJS interop [HECHO]

### Standalone Components
- `@Component({ standalone: true, imports: [...] })` [HECHO]
- No NgModule required — components self-declare dependencies [HECHO]
- Lazy loading via `loadComponent` in route config [HECHO]

### SSR & Hydration
- `provideClientHydration()` enables incremental hydration [HECHO]
- Event replay captures user interactions during hydration [HECHO]
- `@defer` blocks for lazy-loaded template sections [HECHO]

## Anti-Patterns
- Mixing Signals and RxJS without clear boundary [HECHO]
- Using NgModules for new code when standalone suffices [HECHO]
- Not leveraging @defer for below-fold content [HECHO]

## Query Hooks
- "Signals vs RxJS?" → Signals for component state, RxJS for complex async streams
- "NgModules still needed?" → Only for legacy code, standalone is the default
