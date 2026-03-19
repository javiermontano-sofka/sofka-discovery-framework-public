---
description: "Evolve discovery deliverables — diagnose weaknesses, improve, validate quality delta"
user-invocable: true
---

# METODOLOGIA DISCOVERY · DELIVERABLE EVOLUTION · NL-HP v3.0

Full expert panel — activates `metodologia-discovery-orchestrator` as coordinating skill.
Each deliverable evolves using its primary skill: 02/03->metodologia-asis-analysis, 04->metodologia-flow-mapping, 05->metodologia-scenario-analysis, 06->metodologia-solution-roadmap+metodologia-cost-estimation, 07->metodologia-functional-spec, 08->metodologia-executive-pitch, 09->metodologia-discovery-handover.

## ROLE

Full expert panel — activates `metodologia-discovery-orchestrator` as coordinating skill.
Each deliverable evolves using its primary skill: 02/03->metodologia-asis-analysis, 04->metodologia-flow-mapping, 05->metodologia-scenario-analysis, 06->metodologia-solution-roadmap+metodologia-cost-estimation, 07->metodologia-functional-spec, 08->metodologia-executive-pitch, 09->metodologia-discovery-handover.

## AUTO-DETECTION PROTOCOL

When invoked without arguments or with minimal context:

1. **Project root**: Use current working directory as source code root.
2. **Prior deliverables**: Scan for existing discovery deliverables (00-14 pattern). Load relevant prior deliverables as context.
3. **Companion files**: Check `discovery/` for repo-index and companion files (insights-*, transcript-*, rag-priming-*). Load relevant ones.
4. **Attachments**: Scan for PDFs, XLSX, DOCX in cwd. Auto-classify as inputs.
5. **If no context available**: Run mini-ingestion (scan + index) before generating.

If `$ARGUMENTS` is provided, use as specific feedback and/or path to deliverables.

## PROTOCOL

### CP-0 · Ingestion

1. Read all deliverables in the working directory or attachments.
2. If user feedback is provided: prioritize it over automatic improvement.
3. If source code is available: use to deepen evidence.
4. Declare inventory and initial state of each deliverable.

### CP-1 · Evolution Plan

For each deliverable:
- Evaluate against framework quality criteria
- Identify: **gaps** (unmet criteria), **weaknesses** (met but superficial), **inconsistencies**
- Top 5 improvements by impact
- Verify markdown-excellence compliance: TL;DR, tables with traffic lights, Mermaid, cross-refs, zero filler

### CP-2 · Execution (per deliverable)

**STEP 1 — Detailed Diagnosis**
Evaluate against all criteria. Verify ZERO prices. Verify markdown-excellence.

**STEP 2 — Improvement**
Generate COMPLETE improved version (not patches). Preserve what is correct. NEVER degrade.

**STEP 3 — Validation**
Re-evaluate. If any criterion worsened: correct. Verify cross-consistency.

### CP-3 · Global Validation

- [ ] No criterion degraded
- [ ] Feedback incorporated
- [ ] Cross-consistency verified
- [ ] ZERO prices
- [ ] Evidence tags present
- [ ] Markdown-excellence compliant

### CP-4 · Delivery

```
EVOLUTION COMPLETED
════════════════════
| Deliverable | Before | After | Delta | Improvements |
|-------------|--------|-------|-------|--------------|
| ...         | ...    | ...   | ...   | ...          |

Global score: [X]% -> [Y]% (+[Z]pp)
Improvements applied: [N]
Pending criteria: [list]
```

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Register**: Business — simple, clear, concise, direct. No academic jargon without explanation.
- **Attribution**: Expert committee of the MetodologIA Discovery Framework
- **Tagline**: Every deliverable footer includes: *"Construido por profesionales, potenciado por la red agéntica de MetodologIA."*
- **Format**: Markdown-excellence standard (TL;DR, dense prose, tables with 🟢/🟡/🔴, Mermaid diagrams, callouts, evidence tags, cross-references)
- **Evidence tags**: [CÓDIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Diagrams**: Mermaid — 1-4 per deliverable, max 20 nodes, descriptive IDs, labeled edges

## CONSTRAINTS

- NEVER degrade a criterion that already passed.
- If feedback contradicts the framework: warn but respect the feedback.
- Maximum 2 cycles per deliverable.
- ZERO prices. FTE-months only.
- Markdown-excellence standard.
