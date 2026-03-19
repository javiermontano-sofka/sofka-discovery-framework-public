---
name: apex-executive-briefing
description: >
  Use when the user asks to "prepare executive summary", "brief the sponsor",
  "create sponsor update", "write C-level presentation", or "produce steering committee report".
  Activates when a stakeholder needs to produce decision-focused executive briefings, distill
  complex project data into 5-minute reads, present RAG status with strategic alignment,
  frame decisions with options and recommendations, or prepare steering committee materials.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Executive Briefing & Sponsor Updates

**TL;DR**: Produces executive-level briefings optimized for senior leadership audiences. Distills complex project information into concise, decision-focused summaries with RAG status, key metrics, strategic alignment, decisions needed, and risk highlights. Designed for 5-minute reads or 15-minute presentations.

## Principio Rector
Los ejecutivos no quieren datos — quieren decisiones facilitadas. Un briefing ejecutivo que requiere más de 5 minutos de lectura o no presenta opciones de decisión ha fallado. La regla: liderar con la conclusión, respaldar con evidencia, cerrar con la acción requerida.

## Assumptions & Limits
- Assumes current project metrics and EVM data are available [METRIC]
- Assumes executive audience priorities and decision authority are known [STAKEHOLDER]
- Breaks when underlying project data is stale (>1 week old) — briefings must reflect current state
- Does not produce detailed status reports — those are for operational audiences
- Strategic alignment assessment requires access to organizational strategy documents [SUPUESTO]
- Decision framing must present options honestly; do not bias toward preferred option

## Usage

```bash
# Create executive briefing for sponsor
/pm:executive-briefing $PROJECT --audience="sponsor" --focus="decisions"

# Create steering committee presentation
/pm:executive-briefing $PROJECT --audience="steering-committee" --format="presentation"

# Create one-page dashboard briefing
/pm:executive-briefing $PROJECT --type=one-page --metrics="cpi,spi,top-risks"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project identifier |
| `--audience` | No | Target executive audience (sponsor, cto, cfo, steering-committee) |
| `--focus` | No | Briefing focus (decisions, status, risks, strategic-alignment) |
| `--format` | No | Output format (document, presentation, one-page) |
| `--type` | No | `full`, `one-page`, `decision-request` |
| `--metrics` | No | Key metrics to highlight |

## Service Type Routing
`{TIPO_PROYECTO}`: All project types produce executive briefings. Frequency varies: Agile after each sprint/PI; Waterfall at phase gates; Portfolio at quarterly reviews.

## Before Briefing

1. **Read** current project metrics and EVM data for the most recent reporting period
2. **Read** the risk dashboard for top 5 risks and their response status
3. **Glob** `skills/executive-briefing/references/*.md` for briefing templates and best practices
4. **Grep** for pending decisions requiring executive approval

## Entrada (Input Requirements)
- Current project status and metrics
- EVM data (CPI, SPI, EAC)
- Risk dashboard (top 5 risks)
- Decisions pending sponsor approval
- Strategic alignment assessment

## Proceso (Protocol)
1. **Audience calibration** — Identify specific executive audience and their priorities
2. **Status synthesis** — Distill project status to RAG (Red/Amber/Blue) per dimension
3. **Metric highlights** — Select 3-5 key metrics that tell the story
4. **Risk summary** — Present top 3 risks with impact and response status
5. **Decision framing** — Present decisions needed with options and recommendations
6. **Strategic alignment** — Show how project progress maps to strategic objectives
7. **Visual design** — Create dashboard-style layout with minimal text
8. **Action items** — Clear list of what the executive needs to do or decide

## Edge Cases

1. **RAG status turns Red on any dimension**: Lead with Red item. Present impact and corrective action plan. Frame decision needed from executive. Never bury Red status. [METRIC]
2. **Decision blocked for >5 business days**: Escalate in briefing with clear deadline and consequences of delay. Present default action if no decision received. [STAKEHOLDER]
3. **Strategic alignment shows drift**: Flag drift with evidence. Present realignment options. Frame as strategic risk, not just project risk. [PLAN]
4. **Sponsor requests ad-hoc briefing**: Indicates concern. Provide briefing within 24 hours. Use abbreviated template. Focus on the likely area of concern. [STAKEHOLDER]

## Example: Good vs Bad

**Good Executive Briefing:**

| Attribute | Value |
|-----------|-------|
| Reading time | ≤5 minutes |
| RAG status | Per dimension (schedule, cost, scope, risk) |
| Key metrics | 3-5 with trend indicators |
| Risk summary | Top 3 with impact and response |
| Decisions | Framed with options and recommendations |
| Action items | Specific, assigned, with deadlines |

**Bad Executive Briefing:**
A 15-page document with raw project data, no RAG status, no decisions framed, no strategic alignment. Fails because executives do not read 15-page reports — they skim the first page, find no decisions, and disengage. The briefing's value is measured by the decisions it enables, not the data it contains.

## Validation Gate
- [ ] Briefing readable in ≤5 minutes (or presentable in ≤15 minutes)
- [ ] RAG status assigned per dimension (schedule, cost, scope, risk, quality)
- [ ] 3-5 key metrics selected with trend indicators (improving, stable, declining)
- [ ] Top 3 risks presented with impact quantification and response status
- [ ] Every pending decision framed with ≥2 options and clear recommendation
- [ ] Strategic alignment snapshot shows project-to-strategy mapping
- [ ] Visual layout scannable with minimal text — dashboard style, not essay style
- [ ] Action items specific with assigned owner and deadline
- [ ] Executive gets decision-ready information without requiring follow-up [STAKEHOLDER]
- [ ] Reporting frequency aligned with methodology cadence [PLAN]

## Escalation Triggers
- RAG status turns Red on any dimension
- Decision blocked for > 5 business days
- Strategic alignment assessment shows drift
- Sponsor requests ad-hoc briefing (indicates concern)

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before briefing to understand executive communication theory | `references/body-of-knowledge.md` |
| State of the Art | When exploring modern briefing formats | `references/state-of-the-art.md` |
| Knowledge Graph | To link briefing to metrics and governance | `references/knowledge-graph.mmd` |
| Use Case Prompts | When preparing audience-specific briefings | `prompts/use-case-prompts.md` |
| Metaprompts | To generate executive briefing templates | `prompts/metaprompts.md` |
| Sample Output | To calibrate expected briefing quality | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
