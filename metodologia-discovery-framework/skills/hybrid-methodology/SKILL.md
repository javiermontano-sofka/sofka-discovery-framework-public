---
name: apex-hybrid-methodology
description: >
  Use when the user asks to "design a hybrid approach", "combine agile and waterfall",
  "create hybrid methodology", "integrate iterative and sequential delivery",
  "build adaptive lifecycle", or mentions hybrid PM, water-scrum-fall, bimodal,
  agile-traditional blend, adaptive lifecycle. Triggers on: designs a hybrid methodology,
  maps components to delivery approaches, creates interface agreements between agile and
  waterfall, unifies governance across methodologies, blends iterative and predictive planning.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Hybrid Methodology Design

**TL;DR**: Designs a hybrid project management approach that combines agile and traditional practices based on project characteristics. Maps which components use predictive planning (fixed scope, compliance) and which use adaptive delivery (uncertain scope, rapid feedback), creating a coherent integrated methodology.

## Principio Rector
La mayoría de los proyectos reales no son puramente ágiles ni puramente predictivos. El diseño híbrido no es "un poco de cada uno" — es la aplicación deliberada del enfoque correcto al componente correcto. La interfaz entre componentes ágiles y predictivos es donde fracasan la mayoría de los híbridos: aquí es donde el diseño intencional es crítico.

## Assumptions & Limits
- Assumes methodology assessment has been completed or project components are already classified [SUPUESTO]
- Assumes the organization has capacity for dual governance — teams trained in both approaches [SUPUESTO]
- Breaks if all project components are equally uncertain or equally certain — use pure agile or pure waterfall instead [PLAN]
- Scope limited to methodology design; implementation and team coaching are separate skills [PLAN]
- Does not override contractual methodology requirements — adapts within constraints [PLAN]

## Usage
```bash
/pm:hybrid-methodology $PROJECT_NAME --ratio=60agile-40waterfall
/pm:hybrid-methodology $PROJECT_NAME --components=auto-classify
/pm:hybrid-methodology $PROJECT_NAME --governance=unified --reporting=integrated
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT_NAME` | Yes | Target project identifier |
| `--ratio` | No | Approximate agile-to-waterfall ratio |
| `--components` | No | `auto-classify` / `manual` (default: `auto-classify`) |
| `--governance` | No | `unified` / `separate` (default: `unified`) |

## Service Type Routing
`{TIPO_PROYECTO}`: Transformation uses agile for product + waterfall for change management; Portfolio uses waterfall for configuration + agile for customization; Waterfall uses waterfall for procurement + agile for testing and deployment.

## Before Designing Hybrid
1. Read `methodology-assessment` — confirm hybrid is the recommended approach [PLAN]
2. Glob `*component*` and `*wbs*` — identify project components to classify by approach [PLAN]
3. Read organizational agile maturity — ensure teams can execute the agile components [STAKEHOLDER]
4. Review contractual and regulatory constraints — some components may be forced into predictive [PLAN]

## Entrada (Input Requirements)
- Methodology assessment results
- Project component analysis (which parts are certain vs. uncertain)
- Organizational agile maturity level
- Stakeholder methodology preferences
- Contractual or regulatory constraints

## Proceso (Protocol)
1. **Component analysis** — Classify project components by scope certainty, feedback need, and risk
2. **Approach mapping** — Assign predictive or adaptive approach per component
3. **Interface design** — Define handoff points between agile and waterfall components
4. **Governance model** — Create unified governance that respects both approaches
5. **Reporting integration** — Design reporting that shows both sprint progress and baseline tracking
6. **Ceremony blend** — Define which ceremonies apply to which components
7. **Tool integration** — Ensure tooling supports both workflows
8. **Change management** — Define how change control works across boundaries
9. **Metrics unification** — Create integrated metrics (velocity + EVM)
10. **Rollout plan** — Phased implementation of hybrid approach

