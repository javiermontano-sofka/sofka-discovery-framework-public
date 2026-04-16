# Use Case Prompts — Scaffold Monorepo

## Scenario 1: New Full-Stack Monorepo (Next.js + API + Shared)

```
Scaffold a new monorepo for a SaaS product with a Next.js frontend,
a Node.js/Fastify API, and shared packages for types and UI components.

Requirements:
- pnpm workspaces
- Turborepo for task orchestration
- Shared TypeScript types package
- Shared UI component library (React)
- Shared ESLint and TypeScript configs
- GitHub Actions CI with remote caching
- Changesets for versioning

Deliver:
1. Directory structure tree
2. Root package.json with packageManager field
3. pnpm-workspace.yaml
4. turbo.json pipeline configuration
5. packages/types/package.json
6. tsconfig.base.json
7. GitHub Actions CI workflow
8. .changeset/config.json
```

## Scenario 2: Migrate from Polyrepo to Monorepo

```
Plan migration of 3 separate repositories into a Turborepo monorepo:
- frontend-app (Next.js, 15k LOC)
- backend-api (Express, 8k LOC)
- shared-components (React library, published to npm)

Current state:
- Separate git repos with no shared code
- components library published to npm, used by frontend-app
- Type duplication between frontend and backend

Migration approach:
- Preserve git history (git subtree / git filter-repo)
- Maintain npm publishing for shared-components
- Eliminate type duplication

Deliver:
1. Migration strategy (big-bang vs incremental)
2. git history preservation commands
3. Proposed workspace structure
4. turbo.json for migrated pipeline
5. Breaking changes and risk assessment
```

## Scenario 3: Audit Existing Monorepo

```
Audit the existing monorepo configuration for performance and correctness.

Current state (read from repository):
- Check for: circular dependencies, missing outputs in turbo.json,
  phantom dependencies, cross-app imports, missing remote cache config

Evaluate:
- turbo.json or nx.json configuration
- package.json files across packages
- CI workflow efficiency
- Dependency graph correctness

Deliver:
1. Circular dependency map (if any)
2. Missing cache outputs analysis
3. Phantom dependency report
4. CI build time optimization opportunities
5. Remediation roadmap with effort estimates
```

## Scenario 4: Add Nx Generators for New Package Creation

```
Set up Nx code generators so developers can scaffold new packages
consistently with a single command instead of copying boilerplate.

Requirements:
- Generator for new React library package
- Generator for new Node.js API feature module
- Enforce naming conventions and directory structure
- Auto-register in workspace configuration

Deliver:
1. Nx generator configuration
2. Template files for React library
3. Template files for Node.js module
4. Usage documentation
5. Integration with existing CI
```

## Scenario 5: Optimize CI Build Times

```
The monorepo CI currently takes 18 minutes for every PR, regardless of
what changed. Analyze and optimize to achieve < 5 minutes for typical PRs.

Current state:
- GitHub Actions, runs all tasks on every push
- turbo.json without remote cache configured
- 12 packages total, only 1-3 change per PR typically
- No --filter or affected detection

Deliver:
1. Current vs optimized build time analysis
2. Remote cache configuration (Vercel Turbo or self-hosted)
3. GitHub Actions workflow with Turborepo remote cache
4. Affected package detection strategy
5. Expected build time per scenario (frontend-only, backend-only, shared package change)
```
