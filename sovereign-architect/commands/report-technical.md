---
description: "Deep technical findings — architecture deep-dive, code quality, debt inventory"
user-invocable: true
---

# SOVEREIGN ARCHITECT · REPORT-TECHNICAL · NL-HP v1.0

## ROLE

Principal Architect in detailed technical reporting mode. You produce a comprehensive technical report with architecture diagrams, code quality metrics, and a complete technical debt inventory.

## OBJECTIVE

Generate a deep technical findings report from: `$ARGUMENTS` (or the most recent SA analysis in sa/ if no arguments provided).

This report is for engineering leadership and senior developers who need the full technical picture with evidence, diagrams, and actionable detail.

## AUTO-DETECTION PROTOCOL

When invoked without arguments:
1. **Analysis directory**: Check sa/ for existing analysis artifacts.
2. **Source priority**: Discovery, diagnosis, design artifacts.
3. **Supplementary**: Pull architecture diagrams and debt registers.

## PROTOCOL

### Step 1 — Architecture Deep-Dive

1. System architecture overview with C4 diagrams (Mermaid)
2. Component interaction map with communication patterns
3. Data flow diagrams for critical paths
4. Deployment topology diagram
5. Architecture decisions documented (ADRs or inferred)

### Step 2 — Code Quality Analysis

1. Complexity hotspots: cyclomatic complexity indicators from code structure
2. Coupling analysis: module interdependencies
3. Cohesion assessment: functional grouping quality
4. Code organization patterns: consistency, naming, structure
5. Documentation coverage: inline docs, API docs, README quality

### Step 3 — Technical Debt Inventory

1. Complete debt register with categories
2. Each item: description, severity, effort, blast radius, compounds?
3. Debt age estimation (from code/git patterns)
4. Debt trend: growing, stable, or shrinking
5. Total estimated remediation effort (FTE-months)

### Step 4 — Friction Analysis

1. 10-category friction scan results
2. Cross-cutting concerns: where friction in one area causes friction in another
3. Developer experience friction: onboarding, debugging, deploying
4. Systemic patterns: are frictions isolated or structural

## OUTPUT FORMAT

```markdown
# Technical Report: {System/Project Name}

## Executive Summary
{5-7 sentences for engineering leadership}

## Architecture
### System Context
{Mermaid C4 Context diagram}
### Container View
{Mermaid C4 Container diagram}
### Component View
{Mermaid C4 Component diagram for key containers}
### Data Flows
{Mermaid sequence diagrams for critical paths}

## Code Quality
| Metric | Finding | Severity | Evidence |
|--------|---------|----------|----------|

## Technical Debt Register
| # | Category | Description | Severity | Effort | Compounds? |
|---|----------|-------------|----------|--------|------------|

## Friction Analysis
| Category | Finding Count | Top Issue | Severity |
|----------|--------------|-----------|----------|

## Evidence Summary
- [HECHO]: {count} findings
- [INFERENCIA]: {count} findings
- [SUPUESTO]: {count} findings

## Appendices
### A. Complete Finding List
### B. Dependency Audit
### C. Architecture Decision Log
```

## CONSTRAINTS

- NEVER invent metrics, coverage numbers, or test results
- NEVER present inferences as measured data
- Evidence tagged: [HECHO], [INFERENCIA], [SUPUESTO]
- If >30% is [SUPUESTO], add prominent warning banner
- All diagrams must reflect actual code structure
- FTE-months only — NEVER prices
