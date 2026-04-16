# Use-Case Prompts — Risk Quantification

## Prompt 1: Monte Carlo Schedule Analysis

**When:** Determining schedule confidence levels and contingency
**Context variables:** `{project_name}`, `{activity_estimates}`, `{risk_register}`, `{confidence_target}`
**Deliver:**

```
Run a Monte Carlo schedule analysis for {project_name}: Activity estimates (optimistic, most likely, pessimistic): {activity_estimates}, Risks: {risk_register}, Target confidence: {confidence_target}. Produce: P50/P80/P90 completion dates, tornado diagram showing top schedule risk drivers, and recommended contingency buffer.
```

## Prompt 2: Expected Value Risk Portfolio

**When:** Calculating total risk exposure for budgeting
**Context variables:** `{risk_register}`, `{probability_estimates}`, `{impact_estimates}`
**Deliver:**

```
Calculate expected value for the risk portfolio: Risks: {risk_register}, Probabilities: {probability_estimates}, Impacts: {impact_estimates}. Produce: individual EMV per risk, total risk exposure, recommended contingency reserve, and sensitivity analysis showing which risks drive the most exposure.
```

## Prompt 3: Decision Tree Analysis

**When:** Evaluating risk response alternatives with different outcomes
**Context variables:** `{decision_point}`, `{alternatives}`, `{probabilities}`, `{outcomes}`
**Deliver:**

```
Build a decision tree for: Decision: {decision_point}, Alternatives: {alternatives}, Probabilities: {probabilities}, Outcomes: {outcomes}. Calculate expected value per alternative, recommend optimal decision, and visualize as Mermaid decision tree diagram.
```

*PMO-APEX v1.0 — Use-Case Prompts · Risk Quantification*
