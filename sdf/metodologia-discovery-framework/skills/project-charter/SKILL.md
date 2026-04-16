---
name: apex-project-charter
description: >
  Use when the user asks to "create a project charter", "define project objectives",
  "build a business case", "document success criteria", "formalize project authorization",
  or mentions charter, project initiation, sponsor approval, project justification,
  SMART objectives, project kickoff document.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - WebFetch
---

# Project Charter Generation

**TL;DR**: Produces a formal project charter document including business case justification, measurable objectives, success criteria, high-level scope, key milestones, assumptions, constraints, and sponsor authorization. The charter is the single authorizing document that formally initiates the project and grants the PM authority to apply organizational resources.

## Principio Rector
El charter no es burocracia — es el contrato social entre el sponsor y el equipo. Sin un charter aprobado, no existe un proyecto; solo existe una idea sin compromiso organizacional. Cada elemento del charter debe ser verificable y rastreable hasta un objetivo de negocio.

## Assumptions & Limits
- Assumes a sponsor has been identified and is available for authorization [STAKEHOLDER]
- Assumes organizational strategy or OKRs are documented for alignment validation [SUPUESTO]
- Breaks when there is no clear business problem or need — charter cannot manufacture justification
- Does not produce detailed project plans; only high-level scope and milestones
- Assumes budget and timeline constraints are provided at least at order-of-magnitude level [SUPUESTO]
- Limited to single-project charters; for program charters use `program-management`

## Usage

