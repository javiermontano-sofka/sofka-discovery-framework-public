---
name: technical-feasibility
author: JM Labs (Javier Montaño)
description: >
  Fact-checking technical claims, multidimensional feasibility validation across
  performance, integration, scalability, security, and team capability. Trigger:
  "technical feasibility", "feasibility study", "fact check", "can we build", "is it possible".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Technical Feasibility

Validate the technical feasibility of proposed solutions through fact-checking, multidimensional analysis, proof-of-concept design, and risk assessment across performance, integration, scalability, security, and team capability.

## Guiding Principle
> *"Feasibility is not a binary yes/no — it is a spectrum of confidence with conditions. Every 'yes' should come with 'if' statements, and every 'no' should come with 'unless' alternatives."*

## Procedure

### Step 1 — Claim Decomposition
1. Extract all technical claims from the proposal (explicit and implicit)
2. Classify each claim: performance target, integration assumption, scalability goal, security requirement
3. Identify the evidence needed to validate each claim
4. Tag each claim by current evidence level: `[VERIFIED]`, `[PLAUSIBLE]`, `[UNVERIFIED]`, `[QUESTIONABLE]`
5. Prioritize claims by risk: which unverified claims would be most damaging if false

### Step 2 — Multidimensional Feasibility Analysis
1. **Performance**: Can the system meet throughput, latency, and concurrency requirements?
2. **Integration**: Are the APIs, protocols, and data formats compatible? Are they documented and stable?
3. **Scalability**: Can the architecture scale to projected growth (2x, 5x, 10x)?
4. **Security**: Can security and compliance requirements be met with the proposed approach?
5. **Team**: Does the team have the skills, or can they acquire them in the project timeline?
6. Score each dimension: Feasible, Feasible with Conditions, Risky, Not Feasible

### Step 3 — Fact-Checking & Validation
1. Verify performance claims against published benchmarks and documentation
2. Test integration assumptions against actual API documentation and sandbox environments
3. Validate scalability claims with back-of-envelope calculations
4. Check security claims against compliance framework requirements
5. Produce an evidence matrix linking each claim to its verification source

### Step 4 — Risk Assessment & Recommendations
1. Identify feasibility risks: what could invalidate the "yes" assessment
2. Design proof-of-concept (PoC) scope to de-risk critical unknowns
3. Define go/no-go criteria for the PoC
4. Recommend architectural spikes for areas of highest technical uncertainty
5. Produce a feasibility report with conditional approval and risk register

## Quality Criteria
- Every claim has an evidence tag and verification source
- Feasibility scored across all 5 dimensions, not just technical
- Back-of-envelope calculations support scalability and performance claims
- PoC scope targets the highest-risk unknowns, not the easiest to validate

## Anti-Patterns
- Declaring "feasible" based on vendor marketing rather than independent validation
- Checking technical feasibility without considering team capability
- Single-dimension analysis (only performance, ignoring integration complexity)
- PoC that validates known capabilities instead of de-risking unknowns
