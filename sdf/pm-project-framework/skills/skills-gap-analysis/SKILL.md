---
name: apex-skills-gap-analysis
description: >
  Use when the user asks to "analyze skills gaps", "assess team capabilities",
  "plan training", "evaluate competency readiness", "identify capability shortfalls",
  or mentions skills inventory, capability assessment, competency gap, training needs
  analysis, skill proficiency mapping.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Skills Gap Analysis & Training Plan

**TL;DR**: Assesses current team skills against project requirements to identify capability gaps. Produces a skills inventory, gap analysis matrix, and training/hiring plan to close gaps. Distinguishes between gaps addressable through training (weeks) and those requiring hiring (months).

## Principio Rector
Un equipo con las habilidades equivocadas producirá los resultados equivocados, sin importar cuánto esfuerzo invierta. El análisis de brechas de skills es preventivo: identifica lo que el equipo no puede hacer ANTES de que se convierta en un bloqueador del cronograma.

## Assumptions & Limits
- Assumes project requirements and technology stack are defined [PLAN]
- Assumes team members are available for skill assessment [SUPUESTO]
- Breaks when project scope is too vague to derive required skills
- Does not execute training; plans it. Use organizational L&D for execution
- Assumes self-assessment is supplemented with verification (peer review, tests) [SUPUESTO]
- Limited to project-level gaps; organizational capability building requires HR partnership

## Usage

