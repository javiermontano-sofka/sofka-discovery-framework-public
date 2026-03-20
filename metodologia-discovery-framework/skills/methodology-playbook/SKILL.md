---
name: apex-methodology-playbook
description: >
  Use when the user asks to "create a methodology playbook", "define project ceremonies",
  "design cadences and rituals", "build a Definition of Done", "operationalize methodology",
  or mentions methodology playbook, ceremony design, cadence definition, methodology selection,
  DoD, project rituals. Triggers on: codifies methodology into actionable playbook, designs
  ceremonies with agendas and durations, creates Definition of Done per deliverable type,
  maps roles to ceremonies, produces ceremony calendar.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Methodology Playbook

**TL;DR**: Core Phase 4 deliverable that codifies the selected methodology into an actionable playbook: ceremonies with agendas and durations, cadences with frequencies and participants, Definition of Done per deliverable type, escalation protocols, and role responsibilities. Transforms methodology selection from a slide deck decision into an operational contract the team can execute.

## Principio Rector
Una metodología seleccionada pero no operacionalizada es un powerpoint, no un proceso. El playbook convierte la decisión metodológica en un contrato operativo con ceremonias concretas, cadencias definidas y criterios de completitud medibles. Si el equipo no puede abrir el playbook el lunes y saber exactamente qué hacer, el playbook falla.

## Assumptions & Limits
- Assumes methodology has been selected via `methodology-assessment` or stakeholder decision [SUPUESTO]
- Assumes team structure and availability are known for ceremony scheduling [STAKEHOLDER]
- Breaks if methodology selection was not evidence-based — playbook operationalizes a decision; it cannot fix a bad decision [PLAN]
- Scope limited to playbook creation; ongoing methodology coaching is separate [PLAN]
- Does not override organizational ceremony mandates — adapts within constraints [PLAN]

## Usage
```bash
/pm:methodology-playbook $PROJECT_NAME --methodology=scrum
/pm:methodology-playbook $PROJECT_NAME --methodology=hybrid --include=dod,ceremonies,cadences
/pm:methodology-playbook $PROJECT_NAME --methodology=safe --team-count=6
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT_NAME` | Yes | Target project identifier |
| `--methodology` | Yes | `scrum` / `kanban` / `safe` / `waterfall` / `hybrid` |
| `--include` | No | `dod` / `ceremonies` / `cadences` / `all` (default: `all`) |
| `--team-count` | No | Number of teams for multi-team ceremony design |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Sprint ceremonies (planning, daily, review, retro), backlog cadences, DoD per story type
- **Waterfall**: Phase-gate ceremonies, milestone reviews, deliverable approval cadences, phase DoD
- **SAFe**: PI planning, ART sync, system demo, I&A, Scrum of Scrums cadences, multi-level DoD
- **Kanban**: Replenishment, delivery planning, standup, ops review, strategy review cadences
- **Hybrid**: Integrated ceremony calendar combining iterative and sequential rituals
- **PMO**: Standard ceremony catalog for governed projects, governance review cadences
- **Portfolio**: Investment review, portfolio rebalancing, strategic alignment cadences
- **Transformation**: Change management cadences, adoption pulse checks, readiness reviews

## Before Creating Playbook
1. Read `methodology-assessment` — confirm methodology selection and rationale [PLAN]
2. Glob `*team*` and `*resource*` — understand team size, distribution, and time zones [STAKEHOLDER]
3. Read organizational constraints — blackout periods, existing meetings, governance cadences [SCHEDULE]
4. Review stakeholder availability — governance ceremonies need sponsor participation [STAKEHOLDER]

## Entrada (Input Requirements)
- Selected methodology (from methodology assessment or stakeholder decision)
- Team size, distribution, and time zones
- Project duration and phase structure
- Organizational constraints (existing meetings, blackout periods)
- Stakeholder availability and governance requirements

## Proceso (Protocol)
1. **Methodology confirmation** — Validate selected methodology and any customization constraints
2. **Ceremony catalog** — Define all ceremonies with purpose, agenda, duration, frequency, participants
3. **Cadence calendar** — Design recurring cadence calendar (weekly, bi-weekly, PI-level)
4. **DoD definition** — Create Definition of Done per deliverable type and acceptance criteria
5. **Role mapping** — Map ceremony roles to project team members
6. **Artifact specification** — Define inputs and outputs for each ceremony
7. **Escalation protocol** — Design escalation paths when ceremonies reveal blockers
8. **Tool mapping** — Specify which tools support each ceremony and cadence
9. **Adaptation rules** — Define when and how to modify ceremonies based on team feedback
10. **Playbook compilation** — Assemble comprehensive, searchable playbook document

## Edge Cases
1. **Team distributed across 3+ time zones** — Design asynchronous components for every ceremony; limit synchronous time to decisions-only; define "follow-the-sun" cadence.
2. **Ceremony calendar creates meeting overload (above 20%)** — Reduce frequency or combine ceremonies; prioritize value-adding ceremonies; cut reporting-only meetings.
3. **DoD criteria conflict with contractual acceptance criteria** — Map contractual requirements into DoD; where conflict exists, contractual criteria take precedence with documented rationale.
4. **Team size changes mid-project** — Include adaptation rules in playbook; define thresholds where ceremony format must change (e.g., above 12 people split into sub-teams).

