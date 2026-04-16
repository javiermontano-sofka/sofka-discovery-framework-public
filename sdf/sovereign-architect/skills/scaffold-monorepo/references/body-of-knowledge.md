# Body of Knowledge: Scaffold Monorepo

## Core Concepts

### Why Monorepo vs. Polyrepo

**Monorepo advantages**:
- Atomic commits spanning multiple packages (API type change + client update in one commit).
- Single `node_modules` hoist reduces install time and disk usage.
- Shared tooling (ESLint, TypeScript, Prettier) configured once.
- Easier refactoring across package boundaries — one PR, one review.

**Monorepo trade-offs**:
- CI must be smart about what changed (don't rebuild everything on every commit).
- Access control granularity requires CODEOWNERS and branch protection rules.
- Initial setup cost is higher than polyrepo.

**When to stay polyrepo**:
- Teams with very different tech stacks (Python backend, React frontend, Go microservice).
- Security requirements mandating separate repositories.
- Very large repos (> 100k files) where tooling performance degrades.

### Task Graph and Caching

Turborepo and Nx model the build process as a directed acyclic graph (DAG):

```
packages/types → packages/ui → apps/web
packages/types → packages/utils → apps/api
```

A change in `packages/types` invalidates cache for all downstream packages.
A change in `apps/web` only invalidates `apps/web`.

**Remote caching** stores task outputs in cloud storage. On CI, if the task
inputs haven't changed (hashed), the output is downloaded instead of recomputed.
Result: a monorepo with 20 packages can have CI times comparable to a polyrepo
for typical PR changes.

### Package Manager Workspace Resolution

```
pnpm-workspace.yaml → pnpm finds packages listed in globs
                     → hoists shared deps to root node_modules
                     → creates symlinks for workspace packages
```

`workspace:^` protocol in `package.json`:
```json
{
  "dependencies": {
    "@myrepo/types": "workspace:^"
  }
}
```
This resolves to the local package during development. Changesets replaces
`workspace:^` with the actual published version during release.

### Turborepo Pipeline Semantics

```json
{
  "tasks": {
    "build": {
      "dependsOn": ["^build"],   // ^ means "all upstream packages must build first"
      "outputs": ["dist/**"]     // What to cache (relative to package root)
    },
    "test": {
      "dependsOn": ["build"],    // No ^: only THIS package's build, not upstream
      "outputs": ["coverage/**"]
    },
    "dev": {
      "cache": false,            // Never cache dev server
      "persistent": true         // Long-running task
    }
  }
}
```

### Nx vs Turborepo Deep Comparison

**Nx** uses a project graph that tracks actual imports:
```bash
nx affected --target=build  # Only builds packages affected by changed files
nx graph                     # Visual dependency graph in browser
nx generate @nx/react:app    # Code generators for consistent scaffolding
```

**Turborepo** uses file hashing:
```bash
turbo build --filter=...[HEAD^1]  # Build packages changed since last commit
turbo build --filter=apps/web...  # Build web and all its dependencies
```

### Shared Configs Pattern

```
packages/config/
├── eslint-config/
│   ├── package.json         { "name": "@myrepo/eslint-config" }
│   ├── index.js             module.exports = { extends: ['...'] }
│   └── react.js             React-specific config
├── tsconfig/
│   ├── package.json         { "name": "@myrepo/tsconfig" }
│   ├── base.json
│   ├── nextjs.json
│   └── react-library.json
└── tailwind/
    ├── package.json         { "name": "@myrepo/tailwind-config" }
    └── index.js
```

Usage in app:
```json
// apps/web/tsconfig.json
{
  "extends": "@myrepo/tsconfig/nextjs.json",
  "compilerOptions": {
    "outDir": "dist"
  }
}
```

### Changesets Workflow

```
Developer flow:
1. Make changes across packages
2. pnpm changeset                     → Select changed packages + bump type (major/minor/patch)
3. Git commit with changeset file      → .changeset/random-name.md committed

Release flow (CI on main branch):
1. changesets/action detects changeset files
2. Creates "Version Packages" PR with bumped versions
3. Developer merges Version PR
4. CI publishes to npm registry
```

### Independent vs. Fixed Versioning

| Strategy | Best For | Tool Config |
|----------|---------|-------------|
| Fixed (lockstep) | Apps (all packages same version) | `"fixed": [["@myrepo/*"]]` in changeset config |
| Independent | Libraries (each package own version) | Default changeset behavior |

## Common Patterns

### Shared UI Library (Storybook)

```
packages/ui/
├── src/
│   ├── Button.tsx
│   ├── Input.tsx
│   └── index.ts       # Barrel export
├── .storybook/
├── package.json
└── tsconfig.json
```

Consumer app imports:
```typescript
import { Button, Input } from '@myrepo/ui';
```

### Cross-Package Type Safety

With `"moduleResolution": "bundler"` in tsconfig and path aliases, TypeScript
resolves `@myrepo/types` directly to the source TypeScript files during development.
No build step needed for type checking — changes are immediately reflected.

## References

- [Turborepo Documentation](https://turbo.build/repo/docs)
- [Nx Documentation](https://nx.dev/getting-started/intro)
- [Changesets](https://github.com/changesets/changesets)
- [pnpm Workspaces](https://pnpm.io/workspaces)
