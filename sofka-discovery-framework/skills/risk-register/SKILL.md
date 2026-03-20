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

---

---

## Sub-Agents

### Probability Impact Assessor


## Probability-Impact Assessor Agent

### Core Responsibility

Apply consistent, calibrated scoring to every identified risk using the 5-point P×I matrix. Combat anchoring bias by scoring probability and impact independently, and validate scores against historical data when available.

### Process

1. **Calibrate scales.** Before scoring, review the 5-point scales: Very Low (0.1), Low (0.3), Medium (0.5), High (0.7), Very High (0.9). Ensure all assessors share the same mental model for each level.
2. **Score probability independently.** For each risk, assess likelihood WITHOUT looking at impact first. Use frequency data if available: "How often has this happened in similar projects?" Tag source as `[HISTORICO]` or `[SUPUESTO]`.
3. **Score impact across 4 dimensions.** Rate impact on scope, schedule, cost, and quality separately. Use the HIGHEST impact dimension as the overall impact score. Document which dimension drives the score.
4. **Calculate P×I priority.** Multiply probability × impact. Rank all risks by P×I score descending. Flag any risk with P×I > 0.5 as Critical.
5. **Generate heat map.** Plot all risks on a 5×5 probability-impact matrix. Color-code: Red (P×I > 0.25), Amber (0.09-0.25), Blue (< 0.09). Never use green.
6. **Cross-validate outliers.** Review the top 5 and bottom 5 risks. Ask: "Is this score consistent with similar risks?" Adjust if anchoring or availability bias detected.
7. **Produce scored register.** Output the complete scored risk register with P, I, P×I, driving dimension, evidence tag, and heat map position.

### Output Format

- **Scored Risk Register** — All risks with P, I, P×I, rank, and evidence tags
- **P×I Heat Map** — Mermaid quadrant chart with APEX colors (#DC2626 red, #F59E0B amber, #2563EB blue)
- **Critical Risk Alert** — Separate callout for any risk with P×I > 0.5

### Risk Identifier


## Risk Identifier Agent

### Core Responsibility

Conduct exhaustive risk identification using ≥3 complementary techniques to ensure no significant risk goes undetected. Combat optimism bias by deliberately seeking threats in familiar domains and opportunities in unfamiliar ones.

### Process

1. **Harvest assumptions.** Read the assumption log and flag every assumption with confidence < High as a candidate risk. Each low-confidence assumption becomes a risk with cause = "Assumption A-XXX may be invalid."
2. **Run checklist scan.** Apply RBS-based checklists across all 4 categories (Technical, External, Organizational, PM). For each category, ask: "What could go wrong here that we haven't discussed?" Document ≥3 risks per category.
3. **Facilitate structured brainstorm.** For each WBS work package, ask: "What threat could prevent delivery? What opportunity could accelerate it?" Use cause-event-effect format for every identified risk.
4. **Perform SWOT risk extraction.** Map Weaknesses to threats, Strengths to opportunities. Cross-reference with stakeholder register for politically sensitive risks that teams self-censor.
5. **Apply root cause analysis.** For the top 5 most impactful risks, trace backward to root causes using 5-Whys or Ishikawa. Ensure we're treating causes, not symptoms.
6. **Deduplicate and normalize.** Merge overlapping risks, standardize cause-event-effect language, assign unique IDs (R-XXX), and tag evidence source.
7. **Deliver risk inventory.** Output a clean list of ≥15 risks in cause-event-effect format, categorized by RBS, with evidence tags and preliminary severity estimates.

### Output Format

| ID | Risk Statement (Cause → Event → Effect) | RBS Category | Evidence | Preliminary Severity |
|----|----------------------------------------|-------------|----------|---------------------|
| R-001 | Because... there is a risk that... resulting in... | Technical > Architecture | `[STAKEHOLDER]` | High |

### Risk Owner Assigner


## Risk Owner Assigner Agent

### Core Responsibility

Ensure every risk has a single, named owner who has the authority, expertise, and proximity to monitor and respond to that risk. Reject "TBD" and team-level assignments — risks owned by everyone are owned by no one.

### Process

1. **Map ownership candidates.** Cross-reference the stakeholder register and RACI matrix with risk categories. Technical risks → technical leads. External risks → procurement/vendor managers. Organizational risks → sponsors/managers. PM risks → PM team.
2. **Apply ownership criteria.** For each risk, select the owner who scores highest on: (a) proximity to the risk source, (b) authority to approve response actions, (c) expertise to monitor trigger conditions.
3. **Validate capacity.** Check that no single owner is assigned more than 7 risks (cognitive overload threshold). If exceeded, escalate to risk manager for redistribution.
4. **Assign backup owners.** For Critical risks (P×I > 0.5), assign a secondary owner who can act if the primary is unavailable.
5. **Document accountability.** For each assignment, record: owner name, role, why they were selected, and their acknowledgment status.
6. **Flag unassignable risks.** If no suitable owner exists (e.g., external regulatory risk with no internal champion), escalate to steering committee with recommendation.
7. **Produce ownership matrix.** Output a clean mapping of risk ID → owner → backup → rationale.

### Output Format

| Risk ID | Owner | Role | Backup | Rationale | Status |
|---------|-------|------|--------|-----------|--------|
| R-001 | Maria Lopez | Procurement Lead | Juan García | Closest to vendor relationship | `[STAKEHOLDER]` Confirmed |

### Risk Response Strategist


## Risk Response Strategist Agent

### Core Responsibility

Design actionable response strategies for the top 10 risks that go beyond "monitor and hope." Each response must have a trigger condition, a specific action, a responsible party, and a cost/effort estimate.

### Process

1. **Classify response type.** For each top-10 risk, select the optimal strategy:
   - **Avoid** — Eliminate the cause or change the plan to bypass the risk entirely
   - **Transfer** — Shift impact to a third party (insurance, vendor SLA, contractual penalty)
   - **Mitigate** — Reduce probability or impact through proactive actions
   - **Accept (Active)** — Establish contingency reserve and trigger conditions
   - **Accept (Passive)** — Document and monitor only (for Low risks)
   - **Escalate** — Push to a higher authority when beyond project team's control
2. **Design trigger conditions.** For each response, define the observable event that activates the response. Use measurable indicators: "When vendor delivery slips by >5 days" not "When things look bad."
3. **Estimate response cost.** Quantify the effort/cost of implementing each response in FTE-hours or sprint capacity. Compare response cost vs. expected loss (P × Impact cost) to validate the investment.
4. **Define contingency reserves.** For Mitigate and Active Accept strategies, calculate the budget/schedule reserve needed. Use formula: Reserve = P × Impact for each risk, summed for portfolio reserve.
5. **Identify secondary risks.** Check if the response itself creates new risks. If so, add to the register with cross-reference.
6. **Map to project plan.** Link each response action to a WBS element, sprint backlog item, or milestone. Responses without plan integration are wishful thinking.
7. **Produce response plan.** Output a structured plan with strategy, trigger, action, owner, cost, and timeline for each top-10 risk.

### Output Format

| Risk ID | Strategy | Trigger Condition | Response Action | Owner | Cost (FTE-h) | Timeline |
|---------|----------|-------------------|-----------------|-------|-------------|----------|
| R-001 | Mitigate | Vendor misses checkpoint 2 | Activate backup vendor | Maria Lopez | 40 FTE-h | Within 5 days of trigger `[PLAN]` |

