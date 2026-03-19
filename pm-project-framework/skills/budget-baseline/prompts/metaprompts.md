# Metaprompts — Budget Baseline

## Meta-Strategy 1: Estimation Confidence Calibration

**Purpose**: Ensure budget estimates reflect true uncertainty rather than false precision.

**Strategy**:
For each estimate, require three-point estimation and report the confidence interval:
1. Optimistic (P10) — Best case with everything going right
2. Most Likely (P50) — Normal conditions
3. Pessimistic (P90) — Worst realistic case

**Application template**:
> For `{work_package}`, provide three-point estimate. Calculate PERT estimate = (O + 4M + P) / 6. Report standard deviation. If any estimate has range >50% of most-likely, flag for decomposition into smaller work packages. Never present single-point estimates for work packages >1 sprint. [METRIC]

## Meta-Strategy 2: Historical Benchmarking

**Purpose**: Validate estimates against organizational history.

**Strategy**:
Before approving any baseline, compare against:
1. Cost per story point from last 3 similar projects
2. Cost per FTE-month by role and technology
3. Overhead percentage (meetings, coordination, rework)
4. Contingency utilization rate from past projects

**Application template**:
> Compare `{baseline}` against organizational benchmarks. Flag any work package where estimate deviates >25% from historical average. Document justification for deviations (new technology, team composition, etc.). If no benchmarks exist, tag entire baseline as [SUPUESTO] with higher contingency. [INFERENCIA]

## Meta-Strategy 3: Stakeholder-Aligned Reporting

**Purpose**: Present budget information appropriate to audience.

**Strategy**:
- **Sponsor**: Total budget, contingency level, key assumptions, confidence level
- **PM**: Work package detail, burn rate, variance triggers
- **Team**: Sprint budget, velocity-to-cost ratio

**Application template**:
> Generate budget baseline views for each stakeholder tier. Ensure sponsor view includes management reserve and decision points. PM view includes EVM setup parameters. Team view shows sprint-level allocation only. Never expose management reserve to non-authorized stakeholders. [STAKEHOLDER]

*PMO-APEX v1.0 — Metaprompts · Budget Baseline*
