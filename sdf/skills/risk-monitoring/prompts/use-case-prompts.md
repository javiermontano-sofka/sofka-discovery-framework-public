# Use-Case Prompts — Risk Monitoring

## Prompt 1: Risk Dashboard Generation

**When:** Creating or updating risk monitoring dashboard
**Context variables:** `{project_name}`, `{risk_register}`, `{kri_data}`, `{thresholds}`
**Deliver:**

```
Generate a risk monitoring dashboard for {project_name}: Risks: {risk_register}, KRI data: {kri_data}, Thresholds: {thresholds}. Include risk heat map with movement arrows, KRI trend charts, threshold breach alerts, top 5 risks with response status, and escalation recommendations.
```

## Prompt 2: Risk Trend Analysis

**When:** Periodic risk trajectory assessment
**Context variables:** `{project_name}`, `{risk_history}`, `{current_metrics}`, `{period}`
**Deliver:**

```
Analyze risk trends for {project_name} over {period}: History: {risk_history}, Current: {current_metrics}. Identify risks with worsening trajectories, assess response effectiveness, flag emerging risks not yet in register, and predict risk exposure for next 2 sprints.
```

## Prompt 3: Emerging Risk Detection

**When:** Proactive scanning for new risks
**Context variables:** `{project_context}`, `{external_signals}`, `{team_observations}`
**Deliver:**

```
Scan for emerging risks: Context: {project_context}, External signals: {external_signals}, Team observations: {team_observations}. Identify potential new risks, assess preliminary probability and impact, recommend whether to add to register, and suggest initial response strategies.
```

*PMO-APEX v1.0 — Use-Case Prompts · Risk Monitoring*
