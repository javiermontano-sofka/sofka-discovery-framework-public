# Body of Knowledge: Scaffold React App

## Recommended Project Structure

```
my-app/
├── .github/
│   └── workflows/
│       └── ci.yml
├── .husky/
│   └── pre-commit
├── docs/
│   └── ADR-001-stack-decisions.md
├── e2e/
│   ├── smoke.spec.ts
│   └── playwright.config.ts
├── public/
│   └── favicon.svg
├── src/
│   ├── app/                    # App-level providers, router config
│   │   ├── App.tsx
│   │   ├── providers.tsx
│   │   └── router.tsx
│   ├── assets/                 # Static assets imported by components
│   ├── components/             # Shared UI components
│   │   └── ui/                 # shadcn/ui primitives (Button, Input…)
│   ├── features/               # Feature-first modules
│   │   └── auth/
│   │       ├── api/            # React Query hooks
│   │       ├── components/     # Feature-local components
│   │       ├── hooks/          # Feature-local hooks
│   │       ├── stores/         # Feature-local Zustand slice
│   │       ├── types.ts
│   │       └── index.ts        # Public API of the feature
│   ├── hooks/                  # App-wide shared hooks
│   ├── lib/                    # Thin wrappers (axios instance, queryClient)
│   ├── stores/                 # Global Zustand stores
│   ├── test/
│   │   ├── setup.ts            # RTL + jest-dom matchers
│   │   └── server.ts           # MSW service worker setup
│   ├── types/                  # Global TypeScript types
│   ├── utils/                  # Pure utility functions
│   ├── env.ts                  # Zod-validated env
│   └── main.tsx
├── .env.example
├── .eslintrc                   # OR eslint.config.mjs (flat config)
├── .prettierrc
├── Dockerfile
├── index.html
├── package.json
├── tailwind.config.ts
├── tsconfig.json
├── tsconfig.node.json
└── vite.config.ts
```

---

## Core Dependencies (2025-2026)

| Package | Version | Purpose |
|---------|---------|---------|
| react | ^19.0 | UI library |
| react-dom | ^19.0 | DOM renderer |
| typescript | ^5.5 | Type system |
| vite | ^5.4 | Build tool + dev server |
| @vitejs/plugin-react | ^4.3 | React HMR + JSX transform |
| react-router-dom | ^7.0 | Client-side routing |
| @tanstack/react-query | ^5.0 | Server state management |
| zustand | ^5.0 | Client state management |
| tailwindcss | ^4.0 | Utility CSS |
| zod | ^3.23 | Runtime schema validation |
| react-hook-form | ^7.52 | Form state management |
| @hookform/resolvers | ^3.9 | Zod ↔ react-hook-form bridge |
| axios | ^1.7 | HTTP client (interceptors) |
| msw | ^2.3 | API mocking in tests |

**Dev dependencies:**

| Package | Version | Purpose |
|---------|---------|---------|
| vitest | ^2.0 | Unit test runner |
| @vitest/coverage-v8 | ^2.0 | Coverage via V8 |
| @testing-library/react | ^16.0 | React component testing |
| @testing-library/user-event | ^14.5 | Realistic user event simulation |
| @testing-library/jest-dom | ^6.4 | Custom DOM matchers |
| playwright | ^1.45 | E2E browser automation |
| @playwright/test | ^1.45 | Playwright test runner |
| eslint | ^9.0 | Linter (flat config) |
| @typescript-eslint/eslint-plugin | ^8.0 | TS-aware lint rules |
| eslint-plugin-react-hooks | ^4.6 | Rules of hooks enforcement |
| eslint-plugin-jsx-a11y | ^6.9 | Accessibility lint rules |
| prettier | ^3.3 | Code formatter |
| husky | ^9.1 | Git hooks |
| lint-staged | ^15.2 | Run linters on staged files |

---

## Configuration Patterns

### `tsconfig.json` — Strict Baseline
```json
{
  "compilerOptions": {
    "target": "ES2022",
    "lib": ["ES2022", "DOM", "DOM.Iterable"],
    "module": "ESNext",
    "moduleResolution": "Bundler",
    "resolveJsonModule": true,
    "allowImportingTsExtensions": true,
    "noEmit": true,
    "isolatedModules": true,
    "strict": true,
    "noUncheckedIndexedAccess": true,
    "noImplicitReturns": true,
    "exactOptionalPropertyTypes": true,
    "paths": {
      "@/*": ["./src/*"]
    }
  },
  "include": ["src"],
  "references": [{ "path": "./tsconfig.node.json" }]
}
```

### `vite.config.ts` — With Aliases and Vitest Inline
```typescript
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import { resolve } from 'path'

export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: { '@': resolve(__dirname, './src') },
  },
  server: {
    proxy: {
      '/api': { target: 'http://localhost:3000', changeOrigin: true },
    },
  },
  test: {
    environment: 'jsdom',
    setupFiles: ['./src/test/setup.ts'],
    globals: true,
    coverage: {
      provider: 'v8',
      thresholds: { statements: 70, branches: 65, functions: 70, lines: 70 },
      exclude: ['src/test/**', 'src/types/**', '**/*.d.ts'],
    },
  },
})
```

