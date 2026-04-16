---
name: output-engineering
author: JM Labs (Javier Montaño)
description: >
  Engineers quality formatting with ghost menus, progressive disclosure, and excellence standards for technical artifacts.
  Trigger: "format output", "ghost menu", "progressive disclosure", "output quality", "excellence standards".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Output Engineering

Transforms raw technical content into polished, navigable artifacts using progressive disclosure, ghost menus, structured layouts, and consistent formatting standards.

## Guiding Principle

> *"The value of a deliverable is the product of its content quality and its presentation quality. Either at zero makes the whole zero."*

## Procedure

### Step 1 — Assess the Artifact Type
1. Classify the deliverable: analysis, proposal, runbook, design document, report, presentation.
2. Identify the primary audience: executive (TL;DR first), technical (detail first), mixed (layered).
3. Determine the consumption context: reading in IDE, browser, PDF, presentation, chat.
4. Select the appropriate template from the output standards catalog.
5. Identify required sections based on artifact type and audience.

### Step 2 — Apply Progressive Disclosure
1. **Layer 0 — TL;DR**: One paragraph executive summary with the key conclusion or recommendation.
2. **Layer 1 — Key Findings**: Bulleted list of 5-8 major points with evidence tags.
3. **Layer 2 — Detailed Analysis**: Full narrative with tables, diagrams, and supporting data.
4. **Layer 3 — Appendices**: Raw data, extended tables, methodology notes, glossary.
5. Each layer is self-contained — a reader can stop at any layer and have a complete understanding at that depth.

### Step 3 — Add Navigation and Structure
1. **Ghost Menu**: Hidden-but-accessible command menu suggesting next actions (what to do with this artifact).
2. **Table of Contents**: For documents longer than 3 screens.
3. **Cross-References**: Link to related artifacts, source documents, and prerequisite reading.
4. **Evidence Summary**: Distribution of [HECHO]/[INFERENCIA]/[SUPUESTO] at the top.
5. **Metadata Block**: Author, date, version, status, audience, dependencies.

### Step 4 — Polish and Validate
1. Verify consistent heading hierarchy (no skipped levels).
2. Ensure tables have headers, alignment, and readable column widths.
3. Validate all Mermaid diagrams render correctly.
4. Check that code blocks have language tags for syntax highlighting.
5. Review for tone consistency: professional, precise, free of filler words.

## Quality Criteria
- Every artifact has a TL;DR that stands alone as a summary.
- Ghost menu provides 3-5 actionable next steps.
- Progressive disclosure allows readers to choose their depth.
- Formatting is consistent with the output standards catalog.

## Anti-Patterns
- Wall of text with no headings, bullets, or visual structure.
- Executive summaries that are longer than the analysis.
- Ghost menus that suggest irrelevant or unavailable commands.
- Inconsistent formatting across artifacts in the same deliverable set.
