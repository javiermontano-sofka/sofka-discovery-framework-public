---
name: software-viability
author: "Javier Montaño (JM Labs)"
description: >
  Software and technology viability validation — deep forensic analysis of maintainability, scalability, security posture. Use when user asks to "validate software viability".
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - Agent
---

# Software Viability

Software and technology viability validation — deep forensic analysis of maintainability, scalability, security posture.

## Guiding Principle

> *"The question is not whether the software works today, but whether it will work tomorrow"*

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

- Confusing working software with viable software
- Not assessing bus factor and knowledge distribution
- Ignoring technical debt accumulation rate
