# Commands Reference — RAG Priming Index

> **TL;DR**: Complete reference of all 104 SA commands organized by category — workflow, movements, focused, audit, map, design, generate, and operational.

## Purpose

This RAG file provides instant command lookup during sessions. Used by the orchestrator to route user intent to the correct command, suggest next actions, and populate ghost menus.

---

## Command Summary

| Category | Primary | Aliases | Total |
|----------|---------|---------|-------|
| **Workflow** | 4 | 4 | 8 |
| **Movements** | 4 | 4 | 8 |
| **Focused** | 3 | 3 | 6 |
| **Audit** | 8 | 8 | 16 |
| **Map** | 4 | 4 | 8 |
| **Design** | 8 | 6 | 14 |
| **Generate** | 8 | 6 | 14 |
| **Ops** | 6 | 4 | 10 |
| **Service Discovery** | 10 | 10 | 20 |
| **Total** | **55** | **49** | **104** |

---

## Workflow Commands

| Command | Alias | Description |
|---------|-------|-------------|
| `/sa:analyze` | `/sa:a` | Full 5-phase workflow (Discovery → Delivery) |
| `/sa:run-full` | `/sa:full` | Analyze with complete output, all artifacts |
| `/sa:run-quick` | `/sa:quick` | Fast diagnosis + key recommendations only |
| `/sa:menu` | — | Interactive command palette with context |

## Movement Commands

| Command | Alias | Description |
|---------|-------|-------------|
| `/sa:create` | `/sa:c` | CREATE — generate new artifacts from evidence |
| `/sa:review` | `/sa:r` | REVIEW — analyze existing artifacts critically |
| `/sa:evolve` | `/sa:e` | EVOLVE — improve without degrading quality |
| `/sa:repair` | `/sa:fix` | REPAIR — diagnose root cause and correct |

## Focused Commands

| Command | Alias | Description |
|---------|-------|-------------|
| `/sa:diagnose` | `/sa:dx` | Phases 1-2 only (Discovery + Diagnosis) |
| `/sa:plan` | `/sa:p` | Phases 3-4 only (Design + Plan) |
| `/sa:spec` | `/sa:s` | Generate specification or ADR |

## Audit Commands

| Command | Alias | Description |
|---------|-------|-------------|
| `/sa:audit-security` | `/sa:sec` | Security audit (OWASP, secrets, auth flows) |
| `/sa:audit-performance` | `/sa:perf` | Performance audit (N+1, bottlenecks, budgets) |
| `/sa:audit-accessibility` | `/sa:a11y` | Accessibility audit (WCAG 2.1 compliance) |
| `/sa:audit-testing` | `/sa:test` | Test coverage and quality audit |
| `/sa:audit-dependencies` | `/sa:deps` | Dependency health (CVE, freshness, licenses) |
| `/sa:audit-documentation` | `/sa:docs` | Documentation coverage and freshness audit |
| `/sa:audit-debt` | `/sa:debt` | Technical debt quantification and classification |
| `/sa:audit-dx` | `/sa:dx-audit` | Developer experience friction audit |

## Map Commands

| Command | Alias | Description |
|---------|-------|-------------|
| `/sa:map-architecture` | `/sa:arch` | Architecture mapping (C4 diagrams, boundaries) |
| `/sa:map-data` | `/sa:data` | Data model mapping (schema, relationships) |
| `/sa:map-api` | `/sa:api` | API surface mapping (endpoints, contracts) |
| `/sa:map-infrastructure` | `/sa:infra` | Infrastructure topology mapping |

## Design Commands

| Command | Alias | Description |
|---------|-------|-------------|
| `/sa:design-architecture` | `/sa:design` | Architecture proposal with trade-off analysis |
| `/sa:design-migration` | `/sa:migrate` | Migration strategy design (strangler fig, etc.) |
| `/sa:design-deployment` | `/sa:deploy` | Deployment strategy design (blue-green, canary) |
| `/sa:design-api` | — | API contract design (OpenAPI, GraphQL schema) |
| `/sa:design-auth` | — | Authentication/authorization architecture |
| `/sa:design-data` | `/sa:schema` | Data model and schema design |
| `/sa:design-events` | `/sa:events` | Event-driven architecture design |
| `/sa:design-observability` | `/sa:obs` | Observability stack design |

## Generate Commands

| Command | Alias | Description |
|---------|-------|-------------|
| `/sa:generate-adr` | `/sa:adr` | Generate Architecture Decision Record |
| `/sa:generate-tests` | `/sa:tests` | Generate test strategy + test cases |
| `/sa:generate-docs` | — | Generate documentation (README, runbooks) |
| `/sa:generate-changelog` | — | Generate changelog from git history |
| `/sa:generate-spec` | `/sa:spec-gen` | Generate functional specification |
| `/sa:generate-runbook` | `/sa:runbook` | Generate operational runbook |
| `/sa:generate-dashboard` | `/sa:dash` | Generate monitoring dashboard config |
| `/sa:generate-checklist` | `/sa:check` | Generate review/deployment checklist |

## Ops Commands

| Command | Alias | Description |
|---------|-------|-------------|
| `/sa:validate` | `/sa:v` | Quality gate check (G0, G1, G1.5, G2) |
| `/sa:retro` | — | Session retrospective and lessons learned |
| `/sa:prime` | — | Repository knowledge priming |
| `/sa:calibrate` | `/sa:cal` | Recalibrate session context |
| `/sa:status` | — | Current pipeline status and phase |
| `/sa:export` | — | Export session artifacts |

## Service Discovery Commands

| Command | Alias | Description |
|---------|-------|-------------|
| `/sa:svc-backend` | `/sa:be` | Backend service assessment |
| `/sa:svc-frontend` | `/sa:fe` | Frontend application assessment |
| `/sa:svc-data` | `/sa:db` | Data layer assessment |
| `/sa:svc-cloud` | `/sa:cloud` | Cloud infrastructure assessment |
| `/sa:svc-security` | `/sa:sec-svc` | Security posture assessment |
| `/sa:svc-devops` | `/sa:ops` | DevOps maturity assessment |
| `/sa:svc-mobile` | `/sa:mob` | Mobile application assessment |
| `/sa:svc-ai` | `/sa:ml` | AI/ML system assessment |
| `/sa:svc-integration` | `/sa:int` | Integration layer assessment |
| `/sa:svc-platform` | `/sa:plat` | Platform engineering assessment |

---

## Command Arguments

All commands accept positional arguments for scoping:

```bash
/sa:analyze src/auth/              # Scope to auth module
/sa:review PR #42                  # Review a pull request
/sa:repair "login timeout"         # Fix specific issue
/sa:audit-security src/            # Audit specific directory
/sa:map-architecture               # Map full architecture
/sa:design-migration "PostgreSQL"  # Design specific migration
/sa:generate-adr "caching layer"   # ADR for specific decision
```

---

*Sovereign Architect — 104 commands, each with a clear purpose.*
*JM Labs · Javier Montano.*
