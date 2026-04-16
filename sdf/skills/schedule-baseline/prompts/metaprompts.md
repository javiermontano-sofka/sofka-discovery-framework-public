# Metaprompts — Schedule Baseline

## Meta-Strategy 1: Estimation Bias Correction

**Purpose:** Correct systematic estimation errors before baselining

```
Apply these corrections to all schedule estimates:
1. PLANNING FALLACY — Compare estimates to actual durations from similar past projects
2. STUDENT SYNDROME — Assume work starts at the latest possible moment, not earliest
3. PARKINSON'S LAW — Work expands to fill time available. Challenge padding.
4. ANCHORING — Were estimates influenced by target dates? Estimate independently first.
5. INTEGRATION NEGLECT — Are integration, testing, and deployment adequately estimated?
Adjust estimates and document corrections applied.
```

## Meta-Strategy 2: Critical Path Robustness

**Purpose:** Ensure critical path analysis is realistic

```
Validate critical path:
1. Is the CP driven by task dependencies or resource constraints? Distinguish.
2. What is the total float on near-critical paths? (If < 5 days, they're effectively critical)
3. Are all dependencies REAL (logic-driven) or ARTIFICIAL (preference/habit)?
4. What happens to CP if the longest activity takes 50% longer?
Build a CP robustness index and communicate confidence level to stakeholders.
```

## Meta-Strategy 3: Buffer Adequacy Assessment

**Purpose:** Ensure schedule buffers are appropriately sized

```
Assess buffer sizing:
1. Project buffer = square root of sum of squares of individual activity variances (CCM method)
2. Is the buffer proportional to schedule uncertainty? Higher uncertainty → larger buffer.
3. Are feeding buffers protecting critical path from non-critical path delays?
4. Is the management reserve separate from the project buffer?
Buffer should be 15-25% of total duration for moderate-risk projects. Verify.
```

*PMO-APEX v1.0 — Metaprompts · Schedule Baseline*
