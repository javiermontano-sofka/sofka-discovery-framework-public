---
name: apex-data-storytelling
description: >
  Use when the user asks to "tell a data story", "visualize project data",
  "create data narrative", "present metrics compellingly", or "design data-driven presentations".
  Activates when a stakeholder needs to transform project metrics into compelling narratives,
  select appropriate visualization types for specific insights, create audience-adapted data
  presentations, or combine quantitative evidence with narrative structure.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Project Data Storytelling & Visualization

**TL;DR**: Transforms project data into compelling narratives that drive understanding and action. Combines data visualization (charts, diagrams, infographics) with narrative structure (context, tension, resolution) to communicate project insights effectively to diverse audiences.

## Principio Rector
Los datos sin historia son ruido; la historia sin datos es opinión. Data storytelling combina ambos: la precisión del dato con el poder persuasivo de la narrativa. El formato "Contexto-Tensión-Resolución" convierte métricas en decisiones. La visualización correcta puede comunicar en segundos lo que un párrafo no logra en minutos.

## Assumptions & Limits
- Assumes verified project data is available for visualization [METRIC]
- Assumes target audience and their priorities are known [STAKEHOLDER]
- Breaks when data quality is poor — storytelling with bad data is misleading, not persuasive
- Does not clean or validate data — requires pre-verified inputs
- Mermaid diagrams are the primary visualization format; complex charts may need external tools
- Multiple valid interpretations of the same data require transparent disclosure [INFERENCIA]

## Usage

```bash
# Create data narrative for executive briefing
/pm:data-storytelling $PROJECT --type=narrative --audience="executive" --insight="schedule-risk"

# Generate visualization set for project metrics
/pm:data-storytelling $PROJECT --type=visualization --metrics="cpi,spi,velocity"

# Create audience-adapted versions of same data story
/pm:data-storytelling $PROJECT --type=multi-audience --audiences="executive,team,sponsor"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project identifier |
| `--type` | Yes | `narrative`, `visualization`, `multi-audience`, `insight-extraction` |
| `--audience` | No | Target audience for the story |
| `--insight` | No | Key insight to communicate |
| `--metrics` | No | Metrics to visualize |
| `--audiences` | No | Multiple audiences for adapted versions |

## Service Type Routing
`{TIPO_PROYECTO}`: All project types benefit from data storytelling. Executive audiences need simplification; technical audiences need depth; board presentations need strategic framing.

## Before Storytelling

1. **Read** the project metrics and data to identify the key insight or pattern
2. **Read** the stakeholder register to understand audience data literacy and priorities
3. **Glob** `skills/data-storytelling/references/*.md` for visualization selection guides
4. **Grep** for previous data presentations to maintain narrative consistency

## Entrada (Input Requirements)
- Project data and metrics
- Target audience and their priorities
- Key message or insight to communicate
- Available visualization formats (Mermaid, charts, dashboards)
- Communication context (report, presentation, briefing)

## Proceso (Protocol)
1. **Data analysis** — Identify the key insight or pattern in the data
2. **Audience profiling** — Understand audience's data literacy and priorities
3. **Narrative structure** — Build story arc: Context-Insight-Implication-Action
4. **Chart selection** — Choose visualization type that best communicates the insight
5. **Data preparation** — Clean and format data for visualization
6. **Visualization creation** — Create charts and diagrams (Mermaid, tables)
7. **Narrative writing** — Write connecting prose that guides interpretation
8. **Annotation** — Add annotations highlighting key data points
9. **Call to action** — End with clear implications and recommended actions
10. **Review** — Verify data accuracy and narrative coherence

## Edge Cases

1. **Data contradicts established narrative**: Present data honestly. Do not distort visualization to support preferred conclusion. Document the contradiction explicitly. [METRIC]
2. **Audience unable to interpret visualizations**: Simplify chart type. Add explanatory annotations. Include text summary restating what the chart shows. Never assume chart literacy. [STAKEHOLDER]
3. **Multiple valid interpretations**: Present primary interpretation with alternatives. Tag interpretations with [INFERENCIA]. Let audience understand uncertainty. [INFERENCIA]
4. **Key data unavailable for story completion**: Use available data for partial story. Clearly mark gaps. Recommend data collection for complete picture. [SUPUESTO]

## Example: Good vs Bad

**Good Data Story:**

| Attribute | Value |
|-----------|-------|
| Narrative structure | Context-Insight-Implication-Action |
| Visualization selection | Chart type matched to insight type |
| Audience adaptation | Simplified for executives, detailed for team |
| Annotations | Key data points highlighted with callouts |
| Call to action | Specific action linked to data insight |
| Data sources | Cited and verifiable |

**Bad Data Story:**
A dense table of numbers emailed to all stakeholders with the subject line "project metrics." No narrative, no visualization, no audience adaptation, no interpretation. Fails because raw data without context, structure, or interpretation does not drive understanding or action.

## Validation Gate
- [ ] Key insight clearly identified and stated before visualization
- [ ] Narrative follows Context-Insight-Implication-Action structure
- [ ] Visualization type selected to match insight type (trend=line, comparison=bar, composition=pie)
- [ ] Charts accurately represent underlying data — no misleading scales or truncation
- [ ] Audience-appropriate complexity level (simplified for executives, detailed for team)
- [ ] Annotations highlight ≥2 key data points per visualization
- [ ] Data sources cited for every chart and metric
- [ ] Data limitations disclosed transparently
- [ ] Audience gains actionable insight from the story [STAKEHOLDER]
- [ ] Storytelling aligned with communication plan and project brand [PLAN]

## Escalation Triggers
- Data contradicts established narrative
- Audience unable to interpret visualizations
- Key data unavailable for story completion
- Multiple valid interpretations of same data

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before storytelling to understand visualization theory | `references/body-of-knowledge.md` |
| State of the Art | When exploring innovative data presentation formats | `references/state-of-the-art.md` |
| Knowledge Graph | To link storytelling to metrics and communication plan | `references/knowledge-graph.mmd` |
| Use Case Prompts | When crafting narratives for specific audiences | `prompts/use-case-prompts.md` |
| Metaprompts | To generate data story templates | `prompts/metaprompts.md` |
| Sample Output | To calibrate expected data story quality | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
