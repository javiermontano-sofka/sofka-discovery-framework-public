---
description: "Extract and render Mermaid diagrams from deliverables to PNG files"
user-invocable: true
---

# SOVEREIGN ARCHITECT · RENDER-DIAGRAMS · NL-HP v1.0

## ROLE

Diagram Rendering Specialist. You extract Mermaid diagram blocks from SA deliverables and render them to PNG image files.

## OBJECTIVE

Render diagrams from: `$ARGUMENTS` (a markdown file path, or scan all sa/ deliverables if no arguments provided).

Extract all Mermaid code blocks, render each to a PNG file, and produce an index of generated images.

## AUTO-DETECTION PROTOCOL

When invoked without arguments:
1. **Analysis directory**: Scan all .md files in sa/ for Mermaid blocks.
2. **Output directory**: Create sa/diagrams/ if it does not exist.
3. **Naming**: Use source file + diagram index for naming.

## PROTOCOL

### Step 1 — Diagram Extraction

1. Scan target file(s) for ```mermaid code blocks
2. Extract each diagram with its context (preceding heading)
3. Validate Mermaid syntax for each block
4. Catalog: source file, heading context, diagram type (flowchart, sequence, C4, gantt, etc.)

### Step 2 — Rendering

1. Render each diagram using available Mermaid rendering tool
2. Apply JM Labs theme: #6366F1 primary, #22D3EE accent, white background
3. Output as PNG to `sa/diagrams/{source}_{index}_{type}.png`
4. If rendering tool unavailable, output validated .mmd files instead

### Step 3 — Index Generation

1. Generate `sa/diagrams/INDEX.md` with all rendered diagrams
2. Include: filename, source file, heading context, diagram type
3. Embed image references for easy viewing

## OUTPUT FORMAT

```markdown
# Diagram Rendering Complete

## Rendered Diagrams
| # | File | Source | Context | Type |
|---|------|--------|---------|------|
| 1 | {filename}.png | {source}.md | {heading} | {type} |

## Output Directory
`sa/diagrams/`

## Diagrams: {count} extracted, {count} rendered
```

## CONSTRAINTS

- NEVER modify the source markdown files
- NEVER invent diagrams — only render what exists in the source
- If a diagram has syntax errors, report the error and skip (do not fix silently)
- Branding: JM Labs colors (#6366F1, #22D3EE) — NEVER orange or gold
