# Cost of Delay — Use Case Prompts

## Use Case 1: Portfolio Prioritization with WSJF

**When**: Quarterly planning or backlog refinement with >20 competing items.
**Context**: Product owners disagree on priority; need economic framework.

**Prompt Template**:
```
Prioritize the following backlog items using WSJF (Weighted Shortest Job First).

Items: {BACKLOG_ITEMS}
Revenue data: {REVENUE_ESTIMATES}
Deadlines: {KNOWN_DEADLINES}
Dependencies: {DEPENDENCY_MAP}

For each item, estimate:
1. User-Business Value (1-13 Fibonacci)
2. Time Criticality (1-13 Fibonacci)
3. Risk Reduction / Opportunity Enablement (1-13 Fibonacci)
4. Job Duration (1-13 Fibonacci)
5. WSJF = (1+2+3) / 4

Output: Ranked table with CoD breakdown, recommended sequence, and sensitivity notes.
```

**Output**: Ranked priority table with WSJF scores, urgency profiles, and sequencing recommendation. [PLAN]

## Use Case 2: Delay Impact Quantification

**When**: Stakeholder requests delay; need to quantify the cost.
**Context**: Schedule change proposed; PM needs to communicate economic impact.

**Prompt Template**:
```
Quantify the cost of delaying {ITEM_NAME} by {DELAY_WEEKS} weeks.

Current expected delivery: {CURRENT_DATE}
Revenue model: {REVENUE_MODEL}
Contractual penalties: {PENALTIES}
Downstream dependencies: {BLOCKED_ITEMS}

Calculate:
- Direct CoD (revenue loss or penalty)
- Indirect CoD (blocked items' accumulated CoD)
- Total portfolio CoD impact
- Break-even analysis: at what delay does the item become unviable?
```

**Output**: Economic impact report with direct/indirect CoD, visualization of CoD curve, and decision recommendation. [METRIC]

## Use Case 3: Capacity Constraint Analysis

**When**: Resource bottleneck identified; need to justify capacity investment.
**Context**: Team is overloaded; backlog CoD is accumulating.

**Prompt Template**:
```
Analyze the cost of delay accumulating behind {BOTTLENECK_RESOURCE}.

Queue: {QUEUED_ITEMS_WITH_COD}
Current throughput: {ITEMS_PER_SPRINT}
Proposed capacity increase: {ADDITIONAL_CAPACITY}

Calculate:
- Current queue CoD (total value eroding while waiting)
- CoD reduction if capacity increased
- ROI of capacity investment vs. CoD saved
- Recommended queue management strategy
```

**Output**: Business case for capacity investment with CoD-based ROI analysis. [METRIC]

## Use Case 4: Technical Debt CoD Assessment

**When**: Technical debt items need prioritization against feature work.
**Context**: Engineering argues for refactoring; business wants features.

**Prompt Template**:
```
Estimate the Cost of Delay for technical debt items using intangible CoD methodology.

Tech debt items: {TECH_DEBT_BACKLOG}
Impact on velocity: {VELOCITY_DEGRADATION}
Incident frequency: {INCIDENT_DATA}
Developer satisfaction: {DEVEX_SCORES}

For each item, calculate:
- CoD from velocity degradation (features delayed due to complexity)
- CoD from incidents (MTTR × incident frequency × business impact)
- CoD from attrition risk (replacement cost × departure probability)
- Compound CoD trajectory over 3, 6, 12 months
```

**Output**: Tech debt prioritization with economic justification comparable to feature CoD. [METRIC]

*PMO-APEX v1.0 — Use Case Prompts · Cost of Delay*
