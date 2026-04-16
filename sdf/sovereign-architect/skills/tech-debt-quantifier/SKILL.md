---
name: tech-debt-quantifier
author: JM Labs (Javier Montaño)
description: >
  Technical debt classification, interest estimation, and payoff prioritization.
  Trigger: "quantify tech debt", "debt inventory", "debt interest", "technical debt".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Tech Debt Quantifier

Identify, classify, and quantify technical debt across architecture, code, tests, documentation, and infrastructure, estimating the ongoing cost (interest) of carrying each debt item.

## Guiding Principle

> *"Technical debt is not inherently bad — uninventored debt is. You can't manage what you haven't measured."*

## Procedure

### Step 1 — Debt Discovery
1. Scan for explicit debt markers: `TODO`, `FIXME`, `HACK`, `WORKAROUND`, `TECH_DEBT` in source files.
2. Identify implicit debt: deprecated dependencies, legacy patterns, duplicated code.
3. Review git history for files with high churn + high complexity (debt hotspots).
4. Check for deferred migrations: old framework versions, pending schema changes.
5. Catalog each debt item with location, type, and origin context `[HECHO]`.

### Step 2 — Debt Classification
1. Classify by category: Architecture, Code, Test, Documentation, Infrastructure, Dependency.
2. Classify by intentionality: Deliberate (known shortcut) vs. Inadvertent (accumulated cruft).
3. Classify by risk: Reckless (no plan to pay back) vs. Prudent (calculated trade-off).
4. Tag each item with affected quality attribute: maintainability, performance, security, reliability.

### Step 3 — Interest Estimation
1. Estimate ongoing cost per debt item: developer time lost per week/month.
2. Assess blast radius: how many features or teams are affected by this debt.
3. Calculate compounding risk: debt that makes other debt worse.
4. Estimate payoff effort: developer-days to remediate each item `[INFERENCIA]`.
5. Compute interest rate: ongoing cost / payoff effort.

### Step 4 — Prioritized Debt Register
1. Rank debt items by interest rate (highest ongoing cost per remediation effort first).
2. Group into quick wins (<1 day), sprints (1-2 weeks), projects (>2 weeks).
3. Produce a debt register with owner assignment recommendations.
4. Calculate total estimated debt in developer-days.

## Quality Criteria
- Every debt item traced to specific code locations `[HECHO]`
- Classification uses consistent taxonomy
- Interest estimates include reasoning, not just numbers
- Prioritization considers both cost and risk

## Anti-Patterns
- Counting TODOs as the only source of tech debt (most debt is implicit)
- Treating all debt as equally urgent without prioritization
- Estimating payoff time without considering testing and migration effort
- Ignoring infrastructure and documentation debt (it compounds silently)
