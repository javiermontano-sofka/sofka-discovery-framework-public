---
name: compliance-assessment
author: "Javier Montaño (JM Labs)"
description: >
  Regulatory and standards compliance assessment — GDPR, SOX, PCI-DSS, HIPAA, ISO 27001 patterns in code. Use when user asks to "assess compliance".
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - Agent
---

# Compliance Assessment

Regulatory and standards compliance assessment — GDPR, SOX, PCI-DSS, HIPAA, ISO 27001 patterns in code.

## Guiding Principle

> *"Compliance is not a checkbox — it is a continuous property of the system"*

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

- Treating compliance as a one-time audit instead of continuous monitoring
- Not mapping regulatory requirements to specific code patterns
- Ignoring data residency requirements in cloud deployments
