# Developer Experience Patterns — RAG Priming Knowledge

> Sovereign Architect · JM Labs · Knowledge Base

---

## Overview

Developer experience (DX) directly impacts engineering velocity, talent retention, and code quality. A senior architect must design not only the system but also the environment in which developers build, test, debug, and deploy that system. Poor DX compounds daily — every minute of friction per developer multiplied by team size and working days creates significant productivity loss. This document covers local development, onboarding, tooling, documentation, and developer portal patterns.

## Core Patterns

### Local Development Environment

**Containerized local dev**: Docker Compose for infrastructure dependencies (database, cache, message broker, search). Application runs natively for fast iteration with hot reload. Compose profiles for optional services (`docker compose --profile monitoring up`). Trade-off: Docker resource usage on developer machines.

**Dev containers**: VS Code Dev Containers or GitHub Codespaces provide fully configured, reproducible development environments in containers. Eliminates works-on-my-machine issues. Best for complex setups (multiple runtimes, OS-specific dependencies) or onboarding acceleration.

**Service mocking**: For microservice architectures, mock downstream services using WireMock, Prism (from OpenAPI specs), or recorded fixtures. Developers should be able to run and test their service without starting the entire platform. Contract tests verify mocks match reality.

**Environment parity**: Local, staging, and production must use the same database engine, cache engine, and message broker. Running PostgreSQL locally but SQLite in tests creates false confidence. Testcontainers library spins up real databases in Docker for tests.

**Key rule**: Time from `git clone` to running application < 15 minutes. If it takes longer, the setup is a bottleneck.

### Developer Onboarding

**30-60-90 plan**: Day 1: environment setup, first commit (trivial change to verify pipeline). Week 1: first meaningful PR merged. Month 1: independently delivering features. Month 3: mentoring new team members on their area.

**Automated setup scripts**: `make setup` or `./scripts/setup.sh` that installs dependencies, configures environment, seeds databases, and verifies the setup works. Detect the OS and adjust accordingly. Test setup scripts in CI (fresh environment) to prevent rot.

**Architecture Decision Records (ADRs)**: Lightweight documents (1-2 pages) recording architectural decisions, context, options considered, and rationale. Stored in `docs/adr/` or `docs/decisions/`. New developers read ADRs to understand why the system is built the way it is, not just how.

**Codebase tour**: A guided walkthrough document or script that highlights key directories, entry points, critical modules, and common modification patterns. More effective than comprehensive documentation because it prioritizes what developers need first.

### Tooling & Automation

**Monorepo tooling**: Nx, Turborepo, or Bazel for multi-project repositories. Benefits: shared dependencies, atomic cross-project changes, affected-only builds/tests. Nx provides dependency graph visualization, computation caching, and distributed task execution.

**Code generation**: Generate boilerplate from templates (Plop, Hygen, Yeoman, custom scripts). New service scaffold, new API endpoint, new component with tests — reduce repetitive work and enforce patterns. Generated code follows team conventions automatically.

**Git hooks**: Husky + lint-staged (Node.js), pre-commit (Python), or lefthook (polyglot) for pre-commit checks. Run linting, formatting, and secret detection on staged files only (fast). Pre-push hooks for type checking or unit tests. Trade-off: hooks that take > 5 seconds frustrate developers.

**Task runners**: Makefile, Just, or Taskfile.yml for common operations. `make test`, `make build`, `make deploy-staging`. Consistent interface regardless of underlying tools. Self-documenting — `make help` lists available commands.

**IDE configuration**: Shared `.vscode/settings.json`, `.editorconfig`, ESLint/Prettier configs, and recommended extensions (`.vscode/extensions.json`). Ensures consistent formatting, linting, and debugging experience across the team. JetBrains: shared `.idea/` run configurations (exclude user-specific files via `.gitignore`).

### Documentation Strategy

**Documentation tiers**: Tier 1 (code as documentation): self-explanatory naming, types as documentation, tests as specification. Tier 2 (inline documentation): JSDoc/docstrings for public APIs, complex algorithms, and non-obvious decisions. Tier 3 (prose documentation): architecture overview, ADRs, runbooks, API guides.