## Edge Cases
1. **All components classified as same approach** — Question the hybrid need; if genuinely uniform, recommend pure methodology and document why hybrid was not selected.
2. **Interface handoffs creating 2+ week delays** — Redesign interface cadence; consider buffer sprints or integration sprints at boundaries.
3. **Stakeholders demand single status format** — Create translation layer that maps sprint velocity to milestone percentage and EVM indices to sprint health.
4. **Team members switching between agile and waterfall roles** — Define clear context-switching protocols; limit role-switching to planned boundaries, not daily.

## Example: Good vs Bad

**Good Hybrid Design:**
| Attribute | Value |
|-----------|-------|
| Component mapping | 8 components classified: 5 adaptive, 3 predictive [PLAN] |
| Interface agreements | 3 handoff points with defined data contracts [PLAN] |
| Unified governance | Single steering committee with dual reporting view [STAKEHOLDER] |
| Integrated metrics | Sprint velocity feeds milestone tracking; EVM covers predictive [METRIC] |
| Ceremony calendar | Sprints for adaptive; phase reviews for predictive; integration demo monthly [SCHEDULE] |

**Bad Hybrid Design:**
"We do Scrum for development and waterfall for everything else." — No interface design, no unified governance, no integrated reporting. Teams operate in silos, handoffs create delays, and no one has a coherent view of project health.

## Salida (Deliverables)
- `02_hybrid_methodology_{proyecto}_{WIP}.md` — Hybrid methodology design
- Component-approach mapping matrix
- Interface agreement between agile and waterfall components
- Unified governance model
- Integrated reporting template

## Validation Gate
- [ ] Every project component assigned to either predictive or adaptive — no unclassified components
- [ ] Interface handoffs precisely defined with data contracts and timing
- [ ] Governance coherent across both approaches — single authority chain
- [ ] Integrated reporting shows both sprint and milestone progress in one view
- [ ] No ambiguity about which approach applies to which component
- [ ] Approach selection traces to component characteristics, not team preference
- [ ] Interface risks explicitly identified and managed
- [ ] Ceremony calendar avoids meeting overload (total ceremony time below 20% of capacity)
- [ ] Stakeholders understand the rationale for each component's approach assignment
- [ ] Each approach remains true to its principles — agile components are genuinely agile

## Escalation Triggers
- Team confusion about which approach applies
- Interface handoffs causing delays
- Governance overhead exceeding benefit
- Stakeholders demanding pure approach for all components

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

---

---

## Sub-Agents

### Ceremony Harmonizer


## Ceremony Harmonizer Agent

### Core Responsibility

Design a unified ceremony calendar that eliminates redundancy and maximizes value from both agile and predictive rituals. Ensure that standups do not duplicate status meetings, retrospectives produce actionable inputs for the lessons learned register, sprint reviews satisfy stage-gate evidence requirements, and team members never attend more than two overlapping ceremonies covering the same ground.

### Process

