---
name: generate-qa-scorecard
author: JM Labs (Javier Montaño)
description: >
  Produces a compact executive scorecard grading a plugin across 7 quality dimensions
  with a letter grade, numeric score, and top 3 priority actions.
  Trigger: generate scorecard, qa scorecard, plugin grade, executive summary.
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
---

# Generate QA Scorecard

> "A dashboard is only as good as the decisions it enables."

Produces a compact 7-dimension scorecard from validation and audit findings. Each dimension receives PASS/WARN/FAIL status and a numeric score. The total score maps to a letter grade (A-F) with top 3 priority actions for improvement.

---

## Procedure

1. **Collect or receive findings** -- gather results from all validation and audit skills. If results are not available in the current session, inform the user and suggest running the relevant skills first. Map findings to their source dimensions.

2. **Build the 7-dimension scorecard** -- evaluate each dimension based on findings from its corresponding source:
   - **Structure Conformance** -- sourced from `validate-structure` findings
   - **Manifest Quality** -- sourced from `validate-manifest` findings
   - **Component Standards** -- sourced from `validate-components` findings
   - **Hook Safety** -- sourced from `validate-hooks` findings
   - **Reference Integrity** -- sourced from `validate-cross-refs` findings
   - **Security Posture** -- sourced from `audit-security` findings
   - **Content Quality** -- sourced from `audit-content-quality` findings

3. **Assign status per dimension** -- apply strict rules:
   - **PASS**: 0 critical findings AND 0 warning findings in that dimension
   - **WARN**: 0 critical findings AND 1 or more warning findings
   - **FAIL**: 1 or more critical findings (regardless of warnings)
   - If a dimension was not evaluated, mark it as `N/A` with a note

4. **Calculate numeric score** -- assign points per dimension:
   - PASS = 10 points
   - WARN = 6 points
   - FAIL = 2 points
   - N/A = excluded from total (adjust denominator)
   - Sum all points. Maximum possible = 70 (if all 7 evaluated).

5. **Assign letter grade** based on total score (out of 70):
   - **A**: 63-70 (90-100%) -- Production ready
   - **B**: 56-62 (80-89%) -- Minor issues, safe to use
   - **C**: 49-55 (70-79%) -- Needs improvement
   - **D**: 42-48 (60-69%) -- Significant issues
   - **F**: below 42 (<60%) -- Not ready for use

6. **Determine top 3 priority actions** -- select the 3 most impactful improvements:
   - Prioritize FAIL dimensions over WARN dimensions
   - Within a dimension, prioritize by critical count, then warning count
   - Each action: dimension name, what to fix, expected score improvement

7. **Output the scorecard** -- render as a compact Markdown table:
   ```
   | Dimension              | Status | Score | Findings (C/W/I) |
   |------------------------|--------|-------|-------------------|
   | Structure Conformance  | PASS   | 10    | 0 / 0 / 2         |
   | ...                    | ...    | ...   | ...               |
   | **Total**              |        | XX/70 |                   |
   | **Grade**              |        | X     |                   |
   ```
   Follow with the top 3 priority actions as a numbered list.

## Quality Criteria

- [ ] All 7 dimensions are evaluated or explicitly marked N/A with justification.
- [ ] The PASS/WARN/FAIL logic is applied strictly -- no subjective overrides.
- [ ] The numeric score math is correct and verifiable from the table.
- [ ] The letter grade matches the defined thresholds exactly (A=90-100%, B=80-89%, C=70-79%, D=60-69%, F=<60%).
- [ ] Priority actions are ranked by impact, not by alphabetical or discovery order.

## Assumptions & Limits

- Read-only. This skill aggregates findings but does not modify any plugin files.
- The scoring model (PASS=10, WARN=6, FAIL=2) is a simplification -- it does not weight dimensions differently. A FAIL in Security is treated the same as a FAIL in Content Quality numerically.
- N/A dimensions are excluded from the denominator, which can make partial evaluations appear better than they are. The skill mitigates this by noting reduced scope.
- Cannot distinguish between "1 critical finding" and "20 critical findings" within a dimension -- both score FAIL=2. The priority actions section provides the nuance.
- The letter grade thresholds are percentage-based and recalculate proportionally when dimensions are N/A.

## Good vs Bad

**Bad scorecard:**
```
Grade: B
Score: 58/70
```
Missing: no per-dimension breakdown, no finding counts, no priority actions.

**Good scorecard:**
```
| Dimension             | Status | Score | Findings (C/W/I) |
|-----------------------|--------|-------|-------------------|
| Structure Conformance | PASS   | 10    | 0 / 0 / 2         |
| Hook Safety           | FAIL   | 2     | 1 / 0 / 0         |
| **Total**             |        | 54/70 |                   |
| **Grade**             |        | **C** |                   |

Priority Actions:
1. Hook Safety (FAIL): Fix prompt hook on SessionStart — change type to command. +8 points.
```
Includes: per-dimension status with finding counts, verifiable math, grade, ranked priority actions with expected improvement.

## Anti-Patterns

1. **Subjective grading** -- assigning PASS to a dimension with warnings because "they are minor." The rules are strict: warnings mean WARN.
2. **Missing dimension** -- silently omitting a dimension instead of marking it N/A, inflating the apparent score.
3. **Score without context** -- reporting "52/70 = B" without showing the per-dimension breakdown that explains where points were lost.
4. **Priority actions from passing dimensions** -- recommending improvements to dimensions that already scored PASS while FAIL dimensions remain unaddressed.

## Edge Cases

1. **All dimensions PASS** -- score is 70/70, grade A. Priority actions section should state "No critical actions needed" and optionally suggest polish items from INFO findings.
2. **All dimensions FAIL** -- score is 14/70, grade F. Limit priority actions to the 3 most impactful (not all 7). Note that comprehensive rework is needed.
3. **Mixed N/A dimensions** -- if only 4 of 7 dimensions were evaluated, maximum score is 40. Recalculate grade thresholds proportionally: A = 90%+ of evaluated max, etc. Clearly note the reduced scope.
4. **Dimensions with only INFO findings** -- INFO findings do not affect PASS/WARN/FAIL status. A dimension with 0 critical, 0 warnings, and 5 INFO items is still PASS.
