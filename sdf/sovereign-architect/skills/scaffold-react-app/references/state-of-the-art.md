# State of the Art — Scaffold React App (2025-2026)

## Latest Versions and Key Features

| Tool | Version | Key Change |
|------|---------|-----------|
| React | 19.0 | Actions, `use()` hook, Server Components in RSC-enabled tools, compiler |
| Vite | 5.4 | Rollup 4, Environment API, faster cold start |
| TypeScript | 5.5 | Inferred type predicates, `--isolatedDeclarations` |
| TanStack Query | 5.56 | Simplified API, `skipToken`, `queryOptions()` helper |
| Zustand | 5.0 | React 19 `useSyncExternalStore` migration, `useShallow` built-in |
| React Router | 7.0 | Full-stack mode, Vite plugin, framework mode (replaces Remix) |
| Tailwind CSS | 4.0 | Oxide engine (Rust-based), CSS-first config, 5x faster builds |
| Vitest | 2.0 | Browser mode, improved coverage, parallel sharding |
| Playwright | 1.45 | UI mode improvements, trace viewer, component testing |
| shadcn/ui | 2.0 | New component registry, `npx shadcn add`, Tailwind v4 support |

---

## Emerging Patterns (2025)

### React Compiler (Auto-memoization)
React 19 ships with the React Compiler (formerly React Forget). It automatically inserts `useMemo` and `useCallback` where beneficial. **Impact**: You no longer need manual memoization for most components. Stop writing `useMemo(() => expensiveCalc(), [dep])` as a reflex.

### TanStack Start and Server Functions
TanStack Router v1 now includes TanStack Start — a full-stack framework with server functions (type-safe RPC). Growing alternative to Next.js for teams wanting React Router's DX with full-stack capabilities.

### Zod v4
Zod is releasing v4 in 2025 with a new `z.transform()` API, improved error formatting, and ~2x faster parsing. Plan migrations. Key breaking change: `z.string().email()` error messages are localized.

### `use()` Hook for Promises
React 19 introduces `use(promise)` which can suspend in render. Combined with Suspense boundaries, this replaces `useEffect` + state for data loading in RSC-compatible apps.

### CSS-in-JS Decline
Styled-components and Emotion are declining due to React Server Components incompatibility (runtime CSS-in-JS requires client). Migration path: Tailwind CSS, CSS Modules, or zero-runtime solutions (Linaria, Vanilla Extract).

---

## Community Trends

- **Bun as package manager** — Teams adopting `bun install` for speed. `bun.lockb` in ~15% of new projects. Consider if team is comfortable with ecosystem trade-offs.
- **pnpm as default** — pnpm remains the enterprise monorepo standard for workspace protocol and disk efficiency.
- **shadcn/ui dominance** — Copy-paste component pattern has won. Radix UI primitives + Tailwind is the dominant headless component strategy.
- **React Query for everything** — Redux Toolkit usage declining by ~40% in new projects per NPM trends 2024. TanStack Query fills the server-state void.
- **Biome over ESLint + Prettier** — Biome (Rust-based linter+formatter) is gaining traction for its speed. Not fully ESLint-compatible yet, watch for 2026 adoption.

---

## What is Deprecated / Declining

| Tool | Status | Migration |
|------|--------|-----------|
| Create React App | Dead — no maintenance | Migrate to Vite |
| Webpack (standalone) | Declining | Vite for new projects; keep for legacy |
| Redux (classic) | Maintained but declining | Redux Toolkit if staying; Zustand for new |
| styled-components / Emotion | Declining (RSC incompatible) | Tailwind + CSS Modules |
| class-based components | Legacy | Functional components only |
| `componentDidMount` pattern | Legacy | `useEffect` with proper cleanup |
| `React.FC<>` type annotation | Discouraged | Use `function Component(props: Props)` directly |
| `defaultProps` | Removed in React 19 | Default parameter values |
| `PropTypes` | Unnecessary with TypeScript | TypeScript types only |
| Moment.js | Deprecated by authors | date-fns or Temporal API |
| `enzyme` | Unmaintained | React Testing Library |
