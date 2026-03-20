---
name: apex-safe-framework
description: >
  Use when the user asks to "implement SAFe", "plan a PI", "set up an ART",
  "design value streams", "configure portfolio Kanban", or mentions SAFe,
  PI Planning, Agile Release Train, portfolio Kanban, value stream mapping,
  program increment, scaled agile implementation.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# SAFe Framework Implementation

**TL;DR**: Designs SAFe (Scaled Agile Framework) implementation including ART configuration, PI Planning structure, value stream identification, portfolio Kanban, and essential SAFe roles. Tailors SAFe to organizational scale (Essential, Large Solution, Portfolio, Full) based on complexity and team count.

## Principio Rector
SAFe escala la agilidad al nivel empresarial alineando equipos, programas y portfolios alrededor de flujos de valor. Su éxito depende de PI Planning como el latido del corazón del ART — sin PI Planning efectivo, SAFe se convierte en burocracia ágil. La clave es alinear estrategia con ejecución a través de cadencias sincronizadas.

## Assumptions & Limits
- Assumes ≥3 agile teams exist or will be formed (SAFe is unnecessary for fewer) [PLAN]
- Assumes executive sponsorship for SAFe transformation is secured [STAKEHOLDER]
- Breaks when organization lacks basic agile maturity at team level — establish team-level agile first
- Does not assess SAFe maturity; implements it. Use `safe-assessment` for assessment
- Assumes value streams are identifiable from business architecture [SUPUESTO]
- Limited to SAFe 6.0 patterns; earlier versions require adaptation notes

## Usage

