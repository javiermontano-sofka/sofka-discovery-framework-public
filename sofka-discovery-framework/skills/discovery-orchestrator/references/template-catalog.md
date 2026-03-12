# Template Catalog — Discovery Deliverables

## Format × Deliverable Matrix

| Deliverable | Markdown | HTML | DOCX | XLSX | PPTX |
|------------|----------|------|------|------|------|
| 00_Discovery_Plan | ✅ default | ✅ | ✅ | — | — |
| 01_Stakeholder_Map | ✅ default | ✅ | ✅ | ✅ ¹ | — |
| 02_Brief_Tecnico | ✅ default | ✅ | ✅ | — | ✅ ² |
| 03_Analisis_AS-IS | ✅ default | ✅ | ✅ | — | — |
| 04_Mapeo_Flujos | ✅ default | ✅ | ✅ | — | — |
| 05_Escenarios_ToT | ✅ default | ✅ | ✅ | ✅ ³ | ✅ |
| 06_Solution_Roadmap | ✅ default | ✅ | ✅ | ✅ | — |
| 07_Spec_Funcional | ✅ default | ✅ | ✅ | ✅ ⁴ | — |
| 08_Pitch_Ejecutivo | ✅ default | ✅ | ✅ | — | ✅ ⁵ |
| 09_Handover | ✅ default | ✅ | ✅ | ✅ ⁶ | — |

> ¹ RACI + stakeholder register as structured worksheet
> ² Ideal C-level presentation: 6-8 slides
> ³ Scoring matrix as interactive worksheet
> ⁴ Use case × business rule traceability matrix
> ⁵ Primary presentation format: 10-12 slides
> ⁶ Ops readiness checklist + 90-day plan as tracked worksheet

## Variant Definitions

| Variant | Alias | Audience | Depth | Length | Diagrams |
|---------|-------|----------|-------|--------|----------|
| **A — Ejecutiva** | `ejecutiva` | C-level, sponsors, non-technical stakeholders | Insights + recommendations | ~40% of técnica | 1-2 max |
| **B — Técnica** | `técnica` | Architects, tech leads, implementation team | Full evidence + analysis | Full | 2-4 |

### Variant A — Executive Rules
- TL;DR section is MANDATORY (first thing after title)
- Max 3 tables per deliverable — each ≤8 rows
- Diagrams: only the primary diagram (1, max 2)
- No code references — abstract to component names
- Every section ends with "→ Implicación:" one-liner
- Total length: ~40% of variant B

### Variant B — Technical Rules
- TL;DR section still present (navigation aid)
- Tables as detailed as evidence supports — include all rows
- All prescribed diagrams for the deliverable
- Code references with file:line notation
- Evidence chains: claim → evidence → source → confidence
- Cross-references to other deliverables

---

## Deliverable Templates

### 00 — Discovery Plan

```markdown
# Discovery Plan — {proyecto}
> {1-line: what we're discovering and why}

## TL;DR
- Scope: [what's in / what's out]
- Pipeline variant: [express / intermedio / completo]
- Estimated phases: [N] | Gates: [N] | Deliverables: [N]
- Key risk: [top risk to discovery success]
- Timeline: [estimated duration]

## Scope & Objectives
| Dimension | In Scope | Out of Scope | Rationale |
|-----------|----------|--------------|-----------|

## Pipeline Configuration
| Phase | Skills Activated | Deliverable | Gate |
|-------|-----------------|-------------|------|

## Input Inventory
| Source | Type | Status | Gap Level |
|--------|------|--------|-----------|

## Risk Register (Discovery Risks)
| Risk | Probability | Impact | Mitigation |
|------|------------|--------|------------|

## Success Criteria
| Criterion | Metric | Threshold |
|-----------|--------|-----------|
```

### 01 — Stakeholder Map

