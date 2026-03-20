---
name: apex-communication-plan
description: >
  Use when the user asks to "create a communication plan", "define communication matrix",
  "plan reporting cadence", "design stakeholder communications", or "establish escalation protocols".
  Activates when a stakeholder needs to design a communication matrix, define channel strategy,
  create reporting templates, establish escalation communication paths, or measure communication
  effectiveness across the project.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Communication Plan & Matrix

**TL;DR**: Designs a comprehensive communication management plan including communication matrix (who-what-when-how), channel strategy, reporting cadence, escalation communication protocols, and templates for recurring communications. Ensures the right information reaches the right stakeholder at the right time through the right channel.

## Principio Rector
La comunicación no es overhead — es el medio a través del cual el proyecto existe para sus stakeholders. Un proyecto sin comunicación efectiva es invisible; un proyecto invisible no recibe apoyo. La comunicación debe ser diseñada como un sistema, no dejada al azar.

## Assumptions & Limits
- Assumes a stakeholder register exists with communication preferences identified [SUPUESTO]
- Assumes organizational communication tools (email, Slack, Teams) are available [PLAN]
- Breaks when stakeholder register is incomplete — communication plan has blind spots
- Does not execute communications — provides the plan and templates for execution
- Escalation protocols require governance framework alignment; standalone escalation paths are risky
- Communication effectiveness measurement requires feedback collection mechanisms [METRIC]

## Usage

