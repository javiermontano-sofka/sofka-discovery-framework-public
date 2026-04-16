---
name: scaffold-monorepo
author: "Javier Montaño (JM Labs)"
version: "2.0.0"
description: >
  Scaffold a production monorepo: Nx vs Turborepo decision, workspace structure,
  shared packages, CI matrix builds, versioning strategy (fixed vs. independent),
  and dependency graph visualization.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - Agent
tags: [monorepo, nx, turborepo, pnpm-workspaces, ci-matrix, versioning, changesets]
---

# Scaffold Monorepo

> *"A monorepo is an organizational decision before it's a tooling decision — get the ownership model right first."*

## TL;DR

Five-step procedure to scaffold a monorepo with correct workspace tooling, shared
package conventions, CI matrix strategy, and version management — with an explicit
Nx vs Turborepo decision framework based on team size and ecosystem fit.

---

## Step 1 — Discover Requirements & Decide Tooling

### Discovery Questions

1. How many apps and packages will exist at launch vs. 12 months?
2. Is the team primarily a React/Next.js shop, or polyglot (Go, Python coexisting)?
3. Is caching across CI machines a budget priority?
4. Does the team need code generation, scaffolding, and migration tooling?
5. Existing CI platform: GitHub Actions, GitLab, CircleCI?

### Decision Framework: Nx vs Turborepo

| Criterion | Choose Nx | Choose Turborepo |
|-----------|-----------|-----------------|
| Codebase size | Large (20+ packages) | Any size |
| Code generation needs | Yes (generators) | No |
| Angular or Nest.js present | Yes | No |
| Distributed task execution | Yes (Nx Cloud) | Yes (Vercel Remote Cache) |
| Learning curve tolerance | Medium | Low |
| Plugin ecosystem depth | High | Growing |
| Full repo visualization | Yes (graph command) | Limited |
| Independent version per package | Yes | Yes (via Changesets) |

**Lean toward Nx** when: multiple app types, need generators, enterprise scale.
**Lean toward Turborepo** when: mostly JS/TS, simpler mental model preferred, Vercel hosting.

---

## Step 2 — Workspace Structure

### Recommended Layout

```
my-monorepo/
├── apps/
│   ├── web/                  # Next.js / React app
│   ├── api/                  # Express / Fastify / NestJS API
│   └── mobile/               # React Native / Expo
├── packages/
│   ├── ui/                   # Shared component library
│   ├── types/                # Shared TypeScript types (no runtime)
│   ├── utils/                # Shared utility functions
│   ├── config/               # Shared configs (ESLint, tsconfig, tailwind)
│   └── database/             # Prisma schema + generated client
├── tools/
│   └── scripts/              # Repo-wide automation scripts
├── .changeset/               # Changesets for versioning
├── pnpm-workspace.yaml
├── package.json              # Root — devDependencies only
├── turbo.json OR nx.json
└── tsconfig.base.json
```

### `pnpm-workspace.yaml`

```yaml
packages:
  - 'apps/*'
  - 'packages/*'
  - 'tools/*'
```

### Root `package.json`

```json
{
  "name": "my-monorepo",
  "private": true,
  "engines": { "node": ">=20", "pnpm": ">=9" },
  "scripts": {
    "build": "turbo build",
    "dev": "turbo dev",
    "test": "turbo test",
    "lint": "turbo lint",
    "typecheck": "turbo typecheck",
    "clean": "turbo clean && rm -rf node_modules"
  },
  "devDependencies": {
    "turbo": "^2.0.0",
    "@changesets/cli": "^2.27.0",
    "typescript": "^5.4.0"
  },
  "packageManager": "pnpm@9.0.0"
}
```

---

## Step 3 — Shared Packages

### `packages/types` — Zero-runtime shared types

```typescript
// packages/types/src/index.ts
export interface User {
  id: string;
  email: string;
  createdAt: Date;
}

export interface ApiResponse<T> {
  data: T;
  error?: string;
  meta?: { page: number; total: number };
}
```

```json
// packages/types/package.json
{
  "name": "@myrepo/types",
  "version": "0.0.1",
  "main": "./src/index.ts",
  "types": "./src/index.ts",
  "exports": {
    ".": { "import": "./src/index.ts" }
  },
  "scripts": {
    "typecheck": "tsc --noEmit"
  }
}
```

### Shared `tsconfig.base.json`

