# State of the Art — Scaffold Supabase Project (2025-2026)

## Latest Versions

| Tool | Version | Key Change |
|------|---------|-----------|
| supabase-js | 2.45 | Improved TypeScript types, SSR helpers split to `@supabase/ssr` |
| @supabase/ssr | 0.5 | Dedicated SSR package replacing `auth-helpers-*` |
| Supabase CLI | 1.200 | `supabase branches` for schema branching, improved `db diff` |
| Supabase Auth | 2025.1 | PKCE for all providers, improved token refresh |
| PostgreSQL (Supabase) | 15 | Improved JSON, `MERGE` statement, logical replication |

---

## Emerging Patterns (2025)

### Supabase Branching (Database Branches)
Supabase now supports schema branching (similar to Git branches): each PR in your GitHub repo can have an isolated Supabase database branch with its own migrations applied. Frontend PRs can test against an isolated database. This eliminates the "testing against shared staging database" problem.

```bash
# PR branch auto-creates a Supabase database branch
# Deleted when PR is merged/closed
supabase branches create <branch-name>
supabase branches switch <branch-name>
```

### Supabase Auth UI Components
Supabase provides `@supabase/auth-ui-react` and `@supabase/auth-ui-shared` for pre-built auth forms. Reduces boilerplate for login/register/forgot-password flows significantly.

### Supabase Queues (pgmq)
Supabase now exposes `pgmq` (Postgres Message Queue extension) for background jobs. Create durable queues entirely in PostgreSQL without Redis or external queue services. Use cases: email sending, webhook processing, data export.

### `pg_net` for HTTP from SQL
`pg_net` extension allows making HTTP requests directly from PostgreSQL triggers and functions. Use case: Stripe webhooks confirmation, Slack notifications on row insert. Eliminates an Edge Function for simple HTTP calls.

### Realtime Authorization
Supabase Realtime now supports authorization: channels can check RLS policies before broadcasting changes. Previously, clients could subscribe to all postgres changes and filter client-side (insecure). Now Realtime enforces the same RLS policies as the REST API.

---

## Community Trends

- **Supabase + Next.js as default SaaS stack** — The combination of Supabase (auth + DB + storage) + Next.js 15 (full-stack) is the most common greenfield SaaS stack in 2025. PlanetScale's free tier removal accelerated this.
- **Drizzle ORM for complex queries** — `supabase-js` query builder is convenient for simple CRUD but limited for complex joins. Teams combine: `supabase-js` for auth + Drizzle for queries.
- **pgvector for AI apps** — The `vector` extension for similarity search is enabling RAG (Retrieval Augmented Generation) directly in Postgres. Teams building AI features use Supabase as their vector store alongside the application database.
- **Edge Functions replacing custom APIs** — Simple webhook handlers, email sending, and payment processing are moving to Supabase Edge Functions (Deno) instead of separate Node.js microservices.
- **Local-first development via `supabase start`** — Near-100% parity between local Docker stack and production Supabase. Teams now develop entirely locally without needing a remote dev project.

---

## What is Deprecated / Declining

| Pattern | Status | Migration |
|---------|--------|-----------|
| `@supabase/auth-helpers-nextjs` | Deprecated | `@supabase/ssr` |
| `@supabase/auth-helpers-react` | Deprecated | Direct `supabase-js` + custom hook |
| `createServerSupabaseClient` (old) | Deprecated | `createServerClient` from `@supabase/ssr` |
| Supabase client in `_app.tsx` with `useState` | Anti-pattern | Module-level singleton client |
| RLS policies using `auth.jwt() ->> 'email'` for access | Anti-pattern | Use `auth.uid()` for user identity |
| Storing auth JWT in localStorage | Deprecated | Cookie-based session via `@supabase/ssr` |
| `supabase.auth.api.getUserByAccessToken()` | Removed v2 | `supabase.auth.getUser()` |
| Supabase v1 client | End of life 2024 | Migrate to supabase-js v2 |
| `from().csv()` export queries | Removed | Use Edge Function + `COPY TO STDOUT` |
