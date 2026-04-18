---
name: metodologia-discovery-orchestrator
description: >
  This skill should be used when the user asks to "run a discovery", "orchestrate the pipeline",
  "start a consulting engagement", "coordinate the dream team", "plan a discovery session",
  "manage discovery inputs", or mentions discovery orchestration, phase sequencing, quality gates,
  data contracts, expert committee, dream team, or consulting pipeline. Always use this skill
  as the entry point for any discovery engagement — it coordinates all other skills.
argument-hint: "<project_name> [full-pipeline|minimal|quick-reference] [codebase_path]"
author: Javier Montano · Comunidad MetodologIA
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - WebFetch
---

# MetodologIA Discovery Orchestrator

The single entry point for every MetodologIA discovery engagement. Coordinates 59 specialized skills across 8 pipeline phases (0-6 + 3b) and 9 domains, assembles and manages a dynamic expert committee (7-10 experts + impartial conductor) adapted per `{TIPO_SERVICIO}`, enforces 3 quality gates, manages inter-phase data contracts, and maintains a living discovery plan with input tracking. This skill does NOT perform deep analysis — it sequences, validates, and coordinates.


## Service Type Parameter

`{TIPO_SERVICIO}`: `SDA` (default) | `QA` | `Management` | `RPA` | `Data-AI` | `Cloud` | `SAS` | `UX-Design` | `Digital-Transformation` | `Multi-Service`

Determines: skill variants activated, expert committee composition, input requirements, deliverable naming, domain model used. See `references/service-type-matrix.md` for detection rules and routing logic.

### Auto-Detection Rules (Priority Order)
1. Explicit parameter in command invocation
2. User states service type in prompt
3. Codebase detected → SDA
4. Process/BPMN artifacts detected → RPA
5. Test artifacts dominant → QA
6. Data pipelines/models detected → Data-AI
7. Cloud infrastructure configs dominant → Cloud
8. Design assets dominant → UX-Design
9. Multiple service indicators → Multi-Service
10. Default → SDA (backward compatible)

Always confirm detected service type with user before proceeding.

## Principio Rector

**El discovery sin orquestación es un conjunto de análisis inconexos disfrazados de consultoría.** Este skill impone secuencia, validación y trazabilidad sobre el pipeline completo: cada fase tiene un responsable, cada gate tiene criterios, cada contrato de datos se verifica. La orquestación es lo que convierte 59 skills individuales en un programa de consultoría confiable.

### Filosofía de Orquestación

1. **Secuencia con propósito.** Cada fase existe porque la anterior la alimenta. Saltar fases no es eficiencia — es riesgo no gestionado.
2. **Contratos, no confianza.** Los data contracts entre fases se verifican explícitamente. La confianza se construye con evidencia, no con supuestos.
3. **El conductor no analiza.** Coordinación pura. Las opiniones técnicas son de los expertos. El conductor secuencia, valida y escala.

## Skill Catalog (59 skills across 9 domains)

### Discovery Pipeline (16 skills — core engagement flow)
| Skill | Phase | Purpose |
|-------|-------|---------|
| discovery-orchestrator | All | Pipeline coordination, gates, contracts |
| stakeholder-mapping | 0 | Stakeholder register, RACI, communication plan |
| workshop-facilitator | 0 | Workshop design and facilitation |
| asis-analysis | 1 | 10-section current-state technical assessment |
| dynamic-sme | 1-6 | Industry-specific context overlay |
| mermaid-diagramming | All | Precise Mermaid diagrams for all deliverables |
| flow-mapping | 2 | DDD taxonomy, E2E flows, integration matrix |
| scenario-analysis | 3 | Tree-of-thought scenario evaluation |
| technical-feasibility | 3b | Multidimensional feasibility — 6D analysis, spikes, blockers |
| software-viability | 3b | Software/AI substance vs smoke — forensic tech validation |
| solution-roadmap | 4 | Phased transformation roadmap |
| cost-estimation | 4 | Cost drivers, effort inductors, magnitude indicators (NO prices) |
| commercial-model | 4b | Value capture, business model, deal structure (NO pricing) |
| functional-spec | 5a | Module specs, use cases, business rules |
| executive-pitch | 5b | Business case, NPV/IRR, call to action |
| discovery-handover | 6 | Operational transition, commercial activation, governance transfer |

### Architecture Design (8 skills — system design layer)
| Skill | Purpose |
|-------|---------|
| software-architecture | Patterns, ADRs, quality attributes, C4 |
| architecture-tobe | Target state design, migration path |
| enterprise-architecture | Portfolio strategy, TOGAF alignment |
| solutions-architecture | Integration patterns, cross-cutting concerns |
| infrastructure-architecture | IaC, networking, compute, storage |
| devsecops-architecture | CI/CD, security pipeline, DORA metrics |
| design-system | UI component system, brand tokens |
| functional-toolbelt | Utility patterns, cross-cutting concerns |

