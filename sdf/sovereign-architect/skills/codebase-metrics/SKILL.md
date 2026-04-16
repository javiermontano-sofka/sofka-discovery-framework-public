---
name: codebase-metrics
author: JM Labs (Javier Montaño)
description: >
  Cyclomatic complexity, coupling, cohesion, and size metrics measurement.
  Trigger: "measure complexity", "code metrics", "coupling analysis", "cohesion".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Codebase Metrics

Measure structural quality through cyclomatic complexity, afferent/efferent coupling, cohesion indices, and size distribution to identify hotspots and health trends.

## Guiding Principle

> *"Measurement is the first step to improvement, but only if you measure what matters."*

## Procedure

### Step 1 — Size & Distribution Analysis
1. Count lines of code per language using structural analysis (exclude blanks, comments).
2. Compute file size distribution: median, P90, P99 to identify outliers.
3. Identify the largest files and modules — these are refactoring candidates.
4. Calculate code-to-test ratio per module.
5. Produce a heat map of file sizes by directory.

### Step 2 — Complexity Measurement
1. Compute cyclomatic complexity per function/method.
2. Flag functions exceeding complexity threshold (>10 moderate, >20 high, >50 critical).
3. Calculate cognitive complexity where tooling supports it.
4. Identify the top 20 most complex functions with file locations `[HECHO]`.
5. Correlate complexity with bug frequency if git history is available `[INFERENCIA]`.

### Step 3 — Coupling & Cohesion Analysis
1. Map import/dependency graphs between modules.
2. Calculate afferent coupling (Ca) — who depends on this module.
3. Calculate efferent coupling (Ce) — what this module depends on.
4. Compute instability index: I = Ce / (Ca + Ce).
5. Assess cohesion by analyzing whether module internals share data and responsibilities.

### Step 4 — Health Score Synthesis
1. Combine metrics into a normalized health score per module (0-100).
2. Weight factors: complexity (30%), coupling (25%), size (20%), test coverage (25%).
3. Rank modules from healthiest to most problematic.
4. Identify systemic patterns (e.g., all service layers have high coupling).

## Quality Criteria
- Metrics computed from actual code, not estimates `[HECHO]`
- Thresholds clearly stated and justified
- Outliers specifically identified with file paths
- Trends shown where historical data exists

## Anti-Patterns
- Averaging complexity across an entire codebase (hides hotspots)
- Treating all coupling as bad (some coupling is necessary and intentional)
- Measuring only lines of code as a quality proxy
- Ignoring test code in metrics (test quality matters too)
