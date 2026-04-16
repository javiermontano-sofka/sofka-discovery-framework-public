---
name: data-storytelling
author: JM Labs (Javier Montaño)
description: >
  Transforms metrics into meaning through comparison framing, magnitude communication,
  and evidence-driven narratives. Trigger: "make the data speak", "data story", "metrics narrative".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Data Storytelling

Converts raw metrics and data points into meaningful narratives by applying comparison
framing, magnitude communication, and visual-verbal integration that makes quantitative
evidence persuasive and memorable.

## Guiding Principle

> *"A number without context is noise. A number with comparison is information. A number with narrative is insight."*

## Procedure

### Step 1 — Data Inventory and Quality Check

1. Catalog all available data points, their sources, and their freshness.
2. Assess data quality: completeness, accuracy, and potential biases.
3. Identify the key metrics that most directly support the story's objective.
4. Flag data gaps that limit the narrative's confidence level.

### Step 2 — Comparison Framework Design

1. Establish baselines: what is "normal" for this context?
2. Select comparison frames: before/after, us/them, actual/target, over time.
3. Choose magnitude communication strategies: ratios, percentages, absolute numbers.
4. Identify the single most surprising or impactful data point (the "anchor stat").

### Step 3 — Narrative Construction

1. Open with the anchor stat — the data point that reframes understanding.
2. Build context through progressive comparison (baseline, trend, projection).
3. Use analogies to make abstract numbers concrete and relatable.
4. Close with the implication: what should the audience do differently based on this data?

### Step 4 — Visualization Design

1. Choose chart types that match the data relationship (comparison, composition, trend, distribution).
2. Apply the data-ink ratio principle: maximize data, minimize decoration.
3. Annotate visualizations with the key insight they communicate.
4. Ensure visualizations are accessible (colorblind-safe, labeled, described in text).

## Quality Criteria

- Every data point has a comparison frame (baseline, trend, or benchmark).
- The anchor stat is surprising, defensible, and relevant to the decision at hand.
- Visualizations have a clear title that states the insight, not just the topic.
- Data limitations and confidence levels are disclosed transparently.

## Anti-Patterns

- Presenting raw numbers without baselines or comparison frames.
- Cherry-picking data that supports the narrative while omitting contradictory evidence.
- Using visualization types that obscure the data relationship (pie charts for trends, bar charts for composition).
- Drowning the narrative in data instead of selecting the 3-5 most impactful metrics.
