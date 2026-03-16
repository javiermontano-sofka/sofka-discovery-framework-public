---
name: project-program-management
description: >
  PMO governance backbone — portfolio tracking, phase gate management, resource orchestration,
  dependency control, and proposal QA validation across the entire discovery pipeline. Use when
  the user asks to "track the discovery", "manage the portfolio", "validate the proposal",
  "run governance check", "check phase dependencies", "coordinate resources", or mentions
  PMO, program management, portfolio governance, phase gates, proposal readiness, milestone
  tracking, or cross-phase dependency management. Works as the structural glue that holds
  the entire discovery pipeline together — from Phase 0 through Handover.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Project & Program Management: PMO Governance Backbone

Structural governance layer that manages the discovery pipeline as a formal program —
tracking phases, gates, resources, dependencies, risks, and proposal readiness. Operates
as the connective tissue between all 48 skills, ensuring nothing falls through cracks,
phases don't skip prerequisites, and the final proposal is validated before client delivery.

## Principio Rector

**El descubrimiento sin gobernanza es improvisación disfrazada de metodología.** Este skill
impone la disciplina de programa sobre el pipeline: cada fase tiene prerequisites, cada gate
tiene criteria, cada entregable tiene owner y fecha. No es burocracia — es la diferencia
entre "hicimos un discovery" y "ejecutamos un programa de discovery confiable."

### Filosofía de Gobierno

1. **Governance ≠ Burocracia.** El gobierno existe para habilitar velocidad con confianza,
   no para frenar. Cada control debe justificar su existencia con un riesgo que mitiga.

2. **Trazabilidad Total.** Cada decisión, cambio de alcance, riesgo materializado, y
   dependencia resuelta queda registrada. El programa se puede auditar en cualquier momento.

3. **Proposal QA = Quality Gate Final.** La propuesta v1 no sale hasta que pasa una validación
   multidimensional que verifica coherencia técnica, viabilidad, completitud, y alineación
   con hallazgos del discovery.

## Inputs

Parse `$1` as **project/program name**. Detect discovery context from repo.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
  - **piloto-auto**: Auto para tracking rutinario, HITL para decisiones de gate, cambios de alcance, y validación de propuesta.
  - **desatendido**: Cero interrupciones. Gates auto-evaluados. Supuestos documentados.
  - **supervisado**: Autónomo con reportes en milestones. Preguntas solo en gates y QA de propuesta.
  - **paso-a-paso**: Confirma antes de cada evaluación de gate y cada sección de QA.
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40%) | `técnica` (full, default)

## When to Use

- At program initiation (before Phase 0)
- At every phase gate (G1, G2, G3, 3b checkpoint)
- When tracking cross-phase dependencies
- During proposal QA validation (pre-client delivery)
- When resource conflicts arise across phases
- For status reporting to stakeholders
- When scope changes threaten timeline or quality

## When NOT to Use

- Single-phase quick assessments (< 2 phases)
- Pure technical analysis (use domain-specific skills)
- Post-delivery — use discovery-handover instead

## Delivery Structure: 7 Sections

### S1: Program Charter & Governance Framework

- Program scope: which discovery phases are in scope, which are deferred
- Governance model: decision rights matrix (who decides what, at what level)
- Communication plan: cadence, channels, escalation paths
- Phase dependency map: prerequisite chain across all 8 phases

| Phase | Prerequisites | Gate | Gate Criteria | Owner |
|---|---|---|---|---|
| Phase 0: Stakeholder Mapping | Project kickoff | — | Map complete, power grid populated | Domain Analyst |
| Phase 1: AS-IS | Phase 0 complete | — | 10-section analysis delivered | Technical Architect |
| Phase 2: Flow Mapping | Phase 1 complete | — | Domain taxonomy + 8-12 flows | Domain Analyst |
| Phase 3: Scenarios | Phase 2 complete | G1 | Scenario approved by committee | Full-Stack Generalist |
| Phase 3b: Feasibility | G1 passed | 3b checkpoint | Feasibility verdict + viability scorecard | Quality Guardian |
| Phase 4: Roadmap + Cost | Phase 3b passed | — | Roadmap + cost drivers delivered | Delivery Manager |
| Phase 4b: Commercial Model | Phase 4 complete | G2 | Commercial structure approved | Data Strategist |
| Phase 5a: Functional Spec | G2 passed | — | Spec complete + use cases validated | Technical Architect |
| Phase 5b: Executive Pitch | G2 passed | G3 | Pitch approved, investment case clear | Change Catalyst |
| Phase 6: Handover | G3 passed | — | Handover package complete | Delivery Manager |

