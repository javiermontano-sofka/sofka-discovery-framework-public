# Skills Catalog — Sovereign Architect

> SA Ontología Viva · Inventario de ~60 skills organizados por movimiento.

---

## Resumen

| Categoría | Skills | Fases |
|-----------|--------|-------|
| **Discovery** | 15 | 1 |
| **Diagnosis** | 12 | 2 |
| **Design** | 15 | 3 |
| **Planning & Delivery** | 12 | 4-5 |
| **Cross-Cutting** | 6 | Transversal |
| **Total** | **~60** | |

---

## Discovery Skills (15) — Fase 1

| Skill | Agente Principal | Propósito |
|-------|-----------------|-----------|
| `technical-discovery` | principal-architect | Escaneo integral del sistema |
| `repository-scanner` | code-analyst | Tech stack, framework, entry points |
| `dependency-auditor` | dependency-manager | CVE, freshness, licensing |
| `architecture-mapper` | principal-architect | C4, component diagrams |
| `codebase-metrics` | code-analyst | Complexity, coupling, cohesion |
| `api-surface-analyzer` | api-designer | REST/GraphQL/gRPC contracts |
| `data-model-analyzer` | data-modeler | Schema, migrations, relationships |
| `test-coverage-analyzer` | test-strategist | Coverage gaps, test quality |
| `ci-cd-analyzer` | ci-cd-architect | Pipeline health, build times |
| `documentation-auditor` | documentation-architect | Doc freshness, coverage |
| `security-surface-scanner` | security-specialist | OWASP, secrets, auth patterns |
| `performance-profiler` | performance-analyst | N+1, bottlenecks, resources |
| `infrastructure-mapper` | infrastructure-architect | Docker, K8s, IaC topology |
| `tech-debt-quantifier` | code-analyst | Debt classification, interest |
| `developer-experience-auditor` | dx-advocate | DX friction, onboarding |

## Diagnosis Skills (12) — Fase 2

| Skill | Agente Principal | Propósito |
|-------|-----------------|-----------|
| `diagnostic-engine` | principal-architect | Root cause analysis integral |
| `root-cause-analyzer` | code-analyst | Trace symptoms to causes |
| `risk-scorer` | quality-guardian | Severity × likelihood matrix |
| `friction-detector` | evidence-auditor | 10 friction categories scan |
| `debt-classifier` | code-analyst | Arch/code/test/doc/infra debt |
| `security-threat-modeler` | security-specialist | STRIDE, attack surface |
| `performance-bottleneck-identifier` | performance-analyst | Profiling, hot paths |
| `scalability-assessor` | infrastructure-architect | H/V scaling, stateless/stateful |
| `maintainability-scorer` | code-analyst | Code quality index |
| `observability-gap-analyzer` | observability-engineer | Logging/metrics/tracing gaps |
| `incident-analyzer` | incident-commander | Post-mortem, timeline |
| `code-smell-detector` | code-analyst | Pattern/anti-pattern recognition |

## Design Skills (15) — Fase 3

| Skill | Agente Principal | Propósito |
|-------|-----------------|-----------|
| `architecture-design` | principal-architect | Architecture proposals + trade-offs |
| `adr-generator` | technical-writer | Architecture Decision Records |
| `trade-off-analyzer` | principal-architect | Multi-criteria decisions |
| `component-designer` | principal-architect | Modular boundaries |
| `api-designer-skill` | api-designer | Contract-first (OpenAPI, GraphQL) |
| `data-model-designer` | data-modeler | Schema design, normalization |
| `migration-planner` | migration-specialist | Strangler fig, blue-green |
| `microservices-decomposer` | monolith-decomposer | Bounded contexts |
| `caching-strategy` | caching-strategist | Cache patterns, invalidation |
| `event-driven-design` | event-driven-designer | Event sourcing, CQRS |
| `auth-architecture` | auth-architect | AuthN/AuthZ patterns |
| `observability-design` | observability-engineer | Observability architecture |
| `deployment-strategy` | release-engineer | Blue-green, canary, rolling |
| `state-management-design` | state-management-designer | State patterns |
| `resilience-design` | infrastructure-architect | Circuit breakers, retries |

## Planning & Delivery Skills (12) — Fases 4-5

| Skill | Agente Principal | Propósito |
|-------|-----------------|-----------|
| `implementation-planning` | principal-architect | Phased execution plans |
| `file-change-planner` | code-analyst | Specific file modifications |
| `rollback-strategy` | release-engineer | Undo plans per phase |
| `test-strategy-designer` | test-strategist | Test pyramid, TDD/BDD |
| `ci-cd-pipeline-designer` | ci-cd-architect | Pipeline architecture |
| `documentation-generator` | technical-writer | README, API docs, runbooks |
| `code-review-framework` | code-analyst | Review checklist, severity |
| `acceptance-criteria-writer` | product-engineer | Given/When/Then criteria |
| `release-planner` | release-engineer | Versioning, changelog |
| `monitoring-setup` | observability-engineer | Dashboards, alerts, SLOs |
| `disaster-recovery-planner` | infrastructure-architect | RPO/RTO, failover |
| `performance-budget` | performance-analyst | Core Web Vitals, budgets |

## Cross-Cutting Skills (6) — Transversal

| Skill | Agente Principal | Propósito |
|-------|-----------------|-----------|
| `evidence-classifier` | evidence-auditor | [HECHO]/[INFERENCIA]/[SUPUESTO] |
| `mermaid-diagramming` | technical-writer | C4, sequence, flow diagrams |
| `output-engineering` | quality-guardian | Quality formatting, ghost menu |
| `context-optimization` | principal-architect | Session context management |
| `excellence-loop` | quality-guardian | 10-point quality rubric |
| `lessons-learned-tracker` | evidence-auditor | Capture + apply corrections |

---

## MOAT Structure (por skill)

Cada skill sigue la estructura MOAT:

```
skills/{skill-name}/
├── SKILL.md                    ← Frontmatter + procedure
├── references/
│   └── body-of-knowledge.md   ← Domain patterns and principles
├── prompts/
│   └── use-case-prompts.md    ← Scenario-specific prompts
└── examples/
    └── sample-output.md       ← Example output
```

---

*Sovereign Architect — 60 skills, each with a clear purpose.*
