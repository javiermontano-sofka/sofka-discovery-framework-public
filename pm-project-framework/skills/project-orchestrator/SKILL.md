---
name: apex-project-orchestrator
description: >
  This skill should be used when the user asks to "run a project pipeline", "orchestrate PM workflow",
  "start a project engagement", "coordinate the PM team", "plan a project lifecycle",
  "manage project inputs", "sequence project phases", or mentions project orchestration,
  phase sequencing, quality gates, data contracts, expert committee, PMO pipeline,
  consulting engagement. Always use this skill as the entry point for any PMO-APEX engagement.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - WebFetch
---

# PMO-APEX Project Orchestrator

**TL;DR**: The single entry point for every PMO-APEX project engagement. Coordinates 100 specialized skills across 12 domains, assembles a dynamic expert committee adapted per `{TIPO_PROYECTO}`, enforces quality gates, manages inter-phase data contracts, and maintains a living project plan with input tracking. This skill does NOT perform deep analysis — it sequences, validates, and coordinates.

## Service Type Parameter

`{TIPO_PROYECTO}`: `Agile` (default) | `Kanban` | `SAFe` | `Waterfall` | `Hybrid` | `PMO` | `Portfolio` | `Transformation` | `Recovery` | `Multi-Method`

Determines: skill variants activated, expert committee composition, input requirements, deliverable naming, estimation method. See `references/ontology/service-routing.md` for detection rules.

### Auto-Detection Rules (Priority Order)
1. Explicit parameter in command invocation
2. User states project type in prompt
3. "sprint", "scrum", "backlog", "velocity", "user story" → Agile
4. "kanban", "WIP limit", "cycle time", "flow" → Kanban
5. "SAFe", "PI planning", "ART", "value stream" → SAFe
6. "PMBOK", "PRINCE2", "Gantt", "stage gate", "waterfall" → Waterfall
7. "hybrid", "agile-waterfall", mixed signals → Hybrid
8. "PMO", "governance model", "project management office" → PMO
9. "portfolio", "program", "multi-project", "PPM" → Portfolio
10. "rescue", "troubled", "red project", "turnaround" → Recovery
11. 2+ detection signals → Multi-Method
12. Default → Agile

Always confirm detected project type with user before proceeding.

### Estimation Method per Type
| Type | Method |
|------|--------|
| Agile | Story points + velocity |
| Kanban | Cycle time + throughput |
| SAFe | PI velocity + capacity allocation |
| Waterfall | FTE-meses + Gantt |
| Hybrid | Mixto (SP + FTE) |
| PMO/Portfolio | FTE-meses + portfolio units |
| Transformation | Program increments |
| Recovery | Sprints to green |

## Principio Rector

**Un proyecto sin orquestación es un conjunto de actividades inconexas disfrazadas de gestión.** Este skill impone secuencia, validación y trazabilidad sobre el pipeline completo: cada fase tiene un responsable, cada gate tiene criterios, cada contrato de datos se verifica. La orquestación es lo que convierte 100 skills individuales en un programa de dirección de proyectos confiable.

### Filosofía de Orquestación

1. **Secuencia con propósito.** Cada fase existe porque la anterior la alimenta. Saltar fases no es eficiencia — es riesgo no gestionado.
2. **Gates como puntos de decisión.** Cada gate exige evidencia verificable antes de continuar. Sin evidencia, no hay avance.
3. **Comité dinámico.** Los expertos se activan según la fase y el tipo de proyecto. No todos participan en todo momento.
4. **Contratos de datos.** Cada fase produce outputs tipados que la siguiente consume. El orquestador valida la completitud y coherencia.
5. **Trazabilidad end-to-end.** Desde el charter hasta el cierre, cada decisión es rastreable hasta un objetivo de negocio.

## Assumptions & Limits
- Assumes a project brief or request document exists as starting input [PLAN]
- Assumes user will confirm detected {TIPO_PROYECTO} before pipeline proceeds [STAKEHOLDER]
- Breaks when project has no sponsor and no stakeholder willing to authorize — pipeline cannot start
- This skill orchestrates but does NOT perform deep analysis; each phase delegates to specialized skills
- Assumes organizational context (industry, PMO maturity) is provided or discoverable [SUPUESTO]
- Limited to single-project pipelines; multi-project programs use `program-management`

