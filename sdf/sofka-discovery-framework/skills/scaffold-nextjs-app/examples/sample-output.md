# Sample Output — Scaffold Next.js App

**Scenario**: SaaS app with GitHub OAuth, Drizzle + Neon PostgreSQL, Server Actions, protected dashboard. Deploy to Vercel.

---

## Generated Directory Structure

```
saas-app/
├── app/
│   ├── (auth)/
│   │   ├── login/
│   │   │   └── page.tsx          # GitHub OAuth button + credentials form
│   │   └── layout.tsx            # Centered auth card layout
│   ├── (dashboard)/
│   │   ├── layout.tsx            # Auth check + sidebar
│   │   ├── loading.tsx           # Dashboard skeleton
│   │   ├── error.tsx             # Error boundary
│   │   ├── page.tsx              # /dashboard — overview
│   │   └── settings/
│   │       ├── page.tsx          # Profile settings form
│   │       └── loading.tsx
│   ├── (marketing)/
│   │   ├── page.tsx              # / homepage
│   │   └── pricing/
│   │       └── page.tsx
│   ├── api/
│   │   ├── auth/
│   │   │   └── [...nextauth]/
│   │   │       └── route.ts
│   │   └── webhooks/
│   │       └── stripe/
│   │           └── route.ts
│   ├── globals.css
│   └── layout.tsx                # Root layout (fonts, providers)
├── components/
│   ├── ui/                       # shadcn/ui
│   └── shared/
│       └── UserAvatar.tsx
├── drizzle/
│   ├── schema.ts
│   ├── migrations/
│   │   └── 0000_initial.sql
│   └── index.ts
├── lib/
│   ├── auth.ts
│   ├── db.ts
│   └── auth-utils.ts
├── src/
│   └── env.ts
├── e2e/
│   ├── auth.spec.ts
│   └── smoke.spec.ts
├── auth.config.ts
├── drizzle.config.ts
├── middleware.ts
├── next.config.ts
├── playwright.config.ts
├── tailwind.config.ts
├── tsconfig.json
└── package.json
```

---

## Key Generated Files

### `auth.config.ts` (Edge-compatible)
```typescript
import type { NextAuthConfig } from 'next-auth'
import GitHub from 'next-auth/providers/github'
import Credentials from 'next-auth/providers/credentials'
import { z } from 'zod'

export default {
  providers: [
    GitHub,
    Credentials({
      credentials: {
        email: { label: 'Email', type: 'email' },
        password: { label: 'Password', type: 'password' },
      },
      authorize: async (credentials) => {
        // NOTE: This runs on edge — no direct DB access
        // Delegate to API route for DB lookup
        const parsed = z.object({
          email: z.string().email(),
          password: z.string().min(8),
        }).safeParse(credentials)

        if (!parsed.success) return null

        const res = await fetch(`${process.env.NEXT_PUBLIC_APP_URL}/api/auth/verify`, {
          method: 'POST',
          body: JSON.stringify(parsed.data),
          headers: { 'Content-Type': 'application/json' },
        })

        if (!res.ok) return null
        return res.json()
      },
    }),
  ],
  pages: {
    signIn: '/login',
  },
  callbacks: {
    jwt({ token, user }) {
      if (user) token.userId = user.id
      return token
    },
    session({ session, token }) {
      session.user.id = token.userId as string
      return session
    },
  },
} satisfies NextAuthConfig
```

### `middleware.ts`
```typescript
import { auth } from '@/lib/auth'
import { NextResponse } from 'next/server'

export default auth((req) => {
  const isLoggedIn = !!req.auth
  const path = req.nextUrl.pathname

  if (path.startsWith('/dashboard') && !isLoggedIn) {
    const url = new URL('/login', req.nextUrl.origin)
    url.searchParams.set('callbackUrl', path)
    return NextResponse.redirect(url)
  }

  if (path === '/login' && isLoggedIn) {
    return NextResponse.redirect(new URL('/dashboard', req.nextUrl.origin))
  }
})

export const config = {
  matcher: ['/((?!api|_next/static|_next/image|favicon.ico|.*\\.svg).*)'],
}
```

### `app/(dashboard)/layout.tsx`
```typescript
import { redirect } from 'next/navigation'
import { getCurrentUser } from '@/lib/auth-utils'
import { Sidebar } from '@/components/shared/Sidebar'

export default async function DashboardLayout({
  children,
}: {
  children: React.ReactNode
}) {
  const user = await getCurrentUser().catch(() => null)

  if (!user) {
    redirect('/login')
  }

  return (
    <div className="flex h-screen">
      <Sidebar user={user} />
      <main className="flex-1 overflow-auto p-8">
        {children}
      </main>
    </div>
  )
}
```

### `drizzle/schema.ts`
```typescript
import {
  pgTable, uuid, text, timestamp, boolean
} from 'drizzle-orm/pg-core'

export const users = pgTable('users', {
  id: uuid('id').primaryKey().defaultRandom(),
  name: text('name'),
  email: text('email').notNull().unique(),
  emailVerified: timestamp('email_verified', { withTimezone: true }),
  image: text('image'),
  hashedPassword: text('hashed_password'),
  createdAt: timestamp('created_at', { withTimezone: true }).defaultNow().notNull(),
})

export const accounts = pgTable('accounts', {
  userId: uuid('user_id').notNull().references(() => users.id, { onDelete: 'cascade' }),
  type: text('type').notNull(),
  provider: text('provider').notNull(),
  providerAccountId: text('provider_account_id').notNull(),
  refresh_token: text('refresh_token'),
  access_token: text('access_token'),
  expires_at: text('expires_at'),
  token_type: text('token_type'),
  scope: text('scope'),
  id_token: text('id_token'),
})

export type User = typeof users.$inferSelect
export type NewUser = typeof users.$inferInsert
```

### `app/(dashboard)/settings/page.tsx` (Server Component + Server Action)
```typescript
import { getCurrentUser } from '@/lib/auth-utils'
import { updateProfile } from '@/lib/actions/update-profile'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'

export default async function SettingsPage() {
  const user = await getCurrentUser()

  return (
    <div className="max-w-lg">
      <h1 className="text-2xl font-bold mb-6">Settings</h1>
      <form action={updateProfile}>
        <input type="hidden" name="userId" value={user.id} />
        <div className="space-y-4">
          <div>
            <label htmlFor="name" className="text-sm font-medium">Name</label>
            <Input id="name" name="name" defaultValue={user.name ?? ''} />
          </div>
          <Button type="submit">Save changes</Button>
        </div>
      </form>
    </div>
  )
}
```

### `e2e/auth.spec.ts`
```typescript
import { test, expect } from '@playwright/test'

test('unauthenticated user is redirected to login', async ({ page }) => {
  await page.goto('/dashboard')
  await expect(page).toHaveURL(/\/login/)
})

test('login with invalid credentials shows error', async ({ page }) => {
  await page.goto('/login')
  await page.getByLabel(/email/i).fill('wrong@example.com')
  await page.getByLabel(/password/i).fill('wrongpassword')
  await page.getByRole('button', { name: /sign in/i }).click()
  await expect(page.getByRole('alert')).toBeVisible()
})

test('successful login redirects to dashboard', async ({ page }) => {
  await page.goto('/login')
  await page.getByRole('link', { name: /sign in with github/i }).click()
  // OAuth flow handled by Playwright auth fixture
  await expect(page).toHaveURL(/\/dashboard/)
})
```
