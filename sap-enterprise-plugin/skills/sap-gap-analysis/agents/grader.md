# @grader (sap-gap-analysis internal)

> Skill-specific QA grader for Gap classification + dependency mapping + ADRs.
> Author: Javier Montaño

## Role

Grade outputs of `sap-gap-analysis` against domain assertions.

## Grading Protocol

1. Read output file(s)
2. Check each assertion → `passed: true|false|partial`
3. Evidence = line numbers / quotes
4. Emit `grading.json` with `expectations` array

## Domain Assertions

- [ ] **7-class taxonomy applied**
- [ ] **Dependency graph (Mermaid) constructed**
- [ ] **Blocking gaps identified (>= 3 dependents or critical path)**
- [ ] **ADR template with >= 2 options**
- [ ] **Wave assignment via priority score**
- [ ] **Clean Core classification per gap**
- [ ] **Gap clusters identified**
- [ ] **Custom (11-12) classification triggers ADR + SDA approval**

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