**Diagrama requerido**: Gantt chart (Mermaid) con timeline del programa completo, gates como milestones

### S2: Phase Gate Management

Para cada quality gate, evalúa:

**Gate Evaluation Protocol:**
```
GATE EVALUATION: {gate_name}
════════════════════════════
Phase Completing: {phase}
Date: {date}

ENTRY CRITERIA:
  [ ] {criterion_1} — {status: ✅/⚠️/🔴}
  [ ] {criterion_2} — {status}
  ...

DELIVERABLES CHECK:
  [ ] {deliverable_1} — {completeness: complete/partial/missing}
  [ ] {deliverable_2} — {completeness}

EVIDENCE CHAIN:
  - {deliverable} → {finding} → {implication for next phase}

DEPENDENCIES RESOLVED:
  [ ] {dependency_1} — {status}

RISKS CARRIED FORWARD:
  - {risk_1}: {mitigation status}

VERDICT: PASS / CONDITIONAL PASS / FAIL
  Conditions (if conditional):
    1. {condition}
    2. {condition}

  Fail reasons (if fail):
    1. {reason} → {remediation}
```

- **G1 (Post-Scenarios)**: Escenario aprobado, riesgos aceptables, viabilidad presumida
- **3b Checkpoint**: Feasibility FEASIBLE o FEASIBLE WITH CONDITIONS, viability 🟢/🟡
- **G2 (Post-Commercial)**: Roadmap viable, cost drivers identified, commercial model selected
- **G3 (Pre-Handover)**: Propuesta v1 aprobada, pitch listo, spec completa

### S3: Resource & Capacity Orchestration

- Expert committee allocation: quién está en qué fase, % dedicación
- Bottleneck detection: cuando un experto es prerequisito para >2 fases simultáneas
- Skill activation tracking: qué skills del catálogo de 48 se han activado, cuáles están pendientes

| Expert | Current Phase | % Allocated | Bottleneck Risk | Next Phase Needed |
|---|---|---|---|---|
| Technical Architect | Phase 1 | 100% | 🟡 Phase 3 needs same expert | Phase 3 (50%) |
| Domain Analyst | Phase 0 | 80% | 🟢 Available for Phase 2 | Phase 2 (100%) |

- Capacity alerts: flag cuando un recurso está sobre-asignado (>100%)
- Skill gap identification: si una fase necesita un skill que ningún experto domina

**Diagrama requerido**: Flowchart (Mermaid) mostrando flujo de recursos entre fases

### S4: Cross-Phase Dependency Control

- Input/output dependency matrix: qué produce cada fase, qué consume la siguiente
- Data contract verification: los contratos inter-fase se cumplen?
- Scope change impact: si algo cambia en Phase 1, qué fases downstream se afectan?

| Source Phase | Output | Consumer Phase | Contract | Status |
|---|---|---|---|---|
| Phase 1: AS-IS | Stack inventory | Phase 3b: Feasibility | technology_inventory.json | ✅ Delivered |
| Phase 2: Flow Mapping | Domain taxonomy | Phase 4: Cost | scope_decomposition base | ⚠️ Pending |
| Phase 3: Scenarios | Approved scenario | Phase 3b: Feasibility | scenario_claims.json | ⚠️ In Progress |

- Scope change log: every change to scope, with impact assessment
- Dependency blockers: qué está esperando qué, y quién lo desbloquea

**Diagrama requerido**: Sequence diagram (Mermaid) mostrando flujo de datos entre fases

### S5: Proposal QA Validation (Quality Gate Final)

**SECCIÓN CRÍTICA — el validador final antes de que la propuesta llegue al cliente.**

La Propuesta v1 se construye de los outputs de Phases 4-5b. Antes de enviar al cliente,
pasa por una validación multidimensional:

**Trazabilidad de Fallas QA → Fase Origen:**
Si una dimensión QA falla, la remediación se traza directamente a la(s) fase(s) responsable(s):
- Coherencia falla → re-verificar Phase 3b (feasibility) y Phase 4 (roadmap)
- Completitud falla → re-verificar fase productora del deliverable faltante
- Viabilidad falla → re-verificar Phase 4 (magnitudes) y Phase 5b (pitch claims)
- Alineación falla → re-verificar Phase 1 (AS-IS) y Phase 3 (scenarios)

**5a. Coherencia Técnica**
- ¿El roadmap es coherente con el AS-IS y el escenario aprobado?
- ¿Los cost drivers reflejan el scope real (no el original pre-cambios)?
- ¿La spec funcional cubre todos los flujos mapeados?
- ¿La feasibility aprobó lo que la propuesta propone?

