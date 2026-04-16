---
name: apex-engagement-strategy
description: >
  Use when the user asks to "create engagement strategy", "plan stakeholder engagement",
  "design influence approach", "manage stakeholder resistance", or "build coalition support".
  Activates when a stakeholder needs to design targeted engagement strategies, move stakeholders
  from current to desired engagement levels, build champion coalitions, analyze and respond
  to resistance, or track engagement effectiveness over time.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Stakeholder Engagement Strategy

**TL;DR**: Designs targeted engagement strategies to move each stakeholder from their current engagement level to the desired level. Includes influence tactics, engagement activities, coalition building, and resistance management approaches tailored to stakeholder power, interest, and current disposition.

## Principio Rector
El engagement no se ordena — se diseña. Cada stakeholder tiene motivaciones, preocupaciones y estilos de comunicación únicos. La estrategia de engagement es un plan de influencia ética: comprender qué le importa a cada stakeholder y mostrar cómo el proyecto sirve a esos intereses.

## Assumptions & Limits
- Assumes a stakeholder register with power/interest analysis exists [SUPUESTO]
- Assumes current engagement levels are assessed through observation, not self-reporting [PLAN]
- Breaks when stakeholder landscape changes significantly without reassessment
- Does not execute engagement activities — provides strategy and action plans
- Resistance analysis requires honest assessment; organizations with blame culture produce sanitized inputs
- Engagement tracking requires longitudinal observation; single-point assessments are misleading [METRIC]

## Usage