1. **Inventory existing ceremonies.** Catalog all ceremonies currently practiced or required across agile and predictive workstreams: daily standups, sprint planning, sprint review, retrospective, backlog refinement, status meetings, milestone reviews, stage-gate reviews, steering committee meetings, and lessons learned sessions. For each, document: purpose, frequency, attendees, duration, and output artifact.
2. **Detect overlaps and conflicts.** Compare ceremony purposes side-by-side and flag redundancies: sprint review vs. milestone review (both demonstrate completed work), retrospective vs. lessons learned session (both capture improvement opportunities), daily standup vs. weekly status meeting (both communicate progress). Score each overlap as Full (merge), Partial (bridge), or None (keep separate).
3. **Design merged ceremonies.** For Full overlaps, create a single ceremony that serves both purposes. Example: Sprint Review + Stage-Gate becomes "Increment Review Gate" — first 30 minutes demonstrate working software (agile), last 15 minutes evaluate gate criteria checklist (predictive). Document the merged format with agenda templates.
4. **Build bridge artifacts.** For Partial overlaps, define bridge artifacts that flow from one ceremony to another. Example: retrospective action items auto-populate the lessons learned register with source = "Retro Sprint X"; standup blockers feed the weekly status report risk section. Define the translation format and responsible party.
5. **Calibrate cadences.** Optimize ceremony frequency to avoid fatigue. Rules: no more than 15% of team capacity spent in ceremonies; no ceremony without a clear output artifact; bi-weekly ceremonies preferred over weekly when possible. Build a capacity-weighted ceremony calendar showing hours per role per week.
6. **Create ceremony cards.** For each ceremony in the harmonized calendar, produce a ceremony card: name, purpose (1 sentence), frequency, duration cap, required attendees, optional attendees, input artifacts, output artifacts, and facilitator role.
7. **Deliver harmonized ceremony calendar.** Output a visual weekly/bi-weekly calendar (Mermaid Gantt or table), the complete set of ceremony cards, bridge artifact mappings, and a ceremony overhead budget showing % of team capacity consumed.

### Output Format

| Ceremony | Source | Frequency | Duration | Attendees | Output Artifact | Bridge To |
|----------|--------|-----------|----------|-----------|----------------|-----------|
| Increment Review Gate | Sprint Review + Stage-Gate | Bi-weekly | 45 min | PO, Team, Sponsor | Accepted increment + Gate checklist | Milestone tracker |
| Retro → Lessons Learned | Retrospective + LL Session | Bi-weekly | 60 min | Team, PM | Action items + Lessons register entries | Lessons register |
| Daily Sync | Standup | Daily | 15 min | Team | Blocker list | Weekly status report |
| Planning Alignment | Sprint Planning + Phase Planning | Bi-weekly | 90 min | PO, Team, PM | Sprint backlog + Phase plan update | Schedule baseline |

### Governance Bridge Builder


## Governance Bridge Builder Agent

### Core Responsibility

Design and implement governance mechanisms that allow agile and predictive workstreams to coexist under a single project reporting structure. Translate between agile artifacts (velocity, burndown, sprint goals) and predictive artifacts (milestones, EVM indices, stage-gate reviews) so that steering committees receive a coherent view of project health regardless of which lifecycle approach each workstream uses.

### Process

1. **Map sprint boundaries to milestones.** Align sprint cadences with the project's milestone schedule. Define which sprints contribute to which milestones, creating a sprint-to-milestone traceability matrix. For predictive workstreams, map phase-gate dates to the same timeline. Ensure no milestone depends on an unbounded agile backlog without a "done" definition.
2. **Design EVM integration formulas.** Define how agile metrics feed into Earned Value Management: Planned Value = story points planned per sprint × cost-per-point; Earned Value = story points accepted × cost-per-point; Actual Cost = actual hours × loaded rate. Document conversion assumptions with `[SUPUESTO]` tags and validate with finance.
3. **Establish dual reporting cadences.** Create two synchronized reporting rhythms: (a) Agile cadence — sprint reviews every 2 weeks, daily standups, retrospectives; (b) Predictive cadence — monthly status reports, quarterly steering reviews, milestone gate reviews. Define which metrics flow from agile into predictive reports and vice versa.
4. **Build unified dashboard schema.** Design a single dashboard that presents both agile and predictive health indicators: velocity trend alongside SPI/CPI, burndown alongside % milestone completion, sprint goal achievement alongside deliverable acceptance rate. Use RAG status normalization so both worlds use the same thresholds.
5. **Define escalation bridges.** Create escalation paths that translate agile impediments into predictive risk language and vice versa. A blocked epic becomes a risk event with P×I scoring; a milestone slip triggers a sprint re-planning session. Document trigger thresholds for each direction.
6. **Establish change control harmonization.** Define when agile scope changes (backlog re-prioritization) require formal change control and when predictive change requests can be absorbed into sprint planning. Set thresholds: changes affecting ≤ X story points are handled in sprint planning; changes affecting milestones or budget require Change Control Board approval.
7. **Deliver governance bridge document.** Output a complete governance bridge specification including: sprint-to-milestone map, EVM conversion formulas, reporting calendar, dashboard wireframe, escalation matrix, and change control thresholds.

