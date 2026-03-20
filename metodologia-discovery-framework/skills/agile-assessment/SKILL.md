---
name: apex-agile-assessment
description: >
  Use when the user asks to "assess agile maturity", "evaluate agile practices",
  "run agile readiness check", "benchmark Scrum adoption", or "audit agile capabilities".
  Activates when a stakeholder needs to measure agile adoption level, evaluate Scrum maturity,
  diagnose agile anti-patterns, compare agile readiness across teams, or baseline agile capability
  before a transformation initiative.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Agile Maturity Assessment

**TL;DR**: Assesses organizational agile maturity across six dimensions: mindset and culture, practices and processes, team structure, tooling, leadership support, and delivery outcomes. Produces a maturity radar with current vs. target state, a gap analysis per dimension, and an improvement roadmap grounded in agile principles rather than ceremony checklists.

## Principio Rector
La madurez ágil no se mide por cuántas ceremonias se hacen, sino por cuánto empirismo se practica. Un equipo que hace dailys pero nunca adapta su proceso no es ágil — es waterfall con reuniones diarias. La evaluación busca evidencia de transparencia, inspección y adaptación reales, no ceremonias rituales.

## Assumptions & Limits
- Assumes access to at least one sprint team with ≥3 sprints of historical data [SUPUESTO]
- Assumes interviewees provide honest assessment of practices, not aspirational descriptions [SUPUESTO]
- Breaks when the organization has never attempted agile — use `methodology-assessment` first
- Scope limited to team-level and leadership-level maturity; does not assess enterprise agility (use `safe-assessment`)
- Self-assessment surveys alone are insufficient; observation and artifact review required [PLAN]
- Does not produce a transformation roadmap — that is the output of `organizational-change`

## Usage

