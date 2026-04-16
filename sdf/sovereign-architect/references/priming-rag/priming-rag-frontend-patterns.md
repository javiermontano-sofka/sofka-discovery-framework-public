# Frontend Patterns — RAG Priming Knowledge

> Sovereign Architect · JM Labs · Knowledge Base

---

## Overview

Frontend architecture determines user experience, developer velocity, and long-term maintainability of client-facing applications. The landscape has stabilized around component-based frameworks with diverging rendering strategies. This document covers framework-agnostic patterns, rendering strategies, state management, and component design principles for senior architects evaluating or governing frontend systems.

## Core Patterns

### Rendering Strategies: SSR vs SSG vs SPA vs ISR

**SPA (Single Page Application)**: Client renders everything. Fast transitions, thick client, poor initial load and SEO. Best for authenticated dashboards, internal tools. Frameworks: React (CRA/Vite), Vue (Vite), Angular.

**SSR (Server-Side Rendering)**: Server renders HTML per request. Better SEO, faster first contentful paint, higher server cost. Best for content-heavy public sites with dynamic data. Frameworks: Next.js, Nuxt, SvelteKit, Angular Universal.

**SSG (Static Site Generation)**: HTML generated at build time. Fastest delivery via CDN, zero server cost at runtime. Best for marketing sites, documentation, blogs. Frameworks: Astro, Next.js (static export), Hugo, Eleventy.

**ISR (Incremental Static Regeneration)**: SSG with background revalidation. Pages served from cache, regenerated after TTL. Balances freshness with performance. Next.js-specific but pattern is spreading.

**Trade-off axis**: SEO need (SSR/SSG) vs interactivity (SPA) vs freshness (SSR/ISR) vs build time (SSG at scale).

### Component Patterns

**Presentational vs Container**: Presentational components receive props and render UI. Container components manage state and side effects. In hooks era, this evolves to custom hooks (logic) + components (rendering).

**Compound Components**: Parent provides context, children compose behavior. Example: `<Select>`, `<Select.Option>`, `<Select.Group>`. Enables flexible APIs without prop drilling. Used heavily in design systems.

**Render Props / Headless Components**: Component provides logic via render function or hook, consumer controls rendering. Headless UI libraries (Radix, Headless UI, TanStack Table) embody this — full behavior, zero styling. Optimal for design system flexibility.

**Atomic Design**: Atoms (button, input) compose into molecules (search bar), organisms (header), templates, pages. Provides shared vocabulary between design and engineering. Trade-off: rigid hierarchy can feel forced for some UIs.

### State Management Tiers

**Tier 1 — Local state**: `useState`, `ref()`, signals. Default choice. Lift state only when siblings need it.

**Tier 2 — Shared component state**: React Context, Vue provide/inject, Angular services. Good for theme, auth, locale — bad for frequently changing data (causes re-renders in React Context).

**Tier 3 — Client global state**: Redux Toolkit, Zustand, Pinia, NgRx, Jotai, Recoil. Needed when many disconnected components share mutable state. Zustand/Jotai for simplicity; Redux/NgRx for complex flows with middleware, devtools, time-travel debugging.

**Tier 4 — Server state**: TanStack Query (React Query), SWR, Apollo Client. Manages cache, background refetch, stale-while-revalidate, optimistic updates. Eliminates most global state needs — 80% of what was in Redux is actually server state.

**Decision**: Start with Tier 1+4. Add Tier 3 only for truly client-only state that spans the app (cart, multi-step wizard, collaborative editing).

### Framework Selection Criteria

**React**: Largest ecosystem, most jobs, most libraries. JSX flexibility. Downside: footgun-rich (useEffect pitfalls, memo complexity, server components learning curve). Best when team experience is React-heavy or ecosystem library coverage matters.

**Vue**: Gentler learning curve, excellent docs, Options API for simplicity or Composition API for power. Pinia is elegant. Smaller ecosystem than React. Best for teams with mixed experience levels.

**Angular**: Full framework with opinions (DI, RxJS, modules). TypeScript-first. Best for large enterprise teams that benefit from enforced structure. Steeper learning curve, but fewer architectural debates.

**Svelte/SvelteKit**: Compiler-based, minimal runtime, reactive by default. Smallest bundle sizes, best DX for simple-to-medium apps. Smaller ecosystem, fewer hires available. Best for performance-critical apps or teams that value simplicity.

**Astro**: Content-focused, island architecture, framework-agnostic (use React, Vue, Svelte components together). Zero JS by default with selective hydration. Best for marketing, docs, content sites.

### Micro-Frontend Patterns

**Build-time integration**: Packages published to registry, consumed as dependencies. Simple, strong typing, but coupled release cycles. Good for design systems shared across apps.

**Runtime integration (Module Federation)**: Webpack/Vite Module Federation loads remote bundles at runtime. Independent deploys, shared dependencies. Trade-off: runtime failures, version skew, complex debugging.

**iframe isolation**: Strongest isolation, weakest integration. Good for embedding third-party widgets or legacy apps. Bad for cohesive UX.

**Decision**: Avoid micro-frontends unless you have 3+ teams on the same product with different release cadences. Start with a monorepo (Nx, Turborepo) and extract only when proven necessary.

## Decision Framework

| Factor | SPA | SSR | SSG | Micro-FE |
|--------|-----|-----|-----|----------|
| SEO critical | No | Yes | Yes | Varies |
| Dynamic data | Yes | Yes | No (ISR partial) | Yes |
| Team count | 1-2 | 1-3 | 1 | 3+ |
| Infra complexity | Low | Medium | Low | High |
| Time to interactive | Slow | Fast | Fastest | Varies |
| Build time concern | No | No | Yes (at scale) | No |

## Anti-Patterns

- **Prop drilling marathon**: Passing props through 5+ levels instead of using context or state management. Signals maintenance burden and missing abstraction.
- **useEffect as event handler**: React-specific but common. Effects are for synchronization, not for responding to user actions. Leads to race conditions and stale closures.
- **Global state for server data**: Storing API responses in Redux/Vuex instead of using a server state library. Results in manual cache invalidation, stale data, and loading state boilerplate.
- **CSS-in-JS at scale without extraction**: Runtime CSS-in-JS (styled-components, Emotion) adds JS bundle size and runtime cost. At scale, prefer zero-runtime solutions (Tailwind, vanilla-extract, Panda CSS) or build-time extraction.

## Evidence Signals

- `package.json` dependencies reveal framework, state management, and rendering strategy.
- `next.config.js` / `nuxt.config.ts` / `svelte.config.js` indicate SSR/SSG framework.
- `getServerSideProps` / `getStaticProps` / `loader` functions indicate rendering strategy per route.
- `@reduxjs/toolkit`, `zustand`, `pinia`, `@ngrx/store` in dependencies indicate state management tier.
- `moduleFederationPlugin` in webpack/vite config signals micro-frontend architecture.
- Component file count vs lines-of-code ratio: healthy components average 50-150 lines. Files over 500 lines suggest missing decomposition.

---
*Sovereign Architect RAG Priming · JM Labs*
