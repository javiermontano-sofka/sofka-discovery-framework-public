---
name: trade-off-analyzer
author: JM Labs (Javier Montaño)
description: >
  Multi-criteria decision framework using weighted scoring matrices, ATAM scenarios, and sensitivity analysis.
  Trigger: "analyze trade-offs", "compare options", "weighted scoring", "ATAM", "decision matrix".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Trade-Off Analyzer

Applies structured multi-criteria analysis to architectural decisions, producing weighted scoring matrices, sensitivity analyses, and ATAM-style scenario evaluations that make trade-offs explicit and defensible.

## Guiding Principle

> *"Every architecture is a set of trade-offs. The architect's job is to make those trade-offs visible, not to pretend they don't exist."*

## Procedure

### Step 1 — Define the Decision Space
1. Articulate the architectural question in a single sentence.
2. Identify the stakeholders who will be affected by the outcome.
3. Extract 4-8 quality-attribute drivers (performance, security, maintainability, cost, etc.).
4. Assign weights to each driver using pairwise comparison or stakeholder voting (weights must sum to 1.0).

### Step 2 — Score the Options
1. List all candidate options (minimum 3, including status quo).
2. Define a scoring scale (1-5 or 1-10) with explicit rubric for each level.
3. Score each option against each driver independently.
4. Calculate weighted scores: `total = SUM(weight_i * score_i)`.
5. Present results in a decision matrix table.

### Step 3 — Sensitivity & Risk Analysis
1. Identify the top 2 drivers with highest weight — test what happens if weights shift by +/-15%.
2. Flag any option where a single driver change flips the ranking ("knife-edge" decisions).
3. List irreversibility factors: which options are hard to undo?
4. Map risks per option using likelihood/impact categorization.

### Step 4 — Synthesize Recommendation
1. State the recommended option with the rationale rooted in weighted scores.
2. Document the conditions under which the second-place option would become preferable.
3. List mitigation actions for the negative trade-offs of the chosen option.
4. Produce a one-page summary suitable for executive stakeholders.

## Quality Criteria
- Weights are explicitly justified and sum to 1.0.
- Scoring rubric is defined before scores are assigned (prevents anchoring bias).
- Sensitivity analysis covers at least the top 2 weighted drivers.
- Recommendation includes explicit conditions for revisiting the decision.

## Anti-Patterns
- Using equal weights for all criteria ("false democracy" — hides real priorities).
- Scoring options after the decision is already made (confirmation bias theater).
- Omitting the status-quo option, which inflates the appeal of change.
- Presenting a single number without the breakdown (obscures which drivers dominate).
