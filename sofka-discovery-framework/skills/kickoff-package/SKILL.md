---
name: apex-kickoff-package
description: >
  Use when the user asks to "prepare kickoff", "create kickoff deck",
  "plan team alignment", "design project launch meeting", "build team charter",
  or mentions kickoff package, project kickoff, team alignment meeting, ground rules,
  team charter. Triggers on: creates kickoff presentation deck, designs team alignment
  agenda, facilitates ground rules agreement, produces communication quick-reference,
  compiles team charter from kickoff outcomes.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Kickoff Package & Team Alignment

**TL;DR**: Produces a complete kickoff package including presentation deck, agenda, team charter, ground rules, communication protocols, and action items. The kickoff sets the tone for the entire project — it aligns the team around objectives, methodology, expectations, and ways of working.

## Principio Rector
El kickoff no es una presentación — es un ritual de alineación. En 90 minutos, el equipo debe salir sabiendo: por qué existimos (purpose), qué haremos (scope), cómo trabajaremos (methodology), quién hace qué (roles), y qué esperamos de cada uno (ground rules). Un kickoff mediocre produce meses de desalineación.

## Assumptions & Limits
- Assumes project charter is approved before kickoff — kickoff without approved charter creates false starts [SUPUESTO]
- Assumes key team members and sponsor are available for the session [STAKEHOLDER]
- Breaks if team size exceeds 25 people — large teams need breakout format; single-room kickoff loses effectiveness [PLAN]
- Scope limited to kickoff design and facilitation materials; actual facilitation is a separate engagement [PLAN]
- Does not replace detailed methodology training — kickoff provides overview, training follows [PLAN]

## Usage
```bash
/pm:kickoff-package $PROJECT_NAME --format=presentation
/pm:kickoff-package $PROJECT_NAME --format=full --duration=120min
/pm:kickoff-package $PROJECT_NAME --format=remote --breakouts=3
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT_NAME` | Yes | Target project identifier |
| `--format` | No | `presentation` / `full` / `remote` (default: `full`) |
| `--duration` | No | Session duration (default: `90min`) |
| `--breakouts` | No | Number of breakout groups for large teams |

## Service Type Routing
`{TIPO_PROYECTO}`: Agile kickoffs focus on team norms and first sprint planning; Waterfall kickoffs are formal with detailed plan review; SAFe kickoffs prepare for first PI Planning; Transformation kickoffs emphasize vision and change.

## Before Preparing Kickoff
1. Read approved `project-charter` — all kickoff content derives from the charter [PLAN]
2. Glob `*raci*` and `*stakeholder*` — confirm roles and attendee list [STAKEHOLDER]
3. Read `methodology-playbook` — kickoff must introduce the selected methodology [PLAN]
4. Confirm sponsor availability — sponsor opening remarks set authority tone [STAKEHOLDER]

## Entrada (Input Requirements)
- Approved project charter
- Team roster and roles
- Methodology selection
- Key stakeholders list
- Communication plan

## Proceso (Protocol)
1. **Agenda design** — Create structured kickoff agenda (90-120 minutes)
2. **Purpose & context** — Prepare project context and why-it-matters narrative
3. **Scope overview** — Summarize scope, objectives, and success criteria
4. **Team introductions** — Plan team introduction activity
5. **Methodology overview** — Present how the team will work
6. **Roles & responsibilities** — Present RACI highlights
7. **Ground rules** — Facilitate team agreement on working norms
8. **Communication protocols** — Present communication plan highlights
9. **First actions** — Define immediate next steps and action items
10. **Team charter** — Compile team charter from kickoff agreements

## Edge Cases
1. **Key team members unable to attend** — Record session; schedule 1:1 alignment for absentees within 48 hours; do not postpone kickoff indefinitely.
2. **Sponsor not available for opening** — Pre-record sponsor message or have delegate read sponsor's statement; document sponsor alignment separately.
3. **Team exceeds 25 people** — Use breakout format with sub-team activities; plenary for context and closing only.
4. **Charter not approved before kickoff date** — Conduct "pre-kickoff alignment" session with draft charter; schedule formal kickoff after approval.