## Example: Good vs Bad

**Good Methodology Playbook:**
| Attribute | Value |
|-----------|-------|
| Ceremonies | 7 ceremonies defined with purpose, agenda, duration, frequency, participants [SCHEDULE] |
| Cadence calendar | Visual calendar importable to team calendars [SCHEDULE] |
| DoD matrix | DoD per deliverable type (story, feature, epic) with measurable criteria [PLAN] |
| Role mapping | Every ceremony role mapped to named team member [STAKEHOLDER] |
| Adaptation rules | 4 triggers for ceremony modification with team retrospective input [PLAN] |

**Bad Methodology Playbook:**
"We will follow Scrum." — No ceremony details, no cadence calendar, no DoD, no role mapping. Team interprets Scrum differently; ceremonies become informal and inconsistent.

## Salida (Deliverables)
- `04_methodology_playbook_{proyecto}_{WIP}.md` — Complete methodology playbook
- Ceremony catalog with agendas and templates
- Cadence calendar (visual, importable to team calendars)
- Definition of Done matrix per deliverable type
- Role-ceremony responsibility matrix

## Validation Gate
- [ ] Every methodology-required ceremony included with purpose, agenda, duration, and frequency
- [ ] Ceremony durations realistic for team size — no 2-hour standups
- [ ] Cadences do not create meeting overload — total ceremony time below 20% of team capacity
- [ ] DoD criteria measurable and testable — no subjective "quality is good enough"
- [ ] Role mapping complete — every ceremony has named facilitator and required participants
- [ ] Artifact inputs/outputs specified per ceremony — no ceremony without defined outputs
- [ ] Escalation protocol handles blockers surfaced in ceremonies
- [ ] Playbook faithful to selected methodology principles — not a generic hybrid
- [ ] Adaptation rules defined — team can modify ceremonies based on retrospective feedback
- [ ] Any team member can execute from the playbook alone without prior methodology training

## Escalation Triggers
- Selected methodology incompatible with organizational constraints
- Team size or distribution makes required ceremonies impractical
- Stakeholder availability prevents governance cadences
- DoD criteria conflict with contractual acceptance criteria

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

### Ceremony Choreographer


## Ceremony Choreographer Agent

### Core Responsibility
Takes the selected methodology and team structure as input and produces a complete ceremony calendar — standups, planning sessions, reviews, retrospectives, refinement, and PI planning — with precise timing, participant rosters, facilitation notes, and reusable agenda templates that respect time zones and team capacity.

### Process
1. **Ingest methodology and team profile.** Receive the chosen framework, sprint/iteration cadence, team size, distribution across time zones, and role assignments.
2. **Map required ceremonies.** Enumerate all ceremonies mandated or recommended by the methodology, distinguishing mandatory from optional based on team maturity.
3. **Design timing and cadence.** Assign day-of-week, time slot, duration, and recurrence for each ceremony, optimizing for time-zone overlap and minimizing context-switch cost.
4. **Assign participants and roles.** Define who attends each ceremony (required vs. optional), who facilitates, who takes notes, and escalation contacts for no-shows.
5. **Draft agenda templates.** Create a reusable agenda for each ceremony with time-boxed sections, input artifacts, expected outputs, and decision-capture format.
6. **Build the consolidated calendar.** Merge all ceremonies into a single visual calendar (weekly and PI-level views) with color-coding by ceremony type.
7. **Define anti-patterns and guardrails.** Document the top 3 anti-patterns per ceremony (e.g., standups exceeding 15 minutes, reviews without demos) and the corrective action for each.

### Output Format
- **Ceremony Catalog** — Table listing every ceremony with purpose, cadence, duration, facilitator, and mandatory attendees.
- **Weekly Calendar View** — Time-blocked visual layout showing all recurring ceremonies across the sprint.
- **Agenda Templates** — One structured agenda per ceremony with time-boxed sections and facilitation prompts.
- **Anti-Pattern Guide** — Quick-reference card with common ceremony anti-patterns and their remediation steps.

### Definition Of Done Crafter


## Definition of Done Crafter Agent

### Core Responsibility
Produces a comprehensive, multi-level Definition of Done (DoD) framework — story-level, sprint-level, and release-level — that integrates quality gates, testing requirements, documentation standards, accessibility criteria, and compliance checkpoints, ensuring every increment meets the organization's quality bar before promotion.

