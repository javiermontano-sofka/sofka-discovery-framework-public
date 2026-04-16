---
name: apex-scrum-framework
description: >
  Use when the user asks to "implement Scrum", "plan sprints", "define ceremonies",
  "set up Scrum artifacts", "design sprint cadence", or mentions Scrum, sprint planning,
  daily standup, sprint review, retrospective, product backlog, sprint backlog,
  Definition of Done, velocity tracking.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Scrum Framework Implementation

**TL;DR**: Designs and tailors a Scrum implementation including sprint cadence, ceremony definitions, artifact templates, role assignments, and Definition of Done. Adapts Scrum to the organization's context while preserving the empirical pillars of transparency, inspection, and adaptation.

## Principio Rector
Scrum no es un proceso — es un framework para descubrir procesos. Su poder radica en los tres pilares del empirismo: transparencia (todos ven la misma realidad), inspección (evaluación frecuente del progreso), y adaptación (ajuste basado en evidencia). Implementar Scrum sin entender el empirismo es hacer waterfall en sprints de 2 semanas.

## Assumptions & Limits
- Assumes team size is 3-9 developers (Scrum Guide recommended range) [PLAN]
- Assumes a Product Owner is identified or will be assigned [STAKEHOLDER]
- Breaks when team has zero agile experience and no coaching support — provide training first
- Does not manage the product backlog; designs the framework for managing it
- Assumes organizational constraints allow sprint cadence (regular time-boxed iterations) [SUPUESTO]
- Limited to single-team Scrum; for multi-team coordination use `safe-framework` or `less-nexus-framework`

## Usage

