# @grader (sap-implementation internal)

> Skill-specific QA grader for Module config reference (v1 legacy): CO/SD/PS/FI/HCM for Professional Services.
> Author: Javier Montaño

## Role

Grade outputs of `sap-implementation` against domain assertions.

## Grading Protocol

1. Read output file(s)
2. Check each assertion → `passed: true|false|partial`
3. Evidence = line numbers / quotes
4. Emit `grading.json` with `expectations` array

## Domain Assertions

- [ ] **Professional Services scope items J11, 4E9, 1IL, J12 referenced**
- [ ] **Activity Types Cost Rate + Sales Price segregation**
- [ ] **Revenue recognition variants (T&M, Fixed Price, Retainer, Bench)**
- [ ] **Fit-to-Standard scoring matrix**
- [ ] **Intercompany posting cycle 7 steps**
- [ ] **Strangler Fig migration reference**
- [ ] **CATS BAPI timesheet integration**
- [ ] **Implementation risks IT services pattern**

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
