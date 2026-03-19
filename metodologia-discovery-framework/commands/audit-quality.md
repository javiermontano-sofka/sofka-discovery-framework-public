---
description: "Audit discovery deliverables — scorecard, cross-checks, quality verdict"
user-invocable: true
---

# METODOLOGIA DISCOVERY · DELIVERABLE AUDIT · NL-HP v3.0

Quality Guardian — activates `metodologia-pipeline-governance` § S5 (Proposal QA Validation).
Supporting skills: `metodologia-risk-controlling-dynamics` (risk cross-check), `metodologia-discovery-orchestrator` (deliverable manifest).

The audit does NOT modify deliverables. It only diagnoses and reports.

## ROLE

Quality Guardian — activates `metodologia-pipeline-governance` § S5 (Proposal QA Validation).
Supporting skills: `metodologia-risk-controlling-dynamics` (risk cross-check), `metodologia-discovery-orchestrator` (deliverable manifest).

The audit does NOT modify deliverables. It only diagnoses and reports.

## AUTO-DETECTION PROTOCOL

When invoked without arguments or with minimal context:

1. **Project root**: Use current working directory as source code root.
2. **Prior deliverables**: Scan for existing discovery deliverables (00-14 pattern). Load relevant prior deliverables as context.
3. **Companion files**: Check `discovery/` for repo-index and companion files (insights-*, transcript-*, rag-priming-*). Load relevant ones.
4. **Attachments**: Scan for PDFs, XLSX, DOCX in cwd. Auto-classify as inputs.
5. **If no context available**: Run mini-ingestion (scan + index) before generating.

If `$ARGUMENTS` is provided, use as project name, path, and/or additional context.

## PROTOCOL

### CP-0 · Ingestion

1. Scan directory/attachments: identify which deliverables exist (00-09) and which are missing.
2. If source code is present in the working directory: use as ground truth for cross-checking.
3. Declare initial inventory.

### CP-1 · Audit Plan

Declare deliverables to audit, criteria per deliverable, and cross-checks.

### CP-2 · Per-Deliverable Audit

**02_Brief_Tecnico:** Stack >=5, 6D traffic light, top 5 findings, recommendation
**03_AS-IS:** 10 sections, stack >=5, debt >=5, security >=3, C4 L1+L2
**04_Flujos:** >=4 bounded contexts, >=8 E2E flows, integration matrix, top-10 failures
**05_Escenarios:** >=3 scenarios, 6D scored, SWOT, switching logic
**06_Roadmap:** Gates per phase, P50/P80/P95, 3 FTE-month magnitudes, >=5 pivot points, disclaimer, ZERO prices
**07_Spec:** >=8 use cases, >=6 business rules, complexity-risk matrix
**08_Pitch:** NPV/IRR/payback ranges, call to action, cost of inaction >=3D, ZERO prices, disclaimer
**09_Handover:** 7 sections, items with owner+date, kill criteria, 90-day plan

**Markdown-excellence compliance:** TL;DR, tables with traffic lights, Mermaid, zero filler, cross-references

### CP-3 · Consistency Cross-Check

- [ ] Magnitudes consistent (06<->08)
- [ ] Scenario traced through roadmap, pitch, handover
- [ ] Stakeholders Phase 0 -> handover Phase 6
- [ ] Risks AS-IS -> handover
- [ ] Flows Phase 2 -> functional spec
- [ ] Bounded contexts aligned
- [ ] Evidence tags present
- [ ] ZERO prices/rates/amounts

### CP-4 · Report

```
DISCOVERY AUDIT
════════════════════════
Deliverables: [N]/10

SCORECARD:
| Deliverable | Criteria | Pass | Fail | Score |
|-------------|----------|------|------|-------|

CROSS-CHECK:
| Verification | Status | Detail |
|-------------|--------|--------|

GLOBAL SCORE: [X]%
VERDICT: [APPROVED / APPROVED WITH OBSERVATIONS / REQUIRES CORRECTION]

TOP 5 FINDINGS:
1. ...

RECOMMENDATIONS:
1. ...
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

- The audit does NOT modify deliverables.
- Verify ZERO prices/rates.
- Each failed criterion: evidence + corrective action.
- Markdown-excellence standard applied to the report.
