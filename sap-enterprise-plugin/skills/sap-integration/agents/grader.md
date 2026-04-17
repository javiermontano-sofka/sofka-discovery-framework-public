# @grader (sap-integration internal)

> Skill-specific QA grader for CPI + OData + Event Mesh + CATS BAPI.
> Author: Javier Montaño

## Role

Grade outputs of `sap-integration` against domain assertions.

## Grading Protocol

1. Read output file(s)
2. Check each assertion → `passed: true|false|partial`
3. Evidence = line numbers / quotes
4. Emit `grading.json` with `expectations` array

## Domain Assertions

- [ ] **Integration pattern decision tree (sync/async/batch)**
- [ ] **CPI iFlow best practices (one per interface, externalized config)**
- [ ] **Adapter selection per scenario**
- [ ] **OData V4 vs V2 decision**
- [ ] **Error handling 5 categories**
- [ ] **Event Mesh topology if async**
- [ ] **Communication Arrangements for connectivity**
- [ ] **Monitoring stack (CPI + Cloud ALM)**

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
