# Use-Case Prompts — Scaffold Next.js App

## Scenario 1: SaaS Application with Auth and Database

**Context**: Greenfield SaaS app. Team of 4. Needs GitHub OAuth, email+password auth, PostgreSQL via Neon, Stripe payments. Deploy to Vercel.

**Prompt**:
```
Scaffold a full-stack Next.js 15 SaaS app with:
- App Router with route groups: (marketing), (auth), (dashboard)
- Auth.js v5 with GitHub OAuth + Credentials (email+password with bcrypt)
- Drizzle ORM + Neon PostgreSQL (users, subscriptions tables)
- Stripe webhook handler in app/api/webhooks/stripe/route.ts
- Middleware protecting all /dashboard routes
- Tailwind CSS v4 + shadcn/ui
- Server Actions for all form mutations with Zod validation
- Security headers in next.config.ts
- Playwright E2E tests for auth flow
- Docker standalone output for alternative deployment

Deliver: complete scaffold with all config files, schema, auth implementation, and ADR.
```

---

## Scenario 2: Content Marketing Site with MDX Blog

**Context**: Marketing site for a B2B startup. Needs fast static pages, MDX blog, contact form, SEO optimized. No auth. Deploy to Vercel Edge Network.

**Prompt**:
```
Scaffold a Next.js 15 marketing site with:
- App Router, all pages statically generated where possible
- MDX blog with: syntax highlighting (Shiki), reading time, OG image generation
- Contact form using Server Action + Resend email API
- next/image for all images with blur placeholders
- next-sitemap for sitemap generation
- OpenGraph + Twitter card meta tags via generateMetadata
- Lighthouse Performance target: 95+ on all pages
- No database needed — posts from MDX files in content/posts/

Generate: project structure, next.config.ts with MDX support, sample blog post MDX, OG image route.
```

---

## Scenario 3: Pages Router to App Router Migration

**Context**: Existing Next.js 13 project using Pages Router. 6 engineers. Has getServerSideProps on 8 routes, getStaticProps on 4, custom _app.tsx with 3 providers. Zero downtime required.

**Prompt**:
```
Plan the migration of a Next.js 13 Pages Router project to App Router.

Current state:
- 12 pages in pages/ directory
- 8 using getServerSideProps, 4 using getStaticProps
- Custom _app.tsx with Redux Provider, QueryClientProvider, ThemeProvider
- API routes in pages/api/
- useRouter from next/router in 15 components

Migration requirements:
- Incremental (pages/ and app/ can coexist during migration)
- Zero downtime (each page migrates independently)
- Preserve all SEO metadata

Deliver:
1. Migration order (lowest risk first)
2. getServerSideProps → Server Component patterns
3. getStaticProps → generateStaticParams patterns
4. _app.tsx → app/layout.tsx with providers as Client Components
5. useRouter migration guide (next/router → next/navigation)
6. pages/api/ → app/api/route.ts migration
```

---

## Scenario 4: E-commerce with ISR and Real-time Inventory

**Context**: Online store. Product catalog (~5000 products) needs fast page loads. Inventory updates every 30 seconds. Orders are time-sensitive. Team of 3, 1 year Next.js experience.

**Prompt**:
```
Scaffold a Next.js 15 e-commerce store with:
- Product listing: ISR with revalidate: 60 (most products change rarely)
- Product detail: PPR — static shell (name, images) + dynamic inventory count (Suspense)
- Cart: Client Component with Zustand (no SSR needed)
- Checkout: Server Actions for order creation + Stripe PaymentIntent
- Inventory: Route Handler with revalidateTag('inventory') triggered by webhook
- Search: Client-side with TanStack Query calling /api/search route
- Categories: generateStaticParams for all category pages

Generate:
- app/products/[slug]/page.tsx with PPR pattern
- app/api/webhooks/inventory/route.ts that revalidates cache
- Cart Zustand store with persistence
- Checkout Server Action with Stripe integration
```

---

## Scenario 5: Dashboard with Real-time Data and WebSockets

**Context**: Operations dashboard showing live metrics. 50 concurrent users. Data updates every 5 seconds. Needs auth. Historical charts + live counter widgets.

**Prompt**:
```
Scaffold a Next.js 15 real-time operations dashboard with:
- App Router + Auth.js v5 (all routes protected)
- Server Components for: initial data load, historical charts (Recharts, ssr: false)
- Client Components for: live counter widgets using EventSource (SSE)
- Route Handler: GET /api/metrics/stream — Server-Sent Events endpoint
- Zustand for: live metric state, alert notifications
- TanStack Query for: historical data with refetchInterval: 30000
- Dashboard layout with collapsible sidebar (localStorage preference)
- WebSocket alternative: app/api/ws/route.ts (Vercel Fluid Compute)

Generate the SSE route handler, a LiveCounter client component, and the dashboard layout.
```
