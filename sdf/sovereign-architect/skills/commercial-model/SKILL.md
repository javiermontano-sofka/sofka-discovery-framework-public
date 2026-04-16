---
name: commercial-model
author: JM Labs (Javier Montaño)
description: >
  Analyzes build vs buy decisions, licensing models, TCO calculations, and value
  capture strategies. Trigger: "build or buy", "licensing analysis", "TCO", "commercial model".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Commercial Model

Structures the economic reasoning behind technology decisions, producing defensible
build-vs-buy analyses, total cost of ownership projections, and value capture frameworks.

## Guiding Principle

> *"The cheapest option is rarely the least expensive. Model the full lifecycle before you commit."*

## Procedure

### Step 1 — Option Identification

1. Enumerate all viable options: build in-house, buy COTS, adopt open-source, hybrid.
2. For each option, identify the vendor/project, licensing model, and support structure.
3. Document switching costs and lock-in factors for each option.
4. Classify options by strategic alignment (core vs context).

### Step 2 — TCO Modeling

1. Calculate direct costs: licenses, infrastructure, development effort (FTE-months).
2. Calculate indirect costs: training, integration, maintenance, opportunity cost.
3. Project costs over 3-year and 5-year horizons with growth assumptions.
4. Include hidden costs: compliance, migration, vendor management overhead.

### Step 3 — Value Analysis

1. Map each option to business outcomes it enables or accelerates.
2. Quantify value drivers: time-to-market, risk reduction, capability differentiation.
3. Calculate ROI and payback period for each option.
4. Assess strategic value beyond financial metrics (talent, ecosystem, flexibility).

### Step 4 — Recommendation Synthesis

1. Build a weighted decision matrix with financial and strategic criteria.
2. Perform sensitivity analysis on key assumptions.
3. Document the recommendation with explicit rationale and evidence tags.
4. Include a risk-adjusted implementation timeline for the recommended option.

## Quality Criteria

- TCO includes both direct and indirect costs over at least a 3-year horizon.
- Every cost estimate has an evidence tag and stated assumptions.
- Decision matrix uses weighted criteria agreed upon with stakeholders.
- Sensitivity analysis tests at least three key assumptions.

## Anti-Patterns

- Comparing build costs against buy sticker price without including integration and maintenance.
- Ignoring opportunity cost of engineering time spent on non-differentiating capabilities.
- Treating vendor claims as evidence without independent verification.
- Making build-vs-buy decisions based solely on financial metrics without strategic context.