### `tailwind.config.ts` — With Token Extension
```typescript
import type { Config } from 'tailwindcss'

const config: Config = {
  content: ['./index.html', './src/**/*.{ts,tsx}'],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        brand: {
          50: '#fff7ed',
          500: '#ff7e08',
          600: '#ea6c00',
          900: '#7c2d12',
        },
      },
      fontFamily: {
        sans: ['Inter Variable', 'system-ui', 'sans-serif'],
      },
    },
  },
  plugins: [],
}

export default config
```

### `src/env.ts` — Zod-Validated Environment
```typescript
import { z } from 'zod'

const envSchema = z.object({
  VITE_API_BASE_URL: z.string().url(),
  VITE_APP_ENV: z.enum(['development', 'staging', 'production']),
  VITE_ENABLE_ANALYTICS: z.coerce.boolean().default(false),
})

export const env = envSchema.parse(import.meta.env)
// Throws at startup with clear message if a variable is missing/invalid
```

### `src/test/setup.ts`
```typescript
import '@testing-library/jest-dom'
import { afterEach } from 'vitest'
import { cleanup } from '@testing-library/react'
import { server } from './server'

beforeAll(() => server.listen({ onUnhandledRequest: 'error' }))
afterEach(() => { cleanup(); server.resetHandlers() })
afterAll(() => server.close())
```

---

## Testing Setup

### Unit Test Pattern with RTL
```typescript
// src/features/auth/components/LoginForm.test.tsx
import { render, screen } from '@testing-library/react'
import userEvent from '@testing-library/user-event'
import { LoginForm } from './LoginForm'

describe('LoginForm', () => {
  it('shows validation error when email is empty', async () => {
    const user = userEvent.setup()
    render(<LoginForm onSubmit={vi.fn()} />)

    await user.click(screen.getByRole('button', { name: /sign in/i }))

    expect(screen.getByText(/email is required/i)).toBeInTheDocument()
  })
})
```

### MSW Handler Pattern
```typescript
// src/test/handlers.ts
import { http, HttpResponse } from 'msw'
import { env } from '@/env'

export const handlers = [
  http.get(`${env.VITE_API_BASE_URL}/users/me`, () => {
    return HttpResponse.json({ id: '1', name: 'Test User', email: 'test@example.com' })
  }),
]
```

---

## GitHub Actions CI Template

```yaml
# .github/workflows/ci.yml
name: CI

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]

jobs:
  ci:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - uses: pnpm/action-setup@v4
        with:
          version: 9

      - uses: actions/setup-node@v4
        with:
          node-version: 20
          cache: 'pnpm'

      - name: Install dependencies
        run: pnpm install --frozen-lockfile

      - name: Type check
        run: pnpm tsc --noEmit

      - name: Lint
        run: pnpm lint

      - name: Unit tests + coverage
        run: pnpm test --coverage
        env:
          VITE_API_BASE_URL: http://localhost:3000
          VITE_APP_ENV: development
          VITE_ENABLE_ANALYTICS: false

      - name: Build
        run: pnpm build

      - name: Install Playwright browsers
        run: pnpm exec playwright install --with-deps chromium

      - name: E2E tests
        run: pnpm exec playwright test
        env:
          PLAYWRIGHT_BASE_URL: http://localhost:4173

      - name: Upload coverage
        uses: codecov/codecov-action@v4
        with:
          token: ${{ secrets.CODECOV_TOKEN }}
```

---

## Decision Tables

### When to Use Each State Management Layer

| State Type | Solution | Example |
|-----------|---------|---------|
| Local component UI | `useState` / `useReducer` | Modal open/closed, input focus |
| Shared UI (non-server) | Zustand slice | Theme, sidebar collapsed |
| Server data (async) | TanStack Query | User profile, product list |
| Form state | React Hook Form | Login form, checkout form |
| URL state | React Router `useSearchParams` | Filters, pagination |
| Complex derived state | Zustand with selectors | Cart total, filtered list |

### When to Use Each Routing Approach

| Scenario | Approach |
|---------|---------|
| Standard SPA | React Router v7 `createBrowserRouter` |
| Type-safe route params required | TanStack Router |
| Full-stack + SSR | Next.js App Router |
| Micro-frontends | Module Federation + independent routers |

---

## Environment Configuration

```
# .env.example
VITE_API_BASE_URL=http://localhost:3000
VITE_APP_ENV=development
VITE_ENABLE_ANALYTICS=false
# VITE_SENTRY_DSN=  # Uncomment for error tracking
```

**Rule**: Every new env variable must be:
1. Added to `.env.example` with a safe placeholder
2. Added to `src/env.ts` Zod schema
3. Documented in README under "Environment Variables"