```markdown
# Stakeholder Map — {proyecto}
> {1-line: who matters, who decides, who's affected}

## TL;DR
- Stakeholders identified: [N]
- Key decision-maker: [name/role]
- Highest change resistance: [area]
- Communication cadence: [frequency]
- Critical gap: [if any]

## Stakeholder Register
| ID | Name/Role | Organization | Influence | Interest | Category |
|----|-----------|-------------|-----------|----------|----------|

> **Quadrant**: 🔴 Manage closely | 🟠 Keep satisfied | 🟡 Keep informed | 🟢 Monitor

> **Figure 1**: Influence × Interest positioning of key stakeholders.
[mermaid: quadrantChart]

## RACI Matrix
| Activity | {Role A} | {Role B} | {Role C} | {Role D} |
|----------|----------|----------|----------|----------|
> R=Responsible A=Accountable C=Consulted I=Informed

## Communication Plan
| Stakeholder Group | Channel | Frequency | Content | Owner |
|-------------------|---------|-----------|---------|-------|

## Change Readiness
| Dimension | Score | Evidence | Risk |
|-----------|-------|----------|------|

> **Figure 2**: Organizational structure and reporting lines.
[mermaid: mindmap]
```

### 02 — Brief Técnico

```markdown
# Brief Técnico AS-IS — {proyecto}
> {1-line: system health verdict + most critical finding}

## TL;DR
- Health: [🟢/🟡/🔴] — [one-line justification]
- Stack: [primary technologies]
- Top risk: [description + magnitude]
- Top opportunity: [description + estimated impact]
- Recommendation: [GO / CONDITIONAL / NO-GO for deeper discovery]

## Technology Snapshot
| Layer | Technology | Version | Status | EOL | Notes |
|-------|-----------|---------|--------|-----|-------|
> 🟢 Current | 🟡 <12mo EOL | 🔴 EOL/unsupported

## Health Semaphore
| Dimension | Score | Trend | Key Finding |
|-----------|-------|-------|-------------|
| Code Quality | 🟢/🟡/🔴 | ↑↓→ | |
| Security | | | |
| Technical Debt | | | |
| Infrastructure | | | |
| Observability | | | |
| Data Integrity | | | |

> **Figure 1**: Stack overview showing technology layers and versions.
[mermaid: mindmap]

## Top 5 Findings
| # | Finding | Severity | Evidence | Implication |
|---|---------|----------|----------|-------------|
> Each finding: what + where + so what

## Top 5 Risks
| # | Risk | Probability | Impact | Mitigation | Kill Criteria |
|---|------|------------|--------|------------|---------------|

## Executive Recommendation
> [3-5 lines: what to do, why, what happens if you don't]
```

### 03 — Análisis AS-IS

```markdown
# Análisis AS-IS — {proyecto}
> {1-line: overall health + primary structural concern}

## TL;DR
- Architecture: [style] — [health verdict]
- Codebase: [LOC] across [N] modules
- Debt ratio: [estimated %] — [trend]
- Security: [N] findings ([N] critical)
- Recommendation: [primary action]

## 1. Technology Inventory
| Component | Version | License | Status | Alternatives |
|-----------|---------|---------|--------|-------------|
> ¹ Status: 🟢 Active support | 🟡 Maintenance | 🔴 EOL

## 2. Architecture Assessment
> **Figure 1**: C4 Context — system boundaries.
[mermaid: C4Context]

> **Figure 2**: C4 Container — internal structure. [TÉCNICA only]
[mermaid: C4Container]

| Quality Attribute | Current State | Target | Gap | Priority |
|-------------------|--------------|--------|-----|----------|

## 3. Technical Debt Inventory
| ID | Debt Item | Type | Location | Severity | Effort to Fix | Interest Rate ¹ |
|----|-----------|------|----------|----------|---------------|-----------------|
> ¹ Interest Rate = how fast this debt accumulates cost if not addressed

## 4. Security Assessment
| Finding | OWASP Category | Severity | Location | Remediation |
|---------|---------------|----------|----------|-------------|

## 5. Code Quality
| Metric | Value | Benchmark | Verdict |
|--------|-------|-----------|---------|

## 6. Infrastructure
| Component | Config | Scalability | HA/DR | Cost Driver |
|-----------|--------|-------------|-------|-------------|

## 7. Observability
| Dimension | Coverage | Tool | Gap |
|-----------|----------|------|-----|

## 8. Data Layer
| Store | Type | Size | Backup | Migration Complexity |
|-------|------|------|--------|---------------------|

## 9. Integration Map
| Integration | Protocol | Direction | SLA | Health |
|-------------|----------|-----------|-----|--------|

## 10. Recommendations
| Priority | Recommendation | Rationale | Effort | Impact |
|----------|---------------|-----------|--------|--------|
```

