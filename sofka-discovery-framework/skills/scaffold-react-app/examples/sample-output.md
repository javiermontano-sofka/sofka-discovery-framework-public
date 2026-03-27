# Sample Output — Scaffold React App

**Scenario**: SaaS analytics dashboard. 3-person team. Vite + React 19 + TypeScript strict + Zustand + TanStack Query + Tailwind v4 + shadcn/ui + Vitest + Playwright.

---

## Generated Directory Structure

```
analytics-dashboard/
├── .github/
│   └── workflows/
│       └── ci.yml
├── .husky/
│   └── pre-commit                    # lint-staged
├── docs/
│   └── ADR-001-stack-decisions.md
├── e2e/
│   ├── smoke.spec.ts
│   └── playwright.config.ts
├── public/
│   └── favicon.svg
├── src/
│   ├── app/
│   │   ├── App.tsx
│   │   ├── providers.tsx
│   │   └── router.tsx
│   ├── components/
│   │   └── ui/                       # shadcn/ui primitives
│   │       ├── button.tsx
│   │       ├── card.tsx
│   │       └── input.tsx
│   ├── features/
│   │   ├── auth/
│   │   │   ├── api/
│   │   │   │   └── useAuth.ts
│   │   │   ├── components/
│   │   │   │   └── LoginForm.tsx
│   │   │   ├── stores/
│   │   │   │   └── authStore.ts
│   │   │   ├── types.ts
│   │   │   └── index.ts
│   │   └── analytics/
│   │       ├── api/
│   │       │   └── useMetrics.ts
│   │       ├── components/
│   │       │   └── MetricsChart.tsx
│   │       ├── types.ts
│   │       └── index.ts
│   ├── hooks/
│   │   └── useNetworkStatus.ts
│   ├── lib/
│   │   ├── axios.ts
│   │   └── queryClient.ts
│   ├── test/
│   │   ├── setup.ts
│   │   ├── server.ts
│   │   ├── handlers.ts
│   │   └── render-utils.tsx
│   ├── types/
│   │   └── api.d.ts
│   ├── env.ts
│   └── main.tsx
├── .env.example
├── .gitignore
├── Dockerfile
├── index.html
├── package.json
├── tailwind.config.ts
├── tsconfig.json
├── tsconfig.node.json
└── vite.config.ts
```

---

## Key Generated Files

### `src/env.ts`
```typescript
import { z } from 'zod'

const envSchema = z.object({
  VITE_API_BASE_URL: z.string().url(),
  VITE_APP_ENV: z.enum(['development', 'staging', 'production']),
  VITE_ENABLE_ANALYTICS: z.coerce.boolean().default(false),
})

export const env = envSchema.parse(import.meta.env)
```

### `src/app/providers.tsx`
```typescript
import { QueryClientProvider } from '@tanstack/react-query'
import { ReactQueryDevtools } from '@tanstack/react-query-devtools'
import type { PropsWithChildren } from 'react'
import { queryClient } from '@/lib/queryClient'
import { env } from '@/env'

export function Providers({ children }: PropsWithChildren) {
  return (
    <QueryClientProvider client={queryClient}>
      {children}
      {env.VITE_APP_ENV === 'development' && <ReactQueryDevtools />}
    </QueryClientProvider>
  )
}
```

### `src/app/router.tsx`
```typescript
import { createBrowserRouter } from 'react-router-dom'
import { lazy, Suspense } from 'react'
import { ProtectedRoute } from '@/features/auth/components/ProtectedRoute'

const DashboardPage = lazy(() => import('@/pages/DashboardPage'))
const AnalyticsPage = lazy(() => import('@/pages/AnalyticsPage'))
const LoginPage = lazy(() => import('@/pages/LoginPage'))

export const router = createBrowserRouter([
  {
    path: '/login',
    element: <Suspense><LoginPage /></Suspense>,
  },
  {
    path: '/',
    element: <ProtectedRoute />,
    children: [
      {
        path: 'dashboard',
        element: <Suspense><DashboardPage /></Suspense>,
      },
      {
        path: 'analytics',
        element: <Suspense><AnalyticsPage /></Suspense>,
      },
    ],
  },
])
```

### `src/features/auth/api/useAuth.ts`
```typescript
import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { api } from '@/lib/axios'
import type { LoginRequest, User } from '../types'

export const authKeys = {
  all: ['auth'] as const,
  user: () => [...authKeys.all, 'user'] as const,
}

export function useCurrentUser() {
  return useQuery({
    queryKey: authKeys.user(),
    queryFn: () => api.get<User>('/users/me').then(r => r.data),
    staleTime: 5 * 60 * 1000, // 5 minutes
    retry: false,
  })
}

export function useLogin() {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: (data: LoginRequest) =>
      api.post<User>('/auth/login', data).then(r => r.data),
    onSuccess: (user) => {
      queryClient.setQueryData(authKeys.user(), user)
    },
  })
}
```

