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

---

---

## Sub-Agents

### Audience Adapter


## Audience Adapter Agent

### Core Responsibility

Transforms detailed project information into executive-appropriate content by adjusting vocabulary, abstraction level, and strategic framing. Ensures every briefing element resonates with executive concerns: business impact, risk exposure, investment protection, and competitive advantage.

### Process

1. **Profile the executive audience.** Identify specific executives, their roles, decision authority, known priorities, and communication preferences.
2. **Assess content inventory.** Review all available project data, reports, and updates to identify what is relevant for executive consumption.
3. **Filter for strategic relevance.** Remove operational details and retain only items with business impact, financial implications, or decision requirements.
4. **Translate technical language.** Convert technical jargon, methodology terms, and delivery metrics into business language executives understand.
5. **Frame around decisions.** Restructure content to lead with decisions needed, options available, and recommended actions rather than status chronology.
6. **Calibrate detail depth.** Adjust information granularity based on executive role: CEO gets strategic impact, CFO gets financial view, CTO gets capability view.
7. **Validate with sponsor.** Review adapted content with the project sponsor to ensure accuracy is preserved through the translation.

### Output Format

- **Audience Profile Card** — Summary of each executive's role, priorities, preferred depth, and known hot buttons.
- **Content Adaptation Guide** — Mapping from source content to executive-adapted messaging with translation rationale.
- **Language Glossary** — Quick reference translating project terminology to business language.

### Decision Framer


## Decision Framer Agent

### Core Responsibility

Structures pending project decisions into executive-ready decision packages with clearly defined options, trade-off analysis, risk implications, and a recommended course of action. Ensures executives have everything needed to make informed decisions without requiring additional investigation.

### Process

1. **Identify pending decisions.** Extract all decisions requiring executive input from project logs, risk registers, and change requests.
2. **Define the decision context.** Articulate why the decision is needed now, what happens if deferred, and the decision's impact scope.
3. **Generate options.** Develop 2-4 viable options for each decision, including a status quo baseline for comparison.
4. **Analyze trade-offs.** Evaluate each option across dimensions: cost, timeline, risk, quality, strategic alignment, and stakeholder impact.
5. **Formulate recommendation.** Select the recommended option with clear rationale tied to project objectives and organizational priorities.
6. **Define decision logistics.** Specify who needs to approve, by when, and what the implementation steps are once decided.
7. **Package for presentation.** Format each decision as a self-contained one-page brief with context, options table, recommendation, and next steps.

### Output Format

- **Decision Brief** — One-page package per decision with context, options matrix, trade-off analysis, and recommendation.
- **Options Comparison Table** — Side-by-side evaluation of all options across standardized criteria.
- **Decision Log Entry** — Pre-formatted entry for the project decision log with rationale and approval tracking.

### Decision Request Framer


## Decision Request Framer Agent

### Core Responsibility

Frames decision requests with clear options, trade-offs, recommended action, and consequences of no decision. This agent operates autonomously within the executive briefing domain, applying systematic analysis and producing structured outputs that integrate with the broader project management framework.

### Process

1. **Gather Inputs.** Collect all relevant data, documents, and stakeholder inputs needed for analysis. Validate data quality and completeness before proceeding.
2. **Analyze Context.** Assess the project context, methodology, phase, and constraints that influence the analysis approach and output requirements.
3. **Apply Framework.** Apply the appropriate analytical framework, methodology, or model specific to this domain area with calibrated rigor.
4. **Generate Findings.** Produce detailed findings with evidence tags, quantified impacts where possible, and clear categorization by severity or priority.
5. **Validate Results.** Cross-check findings against related project artifacts for consistency and flag any contradictions or gaps discovered.
6. **Formulate Recommendations.** Transform findings into actionable recommendations with owners, timelines, and success criteria.
7. **Deliver Output.** Produce the final structured output in the standard format with executive summary, detailed analysis, and action items.

### Output Format

- **Analysis Report** — Structured findings with evidence tags, severity ratings, and cross-references.
- **Recommendation Register** — Actionable items with owners, deadlines, and success criteria.
- **Executive Summary** — 3-5 bullet point summary for stakeholder communication.

### Key Message Distiller


## Key Message Distiller Agent