### 04 — Mapeo de Flujos

```markdown
# Mapeo de Flujos — {proyecto}
> {1-line: N bounded contexts, N flows mapped, top integration risk}

## TL;DR
- Bounded contexts: [N]
- E2E flows mapped: [N]
- Integration points: [N] ([N] critical)
- Top failure point: [name] — [risk level]
- Domain language alignment: [high/medium/low]

## DDD Taxonomy
### Bounded Contexts
| Context | Responsibility | Owner | Dependencies |
|---------|---------------|-------|-------------|

### Context Map
> **Figure 1**: Bounded context relationships and communication patterns.
[mermaid: flowchart]

### Ubiquitous Language
| Term | Context | Definition | Aliases to Avoid |
|------|---------|-----------|-----------------|

## E2E Business Flows
### Flow [N]: {Name}
> **Figure N**: {Flow name} — happy path + exception handling.
[mermaid: sequenceDiagram]

| Step | Actor | Action | System | Validation | Exception |
|------|-------|--------|--------|-----------|-----------|

## Integration Matrix
| Source | Target | Protocol | Data | SLA | Failure Mode | Recovery |
|--------|--------|----------|------|-----|-------------|----------|

## Top 10 Failure Points
| Rank | Point | Probability | Impact | Detection | Recovery Time |
|------|-------|------------|--------|-----------|--------------|

## Dependency Graph
> **Figure N**: System dependency graph with critical path highlighted.
[mermaid: flowchart with subgraphs]
```

### 05 — Escenarios ToT

```markdown
# Análisis de Escenarios — {proyecto}
> {1-line: recommended scenario + confidence level}

## TL;DR
- Scenarios evaluated: [N]
- Recommended: [name] (score: X.X/5.0)
- Runner-up: [name] (Δ: X.X)
- Key differentiator: [what tips the balance]
- Confidence: [alta/media/baja] — [why]

## Scenario Descriptions
### Scenario [N]: {Name}
| Dimension | Detail |
|-----------|--------|
| Philosophy | |
| Scope | |
| Timeline | |
| Preconditions | |
| Key Risk | |

## Scoring Matrix
| Dimension (weight) | Sc. A | Sc. B | Sc. C | Method |
|--------------------|-------|-------|-------|--------|
| Viabilidad técnica (20%) | | | | |
| Impacto negocio (25%) | | | | |
| Riesgo ejecución (15%) | | | | |
| Time-to-value (15%) | | | | |
| Costo relativo (15%) | | | | |
| Deuda residual (10%) | | | | |
| **Weighted Total** | **X.X** | **X.X** | **X.X** | |
> ¹ Scale: 1-5 where 5 = best. Each cell has justification.

> **Figure 1**: Scenario positioning — feasibility × business impact.
[mermaid: quadrantChart]

## SWOT per Scenario
| | Strengths | Weaknesses | Opportunities | Threats |
|---|-----------|-----------|--------------|---------|
| Sc. A | | | | |

## Decision Tree
> **Figure 2**: Tree-of-Thought — criteria-driven scenario selection.
[mermaid: flowchart TD]

## Switching Logic
| Trigger | From | To | Signal | Deadline |
|---------|------|----|--------|----------|

## Panel Recommendation
> [Verdict + justification + dissenting views + conditions of validity]
```

### 06 — Solution Roadmap

