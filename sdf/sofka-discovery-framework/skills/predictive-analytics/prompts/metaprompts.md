# Predictive Analytics — Metaprompts

## MP-01: Model Selection Advisor
**Trigger:** New prediction request without specified method.
**Metaprompt:** "Evaluate the available data for {project_name} and recommend the optimal predictive method. Consider: (1) data volume — are there >=20 historical data points? (2) data quality — what % is validated vs. estimated? (3) prediction horizon — short-term (<3 months) vs. long-term? (4) uncertainty tolerance — does the stakeholder need P50 or P95? Recommend primary and fallback methods with justification. Tag data quality assessment as [METRIC] and method rationale as [INFERENCIA]."

## MP-02: Prediction Accuracy Audit
**Trigger:** Quarterly review or when predictions diverge >15% from actuals.
**Metaprompt:** "Audit predictive accuracy for {project_name}. Compare: (1) predicted vs. actual cost at each milestone, (2) predicted vs. actual schedule at each gate, (3) predicted vs. actual risk materializations. Calculate MAPE, bias direction, and confidence interval calibration. For each significant deviation, perform root cause analysis. Tag all comparisons with [METRIC] and root causes with [INFERENCIA]."

## MP-03: Assumption Stress Test
**Trigger:** Predictions rely on >3 assumptions or any assumption tagged [SUPUESTO].
**Metaprompt:** "Stress test assumptions underlying predictions for {project_name}. For each assumption: (1) define the base case value, (2) define pessimistic and optimistic bounds, (3) calculate prediction sensitivity (elasticity), (4) identify which assumptions, if wrong, would change the recommendation. Present tornado diagram of assumption impact. Tag base cases as [METRIC] or [SUPUESTO], sensitivities as [INFERENCIA]."

## MP-04: Ensemble Model Construction
**Trigger:** High-stakes prediction where single-method risk is unacceptable.
**Metaprompt:** "Build an ensemble prediction for {project_name} combining: (1) EVM-based forecast (CPI method), (2) EVM composite (CPI x SPI), (3) Monte Carlo simulation, (4) Bayesian estimate with organizational priors. Weight each method by its historical accuracy for similar projects. Present unified prediction with confidence intervals and method contribution breakdown. Tag all weights as [METRIC] or [HISTORICO]."

## MP-05: Anomaly Detection Calibration
**Trigger:** Setting up early warning system for project portfolio.
**Metaprompt:** "Calibrate anomaly detection thresholds for {portfolio_name}. Using historical data from {n_completed_projects}: (1) define normal variance bands for CPI, SPI, and velocity, (2) set alert thresholds at 1.5 sigma (warning) and 2 sigma (critical), (3) backtest against historical overruns to measure detection rate and false positive rate. Optimize thresholds for >=80% detection with <=20% false positive rate. Tag all thresholds as [METRIC]."
