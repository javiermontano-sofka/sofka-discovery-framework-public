# Discovery Framework — Orchestration Guide

## Quick Reference

### Pipeline Commands (Flows)
- `/sofka-discovery-framework:discovery` — Guided full pipeline (8 phases, 3 gates, 10+ deliverables)
- `/sofka-discovery-framework:discovery-auto` — Autonomous full pipeline (zero interruptions)
- `/sofka-discovery-framework:express` — Go/No-Go in 1 session (3 deliverables)
- `/sofka-discovery-framework:intermediate` — Architectural direction (7 deliverables, 2 gates)

### Document Commands (Individual Deliverables)
- `/sofka-discovery-framework:plan` — 00_Discovery_Plan (governance document)
- `/sofka-discovery-framework:stakeholders` — 01_Stakeholder_Map (influence, RACI, communication)
- `/sofka-discovery-framework:brief` — 02_Brief_Tecnico (executive summary, max 3 pages)
- `/sofka-discovery-framework:asis` — 03_Analisis_AS-IS (10-section exhaustive analysis)
- `/sofka-discovery-framework:flows` — 04_Mapeo_Flujos (DDD, E2E flows, integration matrix)
- `/sofka-discovery-framework:scenarios` — 05_Escenarios_ToT (Tree-of-Thought, 6D scoring, GATE 1)
- `/sofka-discovery-framework:roadmap` — 06_Solution_Roadmap (5 phases, Monte Carlo, GATE 2)
- `/sofka-discovery-framework:spec` — 07_Especificacion_Funcional (use cases, business rules)
- `/sofka-discovery-framework:pitch` — 08_Pitch_Ejecutivo (C-level business case)
- `/sofka-discovery-framework:handover` — 09_Handover_Operaciones (90-day transition)

### Service-Type Discovery Commands
- `/sdf:rpa-discovery` — RPA & process automation discovery ({TIPO_SERVICIO}=RPA)
- `/sdf:qa-discovery` — QA-as-a-service discovery ({TIPO_SERVICIO}=QA)
- `/sdf:ai-discovery` — AI Center & data platform discovery ({TIPO_SERVICIO}=Data-AI)
- `/sdf:transformation` — Digital transformation program discovery ({TIPO_SERVICIO}=Digital-Transformation)

### Operations Commands
- `/sofka-discovery-framework:discovery-review` — Audit deliverables (scorecard, cross-checks, verdict)
- `/sofka-discovery-framework:discovery-improve` — Evolve deliverables (diagnose, improve, validate delta)
- `/sofka-discovery-framework:rescue` — Rescue stalled discovery (triage, repair, complete)

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
- **Default variant**: Técnica (full depth)
- **Default mode**: piloto-auto (autonomous for routine, HITL for decisions)
- HTML, DOCX, or dual: only when requested via {FORMATO}

## Orchestration Rules

1. **Pipeline flows orchestrate, document commands generate individual deliverables.** Use flows for end-to-end engagements, document commands for targeted generation.
2. **Respect phase dependencies**: Plan (00) → Stakeholders (01) → Brief+AS-IS (02,03) → Flows (04) → Scenarios (05) → Roadmap (06) → Spec (07) → Pitch (08) → Handover (09)
3. **Quality gates are hard stops**: G1 (scenario), G2 (magnitudes), G3 (final). In piloto-auto: pause for approval.
4. **Cost outputs**: NEVER prices. Only FTE-months + mandatory disclaimers. 5% innovation margin.
5. **Evidence tagging**: All claims tagged [CÓDIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER].
6. **Governance is transversal**: project-program-management + risk-controlling-dynamics on ALL phases.

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

Markdown-excellence: TL;DR (3-5 bullets), dense prose, tables 🟢/🟡/🔴, Mermaid diagrams, callouts (💡⚖️⚠️🔍), footnotes, cross-references.

## Common Parameters

| Parameter | Values | Default |
|-----------|--------|---------|
| {MODO} | piloto-auto, desatendido, supervisado, paso-a-paso | piloto-auto |
| {FORMATO} | markdown, html, docx, dual | markdown |
| {VARIANTE} | ejecutiva (~40%), técnica (full) | técnica |
| {ADJUNTOS} | procesar-todo, solo-código, ignorar | procesar-todo |
| {PROFUNDIDAD} | ejecutivo, técnico, exhaustivo | técnico |
| {TIPO_SERVICIO} | SDA, QA, Management, RPA, Data-AI, Cloud, SAS, UX-Design, Digital-Transformation, Multi-Service | SDA |
