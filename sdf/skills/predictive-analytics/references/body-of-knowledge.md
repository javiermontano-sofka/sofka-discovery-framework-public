# Predictive Analytics — Body of Knowledge

## Standards & Frameworks
Core knowledge areas: Time series forecasting, Monte Carlo simulation, earned value prediction, Bayesian estimation, machine learning for project outcomes, regression analysis for effort estimation.

## PMBOK Alignment
- Integrates with PMBOK 7th Edition performance domains (Measurement, Planning)
- Supports ISO 21502:2020 project governance requirements
- Compatible with PRINCE2 and hybrid methodologies
- Extends EVM with predictive capabilities (EAC, TCPI, SPI forecasting)

## Key Concepts

### Inputs
- Historical project data (actuals vs. estimates)
- Earned value metrics (CPI, SPI, EAC, TCPI)
- Risk register with probability distributions
- Resource utilization time series
- Velocity/throughput data (agile projects)
- External market and organizational context data

### Analytical Methods
1. **Time Series Forecasting**: ARIMA, exponential smoothing, trend decomposition for schedule/cost prediction
2. **Monte Carlo Simulation**: Probabilistic modeling with 10,000+ iterations for range estimates
3. **Earned Value Prediction**: CPI/SPI trend extrapolation, EAC calculation methods (4 variants)
4. **Bayesian Estimation**: Prior-informed estimates updated with actuals as project progresses
5. **Regression Analysis**: Multi-variate models for effort, duration, and cost estimation
6. **Classification Models**: Go/No-Go prediction, risk materialization likelihood
7. **Anomaly Detection**: Early warning systems for schedule slippage and cost overruns

### Process Steps
1. Collect and validate historical data
2. Select appropriate analytical method based on data availability
3. Build predictive model with defined assumptions
4. Validate model against historical actuals (backtesting)
5. Generate predictions with confidence intervals
6. Sensitivity analysis on key variables
7. Present findings with evidence tags and uncertainty bands
8. Monitor prediction accuracy and recalibrate
9. Feed actuals back into model for continuous improvement
10. Archive model performance for organizational learning

### Outputs
- Predictive dashboard with confidence intervals
- Monte Carlo simulation results (P10, P50, P80, P95)
- EVM forecast report (EAC, TCPI, completion date range)
- Risk materialization probability updates
- Model accuracy scorecard
- Decision support recommendations with evidence tags

## Quality Criteria
| Criterion | Threshold | Evidence Tag |
|-----------|-----------|-------------|
| Historical data points | ≥20 data points | [HISTORICO] Required |
| Model backtesting accuracy | ≥75% within CI | [METRIC] Required |
| Confidence intervals | Always provided | [METRIC] Required |
| Assumption documentation | 100% documented | [SUPUESTO] Required |
| Prediction vs. actual tracking | Monthly review | [METRIC] Recommended |

## Integration Points
- Feeds into: project dashboard, steering committee reports, risk register updates, portfolio prioritization
- Receives from: EVM data, velocity metrics, risk register, resource utilization, financial actuals
- Cross-references: portfolio-dashboard, portfolio-risk, pmo-health-check, schedule management

## Key Formulas
- **EAC (CPI-based)**: BAC / CPI
- **EAC (composite)**: AC + (BAC - EV) / (CPI x SPI)
- **TCPI**: (BAC - EV) / (BAC - AC) or (BAC - EV) / (EAC - AC)
- **Confidence Interval**: Point estimate +/- z x standard error
- **Monte Carlo P-value**: Percentile of cumulative distribution from N simulations
