---
name: apex-predictive-analytics
description: >
  Use when the user asks to "forecast project completion", "predict cost overrun",
  "model risk probability", "run Monte Carlo on schedule", "generate confidence intervals",
  or mentions predictive analytics, ML forecasting, schedule prediction, cost forecasting,
  risk materialization prediction. Triggers on: produces probabilistic schedule forecasts,
  calculates cost-at-completion with confidence ranges, models risk materialization probability,
  identifies early warning indicators, generates P50/P80/P95 confidence intervals.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Predictive Analytics for Project Management

**TL;DR**: Applies ML-based forecasting and statistical modeling to project data for schedule completion prediction, cost-at-completion forecasting, risk materialization probability, and resource demand projection. Uses historical trends, earned value data, velocity patterns, and Monte Carlo simulation to produce probabilistic forecasts with explicit confidence intervals — replacing hope-based planning with evidence-based prediction.

## Principio Rector
Un forecast sin intervalo de confianza es una adivinanza con formato de dato. Las predicciones de proyecto deben comunicar tres cosas: la estimación más probable, el rango de incertidumbre, y las condiciones bajo las cuales la predicción se invalida. Los stakeholders merecen probabilidades, no promesas.

## Assumptions & Limits
- Assumes minimum 10 historical data points for statistically valid predictions [METRIC]
- Assumes project metrics (EVM, velocity, throughput) are being collected consistently [SUPUESTO]
- Breaks if fewer than 5 data points — insufficient for any meaningful prediction; use expert judgment with [SUPUESTO] tags [METRIC]
- Scope limited to project-level prediction; portfolio-level forecasting aggregates project predictions [PLAN]
- Does not predict black swan events — models based on historical patterns; novel risks require scenario analysis [PLAN]
- Predictions are probabilistic — communicating a single number defeats the purpose [PLAN]

## Usage
```bash
/pm:predictive-analytics $PROJECT_NAME --predict=schedule --confidence=P80
/pm:predictive-analytics $PROJECT_NAME --predict=cost --method=evm-extrapolation
/pm:predictive-analytics $PROJECT_NAME --predict=all --early-warnings --sensitivity
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT_NAME` | Yes | Target project identifier |
| `--predict` | No | `schedule` / `cost` / `risk` / `resource` / `all` (default: `all`) |
| `--confidence` | No | Target confidence level (default: `P80`) |
| `--method` | No | `evm-extrapolation` / `monte-carlo` / `velocity-based` / `auto` |
| `--early-warnings` | No | Include early warning indicator analysis |
| `--sensitivity` | No | Include sensitivity analysis of key drivers |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Velocity-based forecasting (when will backlog be done?), sprint predictability index, release date probability
- **Waterfall**: EVM-based EAC/ETC forecasting, TCPI analysis, phase completion probability modeling
- **SAFe**: PI predictability measure trending, ART velocity forecasting, program-level EAC
- **Kanban**: Throughput-based delivery date forecasting, Monte Carlo "how many" and "when" simulations
- **Hybrid**: Combined prediction models for iterative and sequential project segments
- **PMO**: Cross-portfolio trend analysis, organizational predictability benchmarking
- **Portfolio**: Portfolio cost-at-completion aggregation, strategic initiative completion probability
- **Recovery**: Recovery plan probability analysis, "what if" scenario modeling

## Before Running Predictions
1. Read historical performance data — minimum 10 data points for statistical validity [METRIC]
2. Glob `*evm*`, `*velocity*`, `*throughput*` — identify available prediction inputs [METRIC]
3. Read schedule and cost baselines — prediction measures deviation from baseline [SCHEDULE]
4. Check data quality — predictions from bad data are worse than no predictions [METRIC]

## Entrada (Input Requirements)
- Historical project performance data (minimum 10 data points for statistical validity)
- Current project metrics (EVM indices, velocity, throughput, cycle time)
- Schedule and cost baselines with variance history
- Risk register with historical materialization rates
- External factors affecting project trajectory

