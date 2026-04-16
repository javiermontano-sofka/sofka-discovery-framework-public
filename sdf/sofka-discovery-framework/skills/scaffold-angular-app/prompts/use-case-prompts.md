# Use-Case Prompts — Scaffold Angular App

## Scenario 1: Enterprise Dashboard (Greenfield, Standalone + Signals)

**Context**: Enterprise financial reporting dashboard. Team of 8 Angular developers (Angular 15 experience). Moving to Angular 19. Needs role-based access, complex data tables, charts. Deploy to on-premises Docker.

**Prompt**:
```
Scaffold an Angular 19 enterprise dashboard app with:
- Standalone components only (no NgModules)
- Signals-based state management for all local and shared state
- NgRx Signals Store for cross-feature cart/notification state
- Lazy-loaded feature routes with loadComponent (not loadChildren with modules)
- Functional auth guard protecting /dashboard, /reports, /admin
- Functional HTTP interceptors: auth token + error handling (401 → logout, 500 → toast)
- Angular Material 19 with custom M3 theme
- SCSS with design tokens via CSS custom properties
- Karma → Vitest migration for unit tests
- Playwright for E2E
- GitHub Actions CI with lint + test + build

Features: auth (JWT), data tables (AG Grid), charts (ECharts), CSV export.

Deliver: full scaffold, app.config.ts, routing, Signals-based UserService, auth interceptor, and a DashboardComponent example.
```

---

## Scenario 2: Migration from Angular 14 NgModule to Angular 19 Standalone

**Context**: Angular 14 app with 45 components, all in NgModules (SharedModule, CoreModule, 8 FeatureModules). Class-based guards and interceptors. `*ngIf` / `*ngFor` throughout. Team of 5, nervous about breaking things.

**Prompt**:
```
Plan and execute the migration of an Angular 14 NgModule app to Angular 19 standalone components.

Current state:
- 45 components across SharedModule, CoreModule, 8 feature NgModules
- Class-based CanActivate guards in core/guards/
- Class-based HttpInterceptor in core/interceptors/
- *ngIf and *ngFor in all 38 templates
- BehaviorSubject state in 6 services

Migration requirements:
- Incremental (one module at a time, not a big bang rewrite)
- ng serve must work throughout migration
- All 120 unit tests must pass at each step

Deliver:
1. Migration order (which module to convert first and why)
2. Pattern for converting each NgModule to standalone imports
3. Class guard → functional guard migration for each guard
4. BehaviorSubject → signal() migration for each service
5. Template migration script or grep patterns to find *ngIf/*ngFor
6. Validation checklist per module
```

---

## Scenario 3: Real-Time Dashboard with WebSocket + Signals

**Context**: Operations monitoring dashboard. Live metrics updating every 2 seconds via WebSocket. 20+ metric widgets. Each widget is independent. Team of 3, greenfield.

**Prompt**:
```
Scaffold an Angular 19 real-time monitoring dashboard with:
- Standalone components with zoneless change detection (provideExperimentalZonelessChangeDetection)
- WebSocket service using RxJS WebSocketSubject (correct use of RxJS for async streams)
- Bridge: toSignal(websocketService.metric$) to expose data as Signals to components
- Each MetricWidget component reads its own signal slice
- @defer (on viewport) for widgets below the fold
- OnPush change detection on all components (compatible with signals)
- Reconnection logic: RxJS retry + exponential backoff in WebSocket service

Generate:
1. WebSocketService with reconnection
2. MetricWidget component using @defer
3. DashboardPage with @for loop over widgets
4. Unit test for WebSocket reconnection logic
```

---

## Scenario 4: Angular SSR with Angular Universal

**Context**: Marketing site + authenticated portal. Public marketing pages need SEO (SSR). Dashboard is SPA (no SSR needed). Team has not used Angular Universal before.

**Prompt**:
```
Scaffold an Angular 19 app with selective SSR:
- Angular Universal (SSR) for public routes: /, /pricing, /about, /blog/**
- SPA mode for protected routes: /dashboard/**, /settings/**
- Proper isPlatformBrowser guards for localStorage, window usage
- Meta tags via Angular's Meta and Title services for SEO
- Transfer state for: preventing API calls double-firing (server then client)
- Build output: separate server bundle (server.ts) and client bundle
- Express server for SSR with proper headers

Generate:
1. app.config.ts vs app.config.server.ts difference
2. A BlogPost page component with dynamic meta tags (generateStaticParams equivalent)
3. A safe localStorage wrapper that checks isPlatformBrowser
4. Dockerfile for SSR Express server
```

---

## Scenario 5: Angular + Tailwind Design System

**Context**: Product team building a component library for internal Angular applications. No Angular Material. Using Tailwind CSS. Must produce documented components with stories (Storybook).

**Prompt**:
```
Scaffold an Angular 19 component library with Tailwind CSS:
- ng-packagr for library packaging (not an app)
- Tailwind CSS with custom design tokens extending the base config
- Components: Button (variants: primary/secondary/danger, sizes: sm/md/lg, loading state), Input, Modal, Badge
- Each component: standalone, uses input() signal API for props, output() for events
- Storybook 8 with Angular CSF3 stories
- Vitest unit tests with @angular/testing harnesses
- a11y tests using @axe-core/playwright on Storybook stories
- NPM publishing via GitHub Actions on tag

Deliver: ng-packagr config, Button component with all variants, Button.stories.ts, Button.spec.ts.
```
