# Body of Knowledge: Scaffold Supabase Project

## Recommended Project Structure

```
my-supabase-project/
├── supabase/
│   ├── migrations/
│   │   ├── 0001_initial.sql         # Initial schema
│   │   ├── 0002_rls_policies.sql    # RLS policies
│   │   └── 0003_functions.sql       # DB functions and triggers
│   ├── functions/
│   │   ├── send-email/
│   │   │   └── index.ts             # Edge Function
│   │   └── process-payment/
│   │       └── index.ts
│   ├── seed.sql                      # Dev/test seed data
│   └── config.toml                   # Supabase CLI config
├── src/
│   ├── lib/
│   │   ├── supabase.ts               # Browser client (anon key)
│   │   └── supabase-server.ts        # Server client (cookies)
│   ├── types/
│   │   └── supabase.ts               # Generated — never edit manually
│   └── features/
│       └── auth/
│           ├── auth.service.ts
│           └── use-auth.ts           # React hook
├── .env.local                        # Local dev secrets (gitignored)
├── .env.example                      # Template with all required vars
└── package.json
```

---

## Core CLI Setup

```bash
# Install CLI
npm install -g supabase

# Initialize project
supabase init

# Start local stack (requires Docker)
supabase start
# Output: Studio URL, API URL, anon key, service_role key

# Apply migrations to local
supabase db reset

# Generate TypeScript types from local schema
supabase gen types typescript --local > src/types/supabase.ts

# Generate types from remote project
supabase gen types typescript --project-id <project-ref> > src/types/supabase.ts
```

---

## Schema Design and Migration Patterns

### `supabase/migrations/0001_initial.sql`
```sql
-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Profiles table (extends auth.users)
CREATE TABLE public.profiles (
  id UUID REFERENCES auth.users(id) ON DELETE CASCADE PRIMARY KEY,
  username TEXT UNIQUE NOT NULL,
  full_name TEXT,
  avatar_url TEXT,
  website TEXT,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Organizations table (for multi-tenant)
CREATE TABLE public.organizations (
  id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  name TEXT NOT NULL,
  slug TEXT UNIQUE NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Organization members
CREATE TABLE public.organization_members (
  organization_id UUID REFERENCES public.organizations(id) ON DELETE CASCADE NOT NULL,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
  role TEXT NOT NULL DEFAULT 'member' CHECK (role IN ('owner', 'admin', 'member')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  PRIMARY KEY (organization_id, user_id)
);

-- Projects (belongs to organization)
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
CREATE INDEX idx_projects_org ON public.projects(organization_id);
CREATE INDEX idx_org_members_user ON public.organization_members(user_id);

-- Auto-update updated_at trigger
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_projects_updated_at
  BEFORE UPDATE ON public.projects
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();
```

---

## RLS Policies — Complete Example

### `supabase/migrations/0002_rls_policies.sql`
```sql
-- ==========================================
-- PROFILES
-- ==========================================
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

-- Anyone can view profiles (public data)
CREATE POLICY "profiles_select_public"
  ON public.profiles FOR SELECT
  USING (true);

-- Users can only update their own profile
CREATE POLICY "profiles_update_own"
  ON public.profiles FOR UPDATE
  USING (id = auth.uid())
  WITH CHECK (id = auth.uid());

-- Profile is created automatically via trigger
CREATE POLICY "profiles_insert_own"
  ON public.profiles FOR INSERT
  WITH CHECK (id = auth.uid());

-- ==========================================
-- ORGANIZATIONS
-- ==========================================
ALTER TABLE public.organizations ENABLE ROW LEVEL SECURITY;

-- Members can view their organizations
CREATE POLICY "orgs_select_members"
  ON public.organizations FOR SELECT
  USING (
    id IN (
      SELECT organization_id
      FROM public.organization_members
      WHERE user_id = auth.uid()
    )
  );

-- Only authenticated users can create orgs
CREATE POLICY "orgs_insert_authenticated"
  ON public.organizations FOR INSERT
  WITH CHECK (auth.role() = 'authenticated');

-- Only owners and admins can update org
CREATE POLICY "orgs_update_admin"
  ON public.organizations FOR UPDATE
  USING (
    id IN (
      SELECT organization_id
      FROM public.organization_members
      WHERE user_id = auth.uid()
        AND role IN ('owner', 'admin')
    )
  );

-- ==========================================
-- PROJECTS
-- ==========================================
ALTER TABLE public.projects ENABLE ROW LEVEL SECURITY;

-- Org members can view projects
CREATE POLICY "projects_select_members"
  ON public.projects FOR SELECT
  USING (
    organization_id IN (
      SELECT organization_id
      FROM public.organization_members
      WHERE user_id = auth.uid()
    )
  );

-- Org admins/owners can create projects
CREATE POLICY "projects_insert_admin"
  ON public.projects FOR INSERT
  WITH CHECK (
    organization_id IN (
      SELECT organization_id
      FROM public.organization_members
      WHERE user_id = auth.uid()
        AND role IN ('owner', 'admin')
    )
  );
```

