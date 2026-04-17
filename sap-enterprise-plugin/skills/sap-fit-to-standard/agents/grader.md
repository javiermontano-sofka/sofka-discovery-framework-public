# @grader (sap-fit-to-standard internal)

> Skill-specific QA grader for F2S workshop facilitation + gap scoring + Clean Core compliance.
> Author: Javier Montaño

## Role

Grade outputs of `sap-fit-to-standard` against domain assertions.

## Grading Protocol

1. Read output file(s)
2. Check each assertion → `passed: true|false|partial`
3. Evidence = line numbers / quotes
4. Emit `grading.json` with `expectations` array

## Domain Assertions

- [ ] **5-step protocol (Present → Compare → Score → Classify → Document)**
- [ ] **Gap scoring 4-dimension matrix**
- [ ] **Classification 7-class taxonomy**
- [ ] **Business Value scored by process owner (not consultant)**
- [ ] **Clean Core compliance check per extension**
- [ ] **Scope Items referenced with [DOC]**
- [ ] **Political dynamics handling documented**
- [ ] **Workshop output template**

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
