---
description: "Interactive command palette — see all available SA commands (104 commands)"
user-invocable: true
---

# SOVEREIGN ARCHITECT · MENU

## ROLE

Display the Sovereign Architect command palette.

## PROTOCOL

Present the following interactive menu:

---

## Sovereign Architect — Command Palette (104 commands)

> Evidence over enthusiasm. Engineering over hype.
> 48 agents · 107 skills · 104 commands · 19 scripts · 13 ontology files

### Pipeline Runners
| Command | Alias | Description |
|---------|-------|-------------|
| `/sa:analyze` | `/sa:a` | Full 5-phase workflow |
| `/sa:run-auto` | `/sa:auto` | Autonomous pipeline (gates auto-approved) |
| `/sa:run-guided` | `/sa:guided` | Guided pipeline with human checkpoints |
| `/sa:run-deep` | `/sa:deep` | Deep analysis + Think Tank feasibility |
| `/sa:run-express` | `/sa:express` | Quick assessment (phases 1-2 only) |
| `/sa:run-full` | `/sa:full` | Analyze with complete output |
| `/sa:run-quick` | `/sa:quick` | Fast diagnosis + key recommendations |
| `/sa:demo` | — | Guided walkthrough of SA capabilities |
| `/sa:init` | — | Initialize SA environment for new codebase |
| `/sa:menu` | — | This command palette |

### 4 Movements
| Command | Alias | Description |
|---------|-------|-------------|
| `/sa:create` | `/sa:c` | **CREATE** — Generate new artifacts |
| `/sa:review` | `/sa:r` | **REVIEW** — Analyze with critical eye |
| `/sa:evolve` | `/sa:e` | **EVOLVE** — Improve without degrading |
| `/sa:repair` | `/sa:fix` | **REPAIR** — Diagnose and fix |

### Focused
| Command | Alias | Description |
|---------|-------|-------------|
| `/sa:diagnose` | `/sa:dx` | Discovery + diagnosis (phases 1-2) |
| `/sa:plan` | `/sa:p` | Design + plan (phases 3-4) |
| `/sa:spec` | `/sa:s` | Generate spec or ADR |

### Assessment (8)
| Command | Alias | Description |
|---------|-------|-------------|
| `/sa:assess-architecture` | — | Deep architecture assessment (C4, ADRs, quality attributes) |
| `/sa:assess-security` | — | Security posture (OWASP, STRIDE, CVEs) |
| `/sa:assess-performance` | — | Performance (profiling, bottlenecks, budgets) |
| `/sa:assess-data` | — | Data layer (schema, migrations, query patterns) |
| `/sa:assess-devops` | — | DevOps maturity (DORA metrics, pipeline health) |
| `/sa:assess-cloud` | — | Cloud readiness (7R, cloud-native, FinOps) |
| `/sa:assess-compliance` | — | Compliance (GDPR, SOX, PCI-DSS in code) |
| `/sa:assess-testing` | — | Test strategy and coverage assessment |

### Audit (8)
| Command | Alias | Description |
|---------|-------|-------------|
| `/sa:audit-security` | `/sa:sec` | OWASP, secrets, auth gaps |
| `/sa:audit-performance` | `/sa:perf` | N+1, bottlenecks, resources |
| `/sa:audit-accessibility` | `/sa:a11y` | WCAG 2.1 compliance |
| `/sa:audit-testing` | `/sa:test` | Coverage + quality |
| `/sa:audit-dependencies` | `/sa:deps` | CVE, freshness, licensing |
| `/sa:audit-documentation` | `/sa:docs` | Doc coverage + freshness |
| `/sa:audit-debt` | `/sa:debt` | Tech debt quantification |
| `/sa:audit-dx` | `/sa:dx-audit` | Developer experience friction |

### Map (4)
| Command | Alias | Description |
|---------|-------|-------------|
| `/sa:map-architecture` | `/sa:arch` | C4 diagrams, components |
| `/sa:map-data` | `/sa:data` | Data model mapping |
| `/sa:map-api` | `/sa:api` | API surface analysis |
| `/sa:map-infrastructure` | `/sa:infra` | Docker, K8s, IaC topology |

### Design (5)
| Command | Alias | Description |
|---------|-------|-------------|
| `/sa:design-architecture` | `/sa:design` | Architecture + trade-offs |
| `/sa:design-migration` | `/sa:migrate` | Migration strategy |
| `/sa:design-deployment` | `/sa:deploy` | Deployment strategy |
| `/sa:design-api` | — | API contract design |
| `/sa:design-auth` | — | Auth architecture |

### Generate (7)
| Command | Alias | Description |
|---------|-------|-------------|
| `/sa:generate-adr` | `/sa:adr` | Architecture Decision Record |
| `/sa:generate-tests` | `/sa:tests` | Test strategy + cases |
| `/sa:generate-docs` | — | Documentation generation |
| `/sa:generate-changelog` | — | Changelog from git history |
| `/sa:generate-roadmap` | `/sa:roadmap` | Implementation roadmap with phases |
| `/sa:generate-spec` | — | Functional specification with use cases |
| `/sa:generate-pitch` | `/sa:pitch` | Technical pitch / business case |
| `/sa:generate-handover` | `/sa:handover` | Handover package for delivery teams |

### Report (3)
| Command | Alias | Description |
|---------|-------|-------------|
| `/sa:report-findings` | `/sa:findings` | Executive findings summary |
| `/sa:report-technical` | `/sa:tech-report` | Deep technical findings report |
| `/sa:report-functional` | `/sa:func-report` | Functional assessment report |

### Operational (10)
| Command | Alias | Description |
|---------|-------|-------------|
| `/sa:validate` | `/sa:v` | Quality gate check |
| `/sa:retro` | — | Session retrospective |
| `/sa:prime` | — | Repository knowledge priming |
| `/sa:scan-secrets` | `/sa:secrets` | G0 security gate — secret scanning |
| `/sa:export-pdf` | `/sa:pdf` | Export to PDF with JM Labs branding |
| `/sa:render-diagrams` | — | Render Mermaid to PNG |
| `/sa:convert-skills` | — | Convert skills to Cursor/Codex/Gemini |
| `/sa:optimize-context` | — | Context window optimization |
| `/sa:browse-client` | — | Browser-based visual audit (Playwright) |
| `/sa:benchmark-maturity` | `/sa:maturity` | Maturity benchmark (CMMI, DORA) |

### Usage
```
/sa:analyze src/auth/              # Analyze the auth module
/sa:run-auto                       # Full autonomous pipeline
/sa:run-express                    # Quick assessment
/sa:assess-architecture            # Architecture deep-dive
/sa:audit-security src/            # Security audit on src/
/sa:map-architecture               # Map full architecture
/sa:report-findings                # Executive findings summary
/sa:generate-roadmap               # Implementation roadmap
/sa:design-migration "PostgreSQL"  # Design migration to PostgreSQL
/sa:generate-adr "caching layer"   # Generate ADR for caching decision
/sa:benchmark-maturity             # Maturity benchmark
```

---

Ask: **What do you need? Describe the system, file, PR, incident, or initiative.**

## CONSTRAINTS

- Always show this menu when invoked
- After showing the menu, wait for user input
