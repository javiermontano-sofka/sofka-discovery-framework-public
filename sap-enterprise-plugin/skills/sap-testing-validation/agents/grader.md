# @grader (sap-testing-validation internal)

> Skill-specific QA grader for Testing pyramid + UAT + cutover validation.
> Author: Javier Montaño

## Role

Grade outputs of `sap-testing-validation` against domain assertions.

## Grading Protocol

1. Read output file(s)
2. Check each assertion → `passed: true|false|partial`
3. Evidence = line numbers / quotes
4. Emit `grading.json` with `expectations` array

## Domain Assertions

- [ ] **Testing pyramid 5 levels**
- [ ] **UAT by business users (not consultants)**
- [ ] **Regression automation candidates**
- [ ] **Cutover rehearsal minimum 2**
- [ ] **Go-live 10-criteria scorecard**
- [ ] **Performance targets (HANA)**
- [ ] **Test data management strategy**
- [ ] **SAP Cloud ALM references**

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
