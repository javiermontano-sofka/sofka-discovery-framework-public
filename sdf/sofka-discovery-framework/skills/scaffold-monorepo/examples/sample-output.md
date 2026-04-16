# Sample Output: SaaS Monorepo Scaffold

## Tooling Decision

**Chosen: Turborepo v2** [INFERENCIA — based on JS/TS-only stack, Vercel hosting likely]

Rationale:
- Team is React/Next.js focused — no code generation needs at this stage.
- Vercel hosting enables free Turbo remote cache integration.
- Simpler mental model than Nx for a team of 3-8 developers.
- Can migrate to Nx later if generators become necessary.

---

## Directory Structure

```
my-saas/
├── apps/
│   ├── web/                     # Next.js 14 App Router
│   │   ├── app/
│   │   ├── package.json         { "name": "@myrepo/web" }
│   │   └── tsconfig.json
│   └── api/                     # Fastify API
│       ├── src/
│       ├── package.json         { "name": "@myrepo/api" }
│       └── tsconfig.json
├── packages/
│   ├── ui/                      # Shared React components
│   │   ├── src/
│   │   │   ├── Button.tsx
│   │   │   ├── Input.tsx
│   │   │   └── index.ts
│   │   └── package.json         { "name": "@myrepo/ui" }
│   ├── types/                   # Zero-runtime shared types
│   │   ├── src/
│   │   │   └── index.ts
│   │   └── package.json         { "name": "@myrepo/types" }
│   ├── utils/                   # Shared utilities
│   │   ├── src/
│   │   └── package.json         { "name": "@myrepo/utils" }
│   └── config/                  # Shared tooling configs
│       ├── eslint/index.js
│       ├── tsconfig/base.json
│       ├── tsconfig/nextjs.json
│       ├── tsconfig/library.json
│       └── package.json         { "name": "@myrepo/config" }
├── .changeset/
│   └── config.json
├── .github/
│   └── workflows/
│       ├── ci.yml
│       └── release.yml
├── pnpm-workspace.yaml
├── package.json                  # Root
├── turbo.json
└── tsconfig.base.json
```

---

## Generated `pnpm-workspace.yaml`

```yaml
packages:
  - 'apps/*'
  - 'packages/*'
```

---

## Generated Root `package.json`

```json
{
  "name": "my-saas",
  "private": true,
  "engines": {
    "node": ">=20",
    "pnpm": ">=9"
  },
  "scripts": {
    "build": "turbo build",
    "dev": "turbo dev",
    "test": "turbo test",
    "lint": "turbo lint",
    "typecheck": "turbo typecheck",
    "clean": "turbo clean && find . -name node_modules -type d -maxdepth 3 | xargs rm -rf"
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

## Generated `turbo.json`

```json
{
  "$schema": "https://turbo.build/schema.json",
  "globalEnv": ["NODE_ENV", "VERCEL_ENV"],
  "remoteCache": {
    "enabled": true
  },
  "tasks": {
    "build": {
      "dependsOn": ["^build"],
      "outputs": [".next/**", "!.next/cache/**", "dist/**"],
      "env": ["NEXT_PUBLIC_*", "DATABASE_URL"]
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
    "lint": {
      "outputs": []
    },
    "typecheck": {
      "dependsOn": ["^typecheck"],
      "outputs": []
    },
    "clean": {
      "cache": false
    }
  }
}
```

---

## Generated `packages/types/package.json`

```json
{
  "name": "@myrepo/types",
  "version": "0.0.1",
  "private": false,
  "description": "Shared TypeScript types — zero runtime",
  "main": "./src/index.ts",
  "types": "./src/index.ts",
  "exports": {
    ".": {
      "import": "./src/index.ts",
      "default": "./src/index.ts"
    }
  },
  "scripts": {
    "typecheck": "tsc --noEmit",
    "clean": "rm -rf dist"
  },
  "devDependencies": {
    "@myrepo/config": "workspace:^",
    "typescript": "^5.4.0"
  }
}
```

---

## Generated `tsconfig.base.json`

```json
{
  "$schema": "https://json.schemastore.org/tsconfig",
  "compilerOptions": {
    "target": "ES2022",
    "lib": ["ES2022"],
    "module": "ESNext",
    "moduleResolution": "bundler",
    "resolveJsonModule": true,
    "strict": true,
    "noUncheckedIndexedAccess": true,
    "exactOptionalPropertyTypes": true,
    "skipLibCheck": true,
    "paths": {
      "@myrepo/types": ["./packages/types/src/index.ts"],
      "@myrepo/ui": ["./packages/ui/src/index.ts"],
      "@myrepo/utils": ["./packages/utils/src/index.ts"]
    }
  }
}
```

---

## Generated `.github/workflows/ci.yml`

```yaml
name: CI
on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  ci:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 2

      - uses: pnpm/action-setup@v4
        with:
          version: 9

      - uses: actions/setup-node@v4
        with:
          node-version: '20'
          cache: 'pnpm'

      - run: pnpm install --frozen-lockfile

      - name: Cache Turbo
        uses: actions/cache@v4
        with:
          path: .turbo
          key: ${{ runner.os }}-turbo-${{ github.sha }}
          restore-keys: |
            ${{ runner.os }}-turbo-

      - run: pnpm turbo build typecheck lint test
        env:
          TURBO_TOKEN: ${{ secrets.TURBO_TOKEN }}
          TURBO_TEAM: ${{ vars.TURBO_TEAM }}
```

---

## Quality Gate Checklist

- [x] `packageManager` field in root package.json — Corepack enforces pnpm 9.0.0
- [x] `private: true` in root package.json — No accidental publish of root
- [x] `dependsOn: ["^build"]` in turbo build — Dependency order respected
- [x] `frozen-lockfile` in CI — No silent lockfile mutations
- [x] Remote cache configured — TURBO_TOKEN env var reference in CI
- [x] `types` package has zero runtime imports — Pure TypeScript interfaces
- [x] Path aliases in tsconfig.base.json — Type-safe cross-package imports
- [x] `dev: { cache: false, persistent: true }` — Dev servers not cached

---

## Next Steps

1. Configure Vercel Turbo remote cache: `npx turbo login` → get `TURBO_TOKEN`.
2. Add `TURBO_TOKEN` and `TURBO_TEAM` to GitHub repository secrets.
3. Run `pnpm install` and verify workspace resolution: `pnpm list -r`.
4. Create first changeset: `pnpm changeset` → select packages → commit.
5. Validate CI: push a branch and verify only affected packages rebuild.
