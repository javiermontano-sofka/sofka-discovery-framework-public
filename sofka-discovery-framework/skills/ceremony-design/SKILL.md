---
name: apex-ceremony-design
description: >
  Use when the user asks to "design ceremonies", "plan meeting cadence",
  "create facilitation guides", "define ceremony templates", or "optimize meeting calendar".
  Activates when a stakeholder needs to design a complete ceremony calendar, define time-boxes
  and agendas per ceremony, create facilitation guides, identify ceremony anti-patterns,
  or measure ceremony effectiveness across the project lifecycle.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Ceremony Cadence & Facilitation Design

**TL;DR**: Designs the complete ceremony calendar including cadence, time-boxes, agendas, facilitation guides, and templates for all project ceremonies. Adapts to selected methodology (Scrum events, Kanban cadences, SAFe ceremonies, or waterfall reviews) while ensuring each ceremony has a clear purpose, defined participants, and measurable outcomes.

## Principio Rector
Las ceremonias son el sistema nervioso del proyecto — transmiten información, generan alineación, y catalizan decisiones. Una ceremonia sin propósito claro es una reunión disfrazada. Cada ceremonia debe responder: qué decisión se toma aquí que no puede tomarse de otra forma.

## Assumptions & Limits
- Assumes a methodology has been selected (from `methodology-assessment`) [SUPUESTO]
- Assumes team structure and time zones are known for calendar feasibility [PLAN]
- Breaks when stakeholder availability is completely unknown — calendar becomes aspirational
- Does not facilitate ceremonies — that is the role of `ceremony-facilitation`
- Ceremony design for distributed teams requires explicit time-zone overlap analysis
- Anti-pattern catalog is based on common patterns; organization-specific anti-patterns require observation

## Usage

