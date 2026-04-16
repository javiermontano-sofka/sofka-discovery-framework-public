# State of the Art — Scaffold Next.js App (2025-2026)

## Latest Versions

| Tool | Version | Key Change |
|------|---------|-----------|
| Next.js | 15.1 | Partial Pre-rendering (PPR) stable, `after()` API, improved caching |
| React | 19.0 | Server Components stable, Actions, `use()` hook |
| Auth.js | 5.0 | Renamed from NextAuth v5, improved App Router support |
| Drizzle ORM | 0.30 | Drizzle Studio, Drizzle Kit v2 schema push |
| Prisma | 5.18 | Prisma Accelerate connection pooling, Prisma Pulse |
| Tailwind CSS | 4.0 | Oxide engine, CSS-first config in `app/globals.css` |

---

## Emerging Patterns (2025)

### Partial Pre-rendering (PPR)
Next.js 15 stabilizes PPR: routes can have a static shell (served instantly from CDN) with dynamic holes that stream in from the server. Zero config — add `<Suspense>` around dynamic parts. This eliminates the hard choice between static and dynamic rendering.

### Server Actions as the Default Mutation Pattern
The community has largely adopted Server Actions over Route Handlers for mutations triggered from forms. Benefits: no API endpoint to maintain, built-in CSRF, direct DB access without serialization round-trip. Route Handlers remain for: webhooks (require raw request body), public APIs consumed by third parties, streaming responses.

### `after()` API (Next.js 15)
`import { after } from 'next/server'` — run code after response is sent without blocking the user. Primary use case: analytics, audit logging, notifications without adding latency to the response.

### Turso + Drizzle for Edge Deployments
SQLite on the edge via Turso + Drizzle is becoming a viable pattern for applications that need global low-latency reads without the complexity of PostgreSQL connection pooling at the edge.

### Vercel Fluid Compute
Vercel's new compute model (2025) blurs the line between serverless and long-running. Functions can now handle WebSocket connections and long-running streams. Reduces the need for separate WebSocket infrastructure.

---

## Community Trends

- **Drizzle over Prisma for new projects** — Drizzle is SQL-first (you write SQL, Drizzle adds types). More predictable query patterns. Prisma's abstraction can produce N+1 queries if not careful.
- **shadcn/ui as the component standard** — 65% of new Next.js projects on GitHub use shadcn/ui (based on NPM download trends). Copy-paste philosophy has won.
- **Neon for PostgreSQL** — Neon (serverless Postgres, branching, scale-to-zero) has become the default cloud Postgres for Next.js. Replaces PlanetScale (which killed free tier).
- **`t3-app` as reference scaffold** — `create-t3-app` (TypeScript + tRPC + Prisma + NextAuth + Tailwind) remains the most starred Next.js starter. Signals community preferences.
- **Edge Runtime skepticism** — After early hype, teams are returning to Node.js runtime for most routes. Edge adds restrictions (no native modules, no Node APIs) for marginal latency gains in most cases.

---

## What is Deprecated / Declining

| Pattern | Status | Migration |
|---------|--------|-----------|
| Pages Router (`pages/`) | Maintained but legacy | Migrate to `app/` directory |
| `getServerSideProps` | Pages Router only | Use Server Components |
| `getStaticProps` / `getStaticPaths` | Pages Router only | Use `generateStaticParams` |
| `useRouter` from `next/router` | Pages Router only | Use `next/navigation` hooks |
| Next.js API Routes (`pages/api/`) | Maintained but legacy | Use `app/api/route.ts` |
| `next/legacy/image` | Deprecated | `next/image` |
| `next/font` with `@font-face` | Replaced | `next/font/google` or `next/font/local` |
| PlanetScale MySQL | Free tier killed | Migrate to Neon (Postgres) |
| `next-auth` v4 | Old API | Migrate to Auth.js v5 |
| Custom JWT handling without library | Security risk | Auth.js v5 or Clerk |
