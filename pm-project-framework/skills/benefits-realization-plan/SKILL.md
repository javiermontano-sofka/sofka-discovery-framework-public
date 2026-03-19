---
name: apex-benefits-realization-plan
description: >
  Use when the user asks to "plan benefits realization", "define KPIs", "track success metrics",
  "establish benefits framework", or "measure project value delivery".
  Activates when a stakeholder needs to link deliverables to business outcomes, define measurable
  KPIs with targets, design post-project benefit tracking, create a benefits ownership matrix,
  or establish a sustainability plan for realized benefits.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Benefits Realization Plan

**TL;DR**: Produces a benefits realization plan linking project deliverables to measurable business outcomes. Defines KPIs, success metrics, measurement methods, target values, and a tracking framework that extends beyond project closure to ensure the organization captures the intended value.

## Principio Rector
Un proyecto exitoso no es uno que entrega a tiempo y en presupuesto — es uno que genera el valor de negocio prometido. Los beneficios no se realizan en la fecha de entrega; se realizan cuando los usuarios adoptan, los procesos mejoran, y los KPIs se mueven. El plan de beneficios es el puente entre la entrega y el valor.

## Assumptions & Limits
- Assumes the project charter includes a business case with quantifiable objectives [SUPUESTO]
- Assumes baseline metrics are measurable or can be established before project execution [SUPUESTO]
- Breaks when benefits are purely intangible with no proxy metrics — requires creative KPI design
- Does not replace the financial business case — complements it with operational benefit tracking
- Post-project benefit tracking requires organizational commitment beyond the PM team [STAKEHOLDER]
- Benefit targets beyond 12 months carry increasing uncertainty — tag as [INFERENCIA]

## Usage

```bash
# Create benefits realization plan from charter
/pm:benefits-realization-plan $PROJECT --type=create --source="charter"

# Define KPIs for specific benefit category
/pm:benefits-realization-plan $PROJECT --type=kpi --category="operational"

# Generate benefits tracking dashboard
/pm:benefits-realization-plan $PROJECT --type=dashboard --period="quarterly"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project identifier |
| `--type` | Yes | `create`, `kpi`, `dashboard`, `review` |
| `--source` | No | Source document for benefit extraction |
| `--category` | No | `financial`, `operational`, `strategic`, `compliance` |
| `--period` | No | Tracking period (monthly, quarterly) |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile/Kanban**: Iteration-based benefit tracking, velocity as proxy
- **Waterfall**: Phase-gate benefit milestones, formal measurement points
- **SAFe**: PI-level benefits tracking, value stream metrics
- **Transformation**: Organizational capability maturity, adoption rates
- **Recovery**: Restoration metrics (schedule recovery, budget recovery rate)

## Before Planning

1. **Read** the project charter and business case to extract expected benefits and success criteria
2. **Glob** `skills/benefits-realization-plan/references/*.md` for KPI design patterns
3. **Read** organizational strategic objectives (OKRs, balanced scorecard) for alignment mapping
4. **Grep** for existing baseline metrics in current operational reports or dashboards

## Entrada (Input Requirements)
- Approved project charter with business case
- Stakeholder expectations and success criteria
- Organizational strategic objectives (OKRs, balanced scorecard)
- Current baseline metrics for comparison
- Historical benefits data from similar projects

## Proceso (Protocol)
1. **Identify benefits** — Map each project objective to specific, measurable benefits
2. **Categorize benefits** — Classify as financial, operational, strategic, or compliance
3. **Define KPIs** — Establish Key Performance Indicators with SMART criteria
4. **Set baselines** — Document current state metrics for comparison
5. **Set targets** — Define target values with timeline (30/60/90/180 days post-delivery)
6. **Assign ownership** — Designate a benefits owner for each KPI (usually business stakeholder)
7. **Design measurement method** — Define how each KPI will be measured and data sources
8. **Create tracking framework** — Build benefits dashboard with measurement schedule
9. **Plan sustainability** — Define actions to sustain benefits beyond project closure
10. **Review cadence** — Establish post-project benefits review schedule

## Edge Cases

1. **No baseline data available**: Design baseline measurement sprint before project execution. Document current state as [SUPUESTO] if measurement is impossible pre-project. [METRIC]
2. **Benefits are purely intangible (morale, culture)**: Design proxy metrics (employee NPS, retention rate, survey scores). Never claim intangible benefits are unmeasurable. [INFERENCIA]
3. **Stakeholders disagree on target values**: Facilitate target-setting workshop using historical benchmarks. Document agreed targets with evidence of consensus. [STAKEHOLDER]
4. **Benefits ownership rejected by business**: Escalate to sponsor. Benefits without owners will not be tracked — document this risk explicitly. [STAKEHOLDER]

## Example: Good vs Bad

**Good Benefits Plan:**

| Attribute | Value |
|-----------|-------|
| Benefits identified | 8, each linked to charter objective |
| KPIs defined | SMART criteria for every benefit |
| Baselines established | 6/8 from actual data, 2/8 [SUPUESTO] |
| Targets | 30/60/90/180-day milestones per KPI |
| Ownership | 100% assigned to business stakeholders |
| Post-project tracking | 12-month review schedule with dashboard |

**Bad Benefits Plan:**
A document listing "improved efficiency" and "better customer satisfaction" without KPIs, baselines, targets, or owners. No measurement method defined. No post-project tracking plan. Fails because benefits without metrics are wishes, not plans — the organization will never know if the project delivered its promised value.

## Validation Gate
- [ ] Every charter objective maps to ≥1 measurable benefit with KPI
- [ ] All KPIs meet SMART criteria (Specific, Measurable, Achievable, Relevant, Time-bound)
- [ ] ≥75% of KPIs have baseline metrics from actual data, remainder tagged [SUPUESTO]
- [ ] Target values defined at ≥2 time horizons (e.g., 90-day and 180-day post-delivery)
- [ ] Every KPI has an assigned business stakeholder owner — no PM-only ownership
- [ ] Measurement methods specify data source, collection frequency, and responsible party
- [ ] Post-project review schedule extends ≥6 months beyond project closure
- [ ] Benefits realization risks identified (adoption failure, measurement gaps)
- [ ] Sponsors see clear value justification linked to strategic objectives [STAKEHOLDER]
- [ ] Tracking cadence aligned with delivery rhythm and governance schedule [PLAN]

## Escalation Triggers
- No baseline data available for key KPIs
- Benefits ownership rejected by business stakeholders
- Target values conflict between stakeholder groups
- Measurement method requires unavailable data sources

## Salida (Deliverables)

- Primary deliverable: benefits realization plan with tracking framework
- All outputs tagged with evidence markers
- Mermaid diagrams where applicable
- Executive summary for stakeholder consumption

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