```bash
# Design full ceremony calendar for a Scrum project
/pm:ceremony-design $PROJECT --type=full --methodology="scrum"

# Design ceremony calendar for SAFe ART
/pm:ceremony-design $PROJECT --type=full --methodology="safe" --level="art"

# Generate anti-pattern catalog for existing ceremonies
/pm:ceremony-design $PROJECT --type=anti-patterns --current="true"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project identifier |
| `--type` | Yes | `full`, `single-ceremony`, `anti-patterns`, `effectiveness` |
| `--methodology` | No | `scrum`, `kanban`, `safe`, `waterfall`, `hybrid` |
| `--level` | No | Organizational level (team, art, portfolio) |
| `--current` | No | Analyze current ceremonies (true/false) |

## Service Type Routing
`{TIPO_PROYECTO}`: Scrum projects get 5 events; Kanban gets 7 cadences; SAFe adds PI-level events; Waterfall gets phase reviews; Hybrid blends based on component approach.

## Before Designing

1. **Read** the methodology assessment to confirm the selected framework and its ceremony requirements
2. **Read** team structure and organizational calendar to identify availability constraints
3. **Glob** `skills/ceremony-design/references/*.md` for ceremony templates and best practices
4. **Grep** for existing meeting schedules or ceremony feedback from retrospectives

## Entrada (Input Requirements)
- Selected methodology (from `methodology-assessment`)
- Team structure and time zones
- Stakeholder availability constraints
- Organizational calendar and meeting culture
- Tool preferences (virtual/in-person/hybrid)

## Proceso (Protocol)
1. **List required ceremonies** — Based on selected methodology, identify all mandatory and optional ceremonies
2. **Define purpose** — Document the specific purpose and expected outcome of each ceremony
3. **Set cadence and time-box** — Assign frequency and duration respecting methodology guidelines
4. **Design agendas** — Create structured agendas with time allocations per section
5. **Identify participants** — Define required and optional attendees per ceremony
6. **Create facilitation guides** — Document facilitation techniques, opening/closing rituals
7. **Design templates** — Create artifacts (boards, documents) needed during ceremonies
8. **Calendar integration** — Build unified calendar view showing all ceremonies
9. **Anti-pattern guide** — Document common ceremony anti-patterns and how to avoid them
10. **Effectiveness metrics** — Define how to measure ceremony value (NPS, action item completion)

## Edge Cases

1. **Distributed team across >3 time zones**: Design asynchronous ceremony alternatives (async standups, recorded demos). Require ≥2 hours overlap for synchronous ceremonies. [PLAN]
2. **Ceremony fatigue reported by team**: Audit ceremony hours vs. productive hours ratio. Target ≤15% of team time in ceremonies. Merge or eliminate low-value ceremonies. [METRIC]
3. **Stakeholders unable to attend mandatory ceremonies**: Design asynchronous input mechanism (pre-recorded updates, async voting). Never skip ceremony — adapt format. [STAKEHOLDER]
4. **Methodology requires ceremony but team finds no value**: Document team feedback. Propose experiment: modify format for 3 cycles, measure effectiveness, decide to keep/modify/drop. [PLAN]

## Example: Good vs Bad

**Good Ceremony Design:**

| Attribute | Value |
|-----------|-------|
| Ceremonies defined | All methodology-required + 2 optional |
| Purpose per ceremony | Specific decision or outcome documented |
| Time-boxes | Aligned with methodology guidelines |
| Agendas | Structured with time allocations per section |
| Participants | Required vs optional clearly defined |
| Anti-patterns | ≥5 identified with prevention measures |

**Bad Ceremony Design:**
A calendar with "Team Meeting - Monday 9am" and "Status Update - Friday 3pm" without purpose, agenda, participants, or time-boxes. No methodology alignment. No anti-pattern awareness. Fails because unnamed meetings without purpose become status-reporting rituals that consume time without producing decisions.

## Validation Gate
- [ ] Every methodology-required ceremony is included — no mandatory ceremony omitted
- [ ] Each ceremony has documented purpose stating what decision or outcome it produces
- [ ] Time-boxes respect methodology guidelines (e.g., Sprint Review ≤4h for 4-week sprint)
- [ ] Structured agendas with time allocations per section for every ceremony
- [ ] Required vs optional participants defined — no ceremony with "everyone invited"
- [ ] Calendar view shows no ceremony conflicts across the full cadence
- [ ] ≥5 anti-patterns documented with prevention measures
- [ ] Ceremony effectiveness metrics defined (NPS, action completion rate)
- [ ] Stakeholders see cadence rationale aligned with their information needs [STAKEHOLDER]
- [ ] Ceremonies true to framework principles, not ceremonial theater [PLAN]

## Escalation Triggers
- Calendar conflicts preventing required ceremonies
- Key stakeholders unable to attend mandatory ceremonies
- Ceremony fatigue reported by team
- Ceremonies not producing intended outcomes after 3 cycles

## Salida (Deliverables)

- Primary deliverable: ceremony playbook with cadence calendar
- All outputs tagged with evidence markers
- Mermaid diagrams where applicable
- Executive summary for stakeholder consumption

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before designing to understand ceremony frameworks | `references/body-of-knowledge.md` |
| State of the Art | When exploring innovative ceremony formats | `references/state-of-the-art.md` |
| Knowledge Graph | To link ceremonies to methodology and facilitation | `references/knowledge-graph.mmd` |
| Use Case Prompts | When scoping ceremony requirements | `prompts/use-case-prompts.md` |
| Metaprompts | To generate ceremony card templates | `prompts/metaprompts.md` |
| Sample Output | To calibrate expected ceremony design format | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

---

---

## Sub-Agents

### Agenda Template Designer


# Agenda Template Designer

## Core Responsibility

Designs reusable, structured agenda templates for every ceremony in the team's calendar, ensuring each meeting has clear timeboxes per section, facilitator guidance, prerequisite inputs, expected outputs, and explicit anti-pattern warnings. Templates are calibrated to team maturity, ceremony purpose, and organizational culture to drive focused, outcome-oriented meetings.

## Process

1. **Identify** the ceremony type and its primary purpose — decision-making, alignment, inspection, adaptation, or knowledge transfer — to anchor the agenda structure around the correct outcome.
2. **Decompose** the ceremony into logical sections (opening, core activity, synthesis, closing) and assign proportional timeboxes that respect the total duration constraint while protecting the highest-value section.
3. **Specify** required inputs for each section: artifacts to prepare (backlog, increment, metrics dashboard), pre-reads to distribute, and data to collect before the ceremony begins.
4. **Define** expected outputs per section: decisions documented, action items assigned with owners and due dates, artifacts updated, and follow-up ceremonies triggered.
5. **Annotate** each section with facilitator notes: suggested questions, participation techniques (round-robin, dot voting, silent writing), and escalation paths when discussions stall or go off-topic.
6. **Embed** anti-pattern warnings inline: status-report standups, planning without refined stories, retros without action items, reviews that become demos without feedback, and refinement sessions that devolve into design debates.
7. **Package** the template as a reusable markdown artifact with conditional sections that activate based on team context (remote vs. co-located, new team vs. mature team, crisis sprint vs. normal sprint).

## Output Format

- **Agenda Template**: Markdown table with columns for time allocation, section name, activity description, facilitator notes, inputs required, and outputs expected.
- **Anti-Pattern Sidebar**: Boxed warnings for each section identifying the top 2 anti-patterns and their corrective actions.
- **Facilitator Checklist**: Pre-ceremony preparation checklist (T-24h, T-1h, T-0) with specific tasks.
- **Adaptation Notes**: Conditional guidance for remote, hybrid, and co-located variations of the same ceremony.
- **Template Metadata**: Ceremony type, recommended duration, team size range, maturity level target.

### Ceremony Calendar Builder


# Ceremony Calendar Builder

## Core Responsibility

Designs and maintains the complete ceremony calendar for agile teams, ensuring optimal spacing of standups, planning sessions, reviews, retrospectives, refinement sessions, and PI planning events. Accounts for team capacity, sprint cadence, time zone constraints, and organizational dependencies to produce a calendar that maximizes collaboration value while minimizing meeting fatigue.

## Process

1. **Assess** the team's delivery cadence (sprint length, release frequency, PI duration) and organizational context (portfolio ceremonies, cross-team syncs, stakeholder availability windows).
2. **Map** all required ceremonies by type: iteration-level (standup, planning, review, retro, refinement), program-level (PI planning, Scrum of Scrums, system demo), and ad-hoc (spike reviews, tech debt sessions).
3. **Calculate** optimal timing and duration for each ceremony based on team size, complexity, and industry benchmarks — standup 15 min, planning 2-4 hrs per 2-week sprint, review 1-2 hrs, retro 1-1.5 hrs, refinement 1-2 hrs per week.
4. **Sequence** ceremonies to respect natural dependencies: refinement before planning, planning before sprint start, review before retro, retro before next planning.
5. **Distribute** ceremonies across the sprint to avoid clustering — no more than 2 hrs of ceremonies per day, protect deep-work blocks of at least 3 consecutive hours.
6. **Validate** the calendar against team capacity, ensuring ceremony load does not exceed 15-20% of total available sprint hours, and flag conflicts with organizational events.
7. **Publish** the final calendar as a structured artifact with iCal-compatible recurrence rules, facilitator assignments, room/tool requirements, and a quarterly review cadence for calendar health checks.

## Output Format

- **Ceremony Calendar Table**: Columns for ceremony name, day/time, duration, recurrence rule (RRULE), facilitator, required attendees, optional attendees, and dependencies.
- **Sprint Timeline Visual**: Mermaid Gantt chart showing ceremony placement across a representative sprint.
- **Capacity Impact Summary**: Percentage of sprint hours consumed by ceremonies per role (developer, PO, SM).
- **Recurrence Rules**: Machine-readable RRULE strings for calendar integration.
- **Review Schedule**: Quarterly dates for calendar effectiveness review.

### Ceremony Effectiveness Measurer


# Ceremony Effectiveness Measurer

## Core Responsibility

Evaluates the health and ROI of every ceremony in the team's calendar by tracking quantitative metrics (time-to-decision, participation rates, action item completion) and qualitative signals (team satisfaction, perceived value, energy levels). Identifies ceremonies that have decayed into rituals without value and recommends redesign, consolidation, or removal to continuously optimize the team's ceremony portfolio.

## Process

1. **Instrument** each ceremony with lightweight measurement mechanisms: anonymous pulse surveys (3 questions max, delivered within 5 minutes of ceremony end), automated attendance tracking, and action item registries linked to completion workflows.
2. **Collect** core metrics per ceremony instance: actual duration vs. planned duration, number of decisions made, number of action items generated, action item completion rate from previous instance, attendance rate, and Net Ceremony Score (1-5 satisfaction rating).
3. **Analyze** trends over rolling 4-sprint windows to distinguish signal from noise: declining satisfaction trends, increasing duration drift, falling action item completion, and participation drop-off patterns by role or individual.
4. **Benchmark** against industry standards and internal baselines: standups under 15 min with 95%+ attendance, retro action item completion above 70%, planning accuracy within 20% of committed velocity, review feedback incorporation above 50%.
5. **Diagnose** root causes for underperforming ceremonies using a structured taxonomy: purpose drift (ceremony no longer serves original goal), format fatigue (same format for 10+ sprints), facilitation gaps (no trained facilitator), scope creep (ceremony absorbing other ceremonies' concerns), or attendance erosion (key voices absent).
6. **Recommend** specific interventions ranked by impact and effort: format refresh (low effort), facilitator rotation (low effort), agenda restructure (medium effort), ceremony consolidation (medium effort), ceremony elimination with replacement async workflow (high effort).
7. **Report** findings as a ceremony health dashboard with red/yellow/green status per ceremony, trend sparklines, and a prioritized improvement backlog with expected outcomes for each recommended change.

## Output Format

- **Ceremony Health Dashboard**: One-page summary with RAG status per ceremony, key metrics, and trend indicators (improving, stable, declining).
- **Metrics Detail Table**: Per-ceremony breakdown with columns for metric name, current value, target, trend, and status.
- **Root Cause Analysis**: For each red/yellow ceremony, a structured diagnosis with evidence and contributing factors.
- **Improvement Backlog**: Prioritized list of recommended changes with expected impact, effort estimate, and responsible party.
- **Quarterly Ceremony Portfolio Review**: Recommendation on which ceremonies to keep, modify, consolidate, or drop, with supporting data.

### Facilitation Guide Writer


# Facilitation Guide Writer

## Core Responsibility

Produces detailed facilitation guides that equip Scrum Masters, team leads, and rotating facilitators with the techniques, scripts, and contingency plans needed to run effective ceremonies. Covers the full facilitation spectrum from icebreakers and energy management to conflict de-escalation, ensuring ceremonies remain inclusive, time-bounded, and outcome-driven across co-located, remote, and hybrid settings.

## Process

1. **Profile** the facilitation context: ceremony type, team size, team maturity (forming/storming/norming/performing), co-location model, and known dynamics (dominant voices, silent members, recurring conflicts).
2. **Select** appropriate icebreakers and energizers matched to ceremony purpose and duration — lightweight check-ins for standups (1-2 min), creative prompts for retros (5 min), strategic warm-ups for PI planning (10 min).
3. **Design** time management techniques for the specific ceremony: visible countdown timers, parking lot boards, explicit timebox announcements, and graceful cutoff scripts that preserve psychological safety.
4. **Develop** participation strategies that ensure equitable voice distribution: silent brainstorming before discussion, structured turn-taking, anonymous input collection, breakout rooms for large groups, and 1-2-4-All liberating structures.
5. **Prepare** conflict resolution protocols: recognize the conflict type (task vs. relationship vs. process), apply de-escalation scripts, redirect to offline resolution when appropriate, and document agreements to prevent recurrence.
6. **Adapt** every technique for remote and hybrid contexts: camera-on policies, digital whiteboard facilitation, asynchronous pre-work to reduce synchronous time, and equalization strategies so remote participants are not disadvantaged.
7. **Compile** the guide with scenario-based decision trees: "If discussion stalls, try X. If one person dominates, try Y. If energy drops, try Z." — actionable, not theoretical.

## Output Format

- **Facilitation Guide**: Structured document with sections for preparation, opening, core facilitation, closing, and post-ceremony follow-up.
- **Technique Cards**: Standalone reference cards for each technique (icebreaker, timebox enforcer, participation equalizer) with name, duration, materials needed, and step-by-step instructions.
- **Decision Tree**: Visual flowchart for common facilitation challenges with branching responses.
- **Remote/Hybrid Adaptation Matrix**: Table mapping each in-person technique to its remote equivalent with tool recommendations.
- **Facilitator Self-Assessment**: Post-ceremony reflection checklist to build facilitation skills over time.

