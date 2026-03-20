---
name: apex-stakeholder-register
description: >
  Use when the user asks to "identify stakeholders", "create stakeholder register",
  "map stakeholder power/interest", "analyze stakeholders", "design engagement strategies",
  or mentions stakeholder identification, power-interest matrix, influence mapping,
  stakeholder analysis, engagement level assessment.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Stakeholder Register & Analysis

**TL;DR**: Identifies and analyzes all project stakeholders using power/interest matrix, influence/impact grid, and salience model. Produces a stakeholder register with engagement levels, communication preferences, and management strategies tailored to each stakeholder's position and needs.

## Principio Rector
Los proyectos no fracasan por razones técnicas — fracasan por razones humanas. Los stakeholders son el contexto político del proyecto. Ignorar a un stakeholder con alto poder y bajo interés es invitar a una emboscada; sobrecargar a uno con bajo poder y alto interés es desperdiciar energía. El análisis de stakeholders es el GPS político del PM.

## Assumptions & Limits
- Assumes project charter identifies at least the sponsor [STAKEHOLDER]
- Assumes organizational chart is available for stakeholder identification [SUPUESTO]
- Breaks when stakeholder landscape is completely unknown — start with charter and expand
- Does not manage stakeholder relationships; creates the analysis for management planning
- Assumes stakeholder analysis will be refreshed quarterly or at major project events [SUPUESTO]
- Limited to project stakeholders; for organizational change management use transformation skills

## Usage

