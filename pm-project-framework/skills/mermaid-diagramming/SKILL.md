---
name: apex-mermaid-diagramming
description: >
  Use when the user asks to "create a diagram", "draw a Gantt chart",
  "build a flowchart", "visualize a timeline", "generate project visualization",
  or mentions Mermaid diagrams, flowcharts, sequence diagrams, Gantt charts,
  timeline diagrams. Triggers on: produces Mermaid-syntax project diagrams,
  creates Gantt charts from schedule data, builds process flowcharts, generates
  stakeholder maps, visualizes dependency networks.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Mermaid Diagramming for PM

**TL;DR**: Produces PM-focused Mermaid diagrams including Gantt charts, flowcharts, sequence diagrams, timelines, quadrant charts, pie charts, and class diagrams adapted for project management contexts (WBS, process flows, stakeholder maps, dependency networks).

## Principio Rector
Un diagrama reemplaza mil palabras de explicación — pero solo si es el diagrama correcto. Cada tipo de diagrama comunica una dimensión diferente: Gantt para tiempo, flowchart para proceso, sequence para interacciones, quadrant para clasificación. Elegir el tipo correcto es tan importante como crear el diagrama.

## Assumptions & Limits
- Assumes Mermaid rendering is available in the target platform (GitHub, VS Code, browser) [SUPUESTO]
- Assumes data to visualize is structured or can be structured from source documents [SUPUESTO]
- Breaks if diagram exceeds 50 nodes — readability degrades; split into sub-diagrams [PLAN]
- Scope limited to Mermaid syntax; custom visualizations requiring D3.js or similar are out of scope [PLAN]
- Does not generate data — visualizes data provided by other skills [PLAN]

## Usage
```bash
/pm:mermaid-diagramming $SOURCE_FILE --type=gantt
/pm:mermaid-diagramming $SOURCE_FILE --type=flowchart --style=apex
/pm:mermaid-diagramming $SOURCE_FILE --type=sequence --actors=5
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$SOURCE_FILE` | Yes | Path to data source file |
| `--type` | No | `gantt` / `flowchart` / `sequence` / `timeline` / `quadrant` / `pie` |
| `--style` | No | `apex` / `minimal` (default: `apex`) |
| `--actors` | No | Number of actors for sequence diagrams |

## Service Type Routing
`{TIPO_PROYECTO}`: All project types use Mermaid diagrams. Agile uses burndown and velocity charts; Waterfall uses Gantt and network diagrams; SAFe uses PI roadmaps; Portfolio uses heatmaps.

## Before Creating Diagrams
1. Read source data — verify data completeness before visualization [PLAN]
2. Select diagram type — match communication need to Mermaid diagram type [PLAN]
3. Read `references/ontology/canonical-tokens.md` — apply APEX color theming [PLAN]
4. Check audience — technical audiences tolerate complexity; executives need simplicity [STAKEHOLDER]

## Entrada (Input Requirements)
- Data to visualize (schedule, process, relationships)
- Diagram type requirement
- Audience and purpose
- APEX color tokens for styling

## Proceso (Protocol)
1. **Data analysis** — Understand what needs to be communicated
2. **Diagram type selection** — Choose optimal Mermaid diagram type
3. **Data structuring** — Organize data for Mermaid syntax
4. **Diagram creation** — Write Mermaid code for the diagram
5. **Styling application** — Apply APEX brand colors via Mermaid theming
6. **Complexity management** — Ensure diagram is readable (split if too complex)
7. **Annotation** — Add labels, titles, and legends
8. **Validation** — Verify diagram renders correctly
9. **Integration** — Embed diagram in target deliverable
10. **Alternative representations** — Provide table or text alternative if needed

## Edge Cases
1. **Diagram exceeds 50 nodes** — Split into logical sub-diagrams with cross-references; provide overview diagram linking sub-diagrams.
2. **Mermaid syntax does not support required visualization** — Provide closest Mermaid alternative; document limitation; suggest external tool for exact need.
3. **Rendering inconsistencies across platforms** — Test on target platform; provide PNG fallback for critical presentations.
4. **Data changes frequently** — Design diagram structure for easy updates; use parameterized sections where possible.

## Example: Good vs Bad

**Good Mermaid Diagram:**
| Attribute | Value |
|-----------|-------|
| Type selection | Gantt for schedule, flowchart for process — correct type for data [PLAN] |
| Node count | 25 nodes — readable without zooming |
| APEX styling | Brand colors applied via theme configuration |
| Labels | Every node and edge labeled with meaningful text |
| Alternative | Data table provided for accessibility |

**Bad Mermaid Diagram:**
A single flowchart with 80 nodes, no styling, abbreviated labels, and no alternative representation. Unreadable, inaccessible, and fails to communicate the intended insight.

## Salida (Deliverables)
- Mermaid diagram code embedded in Markdown
- Rendered diagram in deliverable
- Data table alternative for accessibility

## Validation Gate
- [ ] Diagram data sourced from verified project data — no invented values
- [ ] Diagram accurately represents underlying data — spot-checked against source
- [ ] All relevant elements included — no significant omissions
- [ ] APEX styling applied with correct brand colors
- [ ] Diagram readable without additional explanation by target audience
- [ ] Node count below 50 per diagram — split if exceeded
- [ ] Data source referenced in diagram caption or footnote
- [ ] Diagram renders correctly on target platform (tested)
- [ ] Data table alternative provided for diagrams with quantitative data
- [ ] Diagram type matches the communication purpose — Gantt for time, flow for process

## Escalation Triggers
- Mermaid syntax limitations for required visualization
- Diagram too complex for single view
- Rendering inconsistencies across platforms
- Data too large for effective visualization

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before starting to understand standards and frameworks | `references/body-of-knowledge.md` |
| State of the Art | When benchmarking against industry trends | `references/state-of-the-art.md` |
| Knowledge Graph | To understand skill dependencies and data flow | `references/knowledge-graph.mmd` |
| Use Case Prompts | For specific scenarios and prompt templates | `prompts/use-case-prompts.md` |
| Metaprompts | To enhance output quality and reduce bias | `prompts/metaprompts.md` |
| Sample Output | Reference for deliverable format and structure | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