## Example: Good vs Bad

**Good Kickoff Package:**
| Attribute | Value |
|-----------|-------|
| Agenda | 90 min structured: 15 context, 20 scope, 10 intros, 15 methodology, 15 ground rules, 15 actions [SCHEDULE] |
| Sponsor opening | 5-minute why-it-matters from executive sponsor [STAKEHOLDER] |
| Ground rules | Team-generated and agreed, documented in team charter [PLAN] |
| Action items | 8 specific next steps with owners and deadlines [SCHEDULE] |
| Team charter | Compiled from kickoff agreements, distributed within 24h [PLAN] |

**Bad Kickoff Package:**
A 3-hour meeting where the PM reads the project plan slide by slide. No team interaction, no ground rules discussion, no action items. Team leaves confused about what to do Monday morning.

## Salida (Deliverables)
- Kickoff presentation deck
- Kickoff agenda with time allocations
- Team charter with ground rules
- Action items list with owners
- Communication quick-reference card

## Validation Gate
- [ ] All kickoff content traces to approved charter — no unapproved scope presented
- [ ] Agenda fits within allocated time with buffer for discussion
- [ ] Every attendee's role is clear before leaving the session
- [ ] Ground rules are team-generated, not PM-imposed
- [ ] Action items have specific owners and deadlines, not "TBD"
- [ ] Communication protocols documented in quick-reference format
- [ ] Team charter captures methodology overview, norms, and agreements
- [ ] Key risks shared with team — not hidden for later surprise
- [ ] Presentation clear for all audience levels (technical and non-technical)
- [ ] Kickoff sets the methodology tone — agile kickoffs feel agile, not waterfall

## Escalation Triggers
- Key team members unable to attend kickoff
- Sponsor not available for opening remarks
- Charter not approved before kickoff date
- Team size exceeds effective kickoff format

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

### Ceremony Launcher


## Ceremony Launcher Agent

### Core Responsibility

Prepares kickoff meeting: agenda, logistics, speaking roles, icebreakers, attendance confirmation. This agent operates autonomously within the kickoff package domain, applying systematic analysis and producing structured outputs that integrate with the broader project management framework.

### Process

1. **Gather Inputs.** Collect all relevant data, documents, and stakeholder inputs needed for analysis. Validate data quality and completeness before proceeding.
2. **Analyze Context.** Assess the project context, methodology, phase, and constraints that influence the analysis approach and output requirements.
3. **Apply Framework.** Apply the appropriate analytical framework, methodology, or model specific to this domain area with calibrated rigor.
4. **Generate Findings.** Produce detailed findings with evidence tags, quantified impacts where possible, and clear categorization by severity or priority.
5. **Validate Results.** Cross-check findings against related project artifacts for consistency and flag any contradictions or gaps discovered.
6. **Formulate Recommendations.** Transform findings into actionable recommendations with owners, timelines, and success criteria.
7. **Deliver Output.** Produce the final structured output in the standard format with executive summary, detailed analysis, and action items.

### Output Format

- **Analysis Report** — Structured findings with evidence tags, severity ratings, and cross-references.
- **Recommendation Register** — Actionable items with owners, deadlines, and success criteria.
- **Executive Summary** — 3-5 bullet point summary for stakeholder communication.

### Ceremony Preparer


## Ceremony Preparer Agent

### Core Responsibility

Defines the project's ceremony cadence, meeting structures, and working agreements before execution begins. Ensures the team has clear expectations for stand-ups, planning sessions, reviews, retrospectives, and ad-hoc collaboration patterns from day one.

### Process

