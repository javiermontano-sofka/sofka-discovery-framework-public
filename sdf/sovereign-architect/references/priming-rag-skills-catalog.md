# Skills Catalog — RAG Priming Index

> **TL;DR**: Complete catalog of all 107 SA skills organized by movement — Discovery, Diagnosis, Design, Planning, Cross-Cutting — with agent ownership and MOAT structure.

## Purpose

This RAG file enables instant skill lookup during analysis. Used by the orchestrator to select the right skill for each detected signal and by the lazy-load-resolver to determine what to load at L1/L2/L3.

---

## Skill Summary

| Movement | Skills | Phases |
|----------|--------|--------|
| **Discovery** | 22 | 1 |
| **Diagnosis** | 18 | 2 |
| **Design** | 28 | 3 |
| **Planning & Delivery** | 20 | 4-5 |
| **Cross-Cutting** | 12 | Transversal |
| **Service Discovery** | 7 | Pre-pipeline |
| **Total** | **107** | |

---

## Discovery Skills (22) — Phase 1

| Skill | Agent Owner | Purpose |
|-------|------------|---------|
| `technical-discovery` | principal-architect | Full system scan and inventory |
| `repository-scanner` | code-analyst | Tech stack, frameworks, entry points |
| `dependency-auditor` | dependency-manager | CVE, freshness, licensing analysis |
| `architecture-mapper` | principal-architect | C4 diagrams, component boundaries |
| `codebase-metrics` | code-analyst | Complexity, coupling, cohesion metrics |
| `api-surface-analyzer` | api-designer | REST/GraphQL/gRPC contract inventory |
| `data-model-analyzer` | data-modeler | Schema, migrations, relationships |
| `test-coverage-analyzer` | test-strategist | Coverage gaps, test quality assessment |
| `ci-cd-analyzer` | ci-cd-architect | Pipeline health, build times, reliability |
| `documentation-auditor` | documentation-architect | Doc freshness, coverage, accuracy |
| `security-surface-scanner` | security-specialist | OWASP surface, secrets, auth patterns |
| `performance-profiler` | performance-analyst | N+1 queries, bottlenecks, resources |
| `infrastructure-mapper` | infrastructure-architect | Docker, K8s, IaC topology mapping |
| `tech-debt-quantifier` | code-analyst | Debt classification, interest estimation |
| `developer-experience-auditor` | dx-advocate | DX friction, onboarding quality |
| `flow-mapping` | systems-thinker | Value stream and workflow mapping |
| `stakeholder-mapping` | product-engineer | Stakeholder identification and alignment |
| `discovery-orchestrator` | principal-architect | Multi-domain discovery coordination |
| `discovery-handover` | principal-architect | Discovery-to-diagnosis handover protocol |
| `input-analysis` | evidence-auditor | Input document analysis and extraction |
| `sector-intelligence` | research-scientist | Industry context and benchmarking |
| `maturity-assessment` | enterprise-architect | Technical maturity model scoring |

## Diagnosis Skills (18) — Phase 2

| Skill | Agent Owner | Purpose |
|-------|------------|---------|
| `diagnostic-engine` | principal-architect | Integrated root cause analysis |
| `root-cause-analyzer` | code-analyst | Symptom-to-cause tracing |
| `risk-scorer` | quality-guardian | Severity x likelihood risk matrix |
| `friction-detector` | evidence-auditor | 10 friction categories systematic scan |
| `debt-classifier` | code-analyst | Arch/code/test/doc/infra debt typing |
| `security-threat-modeler` | security-specialist | STRIDE, attack surface analysis |
| `performance-bottleneck-identifier` | performance-analyst | Profiling, hot path identification |
| `scalability-assessor` | infrastructure-architect | H/V scaling, stateless/stateful analysis |
| `maintainability-scorer` | code-analyst | Code quality index scoring |
| `observability-gap-analyzer` | observability-engineer | Logging/metrics/tracing gap analysis |
| `incident-analyzer` | incident-commander | Post-mortem, timeline reconstruction |
| `code-smell-detector` | code-analyst | Pattern/anti-pattern recognition |
| `dependency-analysis` | dependency-manager | Dependency graph risk analysis |
| `compliance-assessment` | compliance-analyst | Regulatory compliance gap analysis |
| `risk-controlling` | quality-guardian | Risk mitigation tracking |
| `technical-feasibility` | research-scientist | Feasibility assessment scoring |
| `software-viability` | economics-analyst | Software viability analysis |
| `scenario-analysis` | systems-thinker | What-if scenario modeling |

## Design Skills (28) — Phase 3

