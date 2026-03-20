# Use-Case Prompts — Project Selection

## Prompt 1: Weighted Scoring Matrix

**When:** Multiple project proposals need comparative evaluation
**Context variables:** `{proposals}`, `{criteria}`, `{weights}`, `{stakeholders}`
**Deliver:**

```
Build a weighted scoring matrix to evaluate these project proposals:
Proposals: {proposals}
Criteria: {criteria}
Weights: {weights}
Evaluate each proposal against each criterion (1-10 scale). Calculate weighted scores, rank proposals, and provide selection recommendation with sensitivity analysis. Tag all scores with evidence sources.
```

## Prompt 2: Portfolio Balance Analysis

**When:** Reviewing the overall portfolio composition after selection
**Context variables:** `{current_portfolio}`, `{proposed_additions}`, `{strategic_themes}`
**Deliver:**

```
Analyze portfolio balance with proposed additions:
Current portfolio: {current_portfolio}
Proposed additions: {proposed_additions}
Strategic themes: {strategic_themes}
Assess balance across: risk levels, time horizons, innovation types (70/20/10), business units. Recommend adjustments to achieve optimal portfolio balance.
```

## Prompt 3: Kill/Continue Decision

**When:** Periodic portfolio review to decide on existing projects
**Context variables:** `{project_name}`, `{original_business_case}`, `{current_performance}`, `{market_changes}`
**Deliver:**

```
Conduct a kill/continue analysis for {project_name}:
Original case: {original_business_case}
Current performance: {current_performance}
Market changes: {market_changes}
Apply sunk cost correction, reassess strategic fit, calculate remaining value vs. remaining investment, and recommend: continue as-is, pivot, reduce scope, or kill. Include stakeholder impact analysis.
```

*PMO-APEX v1.0 — Use-Case Prompts · Project Selection*
