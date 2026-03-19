---
name: input-analysis
author: JM Labs (Javier Montaño)
description: >
  Pre-processes raw inputs through error detection, intent amplification, and
  structured interpretation layers. Trigger: "analyze this input", "interpret requirements", "clarify intent".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Input Analysis

Applies a structured pre-processing layer to raw inputs (documents, requirements, briefs)
that detects errors, amplifies intent, resolves ambiguity, and produces enriched, actionable
interpretations for downstream analysis.

## Guiding Principle

> *"Garbage in, garbage out. The quality of every analysis is bounded by the quality of its input interpretation."*

## Procedure

### Step 1 — Raw Input Inventory

1. Catalog all input artifacts: documents, emails, transcripts, code, diagrams.
2. Classify each input by type, source, and reliability level.
3. Identify the stated objective and the implicit context.
4. Flag missing inputs that would typically be expected for this type of analysis.

### Step 2 — Error Detection

1. Scan for internal contradictions within and across inputs.
2. Identify ambiguous terms that could be interpreted multiple ways.
3. Detect unstated assumptions that the input relies upon.
4. Flag data quality issues: outdated information, missing references, broken links.

### Step 3 — Intent Amplification

1. Reinterpret the stated request through three lenses: literal, contextual, strategic.
2. Identify what the requestor likely needs but did not explicitly ask for.
3. Surface adjacent concerns that the analysis should address.
4. Formulate clarifying questions for critical ambiguities.

### Step 4 — Enriched Output

1. Produce a structured interpretation document with explicit assumptions.
2. Include a confidence score for each interpreted requirement.
3. Map each interpreted requirement back to its source input.
4. Generate a list of clarifying questions ordered by impact on downstream analysis.

## Quality Criteria

- Every ambiguity is identified with proposed interpretations and confidence scores.
- Contradictions between inputs are explicitly documented with resolution proposals.
- Intent amplification produces at least one non-obvious insight per input set.
- Clarifying questions are prioritized by their impact on downstream deliverables.

## Anti-Patterns

- Accepting inputs at face value without checking for contradictions or ambiguity.
- Amplifying intent beyond what the evidence supports (over-interpretation).
- Producing clarifying questions that could be answered by reading the inputs more carefully.
- Treating all inputs as equally reliable regardless of source and currency.