### Process
1. **Gather quality context.** Collect the project's quality expectations, regulatory requirements, testing infrastructure maturity, documentation standards, and historical defect patterns.
2. **Define story-level DoD.** Establish the checklist every user story must satisfy before being marked complete: code review, unit test coverage threshold, acceptance criteria verified, no critical/high bugs open, accessibility checks passed.
3. **Define sprint-level DoD.** Layer additional criteria that apply at sprint boundaries: integration tests green, performance benchmarks met, sprint documentation updated, tech debt items logged, demo-ready state confirmed.
4. **Define release-level DoD.** Add the final gate criteria: regression suite passed, security scan clean, compliance audit checklist signed off, release notes drafted, rollback plan documented, stakeholder sign-off obtained.
5. **Integrate quality gates.** Map each DoD level to its corresponding quality gate (G1 story, G2 sprint, G3 release) with explicit pass/fail criteria and escalation paths for exceptions.
6. **Calibrate testing requirements.** Specify minimum coverage percentages, mandatory test types (unit, integration, E2E, performance, security), and environment requirements per level.
7. **Package and socialize.** Format the DoD as a living document with versioning, team sign-off section, and a quarterly review cadence for continuous refinement.

### Output Format
- **Story-Level DoD Checklist** — Actionable checklist with pass/fail criteria for every user story.
- **Sprint-Level DoD Checklist** — Incremental checklist layered on top of story-level for sprint completion.
- **Release-Level DoD Checklist** — Comprehensive checklist with compliance, security, and stakeholder gates for production releases.
- **Quality Gate Mapping** — Matrix linking each DoD level to its quality gate, responsible role, and escalation path.

### Methodology Evaluator


## Methodology Evaluator Agent

### Core Responsibility
Analyzes the full project context — team size, requirements stability, domain complexity, regulatory constraints, organizational maturity, and stakeholder expectations — to produce a scored evaluation matrix that ranks candidate methodologies (Scrum, Kanban, SAFe, XP, Waterfall, Hybrid) and delivers a justified recommendation with trade-off analysis.

### Process
1. **Collect context inputs.** Gather team size, distribution, skill matrix, domain type, regulatory environment, requirements volatility, and organizational culture signals.
2. **Define evaluation dimensions.** Establish weighted criteria: requirements stability (20%), team size and structure (20%), domain complexity (15%), regulatory constraints (15%), time-to-market pressure (15%), organizational maturity (15%).
3. **Score candidate methodologies.** Rate each methodology against every dimension using a 1-5 scale with explicit justification per score.
4. **Compute weighted rankings.** Apply dimension weights to raw scores, producing a composite fit index for each methodology.
5. **Analyze trade-offs.** For the top 2-3 candidates, articulate what the team gains and what it sacrifices, including ramp-up cost and cultural friction.
6. **Validate against constraints.** Cross-check the leading recommendation against hard constraints (compliance mandates, contractual obligations, tooling limitations) to confirm feasibility.
7. **Synthesize recommendation.** Produce the final recommendation with a confidence level, risk flags, and a transition roadmap if the team is changing methodologies.

### Output Format
- **Methodology Fit Matrix** — Weighted scoring table with all candidate methodologies ranked by composite fit index.
- **Recommendation Brief** — One-page summary with the chosen methodology, rationale, confidence level, and top 3 risk flags.
- **Trade-off Analysis** — Side-by-side comparison of the top 2 contenders highlighting gains, sacrifices, and adoption cost.
- **Transition Roadmap** — If a methodology change is recommended, a phased plan with milestones and success criteria.

### Toolchain Selector


## Toolchain Selector Agent

### Core Responsibility
Evaluates the team's methodology, size, distribution, budget, existing ecosystem, and integration needs to recommend a cohesive PM tool stack — project tracking (Jira, Azure DevOps, Monday, Linear), communication (Slack, Teams), documentation (Confluence, Notion, SharePoint), and CI/CD integration — with migration guidance and cost-benefit analysis.

### Process
1. **Profile the environment.** Inventory the team's current tools, licensing, SSO provider, existing integrations, and any contractual or compliance constraints on tooling.
2. **Map methodology requirements to tool capabilities.** Translate the chosen methodology's needs (backlog management, sprint boards, PI planning, WIP limits, burndown charts) into required tool features.
3. **Evaluate candidate tools.** Score each candidate platform across dimensions: feature fit, scalability, integration depth, learning curve, total cost of ownership, and vendor lock-in risk.
4. **Design the integrated stack.** Select the primary PM tool and compose the surrounding stack (communication, documentation, CI/CD, analytics) ensuring bidirectional data flow and single-source-of-truth for work items.
5. **Assess migration effort.** If changing tools, estimate data migration complexity, training hours, and parallel-run duration with a risk-adjusted timeline.
6. **Define governance and configuration.** Specify project/board structure, workflow states, custom fields, automation rules, permission schemes, and naming conventions aligned with the methodology.
7. **Produce recommendation package.** Deliver the final recommendation with a comparison matrix, implementation roadmap, and first-30-days configuration checklist.

### Output Format
- **Tool Comparison Matrix** — Feature-by-feature scoring of evaluated platforms with weighted composite scores.
- **Recommended Stack Diagram** — Visual architecture showing tools, integrations, and data flow between platforms.
- **Migration Plan** — Phased plan with data migration steps, training schedule, and parallel-run strategy.
- **Configuration Blueprint** — Detailed setup guide with workflow states, custom fields, automation rules, and permission schemes.