**Docs-as-code**: Documentation lives in the same repository as code, written in Markdown, reviewed in PRs, and deployed automatically. Tools: Docusaurus, MkDocs, Astro (content collections), VitePress. Documentation PRs are required alongside code PRs for public API changes.

**API documentation**: Auto-generated from code annotations (OpenAPI from Express/Spring annotations, GraphQL introspection). Supplemented with usage examples, authentication guides, and error catalogs. Interactive API explorer (Swagger UI, GraphQL Playground, Redoc).

**Runbooks**: Step-by-step guides for operational procedures — deployment, rollback, incident response, database migration, scaling. Stored alongside the service they support. Linked from alerting rules. Updated after every incident that reveals a gap.

### Developer Portals (Backstage)

**Backstage (Spotify)**: Open-source developer portal. Service catalog (who owns what, tech stack, dependencies), software templates (scaffold new services), TechDocs (docs-as-code), and plugin ecosystem (CI/CD status, Kubernetes, costs, security).

**Service catalog**: Every service registered with metadata — owner, lifecycle (production, deprecated, experimental), API spec, dependencies, documentation link, SLOs. Enables discovery: which team owns this service, what does it depend on, where are its docs.

**Software templates**: Backstage scaffolder creates new services with CI/CD, monitoring, deployment config, and documentation pre-configured. Enforces organizational standards from project creation. Reduces the cost of creating new services to near zero.

**When to adopt**: Justified with 20+ services or 5+ teams. Below that threshold, a well-maintained README and service registry spreadsheet suffice. Backstage has significant setup and maintenance cost — treat it as a product with a dedicated team.

### Inner Source Practices

**Shared libraries**: Common utilities, logging config, auth middleware, and API clients extracted into internal packages. Published to a private registry (npm private, Maven internal, PyPI private). Versioned with semantic versioning. Breaking changes require migration guides.

**Contribution model**: Any developer can contribute to any service via PR. Service owners review and merge. Contribution guidelines per repo (CONTRIBUTING.md). Reduces bottlenecks and knowledge silos.

**RFC process**: For cross-team technical decisions, use Request for Comments documents. Author proposes a solution, stakeholders comment asynchronously, decision is recorded. Tools: GitHub Discussions, Notion, or plain Markdown in a shared repo.

## Decision Framework

| Team Size | Recommended DX Investment |
|-----------|--------------------------|
| 1-5 | Makefile, Docker Compose, README, shared IDE config |
| 5-15 | Monorepo tooling, code generation, ADRs, automated setup |
| 15-50 | Internal packages, RFC process, docs-as-code site |
| 50+ | Backstage portal, software templates, inner source program |

## Anti-Patterns

- **Documentation graveyard**: Comprehensive documentation written once, never updated. Stale docs are worse than no docs — they mislead. Prefer lightweight, living docs linked to code. Automate what can be auto-generated.
- **Works-on-my-machine**: Developer environments that depend on globally installed tools, specific OS versions, or manual configuration steps. Containerize dependencies, script setup, test in CI.
- **Tooling monoculture enforcement**: Mandating specific IDEs, shells, or operating systems when the codebase does not require it. Standardize on outcomes (formatting, linting, test passing) not on specific tools.
- **Onboarding by osmosis**: No structured onboarding — new developers figure it out by reading code and asking questions. This wastes 2-4 weeks of productive time per hire and loads existing developers with interruptions.

## Evidence Signals

- `Makefile`, `Justfile`, or `Taskfile.yml` at repo root — task runner adoption.
- `docker-compose.yml` with development services — containerized local dev.
- `.devcontainer/` directory — Dev Container configuration.
- `docs/adr/` or `docs/decisions/` directory — ADR practice.
- `.husky/`, `.pre-commit-config.yaml`, or `.lefthook.yml` — Git hook automation.
- `CONTRIBUTING.md`, `docs/onboarding.md` — structured onboarding and contribution practices.
- `catalog-info.yaml` (Backstage entity descriptor) — developer portal adoption.
- Time from clone to running app: ask a new team member to time it. > 30 minutes is a red flag.

---
*Sovereign Architect RAG Priming · JM Labs*