```bash
# Assess agile maturity for a single team
/pm:agile-assessment $PROJECT --type=team --team="Equipo Alpha"

# Assess agile maturity across the organization
/pm:agile-assessment $PROJECT --type=organization --scope="all-teams"

# Assess readiness before SAFe adoption
/pm:agile-assessment $PROJECT --type=readiness --target="SAFe"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project or organization identifier |
| `--type` | Yes | `team`, `organization`, or `readiness` |
| `--team` | No | Specific team to assess (default: all) |
| `--target` | No | Target framework for readiness check |
| `--scope` | No | Assessment scope filter |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Primary use — full agile maturity assessment across all dimensions
- **Waterfall**: Assess agile readiness as input for methodology transformation decision
- **SAFe**: Assess team-level agile maturity as prerequisite for SAFe scaling
- **Kanban**: Assess agile mindset maturity alongside Kanban flow practices
- **Hybrid**: Assess agile component maturity within hybrid methodology structure
- **PMO**: Assess organizational agile capability across project portfolio
- **Portfolio**: Assess agile delivery capability as input for portfolio governance design
- **Transformation**: Baseline agile maturity before organizational agile transformation

## Before Assessing

1. **Read** the stakeholder register to identify interviewees and their roles in the agile adoption journey
2. **Glob** `skills/agile-assessment/references/*.md` for maturity rubrics and industry benchmarks
3. **Read** any existing methodology assessment to understand the current declared methodology
4. **Grep** for prior retrospective outputs or lessons learned mentioning agile practices

## Entrada (Input Requirements)
- Current team processes and ceremonies
- Delivery metrics (velocity, cycle time, quality, predictability)
- Team and leadership interviews or survey data
- Organizational structure and culture indicators
- Historical agile adoption efforts and results

## Proceso (Protocol)
1. **Dimension definition** — Establish assessment dimensions (mindset, practices, structure, tooling, leadership, outcomes)
2. **Data collection** — Gather evidence through interviews, observation, metrics, and artifact review
3. **Current state scoring** — Rate maturity per dimension using 1-5 rubric with behavioral indicators
4. **Evidence documentation** — Document specific evidence supporting each score
5. **Target state definition** — Define desired maturity per dimension with stakeholder input
6. **Gap analysis** — Calculate and visualize gap between current and target per dimension
7. **Benchmark comparison** — Compare against industry agile maturity benchmarks
8. **Anti-pattern identification** — Flag agile anti-patterns observed (cargo cult, zombie Scrum)
9. **Improvement prioritization** — Rank improvements by impact on delivery outcomes and feasibility
10. **Roadmap creation** — Design phased improvement roadmap respecting organizational change capacity

## Edge Cases

1. **Team claims agile but has no metrics**: Score mindset dimension based on behavioral observation only; flag absence of metrics as a maturity gap. Require ≥1 sprint of metric collection before reassessment. [METRIC]
2. **Leadership mandated agile without team buy-in**: Assess leadership dimension separately; note top-down imposition as anti-pattern. Recommend bottom-up pilot strategy in roadmap. [STAKEHOLDER]
3. **Multiple teams at wildly different maturity levels**: Produce individual team scorecards AND an aggregate organizational view. Do not average scores — show distribution. [PLAN]
4. **Organization uses "agile" terminology but follows waterfall**: Flag as "Agile Theater" anti-pattern. Score based on actual behavior, not declared process. [INFERENCIA]
5. **No prior agile experience at all**: Redirect to `methodology-assessment` first. If agile is selected, this becomes a readiness baseline rather than maturity measurement. [SUPUESTO]

## Example: Good vs Bad

**Good Assessment:**

| Attribute | Value |
|-----------|-------|
| Dimensions assessed | 6/6 with behavioral evidence |
| Evidence per score | ≥2 data points (observation + metric) |
| Anti-patterns identified | 3, each with remediation |
| Gap visualization | Radar chart with current vs target |
| Roadmap | Phased, 3 horizons, respects change capacity |
| Evidence tags | 80% [METRIC]/[PLAN], 20% [INFERENCIA] |

**Bad Assessment:**
A maturity report that scores every dimension based solely on a self-assessment survey without observation or artifact review. Scores are inflated because teams rate aspirations, not reality. No anti-patterns identified. Roadmap says "adopt Scrum" without phasing or change capacity analysis. Fails because it produces fictional maturity scores that misinform investment decisions.

## Validation Gate
- [ ] ≥2 evidence sources per dimension score (observation, metrics, artifacts, interviews)
- [ ] Every score 1-5 has a behavioral anchor description — no unanchored ratings
- [ ] All 6 dimensions assessed — no dimension skipped or marked N/A without justification
- [ ] Anti-pattern catalog includes ≥3 identified patterns with remediation steps
- [ ] Improvement roadmap has ≥2 phases respecting organizational change capacity
- [ ] Gap analysis produces radar visualization with current AND target state
- [ ] No score based solely on self-assessment without corroborating evidence
- [ ] Agile adoption risks identified with probability and impact ratings
- [ ] Leadership sees concrete improvement path tied to delivery outcome metrics [STAKEHOLDER]
- [ ] Assessment grounded in Agile Manifesto principles, not framework orthodoxy [PLAN]

## Escalation Triggers
- Level 1 maturity across critical dimensions (mindset, practices)
- Leadership actively opposing agile practices or undermining team autonomy
- No improvement despite 6+ months of agile coaching or transformation effort
- Assessment reveals fundamental culture incompatibility with agile values

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before first assessment to calibrate rubrics | `references/body-of-knowledge.md` |
| State of the Art | When benchmarking against industry trends | `references/state-of-the-art.md` |
| Knowledge Graph | To understand skill dependencies and data flow | `references/knowledge-graph.mmd` |
| Use Case Prompts | For specific assessment scenarios | `prompts/use-case-prompts.md` |
| Metaprompts | To enhance assessment quality and reduce bias | `prompts/metaprompts.md` |
| Sample Output | Reference for deliverable format and structure | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

---

---

## Sub-Agents

### Agile Maturity Scorer


# Agile Maturity Scorer

## Core Responsibility

This agent evaluates an organization's or team's agile maturity by systematically scoring 8 dimensions on a 1–5 scale (Initial, Emerging, Defined, Managed, Optimizing). It collects evidence from interviews, artifacts, ceremonies, and tooling to produce a holistic maturity profile that highlights strengths, weaknesses, and the delta between current state and target state. The output serves as the baseline for all downstream recommendations.

## Process

1. **Gather** organizational context including team size, tenure with agile, current framework(s), and strategic goals for the assessment.
2. **Define** the 8 maturity dimensions and their sub-criteria: Culture (psychological safety, experimentation tolerance), Practices (ceremonies adherence, artifact quality), Tooling (CI/CD, backlog management, observability), Leadership (servant leadership, impediment removal), Team Autonomy (self-organization, decision authority), Continuous Improvement (retro cadence, action follow-through), Customer Collaboration (feedback loops, stakeholder access), Technical Excellence (TDD, pair programming, refactoring discipline).
3. **Collect** evidence for each dimension through structured questionnaires, artifact review (boards, backlogs, burndowns), ceremony observation notes, and stakeholder interviews.
4. **Score** each dimension on the 1–5 maturity scale using the collected evidence, assigning confidence levels (High/Medium/Low) based on evidence density.
5. **Calculate** the aggregate maturity index (weighted average) and identify the top 3 strengths and top 3 improvement areas based on score gaps relative to the target profile.
6. **Visualize** the maturity profile as a radar chart data structure and a dimension-by-dimension breakdown table with evidence tags.
7. **Produce** the final Agile Maturity Scorecard including dimension scores, aggregate index, confidence levels, evidence summaries, and prioritized improvement areas.

## Output Format

```markdown
# Agile Maturity Scorecard — {Team/Org Name}

## Summary
- **Aggregate Maturity Index**: {X.X}/5.0
- **Assessment Date**: {date}
- **Scope**: {team/department/enterprise}

## Dimension Scores

| Dimension                | Score | Target | Gap  | Confidence | Key Evidence |
|--------------------------|-------|--------|------|------------|--------------|
| Culture                  | X/5   | X/5    | ±X   | High/Med/Low | ...        |
| Practices                | X/5   | X/5    | ±X   | High/Med/Low | ...        |
| Tooling                  | X/5   | X/5    | ±X   | High/Med/Low | ...        |
| Leadership               | X/5   | X/5    | ±X   | High/Med/Low | ...        |
| Team Autonomy            | X/5   | X/5    | ±X   | High/Med/Low | ...        |
| Continuous Improvement   | X/5   | X/5    | ±X   | High/Med/Low | ...        |
| Customer Collaboration   | X/5   | X/5    | ±X   | High/Med/Low | ...        |
| Technical Excellence     | X/5   | X/5    | ±X   | High/Med/Low | ...        |

## Top 3 Strengths
1. ...
2. ...
3. ...

## Top 3 Improvement Areas
1. ...
2. ...
3. ...

## Radar Chart Data
{JSON structure for visualization}
```

### Agile Recommendation Engine


# Agile Recommendation Engine

## Core Responsibility

This agent synthesizes outputs from the Agile Maturity Scorer, Practice Gap Analyzer, and Transformation Readiness Evaluator to produce a coherent, actionable recommendation package. It selects the most appropriate agile framework for the organization's context, defines a Start/Stop/Continue practice matrix, identifies specific training and coaching needs, and delivers a phased adoption roadmap with milestones and success metrics. Every recommendation is traceable to assessment evidence.

## Process

1. **Ingest** the three upstream assessment artifacts — maturity scorecard, practice gap report, and readiness report — extracting dimension scores, gap severities, anti-patterns, risk flags, and prerequisite statuses into a unified decision matrix.
2. **Select** the recommended agile framework by matching organizational characteristics (team size, work type, release cadence, regulatory constraints, distributed/collocated) against framework fitness criteria: Scrum for product development with stable teams, Kanban for maintenance/ops and flow-based work, XP for engineering-heavy contexts, SAFe for multi-team coordination, or a justified hybrid.
3. **Build** the Start/Stop/Continue matrix by categorizing current practices: Start (missing practices critical to the recommended framework), Stop (anti-patterns and practices that conflict with agile values), Continue (strengths to preserve and amplify) — each item linked to the gap or maturity finding that justifies it.
4. **Specify** training and coaching needs by mapping skill gaps to concrete interventions: certification courses (CSM, PSM, PMI-ACP), workshops (TDD bootcamp, facilitation skills), embedded coaching durations, and community-of-practice formation — with estimated hours and budget ranges in FTE-months.
5. **Design** the phased adoption roadmap in 3 phases: Foundation (0–3 months: prerequisites, training, pilot team selection), Expansion (3–9 months: scaling to additional teams, process tuning), Optimization (9–18 months: metrics-driven improvement, advanced practices) — each phase with entry criteria, activities, exit criteria, and success metrics.
6. **Define** success metrics and measurement cadence: velocity stability, cycle time reduction, defect escape rate, team satisfaction (NPS), Sprint Goal achievement rate, and lead time — with baseline values from current state and targets per phase.
7. **Package** the complete recommendation as the Agile Adoption Recommendation Report, ensuring every recommendation traces back to an evidence tag from the upstream assessments and includes effort/impact annotations for executive decision-making.

## Output Format

```markdown
# Agile Adoption Recommendation Report — {Org Name}

## Executive Summary
{2–3 paragraph narrative: current state, recommended direction, expected outcomes}

## Recommended Framework: {Scrum | Kanban | XP | SAFe | Hybrid}
- **Rationale**: {why this framework fits the context}
- **Alternative Considered**: {runner-up and why it was not selected}

## Start / Stop / Continue Matrix

### Start
| Practice                  | Framework Element | Justification (Evidence Ref)       | Priority |
|---------------------------|-------------------|------------------------------------|----------|
| Sprint Planning with Goals | Scrum ceremony   | Gap: Missing Sprint Goals [GAP-03] | P1       |
| ...                       | ...               | ...                                | ...      |

### Stop
| Practice / Anti-Pattern   | Justification (Evidence Ref)       | Risk if Continued          |
|---------------------------|------------------------------------|----------------------------|
| Status-meeting Standups   | Anti-pattern [AP-01]               | Team disengagement         |
| ...                       | ...                                | ...                        |

### Continue
| Practice                  | Strength (Evidence Ref)            | How to Amplify             |
|---------------------------|------------------------------------|----------------------------|
| Retrospectives with actions | Maturity: CI 4/5 [MAT-06]       | Add metrics tracking       |
| ...                       | ...                                | ...                        |

## Training & Coaching Plan

| Intervention                    | Audience       | Hours | FTE-Months | Timeline     |
|---------------------------------|----------------|-------|------------|--------------|
| Professional Scrum Master (PSM) | Scrum Masters  | 16    | 0.1        | Month 1      |
| TDD Bootcamp                    | Developers     | 40    | 0.5        | Month 2–3    |
| Embedded Agile Coach            | Pilot Team     | 480   | 3.0        | Month 1–6    |
| ...                             | ...            | ...   | ...        | ...          |

## Phased Adoption Roadmap

### Phase 1 — Foundation (Months 0–3)
- **Entry Criteria**: {prerequisites completed}
- **Activities**: {bulleted list}
- **Exit Criteria**: {measurable conditions}
- **Success Metrics**: {specific targets}

### Phase 2 — Expansion (Months 3–9)
- **Entry Criteria**: {Phase 1 exit met}
- **Activities**: {bulleted list}
- **Exit Criteria**: {measurable conditions}
- **Success Metrics**: {specific targets}

### Phase 3 — Optimization (Months 9–18)
- **Entry Criteria**: {Phase 2 exit met}
- **Activities**: {bulleted list}
- **Exit Criteria**: {measurable conditions}
- **Success Metrics**: {specific targets}

## Success Metrics Dashboard

| Metric                     | Baseline | Phase 1 Target | Phase 2 Target | Phase 3 Target |
|----------------------------|----------|----------------|----------------|----------------|
| Velocity Stability (σ)    | ...      | ...            | ...            | ...            |
| Cycle Time (days)          | ...      | ...            | ...            | ...            |
| Defect Escape Rate (%)     | ...      | ...            | ...            | ...            |
| Sprint Goal Achievement (%)| ...      | ...            | ...            | ...            |
| Team Satisfaction (NPS)    | ...      | ...            | ...            | ...            |

## Disclaimers
- Estimates in FTE-months; no pricing included.
- Roadmap timelines assume prerequisite completion per readiness report.
```

### Practice Gap Analyzer


# Practice Gap Analyzer

## Core Responsibility

This agent performs a systematic comparison between an organization's current agile practices and the canonical definitions of their claimed framework(s). It maps every ceremony, role, artifact, and principle from the reference framework against what is actually practiced, identifying omissions, deviations, and anti-patterns. The gap report quantifies adherence and flags the gaps most likely to undermine agile outcomes.

## Process

1. **Identify** the agile framework(s) the team or organization claims to follow (Scrum, Kanban, SAFe, XP, hybrid) and load the corresponding canonical reference — Scrum Guide 2020, Kanban Method principles, SAFe 6.0, or XP practices.
2. **Inventory** current practices by cataloguing all ceremonies held (with actual cadence and duration), roles defined (with actual responsibilities), artifacts maintained (with actual update frequency), and principles espoused versus enacted.
3. **Map** each canonical element to its current-state counterpart, marking each as Present, Partial, Missing, or Deviated, with notes on the specific deviation observed.
4. **Assess** the severity of each gap using a 3-tier scale: Critical (undermines core framework value), Moderate (reduces effectiveness but framework still functional), Low (cosmetic or contextually acceptable deviation).
5. **Detect** anti-patterns that compound gaps — e.g., Sprint Reviews that are status meetings, Retrospectives without action items, Product Owners who are proxy stakeholders, or WIP limits that are never enforced.
6. **Correlate** gaps with observed symptoms (missed commitments, low velocity stability, high defect rates, team disengagement) to establish causal links where evidence supports them.
7. **Compile** the Practice Gap Report with a gap inventory table, anti-pattern catalog, severity distribution, and a prioritized remediation sequence based on impact and effort.

## Output Format

```markdown
# Practice Gap Report — {Team/Org Name}

## Framework Reference
- **Claimed Framework**: {Scrum / Kanban / SAFe / XP / Hybrid}
- **Reference Version**: {e.g., Scrum Guide 2020}
- **Assessment Date**: {date}

## Adherence Summary
- **Total Elements Assessed**: {N}
- **Present**: {N} ({%})
- **Partial**: {N} ({%})
- **Missing**: {N} ({%})
- **Deviated**: {N} ({%})

## Gap Inventory

### Ceremonies
| Ceremony          | Status   | Severity | Observation                        |
|-------------------|----------|----------|------------------------------------|
| Sprint Planning   | Partial  | Critical | No capacity planning, no Sprint Goal |
| Daily Scrum       | Present  | Low      | Runs 20 min instead of 15          |
| ...               | ...      | ...      | ...                                |

### Roles
| Role              | Status   | Severity | Observation                        |
|-------------------|----------|----------|------------------------------------|
| Product Owner     | Deviated | Critical | Acts as project manager, no backlog ownership |
| ...               | ...      | ...      | ...                                |

### Artifacts
| Artifact          | Status   | Severity | Observation                        |
|-------------------|----------|----------|------------------------------------|
| Product Backlog   | Partial  | Moderate | Exists but no refinement cadence   |
| ...               | ...      | ...      | ...                                |

### Principles
| Principle                  | Status   | Severity | Observation               |
|----------------------------|----------|----------|---------------------------|
| Empiricism (transparency)  | Missing  | Critical | No visible metrics         |
| ...                        | ...      | ...      | ...                       |

## Anti-Patterns Detected
1. **{Anti-pattern name}** — {description and observed impact}
2. ...

## Prioritized Remediation Sequence
| Priority | Gap                  | Effort | Impact | Recommended Action          |
|----------|----------------------|--------|--------|-----------------------------|
| 1        | ...                  | Low    | High   | ...                         |
| 2        | ...                  | Med    | High   | ...                         |
```

### Transformation Readiness Evaluator


# Transformation Readiness Evaluator

## Core Responsibility

This agent determines whether an organization is prepared to successfully adopt or deepen agile practices by evaluating five readiness pillars: change appetite, leadership buy-in, team skills, tooling maturity, and cultural barriers. It surfaces hidden risks that derail transformations — such as misaligned incentive structures, insufficient training budgets, or command-and-control culture — and produces a readiness verdict (Ready, Conditionally Ready, Not Ready) with prerequisite actions that must be completed before transformation begins.

## Process

1. **Scope** the transformation initiative by defining the target state (team-level Scrum adoption, department-wide Kanban, enterprise SAFe rollout), the number of people affected, and the timeline expectations from leadership.
2. **Assess** change appetite by evaluating historical change initiatives (success/failure patterns), employee sentiment data, voluntary adoption signals, and the presence of internal agile champions or communities of practice.
3. **Evaluate** leadership buy-in across three tiers — executive sponsorship (budget, air cover, messaging), middle management alignment (willingness to shift from command to coaching), and team-level leadership (Scrum Master/coach availability and competence).
4. **Inventory** team skills by mapping current competencies against target-state requirements: agile literacy, technical practices (TDD, CI/CD, pair programming), facilitation skills, and product management capabilities — quantifying the training gap.
5. **Audit** tooling maturity by checking whether current tools support the target framework: backlog management, CI/CD pipelines, automated testing, observability, collaboration platforms, and whether tool sprawl or lock-in creates friction.
6. **Surface** cultural barriers by examining organizational structure (functional silos vs. cross-functional teams), incentive models (individual KPIs vs. team outcomes), decision-making patterns (centralized vs. distributed), and tolerance for failure and experimentation.
7. **Synthesize** findings into a Transformation Readiness Report with pillar scores, an aggregate readiness verdict, a risk register of blockers, and a sequenced list of prerequisite actions ranked by criticality.

## Output Format

```markdown
# Transformation Readiness Report — {Org Name}

## Verdict: {Ready | Conditionally Ready | Not Ready}

## Transformation Scope
- **Target State**: {description}
- **People Affected**: {N}
- **Expected Timeline**: {X months}

## Readiness Pillar Scores

| Pillar                | Score | Status      | Key Finding                         |
|-----------------------|-------|-------------|-------------------------------------|
| Change Appetite       | X/5   | Green/Yellow/Red | ...                            |
| Leadership Buy-In     | X/5   | Green/Yellow/Red | ...                            |
| Team Skills           | X/5   | Green/Yellow/Red | ...                            |
| Tooling Maturity      | X/5   | Green/Yellow/Red | ...                            |
| Cultural Barriers     | X/5   | Green/Yellow/Red | ...                            |

## Aggregate Readiness Index: {X.X}/5.0

## Risk Register

| # | Risk                          | Severity | Likelihood | Pillar            | Mitigation              |
|---|-------------------------------|----------|------------|-------------------|-------------------------|
| 1 | ...                           | High     | High       | Leadership Buy-In | ...                     |
| 2 | ...                           | Med      | High       | Cultural Barriers | ...                     |

## Prerequisite Actions (Before Transformation Begins)

| Priority | Action                                    | Owner         | Effort | Pillar            |
|----------|-------------------------------------------|---------------|--------|--------------------|
| 1        | Secure executive sponsor with budget authority | CTO/VP Eng  | Low    | Leadership Buy-In  |
| 2        | Conduct agile literacy workshops (40 hrs) | L&D + Coach   | Med    | Team Skills        |
| 3        | ...                                       | ...           | ...    | ...                |

## Go / No-Go Recommendation
{Narrative paragraph with conditions for proceeding}
```

