# Monte Carlo Simulation — Body of Knowledge

> PMO-APEX Skill Reference | Domain: Quantitative Risk Analysis | Last updated: 2026-03-17

---

## 1. Foundational Concepts

### Monte Carlo Method
- **Origin**: Named after Monte Carlo casino; developed by Stanislaw Ulam and John von Neumann (1946) [DOC]
- **Principle**: Use random sampling from probability distributions to estimate outcomes of uncertain processes [DOC]
- **PM Application**: Simulate thousands of project scenarios to generate probability distributions for schedule and cost [DOC]

### PMI Standards
- **PMBOK 7th Ed.**: Quantitative risk analysis using simulation in Uncertainty Performance Domain [DOC]
- **PMI Practice Standard for Scheduling**: Monte Carlo as recommended technique for schedule risk analysis [DOC]
- **PMI-RMP**: Risk Management Professional certification covers Monte Carlo methodology [DOC]

---

## 2. Probability Distributions

| Distribution | When to Use | Parameters | PM Application |
|-------------|------------|-----------|---------------|
| Triangular | Simple 3-point estimates | Min, Most Likely, Max | Task duration estimates [METRIC] |
| PERT (Beta) | Weighted toward most likely | O, ML, P (4x ML weight) | Preferred for schedule [METRIC] |
| Normal | Symmetric uncertainty | Mean, Std Dev | Aggregated cost estimates [METRIC] |
| Uniform | Equal probability across range | Min, Max | Unknown distribution shape [METRIC] |
| Lognormal | Positively skewed risk | Mean, Std Dev | Cost overrun modeling [METRIC] |

---

## 3. Simulation Parameters

| Parameter | Recommended | Minimum | Rationale |
|-----------|:---:|:---:|---|
| Iterations | 10,000 | 1,000 | Statistical convergence [METRIC] |
| Confidence levels | P10, P50, P80, P90 | P50, P80 | Decision-relevant thresholds [METRIC] |
| Correlation | Model if known | Independent assumption | Understates risk if ignored [SUPUESTO] |
| Risk events | Include discrete risks | Optional | More realistic outcomes [PLAN] |

---

## 4. Output Interpretation

### S-Curve (Cumulative Distribution)
- **P10**: 10% chance of completing at or below this value (optimistic) [METRIC]
- **P50**: 50% chance (median expected outcome) [METRIC]
- **P80**: 80% chance (typical management commitment level) [METRIC]
- **P90**: 90% chance (conservative, includes contingency) [METRIC]

### Sensitivity Analysis (Tornado Diagram)
- Ranks activities/costs by their contribution to total variance [METRIC]
- Top drivers require management attention: mitigation or additional estimation [PLAN]
- Activities contributing >20% of variance are critical uncertainty drivers [METRIC]

### Contingency Calculation
- **Schedule contingency**: P80 date - P50 date [METRIC]
- **Cost contingency**: P80 cost - P50 cost [METRIC]
- Aligned to organizational risk appetite (some use P90 for high-criticality projects) [PLAN]

---

## 5. Integration Points

- **Upstream**: `schedule-baseline` provides 3-point estimates [SCHEDULE]
- **Upstream**: `cost-estimation` provides cost ranges [METRIC]
- **Upstream**: `risk-register` provides discrete risk events [PLAN]
- **Downstream**: `contingency-planning` uses contingency values [PLAN]
- **Cross-reference**: `earned-value-analysis` for ongoing forecasting [METRIC]

---

*PMO-APEX v1.0 — Body of Knowledge: Monte Carlo Simulation*
