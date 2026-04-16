---
name: technical-writing
author: JM Labs (Javier Montaño)
description: >
  Applies progressive disclosure, precise terminology, and evidence attribution
  to technical documents. Trigger: "write the document", "technical documentation", "progressive disclosure".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Technical Writing

Produces technical documents that apply progressive disclosure, precise terminology,
and rigorous evidence attribution to make complex engineering content accessible,
navigable, and trustworthy.

## Guiding Principle

> *"Technical writing is not about demonstrating expertise. It is about transferring understanding efficiently."*

## Procedure

### Step 1 — Audience and Purpose Analysis

1. Define the primary and secondary audiences with their technical depth.
2. Establish the document's purpose: inform, persuade, instruct, or reference.
3. Determine the reading context: deep study, quick reference, or executive scan.
4. Select the appropriate document structure and depth level.

### Step 2 — Content Architecture

1. Design the information hierarchy using progressive disclosure (TL;DR first).
2. Structure sections to support both linear reading and random access.
3. Define the terminology glossary for domain-specific or ambiguous terms.
4. Plan visual elements: diagrams, tables, and code samples with placement rationale.

### Step 3 — Drafting with Evidence

1. Write each section following the claim-evidence-implication pattern.
2. Tag every assertion with its evidence type: [CODE], [CONFIG], [DOC], [INFERENCE], [ASSUMPTION].
3. Use precise language: avoid hedging words unless uncertainty is genuine.
4. Include cross-references to related sections and external sources.

### Step 4 — Quality Review

1. Verify terminology consistency throughout the document.
2. Check that progressive disclosure works: each level is self-contained.
3. Validate all evidence tags and cross-references.
4. Test readability against the target audience profile.

## Quality Criteria

- Document opens with a self-contained TL;DR that serves executives and scanners.
- Every technical assertion has an evidence tag.
- Terminology is consistent and defined at first use.
- Progressive disclosure enables reading at three depth levels.

## Anti-Patterns

- Writing for peers instead of the defined audience.
- Front-loading methodology descriptions before delivering findings.
- Using evidence tags inconsistently or omitting them for inferred conclusions.
- Creating documents that require sequential reading with no random access support.
