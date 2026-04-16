# Implementation Planning — Body of Knowledge

## Core Concepts
- **Phase decomposition**: Break work into units where each phase produces a testable, deployable, and rollback-able increment. Phases that cannot be independently verified are too large
- **Critical path identification**: The longest sequential chain of dependent tasks determines the minimum timeline. Parallelization only helps tasks off the critical path
- **Blast radius containment**: Each phase should limit the scope of potential failure. If Phase 3 fails, it should not corrupt the outputs of Phases 1 and 2
- **Entry/exit criteria**: Every phase boundary needs explicit conditions — what must be true before starting (entry) and what must be true before declaring completion (exit)
- **Rollback cost asymmetry**: Database migrations, API contract changes, and data format changes are expensive to reverse. Plan these with extra caution and backward compatibility
- **File change specificity**: "Update the auth module" is not a plan. `src/auth/middleware.ts` line 45 — add JWT validation before route handler" is a plan
- **Checkpoint validation**: Automated checks at phase boundaries (tests pass, build succeeds, no regression) catch drift before it compounds

## Patterns & Practices
- **Expand-contract migration**: For breaking changes, first expand (add new alongside old), then migrate consumers, then contract (remove old). Enables zero-downtime transitions
- **Feature flag gating**: Deploy code dark behind flags, validate in production with synthetic traffic, then progressively enable for real users
- **Parallel workstream identification**: Map dependencies to find tasks that different team members can execute simultaneously without blocking each other
- **Canary deployment phasing**: Roll out to 1% of traffic, validate metrics, expand to 10%, validate again, then full rollout. Each step is a rollback checkpoint
- **Database migration safety**: Separate schema migration (additive only) from data migration (backfill) from cleanup (drop old columns). Never combine in one deployment
- **Dependency-ordered execution**: Changes to shared libraries and data schemas must be deployed before the services that consume them

## Tools & Technologies
- **Project tracking**: Linear, Jira, GitHub Projects for phase and task tracking with dependency visualization
- **Feature flags**: LaunchDarkly, Unleash, Flagsmith, or simple environment-variable flags for smaller systems
- **Migration tooling**: Flyway, Liquibase, Prisma Migrate, Alembic (Python) for versioned database schema changes
- **Deployment orchestration**: ArgoCD, Flux for GitOps-based progressive rollouts; Kubernetes rollout strategies for canary/blue-green
- **Validation**: k6, Artillery for load testing at phase boundaries; Playwright, Cypress for E2E regression checks

## References
- "Release It!" — Michael Nygard (stability patterns, deployment strategies, rollback planning)
- "Continuous Delivery" — Humble & Farley (deployment pipelines, feature toggles, expand-contract)
- "An Elegant Puzzle" — Will Larson (organizational planning, team sizing, critical path management)
- Martin Fowler's bliki — Expand-contract pattern, feature toggles, evolutionary database design