### Data Strategy (7 skills — data domain)
| Skill | Purpose |
|-------|---------|
| data-science-architecture | ML pipelines, model registry, feature store |
| bi-architecture | Semantic layer, metrics, dashboards |
| data-engineering | ETL/ELT pipelines, orchestration, quality |
| database-architecture | Schema design, sharding, replication |
| data-governance | Catalog, lineage, classification, compliance |
| data-quality | Profiling, rules, SLAs, monitoring |
| analytics-engineering | dbt models, testing, documentation |

### Cloud & Mobile (4 skills)
| Skill | Purpose |
|-------|---------|
| cloud-native-architecture | Containers, mesh, serverless, FinOps |
| cloud-migration | 7R strategy, migration factory, cutover |
| mobile-architecture | Cross-platform, native, performance |
| mobile-assessment | Store compliance, vitals, privacy |

### Engineering Excellence (5 skills)
| Skill | Purpose |
|-------|---------|
| api-architecture | REST/GraphQL/gRPC, contracts, governance |
| event-architecture | Event sourcing, CQRS, streaming |
| security-architecture | Zero trust, SLSA, threat modeling |
| performance-engineering | Load testing, SLOs, capacity planning |
| observability | OTel, metrics, traces, logs, alerting |

### Consulting & Quality (3 skills)
| Skill | Purpose |
|-------|---------|
| quality-engineering | Test strategy shapes, maturity model |
| testing-strategy | Pyramid/trophy, contract testing, chaos |
| user-representative | Persona-based UX review, accessibility |

### Governance & Risk (2 skills — cross-cutting glue)
| Skill | Purpose |
|-------|---------|
| project-program-management | PMO governance, gate management, proposal QA, dependency control |
| risk-controlling-dynamics | Proactive risk, assumption stress-testing, pre-mortem, financial controls |

### Delivery & Brand (3 skills)
| Skill | Purpose |
|-------|---------|
| html-brand | Branded HTML deliverables, Design System v4 |
| ux-writing | Microcopy, readability, content standards |
| roadmap-poc | PoC/MVP sprint planning, kickoff protocol |


### Service Discovery (11 skills — universal service coverage)
| Skill | Purpose |
|-------|---------|
| rpa-discovery | Process landscape, automation scoring, bot architecture |
| qa-service-discovery | TMMi assessment, test factory, QA CoE design |
| ai-center-discovery | AI readiness (AI SCALE), use case portfolio, model governance |
| management-discovery | PMO maturity, methodology fitness, Factor WOW |
| staff-augmentation-discovery | Talent gap, skills matrix, staffing model |
| digital-transformation-discovery | Digital maturity, multi-service program design |
| cloud-service-discovery | Cloud readiness, DORA metrics, FinOps |
| bi-analytics-discovery | Data maturity (DCAM), BI landscape, self-service |
| ux-design-discovery | Design maturity, design system, UX research capability |
| mentoring-training-discovery | Capability assessment, learning paths, knowledge transfer |
| mini-apps-discovery | Citizen developer readiness, low-code platform assessment |

## Output Format Protocol

Every deliverable supports two output formats controlled by `{FORMATO}`:

| Format | Default | Token Cost | Use Case |
|--------|---------|------------|----------|
| `markdown` | Yes | Low | Day-to-day deliverables, iterative work, Mermaid-native diagrams |
| `html` | On demand | High | Executive presentations, client-facing documents, brand-compliant output |
| `dual` | On demand | 2x | When both formats are needed simultaneously |

### Markdown Output Standard
- Rich formatting: headers, tables, callouts, code blocks
- Mermaid diagrams embedded as fenced code blocks (```mermaid)
- Evidence tags inline: [CODIGO], [CONFIG], [DOC], [INFERENCIA]
- Accessibility: text summary before each diagram
- Minimum 1 Mermaid diagram per deliverable, recommended 2, maximum 4

### HTML Output Standard
- Full Design System branding (colors, fonts, spacing, components)
- Mermaid rendered via `<pre class="mermaid">` + Mermaid JS CDN
- Print-ready layout
- Self-contained (no external dependencies except Mermaid CDN)

### Diagram Budget per Deliverable
| Deliverable | Required Diagrams |
|------------|-------------------|
| 01_Stakeholder_Map | Quadrant (influence x interest), Mindmap (org) |
| 02_Brief_Tecnico | Mindmap (stack), Quadrant (health) |
| 03_Analisis_AS-IS | C4 Context + Container, Class (dependencies) |
| 04_Mapeo_Flujos | Sequence (E2E flows), Flowchart (integrations) |
| 05_Escenarios | Flowchart (decision tree), Quadrant (scoring) |
| 06_Solution_Roadmap | Gantt (timeline), Flowchart (pivots) |
| 07_Spec_Funcional | Flowchart (use cases), ER (data model) |
| 08_Pitch_Ejecutivo | Mindmap (value pillars), Gantt (investment) |
| 09_Handover | Flowchart (governance), Gantt (90-day plan) |
| P-01_Program_Governance | Gantt (program timeline), Sequence (data flow), Flowchart (resources) |
| P-02_Risk_Controlling | Mindmap (risks by phase), Quadrant (prob/impact), Flowchart (controls) |

---

## Full specification

Detailed protocol, committee composition matrices, and phase-by-phase
guidance live in `references/full-specification.md` to keep this entry
point lean. Read it when executing the orchestrator end-to-end.
