# Priming-RAG: Supabase Patterns
> Sovereign Architect — Supabase platform knowledge for RAG consumption
> Generated: 2026-03-18 | Version: v1.0

---

## Executive Summary
- Supabase is an open-source Firebase alternative built on PostgreSQL [HECHO]
- Core services: Auth, Database (PostgreSQL), Realtime, Storage, Edge Functions [HECHO]
- Row Level Security (RLS) is the primary authorization mechanism [HECHO]
- PostgREST auto-generates REST APIs from database schema [HECHO]
- Edge Functions run on Deno runtime at the edge [HECHO]

## Key Patterns

### Authentication
- Use `supabase.auth.signUp/signInWithPassword/signInWithOAuth` [HECHO]
- JWT tokens include `role` claim for RLS policies [HECHO]
- Custom claims via `raw_app_meta_data` for RBAC [HECHO]
- MFA available via TOTP factors [HECHO]

### Row Level Security
- Enable RLS on ALL tables: `ALTER TABLE x ENABLE ROW LEVEL SECURITY` [HECHO]
- Policies use `auth.uid()` for user-scoped access [HECHO]
- Pattern: `CREATE POLICY "Users can view own data" ON items FOR SELECT USING (auth.uid() = user_id)` [HECHO]
- Service role key bypasses RLS — never expose to client [HECHO]

### Edge Functions
- Deno runtime, TypeScript native [HECHO]
- Invoke via `supabase.functions.invoke('function-name', { body })` [HECHO]
- Use for: webhooks, AI processing, third-party API calls, scheduled jobs [HECHO]
- Cold start: ~200-500ms, warm: ~50ms [INFERENCIA]

### Realtime
- Postgres Changes: listen to INSERT/UPDATE/DELETE on tables [HECHO]
- Broadcast: client-to-client messaging via channels [HECHO]
- Presence: track online users per channel [HECHO]
- Pattern: `supabase.channel('room').on('postgres_changes', ...)` [HECHO]

### Storage
- S3-compatible object storage with RLS policies [HECHO]
- Buckets: public (CDN) or private (signed URLs) [HECHO]
- Image transformations via URL parameters [HECHO]

## Anti-Patterns
- Exposing service role key in client code [HECHO]
- Not enabling RLS on new tables (security vulnerability) [HECHO]
- Using Realtime for high-frequency updates (>100 msg/sec) without throttling [INFERENCIA]
- Storing large files (>50MB) without chunked upload [HECHO]

## Query Hooks
- "How to implement auth with Supabase?" → Use supabase.auth with RLS policies
- "How to design RLS policies?" → Enable RLS, create USING/WITH CHECK policies per role
- "When to use Edge Functions vs Database Functions?" → Edge for external APIs/webhooks, DB for data logic
