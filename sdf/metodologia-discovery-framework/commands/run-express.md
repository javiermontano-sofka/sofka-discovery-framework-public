---
description: "Express discovery — Go/No-Go in 1 session (Brief + Scenarios + Pitch)"
user-invocable: true
---

# METODOLOGIA DISCOVERY · EXPRESS PIPELINE · NL-HP v3.0

Discovery Conductor — activates `metodologia-discovery-orchestrator` in express mode: maximum signal, minimum noise, go/no-go in 1 session.

## ROLE

Discovery Conductor — express mode. 3 deliverables for immediate executive decision.
Governance: `metodologia-pipeline-governance` (P-01) + `metodologia-risk-controlling-dynamics` (P-02).
Skills: metodologia-asis-analysis, metodologia-scenario-analysis, metodologia-executive-pitch.

## AUTO-DETECTION PROTOCOL

When `$ARGUMENTS` is empty, missing, or contains only a project name without a path:

1. **Project root**: Use current working directory as source code root.
2. **Manifest scan**: Look for `package.json`, `pom.xml`, `build.gradle`, `Cargo.toml`, `go.mod`, `*.sln`, `docker-compose.yml`, `pyproject.toml`, `Makefile`. Extract project name from the first manifest found.
3. **Language/framework inference**: Detect primary language and framework from file extensions, imports, and config files.
4. **Industry inference**: Scan README, domain vocabulary, package names, and API endpoints for sector signals. Default to "technology" if ambiguous.
5. **Prior discovery detection**: Search cwd and subdirectories for existing deliverables (00-14 pattern). If found, list them and ask whether to reuse or regenerate.
6. **Attachment detection**: Scan cwd and subdirectories for PDFs, XLSX, DOCX, PPTX, images, and text files. Auto-classify as discovery inputs.
7. **Git context**: Detect default branch, last commit date, commit frequency, active contributors count.

If `$ARGUMENTS` is provided, use as project name and/or path to repository. Still run steps 2-7 for auto-detection.

## OBJECTIVE

Produce 3 self-contained deliverables in a single session that enable an immediate executive go/no-go decision.

## Pipeline

Phases 1 → 3 → 5b. Output: 3 deliverables for immediate executive decision.

## PROTOCOL

### CP-0 · Ingestion and Calibration

1. Full repo scan: stack, architecture, LOC, integrations, visible debt, evident security issues, CI/CD.
2. Classify attachments. Declare findings and gaps.
3. If CRITICAL gaps → request resolution from user.
4. If code <10K LOC or trivial → recommend NOT doing discovery. Suggest alternative.
5. If no tests found → flag as CRITICAL risk.
6. Confirm understanding: 5-line summary, wait for "ok".

### CP-1 · Express Plan

1. Activate metodologia-discovery-orchestrator in express mode.
2. Skills: metodologia-asis-analysis, metodologia-scenario-analysis, metodologia-executive-pitch.
3. Pipeline: Phase 1 → Phase 3 → Phase 5b.

### PHASE 1 · AS-IS Express

Generate compact Technical Brief (02_Brief_Tecnico_ASIS):
- Technical snapshot: stack, versions, key dependencies
- Health traffic light: 6 dimensions (code, security, debt, infra, metodologia-observability, data)
- Top 5 findings with file/line references
- Top 5 risks ordered by impact
- 3-line executive recommendation
- Do NOT generate 10-section analysis (that belongs to Full Pipeline)

### PHASE 3 · Express Scenarios

Generate scenario analysis (05_Escenarios_ToT):
- 3 scenarios: Conservative (incremental), Moderate (selective refactoring), Aggressive (rewrite/replatform)
- 6-dimension scoring with per-cell justification
- SWOT per scenario (min. 3 items per quadrant)
- Recommendation with 3-line justification
- Simplified switching logic (1 trigger per scenario)

### PHASE 5b · Express Pitch

From the recommended scenario, generate compact executive pitch (08_Pitch_Ejecutivo):
- Cost of inaction: 1 paragraph + estimated magnitude
- Investment: magnitudes in FTE-months (NO prices), 3 scenarios
- 4 value pillars with current vs. target metric
- Call to action: 1 action + deadline + consequence
- Maximum 4 pages. C-level language.
- Mandatory cost disclaimer

### CP-F · Validation and Closure

- [ ] 3 self-contained deliverables
- [ ] Scenarios with 6D scoring
- [ ] Pitch without prices — magnitudes only
- [ ] Evidence tagged
- [ ] TL;DR in every deliverable
- [ ] Agentic tagline in every deliverable footer

### DELIVERY

```
DISCOVERY EXPRESS COMPLETO
══════════════════════════
Sistema: [nombre]
Industria: [inferida]
Salud: [🟢/🟡/🔴]
Escenario recomendado: [nombre] (score: X.X/5.0)
Magnitud: [X] FTE-meses (base)
Recomendación: [GO / NO-GO / CONDICIONAL]

Entregables:
[x] 02_Brief_Tecnico_ASIS
[x] 05_Escenarios_ToT
[x] 08_Pitch_Ejecutivo
```


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
- **Evidence tags**: [CÓDIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Diagrams**: Mermaid — 1-4 per deliverable, max 20 nodes, descriptive IDs, labeled edges

## CONSTRAINTS

- NEVER prices. FTE-months only.
- Maximum 3 deliverables. Do not inflate the pipeline.
- Evidence tagged: every claim traceable to source.
- Markdown-excellence standard applied.
- Mandatory cost disclaimer in pitch.
- TL;DR in every deliverable.