---

## TypeScript Client Setup

### `src/lib/supabase.ts` (Browser)
```typescript
import { createClient } from '@supabase/supabase-js'
import type { Database } from '@/types/supabase'

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY

if (!supabaseUrl || !supabaseAnonKey) {
  throw new Error('Missing Supabase environment variables')
}

export const supabase = createClient<Database>(supabaseUrl, supabaseAnonKey, {
  auth: {
    persistSession: true,
    autoRefreshToken: true,
  },
})
```

### `src/lib/supabase-server.ts` (Next.js Server)
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
        setAll: (cookiesToSet) => {
          cookiesToSet.forEach(({ name, value, options }) => {
            cookieStore.set(name, value, options)
          })
        },
      },
    }
  )
}
```

### Typed Query Example
```typescript
// Using generated Database type for full type safety
import { supabase } from '@/lib/supabase'

async function getUserProjects(userId: string) {
  const { data, error } = await supabase
    .from('projects')                    // Typed: keyof Database['public']['Tables']
    .select(`
      id,
      name,
      description,
      created_at,
      organization:organizations(id, name, slug)
    `)
    .eq('created_by', userId)
    .order('created_at', { ascending: false })

  if (error) throw error
  return data  // TypeScript infers the exact shape including joined data
}
```

---

## Edge Function Pattern

### `supabase/functions/send-email/index.ts`
```typescript
import { serve } from 'https://deno.land/std@0.168.0/http/server.ts'
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

serve(async (req) => {
  // Handle CORS preflight
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    // Use SERVICE_ROLE for privileged ops (bypasses RLS)
    const supabase = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '',
    )

    // Verify the caller is authenticated
    const authHeader = req.headers.get('Authorization')
    if (!authHeader) {
      return new Response(JSON.stringify({ error: 'Unauthorized' }), {
        status: 401,
        headers: corsHeaders,
      })
    }

    const { data: { user }, error: authError } = await supabase.auth.getUser(
      authHeader.replace('Bearer ', '')
    )

    if (authError || !user) {
      return new Response(JSON.stringify({ error: 'Invalid token' }), {
        status: 401,
        headers: corsHeaders,
      })
    }

    const body = await req.json() as { to: string; subject: string; html: string }

    // Call Resend or SendGrid API
    const emailRes = await fetch('https://api.resend.com/emails', {
      method: 'POST',
      headers: {
        Authorization: `Bearer ${Deno.env.get('RESEND_API_KEY')}`,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        from: 'noreply@myapp.com',
        to: body.to,
        subject: body.subject,
        html: body.html,
      }),
    })

    if (!emailRes.ok) throw new Error('Email send failed')

    return new Response(JSON.stringify({ success: true }), {
      headers: { ...corsHeaders, 'Content-Type': 'application/json' },
    })
  } catch (error) {
    return new Response(JSON.stringify({ error: (error as Error).message }), {
      status: 500,
      headers: corsHeaders,
    })
  }
})
```

---

## Auth Trigger (Auto-create Profile on Signup)

```sql
-- supabase/migrations/0003_auth_trigger.sql
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (id, username, full_name, avatar_url)
  VALUES (
    NEW.id,
    COALESCE(NEW.raw_user_meta_data ->> 'user_name', split_part(NEW.email, '@', 1)),
    COALESCE(NEW.raw_user_meta_data ->> 'full_name', NEW.raw_user_meta_data ->> 'name'),
    NEW.raw_user_meta_data ->> 'avatar_url'
  );
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Run as service role to bypass RLS during user creation
CREATE OR REPLACE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();
```

---

## Storage Bucket Configuration

```sql
-- Create buckets (run in Supabase Dashboard or via API)
INSERT INTO storage.buckets (id, name, public)
VALUES
  ('avatars', 'avatars', true),        -- Public: profile pictures
  ('documents', 'documents', false);   -- Private: user documents

-- RLS for storage.objects
CREATE POLICY "avatar_upload_own"
  ON storage.objects FOR INSERT
  WITH CHECK (
    bucket_id = 'avatars'
    AND auth.uid()::text = (storage.foldername(name))[1]
  );

CREATE POLICY "avatar_read_public"
  ON storage.objects FOR SELECT
  USING (bucket_id = 'avatars');

CREATE POLICY "document_access_own"
  ON storage.objects FOR ALL
  USING (
    bucket_id = 'documents'
    AND auth.uid()::text = (storage.foldername(name))[1]
  );
```
