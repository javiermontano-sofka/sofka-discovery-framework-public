# Use-Case Prompts — Retrospective Engine

## Prompt 1: Sprint Retrospective Facilitation

**When:** End of sprint, team needs structured reflection
**Context variables:** `{team_name}`, `{sprint_number}`, `{sprint_metrics}`, `{previous_actions}`
**Deliver:**

```
Facilitate a sprint retrospective for {team_name} (Sprint {sprint_number}):
Metrics: {sprint_metrics}
Previous action items: {previous_actions}
Generate: data-driven discussion topics, anomaly highlights, improvement experiment suggestions. Format as facilitator guide with timebox per section. Track previous action completion rate.
```

## Prompt 2: Release Retrospective

**When:** After a major release, looking back at the full delivery cycle
**Context variables:** `{project_name}`, `{release_timeline}`, `{key_events}`, `{metrics_summary}`
**Deliver:**

```
Conduct a release retrospective for {project_name}: Timeline: {release_timeline}, Key events: {key_events}, Metrics: {metrics_summary}. Use timeline format. Identify systemic patterns, celebrate successes, and generate organization-level improvement recommendations. Include Mermaid timeline diagram.
```

## Prompt 3: Improvement Experiment Design

**When:** Turning retrospective insights into measurable experiments
**Context variables:** `{insight}`, `{hypothesis}`, `{team_context}`
**Deliver:**

```
Design an improvement experiment from this retrospective insight:
Insight: {insight}
Hypothesis: {hypothesis}
Context: {team_context}
Include: experiment design (hypothesis, metric, duration, control), implementation steps, success criteria, and rollback plan if experiment fails.
```

*PMO-APEX v1.0 — Use-Case Prompts · Retrospective Engine*