### Output Format

| Governance Element | Agile Side | Predictive Side | Bridge Mechanism | Sync Cadence |
|-------------------|-----------|-----------------|-----------------|-------------|
| Progress Tracking | Velocity + Burndown | SPI / CPI | Story points → EV conversion | Per sprint close |
| Scope Control | Backlog re-prioritization | Change Control Board | Threshold: > 20 SP or milestone impact → CCB | As needed |
| Risk Management | Impediment board | Risk Register | Impediment → Risk event mapping | Weekly |
| Quality Assurance | Definition of Done | Stage-Gate criteria | DoD mapped to gate checklist items | Per gate |
| Stakeholder Reporting | Sprint Review | Monthly Status Report | Sprint metrics aggregated into monthly report | Bi-weekly → Monthly |

### Hybrid Anti Pattern Detector


## Hybrid Anti-Pattern Detector Agent

### Core Responsibility

Systematically scan a project's hybrid methodology implementation for anti-patterns that erode the benefits of both agile and predictive approaches. Detect structural dysfunctions — where teams claim hybrid but practice neither methodology well — and provide specific, actionable remediation paths. Operate as an early-warning system that catches methodology decay before it manifests as schedule slips or quality failures.

### Process

1. **Collect methodology evidence.** Gather artifacts from the current implementation: ceremony calendars, reporting templates, governance documents, team surveys, sprint metrics, milestone reports, and change logs. For each artifact, tag as `[DOC]`, `[METRIC]`, or `[STAKEHOLDER]` based on source. Flag missing artifacts as potential evidence of anti-patterns.
2. **Scan for water-scrum-fall.** Check for the hallmark pattern: requirements gathered upfront in bulk (waterfall), development done in sprints (scrum), testing and deployment done sequentially at the end (waterfall). Indicators: no working software delivered until final sprints, all "sprint reviews" are demos of partial features with no stakeholder feedback loop, backlog is a repackaged requirements document with no re-prioritization.
3. **Detect agile-in-name-only (AINO).** Look for teams using agile vocabulary without agile principles: sprints exist but scope is fixed by management, retrospectives happen but produce no changes, standups are status reports to managers rather than team coordination, "product owner" has no authority to prioritize. Score AINO severity on a 4-point scale (Cosmetic, Structural, Cultural, Terminal).
4. **Measure ceremony overhead.** Calculate total ceremony hours per team member per sprint. Flag if > 15% of available capacity. Identify zombie ceremonies (recurring meetings with no clear output or decision), ceremony duplication (same information presented in multiple forums), and attendance bloat (> 50% of attendees are observers, not participants).
5. **Identify governance conflicts.** Detect cases where agile and predictive governance requirements contradict: change control boards that block sprint re-prioritization, EVM baselines that penalize agile scope flexibility, stage-gate criteria that require documents agile teams don't produce, dual approval chains that create bottlenecks.
6. **Classify and prioritize findings.** For each detected anti-pattern, classify by: type (Structural, Cultural, Governance, Process), severity (Critical, High, Medium, Low), and remediation effort (Quick Win, Sprint-sized, Initiative-level). Provide specific remediation actions, not generic advice. Reference the methodology-mixer and governance-bridge-builder agents for structural fixes.
7. **Deliver anti-pattern assessment report.** Output a findings report with: executive summary, anti-pattern catalog with evidence, severity heat map, prioritized remediation roadmap, and health score (0-100) for the hybrid implementation.

### Output Format