```bash
# Generate charter from project brief
/pm:project-charter $ARGUMENTS="--brief project-request.md --type Agile"

# Lean charter for agile project
/pm:project-charter --type lean --sponsor "Maria Lopez" --objective "Migrate CRM to cloud"

# Full PMBOK charter with formal authorization
/pm:project-charter --type formal --brief rfp-response.pdf --methodology Waterfall
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Path to project brief or request document |
| `--type` | No | `lean` (1-2 pages), `formal` (5-8 pages, default), `recovery` |
| `--sponsor` | No | Sponsor name for authorization block |
| `--methodology` | No | Pre-selected methodology for charter alignment |
| `--objective` | No | One-line project objective for quick generation |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile/Kanban**: Lean charter (1-2 pages), vision-driven, iterative objectives
- **Waterfall**: Full PMBOK charter (5-8 pages), detailed scope boundaries, formal authority
- **SAFe**: Lean Portfolio Management charter, value stream alignment, PI cadence
- **Hybrid**: Combined format, phased scope with agile delivery
- **PMO/Portfolio**: Program charter with strategic portfolio linkage
- **Transformation**: Transformation charter with change impact assessment
- **Recovery**: Recovery charter with root cause analysis and corrective plan

## Before Chartering
1. **Read** any existing project brief, RFP, or request document to extract business context [PLAN]
2. **Glob** `**/strategic-plan*` or `**/OKR*` to find organizational strategy for alignment [PLAN]
3. **Read** stakeholder register or org chart if available to identify sponsor and key stakeholders [STAKEHOLDER]
4. **Grep** for similar past projects in `**/lessons*` or `**/closure*` to leverage historical data [INFERENCIA]

## Entrada (Input Requirements)
- Project request or brief (any format)
- Sponsor identification and contact
- Strategic alignment context (organizational goals, OKRs)
- High-level budget and timeline constraints
- Known stakeholders and their expectations
- Prior feasibility studies (if available)

## Proceso (Protocol)
1. **Analyze request** — Extract project need, problem statement, and expected benefits from input documents
2. **Define objectives** — Formulate SMART objectives (Specific, Measurable, Achievable, Relevant, Time-bound)
3. **Build business case** — Document justification including strategic alignment, expected ROI (drivers only, never prices), and opportunity cost
4. **Scope boundaries** — Define high-level scope with explicit inclusions and exclusions
5. **Identify milestones** — Establish 5-8 key milestones with target dates
6. **Document assumptions & constraints** — Catalog all assumptions with confidence levels and hard constraints
7. **Define success criteria** — Establish measurable criteria for project success (KPIs, acceptance thresholds)
8. **Authority & governance** — Define PM authority level, escalation paths, and reporting structure
9. **Risk preview** — Identify top 5 high-level risks with preliminary response strategies
10. **Compile & validate** — Assemble charter, cross-check internal consistency, prepare for sponsor review

## Edge Cases
1. **No identifiable sponsor** — Do not produce a charter. Escalate to governance. A charter without a sponsor is an unauthorized project [STAKEHOLDER].
2. **Conflicting objectives from multiple stakeholders** — Document all perspectives, facilitate alignment workshop, and present unified objectives with dissent log. Do not average conflicting objectives [STAKEHOLDER].
3. **Project is actually a BAU operational task** — Flag that this does not require a project charter. Recommend operational request process instead [INFERENCIA].
4. **Recovery project with no prior charter** — Create a recovery charter that includes root cause analysis of the original failure and corrective plan. Reference original scope if discoverable [PLAN].
5. **Budget unknown at charter time** — Use order-of-magnitude estimation (FTE-months) with explicit [SUPUESTO] tags and require budget refinement before Phase 2 gate [SUPUESTO].

## Example: Good vs Bad

**Good example — SMART charter objectives:**

| Attribute | Value |
|-----------|-------|
| Problem statement | Clear, measurable business problem with quantified impact |
| Objectives | 3 SMART objectives with KPI targets and measurement method |
| Scope | Explicit inclusions (5) and exclusions (3) with rationale |
| Milestones | 6 milestones with target dates and decision points |
| Assumptions | 8 assumptions each tagged with confidence level (H/M/L) |
| Authorization | Sponsor name, signature block, PM authority level defined |

**Bad example — Vague charter:**
"The project will improve customer satisfaction through technology." No measurable objectives, no scope boundaries, no milestones, no identified sponsor. This is a wish statement, not a charter. Without SMART objectives, success cannot be measured; without scope boundaries, scope creep is guaranteed.

## Salida (Deliverables)
- `00_charter_{proyecto}_{WIP}.md` — Complete project charter document
- Sections: Executive Summary, Business Case, Objectives, Scope Statement, Milestones, Assumptions & Constraints, Success Criteria, Governance, Risk Preview, Authorization Block
- Acceptance criteria: All SMART objectives defined, sponsor authorization block present, assumptions explicitly tagged

## Validation Gate
- [ ] Every objective passes SMART test (Specific, Measurable, Achievable, Relevant, Time-bound) [PLAN]
- [ ] Sponsor authorization block present with name and authority level [STAKEHOLDER]
- [ ] ≥3 explicit scope exclusions documented with rationale [PLAN]
- [ ] Every assumption tagged with confidence level (High/Medium/Low) [SUPUESTO]
- [ ] ≥5 milestones with target dates defined [SCHEDULE]
- [ ] Business case includes strategic alignment to ≥1 organizational objective [PLAN]
- [ ] Top 5 risks identified with preliminary response strategy [PLAN]
- [ ] No assertion without evidence tag; ≥70% [PLAN]/[STAKEHOLDER], <30% [SUPUESTO]
- [ ] Success criteria include ≥2 quantitative KPIs with measurement method [METRIC]
- [ ] Charter internally consistent (objectives align with scope, milestones, and success criteria) [PLAN]

## Escalation Triggers
- Business case ROI below organizational threshold
- No identifiable sponsor or conflicting sponsorship
- Objectives not achievable within stated constraints
- Strategic misalignment detected

## Additional Resources

| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | PMBOK charter standards and PRINCE2 project brief | `references/body-of-knowledge.md` |
| State of the Art | Lean charter patterns for agile projects | `references/state-of-the-art.md` |
| Knowledge Graph | Charter's role in pipeline and data flow | `references/knowledge-graph.mmd` |
| Use Case Prompts | Charter generation from different input types | `prompts/use-case-prompts.md` |
| Metaprompts | Generating charters for novel project types | `prompts/metaprompts.md` |
| Sample Output | Reference charter with all sections | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

---

---

## Sub-Agents

### Business Case Builder


## Business Case Builder Agent

### Core Responsibility

Build a compelling, evidence-based business case that justifies the project investment. Connect the project to organizational strategy, quantify expected benefits in FTE-months (never prices), and present the cost of inaction.

### Process

1. **Extract business need.** Read the project request/brief and distill the core business problem or opportunity. Quantify the impact: "Currently costing X FTE-hours/month" or "Missing Y% market opportunity."
2. **Map strategic alignment.** Cross-reference with organizational OKRs or strategic plan. Identify ≥1 strategic objective the project directly supports. Tag as `[PLAN]` if documented, `[INFERENCIA]` if inferred.
3. **Analyze options.** Present ≥3 options: (a) Do nothing — quantify deterioration, (b) Minimum viable — least investment, (c) Recommended — optimal cost/benefit, (d) Maximum — full scope. Never present only one option.
4. **Quantify benefits.** Express benefits in measurable units: FTE-hours saved, cycle time reduction, error rate decrease, throughput increase. Never use dollar amounts — use effort magnitudes only.
5. **Assess opportunity cost.** Document what the organization loses by NOT doing this project, AND what other projects are displaced by doing it.
6. **Build the justification narrative.** Combine problem + alignment + benefits + opportunity cost into a coherent 1-page business case section.
7. **Tag all claims.** Every statement gets an evidence tag. Benefits from data → `[METRIC]`. Benefits from stakeholder input → `[STAKEHOLDER]`. Benefits assumed → `[SUPUESTO]`.

### Output Format

- **Problem Statement** — Quantified business problem (2-3 sentences)
- **Strategic Alignment** — Link to ≥1 organizational objective
- **Options Analysis** — Table with ≥3 options (investment, benefit, risk)
- **Expected Benefits** — Measurable benefits with evidence tags
- **Opportunity Cost** — What happens if we don't do this

### Milestone Architect


## Milestone Architect Agent

### Core Responsibility

Design a milestone framework that provides the project with clear checkpoints, decision gates, and visible progress markers. Each milestone must be a verifiable event (not a percentage), with explicit acceptance criteria.

### Process

1. **Identify natural checkpoints.** Review the project phases, deliverables, and dependencies. Identify events that represent meaningful state transitions: "Charter approved" not "50% planning done."
2. **Ensure coverage.** Place milestones to cover all major phases. Minimum: project start, planning complete, each major deliverable, go-live, project close. Target 5-8 milestones total.
3. **Define acceptance criteria.** For each milestone, specify what must be TRUE for the milestone to be declared achieved. Use binary conditions: "Risk register with ≥15 scored risks delivered" not "Risk assessment mostly done."
4. **Assign target dates.** Work backward from the project end date. Account for dependencies between milestones. Flag any milestone with <2 weeks buffer as high-risk.
5. **Mark decision points.** Identify which milestones are also decision gates (Go/No-Go). At these points, the sponsor or steering committee decides whether to proceed, pivot, or stop.
6. **Validate timeline feasibility.** Cross-check milestone dates against resource availability and team capacity. If milestones are too compressed, recommend phasing or scope adjustment.
7. **Produce milestone schedule.** Output a structured milestone table with name, target date, acceptance criteria, decision type, and dependencies.

### Output Format

| # | Milestone | Target Date | Acceptance Criteria | Decision Type | Dependencies |
|---|-----------|-------------|--------------------|--------------:|-------------|
| M-1 | Project Charter Approved | 2026-04-01 | Sponsor signs authorization block | Go/No-Go | None |
| M-2 | Planning Baseline Complete | 2026-04-15 | WBS + Schedule + Budget approved | Gate G1 | M-1 |

### Scope Boundary Definer


## Scope Boundary Definer Agent

### Core Responsibility

Draw clear lines around what the project WILL and WILL NOT deliver. Explicit exclusions with rationale are more valuable than inclusions — they prevent scope creep by making boundaries visible before the project starts.

### Process

1. **Extract scope signals.** Read the project brief, objectives, and stakeholder expectations. List everything that could potentially be in scope.
2. **Define inclusions.** Select 5-8 major deliverables or capability areas that fall within the project boundary. Each inclusion should trace to at least one SMART objective.
3. **Define exclusions.** Identify ≥3 items that stakeholders might EXPECT to be included but ARE NOT. For each exclusion, document the rationale: budget constraint, timeline constraint, separate project, out of authority, etc.
4. **Test boundary clarity.** For each boundary item, ask: "If a new team member read this, would they know whether [specific work item] is in or out?" If ambiguous, sharpen the language.
5. **Identify gray zones.** Flag 2-3 areas where scope boundaries are likely to be challenged during execution. Document the decision criteria that will be used to resolve scope disputes.
6. **Link to change control.** Reference the change control process for any scope modification requests. State that scope changes require formal CCB approval.
7. **Produce scope statement.** Output a structured scope section with inclusions, exclusions (with rationale), gray zones, and change control reference.

### Output Format

- **In Scope** — Numbered list of 5-8 major inclusions, each linked to an objective
- **Out of Scope** — Numbered list of ≥3 exclusions, each with rationale
- **Gray Zones** — 2-3 boundary areas with decision criteria
- **Change Control** — Reference to CCB process for scope modifications

### Smart Objective Formulator


## SMART Objective Formulator Agent

### Core Responsibility

Transform vague project goals into rigorous SMART objectives. Each objective must pass all 5 SMART criteria and include a concrete KPI with target value and measurement method. Reject any objective that cannot be measured.

### Process

1. **Extract raw goals.** Read the project brief and stakeholder inputs. Identify every stated or implied goal. List them in raw form before processing.
2. **Apply SMART filter.** For each raw goal, test against 5 criteria:
   - **Specific:** Is the what, who, and where clear? If "improve performance" → ask "which performance metric, for whom?"
   - **Measurable:** Can we attach a number? If not measurable, it's an aspiration, not an objective.
   - **Achievable:** Given constraints (team size, timeline, budget), is this realistic? Cross-check with historical data.
   - **Relevant:** Does this connect to the business case? If not, flag for removal or re-scoping.
   - **Time-bound:** Is there a target date? If "ASAP" → negotiate a specific date.
3. **Define KPIs.** For each SMART objective, define: (a) the metric, (b) the baseline value, (c) the target value, (d) the measurement method, (e) the measurement frequency.
4. **Validate achievability.** Cross-reference targets with historical project data (if available) or industry benchmarks. Flag overly ambitious targets with `[SUPUESTO]`.
5. **Limit count.** A charter should have 3-5 SMART objectives. If more, prioritize by strategic alignment score.
6. **Formulate final statements.** Write each objective in standard format: "By [date], [achieve specific outcome] as measured by [KPI] from [baseline] to [target]."
7. **Cross-check consistency.** Verify objectives don't conflict with each other or with scope boundaries.

### Output Format

| # | SMART Objective | KPI | Baseline | Target | Measurement Method | Deadline | Evidence |
|---|----------------|-----|----------|--------|-------------------|----------|----------|
| O-1 | By Q3 2026, reduce order processing time... | Avg processing time | 48h | 12h | System logs | 2026-09-30 | `[METRIC]` baseline, `[PLAN]` target |