```bash
# Create full communication plan
/pm:communication-plan $PROJECT --type=full --source="stakeholder-register"

# Generate communication matrix
/pm:communication-plan $PROJECT --type=matrix

# Create communication templates for recurring reports
/pm:communication-plan $PROJECT --type=templates --reports="status,escalation,change"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project identifier |
| `--type` | Yes | `full`, `matrix`, `templates`, `escalation-protocol` |
| `--source` | No | Stakeholder register or input document |
| `--reports` | No | Comma-separated list of template types |

## Service Type Routing
`{TIPO_PROYECTO}`: Agile projects use information radiators and demo-driven communication; Waterfall uses formal status reports; SAFe uses PI-level communication; All types need escalation protocols.

## Before Planning

1. **Read** the stakeholder register to derive communication requirements per stakeholder group
2. **Read** the ceremony calendar to align communication cadence with meeting schedule
3. **Glob** `skills/communication-plan/references/*.md` for communication templates and best practices
4. **Grep** for existing organizational communication standards or templates

## Entrada (Input Requirements)
- Stakeholder register with communication preferences
- Project methodology and ceremony calendar
- Organizational communication standards
- Tool ecosystem (email, Slack, Teams, Jira, etc.)

## Proceso (Protocol)
1. **Communication requirements** — Derive from stakeholder register (who needs what information)
2. **Channel selection** — Match channels to message types (formal reports, real-time chat, dashboards)
3. **Cadence design** — Define frequency per communication type (daily, weekly, monthly, ad-hoc)
4. **Matrix construction** — Build WHO x WHAT x WHEN x HOW x BY WHOM matrix
5. **Template creation** — Design templates for recurring communications
6. **Escalation protocol** — Define communication paths for escalations
7. **Feedback mechanisms** — Establish channels for stakeholder feedback
8. **Tool integration** — Configure tools to automate routine communications
9. **Effectiveness metrics** — Define how communication effectiveness will be measured
10. **Plan approval** — Review and approve with key stakeholders

## Edge Cases

1. **Stakeholder prefers communication channel not available to project**: Document constraint. Propose nearest alternative with rationale. Get stakeholder agreement. [STAKEHOLDER]
2. **Communication overload complaints**: Audit communication volume per stakeholder. Consolidate overlapping communications. Implement opt-in for non-critical updates. [METRIC]
3. **Escalation path unclear during crisis**: Pre-define crisis communication protocol with contact tree, response SLA, and backup contacts. Test annually. [PLAN]
4. **Remote team across multiple time zones**: Design asynchronous-first communication. Reserve synchronous communication for decisions only. Document response SLA per channel. [SCHEDULE]

## Example: Good vs Bad

**Good Communication Plan:**

| Attribute | Value |
|-----------|-------|
| Matrix coverage | Every stakeholder group with specific needs |
| Channels defined | 4 channels matched to message types |
| Templates created | Status, escalation, change notification |
| Escalation protocol | 3-level escalation with SLAs |
| Feedback mechanism | Monthly communication effectiveness survey |
| Calendar alignment | Communication cadence matches ceremony calendar |

**Bad Communication Plan:**
A document that says "send weekly status emails to everyone." No matrix, no channel strategy, no templates, no escalation protocol. Fails because one-size-fits-all communication ensures that executives get too much detail and team members get too little context.

## Validation Gate
- [ ] Communication matrix covers every stakeholder group from the stakeholder register
- [ ] Every communication type has defined channel, frequency, sender, and audience
- [ ] ≥3 communication templates created (status report, escalation, change notification)
- [ ] Escalation protocol defines ≥2 escalation levels with response SLAs
- [ ] No stakeholder group without at least one scheduled communication touchpoint
- [ ] Feedback mechanism defined for measuring communication effectiveness
- [ ] Communication calendar does not conflict with ceremony calendar
- [ ] Tool integration plan for automating routine communications
- [ ] Stakeholders receive relevant, timely information through preferred channels [STAKEHOLDER]
- [ ] Communication cadence aligned with methodology rhythm [PLAN]

## Escalation Triggers
- Key stakeholder reports feeling uninformed
- Communication overload complaints from team
- Escalation path unclear during crisis
- Communication tool unavailability

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before planning to understand communication theory | `references/body-of-knowledge.md` |
| State of the Art | When evaluating modern communication tools | `references/state-of-the-art.md` |
| Knowledge Graph | To link communication to stakeholder register | `references/knowledge-graph.mmd` |
| Use Case Prompts | When scoping communication needs with stakeholders | `prompts/use-case-prompts.md` |
| Metaprompts | To generate communication templates | `prompts/metaprompts.md` |
| Sample Output | To calibrate expected communication plan format | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

---

---

## Sub-Agents

### Audience Segmentor


## Audience Segmentor Agent

### Core Responsibility

Analyzes the stakeholder register and project context to classify audiences into communication segments based on influence level, interest degree, information needs, and preferred channels. Produces a segmentation matrix that drives all downstream communication planning.

### Process

1. **Ingest stakeholder data.** Parse the stakeholder register, org charts, and any prior communication logs to build a complete audience inventory.
2. **Map influence and interest.** Plot each stakeholder on an influence-interest grid using available evidence from project documentation and sponsor input.
3. **Identify information needs.** Determine what each segment requires: strategic updates, operational details, technical depth, or compliance notifications.
4. **Cluster into segments.** Group stakeholders into 4-6 actionable communication segments with shared characteristics and needs.
5. **Assign channel preferences.** Match each segment to optimal channels (email, dashboard, meeting, Slack) based on organizational norms and stakeholder preferences.
6. **Define cadence requirements.** Establish minimum communication frequency per segment aligned with project phase and decision velocity.
7. **Validate with sponsor.** Present segmentation matrix for sponsor review, flagging any gaps or assumptions requiring confirmation.

### Output Format

- **Segmentation Matrix** — Table mapping each segment to influence level, interest, information needs, preferred channels, and cadence.
- **Influence-Interest Grid** — Visual quadrant diagram positioning all stakeholders.
- **Gap Analysis** — List of stakeholders with insufficient data for confident segmentation.

### Cadence Planner


## Cadence Planner Agent

### Core Responsibility

Establishes the communication rhythm for the project by defining message frequency, timing, and triggers for each stakeholder segment across all project phases. Prevents both communication fatigue and information gaps by calibrating cadence to decision cycles and milestone density.

### Process

1. **Map project phases.** Identify all major project phases and their expected durations to anchor cadence decisions.
2. **Identify decision points.** Catalog key decision moments, gates, and milestones that require pre-communication and post-communication.
3. **Set baseline frequencies.** Define default communication frequency per segment (daily, weekly, biweekly, monthly) based on influence and information needs.
4. **Design phase-specific adjustments.** Increase cadence during high-activity phases (kickoff, go-live) and reduce during steady-state execution.
5. **Define trigger-based communications.** Establish event-driven messages for risks, changes, escalations, and milestone completions.
6. **Build the calendar template.** Create a visual communication calendar showing all planned touchpoints across segments and phases.
7. **Validate against stakeholder capacity.** Cross-check total communication load per stakeholder to prevent fatigue and ensure realistic expectations.

### Output Format

- **Cadence Matrix** — Table of segment, frequency, phase adjustments, and trigger conditions.
- **Communication Calendar** — Monthly/weekly visual calendar template with all planned touchpoints.
- **Fatigue Analysis** — Assessment of communication load per key stakeholder with recommendations.

### Channel Cadence Designer


## Channel Cadence Designer Agent

### Core Responsibility

Designs communication channel mix and cadence per audience segment. This agent operates autonomously within the communication plan domain, applying systematic analysis and producing structured outputs that integrate with the broader project management framework.

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

### Channel Strategist


## Channel Strategist Agent

### Core Responsibility

Evaluates available communication channels within the organization and project context, then designs a channel strategy that maximizes reach, engagement, and information retention for each stakeholder segment. Ensures no critical audience is left without an appropriate channel.

### Process

1. **Inventory available channels.** Catalog all organizational communication channels including email, Slack, Teams, dashboards, town halls, stand-ups, and newsletters.
2. **Assess channel characteristics.** Evaluate each channel for reach, formality, latency, interactivity, and audit trail capability.
3. **Match channels to segments.** Align each stakeholder segment from the segmentation matrix with primary and backup communication channels.
4. **Design escalation paths.** Define how critical or time-sensitive messages escalate from routine channels to direct communication.
5. **Establish redundancy rules.** Ensure high-priority messages reach stakeholders through at least two complementary channels.
6. **Define channel governance.** Set rules for who can post, approval workflows for sensitive communications, and archival requirements.
7. **Document channel matrix.** Produce a finalized channel-segment mapping with rationale for each selection.

### Output Format

- **Channel Matrix** — Grid mapping segments to primary/secondary channels with rationale.
- **Escalation Protocol** — Decision tree for message urgency routing.
- **Channel Governance Rules** — Posting permissions, approval workflows, and archival policy.

### Feedback Loop Architect


## Feedback Loop Architect Agent

### Core Responsibility

Designs bidirectional feedback mechanisms ensuring stakeholders can provide input and confirm understanding. This agent operates autonomously within the communication plan domain, applying systematic analysis and producing structured outputs that integrate with the broader project management framework.

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

### Feedback Loop Designer


## Feedback Loop Designer Agent

### Core Responsibility

Creates structured feedback mechanisms that measure communication effectiveness and capture stakeholder input. Ensures the communication plan is a living system with continuous improvement loops rather than a static broadcast schedule.

### Process

1. **Define feedback objectives.** Establish what the feedback loops must measure: message clarity, timeliness, relevance, channel satisfaction, and information sufficiency.
2. **Design collection mechanisms.** Create pulse surveys, retrospective prompts, read receipts, and informal check-in templates for gathering feedback.
3. **Set measurement cadence.** Determine how often feedback is collected per segment—monthly for executives, biweekly for delivery teams.
4. **Build response protocols.** Define how feedback triggers adjustments: thresholds for cadence changes, channel switches, or content reformatting.
5. **Create feedback dashboards.** Design lightweight tracking views showing communication health metrics per segment over time.
6. **Establish escalation criteria.** Set rules for when feedback indicates systemic communication failures requiring plan overhaul.
7. **Document improvement cycle.** Formalize the review-adjust-deploy cycle for incorporating feedback into plan updates.

### Output Format

- **Feedback Mechanism Catalog** — Table of feedback tools, target segments, frequency, and responsible owners.
- **Communication Health Dashboard** — Template with KPIs for message effectiveness and stakeholder satisfaction.
- **Improvement Protocol** — Step-by-step process for translating feedback into communication plan adjustments.

### Message Template Builder


## Message Template Builder Agent

### Core Responsibility

Creates standardized message templates for status reports, escalations, and announcements. This agent operates autonomously within the communication plan domain, applying systematic analysis and producing structured outputs that integrate with the broader project management framework.

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

### Stakeholder Audience Segmenter


## Stakeholder Audience Segmenter Agent

### Core Responsibility

Segments stakeholders by communication needs, information requirements, and preferred channels. This agent operates autonomously within the communication plan domain, applying systematic analysis and producing structured outputs that integrate with the broader project management framework.

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

