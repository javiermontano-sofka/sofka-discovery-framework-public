---
name: scaffold-nextjs-app
author: "Javier Montaño (JM Labs)"
description: >
  Generate Next.js 15 App Router project with auth, database, API routes. Use when user asks to "scaffold a Next.js app".
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - Agent
---

# Scaffold Next.js App

Generate Next.js 15 App Router project with server-first architecture, full-stack auth, database integration, and type-safe API routes.

## Guiding Principle

> *"Server-first architecture produces faster, simpler applications. Default to Server Components — justify every `use client` directive."*

---

## Procedure

### Step 1 — Elicit Context and Routing Architecture

1. Ask: Does this project need SEO or static marketing pages? (YES → confirms Next.js is right choice, not plain React).
2. Ask: Is this full-stack (API routes included) or frontend-only consuming external API?
3. Ask: What is the auth strategy? (NextAuth.js/Auth.js v5, Clerk, Supabase Auth, custom JWT).
4. Ask: What database? (PostgreSQL via Drizzle ORM, Prisma, Supabase, PlanetScale).
5. Ask: Deployment target? (Vercel → full Edge/Node flexibility; Docker → prefer Node runtime; AWS Lambda → check bundle limits).
6. Classify all answers: `[HECHO]` if confirmed, `[SUPUESTO]` if inferred.

### Step 2 — Define App Router Architecture

1. Map all pages to App Router conventions: `app/page.tsx`, `app/(auth)/login/page.tsx`, `app/(dashboard)/layout.tsx`.
2. Identify which pages are Server Components (default), Client Components (`use client`), and Streaming (with `<Suspense>`).
3. Design route groups: `(marketing)` for public pages, `(dashboard)` for protected routes, `(auth)` for auth flow.
4. Define server vs. client boundary: data fetching and form mutations stay in Server Components/Actions; interactive UI only gets `use client`.
5. Design loading.tsx and error.tsx boundaries at each route segment.
6. Document routing map in `docs/routing-architecture.md`.

### Step 3 — Configure Next.js and Tooling

1. Create `next.config.ts` with: strict mode, experimental features (PPR if using Next 15), image domains, bundle analyzer hook.
2. Write `tsconfig.json` with `strict: true`, `moduleResolution: "Bundler"`, `paths` for `@/`.
3. Configure `tailwind.config.ts` for App Router content paths including `app/`, `components/`, `lib/`.
4. Write `.env.example` with all required variables; write `src/env.ts` with Zod validation (use `server` schema for NODE-only vars, `client` schema for `NEXT_PUBLIC_` vars).
5. Configure ESLint with `eslint-config-next`, `@typescript-eslint/strict`, `jsx-a11y`.
6. Set up Drizzle ORM (or Prisma): schema file, migration commands, type generation scripts.

### Step 4 — Implement Auth and Middleware

1. Install and configure Auth.js v5 (NextAuth): `auth.config.ts` with providers, session strategy, callbacks.
2. Write `middleware.ts` at root: protect all routes under `/(dashboard)`, redirect unauthenticated to `/login`.
3. Write `auth()` server helper — use in Server Components, Server Actions, and Route Handlers.
4. Implement CSRF protection for Server Actions (built-in with Auth.js).
5. Write `src/lib/auth-utils.ts` with `getCurrentUser()` helper that throws if not authenticated.
6. Test: unauthenticated request to `/dashboard` → 302 to `/login`. Auth cookie present → session resolves.

### Step 5 — Testing, CI/CD, and Deployment Config

1. Install Vitest for unit/component testing (Next.js compatible with `next/jest` or `@vitejs/plugin-react`).
2. Configure Playwright for E2E with Next.js: `webServer` config starts `next dev`, `baseURL` from env.
3. Write `next.config.ts` production optimizations: output `standalone` for Docker, `compress: true`, security headers.
4. Write `Dockerfile` using `output: 'standalone'` — copy only `.next/standalone` + `.next/static` + `public`.
5. Write `.github/workflows/ci.yml`: type-check → lint → unit tests → build → E2E.
6. Document all env variables in README with local setup instructions.

---

## Decision Framework

| Decision | Default | Alternative | When to Switch |
|----------|---------|-------------|----------------|
| Rendering | Server Components | Client Components | Interactive UI, browser APIs needed |
| Data fetching | `fetch()` in Server Component | Route Handler + TanStack Query | Client-side re-fetching required |
| Mutations | Server Actions | Route Handlers | Non-form mutations from client |
| Auth | Auth.js v5 | Clerk | Managed auth with UI components wanted |
| ORM | Drizzle ORM | Prisma | Team prefers Prisma's DX; large team |
| Database | PostgreSQL (Neon/Supabase) | SQLite (Turso) | Low-traffic or edge deployment |
| Caching | Next.js `unstable_cache` | Redis via Upstash | Multi-region or high-volume cache |
| Styling | Tailwind CSS v4 | CSS Modules | Existing non-Tailwind design system |
| Deployment | Vercel | Docker/ECS | No vendor lock-in; custom infra |
| Image handling | next/image (required) | Direct `<img>` | Never — always use next/image |

---

## Quality Criteria

1. `next build` exits 0 — no TypeScript errors, no missing env variables.
2. All routes under `(dashboard)` return 302 to `/login` when unauthenticated (Playwright test).
3. Lighthouse score ≥ 90 Performance on main marketing page (static generation verified).
4. `next/image` used for all images — no raw `<img>` tags.
5. No `use client` on pages that only render static or server-fetched data.
6. All Server Actions have `zod` input validation before touching the database.
7. Database migrations tracked in version control (`drizzle/` or `prisma/migrations/`).
8. Security headers configured in `next.config.ts` (CSP, X-Frame-Options, HSTS).

---

## Anti-Patterns

1. **Mixing Pages Router and App Router patterns** — Never import `useRouter` from `next/router` in App Router. Use `next/navigation`. Never use `getServerSideProps` in `app/`.
2. **`use client` on layout files** — Makes the entire subtree client-side. Put interactivity in leaf components, keep layouts as Server Components.
3. **Fetching in Client Components when a Server Component would do** — Adds unnecessary loading states, exposes internal API structure, increases bundle size.
4. **Not using `output: 'standalone'` for Docker** — Default Next.js Docker build includes all node_modules. Standalone output is 10x smaller.
5. **Storing secrets in `NEXT_PUBLIC_*` variables** — These are embedded in the client bundle. Use unprefixed vars for server-only secrets.

---

## When NOT to Use

- **When the project is a pure SPA with no SEO requirements** → Use `scaffold-react-app` (lighter, faster DX).
- **When the backend is a separate service team owns** → Consider a React SPA calling the existing API rather than adding a Next.js BFF.
- **When deploying to a platform that doesn't support Node.js processes** → Static-only sites are better served by plain HTML or Astro.
- **When the team has no React experience** → Consider the learning curve; Next.js App Router adds Server Component mental model on top of React.
