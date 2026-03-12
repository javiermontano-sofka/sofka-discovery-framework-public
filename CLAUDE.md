# Discovery Framework — Orchestration Guide

## Quick Reference

- Start guided: `/sofka-discovery-framework:discovery`
- Start autonomous: `/sofka-discovery-framework:discovery-auto`
- Review output: `/sofka-discovery-framework:discovery-review`
- Improve output: `/sofka-discovery-framework:discovery-improve`

## Default Output Behavior

- **Default format**: Markdown (markdown-excellence standard)
- **Default variant**: Técnica (full depth)
- **Default mode**: piloto-auto (autonomous for routine, HITL for decisions)
- HTML, DOCX, or dual output: only when user requests via {FORMATO} parameter

## Orchestration Rules

1. **Always start with the orchestrator**: `discovery-orchestrator` is the single entry point. Never invoke pipeline skills directly — the orchestrator manages sequencing, data contracts, and quality gates.

2. **Respect the pipeline sequence**: Phase 0→1→2→3→3b→G1→4→4b→G2→5a→5b→G3→6. Skip phases only when the user explicitly requests a reduced pipeline variant (Minimal or Quick Reference).

3. **Quality gates are hard stops**: G1 (scenario approval), G2 (budget/roadmap approval), G3 (proposal QA). In piloto-auto mode, pause for human approval. In desatendido mode, auto-approve with documented assumptions.

4. **Data contracts between phases**: Each phase produces specific outputs consumed by the next. The orchestrator validates completeness before advancing.

5. **Agent delegation**: The discovery-conductor activates the right agents per phase:
   - Phase 0: domain-analyst, change-catalyst
   - Phase 1: technical-architect, data-strategist
   - Phase 2: domain-analyst, full-stack-generalist
   - Phase 3: technical-architect, domain-analyst
   - Phase 3b: technical-architect, quality-guardian
   - Phase 4: delivery-manager, data-strategist
   - Phase 5: quality-guardian, change-catalyst
   - Phase 6: delivery-manager, change-catalyst

6. **Governance is transversal**: project-program-management and risk-controlling-dynamics run alongside EVERY phase, not just at gates.

7. **Cost outputs**: NEVER produce final prices. Only drivers, inductors, magnitudes, and models. Include 5% innovation margin. Costear ≠ Cobrar.

8. **Evidence tagging**: All claims must be tagged: [CÓDIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER].

## Skill Activation

When a prompt or command activates the orchestrator:
1. Parse parameters ({MODO}, {FORMATO}, {VARIANTE}, {ADJUNTOS}, {PROFUNDIDAD})
2. Scan repository/inputs (CP-0: Ingesta)
3. Propose skill composition (CP-1: Plan)
4. Execute phases sequentially with data contract validation
5. Apply quality gates at G1, G2, G3
6. Produce deliverables per format protocol

## Output Standards

All outputs follow `markdown-excellence.md`:
- TL;DR section (3-5 bullets)
- Dense prose (every sentence carries information)
- Tables with 🟢/🟡/🔴 status indicators
- Mermaid diagrams (replace ≥3 sentences, max 4 per deliverable)
- Callouts: 💡 Insight | ⚖️ Trade-off | ⚠️ Risk | 🔍 Evidence
- Footnotes for methodology, sources, assumptions

## Tool Use Defaults

- **Primary output**: Artifact file (not inline text). Save to project directory.
- **Format**: Markdown by default. HTML/DOCX only on explicit request.
- **Diagrams**: Mermaid syntax embedded in markdown. Rendered via CDN in HTML.
- **References**: Load from `${CLAUDE_SKILL_DIR}/references/` when available.

## Common Parameters

| Parameter | Values | Default |
|-----------|--------|---------|
| {MODO} | piloto-auto, desatendido, supervisado, paso-a-paso | piloto-auto |
| {FORMATO} | markdown, html, docx, dual | markdown |
| {VARIANTE} | ejecutiva (~40%), técnica (full) | técnica |
| {ADJUNTOS} | procesar-todo, solo-código, ignorar | procesar-todo |
| {PROFUNDIDAD} | ejecutivo, técnico, exhaustivo | técnico |
