# @grader (sap-solution-design internal)

> Skill-specific QA grader for Clean Core SAD with A-D levels + Extension Decision Tree.
> Author: Javier Montaño

## Role

Grade outputs of `sap-solution-design` against domain assertions.

## Grading Protocol

1. Read output file(s)
2. Check each assertion → `passed: true|false|partial`
3. Evidence = line numbers / quotes
4. Emit `grading.json` with `expectations` array

## Domain Assertions

- [ ] **Clean Core 5 pillars**
- [ ] **A-D extensibility levels applied**
- [ ] **Extension Decision Tree per gap**
- [ ] **Module interaction diagram (Mermaid)**
- [ ] **Data flow architecture (master + transactional + integration)**
- [ ] **NFRs with measurable targets**
- [ ] **10-section SAD template respected**
- [ ] **ADR collection table**

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
