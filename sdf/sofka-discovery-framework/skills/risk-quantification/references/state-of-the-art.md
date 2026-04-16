# State of the Art — Risk Quantification (2024-2026)

## Trend 1: AI-Enhanced Probability Estimation

ML models calibrate human probability estimates using historical project data, correcting for known biases (optimism, anchoring). Calibrated estimates improve Monte Carlo simulation accuracy by 20-30%. [DOC]

> "Principio Rector: Cuantificar el riesgo es convertir la incertidumbre en información accionable."

## Trend 2: Lightweight Quantification for Agile

Full Monte Carlo analysis adapted for agile contexts with sprint-level simulations, velocity-based risk models, and automated PERT calculations from story point estimates. [INFERENCIA]

## Trend 3: Real-Time Risk Exposure Tracking

Risk exposure (probability x impact) recalculated continuously as project data updates, providing real-time risk dashboards rather than point-in-time assessments. [DOC]

## Trend 4: Bayesian Updating of Risk Estimates

As projects progress, Bayesian methods update risk probability estimates based on observed evidence. A risk estimated at 30% probability that hasn't materialized by Phase 2 gets automatically reduced. [INFERENCIA]

## Trend 5: Portfolio-Level Risk Aggregation

Quantifying risk across multiple projects using correlation analysis and portfolio simulation. Diversification effects mean portfolio risk is less than sum of individual project risks. [DOC]

| Analysis Level | Technique | Output |
|---------------|-----------|--------|
| Activity | PERT three-point | Contingency per activity |
| Project | Monte Carlo simulation | P50/P80/P90 outcomes |
| Program | Correlated simulation | Program contingency |
| Portfolio | Copula-based aggregation | Portfolio VaR |

*PMO-APEX v1.0 — State of the Art · Risk Quantification*
