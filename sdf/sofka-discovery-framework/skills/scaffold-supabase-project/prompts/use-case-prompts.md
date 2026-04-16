# Use-Case Prompts — Scaffold Supabase Project

## Scenario 1: Multi-Tenant SaaS with Organizations

**Context**: B2B SaaS product. Users belong to organizations. Each org has owner/admin/member roles. Projects belong to orgs. 3-person team. Frontend is Next.js.

**Prompt**:
```
Scaffold a Supabase project for a multi-tenant B2B SaaS with:
- Tables: profiles (extends auth.users), organizations, organization_members (with role: owner|admin|member), projects, tasks
- Multi-tenancy: organization_id on projects and tasks tables
- RLS policies:
  - profiles: public read, own-user write
  - organizations: members-only read, owner/admin write
  - projects: org-members read, org-admins write
  - tasks: org-members read, task creator/assignee write

- Auth providers: Email+Password, Google OAuth
- Auto-create profile trigger on new user signup
- GitHub Actions that runs supabase db reset + checks type freshness

Deliver:
1. Full migration SQL (schema + RLS + triggers)
2. TypeScript client setup for Next.js App Router (using @supabase/ssr)
3. Middleware for protecting /dashboard routes
4. RLS policy coverage matrix table
```

---

## Scenario 2: RLS Security Audit

**Context**: Existing Supabase project. Developer says "RLS is configured" but the app had a data leak where users could access other users' records. Need a security audit.

**Prompt**:
```
Audit this Supabase project's RLS configuration for security issues:

Tables and their current policies:
1. posts: RLS enabled, one policy: "Allow all authenticated" USING (auth.role() = 'authenticated')
2. user_data: RLS enabled, policy: "Own data" USING (user_id = auth.uid()) — but NO INSERT policy
3. payment_methods: RLS NOT ENABLED
4. messages: RLS enabled, policy on SELECT: USING (true) — returns all messages to all users
5. profiles: No RLS policies at all (RLS enabled but no policies = no access)

For each table:
- Identify the security vulnerability
- Rate severity: CRITICAL / HIGH / MEDIUM
- Provide the corrected policy SQL
- Explain what attack the policy prevents
```

---

## Scenario 3: Edge Function for Stripe Integration

**Context**: SaaS app needs to handle Stripe webhook events for subscription management. Users can subscribe via the app. Subscription status must be updated in Supabase when Stripe fires events.

**Prompt**:
```
Write a Supabase Edge Function for Stripe webhook handling:
- Function path: supabase/functions/stripe-webhook/index.ts
- Verify Stripe-Signature header using STRIPE_WEBHOOK_SECRET env var
- Handle these events:
  - checkout.session.completed → create subscription record
  - customer.subscription.updated → update subscription status
  - customer.subscription.deleted → set status to 'canceled'
- Update subscriptions table (id, user_id, stripe_customer_id, status, current_period_end)
- Use service_role to bypass RLS when updating subscription status
- Log each processed event to webhook_events table (event_id, type, processed_at)
- Idempotency: check if event_id already exists in webhook_events before processing

Also write the subscriptions table schema with RLS (users can only read their own subscription).
```

---

## Scenario 4: Real-Time Collaboration Features

**Context**: Document editing app. Multiple users can be in the same document. Need: presence (who's viewing), live comments, and real-time document updates.

**Prompt**:
```
Implement Supabase Realtime features for a document collaboration app:

1. Presence channel (who is viewing this document):
   - React hook useDocumentPresence(documentId)
   - Uses Supabase Realtime Broadcast + track()
   - Returns array of { userId, userName, avatarUrl, cursorPosition }

2. Live comments:
   - comments table: id, document_id, user_id, content, created_at
   - RLS: document collaborators can read/write comments
   - React hook useComments(documentId) using Supabase Postgres Changes
   - Optimistic insert: add comment to local state immediately, rollback on error

3. Document updates:
   - document_changes table for operational transform
   - Realtime subscription to document_changes filtered by document_id

Deliver:
- SQL schema for comments + document_changes tables with RLS
- useDocumentPresence hook
- useComments hook with optimistic updates
- Realtime auth configuration
```

---

## Scenario 5: Supabase Storage with Access Control

**Context**: Healthcare app. Users upload medical documents. Documents are private. Doctors can access their patients' documents. Admin users can access all documents.

**Prompt**:
```
Configure Supabase Storage for a healthcare document management system:

Access model:
- patients can upload/read their own documents
- doctors can read documents of their patients (via patient_doctors junction table)
- admins can read all documents
- No public access to any medical documents

Tables needed:
- patient_doctors: patient_id, doctor_id (for access control)

Deliver:
1. Storage bucket configuration: 'medical-documents' (private)
2. RLS policies on storage.objects for all 3 roles
3. SQL helper function to check doctor-patient relationship
4. Edge Function for generating signed download URLs (instead of direct storage access)
5. File naming convention: {userId}/{documentType}/{timestamp}_{filename}
6. File upload React hook with progress tracking and error handling
```