## Proceso (Protocol)
1. **Data collection and validation** — Gather historical and current performance data, validate quality
2. **Trend identification** — Identify patterns in velocity, CPI, SPI, throughput trends
3. **Model selection** — Choose prediction approach (linear regression, Monte Carlo, Bayesian, EVM extrapolation)
4. **Schedule forecasting** — Predict completion date with P50, P80, P95 confidence intervals
5. **Cost forecasting** — Predict final cost (EAC) using independent EAC methods and range analysis
6. **Risk probability modeling** — Calculate risk materialization probability from historical patterns
7. **Resource demand projection** — Forecast resource needs based on remaining work and productivity trends
8. **Scenario modeling** — Model optimistic, most likely, and pessimistic scenarios with trigger conditions
9. **Early warning indicators** — Identify leading indicators that predict future schedule/cost deviations
10. **Forecast communication** — Package predictions with confidence intervals, limitations, and invalidation conditions

## Edge Cases
1. **Insufficient historical data (fewer than 5 points)** — Use expert judgment with explicit [SUPUESTO] tags; communicate that "prediction" is actually estimation, not statistical forecasting.
2. **Prediction shows deadline miss at P80** — Present probability of meeting deadline explicitly; recommend scope reduction, resource addition, or deadline renegotiation with quantified trade-offs.
3. **Model drift (accuracy declining over periods)** — Recalibrate model; investigate cause (scope changes, team changes, external factors); document model validity period.
4. **Cost forecast exceeds budget plus reserves** — Trigger formal budget review; present EAC range with multiple calculation methods for governance decision.
5. **Prediction contradicts team's qualitative assessment** — Present both; investigate divergence; often indicates either data quality issue or cognitive bias — both worth exposing.

## Example: Good vs Bad

**Good Predictive Analytics:**
| Attribute | Value |
|-----------|-------|
| Data quality | 15 sprints of velocity data, CPI/SPI for 6 months [METRIC] |
| Schedule forecast | P50: Aug 15, P80: Sep 3, P95: Sep 22 [SCHEDULE] |
| Cost forecast | EAC P50: 1.8M, P80: 2.1M (3 independent methods averaged) [METRIC] |
| Early warnings | SPI trending below 0.9 for 3 consecutive periods — schedule risk [METRIC] |
| Invalidation conditions | "Forecast assumes team size stays at 8; adding/removing changes model" [PLAN] |

**Bad Predictive Analytics:**
"The project will finish on August 15." — Single date, no confidence interval, no methodology, no limitations, no invalidation conditions. A promise disguised as a prediction.

## Salida (Deliverables)
- `06_predictive_analytics_{proyecto}_{WIP}.md` — Predictive analytics report
- Schedule forecast with P50/P80/P95 completion dates
- Cost forecast (EAC) with confidence range and method comparison
- Risk materialization probability matrix
- Early warning indicator dashboard with threshold triggers

## Validation Gate
- [ ] Predictions based on validated historical data with minimum 10 data points
- [ ] Confidence intervals calculated with documented statistical method
- [ ] Schedule, cost, risk, and resource dimensions all forecasted
- [ ] Prediction models applied consistently across reporting periods
- [ ] Forecasts trigger specific corrective action thresholds — not just informational
- [ ] Visual probability distributions presented, not just single numbers
- [ ] Every prediction traces to specific data inputs and model parameters
- [ ] Prediction limitations and invalidation conditions explicitly stated
- [ ] Forecasts answer stakeholder questions — "when?" "how much?" "what if?"
- [ ] Prediction cadence and method appropriate for declared project methodology

## Escalation Triggers
- Prediction shows deadline miss at P80 confidence level
- Cost forecast exceeds approved budget plus management reserves
- Insufficient historical data for meaningful prediction (< 5 data points)
- Prediction accuracy declining over consecutive periods (model drift)

## Additional Resources
| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | When applying statistical forecasting methods to PM | `references/body-of-knowledge.md` |
| State of the Art | When implementing ML-based project forecasting | `references/state-of-the-art.md` |
| Knowledge Graph | When mapping prediction to pipeline reporting | `references/knowledge-graph.mmd` |
| Use Case Prompts | When generating forecasts for specific project types | `prompts/use-case-prompts.md` |
| Metaprompts | When adapting prediction for low-data contexts | `prompts/metaprompts.md` |
| Sample Output | When reviewing expected prediction report quality | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
