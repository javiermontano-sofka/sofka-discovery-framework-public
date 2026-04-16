---
name: scaffold-angular-app
author: "Javier Montaño (JM Labs)"
description: >
  Generate Angular 18+ project with Signals, standalone components, SSR, testing. Use when user asks to "scaffold an Angular app".
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - Agent
---

# Scaffold Angular App

Generate Angular 19+ project with Signals-first reactivity, standalone components, optional SSR via Angular Universal, and a production-ready testing and CI setup.

## Guiding Principle

> *"Standalone components are the present — NgModules are the past. Signals are the future of Angular reactivity. Write new Angular as if NgModules never existed."*

---

## Procedure

### Step 1 — Elicit Requirements and Classify App Type

1. Ask: Is this an enterprise app with complex state and many feature teams? → Determines monorepo need (Nx workspace vs standard CLI).
2. Ask: Does the app need SSR or SSG for SEO? → Determines Angular Universal / Analog.js setup.
3. Ask: What is the existing Angular version if migrating? → Determines migration complexity.
4. Ask: What state management approach? (Signals for simple-medium, NgRx Signals Store for complex).
5. Ask: Component library preference? (Angular Material, PrimeNG, Tailwind + custom, or no library)?
6. Classify all answers: `[HECHO]` if confirmed, `[SUPUESTO]` if inferred.

### Step 2 — Generate Project with CLI and Schematics

1. Generate base project: `ng new my-app --standalone --routing --style=scss --strict`.
2. Verify: `angular.json` has `schematics.@schematics/angular:component.standalone: true` — enforces standalone as default.
3. Configure TypeScript: ensure `strict: true`, `strictTemplates: true` in `tsconfig.json`. Never lower these.
4. Add Tailwind CSS (if chosen): `ng add @analogjs/tailwind` or manual `tailwind.config.ts` + PostCSS config.
5. Add Angular Material (if chosen): `ng add @angular/material` — choose a theme, enable typography.
6. Configure path aliases in `tsconfig.json`: `"@app/*": ["src/app/*"]`, `"@env/*": ["src/environments/*"]`.

### Step 3 — Architecture: Feature-Based Structure with Signals

1. Generate feature modules as standalone component groups, NOT NgModules.
2. Create `src/app/core/` for singletons: `AuthService`, `HttpInterceptors`, `ErrorHandler`.
3. Create `src/app/shared/` for shared UI components: `ButtonComponent`, `ModalComponent`.
4. Create `src/app/features/` for feature groups: each with its own routing, services, and components.
5. Implement state with Signals: `signal()` for component state, `computed()` for derived state, `effect()` for side effects with explicit `allowSignalWrites`.
6. For complex shared state: use `@ngrx/signals` `signalStore()` — not classic NgRx with actions/reducers.

### Step 4 — Configure HTTP, Auth, and Routing

1. Configure `provideHttpClient(withInterceptors([authInterceptor]))` in `app.config.ts` (not `AppModule`).
2. Write `authInterceptor` as a functional interceptor (not class-based): `(req, next) => { ... }`.
3. Write `provideRouter` with `withPreloading(PreloadAllModules)` or `withViewTransitions()` for animated navigation.
4. Implement route guards as functional guards: `canActivate: [() => inject(AuthService).isAuthenticated()]`.
5. Write lazy-loaded routes using `loadComponent` (not `loadChildren` with modules) for standalone components.
6. Configure `withComponentInputBinding()` in router config — allows route params as `@Input()`.

### Step 5 — Testing, CI/CD, and Build Optimization

1. Configure Karma → **migrate to Vitest** (via `@analogjs/vitest-angular`) or keep Jasmine for enterprise mandate.
2. Write unit tests for: services (mock dependencies with `TestBed.inject`), components (HarnessLoader for Material), pipes.
3. Configure Playwright or Cypress for E2E (Playwright preferred for new projects).
4. Configure build budgets in `angular.json`: `maximumError: 1mb` initial bundle, `anyComponentStyle: 6kb`.
5. Enable esbuild builder: `"builder": "@angular-devkit/build-angular:application"` (replaces Webpack-based builder).
6. Write `.github/workflows/ci.yml`: `ng lint` → `ng test --no-watch` → `ng build --configuration=production`.

---

## Decision Framework

| Decision | Default | Alternative | When to Switch |
|----------|---------|-------------|----------------|
| Component style | Standalone | NgModules | Large legacy codebase migration |
| Reactivity | Signals | RxJS Observables | Complex async streams (HTTP, WebSocket) |
| State management | Signals (`signal()`) | NgRx Signals Store | Cross-feature shared state, time-travel debug |
| HTTP client | `HttpClient` + functional interceptor | `fetch` API | Edge/SSR with minimal runtime |
| Routing | Lazy `loadComponent` | `loadChildren` | NgModule-based feature groups (legacy) |
| Styling | SCSS + Tailwind | Angular Material | No design team; need full component kit |
| Testing | Vitest (via Analog) | Karma + Jasmine | Enterprise mandate or large existing test suite |
| E2E | Playwright | Cypress | Existing Cypress investment |
| Build | esbuild (`application` builder) | Webpack (`browser` builder) | Rare custom Webpack plugins needed |
| SSR | Angular Universal | Analog.js | File-based routing + Vite DX preferred |

---

## Quality Criteria

1. `ng build --configuration=production` exits 0, initial bundle under budget (`maximumError: 1mb`).
2. `ng lint` exits 0 — no `@typescript-eslint/no-explicit-any` violations.
3. `strictTemplates: true` — no template type errors; template expressions are type-checked.
4. All new components are standalone — no `NgModule` declarations in new code.
5. All state accessed in templates uses Signals, not direct property mutation.
6. Route guards use functional guard pattern, not class-based `CanActivate`.
7. All HTTP interceptors are functional interceptors, not class-based.
8. Component unit tests cover: renders correctly, input/output bindings, service interactions.

---

## Anti-Patterns

1. **Creating NgModules for standalone components** — In Angular 17+, NgModules are optional. New components should be standalone. Creating `SharedModule` just to re-export components adds indirection with no benefit.
2. **Using `BehaviorSubject` when a `signal()` suffices** — For synchronous local state, Signals are simpler, more performant (granular change detection), and easier to read. Reserve RxJS for genuinely async streams.
3. **Class-based route guards** — The `CanActivate` interface class pattern is deprecated. Functional guards (`canActivate: [() => inject(Service).check()]`) are simpler, don't require providers, and are the current best practice.
4. **Not enabling `strictTemplates`** — Angular's template type checker catches binding errors at compile time. Disabling it means type errors silently become runtime crashes.
5. **Using `ChangeDetectorRef.detectChanges()` with Signals** — Signals automatically trigger granular change detection. Calling `detectChanges()` manually is a sign of mixing reactivity models. Remove and let Signals drive the view.

---

## When NOT to Use

- **When the project is a simple SPA or landing page** → React (lighter, faster DX) or vanilla JS.
- **When the team has no Angular experience** → React's ecosystem and learning resources are significantly larger.
- **When you need React Native for mobile** → Angular's mobile story requires Ionic or NativeScript (heavier).
- **When time-to-market is critical and team is mixed-framework** → Unify on React/Next.js instead of adding Angular.
