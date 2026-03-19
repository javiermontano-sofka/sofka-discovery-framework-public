---
name: apex-risk-register
description: >
  Risk register creation and identification — probability/impact assessment, RBS categorization, risk ownership.
  Use when the user asks to "create a risk register", "identify risks", "categorize risks",
  "build risk list", "assess project risks", or mentions risk identification, risk categorization, RBS,
  risk breakdown structure, risk inventory, probability-impact matrix, risk scoring.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Risk Register & Identification

Produces a comprehensive risk register through systematic identification using multiple techniques (brainstorming, checklists, SWOT, assumption analysis, root cause analysis). Each risk is categorized by RBS category, assessed for probability and impact, and assigned an owner. Integrates with assumption log for assumption-based risks.

## Principio Rector

Los riesgos que no se identifican no desaparecen — se convierten en problemas. La identificación de riesgos es un ejercicio de imaginación disciplinada: combinar experiencia histórica, análisis sistemático y perspectivas diversas para revelar amenazas y oportunidades antes de que se materialicen.

## Assumptions & Limits

- Assumes project charter and WBS exist (at least draft). Without WBS, risk identification lacks structural anchoring.
- Probability and impact scales use a 5-point system (0.1–0.9). If the organization uses a different scale, adapt before scoring.
- Qualitative assessment only. For quantitative analysis (Monte Carlo, decision trees), escalate to `monte-carlo-simulation` or `risk-quantification`.
- Risk register is a living document — this skill creates the initial version. Updates flow through `risk-monitoring`.
- Cultural bias: teams underestimate risks in familiar domains (optimism bias) and overestimate in unfamiliar ones. The process must counteract this.
- Maximum 50 risks per initial register. Beyond that, prioritize top 20 and archive the rest.

## Usage

Parse `$ARGUMENTS` as the **project name** used throughout all output artifacts.

```
/pm:assess-risks ProjectAlpha
# Creates risk register for ProjectAlpha using all identification techniques

/pm:assess-risks "ERP Migration" --type=Waterfall
# Creates formal RBS-based risk register with quantitative scoring

/pm:assess-risks "Squad Payments" --type=Agile --focus=technical
# Lightweight risk identification focused on technical risks for agile team
```

**Parameters:**
- `$1`: Project name (required)
- `--type`: Overrides `{TIPO_PROYECTO}` routing (Agile|Waterfall|SAFe|Kanban|Recovery|Transformation)
- `--focus`: Narrow identification to a domain (technical|organizational|external|pm)
- `--threshold`: Minimum P×I score to include (default: 0.03)

## Service Type Routing

`{TIPO_PROYECTO}` variants:
- **Agile**: Risk-adjusted backlogs; risks surfaced in sprint planning and retrospectives; lightweight probability/impact tracking
- **Waterfall**: Formal Risk Breakdown Structure (RBS) with quantitative analysis; risk register baselined and change-controlled
- **SAFe**: Risks identified during PI Planning; ROAM classification (Resolved, Owned, Accepted, Mitigated) at program level
- **Kanban**: Risks tracked as blockers in flow; cycle time anomalies signal emerging risks; risk items on the board
- **Recovery**: Forensic risk re-identification from troubled project; root-cause risks isolated and prioritized for immediate mitigation
- **Transformation**: Organizational resistance risks, capability gaps, and cultural change risks dominate the register

## Before Identifying Risks

1. Read `references/body-of-knowledge.md` for identification techniques and RBS taxonomy
2. Read the project's assumption log — each low-confidence assumption becomes a candidate risk
3. Glob for existing project charter and WBS to anchor risks to deliverables
4. If `{TIPO_PROYECTO}` is SAFe, read `references/state-of-the-art.md` for ROAM classification guidance

## Entrada (Input Requirements)

- Project charter, WBS, and schedule baseline
- Assumption log (from `assumption-log`)
- Historical risk data from similar projects
- Stakeholder risk perceptions
- Industry/domain risk checklists

## Proceso (Protocol)

