# Body of Knowledge — Risk Quantification

## 1. Definition and Scope

Risk quantification is the process of numerically analyzing the combined effect of identified risks on overall project objectives. It goes beyond qualitative assessment (High/Medium/Low) to produce probabilistic estimates of project outcomes, enabling data-driven risk decisions. [DOC]

## 2. Foundational Frameworks

| Framework | Source | Key Contribution |
|-----------|--------|-----------------|
| PMBOK Quantitative Risk Analysis | PMI, 2021 | Monte Carlo, decision trees, sensitivity |
| ISO 31010:2019 | ISO | Risk assessment techniques catalog |
| @RISK / Crystal Ball | Palisade/Oracle | Probabilistic simulation tools |
| Expected Monetary Value | Decision theory | Single-point risk valuation |
| Bayesian Networks | Pearl, 1988 | Conditional probability modeling |

## 3. Quantification Techniques

| Technique | Description | When to Use | Accuracy |
|-----------|-------------|-------------|----------|
| Monte Carlo Simulation | Random sampling from probability distributions | Schedule/cost risk | High |
| Decision Tree Analysis | Expected value of decision alternatives | Decision points | Medium-High |
| Sensitivity Analysis | Impact of single variable changes | Identifying key drivers | Medium |
| PERT Estimation | Three-point estimates (O, ML, P) | Activity-level risk | Medium |
| Expected Value (EV) | Probability x Impact | Individual risk valuation | Low-Medium |

## 4. Monte Carlo Simulation Process

1. Define activity duration/cost distributions (triangular, PERT, normal)
2. Identify correlations between activities
3. Run 10,000+ simulation iterations
4. Analyze output distribution (P50, P80, P90 confidence levels)
5. Identify activities with highest contribution to variance
6. Set contingency reserves based on desired confidence level [METRIC]

## 5. Risk Exposure Calculation

| Component | Formula | Example |
|-----------|---------|---------|
| Single risk EMV | Probability x Impact | 30% x 20 FTE-months = 6 FTE-months |
| Total risk exposure | Sum of all risk EMVs | 6 + 4 + 3 = 13 FTE-months |
| Contingency reserve | P80 - P50 estimate | 45 - 38 = 7 FTE-months buffer |
| Management reserve | P90 - P80 estimate | 52 - 45 = 7 FTE-months additional |

## 6. Output Interpretation

| Confidence Level | Meaning | Use Case |
|-----------------|---------|----------|
| P50 | 50% chance of meeting target | Aggressive target |
| P80 | 80% chance of meeting target | Standard planning target [PLAN] |
| P90 | 90% chance of meeting target | Contractual commitment |
| P95 | 95% chance of meeting target | High-stakes, regulated |

## 7. Academic and Industry References

1. PMI. *Practice Standard for Project Risk Management*, 2009
2. ISO. *ISO 31010:2019 — Risk Assessment Techniques*, 2019
3. Hubbard, D. *How to Measure Anything*, Wiley, 2014
4. Vose, D. *Risk Analysis: A Quantitative Guide*, Wiley, 2008
5. Hillson, D. & Simon, P. *Practical Project Risk Management*, Management Concepts, 2020
6. Clemen, R. *Making Hard Decisions*, Cengage, 2013
7. Pearl, J. *Probabilistic Reasoning in Intelligent Systems*, Morgan Kaufmann, 1988

*PMO-APEX v1.0 — Body of Knowledge · Risk Quantification*