**5b. Completitud**
- ¿Todos los deliverables del manifest están presentes?
- ¿Cada sección tiene profundidad suficiente (no stubs ni placeholders)?
- ¿Los diagramas son consistentes entre deliverables?
- ¿Las cross-references entre documentos resuelven correctamente?

**5c. Viabilidad de Propuesta**
- ¿Lo que se promete en el pitch es respaldado por la spec y el roadmap?
- ¿Los magnitudes de costo son razonables dado el scope?
- ¿El timeline propuesto es realista dado las dependencias?
- ¿Los riesgos están documentados y mitigados?

**5d. Alineación con Hallazgos**
- ¿La propuesta aborda los problemas identificados en AS-IS?
- ¿Los escenarios descartados están justificados?
- ¿Los hallazgos de feasibility/viability se reflejan en guardrails?
- ¿El commercial model es coherente con el valor identificado?

```
PROPOSAL QA SCORECARD
═════════════════════
Proyecto: {nombre}
Propuesta v1 — Validación Pre-Envío

| Dimensión | Score | Hallazgos | Acción |
|---|---|---|---|
| Coherencia Técnica | [X]/5 | {findings} | {action if <4} |
| Completitud | [X]/5 | {findings} | {action if <4} |
| Viabilidad | [X]/5 | {findings} | {action if <4} |
| Alineación | [X]/5 | {findings} | {action if <4} |

COMPOSITE: [X.X]/5.0

VEREDICTO: APROBADA / APROBADA CON CONDICIONES / RECHAZADA
  Threshold mínimo: 3.5/5.0 composite, ninguna dimensión <3

Condiciones (si aplica):
  1. {condición}

LISTA PARA ENVÍO A CLIENTE: SÍ / NO
```

### S6: Status Reporting & Dashboard

- Program health dashboard: RAG status por fase
- Milestone tracking: planned vs actual por phase
- Risk burn-down: riesgos abiertos vs cerrados a lo largo del programa
- Decision log: todas las decisiones tomadas en gates, con rationale

| Phase | Status | Planned End | Actual/Forecast | Variance | RAG |
|---|---|---|---|---|---|
| Phase 0 | ✅ Complete | Day 2 | Day 2 | 0 | 🟢 |
| Phase 1 | 🔄 In Progress | Day 5 | Day 6 (forecast) | +1 day | 🟡 |
| Phase 3b | ⏳ Not Started | Day 10 | — | — | ⚪ |

**Diagrama requerido**: Timeline/Gantt (Mermaid) con estado actual del programa

### S7: Continuous Governance & Lessons Learned

- Retrospective por fase: qué funcionó, qué no, qué mejorar
- Governance effectiveness: ¿los gates atraparon problemas? ¿cuántos issues se detectaron en QA vs post-envío?
- Process improvement recommendations para futuros discoveries
- Metric collection: cycle time por fase, gate pass rate, proposal QA score trends

## Prompt Integration Protocol

El project manager es el backbone de governance que acompaña TODOS los prompts. Se activa implícitamente en cada ejecución de prompt.

### Rol en Cada Prompt

| Prompt | Rol del PM | Sección Activada |
|--------|-----------|-----------------|
| `00-plan-discovery` | Co-autor: Program Charter | S1 (Charter) |
| `01-stakeholder-map` | Receptor: RACI para tracking | S3 (Resources) |
| `02-brief-tecnico` | Monitor: phase status update | S6 (Dashboard) |
| `03-asis-analysis` | Monitor: dependency tracking | S4 (Dependencies) |
| `04-mapeo-flujos` | Monitor: data contract validation | S4 (Dependencies) |
| `05-escenarios` | Gate evaluator: G1 | S2 (Gate Management) |
| `06-solution-roadmap` | Gate evaluator: G2, scope tracking | S2 + S4 |
| `07-spec-funcional` | Monitor: completeness tracking | S6 (Dashboard) |
| `08-pitch-ejecutivo` | QA validator: proposal coherence | S5 (Proposal QA) |
| `09-handover` | Gate evaluator: G3, final QA | S2 + S5 + S7 |
| `revisar` | Executor primario: full QA audit | S5 (Proposal QA) |
| `evolucionar` | Re-validator: post-improvement QA | S5 + S6 |
| `rescatar` | Triage: gate status assessment | S2 + S6 |

### Skill Inventory (48 skills gestionados)

