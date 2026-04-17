# @grader (sap-change-adoption internal)

> Skill-specific QA grader for ADKAR + Enable Now + super-users + hypercare.
> Author: Javier Montaño

## Role

Grade outputs of `sap-change-adoption` against domain assertions.

## Grading Protocol

1. Read output file(s)
2. Check each assertion → `passed: true|false|partial`
3. Evidence = line numbers / quotes
4. Emit `grading.json` with `expectations` array

## Domain Assertions

- [ ] **ADKAR framework applied per stakeholder group**
- [ ] **Super-user ratio 1:15-20 documented**
- [ ] **Training matrix per persona**
- [ ] **SAP Enable Now content types mentioned**
- [ ] **Go-live readiness scorecard (10 dimensions weighted)**
- [ ] **Hypercare 4-6 weeks with L0-L3 structure**
- [ ] **Adoption metrics dashboard (Month 3 + Month 6)**
- [ ] **Change resistance mitigation strategies**

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