## Usage

```bash
# Full autonomous pipeline
/pm:run-auto $ARGUMENTS="--brief project-request.md --type Agile"

# Express pipeline (3 deliverables)
/pm:run-express --brief rfp.pdf --type Waterfall

# Guided pipeline with human facilitation
/pm:run-guided --type SAFe --projects 8
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Path to project brief or request |
| `--type` | No | Project type (auto-detected if omitted) |
| `--mode` | No | `auto`, `guided`, `express`, `deep` |
| `--phase` | No | Start from specific phase (for resuming) |

## Before Orchestrating
1. **Read** the project brief or request document to understand scope and context [PLAN]
2. **Glob** `project/session-state.json` to check if a pipeline is already in progress [PLAN]
3. **Read** `references/ontology/service-routing.md` to validate {TIPO_PROYECTO} detection [PLAN]
4. **Grep** for methodology keywords in the brief to auto-detect project type [INFERENCIA]

## Pipeline Phases (10 phases, 16 deliverables, 5 gates)

```
Phase 0 → Initiation (Charter, Stakeholder Map)
Phase 1 → Context & Scoping (Scope, WBS)
Phase 2 → Planning & Baseline (Schedule, Resources, Budget)
Phase 3 → Risk & Methodology (Risk Register, Methodology Selection)
    ↓ GATE 1: Post-Risk (registro completo, schedule-resource alineado)
Phase 3b → Steering Committee Review (7 Advisors, Go/No-Go)
    ↓ GATE 1.5: Post-Steering (≥5/7 Go votes)
Phase 4 → Execution Framework (Methodology Playbook, DoD)
    ↓ GATE 2: Post-Methodology (DoD establecido, tool stack confirmado)
Phase 5 → Communication & Dashboard
Phase 6 → Kickoff Package
    ↓ GATE 3: Final (cross-consistency, excellence loop ≥8/10)
