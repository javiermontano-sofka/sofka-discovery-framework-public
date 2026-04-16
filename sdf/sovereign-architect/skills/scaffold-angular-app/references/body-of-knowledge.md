# Body of Knowledge: Scaffold Angular App

## Recommended Project Structure (Angular 19+, Standalone)

```
my-angular-app/
├── .github/
│   └── workflows/
│       └── ci.yml
├── e2e/
│   ├── smoke.spec.ts
│   └── playwright.config.ts
├── src/
│   ├── app/
│   │   ├── core/                     # Singleton services, app-wide concerns
│   │   │   ├── auth/
│   │   │   │   ├── auth.service.ts
│   │   │   │   ├── auth.guard.ts     # Functional guard
│   │   │   │   └── auth.interceptor.ts
│   │   │   ├── error/
│   │   │   │   └── global-error-handler.ts
│   │   │   └── index.ts
│   │   ├── features/
│   │   │   ├── dashboard/
│   │   │   │   ├── dashboard.component.ts    # Standalone
│   │   │   │   ├── dashboard.component.html
│   │   │   │   ├── dashboard.component.scss
│   │   │   │   ├── dashboard.routes.ts       # Lazy routes
│   │   │   │   ├── dashboard.service.ts
│   │   │   │   └── store/
│   │   │   │       └── dashboard.store.ts    # NgRx Signal Store (if needed)
│   │   │   └── auth/
│   │   │       ├── login/
│   │   │       │   ├── login.component.ts
│   │   │       │   ├── login.component.html
│   │   │       │   └── login.component.spec.ts
│   │   │       └── auth.routes.ts
│   │   ├── shared/
│   │   │   ├── components/           # Shared UI primitives
│   │   │   │   ├── button/
│   │   │   │   └── modal/
│   │   │   ├── directives/
│   │   │   └── pipes/
│   │   ├── app.component.ts          # Root standalone component
│   │   ├── app.component.html
│   │   ├── app.config.ts             # provideRouter, provideHttpClient, etc.
│   │   └── app.routes.ts             # Root routes with lazy loadComponent
│   ├── environments/
│   │   ├── environment.ts
│   │   └── environment.production.ts
│   ├── styles/
│   │   ├── _variables.scss
│   │   ├── _typography.scss
│   │   └── globals.scss
│   ├── index.html
│   └── main.ts
├── angular.json
├── package.json
├── tailwind.config.ts
├── tsconfig.json
└── tsconfig.spec.json
```

---

## Core Dependencies (2025-2026)

| Package | Version | Purpose |
|---------|---------|---------|
| @angular/core | ^19.0 | Core framework |
| @angular/common | ^19.0 | CommonModule, HTTP, pipes |
| @angular/forms | ^19.0 | ReactiveFormsModule |
| @angular/router | ^19.0 | Client-side routing |
| @angular/platform-browser | ^19.0 | DOM bootstrapping |
| rxjs | ^7.8 | Async streams (use with HTTP, not state) |
| @ngrx/signals | ^19.0 | Signal Store for complex state |

**Dev dependencies:**

| Package | Version | Purpose |
|---------|---------|---------|
| @angular/cli | ^19.0 | Build, serve, test, scaffold |
| @angular-eslint/eslint-plugin | ^18.0 | Angular-specific lint rules |
| @typescript-eslint/eslint-plugin | ^8.0 | TypeScript lint rules |
| @playwright/test | ^1.45 | E2E testing |
| vitest | ^2.0 | Unit testing (via Analog) |

---

## Configuration Patterns

### `app.config.ts` — Application Configuration (No AppModule)
```typescript
import { ApplicationConfig, provideZoneChangeDetection } from '@angular/core'
import {
  provideRouter,
  withComponentInputBinding,
  withPreloading,
  PreloadAllModules,
  withViewTransitions,
} from '@angular/router'
import { provideHttpClient, withInterceptors } from '@angular/common/http'
import { routes } from './app.routes'
import { authInterceptor } from './core/auth/auth.interceptor'

export const appConfig: ApplicationConfig = {
  providers: [
    provideZoneChangeDetection({ eventCoalescing: true }),
    provideRouter(
      routes,
      withComponentInputBinding(),
      withPreloading(PreloadAllModules),
      withViewTransitions(),
    ),
    provideHttpClient(
      withInterceptors([authInterceptor]),
    ),
  ],
}
```

### `app.routes.ts` — Lazy Standalone Routes
```typescript
import { Routes } from '@angular/router'
import { authGuard } from './core/auth/auth.guard'

export const routes: Routes = [
  {
    path: '',
    redirectTo: 'dashboard',
    pathMatch: 'full',
  },
  {
    path: 'login',
    loadComponent: () =>
      import('./features/auth/login/login.component').then(m => m.LoginComponent),
  },
  {
    path: 'dashboard',
    canActivate: [authGuard],
    loadChildren: () =>
      import('./features/dashboard/dashboard.routes').then(m => m.DASHBOARD_ROUTES),
  },
]
```

