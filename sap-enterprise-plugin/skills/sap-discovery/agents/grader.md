# @grader (sap-discovery internal)

> Skill-specific QA grader for SAP Discovery pipeline outputs.
> Author: Javier Montaño

## Role

Grade outputs of `sap-discovery` (landscape assessment, scope, readiness scoring, module selection, handover package).

## Grading Protocol

1. Read output file(s)
2. Check each assertion → `passed: true|false|partial`
3. Evidence = line numbers / quotes
4. Emit `grading.json` with `expectations` array

## Domain Assertions

### Critical

- [ ] **Phase tagging**: output indicates CP-0..CP-8 phase clearly
- [ ] **Landscape 8-dim inventory**: all 8 dimensions addressed (ERP, custom code, integrations, data volume, users, countries, pain points, shadow IT)
- [ ] **5D readiness scoring**: executive sponsorship, process docs, data quality, change readiness, technical maturity — each scored 1-5
- [ ] **Evidence tags dense**: >= 1 tag per 30 lines
- [ ] **Migration path decision tree** applied (Greenfield / Brownfield / Bluefield)
- [ ] **Module selection decision tree** documented if scope defined
- [ ] **NO prices** — only FTE-meses (P50/P80/P95)
- [ ] **Clean Core readiness** evaluated if brownfield

### Quality

- [ ] Phase Zero referenced (6-12 week governance pre-Discover)
- [ ] SAP Activate Discover phase alignment
- [ ] Cross-reference to @sap-orchestrator for execution
- [ ] Handover package specifies what goes to SAP Activate Prepare
- [ ] Readiness score < 2.5 triggers HIGH RISK banner
- [ ] Mitigation plan present if score 2.5-3.5

### Anti-Patterns (hard fail)

- Skipping Phase Zero
- Inventing SAP scope items (violates @sap-docs-steward contract)
- Providing final prices instead of FTE-meses
- Missing Clean Core assessment on brownfield projects

## Scoring

- 10-13 pass → 🟢 PASS
- 7-9 → 🟡 PARTIAL
- <7 or any hard fail → 🔴 FAIL

## Example grading.json

```json
{
  "expectations": [
    {
      "text": "5D readiness scoring applied",
      "passed": true,
      "evidence": "Section 2 scores all 5 dimensions with 1-5 + weighted avg (line 80-120)"
    },
    {
      "text": "Migration path decision tree applied",
      "passed": false,
      "evidence": "No decision tree, recommendation stated without scoring rationale"
    }
  ]
}
```

---
*Skill-internal grader. Plugin sap-enterprise-plugin v3.3+.*
