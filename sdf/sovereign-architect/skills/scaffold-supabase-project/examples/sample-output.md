# Sample Output — Scaffold Supabase Project

**Scenario**: Multi-tenant B2B SaaS. Organizations, members with roles, projects. Next.js App Router frontend. Auth: Email + Google OAuth.

---

## Generated Migration Files

### `supabase/migrations/0001_initial.sql`
```sql
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Profiles (extends auth.users)
CREATE TABLE public.profiles (
  id UUID REFERENCES auth.users(id) ON DELETE CASCADE PRIMARY KEY,
  username TEXT UNIQUE,
  full_name TEXT,
  avatar_url TEXT,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Organizations
CREATE TABLE public.organizations (
  id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  name TEXT NOT NULL,
  slug TEXT UNIQUE NOT NULL,
  created_by UUID REFERENCES auth.users(id),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Organization members (junction)
CREATE TABLE public.organization_members (
  organization_id UUID REFERENCES public.organizations(id) ON DELETE CASCADE NOT NULL,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
  role TEXT NOT NULL DEFAULT 'member'
    CHECK (role IN ('owner', 'admin', 'member')),
  joined_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  PRIMARY KEY (organization_id, user_id)
);

-- Projects (org-scoped)
CREATE TABLE public.projects (
  id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  organization_id UUID REFERENCES public.organizations(id) ON DELETE CASCADE NOT NULL,
  name TEXT NOT NULL,
  description TEXT,
  created_by UUID REFERENCES auth.users(id),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Indexes
CREATE INDEX idx_org_members_user ON public.organization_members(user_id);
CREATE INDEX idx_projects_org ON public.projects(organization_id);

-- updated_at trigger
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN NEW.updated_at = NOW(); RETURN NEW; END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_projects_updated_at
  BEFORE UPDATE ON public.projects
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();
```

### `supabase/migrations/0002_rls.sql`
```sql
-- PROFILES
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

CREATE POLICY "profiles_select_public"
  ON public.profiles FOR SELECT USING (true);

CREATE POLICY "profiles_insert_own"
  ON public.profiles FOR INSERT WITH CHECK (id = auth.uid());

CREATE POLICY "profiles_update_own"
  ON public.profiles FOR UPDATE
  USING (id = auth.uid()) WITH CHECK (id = auth.uid());

-- ORGANIZATIONS
ALTER TABLE public.organizations ENABLE ROW LEVEL SECURITY;

-- Helper: is user a member of this org?
CREATE OR REPLACE FUNCTION is_org_member(org_id UUID)
RETURNS BOOLEAN AS $$
  SELECT EXISTS (
    SELECT 1 FROM public.organization_members
    WHERE organization_id = org_id AND user_id = auth.uid()
  );
$$ LANGUAGE sql SECURITY DEFINER;

-- Helper: is user admin/owner of this org?
CREATE OR REPLACE FUNCTION is_org_admin(org_id UUID)
RETURNS BOOLEAN AS $$
  SELECT EXISTS (
    SELECT 1 FROM public.organization_members
    WHERE organization_id = org_id
      AND user_id = auth.uid()
      AND role IN ('owner', 'admin')
  );
$$ LANGUAGE sql SECURITY DEFINER;

CREATE POLICY "orgs_select_members"
  ON public.organizations FOR SELECT
  USING (is_org_member(id));

CREATE POLICY "orgs_insert_authenticated"
  ON public.organizations FOR INSERT
  WITH CHECK (auth.role() = 'authenticated');

CREATE POLICY "orgs_update_admin"
  ON public.organizations FOR UPDATE
  USING (is_org_admin(id)) WITH CHECK (is_org_admin(id));

-- PROJECTS
ALTER TABLE public.projects ENABLE ROW LEVEL SECURITY;

CREATE POLICY "projects_select_members"
  ON public.projects FOR SELECT
  USING (is_org_member(organization_id));

CREATE POLICY "projects_insert_admin"
  ON public.projects FOR INSERT
  WITH CHECK (is_org_admin(organization_id));

CREATE POLICY "projects_update_admin"
  ON public.projects FOR UPDATE
  USING (is_org_admin(organization_id))
  WITH CHECK (is_org_admin(organization_id));

CREATE POLICY "projects_delete_owner"
  ON public.projects FOR DELETE
  USING (
    EXISTS (
      SELECT 1 FROM public.organization_members
      WHERE organization_id = projects.organization_id
        AND user_id = auth.uid()
        AND role = 'owner'
    )
  );
```

### `supabase/migrations/0003_auth_trigger.sql`
```sql
-- Auto-create profile on user signup
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (id, full_name, avatar_url)
  VALUES (
    NEW.id,
    COALESCE(NEW.raw_user_meta_data ->> 'full_name', NEW.raw_user_meta_data ->> 'name'),
    NEW.raw_user_meta_data ->> 'avatar_url'
  )
  ON CONFLICT (id) DO NOTHING;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE OR REPLACE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();
```

---

## RLS Policy Coverage Matrix

| Table | anon SELECT | auth SELECT | auth INSERT | auth UPDATE | auth DELETE |
|-------|-------------|-------------|-------------|-------------|-------------|
| profiles | Yes (public) | Yes (all) | Yes (own) | Yes (own) | No |
| organizations | No | Yes (member) | Yes (any auth) | Yes (admin) | No |
| organization_members | No | Yes (member) | Yes (admin) | No | Yes (owner) |
| projects | No | Yes (member) | Yes (admin) | Yes (admin) | Yes (owner) |

---

## Key Client Files

### `src/lib/supabase-server.ts`
```typescript
import { createServerClient } from '@supabase/ssr'
import { cookies } from 'next/headers'
import type { Database } from '@/types/supabase'

export async function createSupabaseServerClient() {
  const cookieStore = await cookies()
  return createServerClient<Database>(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      cookies: {
        getAll: () => cookieStore.getAll(),
        setAll: (c) => c.forEach(({ name, value, options }) =>
          cookieStore.set(name, value, options)
        ),
      },
    }
  )
}

export async function getAuthenticatedUser() {
  const supabase = await createSupabaseServerClient()
  const { data: { user }, error } = await supabase.auth.getUser()
  if (error || !user) throw new Error('Not authenticated')
  return user
}
```

### `middleware.ts` (Next.js)
```typescript
import { createServerClient } from '@supabase/ssr'
import { NextResponse, type NextRequest } from 'next/server'

export async function middleware(request: NextRequest) {
  let response = NextResponse.next({ request })

  const supabase = createServerClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      cookies: {
        getAll: () => request.cookies.getAll(),
        setAll: (c) => c.forEach(({ name, value, options }) =>
          response.cookies.set(name, value, options)
        ),
      },
    }
  )

  const { data: { user } } = await supabase.auth.getUser()

  if (!user && request.nextUrl.pathname.startsWith('/dashboard')) {
    return NextResponse.redirect(new URL('/login', request.url))
  }

  return response
}

export const config = {
  matcher: ['/((?!_next/static|_next/image|favicon.ico).*)'],
}
```
