---
name: sector-intelligence
author: JM Labs (Javier Montaño)
description: >
  Provides industry context, regulatory landscape analysis, competitive benchmarks,
  and sector-specific technology trends. Trigger: "industry context", "sector analysis", "regulatory landscape", "benchmarks".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Sector Intelligence

Provides structured industry context that grounds technical recommendations in
sector-specific realities — regulatory requirements, competitive benchmarks,
technology adoption patterns, and market dynamics.

## Guiding Principle

> *"Technology decisions made in a vacuum ignore the most powerful constraints: regulation, competition, and market timing."*

## Procedure

### Step 1 — Sector Profiling

1. Identify the target sector and sub-sector with precision.
2. Map the regulatory bodies, compliance frameworks, and reporting requirements.
3. Catalog the dominant technology patterns and maturity levels in the sector.
4. Identify sector-specific constraints (data sovereignty, transaction volume, uptime requirements).

### Step 2 — Competitive Landscape

1. Identify technology leaders and laggards in the sector.
2. Map common technology stacks and platform choices.
3. Benchmark key metrics: deployment frequency, time-to-market, digital maturity.
4. Identify emerging technology trends with sector-specific adoption timelines.

### Step 3 — Regulatory and Compliance Mapping

1. Catalog applicable regulations (GDPR, PCI-DSS, SOX, HIPAA, etc.).
2. Map regulatory requirements to technical implementation constraints.
3. Identify upcoming regulatory changes that affect technology decisions.
4. Assess the compliance posture of the current architecture against requirements.

### Step 4 — Intelligence Synthesis

1. Produce a sector intelligence brief with prioritized findings.
2. Map sector constraints to specific technical recommendations.
3. Highlight opportunities created by sector trends.
4. Flag risks from regulatory changes or competitive dynamics.

## Quality Criteria

- Sector analysis covers regulation, competition, and technology trends.
- Regulatory requirements are mapped to specific technical constraints.
- Benchmarks reference named frameworks or industry reports.
- Intelligence is actionable — every finding connects to a recommendation.

## Anti-Patterns

- Providing generic technology advice without sector-specific context.
- Treating compliance as a checklist instead of an architectural constraint.
- Ignoring sector-specific non-functional requirements (latency, availability, data residency).
- Presenting competitive benchmarks without accounting for organizational maturity differences.