### `src/features/auth/components/LoginForm.tsx`
```typescript
import { useForm } from 'react-hook-form'
import { zodResolver } from '@hookform/resolvers/zod'
import { z } from 'zod'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { useLogin } from '../api/useAuth'

const loginSchema = z.object({
  email: z.string().email('Valid email required'),
  password: z.string().min(8, 'Password must be at least 8 characters'),
})

type LoginFormData = z.infer<typeof loginSchema>

export function LoginForm() {
  const { register, handleSubmit, formState: { errors } } = useForm<LoginFormData>({
    resolver: zodResolver(loginSchema),
  })
  const login = useLogin()

  return (
    <form onSubmit={handleSubmit((data) => login.mutate(data))} noValidate>
      <div>
        <Input
          {...register('email')}
          type="email"
          placeholder="Email"
          aria-label="Email"
          aria-describedby={errors.email ? 'email-error' : undefined}
        />
        {errors.email && (
          <p id="email-error" role="alert" className="text-red-500 text-sm">
            {errors.email.message}
          </p>
        )}
      </div>
      <div>
        <Input
          {...register('password')}
          type="password"
          placeholder="Password"
          aria-label="Password"
        />
        {errors.password && (
          <p role="alert" className="text-red-500 text-sm">
            {errors.password.message}
          </p>
        )}
      </div>
      {login.isError && (
        <p role="alert" className="text-red-600">
          Invalid email or password
        </p>
      )}
      <Button type="submit" disabled={login.isPending}>
        {login.isPending ? 'Signing in...' : 'Sign in'}
      </Button>
    </form>
  )
}
```

### `src/features/auth/components/LoginForm.test.tsx`
```typescript
import { screen, waitFor } from '@testing-library/react'
import userEvent from '@testing-library/user-event'
import { http, HttpResponse } from 'msw'
import { render } from '@/test/render-utils'
import { server } from '@/test/server'
import { LoginForm } from './LoginForm'

describe('LoginForm', () => {
  it('shows validation errors when submitted empty', async () => {
    const user = userEvent.setup()
    render(<LoginForm />)

    await user.click(screen.getByRole('button', { name: /sign in/i }))

    expect(screen.getByText(/valid email required/i)).toBeInTheDocument()
  })

  it('calls login API and handles success', async () => {
    const user = userEvent.setup()
    render(<LoginForm />)

    await user.type(screen.getByLabelText(/email/i), 'test@example.com')
    await user.type(screen.getByLabelText(/password/i), 'password123')
    await user.click(screen.getByRole('button', { name: /sign in/i }))

    await waitFor(() => {
      expect(screen.queryByText(/invalid email or password/i)).not.toBeInTheDocument()
    })
  })

  it('shows error message on 401 response', async () => {
    server.use(
      http.post('/auth/login', () => HttpResponse.json({ error: 'Unauthorized' }, { status: 401 }))
    )
    const user = userEvent.setup()
    render(<LoginForm />)

    await user.type(screen.getByLabelText(/email/i), 'wrong@example.com')
    await user.type(screen.getByLabelText(/password/i), 'wrongpassword')
    await user.click(screen.getByRole('button', { name: /sign in/i }))

    expect(await screen.findByRole('alert')).toHaveTextContent(/invalid email or password/i)
  })
})
```

---

## ADR-001-stack-decisions.md

```markdown
# ADR-001: Frontend Stack Decisions — Analytics Dashboard

Date: 2026-01-15
Status: Accepted

## Context
Greenfield SaaS dashboard. 3-person team, all TypeScript-proficient.
Needs chart rendering, auth, dark mode, CI/CD.

## Decisions

### Build Tool: Vite 5 (not CRA, not Webpack)
- CRA is deprecated. Vite provides <300ms HMR vs ~10s for Webpack.

### State: Zustand (client) + TanStack Query (server)
- Redux rejected: no complex shared state requiring Redux's action model.
- TanStack Query handles all async state (caching, invalidation, loading).

### Router: React Router v7
- Data Router API supports route-level loaders.
- TanStack Router considered — rejected because type-safe routes not a hard requirement.

### Styling: Tailwind v4 + shadcn/ui
- shadcn/ui is copy-paste, not a runtime dependency — no vendor lock-in.
- Tailwind v4 Oxide engine gives 5x faster builds.

## Consequences
- Engineers must learn TanStack Query patterns (documented in BoK).
- shadcn/ui components live in src/components/ui/ — do not modify originals.
```