```json
{
  "compilerOptions": {
    "target": "ES2022",
    "module": "ESNext",
    "moduleResolution": "bundler",
    "strict": true,
    "noUncheckedIndexedAccess": true,
    "exactOptionalPropertyTypes": true,
    "paths": {
      "@myrepo/types": ["./packages/types/src/index.ts"],
      "@myrepo/utils": ["./packages/utils/src/index.ts"],
      "@myrepo/ui": ["./packages/ui/src/index.ts"]
    }
  }
}
```

### `turbo.json` — Pipeline Configuration

```json
{
  "$schema": "https://turbo.build/schema.json",
  "globalEnv": ["NODE_ENV", "DATABASE_URL"],
  "tasks": {
    "build": {
      "dependsOn": ["^build"],
      "outputs": [".next/**", "dist/**", "!dist/cache/**"],
      "env": ["NEXT_PUBLIC_*"]
    },
    "dev": {
      "cache": false,
      "persistent": true
    },
    "test": {
      "dependsOn": ["^build"],
      "outputs": ["coverage/**"],
      "env": ["DATABASE_URL_TEST"]
    },
    "lint": { "outputs": [] },
    "typecheck": { "dependsOn": ["^typecheck"], "outputs": [] },
    "clean": { "cache": false }
  }
}
```

---

## Step 4 — CI Matrix Strategy

```yaml
# .github/workflows/ci.yml
name: CI
on:
  push:
    branches: [main]
  pull_request:

jobs:
  build-and-test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with: { fetch-depth: 2 }
      - uses: pnpm/action-setup@v4
        with: { version: 9 }
      - uses: actions/setup-node@v4
        with:
          node-version: '20'
          cache: 'pnpm'
      - run: pnpm install --frozen-lockfile
      - name: Restore Turbo Cache
        uses: actions/cache@v4
        with:
          path: .turbo
          key: ${{ runner.os }}-turbo-${{ github.sha }}
          restore-keys: |
            ${{ runner.os }}-turbo-
      - run: pnpm turbo build test lint typecheck
        env:
          TURBO_TOKEN: ${{ secrets.TURBO_TOKEN }}
          TURBO_TEAM: ${{ vars.TURBO_TEAM }}
```

---

## Step 5 — Versioning Strategy

### Changesets Setup (Recommended for libraries)

```bash
pnpm add -D @changesets/cli -w
pnpm changeset init
```

```json
// .changeset/config.json
{
  "changelog": "@changesets/cli/changelog",
  "commit": false,
  "linked": [],
  "access": "restricted",
  "baseBranch": "main",
  "updateInternalDependencies": "patch",
  "ignore": ["@myrepo/config"]
}
```

### Release Workflow

```yaml
# .github/workflows/release.yml
name: Release
on:
  push:
    branches: [main]
jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: pnpm/action-setup@v4
      - uses: actions/setup-node@v4
        with: { node-version: '20', cache: 'pnpm' }
      - run: pnpm install --frozen-lockfile
      - uses: changesets/action@v1
        with:
          publish: pnpm changeset publish
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          NPM_TOKEN: ${{ secrets.NPM_TOKEN }}
```

---

## Quality Criteria

1. **`^build` dependency in turbo** — Packages build in dependency order, never stale outputs.
2. **`packageManager` field in root `package.json`** — Enforces consistent package manager version.
3. **`--frozen-lockfile` in CI** — Prevents silent lockfile mutations in CI.
4. **Shared `tsconfig.base.json`** — All packages inherit base config; no per-package duplication.
5. **`private: true` in package root** — Prevents accidental publish of root workspace.
6. **No cross-app imports** — Apps can import from `packages/*`, never from other apps.
7. **Changeset per PR** — Version bumps are intentional and documented.
8. **Turbo remote cache configured** — CI build times proportional to change surface, not repo size.

---

## Anti-Patterns

- **Circular dependencies between packages** — `packages/ui` importing from `packages/database` while `packages/database` imports types from `packages/ui` deadlocks the build graph.
- **`workspace:*` version without resolution** — Publishing packages with unresolved `workspace:*` versions breaks consumers outside the monorepo.
- **Putting devtools in `packages/` as a publishable package** — Config-only packages (ESLint config, tsconfig) belong in `packages/config`, not as publishable packages.
- **Missing `outputs` in `turbo.json`** — Turbo doesn't know what to cache; every task re-runs on cache hit.
- **App-to-app imports** — `apps/web` importing from `apps/api` creates tight coupling; share through `packages/` instead.
- **Hoisting all deps to root without isolation** — Phantom dependencies: packages can use deps they didn't declare. Use strict hoisting rules in `.npmrc`.
