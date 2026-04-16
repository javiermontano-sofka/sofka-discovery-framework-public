# Use-Case Prompts — SAFe Framework

## Prompt 1: ART Launch Planning

**When:** Launching a new Agile Release Train
**Context variables:** `{art_name}`, `{teams}`, `{value_stream}`, `{pi_cadence}`
**Deliver:**

```
Plan the launch of {art_name}: Teams: {teams}, Value stream: {value_stream}, PI cadence: {pi_cadence}. Include: ART canvas, team topology, PI Planning logistics, ceremony calendar, role assignments, initial program backlog structure, and success metrics. Use SAFe 6.0 patterns.
```

## Prompt 2: PI Planning Preparation

**When:** Preparing for upcoming PI Planning event
**Context variables:** `{art_name}`, `{vision}`, `{top_features}`, `{capacity}`, `{dependencies}`
**Deliver:**

```
Prepare PI Planning materials for {art_name}: Vision: {vision}, Top features: {top_features}, Capacity: {capacity}, Known dependencies: {dependencies}. Produce: management briefing, feature prioritization (WSJF), capacity allocation per team, dependency board template, and PI objectives template.
```

## Prompt 3: Inspect & Adapt Facilitation

**When:** End of PI, conducting I&A workshop
**Context variables:** `{pi_metrics}`, `{pi_objectives_achieved}`, `{team_feedback}`, `{improvement_backlog}`
**Deliver:**

```
Facilitate Inspect & Adapt for the completed PI: Metrics: {pi_metrics}, Objectives achieved: {pi_objectives_achieved}, Feedback: {team_feedback}, Previous improvements: {improvement_backlog}. Produce: quantitative PI assessment, problem-solving workshop structure, and prioritized improvement features for next PI.
```

*PMO-APEX v1.0 — Use-Case Prompts · SAFe Framework*