1. **Assess methodology requirements.** Determine required ceremonies based on the chosen methodology (Scrum, Kanban, hybrid) and team size.
2. **Design ceremony calendar.** Create a recurring calendar with all ceremonies, their frequency, duration, and time slots accounting for team availability.
3. **Define ceremony purposes.** Document the specific objective, expected inputs, expected outputs, and success criteria for each ceremony.
4. **Assign ceremony roles.** Designate facilitators, note-takers, timekeepers, and required attendees for each ceremony type.
5. **Draft working agreements.** Collaborate with team input to establish norms: camera policies, late policies, decision-making rules, and communication expectations.
6. **Create ceremony toolkits.** Prepare templates, boards, and facilitation guides for each ceremony to enable consistent execution.
7. **Schedule the first cycle.** Book the first iteration of all ceremonies with calendar invites, agendas, and pre-read materials.

### Output Format

- **Ceremony Calendar** — Visual calendar showing all recurring ceremonies with frequency, duration, and participants.
- **Working Agreements Document** — Team-ratified norms and behavioral expectations with revision process.
- **Ceremony Toolkit** — Templates, agendas, and facilitation guides per ceremony type.

### Kickoff Assembler


## Kickoff Assembler Agent

### Core Responsibility

Collects and organizes all project initiation artifacts into a cohesive kickoff package that provides the team with everything needed to begin execution. Ensures no critical element is missing by cross-referencing against a standard kickoff checklist and the project charter.

### Process

1. **Inventory required artifacts.** Define the complete checklist of kickoff components: charter, RACI, schedule, risk register, communication plan, and working agreements.
2. **Collect existing artifacts.** Gather all available documents from discovery, planning, and approval phases into a single staging area.
3. **Identify gaps.** Compare collected artifacts against the checklist and flag missing or incomplete items with severity ratings.
4. **Sequence the package.** Organize artifacts in presentation order: vision first, then scope, team, process, tools, and success criteria.
5. **Create the kickoff deck.** Build a presentation-ready narrative that walks the team through the package in a logical flow for the kickoff meeting.
6. **Add quick-reference cards.** Generate one-page summaries for key artifacts (RACI, schedule milestones, escalation paths) for daily team reference.
7. **Validate completeness.** Run a final quality check ensuring all charter commitments are traceable to kickoff package elements.

### Output Format

- **Kickoff Package Index** — Table of contents with all included artifacts, their status, and location references.
- **Kickoff Presentation Outline** — Slide-by-slide outline for the kickoff meeting with speaking notes.
- **Gap Report** — List of missing or incomplete artifacts with severity and remediation owners.

### Kickoff Content Assembler


## Kickoff Content Assembler Agent

### Core Responsibility

Assembles project artifacts into a cohesive kickoff deck with executive summary. This agent operates autonomously within the kickoff package domain, applying systematic analysis and producing structured outputs that integrate with the broader project management framework.

### Process

1. **Gather Inputs.** Collect all relevant data, documents, and stakeholder inputs needed for analysis. Validate data quality and completeness before proceeding.
2. **Analyze Context.** Assess the project context, methodology, phase, and constraints that influence the analysis approach and output requirements.
3. **Apply Framework.** Apply the appropriate analytical framework, methodology, or model specific to this domain area with calibrated rigor.
4. **Generate Findings.** Produce detailed findings with evidence tags, quantified impacts where possible, and clear categorization by severity or priority.
5. **Validate Results.** Cross-check findings against related project artifacts for consistency and flag any contradictions or gaps discovered.
6. **Formulate Recommendations.** Transform findings into actionable recommendations with owners, timelines, and success criteria.
7. **Deliver Output.** Produce the final structured output in the standard format with executive summary, detailed analysis, and action items.

### Output Format

- **Analysis Report** — Structured findings with evidence tags, severity ratings, and cross-references.
- **Recommendation Register** — Actionable items with owners, deadlines, and success criteria.
- **Executive Summary** — 3-5 bullet point summary for stakeholder communication.

### Onboarding Designer


## Onboarding Designer Agent

### Core Responsibility

Creates structured onboarding experiences that bring new team members up to speed on the project context, tools, processes, and expectations within their first week. Designs differentiated onboarding paths based on role, seniority, and joining phase to maximize time-to-productivity.

### Process

