---
name: scaffold-react-app
author: "Javier Montaño (JM Labs)"
description: >
  Generate production-ready React project with TypeScript, Tailwind, testing, CI/CD. Use when user asks to "scaffold a React app".
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - Agent
---

# Scaffold React App

Generate production-ready React project with TypeScript, Tailwind, Vitest, Playwright, and GitHub Actions CI/CD — scaffolded from decisions, not defaults.

## Guiding Principle

> *"Every React project should start with tested foundations, not framework fatigue. The best scaffold is the one the team will actually maintain."*

---

## Procedure

### Step 1 — Elicit Context and Constraints

1. Ask: SPA or SSR needed? If SSR → recommend Next.js instead (defer to `scaffold-nextjs-app`).
2. Ask: What is the target deployment environment? (Vercel, S3, Docker, CDN).
3. Ask: Team size and TypeScript experience level? Determines strict-mode threshold.
4. Ask: Will this app consume a REST API, GraphQL, or BFF? Determines data-fetching library.
5. Ask: Any existing design system or Figma tokens? Determines Tailwind vs CSS Modules vs plain Tailwind + shadcn/ui.
6. Classify all answers: `[HECHO]` if confirmed, `[SUPUESTO]` if inferred from repo context.

### Step 2 — Choose Build Tooling and Baseline Stack

1. Default to **Vite 5 + React 19** — never Create React App (deprecated, ~60s slower cold start).
2. If monorepo detected (`pnpm-workspace.yaml`, `turbo.json`) → scaffold as a Turborepo app package.
3. TypeScript config: start from `tsconfig.json` strict baseline (see BoK). Relax only with documented rationale.
4. Choose state management: Zustand for local UI state, React Query / TanStack Query v5 for server state. Redux only if existing codebase or team mandate.
5. Choose router: React Router v7 (data router API) for most SPAs. TanStack Router if type-safe routing is a hard requirement.
6. Document chosen stack in `docs/ADR-001-stack-decisions.md`.

### Step 3 — Generate Project Structure and Configuration

1. Create directory tree following feature-first layout (see BoK file tree).
2. Write `vite.config.ts` with path aliases (`@/`), proxy config, and vitest inline config block.
3. Write `tsconfig.json` with `strict: true`, `paths` matching vite aliases, `noUncheckedIndexedAccess: true`.
4. Write `tailwind.config.ts` with content paths, design token extension, and dark-mode `class` strategy.
5. Write `.env.example` with all required variables; never commit `.env`. Write `src/env.ts` with Zod validation.
6. Write `eslint.config.mjs` using flat config + `@typescript-eslint/strict`, `eslint-plugin-react-hooks`, `eslint-plugin-jsx-a11y`.

### Step 4 — Set Up Testing Infrastructure

1. Configure Vitest: `vitest.config.ts` (or inline in `vite.config.ts`), `jsdom` environment, coverage with `v8` provider.
2. Install and configure `@testing-library/react`, `@testing-library/user-event`, `@testing-library/jest-dom`.
3. Write `src/test/setup.ts` with jest-dom matchers import and global cleanup.
4. Install Playwright for E2E: `playwright.config.ts` targeting Chromium + Firefox, base URL from env, screenshots on failure.
5. Write one smoke test per critical path (homepage renders, auth flow navigates, API call mocked with `msw`).
6. Configure coverage threshold: `statements: 70, branches: 65, functions: 70` minimum. Add to CI gate.

### Step 5 — Finalize CI/CD, Lint, and Handoff

1. Write `.github/workflows/ci.yml`: install → type-check → lint → unit tests + coverage → build → E2E (headless).
2. Add `husky` pre-commit hook: `lint-staged` running ESLint + Prettier on staged files only.
3. Write `Dockerfile` with multi-stage build (node:20-alpine build stage, nginx:alpine serve stage).
4. Write `README.md` with: local setup, env variables, test commands, deployment notes.
5. Run `pnpm run build` and `pnpm run test` to verify scaffold compiles and passes baseline.
6. Output final directory tree and checklist of configured items for developer handoff.

---

## Decision Framework

| Decision | Default Choice | Alternative | When to Switch |
|----------|---------------|-------------|----------------|
| Build tool | Vite 5 | Rspack / Turbopack | Build times >60s in CI at scale |
| State — local | Zustand 5 | Jotai, Recoil | Team prefers atomic model |
| State — server | TanStack Query v5 | SWR, Apollo | GraphQL-first → Apollo; simplicity → SWR |
| Routing | React Router v7 | TanStack Router | Type-safe route params required |
| Styling | Tailwind CSS v4 | CSS Modules | Design token system incompatible with Tailwind |
| Component library | shadcn/ui (headless) | Mantine, Chakra | Fully managed a11y needed out of box |
| Testing unit | Vitest + RTL | Jest + RTL | Legacy Jest suite already exists |
| Testing E2E | Playwright | Cypress | Team has existing Cypress knowledge |
| Forms | React Hook Form + Zod | Formik | Large forms with complex validation |
| Dates | date-fns | dayjs | Bundle size <3kb target |

---

## Quality Criteria

1. `pnpm run build` exits 0 with no TypeScript errors.
2. `pnpm run test` exits 0 with coverage above configured thresholds.
3. `pnpm run lint` exits 0 — no ESLint errors, no unresolved `@/` aliases.
4. All environment variables validated at startup via Zod (crash-fast with descriptive message).
5. No hardcoded strings for API base URLs, feature flags, or secrets.
6. All components have at least one RTL unit test covering primary interaction.
7. E2E smoke test covers the critical user path (login, main page, primary CTA).
8. `Dockerfile` builds a working image: `docker build -t app . && docker run -p 80:80 app`.

---

## Anti-Patterns

1. **Using Create React App** — Deprecated since 2023. Webpack-based, 10x slower HMR than Vite. No maintenance. Always use Vite.
2. **Global CSS in `index.css` for component styles** — Causes specificity wars. Use Tailwind utility classes or CSS Modules per component.
3. **Redux for every state concern** — Redux is for complex shared state with many actors. For API data, use React Query. For simple local state, `useState` or Zustand slice.
4. **Skipping TypeScript strict mode** — `strict: false` silently allows `any` propagation, defeats the purpose. Accept the initial friction.
5. **Committing `.env` files** — Use `.env.example` + runtime Zod validation. Add `.env*` to `.gitignore` from day one.

---

## When NOT to Use

- **When SSR or SEO is required** → Use `scaffold-nextjs-app` instead.
- **When the team owns a large Angular codebase** → Introducing React creates a dual-framework burden.
- **When the deliverable is a design-system-only package** → Use a raw Vite library mode scaffold, not an app scaffold.
- **When the project needs native mobile** → Use React Native (different scaffold entirely).
