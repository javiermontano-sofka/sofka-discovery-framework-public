---
name: risk-scorer
author: JM Labs (Javier Montaño)
description: >
  Severity times likelihood risk matrix generation with mitigation priorities.
  Trigger: "score risks", "risk matrix", "risk assessment", "severity analysis".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Risk Scorer

Systematically identify, score, and prioritize technical risks using a severity x likelihood matrix, producing actionable mitigation plans.

## Guiding Principle

> *"Risk management is not about eliminating risk — it's about making informed decisions about which risks to accept."*

## Procedure

### Step 1 — Risk Identification
1. Catalog technical risks from codebase analysis: security, reliability, scalability, maintainability.
2. Include operational risks: single points of failure, bus factor, vendor lock-in.
3. Identify data risks: data loss, corruption, privacy violations.
4. Document each risk with its source and potential impact `[HECHO]`.
5. Cross-reference with findings from other analysis skills.

### Step 2 — Severity Assessment
1. Rate impact on a 1-5 scale: Negligible, Minor, Moderate, Major, Critical.
2. Consider multiple impact dimensions: users affected, data at risk, revenue impact, reputation.
3. Assess cascading effects: does this risk trigger other failures?
4. Document severity rationale for each risk `[INFERENCIA]`.

### Step 3 — Likelihood Assessment
1. Rate probability on a 1-5 scale: Rare, Unlikely, Possible, Likely, Almost Certain.
2. Use evidence: has this happened before? Are there precursor signals?
3. Consider trend direction: is the likelihood increasing or decreasing?
4. Factor in existing mitigations that reduce likelihood.

### Step 4 — Risk Matrix & Prioritization
1. Calculate risk score: Severity x Likelihood (1-25).
2. Classify: Critical (20-25), High (15-19), Medium (8-14), Low (1-7).
3. Produce a visual risk matrix heatmap.
4. For each High/Critical risk, define mitigation actions with owners and timelines.
5. Identify risks that should be accepted vs. mitigated vs. transferred.

## Quality Criteria
- Every risk traced to specific codebase evidence `[HECHO]`
- Severity and likelihood ratings include explicit rationale
- Risk matrix includes all identified risks, not just top ones
- Mitigation plans are actionable with concrete next steps

## Anti-Patterns
- Rating all risks as "High" (loses prioritization value)
- Scoring based on gut feeling without evidence
- Ignoring low-likelihood, high-severity risks (black swans)
- Creating a risk register that is never reviewed or updated
