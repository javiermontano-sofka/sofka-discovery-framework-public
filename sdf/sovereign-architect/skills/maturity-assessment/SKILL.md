---
name: maturity-assessment
author: "Javier Montaño (JM Labs)"
description: >
  Capability maturity evaluation using CMMI, DORA, and custom models for software engineering practices. Use when user asks to "assess maturity".
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - Agent
---

# Maturity Assessment

Capability maturity evaluation using CMMI, DORA, and custom models for software engineering practices.

## Guiding Principle

> *"You cannot improve what you cannot measure — maturity models make the invisible visible"*

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

- Applying maturity models without context (team size, domain)
- Treating maturity levels as goals instead of descriptors
- Measuring only process maturity while ignoring outcome metrics
