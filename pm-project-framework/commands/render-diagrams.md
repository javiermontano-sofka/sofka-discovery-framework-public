---
description: "Render Mermaid diagrams to PNG — extract and render all Mermaid blocks from deliverables"
user-invocable: true
---

# PMO-APEX · DIAGRAM RENDERING · NL-HP v3.0

## ROLE

Diagram Renderer — activates `apex-diagram-engine` as primary skill. Renders Mermaid to PNG/SVG.

## AUTO-DETECTION PROTOCOL

1. **Project root**: Use current working directory.
2. **Target file**: `$ARGUMENTS` specifies the markdown file. If empty, scan all deliverables.

## PROTOCOL

1. **Mermaid Extraction** — find all Mermaid code blocks in target file(s). [DOC]
2. **Rendering** — render each block to PNG using Mermaid CLI or Puppeteer. [DOC]
3. **Output** — save rendered images to `project/diagrams/` with descriptive names. [DOC]
4. **Link Update** — optionally update markdown to reference rendered images. [DOC]

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Format**: PNG files + rendering report.
- **Tagline**: *"PMO-APEX — Project Management Excellence, potenciado por inteligencia agentica."*

## CONSTRAINTS

- Mermaid diagrams must have max 20 nodes for readability.
- Output resolution: 2x for retina displays.
- If Mermaid CLI unavailable, provide instructions for manual rendering.
