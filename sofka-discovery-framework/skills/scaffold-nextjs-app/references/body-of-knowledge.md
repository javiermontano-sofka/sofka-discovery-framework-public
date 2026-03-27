# Body of Knowledge: Scaffold Next.js App

## Recommended Project Structure (App Router)

```
my-nextjs-app/
├── .github/
│   └── workflows/
│       └── ci.yml
├── app/
│   ├── (auth)/
│   │   ├── login/
│   │   │   └── page.tsx          # Server Component
│   │   └── layout.tsx
│   ├── (dashboard)/
│   │   ├── layout.tsx            # Includes auth check + sidebar
│   │   ├── loading.tsx           # Streaming skeleton
│   │   ├── error.tsx             # Error boundary
│   │   ├── page.tsx              # /dashboard
│   │   └── settings/
│   │       └── page.tsx
│   ├── (marketing)/
│   │   ├── page.tsx              # / homepage (static)
│   │   └── pricing/
│   │       └── page.tsx
│   ├── api/
│   │   └── webhooks/
│   │       └── stripe/
│   │           └── route.ts      # Route Handler (POST)
│   ├── globals.css
│   └── layout.tsx                # Root layout with providers
├── components/
│   ├── ui/                       # shadcn/ui primitives
│   └── shared/                   # Cross-feature Server Components
├── drizzle/
│   ├── schema.ts
│   ├── migrations/
│   └── index.ts                  # DB client singleton
├── lib/
│   ├── auth.ts                   # Auth.js config export
│   ├── db.ts                     # Drizzle client
│   └── validations/              # Zod schemas for Server Actions
├── src/
│   └── env.ts                    # Zod validated env
├── e2e/
│   ├── auth.spec.ts
│   └── smoke.spec.ts
├── .env.example
├── auth.config.ts
├── middleware.ts
├── next.config.ts
├── playwright.config.ts
├── tailwind.config.ts
├── tsconfig.json
└── package.json
```

---

## Core Dependencies (2025-2026)

| Package | Version | Purpose |
|---------|---------|---------|
| next | ^15.0 | Full-stack framework |
| react | ^19.0 | UI library |
| react-dom | ^19.0 | DOM renderer |
| typescript | ^5.5 | Type system |
| next-auth | ^5.0 (Auth.js) | Authentication |
| drizzle-orm | ^0.30 | Type-safe ORM |
| drizzle-kit | ^0.21 | Schema migrations |
| @neondatabase/serverless | ^0.9 | Serverless PostgreSQL |
| zod | ^3.23 | Schema validation |
| tailwindcss | ^4.0 | Utility CSS |
| react-hook-form | ^7.52 | Form state |
| @hookform/resolvers | ^3.9 | Zod ↔ RHF bridge |

**Dev dependencies:**

| Package | Version | Purpose |
|---------|---------|---------|
| @playwright/test | ^1.45 | E2E testing |
| vitest | ^2.0 | Unit testing |
| @testing-library/react | ^16.0 | Component testing |
| eslint-config-next | ^15.0 | Next.js ESLint preset |

---

## Configuration Patterns

### `next.config.ts` — Production-Ready
```typescript
import type { NextConfig } from 'next'

const nextConfig: NextConfig = {
  reactStrictMode: true,
  output: 'standalone', // Required for Docker optimization

  images: {
    remotePatterns: [
      { protocol: 'https', hostname: 'images.unsplash.com' },
      { protocol: 'https', hostname: '**.amazonaws.com' },
    ],
  },

  headers: async () => [
    {
      source: '/(.*)',
      headers: [
        { key: 'X-Frame-Options', value: 'DENY' },
        { key: 'X-Content-Type-Options', value: 'nosniff' },
        { key: 'Referrer-Policy', value: 'strict-origin-when-cross-origin' },
        {
          key: 'Permissions-Policy',
          value: 'camera=(), microphone=(), geolocation=()',
        },
      ],
    },
  ],

  experimental: {
    ppr: true, // Partial Pre-rendering (Next 15)
  },
}

export default nextConfig
```

### `src/env.ts` — Split Server/Client Schema
```typescript
import { z } from 'zod'

const serverSchema = z.object({
  DATABASE_URL: z.string().url(),
  AUTH_SECRET: z.string().min(32),
  GITHUB_CLIENT_ID: z.string(),
  GITHUB_CLIENT_SECRET: z.string(),
})

const clientSchema = z.object({
  NEXT_PUBLIC_APP_URL: z.string().url(),
  NEXT_PUBLIC_POSTHOG_KEY: z.string().optional(),
})

// Only parse server schema on the server
const serverEnv = typeof window === 'undefined'
  ? serverSchema.parse(process.env)
  : ({} as z.infer<typeof serverSchema>)

const clientEnv = clientSchema.parse({
  NEXT_PUBLIC_APP_URL: process.env.NEXT_PUBLIC_APP_URL,
  NEXT_PUBLIC_POSTHOG_KEY: process.env.NEXT_PUBLIC_POSTHOG_KEY,
})

export const env = { ...serverEnv, ...clientEnv }
```