### Functional Auth Guard
```typescript
// core/auth/auth.guard.ts
import { inject } from '@angular/core'
import { Router } from '@angular/router'
import { AuthService } from './auth.service'

export const authGuard = () => {
  const auth = inject(AuthService)
  const router = inject(Router)

  if (auth.isAuthenticated()) {
    return true
  }

  return router.createUrlTree(['/login'], {
    queryParams: { returnUrl: router.routerState.snapshot.url },
  })
}
```

### Functional HTTP Interceptor
```typescript
// core/auth/auth.interceptor.ts
import { inject } from '@angular/core'
import { HttpHandlerFn, HttpInterceptorFn, HttpRequest } from '@angular/common/http'
import { AuthService } from './auth.service'

export const authInterceptor: HttpInterceptorFn = (
  req: HttpRequest<unknown>,
  next: HttpHandlerFn
) => {
  const auth = inject(AuthService)
  const token = auth.getToken()

  if (!token) return next(req)

  const authReq = req.clone({
    headers: req.headers.set('Authorization', `Bearer ${token}`),
  })

  return next(authReq)
}
```

### Signals-Based Service (State)
```typescript
// features/dashboard/dashboard.service.ts
import { Injectable, signal, computed, inject } from '@angular/core'
import { HttpClient } from '@angular/common/http'

export interface Metric {
  id: string
  label: string
  value: number
  trend: 'up' | 'down' | 'neutral'
}

@Injectable({ providedIn: 'root' })
export class DashboardService {
  private readonly http = inject(HttpClient)

  private readonly _metrics = signal<Metric[]>([])
  private readonly _loading = signal(false)
  private readonly _error = signal<string | null>(null)

  readonly metrics = this._metrics.asReadonly()
  readonly loading = this._loading.asReadonly()
  readonly error = this._error.asReadonly()
  readonly hasMetrics = computed(() => this._metrics().length > 0)

  loadMetrics(): void {
    this._loading.set(true)
    this._error.set(null)

    this.http.get<Metric[]>('/api/metrics').subscribe({
      next: (metrics) => {
        this._metrics.set(metrics)
        this._loading.set(false)
      },
      error: (err: Error) => {
        this._error.set(err.message)
        this._loading.set(false)
      },
    })
  }
}
```

### Angular 19 Control Flow (Built-in, Replaces *ngIf/*ngFor)

```html
@if (dashService.loading()) {
  <app-skeleton />
} @else if (dashService.error()) {
  <app-error-banner [message]="dashService.error()!" />
} @else {
  @for (metric of dashService.metrics(); track metric.id) {
    <app-metric-card [metric]="metric" />
  } @empty {
    <p>No metrics available</p>
  }
}
```

### NgRx Signal Store (Cross-Feature Shared State)
```typescript
// features/cart/store/cart.store.ts
import { signalStore, withState, withComputed, withMethods } from '@ngrx/signals'
import { computed } from '@angular/core'

interface CartState {
  items: Array<{ id: string; quantity: number; price: number }>
}

export const CartStore = signalStore(
  { providedIn: 'root' },
  withState<CartState>({ items: [] }),
  withComputed(({ items }) => ({
    itemCount: computed(() => items().reduce((sum, i) => sum + i.quantity, 0)),
    total: computed(() => items().reduce((sum, i) => sum + i.price * i.quantity, 0)),
  })),
  withMethods((store) => ({
    addItem(item: { id: string; price: number }): void {
      store.items.update(items => [...items, { ...item, quantity: 1 }])
    },
    removeItem(id: string): void {
      store.items.update(items => items.filter(i => i.id !== id))
    },
  }))
)
```

---

## Build Budget Configuration (`angular.json`)

```json
"budgets": [
  {
    "type": "initial",
    "maximumWarning": "750kb",
    "maximumError": "1mb"
  },
  {
    "type": "anyComponentStyle",
    "maximumWarning": "4kb",
    "maximumError": "6kb"
  }
]
```

---

## tsconfig.json — Strict Angular Setup

```json
{
  "compilerOptions": {
    "strict": true,
    "strictTemplates": true,
    "strictInjectionParameters": true,
    "noUncheckedIndexedAccess": true,
    "target": "ES2022",
    "module": "ES2022",
    "moduleResolution": "Bundler",
    "useDefineForClassFields": false,
    "experimentalDecorators": true,
    "paths": {
      "@app/*": ["src/app/*"],
      "@env/*": ["src/environments/*"]
    }
  }
}
```

---

## GitHub Actions CI

```yaml
name: CI
on: [push, pull_request]

jobs:
  ci:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 20
          cache: npm
      - run: npm ci
      - run: npx ng lint
      - run: npx ng test --no-watch --browsers=ChromeHeadless
      - run: npx ng build --configuration=production
      - name: Install Playwright
        run: npx playwright install --with-deps chromium
      - run: npx playwright test
```
