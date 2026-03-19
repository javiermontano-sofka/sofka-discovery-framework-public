# Priming-RAG: React Ecosystem 2026
> Sovereign Architect — React ecosystem knowledge for RAG consumption
> Generated: 2026-03-18 | Version: v1.0

---

## Executive Summary
- React 19 is stable with Server Components as first-class feature [HECHO]
- React Compiler (formerly React Forget) auto-memoizes components [HECHO]
- Next.js 15 is the primary full-stack React framework [HECHO]
- Server Actions replace API routes for mutations [HECHO]
- Concurrent features (Suspense, transitions) are production-ready [HECHO]

## Key Patterns

### Server Components (RSC)
- Default in App Router: components are server by default [HECHO]
- Add 'use client' directive only when using hooks, browser APIs, or event handlers [HECHO]
- Server Components can fetch data directly (no useEffect, no client fetching) [HECHO]
- Can import Client Components but not vice versa [HECHO]
- Serialization boundary: only serializable props cross server→client [HECHO]

### React Compiler
- Automatically memoizes components and values [HECHO]
- Eliminates need for useMemo, useCallback, React.memo in most cases [HECHO]
- Requires stable code patterns (no mutations during render) [HECHO]
- Opt-in per file or project-wide [HECHO]

### State Management 2026
- Server state: React Query / SWR for caching + revalidation [HECHO]
- Client state: Zustand (simple), Jotai (atomic), Redux Toolkit (complex) [HECHO]
- URL state: nuqs for type-safe URL search params [HECHO]
- Form state: react-hook-form + zod for validation [HECHO]

### Next.js 15 App Router
- Layouts, loading, error, not-found as file conventions [HECHO]
- Server Actions with 'use server' for mutations [HECHO]
- Parallel and intercepting routes for complex UIs [HECHO]
- Turbopack as default bundler (faster than Webpack) [HECHO]

## Anti-Patterns
- Using 'use client' on every component (defeats RSC benefits) [HECHO]
- Fetching data in useEffect when Server Components can do it [HECHO]
- Over-memoizing with React Compiler enabled [HECHO]
- Prop drilling when URL state or context suffices [HECHO]

## Query Hooks
- "Server or Client Component?" → Server unless using hooks/browser APIs/events
- "Best state management for React?" → Zustand for simple, React Query for server state
- "Next.js Pages Router vs App Router?" → App Router for new projects (RSC, streaming)
