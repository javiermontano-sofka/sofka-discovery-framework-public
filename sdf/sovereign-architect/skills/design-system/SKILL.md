---
name: design-system
author: JM Labs (Javier Montaño)
description: >
  Defines design tokens, component libraries, and page structures for consistent
  technical deliverables. Trigger: "design system", "design tokens", "component library", "page structure".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Design System

Establishes and maintains design token systems, component libraries, and page
structure patterns that ensure visual and structural consistency across all
technical deliverables and documentation.

## Guiding Principle

> *"Consistency is not aesthetic preference. It is cognitive efficiency. When patterns are predictable, readers think about content, not format."*

## Procedure

### Step 1 — Token Definition

1. Define the color palette with semantic names (primary, secondary, accent, danger, success).
2. Establish typography scale: font families, sizes, weights, and line heights.
3. Set spacing tokens: margins, padding, and gap values on a consistent scale.
4. Define component-level tokens: border radius, shadow, transition timing.

### Step 2 — Component Library

1. Design atomic components: buttons, badges, cards, tables, code blocks.
2. Define component variants: primary, secondary, outline, ghost.
3. Establish component composition rules: how atoms combine into molecules.
4. Document responsive behavior for each component.

### Step 3 — Page Structure Patterns

1. Define page templates for common deliverable types (assessment, roadmap, report).
2. Establish the information hierarchy pattern: TL;DR > Summary > Detail > Appendix.
3. Set navigation patterns: table of contents, cross-references, ghost menus.
4. Define how Mermaid diagrams, tables, and code blocks integrate into page flow.

### Step 4 — Governance and Evolution

1. Document the design system in a canonical reference file.
2. Define the process for proposing and approving token changes.
3. Establish automated validation for token usage in deliverables.
4. Plan for versioning and backward compatibility.

## Quality Criteria

- All visual properties use semantic tokens, not hardcoded values.
- Components are documented with usage guidelines and anti-patterns.
- Page templates cover the most common deliverable types.
- The design system is versioned with a changelog.

## Anti-Patterns

- Defining tokens without semantic meaning (color-blue-500 instead of color-primary).
- Creating components without documenting when and how to use them.
- Allowing one-off overrides that bypass the token system.
- Treating the design system as frozen instead of evolving with usage patterns.
