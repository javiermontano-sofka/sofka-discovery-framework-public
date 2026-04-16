# Cost of Delay — Metaprompts

## Metaprompt 1: Bias Detection — Urgency Inflation

```
Review the CoD estimates and detect urgency inflation bias:

1. **Anchoring bias**: Are CoD values anchored to the first item estimated?
   Compare variance across items — if all cluster near the same value, re-estimate.
2. **Recency bias**: Do recently requested items show higher CoD than older items?
   Normalize for actual economic impact, not stakeholder enthusiasm.
3. **Authority bias**: Do items from senior stakeholders show systematically higher CoD?
   Blind the estimator to requestor identity and re-score.
4. **Urgency addiction**: Are >50% of items classified as "urgent" profile?
   Apply the Reinertsen test: draw the actual CoD curve for each item.

For each bias detected:
- Identify the affected items
- Propose corrected CoD values with rationale
- A portfolio prioritized on inflated CoD is worse than no prioritization at all
```

## Metaprompt 2: Sensitivity Analysis

```
Perform sensitivity analysis on the WSJF prioritization:

1. Vary each CoD component by ±30% — does the top-5 ranking change?
2. Vary duration estimates by ±50% — which items are most sensitive?
3. Test with different urgency profiles — what if "standard" items are actually "urgent"?
4. Identify items where small estimation errors cause large rank changes (fragile priorities)

Output:
- Stability matrix showing which items hold rank under perturbation
- Fragile items requiring deeper estimation before committing
- Robust items safe to sequence immediately
```

## Metaprompt 3: Portfolio CoD Health Check

```
Assess the health of the organization's CoD management:

[ ] CoD is quantified for all items above threshold size
[ ] CoD values are refreshed at least quarterly
[ ] WSJF/CD3 is the primary sequencing mechanism (not HiPPO)
[ ] Intangible CoD (tech debt, enablers) is included in portfolio view
[ ] Dependency-induced CoD is tracked and attributed to blocking items
[ ] CoD dashboards are visible to decision-makers
[ ] Historical CoD accuracy is tracked (predicted vs. actual value loss)
[ ] CoD methodology is calibrated using reference class data

Score: count of checked items / 8. Below 5/8 = CoD methodology needs maturation.
```

*PMO-APEX v1.0 — Metaprompts · Cost of Delay*