```markdown
# Solution Roadmap — {proyecto}
> {1-line: N phases, magnitude in FTE-months, P80 timeline}

## TL;DR
- Phases: [N] over [X-Y] months (P80)
- Magnitude: [X] FTE-months (base scenario)
- Team peak: [N] FTE
- First deliverable: [what] at [when]
- Critical dependency: [what]

## ⚠️ Disclaimer de Costeo
> Las magnitudes son indicadores de orden basados en análisis técnico.
> NO constituyen cotización ni compromiso de precio.
> Incluyen 5% de margen de innovación para excelencia operativa.

## Roadmap de Fases
| Phase | Objective | Duration (P50/P80/P95) | Gate | Key Deliverable |
|-------|-----------|----------------------|------|-----------------|

> **Figure 1**: Phased timeline with confidence intervals.
[mermaid: gantt]

## Cost Driver Taxonomy
| Category | Drivers | Amplifiers | Reducers |
|----------|---------|-----------|----------|

> **Figure 2**: Cost driver categories and relationships.
[mermaid: mindmap]

## Team Model
| Phase | Role | Seniority | FTE | Duration | Ramp |
|-------|------|-----------|-----|----------|------|
> NO rates/prices. Only FTE-months.

## Magnitude Framing
| Scenario | FTE-Months | Duration | Team Peak | Innovation 5% |
|----------|-----------|----------|-----------|---------------|
| Conservador | | | | |
| Base | | | | |
| Agresivo | | | | |

## Monte Carlo
| Metric | P50 | P80 | P95 | Variance Factors |
|--------|-----|-----|-----|-----------------|

## Pivot Points
| # | When | Trigger Signal | Options | Decision Criteria | Impact |
|---|------|---------------|---------|-------------------|--------|

> **Figure 3**: Pivot decision tree.
[mermaid: flowchart]
```

### 07 — Especificación Funcional

```markdown
# Especificación Funcional — {proyecto}
> {1-line: N modules, N use cases, primary complexity driver}

## TL;DR
- Modules: [N] ([N] high-complexity)
- Use cases: [N] (MoSCoW: [M] must, [S] should, [C] could)
- Business rules: [N]
- Critical path: [module chain]
- Highest risk module: [name] — [why]

## Module Architecture
| Module | Responsibility | Priority | Interfaces | Dependencies |
|--------|---------------|----------|-----------|-------------|

> **Figure 1**: Module dependency map with critical path.
[mermaid: flowchart]

## Use Cases
### UC-{NN}: {Name}
| Field | Detail |
|-------|--------|
| Actor | |
| Preconditions | |
| Priority (MoSCoW) | |
| Business Rules | BR-{NN}, BR-{NN} |

| Step | Action | System Response | Validation |
|------|--------|----------------|-----------|
| 1 | | | |

**Alternatives**: [numbered exception flows]
**Postconditions**: [state after completion]

## Business Rules
| ID | Name | Condition → Action | Exceptions | Source | Affected UCs |
|----|------|-------------------|-----------|--------|-------------|

## Complexity-Risk Matrix
| Module | Technical Complexity | Business Risk | Effort (T-shirt) | Blockers |
|--------|---------------------|--------------|-------------------|----------|
> 🔴 High | 🟡 Medium | 🟢 Low

> **Figure 2**: Core entity relationships.
[mermaid: erDiagram]

## NFRs
| Category | Requirement | Metric | Target | Validation Method |
|----------|------------|--------|--------|-------------------|

## Dependency Map
> **Figure 3**: Inter-module dependencies with circular dependency detection.
[mermaid: flowchart]
```

### 08 — Pitch Ejecutivo

```markdown
# Pitch Ejecutivo — {proyecto}
> {1-line: investment thesis in one sentence}

## TL;DR
- Costo de inacción: [magnitude per year]
- Inversión: [X] FTE-months (base scenario)
- Valor esperado: [primary metric improvement]
- Payback: [X-Y] months (range)
- Ask: [specific action + deadline]

## ⚠️ Nota sobre Cifras
> NPV, IRR y payback son indicadores de magnitud. No constituyen proyecciones
> financieras ni compromisos comerciales. Incluyen 5% margen de innovación.

## Costo de Inacción
| Dimension | Magnitude/Year | Horizon | Trend | Evidence |
|-----------|---------------|---------|-------|----------|
| Deuda técnica acumulada | | | ↑ | |
| Ventana de exposición seguridad | | | | |
| Costo de oportunidad | | | | |
| Riesgo de talento | | | | |

## 4 Pilares de Valor
| Pilar | Métrica Actual | Métrica Objetivo | Delta | Horizonte | Evidencia |
|-------|---------------|-----------------|-------|-----------|-----------|

> **Figure 1**: Value pillars and their impact dimensions.
[mermaid: mindmap]

## Estructura de Inversión
| Scenario | FTE-Months | Duration | Team | Innovation 5% |
|----------|-----------|----------|------|---------------|
> ⚠️ Magnitudes, NO precios. Costeo final en fase de propuesta comercial.

> **Figure 2**: Investment timeline by phase.
[mermaid: gantt]

## Modelo Financiero (Indicativo)
| Indicator | Conservative | Base | Aggressive | Assumptions |
|-----------|-------------|------|-----------|-------------|
| NPV Range | | | | |
| IRR Range | | | | |
| Payback | | | | |

## Call to Action
| Element | Detail |
|---------|--------|
| Acción solicitada | |
| Deadline propuesto | |
| Siguiente paso concreto | |
| Consecuencia de no actuar | |
```