1. **Select techniques** — Choose identification techniques based on project type and available data
2. **Brainstorm risks** — Facilitate structured brainstorming across risk categories
3. **Assumption analysis** — Convert low-confidence assumptions to risks
4. **Checklist review** — Apply domain-specific risk checklists
5. **Categorize** — Assign RBS category (Technical, External, Organizational, PM)
6. **Assess probability** — Rate: Very Low (0.1), Low (0.3), Medium (0.5), High (0.7), Very High (0.9)
7. **Assess impact** — Rate impact on scope, schedule, cost, quality (same 5-point scale)
8. **Calculate priority** — P × I score, rank by priority
9. **Assign owners** — Designate risk owner for each identified risk
10. **Register compilation** — Build formal risk register with all attributes

## Edge Cases

1. **No historical data available** — Use Delphi technique with 3+ expert estimates. Tag all scores `[SUPUESTO]` and flag for validation after first phase.
2. **Stakeholders refuse to identify risks** — Document refusal as meta-risk (R-META-001: "Organizational risk blindness"). Proceed with assumption analysis and checklists. Escalate to sponsor.
3. **More than 50 risks identified** — Two-pass filter: eliminate duplicates, score all, archive P×I < 0.09 as "watch list". Present top 20 to steering committee.
4. **Recovery project with no previous register** — Forensic risk archaeology: review issue logs, change requests, incident reports to reconstruct materialized risks. Build forward-looking register from lessons.
5. **Cross-project risk dependencies** — Tag with `[DEPENDENCY]` and link to `dependency-mapping` skill. Escalate to portfolio-level risk review.

## Example: Good vs Bad

### Good Risk Statement (Cause-Event-Effect)

> **R-007**: *Because* the payment vendor has not completed PCI-DSS 4.0 certification (cause), *there is a risk that* integration will slip 4-6 weeks (event), *resulting in* delayed go-live and $120K additional hosting costs (effect).

| Attribute | Value |
|-----------|-------|
| Category | External > Vendor |
| Probability | High (0.7) |
| Impact | High (0.7) |
| P×I Score | 0.49 |
| Owner | Maria Lopez (Procurement Lead) |
| Evidence | `[STAKEHOLDER]` vendor call 2026-03-10 |

### Bad Risk Statement (Vague)

> **R-007**: Payment integration might be late.

*Why it fails:* No cause, no quantified effect, no evidence tag, no owner, no scoring. This is a concern, not a risk.

## Salida (Deliverables)

- `03_risk_register_{proyecto}_{WIP}.md` — Complete risk register
- Risk Breakdown Structure (RBS) diagram (Mermaid)
- Probability-Impact matrix (heat map)
- Top 10 risks summary for executive briefing
- Risk identification log (techniques used, participants)

## Validation Gate

- [ ] ≥15 risks identified using ≥3 different techniques
- [ ] Every risk follows cause-event-effect format
- [ ] P×I scores consistently applied (no gaps, no "TBD")
- [ ] All 4 RBS categories have ≥1 risk (Technical, External, Organizational, PM)
- [ ] Every risk has a named owner (not "TBD" or team name)
- [ ] Risks trace to WBS elements or assumptions (traceability column populated)
- [ ] Top 10 risks have evidence tags (not `[SUPUESTO]` only)
- [ ] P×I heat map generated with color coding
- [ ] Assumption-derived risks cross-referenced with assumption log
- [ ] No subjective language without evidence ("might", "could" → must cite source)

## Escalation Triggers

- More than 5 risks rated Critical (P × I > 0.5)
- Risk identification reveals project viability concern
- Risk owner rejects assignment
- Historical data shows >50% of similar projects failed

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before first risk identification session | `references/body-of-knowledge.md` |
| State of the Art | When client uses modern risk frameworks (ROAM, risk-adjusted backlog) | `references/state-of-the-art.md` |
| Knowledge Graph | To understand skill dependencies and data flow | `references/knowledge-graph.mmd` |
| Use Case Prompts | For specific risk scenarios (new project, recovery, portfolio) | `prompts/use-case-prompts.md` |
| Metaprompts | To enhance identification quality (adversarial thinking, bias check) | `prompts/metaprompts.md` |
| Sample Output | Reference for deliverable format and structure | `examples/sample-output.md` |

## Output Configuration

- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
