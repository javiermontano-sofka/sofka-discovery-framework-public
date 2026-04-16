# Predictive Analytics — Use Case Prompts

## Prompt 1: EVM-Based Forecast
**Context:** Project in execution phase with at least 3 months of EVM data.
**Template:** "Generate predictive analytics for {project_name}. EVM data: BAC={bac}, AC={ac}, EV={ev}, PV={pv}. Calculate all EAC variants, TCPI, and forecast completion date range with 80% confidence interval."
**Expected Output:** EVM forecast report with 4 EAC methods, TCPI, and probabilistic completion date.

## Prompt 2: Monte Carlo Schedule Simulation
**Context:** Schedule with uncertain task durations needing probabilistic analysis.
**Template:** "Run Monte Carlo simulation for {project_name} schedule. Tasks: {task_list_with_optimistic_likely_pessimistic}. Constraints: {dependencies}. Generate P10, P50, P80, P95 completion dates."
**Expected Output:** Probabilistic schedule with percentile dates and critical path sensitivity.

## Prompt 3: Cost Overrun Early Warning
**Context:** PMO needs early detection of projects trending toward overrun.
**Template:** "Analyze cost trends for {project_name}. Monthly actuals: {monthly_data}. Detect anomalies, project cost at completion, and flag if overrun probability exceeds {threshold}%."
**Expected Output:** Anomaly detection report with cost forecast and confidence intervals.

## Prompt 4: Portfolio-Level Prediction
**Context:** PMO needs aggregate predictions across project portfolio.
**Template:** "Generate portfolio-level predictive analytics for {portfolio_name}. Projects: {project_list_with_evm_data}. Aggregate predictions for total portfolio cost, schedule, and risk exposure with correlation adjustments."
**Expected Output:** Portfolio forecast dashboard with aggregate Monte Carlo results.

## Prompt 5: Velocity-Based Sprint Forecast (Agile)
**Context:** Agile project with velocity history needing release date prediction.
**Template:** "Predict release date for {project_name}. Remaining backlog: {story_points} SP. Velocity history (last 10 sprints): {velocity_data}. Sprint length: {sprint_days} days. Factor in {known_disruptions}."
**Expected Output:** Probabilistic release date with velocity trend analysis and confidence bands.