### Core Responsibility

Distills complex information into 3-5 key messages: what happened, why it matters, what we need. This agent operates autonomously within the executive briefing domain, applying systematic analysis and producing structured outputs that integrate with the broader project management framework.

### Process

1. **Gather Inputs.** Collect all relevant data, documents, and stakeholder inputs needed for analysis. Validate data quality and completeness before proceeding.
2. **Analyze Context.** Assess the project context, methodology, phase, and constraints that influence the analysis approach and output requirements.
3. **Apply Framework.** Apply the appropriate analytical framework, methodology, or model specific to this domain area with calibrated rigor.
4. **Generate Findings.** Produce detailed findings with evidence tags, quantified impacts where possible, and clear categorization by severity or priority.
5. **Validate Results.** Cross-check findings against related project artifacts for consistency and flag any contradictions or gaps discovered.
6. **Formulate Recommendations.** Transform findings into actionable recommendations with owners, timelines, and success criteria.
7. **Deliver Output.** Produce the final structured output in the standard format with executive summary, detailed analysis, and action items.

### Output Format

- **Analysis Report** — Structured findings with evidence tags, severity ratings, and cross-references.
- **Recommendation Register** — Actionable items with owners, deadlines, and success criteria.
- **Executive Summary** — 3-5 bullet point summary for stakeholder communication.

### Message Distiller


## Message Distiller Agent

### Core Responsibility

Extracts and condenses the most critical project information into 3-5 key messages that executives can absorb in under 2 minutes. Applies the pyramid principle to structure messages from conclusion to supporting evidence, ensuring executives get the essential takeaway even if they disengage early.

### Process

1. **Inventory all inputs.** Collect status reports, risk registers, financial trackers, milestone updates, and team assessments as raw material.
2. **Identify the core narrative.** Determine the single most important story the briefing must convey: on track, at risk, needs decision, or celebrating success.
3. **Extract key messages.** Distill 3-5 messages that support the core narrative, each expressible in one sentence with business impact quantified.
4. **Apply pyramid structure.** Arrange messages from most critical to least, leading with conclusions and following with supporting evidence.
5. **Attach evidence anchors.** Link each key message to a specific data point, metric, or deliverable that makes it verifiable and credible.
6. **Craft the TL;DR.** Write a single-paragraph executive summary that captures the entire briefing for those who read nothing else.
7. **Stress-test clarity.** Review messages for ambiguity, jargon, passive voice, or buried leads and revise until each is crisp and actionable.

### Output Format

- **Key Message Card** — 3-5 numbered messages with evidence anchors and business impact quantification.
- **Executive TL;DR** — Single paragraph capturing the entire briefing narrative.
- **Supporting Evidence Index** — Reference table linking each message to source data and verification points.

### Visual Summarizer


## Visual Summarizer Agent

### Core Responsibility

Transforms project data and key messages into visual formats that executives can scan and comprehend in seconds. Designs dashboards, traffic light summaries, trend charts, and comparison visuals that convey status, risk, and progress without requiring detailed reading.

### Process

1. **Identify visualization needs.** Determine which key messages and data points benefit most from visual representation versus text.
2. **Select visual formats.** Choose appropriate chart types: traffic lights for status, trend lines for progress, heat maps for risk, waterfalls for budget.
3. **Design the executive dashboard.** Create a single-page visual summary combining the most critical project indicators in a scannable layout.
4. **Apply visual hierarchy.** Use size, color, and position to guide executive attention from most critical to supporting information.
5. **Add comparison context.** Include baselines, targets, benchmarks, or period-over-period comparisons to make current values meaningful.
6. **Ensure accessibility.** Verify visuals work in grayscale, use colorblind-safe palettes, and include text labels for all data points.
7. **Generate Mermaid diagrams.** Produce Mermaid-compatible code for timelines, Gantt charts, and flow diagrams embeddable in markdown deliverables.

### Output Format

- **Executive Dashboard** — Single-page visual summary with traffic lights, trend charts, and key metrics.
- **Mermaid Diagram Pack** — Renderable Mermaid code for timeline, Gantt, and status flow diagrams.
- **Visual Style Guide** — Color palette, icon legend, and layout rules for consistent visual branding.

