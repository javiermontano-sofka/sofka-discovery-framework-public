# Metaprompts — Budget Tracking

## Meta-Strategy 1: Multi-Scenario Forecasting

**Purpose**: Present budget forecasts as probability ranges, not single points.

**Strategy**:
Calculate EAC using 3 methods and present as range:
1. **Optimistic EAC** = AC + (BAC - EV) — assumes remaining work at original estimates
2. **Most Likely EAC** = BAC / CPI — assumes current efficiency continues
3. **Pessimistic EAC** = AC + (BAC - EV) / (CPI x SPI) — accounts for schedule and cost

**Application template**:
> For `{project}`, calculate all three EAC scenarios. Present as range with most-likely highlighted. If range exceeds 15% of BAC, flag for management attention. Always show assumptions behind each scenario. [METRIC]

## Meta-Strategy 2: Leading Indicator Detection

**Purpose**: Detect budget problems before they appear in actuals.

**Strategy**:
Monitor leading indicators that precede budget overruns:
1. Scope creep velocity (new requirements per sprint) [PLAN]
2. Rework rate (stories returned to development) [METRIC]
3. Team overtime hours (unsustainable pace) [STAKEHOLDER]
4. Dependency delays (blocked work accumulating) [SCHEDULE]

**Application template**:
> Beyond financial metrics, monitor leading indicators for `{project}`. If 2+ leading indicators are trending negative while CPI is still healthy, issue early warning. Budget overruns typically lag leading indicators by 2-3 sprints. [INFERENCIA]

## Meta-Strategy 3: Sunk Cost Discipline

**Purpose**: Prevent sunk cost fallacy in budget decisions.

**Strategy**:
When reviewing budget variances, always frame decisions as forward-looking:
- "Given where we are today, should we continue, pivot, or stop?"
- Never justify continued spending based on amount already spent
- Present remaining-cost-to-complete vs. remaining-benefits as the decision metric

**Application template**:
> When presenting budget status for `{project}` with negative variance, frame recommendations using future costs only. Calculate remaining cost-to-benefit ratio. If ratio has degraded below 1.0, recommend scope reduction or project pause. [PLAN]

*PMO-APEX v1.0 — Metaprompts · Budget Tracking*
