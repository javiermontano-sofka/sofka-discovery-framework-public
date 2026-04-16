# Sample Output — Scaffold Angular App

**Scenario**: Enterprise dashboard. Angular 19, standalone components, Signals, functional guards, functional interceptors, Angular Material, Playwright E2E.

---

## Generated Key Files

### `src/app/app.config.ts`
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
import { provideAnimationsAsync } from '@angular/platform-browser/animations/async'
import { routes } from './app.routes'
import { authInterceptor } from './core/auth/auth.interceptor'
import { errorInterceptor } from './core/error/error.interceptor'

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
      withInterceptors([authInterceptor, errorInterceptor]),
    ),
    provideAnimationsAsync(),
  ],
}
```

### `src/app/app.routes.ts`
```typescript
import { Routes } from '@angular/router'
import { authGuard } from './core/auth/auth.guard'

export const routes: Routes = [
  { path: '', redirectTo: 'dashboard', pathMatch: 'full' },
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

### `src/app/core/auth/auth.guard.ts`
```typescript
import { inject } from '@angular/core'
import { Router } from '@angular/router'
import { AuthService } from './auth.service'

export const authGuard = () => {
  const auth = inject(AuthService)
  const router = inject(Router)

  return auth.isAuthenticated()
    ? true
    : router.createUrlTree(['/login'], {
        queryParams: { returnUrl: inject(Router).routerState.snapshot.url },
      })
}
```

### `src/app/core/auth/auth.interceptor.ts`
```typescript
import { inject } from '@angular/core'
import { HttpInterceptorFn } from '@angular/common/http'
import { AuthService } from './auth.service'

export const authInterceptor: HttpInterceptorFn = (req, next) => {
  const token = inject(AuthService).getToken()

  if (!token) return next(req)

  return next(
    req.clone({ headers: req.headers.set('Authorization', `Bearer ${token}`) })
  )
}
```

### `src/app/core/auth/auth.service.ts`
```typescript
import { Injectable, inject, signal, computed } from '@angular/core'
import { HttpClient } from '@angular/common/http'
import { Router } from '@angular/router'
import type { User } from './auth.types'

@Injectable({ providedIn: 'root' })
export class AuthService {
  private readonly http = inject(HttpClient)
  private readonly router = inject(Router)

  private readonly _user = signal<User | null>(null)
  private readonly _token = signal<string | null>(
    localStorage.getItem('auth_token')
  )

  readonly user = this._user.asReadonly()
  readonly isAuthenticated = computed(() => this._token() !== null)

  getToken(): string | null {
    return this._token()
  }

  login(email: string, password: string) {
    return this.http.post<{ user: User; token: string }>('/api/auth/login', {
      email,
      password,
    }).subscribe(({ user, token }) => {
      this._user.set(user)
      this._token.set(token)
      localStorage.setItem('auth_token', token)
      void this.router.navigate(['/dashboard'])
    })
  }

  logout(): void {
    this._user.set(null)
    this._token.set(null)
    localStorage.removeItem('auth_token')
    void this.router.navigate(['/login'])
  }
}
```

### `src/app/features/dashboard/dashboard.component.ts`
```typescript
import { Component, OnInit, inject } from '@angular/core'
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner'
import { DashboardService } from './dashboard.service'
import { MetricCardComponent } from './components/metric-card/metric-card.component'

@Component({
  selector: 'app-dashboard',
  standalone: true,
  imports: [MatProgressSpinnerModule, MetricCardComponent],
  templateUrl: './dashboard.component.html',
})
export class DashboardComponent implements OnInit {
  protected readonly dash = inject(DashboardService)

  ngOnInit(): void {
    this.dash.loadMetrics()
  }
}
```

### `src/app/features/dashboard/dashboard.component.html`
```html
<div class="dashboard-container">
  <h1 class="text-2xl font-bold mb-6">Dashboard</h1>

  @if (dash.loading()) {
    <div class="flex justify-center p-12">
      <mat-progress-spinner mode="indeterminate" diameter="48" />
    </div>
  } @else if (dash.error()) {
    <div role="alert" class="error-banner">
      {{ dash.error() }}
    </div>
  } @else {
    <div class="metrics-grid">
      @for (metric of dash.metrics(); track metric.id) {
        <app-metric-card [metric]="metric" />
      } @empty {
        <p class="text-muted">No metrics available</p>
      }
    </div>
  }
</div>
```

### `e2e/auth.spec.ts`
```typescript
import { test, expect } from '@playwright/test'

test('unauthenticated redirect to login', async ({ page }) => {
  await page.goto('/dashboard')
  await expect(page).toHaveURL(/\/login/)
})

test('login and navigate to dashboard', async ({ page }) => {
  await page.goto('/login')
  await page.getByLabel(/email/i).fill('user@example.com')
  await page.getByLabel(/password/i).fill('password123')
  await page.getByRole('button', { name: /sign in/i }).click()
  await expect(page).toHaveURL(/\/dashboard/)
  await expect(page.getByRole('heading', { name: /dashboard/i })).toBeVisible()
})
```

---

## Directory Structure Generated

```
src/app/
├── core/
│   ├── auth/
│   │   ├── auth.guard.ts       # Functional
│   │   ├── auth.interceptor.ts # Functional HttpInterceptorFn
│   │   ├── auth.service.ts     # Signals-based
│   │   └── auth.types.ts
│   └── error/
│       └── error.interceptor.ts
├── features/
│   ├── auth/
│   │   └── login/
│   │       ├── login.component.ts
│   │       └── login.component.html
│   └── dashboard/
│       ├── components/
│       │   └── metric-card/
│       │       └── metric-card.component.ts
│       ├── dashboard.component.ts
│       ├── dashboard.component.html
│       ├── dashboard.routes.ts
│       └── dashboard.service.ts
├── app.component.ts
├── app.config.ts               # provideRouter, provideHttpClient
└── app.routes.ts               # Lazy standalone routes
```
