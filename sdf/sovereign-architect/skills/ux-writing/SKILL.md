---
name: ux-writing
author: JM Labs (Javier Montaño)
description: >
  Optimizes document accessibility, readability, and information hierarchy for
  technical audiences. Trigger: "improve readability", "document UX", "information design".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# UX Writing

Applies information design principles to technical documents, optimizing accessibility,
readability, and navigability so that complex content serves readers efficiently
regardless of their reading strategy.

## Guiding Principle

> *"A document that cannot be scanned cannot be used. Design for the reader who has five minutes, then reward the reader who has fifty."*

## Procedure

### Step 1 — Readability Audit

1. Assess the current document against readability heuristics (sentence length, jargon density, passive voice ratio).
2. Identify sections where information density exceeds cognitive load thresholds.
3. Map the document's navigation paths: can readers find what they need without reading sequentially?
4. Check accessibility: heading hierarchy, alt text, contrast, link text quality.

### Step 2 — Information Hierarchy Restructuring

1. Ensure heading levels reflect logical containment, not visual formatting.
2. Front-load key information in every section (inverted pyramid).
3. Extract repeated patterns into tables, lists, or templates.
4. Add navigation aids: table of contents, cross-references, anchor links.

### Step 3 — Language Optimization

1. Replace jargon with plain language where precision is not sacrificed.
2. Shorten sentences to target 15-20 words average.
3. Convert passive constructions to active voice.
4. Ensure consistent voice and tone throughout the document.

### Step 4 — Accessibility and Inclusivity

1. Verify heading hierarchy for screen reader navigation.
2. Ensure all visual elements have text alternatives.
3. Check color-dependent information for colorblind accessibility.
4. Test the document at different reading levels.

## Quality Criteria

- Average sentence length is under 20 words.
- Heading hierarchy is semantically correct (no skipped levels).
- Every section is scannable: key point visible within first two sentences.
- Document passes WCAG 2.1 AA readability guidelines.

## Anti-Patterns

- Using formatting (bold, color) as the only indicator of importance.
- Creating wall-of-text sections without visual breaks or summaries.
- Writing headings that require reading the section to understand.
- Optimizing for print when the document will be consumed digitally.
