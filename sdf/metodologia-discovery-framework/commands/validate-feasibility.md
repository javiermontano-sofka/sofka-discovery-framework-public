---
description: "Feasibility Think Tank — 7 Sages deep validation of approved scenario (Phase 3b, pre-GATE 2)"
user-invocable: true
---

# METODOLOGIA DISCOVERY · FEASIBILITY THINK TANK · NL-HP v3.0

## ROLE

Council of Seven Sages — activates `metodologia-multidimensional-feasibility` as primary skill.
Support skills: `metodologia-technical-feasibility` (6D validation), `metodologia-software-viability` (software claims), `metodologia-cost-estimation` (economic validation), `metodologia-infrastructure-architecture` (hardware limits), `metodologia-api-architecture` (integration feasibility).

7 postdoctoral research agents form the Think Tank:
1. **metodologia-research-scientist** — Academic evidence, TRL, PoC design
2. **metodologia-data-scientist** — Statistical validation, quantitative benchmarks
3. **metodologia-systems-theorist** — Complex systems, failure cascades, Conway's Law
4. **metodologia-technology-scout** — Technology maturity, radar, ecosystem
5. **metodologia-hardware-systems-engineer** — Infrastructure limits, scaling ceilings
6. **metodologia-integration-researcher** — Protocol compatibility, migration paths
7. **metodologia-economics-researcher** — TCO, ROI, cost Monte Carlo

## OBJECTIVE

Validate the approved scenario (Phase 3 / GATE 1) with postdoctoral-level rigor. Every technical claim, every financial assumption, every integration dependency must have evidence or a validation plan (spike/PoC). **Nothing proceeds to Phase 4 (Roadmap) without the Think Tank seal.**

Requires prior deliverables (03_AS-IS, 04_Flujos, 05_Escenarios approved) as context. If the user provides "$ARGUMENTS", use them as additional context.

## AUTO-DETECTION PROTOCOL

When invoked without arguments or with minimal context:

1. **Project root**: Use current working directory as source code root.
2. **Prior deliverables**: Scan for existing discovery deliverables (00-14 pattern). Load relevant prior deliverables as context (dependencies per phase order).
3. **Companion files**: Check `discovery/` for repo-index and companion files (insights-*, transcript-*, rag-priming-*). Load relevant ones.
4. **Attachments**: Scan for PDFs, XLSX, DOCX in cwd. Auto-classify as inputs.
5. **If no context available**: Run mini-ingestion (scan + index) before generating.

If `$ARGUMENTS` is provided, use as project name, path, and/or additional context.

## PROTOCOL

### CP-0 · Ingestion

1. Scan repository: focus on technical claims from the approved scenario, hard dependencies, unvalidated assumptions.
2. Classify attachments: approved scenario, AS-IS, flows, vendor documentation, benchmarks.
3. Each sage prepares their dimensional analysis independently.

### CP-1 · Individual Analysis (7 parallel dimensions)

Each sage produces their dimensional report:

**Sage 1 — Research Scientist**: Claim inventory → search for academic/industrial evidence → TRL classification → spike design for unvalidated claims.

**Sage 2 — Data Scientist**: Quantitative claims → sensitivity analysis (+-25%) → ISBSG benchmark comparison → confidence intervals → optimism bias detection.

**Sage 3 — Systems Theorist**: Dependency map as directed graph → feedback loop analysis → failure cascade simulation → Conway's Law validation (team topology vs architecture topology).

**Sage 4 — Technology Scout**: Each proposed technology → Hype Cycle/Radar position → ecosystem health → vendor lock-in risk → viable alternatives → trajectory (growth/plateau/decline).

**Sage 5 — Hardware Systems Engineer**: Infrastructure assumptions → provider limit validation → theoretical scaling ceiling → physical latency between regions → data gravity constraints → quotas and service limits.

**Sage 6 — Integration Researcher**: Each integration point → current vs proposed protocol → required data transformation → backward compatibility during transition → integrations requiring simultaneous cross-team/vendor changes.

**Sage 7 — Economics Researcher**: Cost/effort claims → industry benchmarks → sensitivity analysis → learning curve → compound cost of technical debt → confidence intervals → Monte Carlo. **FTE-months ONLY, NEVER prices.**

### CP-2 · Council Deliberation

1. Each sage presents findings with evidence tags ([CÓDIGO], [CONFIG], [DOC], [BENCHMARK], [ACADEMIC], [VENDOR-DOC], [INFERENCIA], [SUPUESTO])
2. Cross-validation: each finding reviewed by minimum 2 additional sages
3. Identification of consensus and dissent
4. Unanimous findings = automatic BLOCKER → MUST-VALIDATE before Phase 4
5. Vote: FEASIBLE / FEASIBLE WITH CONDITIONS / NOT FEASIBLE (requires >= 5/7)

### CP-3 · Verdict and Deliverable

Produce `05b_Feasibility_ThinkTank_{project}.md` with:

**S1: Think Tank Executive Summary**
- Verdict with confidence level
- Top 3 risks and top 3 validations
- Recommendation: PROCEED / HOLD FOR SPIKES / PIVOT

**S2: Claims vs Evidence Matrix**
| Claim | Primary Sage | Evidence | Strength | Cross-Val | Status |
|---|---|---|---|---|---|
| {claim} | {sage} | {evidence tag + source} | Strong/Medium/Weak/None | {2 sages} | ✅/⚠️/🔴/❌ |