```bash
# Full stakeholder register and analysis
/pm:stakeholder-register $ARGUMENTS="--charter charter.md --org-chart org.md"

# Power/interest matrix only
/pm:stakeholder-register --type power-interest --stakeholders initial-list.md

# Engagement gap analysis
/pm:stakeholder-register --type engagement-gap --register existing-register.md
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Path to charter and organizational chart |
| `--type` | No | `full` (default), `power-interest`, `engagement-gap`, `refresh` |
| `--register` | No | Existing register for refresh/update |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Product Owner as primary stakeholder proxy; lightweight power/interest mapping; sprint review as engagement mechanism
- **Waterfall**: Formal stakeholder register with power/interest matrix and communication management plan per PMBOK
- **SAFe**: Multi-level stakeholders -- team, ART, solution, and portfolio; Business Owners as key stakeholder role in PI Planning
- **Transformation**: OCM-level stakeholder engagement; change champions network; resistance mapping and intervention planning
- **PMO**: Governance stakeholders across portfolio; steering committee composition and escalation paths
- **Portfolio**: Executive sponsors, program managers, and cross-project stakeholders with strategic alignment interests

## Before Analyzing Stakeholders
1. **Read** the project charter to identify sponsor and initially mentioned stakeholders [STAKEHOLDER]
2. **Read** organizational chart to discover stakeholders by structural position [PLAN]
3. **Glob** `**/stakeholder*` to check for existing stakeholder analysis from similar projects [PLAN]
4. **Grep** for role titles and department names in project brief to identify impacted groups [INFERENCIA]

## Entrada (Input Requirements)
- Project charter with sponsor identification
- Organizational chart
- Input analysis with mentioned stakeholders
- Historical stakeholder data from similar projects

## Proceso (Protocol)
1. **Identification** — List all individuals and groups affected by or affecting the project
2. **Classification** — Categorize: internal/external, supporter/neutral/resistor
3. **Power/Interest analysis** — Rate power (1-5) and interest (1-5) for each stakeholder
4. **Current engagement** — Assess current engagement level (Unaware, Resistant, Neutral, Supportive, Leading)
5. **Desired engagement** — Define target engagement level for project success
6. **Gap analysis** — Identify gaps between current and desired engagement
7. **Strategy design** — Design engagement approach per stakeholder (Manage Closely, Keep Satisfied, Keep Informed, Monitor)
8. **Communication preferences** — Document preferred channels, frequency, and format
9. **Compile register** — Build formal stakeholder register with all attributes
10. **Review schedule** — Establish quarterly stakeholder analysis refresh

## Edge Cases
1. **Key stakeholder actively opposing project** — Classify as high-power resistor. Design influence strategy: understand their concerns, find common ground, involve sponsor for alignment. Do not ignore or dismiss [STAKEHOLDER].
2. **Sponsor disengaged or unavailable** — Flag as critical project risk. Without sponsor engagement, the project lacks organizational authority. Escalate to governance [STAKEHOLDER].
3. **Stakeholder map changes significantly mid-project** — Trigger stakeholder refresh. Reassess all strategies. New high-power stakeholders require immediate engagement plan [PLAN].
4. **Conflicting stakeholder interests with no resolution path** — Document both positions. Escalate to sponsor for arbitration. Do not proceed with ambiguous direction [STAKEHOLDER].

## Example: Good vs Bad

**Good example — Actionable stakeholder register:**

| Attribute | Value |
|-----------|-------|
| Stakeholders identified | 18 stakeholders across 5 categories |
| Power/interest | Quadrant chart with all 18 mapped |
| Engagement gaps | 5 stakeholders with current ≠ desired engagement |
| Strategies | 4 quadrant strategies with specific actions |
| Communication | Preferences documented per stakeholder |
| Refresh cadence | Quarterly analysis refresh scheduled |

**Bad example — Name list:**
A list of 30 names with no power/interest ratings, no engagement assessment, no management strategies. A stakeholder list without analysis is a contact directory, not a management tool. Without power/interest mapping, the PM cannot prioritize engagement effort.

## Salida (Deliverables)
- `00_stakeholder_register_{proyecto}_{WIP}.md` — Stakeholder register
- Power/Interest matrix (Mermaid quadrant chart)
- Engagement gap analysis table
- Stakeholder management strategy per quadrant
- Communication preferences summary

## Validation Gate
- [ ] Every stakeholder rated on power (1-5) and interest (1-5) [METRIC]
- [ ] Current and desired engagement levels assessed for every stakeholder [PLAN]
- [ ] ≥1 engagement gap identified with mitigation strategy [PLAN]
- [ ] Power/interest matrix visualized (Mermaid quadrant) [PLAN]
- [ ] Management strategy defined per quadrant (Manage Closely, Keep Satisfied, Keep Informed, Monitor) [PLAN]
- [ ] Communication preferences documented per stakeholder [STAKEHOLDER]
- [ ] Sponsor identified with engagement level confirmed [STAKEHOLDER]
- [ ] Quarterly refresh cadence established [SCHEDULE]
- [ ] Evidence ratio: ≥70% [STAKEHOLDER]/[PLAN], <30% [SUPUESTO]
- [ ] Resistant stakeholders flagged with specific engagement strategy [STAKEHOLDER]

## Escalation Triggers
- Key stakeholder actively opposing project
- Sponsor disengaged or unavailable
- Conflicting stakeholder interests with no resolution path
- Stakeholder map changes significantly mid-project

## Additional Resources

| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | PMBOK stakeholder management | `references/body-of-knowledge.md` |
| State of the Art | Modern stakeholder engagement techniques | `references/state-of-the-art.md` |
| Knowledge Graph | Stakeholder register in Phase 0 | `references/knowledge-graph.mmd` |
| Use Case Prompts | Stakeholder analysis scenarios | `prompts/use-case-prompts.md` |
| Metaprompts | Custom stakeholder frameworks | `prompts/metaprompts.md` |
| Sample Output | Reference stakeholder register | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

---

---

## Sub-Agents

### Engagement Strategist


## Engagement Strategist Agent

### Core Responsibility

Move beyond generic "keep informed" labels to design specific, actionable engagement plans. Each key stakeholder gets a personalized approach: what information, through which channel, at what frequency, by whom.

### Process

1. **Design per-stakeholder plans.** For each Manage Closely and Keep Satisfied stakeholder, define: (a) key messages, (b) preferred channel, (c) frequency, (d) responsible communicator.
2. **Group lower-priority stakeholders.** Keep Informed and Monitor stakeholders can be grouped for efficiency. Design group communication approaches (newsletters, dashboards, town halls).
3. **Map to project phases.** Engagement intensity varies by phase. Sponsors need more touchpoints during initiation and gate reviews. End users need more during UAT and rollout.
4. **Design resistance mitigation.** For stakeholders identified as potential resistors, create specific influence strategies: early involvement, quick wins, champion recruitment.
5. **Define escalation paths.** For unresponsive or actively resistant stakeholders, define when and how to escalate: peer influence, sponsor intervention, formal escalation.
6. **Build the engagement calendar.** Create a timeline showing key touchpoints: kickoff invite, review sessions, approvals needed, sign-offs required.
7. **Produce engagement plan.** Output per-stakeholder engagement cards for top 10, group plans for remainder, and engagement calendar.

### Output Format

- **Top 10 Stakeholder Engagement Cards** — Individual plans with channel, frequency, messages
- **Group Engagement Plans** — For Keep Informed and Monitor groups
- **Engagement Calendar** — Timeline of key touchpoints mapped to project phases
- **Resistance Mitigation Strategies** — For identified resistors

### Power Interest Mapper


## Power-Interest Mapper Agent

### Core Responsibility

Position every stakeholder on the power/interest grid to determine the appropriate engagement strategy. High-power/high-interest stakeholders are managed closely; low-power/low-interest are monitored. Misclassification leads to either wasted effort or dangerous neglect.

### Process

1. **Assess power.** For each stakeholder, rate organizational power (1-5): authority to approve/block, budget control, resource allocation, political influence.
2. **Assess interest.** Rate project interest (1-5): how much the project affects them, how actively they engage, how much they care about outcomes.
3. **Plot on matrix.** Assign each stakeholder to one of 4 quadrants:
   - **High Power / High Interest** → Manage Closely (key players)
   - **High Power / Low Interest** → Keep Satisfied (latent power, can activate)
   - **Low Power / High Interest** → Keep Informed (advocates or vocal critics)
   - **Low Power / Low Interest** → Monitor (minimal effort)
4. **Identify movers.** Flag stakeholders whose power or interest is likely to CHANGE during the project (e.g., a regulator becomes relevant at compliance phase).
5. **Detect conflicts.** Identify stakeholder pairs with opposing interests. Document the conflict and recommended resolution approach.
6. **Generate Mermaid visualization.** Create a quadrant chart with stakeholder positions using APEX colors.
7. **Produce classification report.** Output the complete matrix with engagement strategy per quadrant.

### Output Format

- **Power/Interest Matrix** — Mermaid quadrant chart
- **Quadrant Assignment Table** — Each stakeholder with P, I scores and quadrant
- **Engagement Strategy** — Per-quadrant communication approach
- **Conflict Map** — Opposing stakeholder pairs with resolution notes

### Salience Scorer


## Salience Scorer Agent

### Core Responsibility

Go beyond simple power/interest to assess stakeholder salience using three dimensions: power (ability to impose will), legitimacy (relationship to the project), and urgency (time-sensitivity of their claims). The combination reveals who truly matters and when.

### Process

1. **Score power.** Rate each stakeholder's coercive, utilitarian, and normative power (1-5). Can they force outcomes, control resources, or set social norms?
2. **Score legitimacy.** Rate the stakeholder's legitimate relationship to the project (1-5). Are they contractually involved, legally affected, or morally impacted?
3. **Score urgency.** Rate time-sensitivity and criticality of their claims (1-5). Are their needs time-critical? Will delay cause irreversible harm?
4. **Classify by salience type.** Based on which attributes are present (≥3 out of 5):
   - **Definitive** (all 3) → Highest priority, immediate attention
   - **Dominant** (power + legitimacy) → Formal authority, expect engagement
   - **Dependent** (legitimacy + urgency) → Need allies to get attention
   - **Dangerous** (power + urgency) → Can coerce without legitimacy
   - **Dormant** (power only) → Monitor for activation
   - **Discretionary** (legitimacy only) → Engage at project's choice
   - **Demanding** (urgency only) → Vocal but limited influence
5. **Prioritize engagement.** Definitive > Dominant/Dangerous > Dependent > others. Adjust register priority rankings accordingly.
6. **Identify dynamic salience.** Flag stakeholders whose salience type will shift across project phases (e.g., regulator moves from Dormant to Definitive at compliance milestone).
7. **Produce salience analysis.** Output Mitchell classification with scores, types, and priority recommendations.

### Output Format

| ID | Stakeholder | Power | Legitimacy | Urgency | Salience Type | Priority | Phase Sensitivity |
|----|------------|-------|-----------|---------|--------------|----------|-------------------|
| SH-001 | VP Sales | 5 | 4 | 3 | Definitive | Critical | All phases |

### Stakeholder Identifier


## Stakeholder Identifier Agent

### Core Responsibility

Build an exhaustive stakeholder inventory by analyzing the project's organizational context, value chain, and external dependencies. The most dangerous stakeholders are the ones you didn't know existed.

### Process

1. **Scan organizational layers.** Map upward (sponsors, executives, board), lateral (peer departments, shared services), and downward (team members, end users). Check org charts, RACI drafts, and project brief.
2. **Trace the value chain.** Identify everyone who provides input to, is affected by, or receives output from the project. Include vendors, regulators, customers, and partners.
3. **Mine historical data.** Check similar past projects for stakeholders who emerged late and caused disruption. Read lessons learned for "stakeholder we missed" patterns.
4. **Categorize by type.** Internal vs. External, Direct vs. Indirect, Active vs. Passive. Each stakeholder gets exactly one primary type.
5. **Validate completeness.** Ask: "Who can block this project?" "Who benefits?" "Who loses?" "Who controls resources we need?" "Who has regulatory authority?"
6. **Assign unique IDs.** Format: SH-001, SH-002, etc. Record name, role, organization, contact, and discovery source.
7. **Produce stakeholder inventory.** Output a clean register with all identified stakeholders, categorized and tagged with discovery method.

### Output Format

| ID | Name | Role | Organization | Type | Discovery Method | Evidence |
|----|------|------|-------------|------|-----------------|----------|
| SH-001 | Maria Lopez | VP Sales | Acme Corp | Internal / Sponsor | Project brief | `[STAKEHOLDER]` |

