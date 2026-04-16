---
name: maintainability-scorer
author: JM Labs (Javier Montaño)
description: >
  Code quality index, change risk assessment, and maintainability scoring.
  Trigger: "score maintainability", "code quality index", "change risk", "maintainability".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Maintainability Scorer

Produce a composite maintainability score by analyzing code quality, change risk, modularity, and documentation coverage to predict the cost of future changes.

## Guiding Principle

> *"Maintainability is not about today's code — it's about tomorrow's developer understanding it."*

## Procedure

### Step 1 — Code Quality Index
1. Measure cyclomatic and cognitive complexity per module.
2. Detect code duplication percentage across the codebase.
3. Assess naming quality: are names descriptive and consistent?
4. Check for dead code: unused exports, unreachable branches, commented-out code.
5. Score readability: function length, nesting depth, parameter count `[HECHO]`.

### Step 2 — Change Risk Assessment
1. Identify high-churn files from git history (files changed most frequently).
2. Cross-reference churn with complexity (high churn + high complexity = high risk).
3. Map coupling: which files always change together (logical coupling)?
4. Assess test coverage on high-churn areas.
5. Calculate change failure rate per module if CI history is available `[INFERENCIA]`.

### Step 3 — Modularity Analysis
1. Evaluate module boundaries: are they clean or leaky?
2. Check for information hiding: are internals exposed through public APIs?
3. Assess dependency direction: do dependencies point inward (good) or outward (bad)?
4. Measure module cohesion: do module contents belong together?
5. Identify God modules that do too many things.

### Step 4 — Maintainability Report
1. Compute per-module maintainability score (0-100) using weighted formula.
2. Weights: complexity (25%), duplication (15%), test coverage (20%), modularity (20%), documentation (10%), naming (10%).
3. Rank modules from most to least maintainable.
4. Identify the 3 highest-risk modules for future changes.

## Quality Criteria
- Scores based on measurable metrics, not subjective opinion `[HECHO]`
- Weights explicitly stated and justified
- High-risk modules identified with specific evidence
- Change risk correlated with actual git history

## Anti-Patterns
- Scoring based solely on line count or cyclomatic complexity
- Ignoring test coverage in maintainability assessment
- Treating all modules equally regardless of change frequency
- Using a single global score instead of per-module granularity
