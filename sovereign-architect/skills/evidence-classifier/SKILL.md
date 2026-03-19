---
name: evidence-classifier
author: JM Labs (Javier Montaño)
description: >
  Tags every claim with [HECHO]/[INFERENCIA]/[SUPUESTO] evidence classification for zero-hallucination output.
  Trigger: "classify evidence", "tag claims", "evidence levels", "zero hallucination", "fact check output".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Evidence Classifier

Systematically tags every claim, recommendation, and assertion in a document with its evidence level — [HECHO], [INFERENCIA], or [SUPUESTO] — enabling readers to assess confidence and identify gaps requiring validation.

## Guiding Principle

> *"The most dangerous hallucination is the one presented with confidence. Label everything."*

## Procedure

### Step 1 — Extract Claims
1. Parse the document into discrete, atomic claims (one assertion per unit).
2. Identify implicit claims hidden in compound sentences.
3. Separate factual claims from recommendations and opinions.
4. Flag claims that combine multiple evidence levels (decompose them).
5. Catalog the sources referenced or implied by each claim.

### Step 2 — Classify Evidence Level
1. **[HECHO]**: Directly verified from code, configuration, documentation, or authoritative source. Cite the exact source.
2. **[INFERENCIA]**: Logically deduced from verified facts. State the reasoning chain.
3. **[SUPUESTO]**: Assumed without direct evidence. State the assumption and its risk if wrong.
4. For each claim, attempt to upgrade: can an [SUPUESTO] become [INFERENCIA] with available data? Can [INFERENCIA] become [HECHO] by checking the code?
5. When classification is ambiguous, default to the lower confidence level.

### Step 3 — Apply Quality Rules
1. If > 30% of claims are [SUPUESTO], add a mandatory warning banner at the top.
2. If a critical recommendation is based on [SUPUESTO], flag it for stakeholder validation.
3. Group [SUPUESTO] claims into a "Validation Required" section for easy review.
4. Ensure every [HECHO] has a citation (file path, URL, or document reference).
5. Ensure every [INFERENCIA] has its reasoning chain documented.

### Step 4 — Generate Evidence Summary
1. Produce an evidence distribution report: X% HECHO, Y% INFERENCIA, Z% SUPUESTO.
2. List all validation items (claims that need to be upgraded from SUPUESTO).
3. Identify the highest-risk assumptions and propose verification steps.
4. Rate the overall document confidence: HIGH (>70% HECHO), MEDIUM (50-70%), LOW (<50%).
5. Recommend actions to improve confidence before document approval.

## Quality Criteria
- Every claim in the document has exactly one evidence tag.
- [HECHO] claims include source citations.
- [INFERENCIA] claims include reasoning chains.
- [SUPUESTO] claims include risk-if-wrong assessment.

## Anti-Patterns
- Tagging entire paragraphs instead of individual claims.
- Using [HECHO] for claims that are actually inferences from incomplete data.
- Omitting evidence tags from negative claims ("this system does NOT support X").
- Treating absence of evidence as evidence of absence.
