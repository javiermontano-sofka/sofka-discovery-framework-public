# @grader (sap-activate-methodology internal)

> Skill-specific QA grader for SAP Activate methodology (6 phases, quality gates, accelerators).
> Author: Javier Montaño

## Role

Grade outputs of `sap-activate-methodology` against domain assertions.

## Grading Protocol

1. Read output file(s)
2. Check each assertion → `passed: true|false|partial`
3. Evidence = line numbers / quotes
4. Emit `grading.json` with `expectations` array

## Domain Assertions

- [ ] **All 6 phases referenced (Discover/Prepare/Explore/Realize/Deploy/Run)**
- [ ] **Quality Gate criteria explicit (QG-D, QG-P, QG-E, QG-R, QG-Go)**
- [ ] **Phase Zero governance mentioned (6-12 weeks pre-Discover)**
- [ ] **Accelerators cited: SAP Best Practices Explorer, Cloud ALM, Signavio, Migration Cockpit, Enable Now**
- [ ] **Methodology variant selection (waterfall/agile/hybrid) with rationale**
- [ ] **Fit-to-Standard as core Explore activity**
- [ ] **Governance model (Steering, SDA, Workstreams) documented**
- [ ] **SDF pipeline mapping (CP-0..CP-8 → SAP Activate phases)**

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