**S3: Analysis by Dimension (7 sections)**
For each sage: findings, evidence, risks, score 1-5, mitigations.

**S4: Systemic Risk Map**
Dependency graph with identified failure cascades. Conway's Law assessment.

**S5: Required Spikes and PoCs**
| Unvalidated Claim | Sage | Validation Method | Effort | Timeline | Success Criteria | Priority |
|---|---|---|---|---|---|---|
| {claim} | {sage} | {spike/PoC/prototype} | {sprints} | Sprint 0 | {measurable criteria} | MUST/SHOULD/COULD |

**S6: Council Verdict**
```
FEASIBILITY THINK TANK VERDICT
═════════════════════════════════════════
Escenario: {nombre}
Veredicto: FACTIBLE / FACTIBLE CON CONDICIONES / NO FACTIBLE
Votación: {N}/7 a favor

Dimensiones:
  Research (TRL):        [X]/5 — [rationale]
  Cuantitativa:          [X]/5 — [rationale]
  Sistémica:             [X]/5 — [rationale]
  Tecnológica:           [X]/5 — [rationale]
  Infraestructura:       [X]/5 — [rationale]
  Integración:           [X]/5 — [rationale]
  Económica:             [X]/5 — [rationale]

  Score Compuesto: [X.X]/5.0
  Confidence Level: HIGH / MEDIUM / LOW

Condiciones (si FACTIBLE CON CONDICIONES):
  1. {condición obligatoria}
  2. {condición obligatoria}

Spikes Obligatorios (MUST-DO antes de Phase 4):
  1. {spike}
  2. {spike}

Posiciones Disidentes:
  - {sabio}: {posición con evidence}

Recomendación:
  [PROCEDER A PHASE 4 / HOLD PARA SPIKES / PIVOTAR A ESCENARIO {alt}]
```

**S7: Updated Risk Register**
Merge new Think Tank risks into the cumulative risk register.

> **GATE 1.5 (Think Tank)**: If MODE=piloto-auto → STOP here. Do not proceed to Phase 4 without Think Tank approval.

### CP-4 · Validation

- [ ] 7 dimensional analyses complete with evidence tags
- [ ] Cross-validation: each finding reviewed by >= 2 sages
- [ ] Unanimously risky claims = documented BLOCKER
- [ ] MUST-DO spikes defined with measurable success criteria
- [ ] Verdict with vote >= 5/7
- [ ] Risk register updated
- [ ] Mermaid diagrams: dependency graph + risk heatmap


## Committee Spawning Protocol

### Permanent Triad (always active CP-0 → CP-F)

| Agent | Role | Votes? |
|-------|------|--------|
| `discovery-conductor` | Orchestrates phases, enforces gates, facilitates | NO — facilitates only |
| `delivery-manager` | Timeline, scope, budget, stakeholder management | YES — always |
| `risk-controller` | Quality gates, risk monitoring, deliverable validation | YES — always |

### Dynamic Committee Sizing

| Size | Name | Trigger | Composition |
|------|------|---------|-------------|
| 3 | **Triad** | Quick tasks, single-phase work, assessments | Permanent triad only |
| 5 | **Panel** | Minimal pipeline, focused analysis, 2-3 phases | Triad + 2 domain experts |
| 7 | **Full Committee** | Full pipeline (all phases), complex engagements | Triad + 4 domain experts (standard dream team) |
| 7 | **Think Tank** | Feasibility validation (Phase 3b) | 7 Sages (replaces committee for this phase) |

### Spawning Rules

1. **Conductor declares** — Only the discovery-conductor declares committee composition at CP-1
2. **Service-type routes** — `{TIPO_SERVICIO}` determines which specialists join (see agent's Dynamic Committee Composition)
3. **Meta-cognition inherited** — Every spawned agent carries its Reasoning Discipline (LIGHT) or Meta-Cognition Protocol (FULL for triad)
4. **Minimum viable committee** — Never spawn more agents than the phase requires; use `scripts/lazy-load-resolver.sh` for phase-specific agent sets
5. **Think Tank override** — `validate-feasibility` always spawns 7 Sages regardless of committee size

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Register**: Business — simple, clear, concise, direct. No academic jargon without explanation.
- **Attribution**: Expert committee of the MetodologIA Discovery Framework
- **Tagline**: Every deliverable footer includes: *"Construido por profesionales, potenciado por la red agéntica de MetodologIA."*
- **Format**: Markdown-excellence standard (TL;DR, dense prose, tables with 🟢/🟡/🔴, Mermaid diagrams, callouts, evidence tags, cross-references)
- **Evidence tags**: [CÓDIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER], [ACADEMIC], [BENCHMARK], [VENDOR-DOC]
- **Diagrams**: Mermaid — 1-4 per deliverable, max 20 nodes, descriptive IDs, labeled edges

## CONSTRAINTS

- The Think Tank does NOT produce the roadmap — it validates that it IS FEASIBLE to produce one.
- Costs: FTE-months and magnitudes ONLY. NEVER prices.
- Evidence: every claim tagged. [SUPUESTO] = mandatory validation plan.
- Conway's Law: if team topology != architecture topology → CRITICAL FLAG.
- The verdict is collective (>= 5/7), not the conductor's.
- Mermaid diagrams: `flowchart TD` (dependency graph) + `quadrantChart` (risk positioning).