```bash
# Full skills gap analysis
/pm:skills-gap-analysis $ARGUMENTS="--requirements tech-stack.md --team team-roster.md"

# Training plan only (gaps already identified)
/pm:skills-gap-analysis --type training-plan --gaps gaps.md --budget "40 FTE-days"

# Hiring requirements assessment
/pm:skills-gap-analysis --type hiring --gaps gaps.md --timeline "8 weeks"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Path to requirements and team roster |
| `--type` | No | `full` (default), `training-plan`, `hiring`, `inventory` |
| `--budget` | No | Training budget in FTE-days or FTE-weeks |
| `--timeline` | No | Timeline for gap closure |

## Service Type Routing
`{TIPO_PROYECTO}`: Agile-Transformation assesses coaching and facilitation skills; ERP assesses functional and technical consultant skills; Cloud assesses cloud certification gaps; Digital-Transformation assesses change management skills.

## Before Analyzing Gaps
1. **Read** the project requirements and technology stack to identify needed skills [PLAN]
2. **Read** team roster and role definitions to understand current composition [PLAN]
3. **Glob** `**/certifications*` or `**/training*` to find existing team qualification data [PLAN]
4. **Grep** for skill-related risks in the risk register [INFERENCIA]

## Entrada (Input Requirements)
- Project requirements and technology stack
- Current team member profiles and skills
- Role definitions from resource plan
- Industry skill benchmarks
- Training budget constraints

## Proceso (Protocol)
1. **Requirements mapping** — List skills required per role from project scope
2. **Skills inventory** — Assess current team skills (proficiency 1-5 per skill per person)
3. **Gap identification** — Compare required vs. actual skills to find gaps
4. **Gap severity** — Rate each gap: Critical (blocks delivery), High (slows delivery), Medium (workaround exists)
5. **Closure strategy** — Determine strategy per gap: training, mentoring, hiring, or outsourcing
6. **Training plan** — Design training program for train-able gaps
7. **Hiring plan** — Define hiring requirements for gaps needing new talent
8. **Timeline** — Align skill readiness with project schedule needs
9. **Budget estimation** — Estimate training/hiring investment (FTE-weeks, not prices)
10. **Tracking mechanism** — Define how skill development will be tracked

## Edge Cases
1. **Critical skill gap with no closure path before project needs it** — Escalate as schedule risk. Options: delay dependent work, reduce scope requiring that skill, or accept quality risk. Quantify impact per option [SCHEDULE].
2. **Key skill available in only one team member** — Flag as single-point-of-failure. Prioritize cross-training for this skill. Add to risk register as key-person dependency [PLAN].
3. **Self-assessment inflated (team overrates own skills)** — Supplement with practical verification (coding challenges, case studies). Use skill demonstration not self-declaration [INFERENCIA].
4. **Training budget insufficient** — Prioritize Critical gaps over High/Medium. Explore free/low-cost alternatives (mentoring, pair programming, community resources). Document unfunded gaps as risks [PLAN].

## Example: Good vs Bad

**Good example — Actionable skills gap analysis:**

| Attribute | Value |
|-----------|-------|
| Skills assessed | 15 skills across 8 team members |
| Proficiency | 1-5 scale with verification method |
| Gaps found | 4 Critical, 3 High, 5 Medium |
| Closure strategy | 2 training, 1 hire, 1 mentoring per Critical gap |
| Timeline | All Critical gaps closed before Sprint 3 |
| Budget | 12 FTE-days training, 1 hire (8-week lead) |

**Bad example — Generic training request:**
"The team needs training on cloud." No skills inventory, no gap severity, no specific skills identified, no timeline alignment with project needs. Without knowing current proficiency, training may cover what the team already knows or miss what they actually lack.

## Salida (Deliverables)
- Skills inventory matrix (person x skill x proficiency)
- Gap analysis with severity ratings
- Training plan with timeline
- Hiring requirements document
- Skill development tracking dashboard

## Validation Gate
- [ ] Every project-critical skill assessed with proficiency rating (1-5) [METRIC]
- [ ] Proficiency verified through method beyond self-assessment [METRIC]
- [ ] Every gap classified by severity (Critical/High/Medium) [METRIC]
- [ ] Critical gaps have closure strategy with timeline [PLAN]
- [ ] Closure timeline aligned with project schedule needs [SCHEDULE]
- [ ] Training budget estimated in FTE-weeks (never prices) [PLAN]
- [ ] Hiring requirements include lead time for recruitment [SCHEDULE]
- [ ] Key-person dependencies identified and flagged [PLAN]
- [ ] Evidence ratio: ≥75% [PLAN]/[METRIC], <25% [SUPUESTO]
- [ ] Tracking mechanism defined for skill development progress [PLAN]

## Escalation Triggers
- Critical skill gap with no closure path before project needs it
- Training budget insufficient for gap closure
- Key skill available in only one team member
- Hiring market lacks required skills

## Additional Resources

| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | Competency frameworks and assessment methods | `references/body-of-knowledge.md` |
| State of the Art | Modern skills assessment practices | `references/state-of-the-art.md` |
| Knowledge Graph | Skills gap in resource planning | `references/knowledge-graph.mmd` |
| Use Case Prompts | Skills analysis scenarios | `prompts/use-case-prompts.md` |
| Metaprompts | Custom competency frameworks | `prompts/metaprompts.md` |
| Sample Output | Reference skills gap report | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

---

---

## Sub-Agents

### Closure Plan Builder


## Closure Plan Builder Agent

### Core Responsibility
Build practical, time-bound closure plans for each critical skill gap, evaluating multiple closure options (training, hiring, outsourcing, scope adjustment) and recommending the optimal approach based on cost, speed, risk, and organizational context.

### Process
1. **Evaluate Training Option.** For each gap, assess: available training programs, estimated learning time, cost, effectiveness probability, and whether training can happen without disrupting delivery.
2. **Evaluate Hiring Option.** Assess: market availability of the skill, hiring timeline (typically 4-12 weeks), cost (salary + overhead), ramp-up time, and retention risk.
3. **Evaluate Outsourcing Option.** Assess: vendor availability, cost (hourly/monthly), knowledge transfer risk, dependency creation, and intellectual property considerations.
4. **Evaluate Scope Adjustment.** Assess: which work packages could be deferred or redesigned to avoid the skill gap, impact on project objectives, and stakeholder acceptability.
5. **Recommend Optimal Approach.** For each gap, recommend the best closure option considering timeline constraints, budget, organizational culture, and strategic value of internalizing the skill.
6. **Create Implementation Timeline.** Build a detailed timeline for executing the closure plan with milestones, responsible parties, and verification checkpoints.
7. **Produce Closure Plan Package.** Deliver comprehensive gap closure plan with option analysis, recommendations, timeline, budget, and success criteria.

### Output Format
- **Gap Closure Matrix** — Table: Skill Gap, Option 1 (Training), Option 2 (Hire), Option 3 (Outsource), Option 4 (Scope), Recommended, Timeline, Cost.
- **Implementation Timeline** — Gantt showing closure activities with milestones and dependencies.
- **Budget Summary** — Total investment required for gap closure with ROI justification.

### Competency Mapper


# Competency Mapper

## Core Responsibility

The Competency Mapper agent analyzes project scope, work breakdown structure, and technology stack to produce a comprehensive competency catalog required for successful delivery. It classifies each competency into four dimensions — technical skills, domain knowledge, methodology expertise, and soft skills — and assigns target proficiency levels (Foundational, Intermediate, Advanced, Expert) based on role expectations and work package complexity.

## Process

1. **Extract** the project scope statement, WBS, and technology stack from discovery artifacts to identify all capability demands.
2. **Decompose** each work package into the discrete competencies needed for execution, tagging each with its dimension (technical, domain, methodology, soft skill).
3. **Define** proficiency levels for every competency using a four-tier scale (Foundational, Intermediate, Advanced, Expert) aligned to role expectations.
4. **Cross-reference** industry competency frameworks (SFIA, ICB4, PMI Talent Triangle) to validate completeness and standard naming.
5. **Weight** each competency by its criticality to delivery milestones, distinguishing must-have from nice-to-have capabilities.
6. **Map** competencies to specific roles and project phases, creating a role-competency matrix that shows when each skill is needed.
7. **Publish** the final competency catalog as a structured artifact with traceability links back to WBS elements and delivery milestones.

## Output Format

```markdown
# Competency Catalog — {Project Name}

