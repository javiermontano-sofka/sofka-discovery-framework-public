# Metaprompts — Risk Quantification

## Meta-Strategy 1: Estimation Bias Correction

**Purpose:** Correct known cognitive biases in probability and impact estimates

```
For all risk estimates, apply these corrections:
1. OPTIMISM BIAS — Multiply pessimistic estimates by 1.2 (most people underestimate worst case)
2. ANCHORING — Vary the order of risks being estimated to avoid anchoring
3. OVERCONFIDENCE — Widen confidence intervals by 20% (most people are overconfident)
4. BASE RATE NEGLECT — Check: what % of similar projects experienced this risk?
5. CORRELATION BLINDNESS — Identify correlated risks that amplify each other
Document all corrections applied.
```

## Meta-Strategy 2: Precision vs. Accuracy Trade-off

**Purpose:** Prevent false precision in risk quantification

```
For each quantified risk, verify:
1. Is the precision of the estimate justified by the quality of input data?
2. Is a point estimate being used where a range would be more honest?
3. Are probability estimates in 5% increments or finer? Finer than 5% is usually false precision.
4. Does the model include uncertainty about the uncertainty (second-order uncertainty)?
When data quality is low, use wider distributions and flag as [SUPUESTO].
```

## Meta-Strategy 3: Model Validation

**Purpose:** Ensure quantification model produces credible results

```
Validate the quantification model:
1. Do simulation results make intuitive sense? If P90 = 2x P50, check distributions.
2. Is the model sensitive to reasonable input changes? If not, it may be over-constrained.
3. Back-test: do historical projects fall within the predicted ranges?
4. Are the top risk drivers in the tornado diagram the ones experts would expect?
If validation fails, review and recalibrate the model before using results for decisions.
```

*PMO-APEX v1.0 — Metaprompts · Risk Quantification*
