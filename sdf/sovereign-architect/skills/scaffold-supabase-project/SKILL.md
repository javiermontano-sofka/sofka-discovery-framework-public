---
name: scaffold-supabase-project
author: "Javier Montaño (JM Labs)"
description: >
  Generate Supabase project with auth, RLS policies, edge functions, type generation. Use when user asks to "scaffold a Supabase project".
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - Agent
---

# Scaffold Supabase Project

Generate production-ready Supabase project with PostgreSQL schema, Row Level Security policies, auth configuration, type-safe client, Edge Functions, and local development setup.

## Guiding Principle

> *"Row Level Security is not optional — it is the authorization layer. Every table without RLS is a data breach waiting to happen. Enable RLS first, open access second."*

---

## Procedure

### Step 1 — Elicit Requirements and Design Schema

1. Ask: What is the primary data model? List entities and their relationships.
2. Ask: Multi-tenancy model? (Single-tenant, multi-tenant by `organization_id`, or fully isolated schemas).
3. Ask: Authentication providers needed? (Email/password, Google, GitHub, magic link, phone OTP).
4. Ask: Will the client be a web app, mobile app, or both? Determines SDK usage patterns.
5. Ask: Any real-time requirements? (Supabase Realtime for live queries/presence).
6. Design the schema on paper first: tables, columns, foreign keys, indexes. Identify which tables each auth role can access.

### Step 2 — Initialize Local Development Environment

1. Initialize Supabase CLI: `supabase init` → creates `supabase/` directory.
2. Start local stack: `supabase start` → local Postgres + Auth + Storage + Edge Functions + Studio at localhost:54323.
3. Write `supabase/migrations/0001_initial.sql` — initial schema with all tables.
4. Configure `supabase/seed.sql` with test data for local development.
5. Verify migration applies: `supabase db reset` runs migrations + seed from scratch.
6. Configure `supabase/.env.local` → never commit. Add to `.gitignore`.

### Step 3 — Design and Implement RLS Policies

1. Enable RLS on every table immediately after creation: `ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;`
2. Do NOT create any broad `FOR ALL USING (true)` policies — this is equivalent to disabling RLS.
3. For each table, define policies for each role (`anon`, `authenticated`, `service_role`):
   - `SELECT`: what rows can this role read?
   - `INSERT`: what can they create? (include `WITH CHECK` clause)
   - `UPDATE`: what can they modify? (include both `USING` and `WITH CHECK`)
   - `DELETE`: what can they delete?
4. Use `auth.uid()` for user-scoped access: `USING (user_id = auth.uid())`.
5. For multi-tenant: use `auth.jwt() ->> 'organization_id'` or a helper function.
6. Test policies with different user roles using Supabase Studio SQL editor or `supabase db test`.

### Step 4 — Client Integration and TypeScript Types

1. Generate TypeScript types: `supabase gen types typescript --local > src/types/supabase.ts`.
2. Add to `package.json` scripts: `"db:types": "supabase gen types typescript --local > src/types/supabase.ts"`.
3. Create typed Supabase client: `createClient<Database>(url, key)` using generated `Database` type.
4. Never use the `service_role` key in the browser client — use the `anon` key only.
5. Write `src/lib/supabase.ts` (browser client) and `src/lib/supabase-server.ts` (server client with auth cookie handling).
6. Implement auth helpers: `signIn`, `signOut`, `onAuthStateChange`, `getSession` wrapped in consistent API.

### Step 5 — Edge Functions, Storage, and Production Deployment

1. Create Edge Functions for business logic that requires server-side execution: `supabase functions new <name>`.
2. Edge Function pattern: validate input → use service role client for privileged operations → return typed response.
3. Configure Supabase Storage: create buckets, set bucket policies (public vs private), configure file size limits.
4. Write GitHub Actions CI: run migrations on each PR against a throwaway Supabase project, run tests.
5. Production deployment: `supabase db push` for schema migrations, `supabase functions deploy` for Edge Functions.
6. Set production env variables in Supabase Dashboard, never in code.

---

## Decision Framework

| Decision | Default | Alternative | When to Switch |
|----------|---------|-------------|----------------|
| Multi-tenancy | `organization_id` on each table | Separate Supabase projects | Full data isolation requirement |
| Auth provider | Email + Google OAuth | Clerk, Auth.js | Enterprise SSO (SAML) needed |
| File storage | Supabase Storage | S3 + CloudFront | > 100GB files; CDN edge needed |
| Realtime | Supabase Realtime (Broadcast) | Pusher, Ably | Very high concurrency (>10k connections) |
| RLS policy complexity | Simple `auth.uid()` check | Custom PostgreSQL functions | Complex org/role hierarchy |
| Edge Functions | Supabase Deno | AWS Lambda, Cloudflare Workers | Need npm packages not in Deno |
| TypeScript client | `@supabase/supabase-js` v2 | Direct PostgreSQL via Drizzle | Complex queries needing full SQL |
| Local development | `supabase start` (Docker) | Remote dev project | Low RAM machine (<8GB RAM) |
| Schema migrations | Supabase CLI migrations | Prisma Migrate | Team already on Prisma |
| Cron jobs | pg_cron (Supabase) | External cron + API calls | Frequency < daily |

---

## Quality Criteria

1. RLS is enabled on every table — zero tables with RLS disabled in production.
2. `anon` role can only read public data — no writes without authentication.
3. TypeScript types are generated from the actual schema (not hand-written).
4. No `service_role` key referenced in any frontend code.
5. All Edge Functions have input validation before calling the database.
6. `supabase db reset` completes without errors (migrations + seed are idempotent).
7. Storage bucket policies match access requirements (private by default, public only when intentional).
8. Production secrets stored in Supabase Dashboard env vars, not in code or `supabase/functions/.env`.

---

## Anti-Patterns

1. **Not enabling RLS on every table** — The default is no RLS = any authenticated user can read/write any row. This is a critical security vulnerability. Enable RLS the moment you create a table.
2. **Exposing `service_role` key in browser** — The service_role key bypasses RLS completely. Exposing it means any user can read/delete any row in the database. Use only in server-side contexts.
3. **Not generating TypeScript types from schema** — Hand-written types drift from the schema. When you `ALTER TABLE`, hand-written types stay wrong silently. Always run `supabase gen types`.
4. **Using `eq('user_id', userId)` as security** — Client-side filtering is not security. If RLS isn't set, a malicious user can remove the `.eq()` filter. RLS must enforce access, not just the client query.
5. **Storing binary data in PostgreSQL via Supabase** — Large files should go in Supabase Storage (S3-compatible), not as `bytea` columns. Postgres is not an object store.

---

## When NOT to Use

- **When you need multi-region writes** — Supabase is single-region Postgres. For globally distributed writes, consider PlanetScale, CockroachDB, or Turso.
- **When the team needs advanced PostgreSQL extensions** — Supabase exposes many extensions but not all. Check extension compatibility before committing.
- **When strict data residency requirements prevent cloud Postgres** — Self-hosted Supabase is possible but complex. Consider a managed Postgres on your cloud provider instead.
- **When you already have a working backend API** — Don't add Supabase just for auth. If you have a good Express/Fastify API, integrate JWT auth there.