### `middleware.ts` — Auth Protection
```typescript
import { auth } from '@/lib/auth'
import { NextResponse } from 'next/server'

export default auth((req) => {
  const isLoggedIn = !!req.auth
  const isDashboardRoute = req.nextUrl.pathname.startsWith('/dashboard')
  const isAuthRoute = req.nextUrl.pathname.startsWith('/login')

  if (isDashboardRoute && !isLoggedIn) {
    const redirectUrl = new URL('/login', req.nextUrl.origin)
    redirectUrl.searchParams.set('callbackUrl', req.nextUrl.pathname)
    return NextResponse.redirect(redirectUrl)
  }

  if (isAuthRoute && isLoggedIn) {
    return NextResponse.redirect(new URL('/dashboard', req.nextUrl.origin))
  }
})

export const config = {
  matcher: ['/((?!api|_next/static|_next/image|favicon.ico).*)'],
}
```

### Drizzle ORM Schema
```typescript
// drizzle/schema.ts
import { pgTable, text, timestamp, uuid } from 'drizzle-orm/pg-core'

export const users = pgTable('users', {
  id: uuid('id').primaryKey().defaultRandom(),
  name: text('name'),
  email: text('email').notNull().unique(),
  emailVerified: timestamp('email_verified', { mode: 'date' }),
  image: text('image'),
  createdAt: timestamp('created_at').defaultNow().notNull(),
})

export type User = typeof users.$inferSelect
export type NewUser = typeof users.$inferInsert
```

### Server Action with Validation
```typescript
// lib/actions/update-profile.ts
'use server'

import { z } from 'zod'
import { revalidatePath } from 'next/cache'
import { db } from '@/lib/db'
import { users } from '@/drizzle/schema'
import { getCurrentUser } from '@/lib/auth-utils'
import { eq } from 'drizzle-orm'

const updateProfileSchema = z.object({
  name: z.string().min(1).max(100),
})

export async function updateProfile(formData: FormData) {
  const user = await getCurrentUser() // throws if not authenticated

  const parsed = updateProfileSchema.safeParse({
    name: formData.get('name'),
  })

  if (!parsed.success) {
    return { error: parsed.error.flatten().fieldErrors }
  }

  await db
    .update(users)
    .set({ name: parsed.data.name })
    .where(eq(users.id, user.id))

  revalidatePath('/dashboard/settings')
  return { success: true }
}
```

---

## Dockerfile for Standalone Build

```dockerfile
FROM node:20-alpine AS base

FROM base AS deps
RUN apk add --no-cache libc6-compat
WORKDIR /app
COPY package.json pnpm-lock.yaml ./
RUN corepack enable pnpm && pnpm install --frozen-lockfile

FROM base AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN corepack enable pnpm && pnpm build

FROM base AS runner
WORKDIR /app
ENV NODE_ENV=production
RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs

COPY --from=builder /app/public ./public
COPY --from=builder --chown=nextjs:nodejs /app/.next/standalone ./
COPY --from=builder --chown=nextjs:nodejs /app/.next/static ./.next/static

USER nextjs
EXPOSE 3000
ENV PORT=3000
CMD ["node", "server.js"]
```

---

## Server vs Client Component Decision Tree

```
Is this component:
├── Fetching data from DB/API? → Server Component
├── Using browser APIs (window, localStorage)? → Client Component
├── Using event handlers (onClick, onChange)? → Client Component
├── Using React hooks (useState, useEffect)? → Client Component
├── Rendering static/dynamic HTML only? → Server Component
├── Using context that wraps client state? → Provider = Client Component
└── Large library import (charts, rich text)? → dynamic() import with ssr: false
```

---

## Security Checklist

- [ ] `AUTH_SECRET` is 32+ random characters (not reused across envs)
- [ ] All Server Actions validate input with Zod before DB operation
- [ ] Route Handlers that accept POST validate `Content-Type` header
- [ ] Webhook handlers verify signature before processing
- [ ] `NEXT_PUBLIC_*` variables contain no secrets
- [ ] Security headers configured in `next.config.ts`
- [ ] Database URL uses connection pooling (PgBouncer) in production
- [ ] `output: 'standalone'` used for Docker (reduces attack surface)
