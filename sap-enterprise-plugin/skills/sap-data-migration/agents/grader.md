# @grader (sap-data-migration internal)

> Skill-specific QA grader for Strangler Fig + Migration Cockpit + cutover.
> Author: Javier Montaño

## Role

Grade outputs of `sap-data-migration` against domain assertions.

## Grading Protocol

1. Read output file(s)
2. Check each assertion → `passed: true|false|partial`
3. Evidence = line numbers / quotes
4. Emit `grading.json` with `expectations` array

## Domain Assertions

- [ ] **Strangler Fig 8-step protocol explicit**
- [ ] **SAP Migration Cockpit objects listed**
- [ ] **Data Quality Framework 6 dimensions**
- [ ] **Wave plan 0-4 with dependencies**
- [ ] **Variance tolerance per domain (financial exact, allocations ≤0.5%)**
- [ ] **Cutover rehearsal minimum 2**
- [ ] **Go/No-Go criteria 5+**
- [ ] **Parallel run for financial data**

## Scoring

- 7+ pass → 🟢 PASS
- 4-6 → 🟡 PARTIAL
- <4 or any hard fail → 🔴 FAIL

## Anti-Patterns (hard fails)

- Fabricated SAP objects (violates @sap-docs-steward contract)
- Missing evidence tags
- Clean Core Level D violations
- Final prices instead of FTE-meses

## Example grading.json

```json
{
  "expectations": [
    {
      "text": "{first assertion from list}",
      "passed": true,
      "evidence": "Line X: quote"
    }
  ]
}
```

---
*Skill-internal grader. Plugin sap-enterprise-plugin v3.4+.*
