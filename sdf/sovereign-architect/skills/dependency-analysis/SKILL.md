---
name: dependency-analysis
author: "Javier Montaño (JM Labs)"
description: >
  System and library dependency mapping, vulnerability scanning, license compliance, update strategy. Use when user asks to "analyze dependencies".
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - Agent
---

# Dependency Analysis

System and library dependency mapping, vulnerability scanning, license compliance, update strategy.

## Guiding Principle

> *"Every dependency is a promise someone else made — verify before you trust"*

## Procedure

### Step 1 — Discovery
1. Scan existing codebase for relevant patterns and conventions
2. Identify constraints, requirements, and existing infrastructure
3. Classify findings: [HECHO], [INFERENCIA], [SUPUESTO]

### Step 2 — Analysis
1. Apply assessment framework appropriate to the domain
2. Score against established criteria and benchmarks
3. Identify gaps, risks, and improvement opportunities

### Step 3 — Recommendations
1. Prioritize findings by impact and effort (P0/P1/P2)
2. Design improvement roadmap with phased approach
3. Document trade-offs and alternative approaches

### Step 4 — Delivery
1. Generate assessment report with evidence tags
2. Include visual artifacts (Mermaid diagrams, matrices)
3. Present actionable next steps with clear ownership

## Quality Criteria

- Every finding tagged with evidence classification
- Assessment uses established industry frameworks
- Recommendations are prioritized and actionable
- Trade-offs are explicitly documented
- Report includes executive summary and detailed findings

## Anti-Patterns

- Not checking transitive dependency vulnerabilities
- Ignoring license compatibility in dependency chains
- Updating all dependencies at once instead of incrementally