```bash
# Full Scrum implementation design
/pm:scrum-framework $ARGUMENTS="--team-size 7 --sprint-length 2w"

# Ceremony design only
/pm:scrum-framework --type ceremonies --sprint-length 2w --team "Team Alpha"

# Definition of Done creation
/pm:scrum-framework --type dod --quality-requirements quality-plan.md
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Team size and sprint configuration |
| `--type` | No | `full` (default), `ceremonies`, `dod`, `metrics`, `rollout` |
| `--team-size` | No | Number of developers (3-9) |
| `--sprint-length` | No | Sprint duration: `1w`, `2w`, `3w`, `4w` |
| `--team` | No | Team name identifier |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Standard Scrum with technical practices (TDD, CI/CD); sprint cadence drives all planning and delivery
- **SAFe**: Scrum at team level within ART; ceremonies align to PI cadence; team-level retrospectives feed ART inspect-and-adapt
- **Hybrid**: Scrum sprints within waterfall phases; sprint reviews map to phase gate deliverables; dual reporting
- **Transformation**: Scrum as reference model for coaching; ceremonies adapted for business stakeholders and change adoption tracking

## Before Implementing
1. **Read** methodology assessment results to confirm Scrum is appropriate [PLAN]
2. **Read** team composition to verify team size and skill distribution [PLAN]
3. **Glob** `**/backlog*` to check if a product backlog already exists [PLAN]
4. **Grep** for organizational constraints that might impact sprint cadence (release windows, governance cycles) [PLAN]

## Entrada (Input Requirements)
- Methodology assessment results (from `methodology-assessment`)
- Team composition and size
- Product/project scope and backlog items
- Organizational constraints (meeting schedules, reporting requirements)
- Team's agile maturity level

## Proceso (Protocol)
1. **Assess fit** — Verify Scrum is appropriate for team size (3-9), scope uncertainty, and org culture
2. **Define sprint cadence** — Select sprint length (1-4 weeks) based on feedback cycle needs
3. **Design ceremonies** — Tailor Sprint Planning, Daily Scrum, Sprint Review, Retrospective
4. **Define artifacts** — Product Backlog structure, Sprint Backlog format, Increment criteria
5. **Assign roles** — Product Owner, Scrum Master, Development Team with clear accountabilities
6. **Create Definition of Done** — Establish DoD checklist with quality criteria
7. **Backlog initialization** — Structure initial product backlog with user stories and acceptance criteria
8. **Metrics framework** — Define velocity tracking, burndown/burnup charts, sprint goals
9. **Scaling considerations** — If multi-team, reference `less-nexus-framework` or `safe-framework`
10. **Rollout plan** — Phased adoption with training, coaching, and feedback loops

## Edge Cases
1. **Team size outside 3-9 range** — For smaller teams, consider Kanban. For larger teams, split into multiple Scrum teams with coordination framework. Do not stretch Scrum to sizes it was not designed for [PLAN].
2. **Product Owner not available for ceremonies** — Flag as critical risk. A part-time PO leads to a part-time product. Recommend PO proxy only if PO delegates authority explicitly [STAKEHOLDER].
3. **Organization mandates practices conflicting with Scrum values** — Document the conflicts. Propose Scrum adaptations that preserve empiricism. If core values (transparency, inspection, adaptation) are compromised, recommend hybrid instead [INFERENCIA].
4. **Remote/distributed team** — Design ceremonies for remote-first: async daily standup options, virtual Sprint Review with recording, retrospective using digital boards [PLAN].

## Example: Good vs Bad

**Good example — Thoughtful Scrum implementation:**

| Attribute | Value |
|-----------|-------|
| Sprint length | 2 weeks (justified by feedback cycle needs) |
| Ceremonies | All 5 events defined with time-boxes and agendas |
| Roles | PO, SM, 6 developers — all with clear accountabilities |
| DoD | 12-item checklist covering code, test, review, deploy |
| Metrics | Velocity, sprint burndown, sprint goal completion rate |
| Rollout | 3-sprint trial with coaching before full adoption |

**Bad example — Waterfall in sprints:**
Sprint Planning assigns tasks top-down, no Daily Scrum because "we have Jira", Sprint Review is a demo with no feedback loop, Retrospective skipped because "we're too busy." This preserves the ceremony names while violating every Scrum principle. No empiricism, no self-management, no adaptation.

## Salida (Deliverables)
- `02_scrum_playbook_{proyecto}_{WIP}.md` — Scrum implementation guide
- Ceremony calendar with time-boxes and agendas
- Artifact templates (Product Backlog, Sprint Backlog)
- Role descriptions and accountability matrix
- Sprint metrics dashboard template

## Validation Gate
- [ ] All 5 Scrum events defined with time-boxes [PLAN]
- [ ] All 3 Scrum artifacts defined with format and ownership [PLAN]
- [ ] Team size within 3-9 developer range (or scaling referenced) [METRIC]
- [ ] Definition of Done has ≥8 testable criteria [PLAN]
- [ ] Sprint length justified with feedback cycle rationale [PLAN]
- [ ] PO, SM, and Development Team accountabilities documented [PLAN]
- [ ] Metrics framework includes velocity and sprint goal completion [METRIC]
- [ ] Rollout plan includes training before first sprint [SCHEDULE]
- [ ] Evidence ratio: ≥80% [PLAN], <20% [SUPUESTO]
- [ ] Implementation aligned with Scrum Guide 2020 principles [PLAN]

## Escalation Triggers
- Team size outside 3-9 range without scaling framework
- Product Owner not available for ceremonies
- Organization mandates practices conflicting with Scrum values
- No dedicated Scrum Master available

## Additional Resources

| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | Scrum Guide 2020 and implementation patterns | `references/body-of-knowledge.md` |
| State of the Art | Modern Scrum practices and adaptations | `references/state-of-the-art.md` |
| Knowledge Graph | Scrum in methodology framework | `references/knowledge-graph.mmd` |
| Use Case Prompts | Scrum implementation scenarios | `prompts/use-case-prompts.md` |
| Metaprompts | Custom Scrum adaptations | `prompts/metaprompts.md` |
| Sample Output | Reference Scrum playbook | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

---

---

## Sub-Agents

### Backlog Architect


# Backlog Architect

## Core Responsibility

The Backlog Architect designs and maintains a well-structured product backlog that transforms business objectives into a navigable hierarchy of epics, features, and user stories. This agent enforces acceptance criteria standards, applies proven story splitting techniques to keep items sprint-ready, and implements prioritization frameworks (WSJF, MoSCoW) so that the team always works on the highest-value items with the clearest definitions of success.

## Process

1. **Decompose** the product vision and roadmap into a three-tier hierarchy: epics (strategic outcomes), features (user-facing capabilities), and user stories (implementable increments), ensuring traceability from business goal to backlog item.
2. **Standardize** acceptance criteria using the Given-When-Then format, enforcing that every story has at least 2 and no more than 7 acceptance criteria, each independently testable.
3. **Apply** story splitting techniques (workflow steps, business rules, data variations, interface boundaries, CRUD operations) to break stories exceeding 8 story points into independently deliverable slices.
4. **Implement** the prioritization framework — WSJF (Weighted Shortest Job First) for SAFe-aligned teams or MoSCoW for stakeholder-driven environments — with a scoring matrix visible to all stakeholders.
5. **Organize** the backlog into zones: Sprint-Ready (top 2 sprints, fully refined), Near-Term (3-5 sprints, partially refined), and Strategic (6+ sprints, epic-level only), with clear promotion criteria between zones.
6. **Establish** refinement cadence rules: stories must pass a Definition of Ready checklist before entering Sprint-Ready zone, including size estimate, acceptance criteria, dependencies identified, and UX assets linked.
7. **Audit** the backlog health quarterly using metrics — ratio of refined vs. unrefined items, average story age, orphan stories (no parent epic), and priority inversion detection.

## Output Format

- **Backlog Architecture Document**: A structured deliverable containing:
  - Epic-Feature-Story hierarchy map (tree or table format)
  - Acceptance criteria template with examples
  - Story splitting decision tree
  - Prioritization scoring matrix (framework, criteria, weights)
  - Backlog zone definitions with promotion criteria
  - Definition of Ready checklist
  - Backlog health scorecard template

### Scrum Anti Pattern Detector


# Scrum Anti-Pattern Detector

## Core Responsibility

The Scrum Anti-Pattern Detector diagnoses dysfunctional Scrum implementations by systematically scanning team behaviors, ceremony dynamics, and delivery metrics for known anti-patterns. This agent identifies symptoms such as zombie Scrum (going through motions without delivering value), mid-sprint scope injection, absent or proxy Product Owners, ceremonies degraded into status meetings, and estimate inflation — then maps each finding to root causes and prescribes targeted corrective actions.

## Process

1. **Survey** the team's Scrum practices through a structured diagnostic questionnaire covering ceremony attendance, decision-making authority, scope change frequency, estimation consistency, and stakeholder engagement patterns.
2. **Analyze** sprint artifacts (burndown charts, sprint backlogs, retrospective action items) for telltale signatures: flat burndowns (work not decomposed), scope creep mid-sprint (items added after planning), and retrospective actions that never get implemented.
3. **Detect** ceremony anti-patterns by evaluating each event against its intended purpose — flagging Daily Standups that exceed 15 minutes or devolve into problem-solving sessions, Sprint Reviews without stakeholder feedback, and Retrospectives without measurable action items.
4. **Measure** estimate inflation by comparing story point distributions over time — identifying teams where the average story size drifts upward without corresponding complexity increases, masking velocity stagnation.
5. **Classify** each detected anti-pattern by severity (critical, moderate, minor), blast radius (team-level, product-level, organizational), and root cause category (process, people, tooling, organizational).
6. **Prescribe** corrective actions for each anti-pattern with specific, time-bound interventions — not generic advice but targeted experiments the team can run within 2-3 sprints to validate improvement.
7. **Prioritize** the remediation backlog using impact-effort analysis, recommending a maximum of 3 simultaneous interventions to avoid change fatigue and enable clear measurement of each intervention's effect.

## Output Format

- **Anti-Pattern Diagnostic Report**: A structured deliverable containing:
  - Anti-pattern inventory table (pattern | severity | blast radius | evidence)
  - Root cause analysis for each critical and moderate finding
  - Ceremony health scorecard (event | intended purpose | actual behavior | gap)
  - Estimate inflation trend chart (if applicable)
  - Prioritized remediation backlog (max 3 active interventions)
  - Intervention experiment cards (hypothesis, action, success metric, timebox)
  - Re-assessment schedule and expected improvement trajectory

### Sprint Mechanics Designer


# Sprint Mechanics Designer

## Core Responsibility

The Sprint Mechanics Designer architects the foundational rhythm of a Scrum team by defining sprint duration, ceremony cadence, timebox allocations, and the Definition of Done at each sprint level. This agent ensures that the sprint structure is tailored to team size, product complexity, and organizational constraints — producing a repeatable, sustainable delivery cadence that maximizes focus and minimizes context-switching overhead.

## Process

1. **Assess** the team composition, product domain complexity, and deployment constraints to determine optimal sprint duration (1–4 weeks) with a justified recommendation.
2. **Map** each Scrum ceremony (Sprint Planning, Daily Standup, Sprint Review, Retrospective, Refinement) to specific days and timeboxes within the sprint calendar, ensuring ceremonies do not exceed 15% of total sprint capacity.
3. **Define** timebox rules for each ceremony — including hard-stop enforcement, facilitation rotation, and escalation paths when timeboxes are consistently breached.
4. **Establish** the Definition of Done (DoD) at three levels: task-level (code review, unit tests), story-level (acceptance criteria met, QA passed), and sprint-level (potentially shippable increment, documentation updated).
5. **Calibrate** ceremony frequency against team maturity — recommending daily refinement touchpoints for new teams and lighter cadences for mature teams with stable velocity.
6. **Document** the complete sprint mechanics blueprint as a one-page visual calendar with linked DoD checklists, ready for team adoption.
7. **Validate** the proposed structure against known anti-patterns (ceremony overload, phantom sprints, back-to-back planning without buffer) and adjust before finalization.

## Output Format

- **Sprint Mechanics Blueprint**: A structured document containing:
  - Sprint duration and justification
  - Weekly ceremony calendar with day, time, duration, and facilitator
  - Timebox rules table (ceremony | timebox | hard-stop policy)
  - Definition of Done checklists (task / story / sprint levels)
  - Capacity allocation breakdown (ceremonies vs. development vs. buffer)
  - Risk flags and adaptation triggers for the first 3 sprints

### Velocity Calibrator


# Velocity Calibrator

## Core Responsibility

The Velocity Calibrator establishes reliable velocity baselines for Scrum teams — using historical sprint data for existing teams or capacity-based forecasting models for newly formed teams. This agent tracks velocity variance across sprints, performs trend analysis to detect acceleration or degradation patterns, and produces forecasting ranges that enable realistic release planning without false precision or morale-damaging overcommitment.

## Process

1. **Collect** historical sprint data (completed story points, team composition, sprint duration, and significant disruptions) for the last 6-8 sprints, or gather individual capacity profiles (availability %, skill mix, onboarding status) for new teams without history.
2. **Calculate** the baseline velocity using the trimmed mean method (discard highest and lowest sprints) for existing teams, or apply the capacity-based model (available hours x focus factor x historical productivity coefficient) for new teams.
3. **Analyze** variance patterns by computing standard deviation and coefficient of variation across sprints, flagging teams with >20% variance as unstable and recommending stabilization actions.
4. **Identify** velocity trends using a 3-sprint moving average, classifying the trajectory as accelerating, stable, or decelerating — and correlating trend shifts with known events (team changes, tech debt sprints, holiday periods).
5. **Generate** forecasting ranges using three-point estimation: pessimistic (baseline - 1 SD), expected (baseline), and optimistic (baseline + 1 SD), mapped to release dates and scope scenarios.
6. **Establish** velocity tracking rituals — sprint-over-sprint comparison in retrospectives, quarterly recalibration of baselines, and automatic alerts when velocity drops below the pessimistic threshold for 2 consecutive sprints.
7. **Document** all assumptions, exclusion criteria, and adjustment factors so that the velocity model is transparent, auditable, and not treated as a performance metric.

## Output Format

- **Velocity Calibration Report**: A structured deliverable containing:
  - Velocity baseline (single number + confidence range)
  - Sprint-by-sprint velocity chart with trend line
  - Variance analysis table (sprint | points | delta | flags)
  - Capacity model breakdown (for new teams)
  - Three-point forecasting scenarios mapped to release milestones
  - Stabilization recommendations (if variance > 20%)
  - Assumptions and exclusion log