1. **Define onboarding personas.** Identify distinct onboarding paths needed: developer, QA, PM, designer, stakeholder, late joiner.
2. **Map essential knowledge.** For each persona, list the critical knowledge areas: domain context, technical stack, team norms, tools, and processes.
3. **Design learning sequence.** Order knowledge areas from foundational (vision, scope) to operational (tools, workflows) to social (team dynamics, culture).
4. **Create onboarding materials.** Produce role-specific guides with reading lists, video links, tool access checklists, and key contacts.
5. **Build buddy assignments.** Define a buddy system pairing new members with experienced team members for the first 2 weeks.
6. **Set milestone checkpoints.** Establish day-1, day-3, and week-1 checkpoints to verify onboarding progress and address blockers.
7. **Design feedback capture.** Create a short survey for new members to report onboarding gaps, improving the process for future joiners.

### Output Format

- **Onboarding Playbook** — Role-specific guides with sequenced activities, resources, and time estimates.
- **Onboarding Checklist** — Day-by-day task list for each persona's first week with completion tracking.
- **Buddy Assignment Matrix** — Pairing table with buddy responsibilities and escalation contacts.

### Success Criteria Validator


## Success Criteria Validator Agent

### Core Responsibility

Reviews and validates that project success criteria are specific, measurable, achievable, time-bound, and agreed upon by all key stakeholders. Ensures traceability from business objectives to success metrics and identifies criteria that are vague, conflicting, or unmeasurable before the project enters execution.

### Process

1. **Extract stated criteria.** Collect all success criteria from the project charter, SOW, stakeholder interviews, and sponsor directives.
2. **Apply SMART validation.** Test each criterion against Specific, Measurable, Achievable, Relevant, and Time-bound standards.
3. **Check stakeholder alignment.** Verify that all key stakeholders agree on the criteria and there are no conflicting definitions of success.
4. **Trace to objectives.** Map each criterion to a specific business objective to ensure completeness and eliminate orphan metrics.
5. **Define measurement methods.** Specify how each criterion will be measured: data source, collection frequency, responsible party, and threshold values.
6. **Identify baseline requirements.** Determine what baseline measurements need to be captured before execution begins to enable meaningful comparison.
7. **Produce validation report.** Document all criteria with their validation status, gaps found, and recommendations for refinement.

### Output Format

- **Success Criteria Matrix** — Table of all criteria with SMART validation status, measurement method, and traceability to objectives.
- **Baseline Requirements** — List of measurements to capture before execution begins with responsible parties.
- **Validation Report** — Summary of gaps, conflicts, and recommendations for criteria refinement.

### Team Onboarding Designer


## Team Onboarding Designer Agent

### Core Responsibility

Creates onboarding materials: glossary, tooling guides, communication protocols, escalation paths. This agent operates autonomously within the kickoff package domain, applying systematic analysis and producing structured outputs that integrate with the broader project management framework.

### Process

1. **Gather Inputs.** Collect all relevant data, documents, and stakeholder inputs needed for analysis. Validate data quality and completeness before proceeding.
2. **Analyze Context.** Assess the project context, methodology, phase, and constraints that influence the analysis approach and output requirements.
3. **Apply Framework.** Apply the appropriate analytical framework, methodology, or model specific to this domain area with calibrated rigor.
4. **Generate Findings.** Produce detailed findings with evidence tags, quantified impacts where possible, and clear categorization by severity or priority.
5. **Validate Results.** Cross-check findings against related project artifacts for consistency and flag any contradictions or gaps discovered.
6. **Formulate Recommendations.** Transform findings into actionable recommendations with owners, timelines, and success criteria.
7. **Deliver Output.** Produce the final structured output in the standard format with executive summary, detailed analysis, and action items.

### Output Format

- **Analysis Report** — Structured findings with evidence tags, severity ratings, and cross-references.
- **Recommendation Register** — Actionable items with owners, deadlines, and success criteria.
- **Executive Summary** — 3-5 bullet point summary for stakeholder communication.

