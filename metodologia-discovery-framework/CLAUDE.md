# Discovery Framework — Orchestration Guide

> Licensed under GPL-3.0. Derivative works must maintain copyleft.

## Quick Reference

### Pipeline Commands (Flows)
- `/metodologia-discovery-framework:discovery` — Guided full pipeline (8 phases, 3 gates, 10+ deliverables)
- `/metodologia-discovery-framework:discovery-auto` — Autonomous full pipeline (zero interruptions)
- `/metodologia-discovery-framework:express` — Go/No-Go in 1 session (3 deliverables)
- `/metodologia-discovery-framework:intermediate` — Architectural direction (7 deliverables, 2 gates)

### Document Commands (Individual Deliverables)
- `/metodologia-discovery-framework:plan` — 00_Discovery_Plan (governance document)
- `/metodologia-discovery-framework:stakeholders` — 01_Stakeholder_Map (influence, RACI, communication)
- `/metodologia-discovery-framework:brief` — 02_Brief_Tecnico (executive summary, max 3 pages)
- `/metodologia-discovery-framework:asis` — 03_Analisis_AS-IS (10-section exhaustive analysis)
- `/metodologia-discovery-framework:flows` — 04_Mapeo_Flujos (DDD, E2E flows, integration matrix)
- `/metodologia-discovery-framework:scenarios` — 05_Escenarios_ToT (Tree-of-Thought, 6D scoring, GATE 1)
- `/metodologia-discovery-framework:roadmap` — 06_Solution_Roadmap (5 phases, Monte Carlo, GATE 2)
- `/metodologia-discovery-framework:spec` — 07_Especificacion_Funcional (use cases, business rules)
- `/metodologia-discovery-framework:pitch` — 08_Pitch_Ejecutivo (C-level business case)
- `/metodologia-discovery-framework:handover` — 09_Handover_Operaciones (90-day transition)

### Service-Type Discovery Commands
- `/metodologia-discovery-framework:rpa-discovery` — RPA & process automation discovery ({TIPO_SERVICIO}=RPA)
- `/metodologia-discovery-framework:qa-discovery` — QA-as-a-service discovery ({TIPO_SERVICIO}=QA)
- `/metodologia-discovery-framework:ai-discovery` — AI Center & data platform discovery ({TIPO_SERVICIO}=Data-AI)
- `/metodologia-discovery-framework:transformation` — Digital transformation program discovery ({TIPO_SERVICIO}=Digital-Transformation)

### Operations Commands
- `/metodologia-discovery-framework:discovery-review` — Audit deliverables (scorecard, cross-checks, verdict)
- `/metodologia-discovery-framework:discovery-improve` — Evolve deliverables (diagnose, improve, validate delta)
- `/metodologia-discovery-framework:rescue` — Rescue stalled discovery (triage, repair, complete)

## NL-HP v3.0 Checkpoint Model

All commands follow the checkpoint protocol:

| CP | Name | Purpose |
|---|---|---|
| CP-0 | Ingesta | Repo scanned, attachments classified, gaps declared |
| CP-1 | Plan | Skill/agent composition proposed and approved |
| CP-N | Phase N | Deliverable validated against criteria |
| CP-F | Final | Cross-consistency, compliance, formal closure |

## Default Output Behavior

- **Default format**: Markdown (markdown-excellence standard)
- **Default variant**: Tecnica (full depth)
- **Default mode**: piloto-auto (autonomous for routine, HITL for decisions)
- HTML, DOCX, or dual output: only when user requests via {FORMATO} parameter

## Orchestration Rules

1. **Pipeline flows orchestrate, document commands generate individual deliverables.** Use flows for end-to-end engagements, document commands for targeted generation.
2. **Respect phase dependencies**: Plan (00) → Stakeholders (01) → Brief+AS-IS (02,03) → Flows (04) → Scenarios (05) → Roadmap (06) → Spec (07) → Pitch (08) → Handover (09)
3. **Quality gates are hard stops**: G1 (scenario), G2 (magnitudes), G3 (final). In piloto-auto: pause for approval.
4. **Cost outputs**: NEVER prices. Only FTE-months + mandatory disclaimers. 5% innovation margin.
5. **Evidence tagging**: All claims tagged [CODIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER].
6. **Governance is transversal**: project-program-management + risk-controlling-dynamics on ALL phases.
7. **Service type routing**: {TIPO_SERVICIO} parameter determines skill variants, committee composition, and input requirements. Auto-detected from context if not explicit.

## Skill Activation

When a prompt or command activates the orchestrator:
1. Parse parameters ({MODO}, {FORMATO}, {VARIANTE}, {ADJUNTOS}, {PROFUNDIDAD}, {TIPO_SERVICIO})
2. Detect or confirm service type
3. Scan repository/inputs (CP-0: Ingesta)
4. Propose skill composition (CP-1: Plan)
5. Execute phases sequentially with data contract validation
6. Apply quality gates at G1, G2, G3
7. Produce deliverables per format protocol

## Agent Delegation

| Phase | Lead Agent | Support |
|-------|-----------|---------|
| 0 | domain-analyst | change-catalyst |
| 1 | technical-architect | data-strategist |
| 2 | domain-analyst | full-stack-generalist |
| 3 | technical-architect | domain-analyst |
| 3b | technical-architect | quality-guardian |
| 4 | delivery-manager | data-strategist |
| 5 | quality-guardian | change-catalyst |
| 6 | delivery-manager | change-catalyst |

## Output Standards

Markdown-excellence: TL;DR (3-5 bullets), dense prose, tables with status indicators, Mermaid diagrams, callouts, footnotes, cross-references.

## Common Parameters

| Parameter | Values | Default |
|-----------|--------|---------|
| {MODO} | piloto-auto, desatendido, supervisado, paso-a-paso | piloto-auto |
| {FORMATO} | markdown, html, docx, dual | markdown |
| {VARIANTE} | ejecutiva (~40%), tecnica (full) | tecnica |
| {ADJUNTOS} | procesar-todo, solo-codigo, ignorar | procesar-todo |
| {PROFUNDIDAD} | ejecutivo, tecnico, exhaustivo | tecnico |
| {TIPO_SERVICIO} | SDA, QA, Management, RPA, Data-AI, Cloud, SAS, UX-Design, Digital-Transformation, Multi-Service | SDA |

## Tool Use Defaults

- **Primary output**: Artifact file (not inline text). Save to project directory.
- **Format**: Markdown by default. HTML/DOCX only on explicit request.
- **Diagrams**: Mermaid syntax embedded in markdown. Rendered via CDN in HTML.
- **References**: Load from `${CLAUDE_SKILL_DIR}/references/` when available.

---
**Comunidad MetodologIA** | **Licencia:** GPL-3.0