## Summary
- Total competencies identified: {N}
- Technical: {n} | Domain: {n} | Methodology: {n} | Soft Skills: {n}
- Critical (must-have): {n} | Desirable (nice-to-have): {n}

## Role-Competency Matrix

| Role | Competency | Dimension | Target Level | Criticality | Phase Needed | WBS Ref |
|------|-----------|-----------|-------------|-------------|-------------|---------|
| ... | ... | ... | ... | ... | ... | ... |

## Competency Details

### {Competency Name}
- **Dimension**: Technical | Domain | Methodology | Soft Skill
- **Target proficiency**: Foundational | Intermediate | Advanced | Expert
- **Criticality**: Critical | Important | Desirable
- **Applicable roles**: {list}
- **Phase dependency**: {phases where this competency is active}
- **Framework reference**: {SFIA/ICB4/PMI mapping}
```

### Gap Severity Scorer


## Gap Severity Scorer Agent

### Core Responsibility
Quantify the severity of each identified skill gap using a multi-factor scoring model that considers impact on project delivery, number of affected work packages, availability of workarounds, and the time required to close the gap.

### Process
1. **Define Scoring Dimensions.** Establish 4 dimensions: delivery criticality (blocks/delays/degrades/manageable), affected scope (% of work packages impacted), workaround availability (none/partial/full), time-to-close (weeks).
2. **Score Each Gap.** Rate every identified skill gap on each dimension using a 1-5 scale with calibrated anchors for consistent scoring.
3. **Calculate Composite Score.** Apply weighted formula: severity = (criticality × 0.35) + (scope_impact × 0.25) + (workaround × 0.20) + (time_factor × 0.20).
4. **Classify Severity Tiers.** Map composite scores to tiers: Critical (>4.0, blocks delivery), High (3.0-4.0, delays delivery), Medium (2.0-3.0, reduces quality), Low (<2.0, manageable).
5. **Identify Bus Factor Risks.** Flag skills where only one person is proficient and the gap severity is High or Critical — single-point-of-failure.
6. **Prioritize for Action.** Rank all gaps by composite score. Identify the top gaps where closure would have the greatest positive impact on project success.
7. **Produce Severity Report.** Deliver scored gap register with tier classifications, bus factor alerts, and prioritized action recommendations.

### Output Format
- **Scored Gap Register** — Table: Skill, Criticality, Scope Impact, Workaround, Time-to-Close, Composite Score, Severity Tier.
- **Priority Action List** — Top 10 gaps ranked by composite score with recommended closure approach.
- **Bus Factor Alert** — Skills with single-point-of-failure risk requiring immediate attention.

### Team Assessment Conductor


# Team Assessment Conductor

## Core Responsibility

The Team Assessment Conductor agent orchestrates a multi-source capability evaluation for every team member against the competency catalog. It combines four assessment channels — self-assessment, peer review, manager evaluation, and skills test results — into a weighted, normalized skills matrix that reveals each individual's current proficiency levels with confidence scores, eliminating single-source bias and producing an objective baseline for gap identification.

## Process

1. **Distribute** self-assessment questionnaires to each team member, aligned to the competency catalog with proficiency-level descriptors for consistent self-rating.
2. **Collect** peer review inputs by pairing team members who share work packages, capturing observed proficiency on collaborative competencies.
3. **Gather** manager evaluations that provide supervisory perspective on each team member's demonstrated competency levels and growth trajectory.
4. **Integrate** objective skills test results (certifications, technical assessments, coding challenges, methodology exams) as the empirical anchor for each competency.
5. **Normalize** scores across all four channels using weighted aggregation (self: 20%, peer: 25%, manager: 25%, test: 30%) and calculate confidence intervals based on source agreement.
6. **Assemble** the unified skills matrix mapping each team member to every required competency, showing current level vs. target level with a confidence score.
7. **Flag** discrepancies where self-assessment diverges significantly from other sources, marking these for calibration sessions or additional evidence gathering.

## Output Format

```markdown
# Team Skills Matrix — {Project Name}

## Assessment Summary
- Team members assessed: {N}
- Competencies evaluated: {N}
- Assessment completion rate: {%}
- Average confidence score: {score}/100

## Aggregated Skills Matrix

| Team Member | Role | Competency | Self | Peer | Manager | Test | Weighted Score | Target | Gap | Confidence |
|-------------|------|-----------|------|------|---------|------|---------------|--------|-----|-----------|
| ... | ... | ... | ... | ... | ... | ... | ... | ... | ... | ... |

## Calibration Flags

| Team Member | Competency | Self-Rating | Aggregated Rating | Divergence | Action |
|-------------|-----------|-------------|-------------------|-----------|--------|
| ... | ... | ... | ... | ... | Calibration session required |

## Channel Completion Tracker

| Channel | Responses Received | Total Expected | Completion % |
|---------|-------------------|----------------|-------------|
| Self-Assessment | {n} | {n} | {%} |
| Peer Review | {n} | {n} | {%} |
| Manager Evaluation | {n} | {n} | {%} |
| Skills Tests | {n} | {n} | {%} |
```

