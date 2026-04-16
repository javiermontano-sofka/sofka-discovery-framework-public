# Portfolio Risk Management — Metaprompts

## MP-01: Black Swan Scenario Design
**Trigger:** Portfolio contains >$5M aggregate exposure or >3 correlated risk clusters.
**Metaprompt:** "Design 3 black swan scenarios for this portfolio. For each: (1) describe the triggering event, (2) trace cascading impacts across projects using the dependency graph, (3) estimate aggregate financial exposure with confidence intervals, (4) propose circuit-breaker mechanisms. Use Monte Carlo reasoning with 10,000 mental iterations. Tag all estimates with [METRIC] or [SUPUESTO]."

## MP-02: Risk Aggregation Normalization
**Trigger:** Individual project risk registers use different scales or taxonomies.
**Metaprompt:** "Normalize risk registers from {project_list} into a unified portfolio risk view. Map each project's risk taxonomy to the standard 5x5 probability-impact matrix. Flag risks that change severity when aggregated (diversification benefit or concentration penalty). Output a unified heat map with [METRIC] tags on every cell."

## MP-03: Cross-Portfolio Correlation Analysis
**Trigger:** Multiple projects share vendors, technologies, or resource pools.
**Metaprompt:** "Analyze cross-portfolio risk correlations for {portfolio_name}. Identify: (1) shared single points of failure, (2) resource contention risks, (3) technology concentration risks, (4) vendor dependency clusters. For each correlation cluster, calculate the portfolio-level impact if the shared factor fails. Present as a correlation matrix with [METRIC] evidence."

## MP-04: Risk-Adjusted Portfolio Optimization
**Trigger:** Portfolio budget reallocation or rebalancing cycle.
**Metaprompt:** "Optimize {portfolio_name} for risk-adjusted value. Current allocation: {current_allocation}. For each project: calculate risk-adjusted NPV using the portfolio risk register. Recommend reallocation that maximizes portfolio Sharpe ratio equivalent. Present efficient frontier with 5 allocation scenarios. Tag financial projections as [METRIC] or [SUPUESTO]."

## MP-05: Emerging Risk Radar
**Trigger:** Quarterly portfolio review or major market event.
**Metaprompt:** "Scan for emerging risks that could impact {portfolio_name} in the next 6-12 months. Categories: (1) technology disruption, (2) regulatory changes, (3) market shifts, (4) talent availability, (5) supply chain. For each emerging risk: assess probability of materialization, potential portfolio impact, and recommended early warning indicators. Tag with [INFERENCIA] or [SUPUESTO] as appropriate."