Phase 7 → Reports (Status, EVM, Lessons, PMO Health, Closure)
```

### Phase 0: Initiation
- **Skills**: `project-charter`, `stakeholder-register`, `input-analysis`, `assumption-log`
- **Deliverables**: 00_Project_Charter, 01_Stakeholder_Register
- **Output**: Charter aprobado, mapa de stakeholders, log de supuestos

### Phase 1: Context & Scoping
- **Skills**: `scope-wbs`, `governance-framework`
- **Deliverable**: 02_Scope_WBS
- **Output**: WBS completo, statement of scope, boundaries

### Phase 2: Planning & Baseline
- **Skills**: `schedule-baseline`, `resource-plan`, `budget-baseline`, `procurement-plan`, `integration-plan`, `benefits-realization-plan`, `capacity-planning`
- **Deliverables**: 03_Schedule_Baseline, 04_Resource_Plan
- **Output**: Gantt con critical path, plan de recursos, presupuesto base

### Phase 3: Risk & Methodology
- **Skills**: `risk-register`, `risk-quantification`, `risk-response-planning`, `methodology-assessment`, `quality-plan`
- **Deliverable**: 05_Risk_Register
- **Output**: Registro de riesgos cuantificado, evaluación metodológica

┌─────────────────────────────────────────────────┐
│  >>> GATE 1: POST-RISK <<<                      │
│  HARD STOP. Riesgos cuantificados, schedule-    │
│  resource alineado, WBS 100% scope, <40%        │
│  [SUPUESTO]. Aprobadores: project-conductor +   │
│  quality-auditor + risk-manager                 │
└─────────────────────────────────────────────────┘

### Phase 3b: Steering Committee Review
- **Skills**: `steering-review`
- **Deliverable**: 05b_Steering_Committee_Review
- **Advisors**: portfolio-analyst, financial-modeler, risk-analyst, resource-optimizer, compliance-analyst, methodology-architect, stakeholder-engagement-specialist
- **Output**: Veredicto Go/No-Go/Condicional (≥5/7 Go para avanzar)

┌─────────────────────────────────────────────────┐
│  >>> GATE 1.5: POST-STEERING <<<                │
│  HARD STOP. ≥5/7 Go votes, budget aprobado,     │
│  alineación estratégica confirmada.             │
└─────────────────────────────────────────────────┘

### Phase 4: Execution Framework
- **Skills**: `methodology-playbook`, `scrum-framework`, `kanban-system`, `safe-framework`, `waterfall-framework`, `hybrid-methodology`, `ceremony-design`, `definition-of-done`
- **Deliverable**: 06_Methodology_Playbook
- **Output**: Playbook tailored, ceremonias definidas, DoD/DoR

┌─────────────────────────────────────────────────┐
│  >>> GATE 2: POST-METHODOLOGY <<<               │
│  HARD STOP. Metodología justificada, DoD        │
│  establecido, tool stack confirmado, ceremonias │
│  definidas con cadencia.                        │
└─────────────────────────────────────────────────┘

### Phase 5: Communication & Dashboard
- **Skills**: `communication-plan`, `executive-dashboard`, `raci-matrix`, `engagement-strategy`
- **Deliverables**: 07_Communication_Plan, 08_Executive_Dashboard
- **Output**: Plan de comunicación, RACI, dashboard ejecutivo

### Phase 6: Kickoff Package
- **Skills**: `kickoff-package`, `onboarding-playbook`, `ceremony-facilitation`
- **Deliverable**: 09_Kickoff_Package
- **Output**: Paquete de kickoff listo para activación del equipo

┌─────────────────────────────────────────────────┐
│  >>> GATE 3: FINAL <<<                          │
│  HARD STOP. Cross-consistency verificada,       │
│  excellence loop ≥8/10, <20% [SUPUESTO],        │
│  RACI completo. Tríada + editorial-director.    │
└─────────────────────────────────────────────────┘

### Phase 7: Reports
- **Skills**: `status-report`, `earned-value-analysis`, `lessons-register`, `pmo-health-check`, `closure-report`
- **Deliverables**: 10_Status_Report, 11_EVM_Analysis, 12_Lessons_Register, 13_PMO_Health_Check (INTERNAL), 14_Closure_Report

## Expert Committee (55 agents, 4 levels)

### Level 1 — Permanent Triad (always active, FULL meta-cognition)
| Agent | Role | Authority |
|-------|------|-----------|
| `project-conductor` | Orchestrator: phases, gates, contracts | Process enforcement (NO analysis) |
| `delivery-lead` | Timeline, scope, resources, velocity | Shared with risk-manager |
| `risk-manager` | Quality, compliance, evidence audit | Full (deliverables pass/fail) |

### Level 2 — Core Team (9, LIGHT meta-cognition)
| Agent | Specialty | Phases |
|-------|-----------|--------|
| `quality-auditor` | Acceptance criteria validation | Gates G1-G3 |
| `methodology-architect` | Methodology selection, ceremony design | 0-4 |
| `schedule-planner` | Schedule baseline, critical path, Gantt | 2-6 |
| `budget-controller` | Budget baseline, EVM, cost tracking | 2-6 |
| `scope-analyst` | WBS, scope management, change control | 1-5 |
| `editorial-director` | Narrative coherence, quality editorial | All |
| `format-specialist` | Multi-format production (HTML, DOCX) | 7 |
| `communication-strategist` | Stakeholder comms, reporting | 5-7 |
| `change-controller` | Change requests, CCB, impact analysis | 4-7 |

### Level 3 — Domain Specialists (36, activated by {TIPO_PROYECTO} + phase)
Organized in 7 subgroups: Agile & Scaled (6), Traditional & Governance (5), Risk & Quality (5), Resource & Team (5), Finance & Value (5), Technical Integration (5), Stakeholder & Communication (5).

### Level 4 — Steering Committee (7 Advisors, Phase 3b only)
| Advisor | Perspective |
|---------|-------------|
| `portfolio-analyst` | Strategic alignment |
| `financial-modeler` | Financial viability |
| `risk-analyst` | Risk exposure |
| `resource-optimizer` | Resource feasibility |
| `compliance-analyst` | Regulatory compliance |
| `methodology-architect` | Methodology fit |
| `stakeholder-engagement-specialist` | Stakeholder readiness |

Decision rule: ≥5/7 Go votes required to advance past Gate 1.5.

### Dynamic Committee by {TIPO_PROYECTO}
| Type | Add/Replace |
|------|-------------|
| **Agile** | + scrum-master, agile-coach, product-owner-proxy |
| **Kanban** | + kanban-coach |
| **SAFe** | + safe-consultant, agile-coach |
| **Waterfall** | + pmbok-specialist, prince2-practitioner |
| **Hybrid** | + agile-coach, pmbok-specialist |
| **PMO** | + pmo-architect, portfolio-analyst |
| **Portfolio** | + portfolio-analyst, financial-modeler |
| **Transformation** | + agile-coach, pmo-architect |
| **Recovery** | + risk-analyst, contingency-planner |
| **Multi-Method** | Expanded committee (max 10) |

## Data Contracts Between Phases

```
Phase 0 → Phase 1:
  - charter.approved = true
  - stakeholder_register.count >= 1
  - assumption_log.initial = true