| Skill | Agent Owner | Purpose |
|-------|------------|---------|
| `architecture-design` | principal-architect | Architecture proposals + trade-offs |
| `adr-generator` | technical-writer | Architecture Decision Records |
| `trade-off-analyzer` | principal-architect | Multi-criteria decision analysis |
| `component-designer` | principal-architect | Modular boundary design |
| `api-designer-skill` | api-designer | Contract-first API design |
| `api-architecture` | api-designer | API layer architecture patterns |
| `data-model-designer` | data-modeler | Schema design, normalization |
| `migration-planner` | migration-specialist | Strangler fig, blue-green strategies |
| `microservices-decomposer` | monolith-decomposer | Bounded context identification |
| `caching-strategy` | caching-strategist | Cache patterns, invalidation design |
| `event-driven-design` | event-driven-designer | Event sourcing, CQRS design |
| `event-architecture` | event-driven-designer | Event system architecture |
| `auth-architecture` | auth-architect | AuthN/AuthZ pattern design |
| `observability-design` | observability-engineer | Observability stack design |
| `observability-architecture` | observability-engineer | Full observability architecture |
| `deployment-strategy` | release-engineer | Blue-green, canary, rolling design |
| `state-management-design` | state-management-designer | State pattern selection |
| `resilience-design` | infrastructure-architect | Circuit breakers, retries, bulkheads |
| `cloud-migration` | cloud-architect | Cloud migration strategy design |
| `cloud-native-architecture` | cloud-architect | Cloud-native pattern design |
| `database-architecture` | database-specialist | Database architecture design |
| `security-architecture` | security-specialist | Security architecture design |
| `devsecops-architecture` | security-specialist | DevSecOps pipeline design |
| `infrastructure-architecture` | infrastructure-architect | Infrastructure architecture design |
| `software-architecture` | principal-architect | Software architecture patterns |
| `solutions-architecture` | solutions-architect | Solution architecture design |
| `design-system` | ux-engineer | Design system architecture |
| `enterprise-architecture` | enterprise-architect | Enterprise architecture patterns |

## Planning & Delivery Skills (20) — Phases 4-5

| Skill | Agent Owner | Purpose |
|-------|------------|---------|
| `implementation-planning` | principal-architect | Phased execution plans |
| `file-change-planner` | code-analyst | Specific file modification plans |
| `rollback-strategy` | release-engineer | Undo plans per phase |
| `test-strategy-designer` | test-strategist | Test pyramid, TDD/BDD strategy |
| `testing-strategy` | test-strategist | Comprehensive testing approach |
| `ci-cd-pipeline-designer` | ci-cd-architect | Pipeline architecture design |
| `documentation-generator` | technical-writer | README, API docs, runbooks |
| `code-review-framework` | code-analyst | Review checklist, severity levels |
| `acceptance-criteria-writer` | product-engineer | Given/When/Then criteria |
| `release-planner` | release-engineer | Versioning, changelog strategy |
| `monitoring-setup` | observability-engineer | Dashboards, alerts, SLO setup |
| `disaster-recovery-planner` | infrastructure-architect | RPO/RTO, failover planning |
| `performance-budget` | performance-analyst | Core Web Vitals, budgets |
| `performance-engineering` | performance-analyst | Performance optimization plans |
| `quality-engineering` | quality-guardian | Quality assurance strategy |
| `cost-estimation` | economics-analyst | Effort and cost estimation |
| `commercial-model` | economics-analyst | Commercial model design |
| `roadmap-poc` | product-engineer | Roadmap and PoC planning |
| `solution-roadmap` | solutions-architect | Solution delivery roadmap |
| `team-topology` | systems-thinker | Team structure recommendations |

## Cross-Cutting Skills (12) — Transversal

| Skill | Agent Owner | Purpose |
|-------|------------|---------|
| `evidence-classifier` | evidence-auditor | [HECHO]/[INFERENCIA]/[SUPUESTO] tagging |
| `mermaid-diagramming` | technical-writer | C4, sequence, flow diagram generation |
| `output-engineering` | quality-guardian | Quality formatting, ghost menu |
| `context-optimization` | principal-architect | Session context management |
| `excellence-loop` | quality-guardian | 10-point quality rubric |
| `lessons-learned-tracker` | evidence-auditor | Capture + apply corrections |
| `technical-writing` | technical-writer | Technical documentation authoring |
| `copywriting` | technical-writer | Clear, persuasive technical writing |
| `storytelling` | technical-writer | Technical narrative construction |
| `data-storytelling` | analytics-engineer | Data-driven narrative |
| `ux-writing` | ux-engineer | UX copy and microcopy |
| `workshop-design` | delivery-lead | Workshop facilitation design |

## Service Discovery Skills (7) — Pre-Pipeline

| Skill | Agent Owner | Purpose |
|-------|------------|---------|
| `dynamic-sme` | principal-architect | Dynamic subject matter expertise |
| `executive-pitch` | economics-analyst | Executive-level pitch design |
| `functional-spec` | product-engineer | Functional specification writing |
| `analytics-engineering` | analytics-engineer | Analytics engineering assessment |
| `bi-architecture` | data-architect | BI architecture assessment |
| `data-engineering` | data-engineer | Data engineering assessment |
| `data-governance` | data-architect | Data governance assessment |

---

## MOAT Structure

Every skill follows the MOAT directory pattern:

```
skills/{skill-name}/
├── SKILL.md                    # Frontmatter + procedure
├── references/
│   └── body-of-knowledge.md   # Domain patterns and principles
├── prompts/
│   └── use-case-prompts.md    # Scenario-specific prompts
└── examples/
    └── sample-output.md       # Example output
```

Progressive loading: L1 (frontmatter) → L2 (SKILL.md) → L3 (full MOAT with references).

---

*Sovereign Architect — 107 skills, each with a clear purpose.*
*JM Labs · Javier Montano.*
