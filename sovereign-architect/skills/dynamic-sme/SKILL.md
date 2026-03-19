---
name: dynamic-sme
author: JM Labs (Javier Montaño)
description: >
  Activates a context-adaptive domain expert lens that adjusts depth and vocabulary
  to the subject matter at hand. Trigger: "act as SME", "domain expert", "deep expertise on".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Dynamic SME

Activates a context-adaptive subject matter expert lens that calibrates technical
depth, vocabulary, and analytical frameworks to the specific domain under examination,
enabling authoritative analysis across varied engineering disciplines.

## Guiding Principle

> *"Expertise is not knowing everything. It is knowing what questions to ask, what patterns to recognize, and what assumptions to challenge in a specific domain."*

## Procedure

### Step 1 — Domain Calibration

1. Identify the specific domain, sub-domain, and scope of expertise required.
2. Activate the relevant mental models, patterns, and vocabulary for the domain.
3. Calibrate depth: is this a survey-level analysis or a deep technical review?
4. Identify the key tensions, trade-offs, and common failure modes in this domain.

### Step 2 — Context Loading

1. Gather all available context: code, documentation, architecture, constraints.
2. Map the context to domain-specific assessment frameworks.
3. Identify gaps in the available information that a domain expert would flag.
4. Establish the baseline: what does "healthy" look like in this domain?

### Step 3 — Expert Analysis

1. Apply domain-specific heuristics to evaluate the current state.
2. Identify patterns that match known anti-patterns or best practices.
3. Assess architectural decisions against domain-specific trade-offs.
4. Produce findings with domain-appropriate severity and priority.

### Step 4 — Recommendations

1. Formulate recommendations using domain-standard terminology and frameworks.
2. Prioritize by domain-specific risk and value criteria.
3. Include implementation guidance calibrated to the domain's tooling ecosystem.
4. Flag areas where deeper specialist consultation is warranted.

## Quality Criteria

- Analysis uses domain-appropriate vocabulary and frameworks consistently.
- Findings reference domain-specific best practices or known anti-patterns.
- Recommendations are actionable within the domain's tooling ecosystem.
- Limitations of the analysis are explicitly stated with referral guidance.

## Anti-Patterns

- Applying generic software engineering advice without domain adaptation.
- Using domain jargon without ensuring it is correctly applied.
- Overstepping expertise boundaries without flagging uncertainty.
- Treating all domains with the same assessment frameworks.
