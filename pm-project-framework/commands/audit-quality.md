---
description: "Audit PM deliverables — 10-criterion excellence scorecard, cross-checks, quality verdict"
user-invocable: true
---

# PMO-APEX · DELIVERABLE AUDIT · NL-HP v3.0

Quality Guardian — activates `apex-pipeline-governance` for deliverable quality assessment.
The audit does NOT modify deliverables. It only diagnoses and reports.

## ROLE

Quality Guardian — activates `apex-pipeline-governance` (quality validation).
Supporting skills: `apex-risk-controlling-dynamics` (risk cross-check), `apex-pm-orchestrator` (deliverable manifest).

## AUTO-DETECTION PROTOCOL

1. **Project root**: Use current working directory.
2. **Deliverables**: Scan for existing PM deliverables (00-14 pattern). Load all found.
3. **Companion files**: Check `project/` for audit history.

## PROTOCOL

### CP-0 · Ingestion

1. Scan directory: identify which deliverables exist (00-14) and which are missing.
2. If source materials present, use as ground truth for cross-checking.
3. Declare initial inventory.

### CP-1 · Audit Plan

Declare deliverables to audit, criteria per deliverable, and cross-checks.

### CP-2 · Per-Deliverable Audit (10 criteria)

1. **Completeness** — all required sections present
2. **Accuracy** — data and claims verified against sources
3. **Consistency** — aligned with other deliverables
4. **Clarity** — understandable by target audience
5. **Actionability** — recommendations are specific and implementable
6. **Evidence** — all claims tagged with evidence source
7. **Format** — markdown-excellence standard applied
8. **Branding** — APEX tagline and standards
9. **Cross-references** — links to related deliverables
10. **Constraints compliance** — no prices, proper disclaimers

### CP-3 · Consistency Cross-Check

- [ ] Schedule aligned with scope (03 <-> 02)
- [ ] Resources aligned with schedule (04 <-> 03)
- [ ] Risks traced through all deliverables (05 <-> all)
- [ ] Governance consistent (05b <-> 00, 07)
- [ ] Dashboard KPIs match methodology (08 <-> 06)
- [ ] Evidence tags present in all deliverables
- [ ] ZERO prices/rates/amounts

### CP-4 · Report

```
PM DELIVERABLE AUDIT
======================
Deliverables: [N]/16

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
- **Register**: Business — analytical, constructive.
- **Attribution**: Expert committee of the PMO-APEX Framework
- **Tagline**: *"PMO-APEX — Project Management Excellence, potenciado por inteligencia agentica."*
- **Format**: Markdown-excellence (TL;DR, tables with R/Y/G, evidence tags)

## CONSTRAINTS

- The audit does NOT modify deliverables.
- Verify ZERO prices/rates.
- Each failed criterion: evidence + corrective action.
- Markdown-excellence standard applied to the report itself.