Phase 1 → Phase 2:
  - scope_wbs.approved = true
  - schedule_baseline.critical_path_defined = true
  - budget_baseline.contingency_set = true

Phase 2 → Phase 3:
  - methodology.selected = true
  - ceremony_calendar.defined = true
  - definition_of_done.approved = true

Phase 3 → Phase 4:
  - risk_register.populated = true
  - quality_plan.approved = true
  - governance_model.approved = true

Phase 4 → Phase 5:
  - execution_metrics.cpi >= 0.9
  - execution_metrics.spi >= 0.9
  - status_reports.current = true

Phase 5 → Phase 6:
  - portfolio_alignment.verified = true
  - benefits_tracking.active = true

Phase 6 → Closure:
  - lessons_captured = true
  - formal_acceptance.signed = true
  - benefits_realized.assessed = true
```

## Orchestration Modes

| Mode | Description | Human Involvement |
|------|-------------|-------------------|
| `auto` | Full autonomous pipeline | Gates only |
| `guided` | Phase-by-phase with facilitation | Every phase |
| `express` | Charter + Plan + Risk (3 deliverables) | Minimal |
| `deep` | All phases + Monte Carlo + portfolio | Every gate |

## Entrada (Input Requirements)

- Project brief or request document (any format)
- Sponsor identification
- High-level timeline and budget constraints (if available)
- Organization context (industry, size, PMO maturity)
- Existing methodology preferences (if any)
- Prior project artifacts (optional, for lessons learned)

## Proceso (Protocol)

1. **Receive & classify** — Analyze project brief, detect `{TIPO_PROYECTO}`, confirm with user
2. **Assemble committee** — Activate relevant experts based on project type and scope
3. **Execute Phase 0** — Generate charter, identify stakeholders, log assumptions
4. **Validate Gate G0** — Charter approved before proceeding
5. **Execute Phase 1** — Build planning baselines (scope, schedule, budget, resources)
6. **Validate Gate G1** — All baselines approved and integrated
7. **Execute Phase 2** — Select and tailor methodology
8. **Validate Gate G1.5** — Methodology approved and ceremonies defined
9. **Execute Phase 3** — Establish risk, quality, and governance frameworks
10. **Execute Phase 4** — Monitor execution with EVM, dashboards, status reports
11. **Validate Gate G2** — Execution metrics within acceptable thresholds
12. **Execute Phase 5** — Integrate with portfolio and PMO (if applicable)
13. **Execute Phase 6** — Close project, capture lessons, assess benefits
14. **Validate Gate G3** — Formal closure with all deliverables accepted
15. **Archive & handoff** — Package all artifacts for organizational learning

## Edge Cases
1. **User wants to skip phases** — Warn that skipping creates risk. Document the skip decision with [STAKEHOLDER] tag and rationale. Adjust data contracts to mark skipped outputs as [SUPUESTO].
2. **Gate failure with no clear remediation** — Pause pipeline. Activate the relevant specialist agent for root cause analysis. Do not proceed until gate criteria are met or sponsor authorizes exception [STAKEHOLDER].
3. **Pipeline resumed after long gap (>30 days)** — Re-validate all prior deliverables for currency. Run health check on existing artifacts before proceeding [PLAN].
4. **Multiple project types detected** — Default to Multi-Method. Confirm with user. If confirmed, activate expanded committee with specialists from each detected methodology [INFERENCIA].

## Example: Good vs Bad

**Good example — Well-orchestrated pipeline:**

| Attribute | Value |
|-----------|-------|
| Project type | Detected as Agile, confirmed by user |
| Phase progression | Sequential with all gates passed |
| Data contracts | 100% validated between phases |
| Committee | Triad + 4 specialists activated per phase |
| Evidence ratio | 78% [PLAN]/[SCHEDULE], 22% [INFERENCIA] |

**Bad example — Pipeline theater:**
All phases "completed" in a single session with no gate validation, no data contract verification, and all deliverables marked [SUPUESTO]. This is documentation theater, not project management. Without gates and evidence, the pipeline produces artifacts that look professional but contain no validated content.

## Salida (Deliverables)

- Integrated project plan with all baselines
- Methodology playbook tailored to project type
- Risk register with quantified impacts
- Quality and governance framework
- Status reports and executive dashboards
- Closure report with lessons learned
- Benefits realization assessment

## Validation Gate
- [ ] {TIPO_PROYECTO} confirmed with user before pipeline start [STAKEHOLDER]
- [ ] Every phase produces ≥1 deliverable with evidence tags [PLAN]
- [ ] Every gate has pass/fail decision documented with evidence [PLAN]
- [ ] Data contracts between phases validated with ≥90% completeness [METRIC]
- [ ] Expert committee composition matches {TIPO_PROYECTO} routing [PLAN]
- [ ] Evidence ratio across all deliverables: <30% [SUPUESTO] [METRIC]
- [ ] Cross-deliverable consistency verified at Gate G3 [PLAN]
- [ ] Excellence loop score ≥8/10 on final deliverable set [METRIC]
- [ ] All stakeholder decisions documented with [STAKEHOLDER] tag [STAKEHOLDER]
- [ ] Pipeline state persisted in session-state.json for continuity [PLAN]

## Escalation Triggers

1. **Budget variance > 15%** — Escalate to sponsor with corrective action plan
2. **Schedule delay > 2 weeks on critical path** — Trigger fast-track or crash analysis
3. **>30% assertions are [SUPUESTO]** — Display mandatory warning banner
4. **Risk with severity=CRITICAL + [SUPUESTO]** — Flag for immediate validation
5. **Gate failure** — Document reasons, identify remediation, re-submit
6. **Stakeholder conflict unresolved > 5 days** — Escalate to governance board
7. **Team velocity declining 3+ sprints** — Trigger team health assessment

## Anti-Patterns

1. **Waterfall disguised as agile** — Ceremonies without empiricism
2. **Plan-once syndrome** — Baselines never revisited
3. **Gate rubber-stamping** — Gates approved without evidence review
4. **Risk theater** — Risk register exists but never updated
5. **Methodology cargo cult** — Adopting framework without understanding principles

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before starting to understand standards and frameworks | `references/body-of-knowledge.md` |
| State of the Art | When benchmarking against industry trends | `references/state-of-the-art.md` |
| Knowledge Graph | To understand skill dependencies and data flow | `references/knowledge-graph.mmd` |
| Use Case Prompts | For specific scenarios and prompt templates | `prompts/use-case-prompts.md` |
| Metaprompts | To enhance output quality and reduce bias | `prompts/metaprompts.md` |
| Sample Output | Reference for deliverable format and structure | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
- **Naming**: `{fase}_{entregable}_{proyecto}_{WIP|Aprobado}.{ext}`
