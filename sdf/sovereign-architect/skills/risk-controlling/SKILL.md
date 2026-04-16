---
name: risk-controlling
author: JM Labs (Javier Montaño)
description: >
  Identifies, assesses, and manages technical and project risks with mitigation strategies,
  monitoring plans, and contingency protocols. Trigger: "risk analysis", "risk register", "mitigation plan".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Risk Controlling

Systematically identifies, quantifies, and manages risks across technical, organizational,
and commercial dimensions, producing actionable risk registers with mitigation strategies
and monitoring triggers.

## Guiding Principle

> *"Risk management is not about eliminating uncertainty. It is about making informed bets with explicit contingency plans."*

## Procedure

### Step 1 — Risk Identification

1. Conduct a structured risk sweep across technical, organizational, commercial, and external dimensions.
2. Analyze dependencies, assumptions, and constraints for hidden risks.
3. Review historical lessons learned from similar initiatives.
4. Catalog risks with unique identifiers and clear descriptions.

### Step 2 — Risk Assessment

1. Score each risk on probability (1-5) and impact (1-5).
2. Calculate risk exposure (probability x impact) and plot on a heat map.
3. Classify risks as accept, mitigate, transfer, or avoid.
4. Identify risk clusters and cascading failure scenarios.

### Step 3 — Mitigation Planning

1. Design mitigation strategies for all risks above the acceptance threshold.
2. Assign risk owners with clear accountability.
3. Define early warning indicators and monitoring frequency.
4. Create contingency plans for risks that cannot be fully mitigated.

### Step 4 — Monitoring and Control

1. Establish the risk review cadence and reporting format.
2. Define trigger conditions that activate contingency plans.
3. Track risk status changes and mitigation effectiveness.
4. Update the risk register as new information emerges.

## Quality Criteria

- Risk register covers all four dimensions (technical, organizational, commercial, external).
- Every risk above the acceptance threshold has a mitigation strategy and owner.
- Early warning indicators are specific and measurable.
- Contingency plans include activation triggers and resource requirements.

## Anti-Patterns

- Identifying risks without assigning owners or mitigation strategies.
- Treating the risk register as a one-time artifact instead of a living document.
- Focusing only on technical risks and ignoring organizational or commercial risks.
- Scoring all risks as medium to avoid difficult conversations.