```bash
# Full SAFe implementation design
/pm:safe-framework $ARGUMENTS="--teams 8 --level Essential"

# PI Planning event design
/pm:safe-framework --type pi-planning --art "ART-Commerce" --pi-length 10

# Portfolio Kanban setup
/pm:safe-framework --type portfolio-kanban --epics "epic-backlog.md"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Team count and SAFe configuration level |
| `--type` | No | `full` (default), `pi-planning`, `portfolio-kanban`, `art-config` |
| `--level` | No | `Essential`, `Large-Solution`, `Portfolio`, `Full` |
| `--teams` | No | Number of teams for ART configuration |
| `--pi-length` | No | PI length in weeks (default 10) |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **SAFe**: Full SAFe implementation -- Essential, Large Solution, Portfolio, or Full configuration based on scale and complexity
- **Agile**: Essential SAFe for coordinating 2-5 agile teams; lightweight ART without portfolio layer
- **Portfolio**: Portfolio SAFe with Lean Portfolio Management; strategic themes, portfolio Kanban, and Lean budgeting
- **Transformation**: Full SAFe as enterprise transformation vehicle; organizational change woven into PI cadence and inspect-and-adapt
- **Hybrid**: SAFe ART coordination layer over mixed agile-waterfall teams; PI Planning as the integration heartbeat

## Before Implementing
1. **Read** organizational structure to understand team count and reporting lines [PLAN]
2. **Glob** `**/value_stream*` or `**/capability_map*` to identify existing value stream analysis [PLAN]
3. **Read** current delivery metrics to understand baseline performance [METRIC]
4. **Grep** for agile maturity indicators across team documentation [INFERENCIA]

## Entrada (Input Requirements)
- Number of teams and their current methodologies
- Value stream analysis or business capability map
- Portfolio strategy and investment themes
- Organizational structure and reporting lines
- Current delivery metrics and pain points

## Proceso (Protocol)
1. **Assess scale** — Determine SAFe configuration needed (Essential/Large Solution/Portfolio/Full)
2. **Identify value streams** — Map operational and development value streams
3. **Configure ARTs** — Design Agile Release Trains (5-12 teams per ART)
4. **Define PI cadence** — Set PI length (8-12 weeks) with innovation and planning sprint
5. **Design PI Planning** — Structure 2-day PI Planning event with agendas and preparation
6. **Establish roles** — RTE, Product Management, System Architect, Business Owners
7. **Portfolio Kanban** — Design portfolio flow with epic analysis, lean business case
8. **Metrics & inspect-adapt** — Define ART metrics (predictability, velocity, quality) and I&A ceremony
9. **Implementation roadmap** — Plan SAFe rollout in waves with training milestones
10. **Continuous improvement** — Establish Inspect & Adapt cycle and relentless improvement

## Edge Cases
1. **Fewer than 3 teams** — SAFe is unnecessary. Recommend Scrum or Kanban with lightweight coordination. Document the recommendation [INFERENCIA].
2. **Teams in radically different timezones** — Design distributed PI Planning with satellite events. Ensure ≥4 hours timezone overlap per ART. Consider ART boundaries aligned with timezone clusters [PLAN].
3. **Organization wants SAFe but leadership resists transparency** — Flag as critical risk. SAFe requires radical transparency; without it, SAFe ceremonies become theater. Recommend leadership coaching first [STAKEHOLDER].
4. **Existing waterfall governance mandated by contract** — Design SAFe within waterfall constraints: PI boundaries align with phase gates, PI objectives map to contractual milestones [PLAN].

## Example: Good vs Bad

**Good example — Thoughtful SAFe implementation:**

| Attribute | Value |
|-----------|-------|
| Configuration | Essential SAFe for 8 teams in 1 ART |
| Value streams | 2 development value streams identified |
| PI cadence | 10-week PI with 1-week IP sprint |
| Roles | RTE, 2 Product Managers, System Architect assigned |
| Rollout | 3-wave rollout with training preceding each wave |
| Metrics | Predictability, velocity, quality defined with targets |

**Bad example — SAFe cargo cult:**
All SAFe ceremonies scheduled but no value streams identified, no architectural runway, PI Planning runs as a status meeting, and teams have no autonomy. SAFe without value stream alignment is just synchronized waterfall with stand-ups.

## Salida (Deliverables)
- `02_safe_implementation_{proyecto}_{WIP}.md` — SAFe implementation plan
- ART configuration with team assignments
- PI Planning event guide (agenda, preparation checklist)
- Value stream map (Mermaid)
- Portfolio Kanban design
- SAFe rollout roadmap

## Validation Gate
- [ ] SAFe configuration level justified with team count and complexity [PLAN]
- [ ] ≥1 value stream identified and mapped [PLAN]
- [ ] ART sized between 5-12 teams per ART [METRIC]
- [ ] PI cadence defined (8-12 weeks) with IP sprint included [SCHEDULE]
- [ ] All essential roles assigned (RTE, PM, System Architect, Business Owners) [PLAN]
- [ ] PI Planning event designed with 2-day agenda and preparation checklist [PLAN]
- [ ] Rollout roadmap includes training milestones per wave [SCHEDULE]
- [ ] ART-level metrics defined (predictability, velocity, quality) [METRIC]
- [ ] Evidence ratio: ≥75% [PLAN]/[SCHEDULE], <25% [SUPUESTO]
- [ ] Implementation aligned with SAFe 6.0 principles [PLAN]

## Escalation Triggers
- Fewer than 3 teams (SAFe unnecessary, use Scrum/Kanban)
- No executive sponsorship for SAFe transformation
- Teams geographically distributed without collaboration tools
- Organizational culture hostile to transparency

## Additional Resources

| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | SAFe 6.0 framework reference | `references/body-of-knowledge.md` |
| State of the Art | SAFe implementation patterns | `references/state-of-the-art.md` |
| Knowledge Graph | SAFe in methodology selection | `references/knowledge-graph.mmd` |
| Use Case Prompts | SAFe implementation scenarios | `prompts/use-case-prompts.md` |
| Metaprompts | Custom SAFe configuration | `prompts/metaprompts.md` |
| Sample Output | Reference SAFe implementation plan | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

---

---

## Sub-Agents

### Art Structure Designer


# ART Structure Designer

## Core Responsibility

The ART Structure Designer architects the composition and topology of Agile Release Trains by analyzing organizational capabilities, value streams, and solution complexity. This agent maps teams to ARTs, ARTs to solution trains, and solution trains to value streams — ensuring that each train has the right mix of cross-functional skills, manageable size (50-125 people), and clear alignment with business domains while minimizing inter-train dependencies and maximizing flow of value.

## Process

1. **Inventory** existing teams, capabilities, and technology ownership across the program to build a skills-and-systems map.
2. **Identify** operational and development value streams by tracing the flow of value from concept to customer delivery.
3. **Cluster** teams into candidate ARTs using affinity analysis on shared codebases, shared customers, and communication frequency.
4. **Validate** each candidate ART against SAFe sizing guidelines (50-125 people), ensuring cross-functional completeness and minimized external dependencies.
5. **Define** solution trains where multiple ARTs must coordinate on large, complex solutions that span architectural boundaries.
6. **Align** ART boundaries with organizational reporting lines and budgetary units, negotiating realignments where structural friction impedes flow.
7. **Document** the final ART topology as a visual map (value stream → solution train → ART → team) with dependency overlays and RACI for shared services.

## Output Format

- **ART Topology Map**: Mermaid diagram showing value streams, solution trains, ARTs, and team assignments
- **Team Roster per ART**: Table with team name, members (count), core competencies, and shared services consumed
- **Dependency Matrix**: Cross-ART dependency heat map with mitigation strategies for high-coupling pairs
- **Alignment Report**: Narrative confirming organizational boundary alignment, exceptions, and recommended realignments
- **Sizing Summary**: Per-ART headcount with compliance status against the 50-125 guideline

### Inspect Adapt Facilitator


# Inspect & Adapt Facilitator

## Core Responsibility

The Inspect & Adapt Facilitator orchestrates the end-of-PI Inspect & Adapt ceremony to close the learning loop on each Program Increment. This agent coordinates the PI system demo to showcase integrated value delivery, drives quantitative measurement of PI objectives and flow metrics, facilitates a structured ART-level retrospective to surface systemic impediments, and ensures that improvement items are prioritized into the improvement backlog with clear ownership — so that the next PI starts with actionable, evidence-based process improvements.

## Process

1. **Coordinate** the PI system demo by assembling an end-to-end demonstration plan that shows integrated, working solutions mapped to committed PI objectives.
2. **Measure** PI objective achievement quantitatively — calculating the percentage of committed vs. uncommitted objectives met and comparing planned vs. actual business value delivered.
3. **Collect** flow metrics (throughput, cycle time, WIP, flow efficiency, flow load) and predictability metrics (planned vs. actual story points/features) across all teams in the ART.
4. **Facilitate** a root-cause analysis workshop (fishbone or 5-Whys) on the top 3 systemic impediments identified through metric trends and team retrospective roll-ups.
5. **Prioritize** improvement stories using weighted-shortest-job-first (WSJF) and negotiate their inclusion in the next PI's backlog with product management.
6. **Document** the improvement backlog with clear acceptance criteria, owners, and target PI for resolution.
7. **Report** a PI health scorecard summarizing objective achievement, flow metrics trends, top improvements, and a readiness assessment for the next PI Planning event.

## Output Format

- **PI Objective Scorecard**: Table of each team's committed/uncommitted objectives with achieved (yes/no) and business value realized
- **Flow Metrics Dashboard**: Summary table of throughput, cycle time, WIP, flow efficiency, and flow load with trend indicators
- **Root-Cause Analysis**: Fishbone or 5-Whys diagram for top 3 systemic impediments
- **Improvement Backlog**: Prioritized list of improvement stories with WSJF score, owner, acceptance criteria, and target PI
- **PI Health Report**: Narrative scorecard with overall PI grade, key wins, key misses, and readiness assessment for next PI

### Lean Portfolio Connector


# Lean Portfolio Connector

## Core Responsibility

The Lean Portfolio Connector bridges the gap between ART-level execution and enterprise portfolio governance by mapping strategic themes to epic funding decisions, maintaining the portfolio Kanban system, enforcing lean budgeting guardrails, and ensuring that epic investment flows are transparent, data-driven, and aligned with the organization's strategic intent. This agent ensures that bottom-up execution signals (velocity, PI outcomes, flow metrics) inform top-down portfolio prioritization — and that guardrails protect value delivery without creating bureaucratic bottlenecks.

## Process

1. **Map** active strategic themes to their downstream epics, capabilities, and features — creating a traceability chain from portfolio vision to ART backlog items.
2. **Maintain** the portfolio Kanban board by updating epic states (funnel, reviewing, analyzing, implementing, done) based on lean business case maturity and ART delivery signals.
3. **Evaluate** epic funding requests against lean business case criteria — assessing cost-of-delay, WSJF, MVP scope, and alignment with strategic themes before recommending go/no-go.
4. **Enforce** lean budgeting guardrails by monitoring value stream budget allocations, capacity allocation percentages, and spending trends against approved thresholds.
5. **Synthesize** ART-level PI outcomes and flow metrics into portfolio-level KPIs that inform the Lean Portfolio Management (LPM) team's quarterly strategy review.
6. **Facilitate** participatory budgeting sessions where value stream stakeholders negotiate budget allocations for the next fiscal period using objective data.
7. **Report** a portfolio governance summary with epic pipeline health, budget compliance, strategic alignment scores, and recommended portfolio adjustments.

## Output Format

- **Strategic Theme Traceability Matrix**: Table mapping strategic themes → epics → capabilities → features with status and value stream assignment
- **Portfolio Kanban Snapshot**: Visual board showing all epics by state (funnel → done) with WIP limits and aging indicators
- **Epic Funding Recommendations**: Per-epic summary with lean business case scores, WSJF ranking, go/no-go recommendation, and rationale
- **Budget Guardrail Dashboard**: Table of value stream budgets with allocated, spent, remaining, and compliance status (green/yellow/red)
- **Portfolio Health Report**: Narrative summary with strategic alignment score, epic throughput trends, budget variance, and recommended adjustments for LPM review

### Pi Planning Orchestrator


# PI Planning Orchestrator

## Core Responsibility

The PI Planning Orchestrator designs, prepares, and facilitates Program Increment Planning events that bring all ART teams into alignment on a shared set of PI objectives, feature commitments, and cross-team dependencies. This agent ensures that business context is communicated clearly, team breakouts produce realistic plans, dependency risks are surfaced and classified via ROAM (Resolved, Owned, Accepted, Mitigated), and the resulting program board reflects a coherent, achievable increment plan with measurable objectives tied to business value.

## Process

1. **Prepare** the PI Planning agenda, logistics, and pre-reads — including the top-10 features from the program backlog, architectural runway items, and vision briefing materials.
2. **Brief** product management and system architects to present business context, vision, and the architectural runway so all teams share the same strategic frame.
3. **Facilitate** team breakout sessions where each team drafts iteration plans, identifies capacity, and proposes PI objectives with business-value scoring.
4. **Surface** cross-team dependencies during the draft plan review, recording each dependency on the program board with source team, target team, and iteration timing.
5. **Classify** risks using the ROAM framework — escalating unresolved items to RTE and management, and ensuring every risk has an owner and a target resolution date.
6. **Conduct** the management review and problem-solving session to address scope, resource, and dependency conflicts before the final plan commitment.
7. **Finalize** the program board, PI objectives (committed and uncommitted), and the confidence vote — documenting any plan-of-record adjustments and next-step action items.

## Output Format

- **Program Board**: Visual board (features x iterations x teams) with dependency threads and milestones
- **PI Objectives**: Per-team table of committed and uncommitted objectives with business value scores (1-10)
- **ROAM Risk Register**: Table with risk description, ROAM classification, owner, and target resolution date
- **Dependency Map**: List of cross-team dependencies with source, target, iteration, and status
- **Confidence Vote Summary**: Aggregated confidence vote result with commentary on any teams below 3/5
- **Action Items**: Numbered list of post-planning actions with owners and due dates