| Dominio | Skills | Cantidad |
|---------|--------|----------|
| Discovery Pipeline | discovery-orchestrator, stakeholder-mapping, workshop-facilitator, asis-analysis, dynamic-sme, flow-mapping, scenario-analysis, technical-feasibility, software-viability, solution-roadmap, cost-estimation, commercial-model, functional-spec, executive-pitch, discovery-handover, mermaid-diagramming | 16 |
| Architecture Design | software-architecture, architecture-tobe, enterprise-architecture, solutions-architecture, infrastructure-architecture, devsecops-architecture, design-system, functional-toolbelt | 8 |
| Data Strategy | data-science-architecture, bi-architecture, data-engineering, database-architecture, data-governance, data-quality, analytics-engineering | 7 |
| Cloud & Mobile | cloud-native-architecture, cloud-migration, mobile-architecture, mobile-assessment | 4 |
| Engineering Excellence | api-architecture, event-architecture, security-architecture, performance-engineering, observability | 5 |
| Consulting & Quality | quality-engineering, testing-strategy, user-representative | 3 |
| Governance & Risk | project-program-management, risk-controlling-dynamics | 2 |
| Delivery & Brand | html-brand, ux-writing, roadmap-poc | 3 |
| **TOTAL** | | **48** |

### Asset Inventory

Todos los 48 skills tienen `examples/` con:
- `sample-output.md` — Output markdown de referencia (Acme Corp Banking Modernization)
- `sample-output.html` — Output HTML branded (Design System CSS)
- `README.md` — Índice de assets

Ubicación: `plugins/sofka-discovery-framework/skills/{skill-name}/examples/`

## Trade-off Matrix

| Decision | Enables | Constrains | When to Use |
|---|---|---|---|
| **Full governance** (all sections) | Maximum confidence, auditable | Overhead en programas pequeños | Discovery >3 phases, high-stakes |
| **Lite governance** (S1+S2+S5) | Fast tracking | Pierde trazabilidad detallada | Discovery ≤3 phases, fast-track |
| **QA-only** (S5) | Focused proposal validation | No tracking history | When proposal exists, need validation |
| **Gate-only** (S2) | Phase transition control | No resource or dependency tracking | Simple sequential pipeline |

## Assumptions & Limits

- Requires discovery pipeline context (phases, deliverables, expert committee)
- Gate criteria assume full pipeline variant; Quick Reference variant has fewer gates
- Resource tracking is planning-level, not actual time tracking
- Proposal QA validates coherence and completeness, NOT domain correctness (that's each skill's job)

## Edge Cases

| Scenario | Response |
|---|---|
| Discovery runs out of order (phase skip) | Flag as governance violation. Document rationale. Assess impact on downstream phases |
| Scope change mid-discovery | Impact assessment across all remaining phases. Re-estimate if >10% scope change |
| Expert unavailable for gate review | Designate alternate. If no alternate, escalate with documented risk |
| Proposal QA fails multiple dimensions | Do NOT send to client. Identify remediation per dimension. Re-run QA after fixes |
| Client requests deliverables before QA | Flag risk. Offer "draft" watermark. Never mark as final pre-QA |
| Pipeline variant = Quick Reference | Adapt to 3-phase subset. QA still mandatory for proposal |

## Validation Gate

- [ ] Program charter with phase dependency map
- [ ] Gate evaluation protocol applied at each quality gate
- [ ] Resource allocation tracked with bottleneck alerts
- [ ] Cross-phase dependencies mapped and monitored
- [ ] Proposal QA scorecard complete (composite ≥3.5/5.0)
- [ ] Status dashboard current with RAG indicators
- [ ] Decision log maintained throughout program
- [ ] Scope change log with impact assessments
- [ ] Diagramas Mermaid: Gantt (programa), flowchart (recursos), sequence (datos)

## Output Format Protocol

| Format | Default | Description |
|--------|---------|-------------|
| `markdown` | ✅ | Rich Markdown + Mermaid diagrams. Token-efficient. |
| `html` | On demand | Branded HTML (Design System). Visual impact. |
| `dual` | On demand | Both formats. |

Default output is Markdown with embedded Mermaid diagrams. HTML generation requires explicit `{FORMATO}=html` parameter.

## Output Artifact

**Primary:** `P-01_Program_Governance_{project}.md` (o `.html` si `{FORMATO}=html|dual`) — Program charter, gate evaluations, resource tracking, dependency control, proposal QA scorecard, status dashboard, lessons learned.

**Diagramas incluidos:**
- Gantt chart: timeline del programa con milestones de gates
- Flowchart: flujo de recursos entre fases
- Sequence diagram: flujo de datos inter-fase

---
**Autor:** Javier Montaño | **Última actualización:** 12 de marzo de 2026