### 09 — Handover Operacional

```markdown
# Handover Operacional — {proyecto}
> {1-line: transition status + readiness level + first milestone}

## TL;DR
- Discovery status: [completo/parcial]
- Readiness: [N]% of checklist items ready
- First milestone: [what] at [when]
- Critical blocker: [if any]
- Handover owner: [role]

## Transition Summary
| Deliverable | Key Finding | Status | Action Required |
|-------------|------------|--------|-----------------|
| 00-09 (one row each) | | | |

## Commercial Activation
| Element | Detail | Owner | Date |
|---------|--------|-------|------|
| Propuesta de valor | | | |
| Escenario seleccionado | | | |
| Magnitud de inversión | | | |
| Timeline de propuesta | | | |

## Ops Readiness Checklist
| Item | Status | Owner | Deadline | Blocker |
|------|--------|-------|----------|---------|
> ✅ Ready | ⏳ In progress | ❌ Blocked | ⬜ Not started

## Plan de 90 Días
### Month 1 (Week by Week)
| Week | Objectives | Deliverables | Metrics | Risks |
|------|-----------|-------------|---------|-------|

> **Figure 1**: 90-day plan timeline.
[mermaid: gantt]

### Month 2-3 (Monthly)
| Month | Objectives | Milestones | Success Metrics |
|-------|-----------|-----------|-----------------|

## Governance Transition
| Aspect | Discovery Phase | Execution Phase |
|--------|----------------|-----------------|
| Cadence | | |
| Decision authority | | |
| Escalation path | | |
| Reporting | | |
| Quality gates | | |

> **Figure 2**: Governance and escalation flow.
[mermaid: flowchart]

## Risk Tracker
| Risk | Probability | Impact | Mitigation | Owner | Review | Kill Criteria |
|------|------------|--------|------------|-------|--------|---------------|

## Stakeholder Transition
| Stakeholder | Discovery Role | Execution Role | Handover | Risk |
|-------------|---------------|----------------|----------|------|

> **Figure 3**: Discovery-to-execution transition lifecycle.
[mermaid: stateDiagram-v2]
```

---

## Format-Specific Adaptation Notes

### DOCX (via brand-docx skill)
- Cover page: project name, date, confidentiality level, version
- Table of contents auto-generated from H1/H2/H3
- Headers/footers with brand, page numbers, document ID
- Tables: branded header row, alternating row shading
- Mermaid diagrams: export as PNG and embed as images
- Footnotes: native Word footnotes (not inline)

### XLSX (via brand-xlsx skill)
- Tab 1: Dashboard summary with KPI boxes
- Tab 2+: Data tables with filters and conditional formatting
- Formulas: totals, weighted scores, % completion
- Charts: native Excel charts mirroring Mermaid intent
- Print area: set for each tab
- Suitable deliverables: 01 (RACI), 05 (scoring), 06 (financials), 07 (traceability), 09 (checklists)

### PPTX (brand guidelines applied manually)
- Slide master: brand colors, fonts, logo placement
- Max 6 words per bullet, max 6 bullets per slide
- One key message per slide
- Diagrams as full-slide visuals
- Speaker notes with detailed evidence
- Suitable deliverables: 02 (6-8 slides), 05 (scoring summary), 08 (10-12 slides)

### HTML (via brand-html / brand-html-extended skill)
- Full Design System: colors, fonts, spacing, components
- Mermaid rendered via `<pre class="mermaid">` + CDN
- Print stylesheet included
- Responsive layout
- Self-contained (single file)