| ID | Anti-Pattern | Type | Severity | Evidence | Remediation | Effort |
|----|-------------|------|----------|----------|-------------|--------|
| AP-001 | Water-Scrum-Fall | Structural | Critical | No working software until sprint 8 of 10 `[METRIC]` | Introduce vertical slicing; deliver to staging every sprint | Sprint-sized |
| AP-002 | Zombie Retrospective | Process | Medium | Last 4 retro action items unresolved `[DOC]` | Assign owners + track in sprint backlog | Quick Win |
| AP-003 | Dual Approval Bottleneck | Governance | High | CCB + PO both approve scope changes, avg 5-day delay `[METRIC]` | Define threshold: < 13 SP = PO authority, ≥ 13 SP = CCB | Quick Win |
| AP-004 | AINO — Fixed-Scope Sprints | Cultural | Critical | Sprint scope dictated by PMO, no PO authority `[STAKEHOLDER]` | Empower PO with prioritization rights; PMO sets outcomes, not tasks | Initiative-level |

### Methodology Mixer


## Methodology Mixer Agent

### Core Responsibility

Analyze each project phase, workstream, and deliverable to assign the optimal lifecycle approach — agile, predictive, or iterative-incremental — by evaluating requirements volatility, stakeholder risk appetite, regulatory mandates, and team capability. The goal is a tailored hybrid topology where every workstream uses the approach that maximizes value delivery while honoring constraints, not a one-size-fits-all compromise.

### Process

1. **Inventory workstreams.** Decompose the project into discrete workstreams or phases (e.g., discovery, design, development, integration, testing, deployment, compliance). For each, capture: primary deliverable, lead team, upstream/downstream dependencies, and regulatory touchpoints.
2. **Assess requirements stability.** For each workstream, score requirements volatility on a 5-point scale (1 = fully stable/contractual, 5 = exploratory/unknown). Workstreams scoring ≥ 3 are candidates for agile; ≤ 2 are candidates for predictive. Document the evidence behind each score using `[STAKEHOLDER]` or `[DOC]` tags.
3. **Evaluate risk and compliance constraints.** Identify workstreams subject to regulatory audit trails, contractual milestones, or fixed-scope commitments. Flag these as requiring predictive governance overlays even if the execution approach is agile. Cross-reference with the project's risk register for severity alignment.
4. **Map team capability.** Assess each team's agile maturity (experienced vs. novice), co-location model (co-located, distributed, hybrid), and tooling readiness. Teams with low agile maturity on high-volatility workstreams require coaching plans or guardrails.
5. **Assign lifecycle approach.** For each workstream, assign one of: Pure Agile (Scrum/Kanban), Predictive (Waterfall/Stage-Gate), Iterative-Incremental (time-boxed iterations with baselined scope), or Agile-with-Predictive-Overlay (agile execution + milestone gates). Document the rationale in a decision matrix.
6. **Define integration seams.** Identify handoff points between workstreams using different approaches. For each seam, define: sync cadence, artifact translation rules (e.g., user stories → requirements traceability), and escalation triggers when approaches conflict.
7. **Deliver hybrid topology map.** Output a visual topology (Mermaid diagram) showing all workstreams, their assigned approaches, integration seams, and governance overlays. Include a decision matrix table with scoring rationale.

### Output Format

| Workstream | Volatility (1-5) | Regulatory | Team Maturity | Assigned Approach | Rationale | Evidence |
|-----------|------------------|-----------|--------------|-------------------|-----------|----------|
| Discovery | 5 | None | High | Pure Agile (Scrum) | Exploratory phase, experienced team | `[STAKEHOLDER]` |
| Compliance Module | 1 | SOX audit trail | Medium | Predictive + Gate overlay | Fixed regulatory requirements | `[DOC]` |
| Core Dev | 4 | None | High | Agile (Scrum) | Volatile requirements, strong team | `[METRIC]` |
| Integration | 3 | Contractual milestone | Medium | Iterative-Incremental | Dependencies require coordination | `[PLAN]` |

