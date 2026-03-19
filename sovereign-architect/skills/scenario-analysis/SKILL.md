---
name: scenario-analysis
author: JM Labs (Javier Montaño)
description: >
  Tree of Thought evaluation, multi-dimensional weighted scoring, trade-off analysis,
  and decision matrix generation for technical decisions. Trigger: "scenario analysis",
  "trade-off", "decision matrix", "weighted scoring", "tree of thought", "compare options".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Scenario Analysis

Evaluate technical decisions using structured analysis: Tree of Thought branching, multi-dimensional weighted scoring, trade-off matrices, and evidence-based decision frameworks.

## Guiding Principle
> *"Every architectural decision is a trade-off — make trade-offs explicit, weight criteria by stakeholder priorities, and document not just what you chose, but what you rejected and why."*

## Procedure

### Step 1 — Decision Framing
1. Define the decision to be made with clear scope boundaries
2. Identify decision criteria: technical (performance, scalability, security), business (cost, time, risk), team (skills, hiring, maintainability)
3. Weight criteria by stakeholder priority (distribute 100 points across criteria)
4. Identify constraints: non-negotiable requirements that eliminate options
5. Define evaluation method: scoring scale (1-5), evidence types, confidence levels

### Step 2 — Option Generation (Tree of Thought)
1. Generate primary options (3-5 distinct approaches)
2. For each option, explore sub-branches: implementation variants, phasing strategies
3. Identify hybrid options that combine strengths of multiple approaches
4. Apply constraint filtering: eliminate options that violate non-negotiable requirements
5. Shortlist viable options (3-4) for detailed evaluation

### Step 3 — Multi-Dimensional Scoring
1. Score each option against each weighted criterion (1-5 scale)
2. Tag evidence type per score: `[CODE]`, `[DOC]`, `[BENCHMARK]`, `[INFERENCE]`, `[ASSUMPTION]`
3. Calculate weighted scores and rank options
4. Perform sensitivity analysis: which weight changes would flip the ranking
5. Identify the decision boundary: how close are the top options

### Step 4 — Decision & Documentation
1. Recommend the top option with explicit rationale
2. Document trade-offs accepted with the recommended option
3. Identify risks and mitigation strategies for the chosen path
4. Define reversibility: how easy is it to change this decision later
5. Produce an ADR capturing context, decision, alternatives, and consequences

## Quality Criteria
- Decision criteria weighted by stakeholder input, not analyst preference
- Every score backed by evidence tag (never unsubstantiated)
- Sensitivity analysis shows the decision is robust under reasonable weight changes
- Rejected alternatives documented with clear rejection rationale

## Anti-Patterns
- Analysis paralysis: comparing 10+ options without constraint filtering
- Scoring all criteria equally instead of weighting by priority
- Confirmation bias: scoring the preferred option favorably without evidence
- Making irreversible decisions without considering reversibility cost