```bash
# Create full engagement strategy from stakeholder register
/pm:engagement-strategy $PROJECT --type=full --source="stakeholder-register"

# Design resistance management approach for specific stakeholders
/pm:engagement-strategy $PROJECT --type=resistance --stakeholders="VP-Finance,CTO"

# Build coalition map for project support
/pm:engagement-strategy $PROJECT --type=coalition --objective="budget-approval"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project identifier |
| `--type` | Yes | `full`, `resistance`, `coalition`, `tracking`, `single-stakeholder` |
| `--source` | No | Stakeholder register or analysis document |
| `--stakeholders` | No | Specific stakeholders to focus on |
| `--objective` | No | Coalition objective |

## Service Type Routing
`{TIPO_PROYECTO}`: Transformation requires intensive engagement for change adoption; Portfolio needs functional champion engagement per module; Agile needs management engagement for culture shift.

## Before Strategizing

1. **Read** the stakeholder register with power/interest analysis and current engagement levels
2. **Read** organizational political landscape and historical engagement successes/failures
3. **Glob** `skills/engagement-strategy/references/*.md` for influence frameworks and tactics
4. **Grep** for prior engagement feedback or stakeholder satisfaction data

## Entrada (Input Requirements)
- Stakeholder register with power/interest analysis
- Current vs. desired engagement levels
- Organizational political landscape
- Historical engagement successes and failures

## Proceso (Protocol)
1. **Gap prioritization** — Rank engagement gaps by impact on project success
2. **Motivation mapping** — Understand each key stakeholder's drivers and concerns
3. **Influence approach** — Design specific tactics per stakeholder (coalition, demonstration, data, authority)
4. **Activity design** — Plan engagement activities (demos, workshops, one-on-ones, site visits)
5. **Coalition building** — Identify and leverage champion stakeholders to influence others
6. **Resistance analysis** — Understand root causes of resistance (fear, loss, uncertainty)
7. **Resistance response** — Design specific approaches for resistant stakeholders
8. **Timeline** — Schedule engagement activities aligned with project milestones
9. **Effectiveness tracking** — Define metrics to measure engagement progress
10. **Adaptation protocol** — Plan for adjusting strategies based on results

## Edge Cases

1. **Key stakeholder engagement declining despite efforts**: Reassess motivation mapping. Engagement may address wrong concern. Conduct private 1-on-1 to surface real issue. [STAKEHOLDER]
2. **Active sabotage detected**: Document evidence objectively. Escalate to sponsor with impact analysis. Do not confront directly — use governance channels. [PLAN]
3. **Sponsor engagement below "Supportive"**: Critical risk to project survival. Immediate 1-on-1 with sponsor. Realign project value proposition to sponsor's priorities. [STAKEHOLDER]
4. **Coalition insufficient to overcome organized resistance**: Expand coalition search. Seek higher-authority champions. Consider phased approach to demonstrate value before full rollout. [PLAN]

## Example: Good vs Bad

**Good Engagement Strategy:**

| Attribute | Value |
|-----------|-------|
| Stakeholders covered | Every key stakeholder with individual strategy |
| Motivation mapping | Specific drivers and concerns per stakeholder |
| Influence tactics | Tailored per stakeholder (data, demo, authority) |
| Coalition map | Champions identified with influence pathways |
| Resistance response | Root causes addressed, not symptoms |
| Tracking metrics | Engagement level measured quarterly |

**Bad Engagement Strategy:**
A plan that says "engage all stakeholders through monthly emails." No individual strategies, no motivation mapping, no coalition building, no resistance analysis. Fails because uniform engagement ignores the reality that each stakeholder has unique motivations and responds to different influence approaches.

## Validation Gate
- [ ] Every key stakeholder has individual engagement strategy with motivation mapping
- [ ] Current and desired engagement levels documented for each stakeholder
- [ ] Influence tactics tailored per stakeholder — no one-size-fits-all approach
- [ ] ≥3 engagement activities planned and scheduled per critical stakeholder
- [ ] Coalition map identifies ≥2 champion stakeholders with influence pathways
- [ ] Resistance root causes analyzed (fear, loss, uncertainty) — not just symptoms
- [ ] Engagement tracking metrics defined with measurement cadence (monthly or quarterly)
- [ ] Adaptation protocol defines when and how to adjust failing strategies
- [ ] All approaches ethical and respectful of stakeholder autonomy [STAKEHOLDER]
- [ ] Engagement cadence aligned with project rhythm and milestones [PLAN]

## Escalation Triggers
- Key stakeholder engagement declining despite efforts
- Active sabotage detected
- Sponsor engagement below "Supportive" level
- Coalition insufficient to overcome organized resistance

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before strategizing to understand influence theory | `references/body-of-knowledge.md` |
| State of the Art | When exploring modern engagement approaches | `references/state-of-the-art.md` |
| Knowledge Graph | To link engagement to stakeholder register and communication plan | `references/knowledge-graph.mmd` |
| Use Case Prompts | When designing engagement activities | `prompts/use-case-prompts.md` |
| Metaprompts | To generate stakeholder engagement templates | `prompts/metaprompts.md` |
| Sample Output | To calibrate expected engagement strategy format | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

---

---

## Sub-Agents

### Engagement Level Assessor


# Engagement Level Assessor

## Core Responsibility

This agent evaluates where each stakeholder currently sits on the five-level engagement spectrum (Unaware, Resistant, Neutral, Supportive, Leading) and determines the desired engagement level required for project success. By mapping the gap between current and target states, it produces a prioritized action roadmap that directs engagement resources toward the stakeholders whose movement will have the greatest impact on project outcomes.

## Process

1. **Catalog** all identified stakeholders from the stakeholder register, capturing their role, department, decision authority, and project touchpoints.
2. **Assess** each stakeholder's current engagement level using behavioral evidence: meeting attendance, feedback tone, communication responsiveness, and visible advocacy or opposition.
3. **Define** the desired engagement level for each stakeholder based on their influence on project success, delivery dependencies, and organizational authority.
4. **Calculate** the engagement gap (current vs desired) and classify each gap as Critical (3+ levels), Significant (2 levels), Moderate (1 level), or Aligned (0 levels).
5. **Prioritize** stakeholders by gap severity weighted against their power-interest score, ensuring high-influence stakeholders with large gaps receive immediate attention.
6. **Recommend** specific movement strategies for each gap tier: awareness campaigns for Unaware, dialogue sessions for Resistant, benefit framing for Neutral, empowerment for Supportive-to-Leading transitions.
7. **Document** the full engagement gap matrix with timestamps, evidence citations, and recommended review cadence for reassessment.

## Output Format

```markdown
# Engagement Level Assessment — {Project Name}

## Assessment Summary
| Metric | Value |
|--------|-------|
| Total stakeholders assessed | {n} |
| Critical gaps (3+ levels) | {n} |
| Significant gaps (2 levels) | {n} |
| Aligned stakeholders | {n} |

## Engagement Gap Matrix
| Stakeholder | Role | Current Level | Desired Level | Gap | Priority | Recommended Action |
|-------------|------|---------------|---------------|-----|----------|--------------------|
| {Name} | {Role} | {Level} | {Level} | {Critical/Significant/Moderate/Aligned} | {P1-P4} | {Action summary} |

## Critical Gap Action Plans
### {Stakeholder Name} — {Current} → {Desired}
- **Evidence of current level**: {behavioral indicators}
- **Why desired level is needed**: {project dependency}
- **Movement strategy**: {specific actions}
- **Timeline**: {target date for reassessment}
- **Success indicator**: {measurable behavior change}

## Reassessment Schedule
- Next review: {date}
- Cadence: {frequency}
```

### Engagement Tracker


# Engagement Tracker

## Core Responsibility

This agent establishes and operates a continuous engagement monitoring system that tracks stakeholder engagement levels across multiple data sources — pulse surveys, meeting attendance and participation quality, feedback depth and sentiment, action item follow-through, and informal behavioral signals. It maintains a rolling engagement dashboard with trend analysis and configurable alert thresholds that trigger early warning notifications when engagement drops, enabling proactive intervention before disengagement becomes entrenched.

## Process

1. **Establish** the engagement measurement framework: define the composite engagement score (0-100) built from weighted indicators — meeting participation (20%), feedback quality and frequency (20%), action item completion (20%), survey sentiment (20%), and behavioral signals (20%).
2. **Configure** alert thresholds for each stakeholder tier: red alert at 30% drop from baseline for critical-path stakeholders, amber alert at 20% drop for high-influence stakeholders, and yellow alert at 15% drop for general stakeholders.
3. **Collect** engagement data from all available sources on the defined cadence: weekly meeting attendance logs, bi-weekly pulse surveys (3-5 questions), monthly feedback quality assessments, continuous action item tracking, and ad-hoc behavioral observations from the project team.
4. **Calculate** composite engagement scores per stakeholder and per stakeholder group, applying time-weighted averaging that emphasizes recent data while retaining trend visibility over the full project lifecycle.
5. **Analyze** trends using rolling 4-week windows: identify declining trajectories before they hit alert thresholds, detect sudden drops that indicate triggering events, and correlate engagement patterns with project milestones, organizational events, or communication gaps.
6. **Alert** appropriate stakeholders when thresholds are breached: generate structured alert packages containing the affected stakeholder, current score, trend direction, probable cause hypothesis, and recommended immediate actions.
7. **Report** engagement status through a weekly dashboard update and monthly trend report, highlighting movements between engagement levels, effectiveness of active interventions, and forecast of engagement trajectory for the upcoming period.

## Output Format

```markdown
# Engagement Tracking Dashboard — {Project Name}

## Period: {Start Date} — {End Date}

## Executive Summary
| Metric | Value | Trend |
|--------|-------|-------|
| Average engagement score | {n}/100 | {arrow} |
| Stakeholders above target | {n}/{total} | {arrow} |
| Active alerts | {red}/{amber}/{yellow} | — |
| Interventions in progress | {n} | — |

## Stakeholder Engagement Scores
| Stakeholder | Role | Tier | Current Score | Previous Score | Trend | Alert |
|-------------|------|------|---------------|----------------|-------|-------|
| {Name} | {Role} | {Critical/High/General} | {n}/100 | {n}/100 | {Rising/Stable/Declining} | {Red/Amber/Yellow/None} |

## Score Breakdown (Sample)
### {Stakeholder Name}
| Indicator | Weight | Score | Evidence |
|-----------|--------|-------|----------|
| Meeting participation | 20% | {n}/100 | {attended x/y meetings, active in n} |
| Feedback quality | 20% | {n}/100 | {substantive comments, response time} |
| Action item completion | 20% | {n}/100 | {completed x/y on time} |
| Survey sentiment | 20% | {n}/100 | {latest pulse result} |
| Behavioral signals | 20% | {n}/100 | {observations} |
| **Composite** | **100%** | **{n}/100** | — |

## Active Alerts
### {Alert Level}: {Stakeholder Name}
- **Current score**: {n}/100 (down from {n}/100)
- **Threshold breached**: {type} at {value}
- **Probable cause**: {hypothesis based on data}
- **Recommended action**: {immediate intervention}
- **Assigned to**: {owner}

## Trend Analysis
- **Improving**: {list of stakeholders with positive trajectory}
- **Stable**: {list of stakeholders holding target}
- **Declining**: {list of stakeholders with negative trajectory}
- **Correlation noted**: {engagement pattern linked to event}

## Intervention Effectiveness
| Stakeholder | Intervention | Start Date | Score Before | Score Now | Status |
|-------------|-------------|------------|--------------|-----------|--------|
| {Name} | {Action taken} | {Date} | {n} | {n} | {Effective/In Progress/Ineffective} |

## Next Period Forecast
- **At-risk stakeholders**: {list with projected score}
- **Upcoming triggers**: {milestones or events that may affect engagement}
- **Recommended proactive actions**: {preventive measures}
```

### Influence Strategy Designer


# Influence Strategy Designer

## Core Responsibility

This agent crafts individualized influence strategies for each stakeholder by analyzing the intersection of their organizational power, project interest level, current attitude toward the initiative, and preferred communication channels. It selects from proven influence tactics — rational persuasion, inspirational appeal, consultation, collaboration, coalition building, and legitimating — to construct approach plans that respect each stakeholder's decision-making style while advancing project objectives.

## Process

1. **Profile** each stakeholder across four dimensions: power (formal authority, resource control, network centrality), interest (direct impact, career alignment, departmental stake), attitude (champion, supporter, neutral, skeptic, opponent), and communication preference (data-driven, narrative, visual, peer-validated).
2. **Classify** stakeholders into influence quadrants: Manage Closely (high power, high interest), Keep Satisfied (high power, low interest), Keep Informed (low power, high interest), Monitor (low power, low interest).
3. **Select** primary and secondary influence tactics for each stakeholder based on their profile — rational persuasion for data-driven executives, consultation for control-oriented managers, inspirational appeal for vision-oriented leaders, coalition building for politically-aware stakeholders.
4. **Design** the communication cadence and channel mix: frequency of touchpoints, preferred formats (1:1 meetings, steering committees, written briefs, dashboards), and message framing (ROI, risk reduction, innovation, competitive advantage).
5. **Map** influence pathways by identifying who influences whom — trusted advisors, reporting lines, informal networks — to leverage indirect influence where direct access is limited.
6. **Construct** per-stakeholder engagement scripts that include opening frames, key messages, anticipated objections, and prepared responses aligned to their attitude and decision style.
7. **Validate** each strategy against organizational culture norms and political dynamics, adjusting tactics that could trigger defensive reactions or be perceived as manipulative.

## Output Format

```markdown
# Influence Strategy Plan — {Project Name}

## Stakeholder Influence Profiles
| Stakeholder | Power | Interest | Attitude | Comm Style | Quadrant | Primary Tactic |
|-------------|-------|----------|----------|------------|----------|----------------|
| {Name} | {H/M/L} | {H/M/L} | {Champion→Opponent} | {Style} | {Quadrant} | {Tactic} |

## Influence Network Map
- {Stakeholder A} → influences → {Stakeholder B} (relationship: {type})
- Indirect pathway: {A} → {C} → {B}

## Per-Stakeholder Strategy Cards

### {Stakeholder Name} — {Role}
- **Profile**: Power {level} · Interest {level} · Attitude {type} · Style {type}
- **Quadrant**: {classification}
- **Primary tactic**: {tactic} — {rationale}
- **Secondary tactic**: {tactic} — {fallback rationale}
- **Communication plan**: {cadence, channel, format}
- **Key messages**: {3 framed messages}
- **Anticipated objections**: {objection → response pairs}
- **Influence pathway**: {direct or indirect route}
- **Success metric**: {observable behavior or commitment}

## Coalition Strategy
- **Core coalition members**: {list}
- **Swing stakeholders**: {list with approach}
- **Isolation strategy for blockers**: {ethical approach}
```

### Resistance Mitigator


# Resistance Mitigator

## Core Responsibility

This agent diagnoses the root causes behind stakeholder resistance — whether driven by fear of change, perceived loss of control, competing departmental priorities, past negative experiences, or genuine technical concerns — and designs targeted mitigation plans that address the underlying cause rather than just the visible symptom. It operates on the principle that resistance is information, not obstruction, and that effective mitigation converts resistors into informed participants through the right combination of education, involvement, negotiation, and, when necessary, escalation.

## Process

1. **Identify** all stakeholders exhibiting resistance behaviors: active opposition (vocal criticism, blocking decisions, withholding resources), passive resistance (missed meetings, delayed responses, minimal compliance), or covert resistance (apparent agreement with no follow-through, back-channel undermining).
2. **Diagnose** the root cause for each resistant stakeholder through structured analysis: fear-based (job security, skill obsolescence, status loss), control-based (autonomy reduction, process changes, reporting shifts), priority-based (competing initiatives, resource conflicts, timeline pressures), experience-based (past project failures, broken promises, change fatigue), or substance-based (legitimate technical or business concerns).
3. **Classify** each resistance source by severity (blocking, delaying, or friction) and by legitimacy (valid concern requiring project adjustment vs. perception requiring education).
4. **Design** targeted mitigation for each root cause: education programs for knowledge gaps, involvement opportunities for control concerns, negotiation frameworks for competing priorities, acknowledgment and adjustment for legitimate concerns, and escalation protocols for persistent blocking behavior.
5. **Sequence** mitigation actions by urgency and dependency — address blocking resistance on the critical path first, use early wins to build momentum, and time interventions to coincide with natural decision points.
6. **Prepare** escalation criteria and pathways: define when resistance crosses from manageable to project-threatening, who the escalation authority is, and what evidence package is required to trigger escalation without damaging relationships.
7. **Monitor** mitigation effectiveness through behavioral indicators: changes in meeting participation, response times, language shifts (from "they" to "we"), voluntary contributions, and removal of previously imposed conditions.

## Output Format

```markdown
# Resistance Mitigation Plan — {Project Name}

## Resistance Landscape
| Stakeholder | Resistance Type | Root Cause | Severity | Legitimacy | Status |
|-------------|-----------------|------------|----------|------------|--------|
| {Name} | {Active/Passive/Covert} | {Category} | {Blocking/Delaying/Friction} | {Valid/Perceived} | {Open/Mitigating/Resolved} |

## Root Cause Analysis

### {Stakeholder Name} — {Resistance Type}
- **Observable behaviors**: {specific evidence}
- **Root cause diagnosis**: {detailed cause analysis}
- **Legitimacy assessment**: {valid concern vs. perception}
- **Impact on project**: {what is blocked or delayed}

## Mitigation Strategies

### {Stakeholder Name}
- **Primary approach**: {Education/Involvement/Negotiation/Escalation}
- **Specific actions**:
  1. {Action with owner and date}
  2. {Action with owner and date}
  3. {Action with owner and date}
- **Key message**: {reframed message addressing root cause}
- **Concessions available**: {what can be offered}
- **Non-negotiables**: {what cannot change}
- **Success indicator**: {behavioral change expected}
- **Escalation trigger**: {condition that triggers escalation}

## Escalation Protocol
| Trigger Condition | Evidence Required | Escalation Authority | Timeline |
|-------------------|-------------------|---------------------|----------|
| {Condition} | {Evidence} | {Authority} | {Deadline} |

## Mitigation Effectiveness Tracking
| Stakeholder | Baseline Behavior | Current Behavior | Trend | Next Action |
|-------------|-------------------|------------------|-------|-------------|
| {Name} | {Before} | {Now} | {Improving/Stable/Declining} | {Action} |
```

