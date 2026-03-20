---
name: apex-conflict-resolution
description: >
  Use when the user asks to "resolve stakeholder conflict", "manage team conflict",
  "mediate disagreements", "navigate political disputes", or "de-escalate team tensions".
  Activates when a stakeholder needs to classify conflict types, apply resolution techniques,
  facilitate interest-based negotiation, build coalitions for alignment, or design structural
  prevention measures to avoid recurring conflicts.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Stakeholder Conflict Management

**TL;DR**: Provides conflict resolution frameworks and protocols for managing stakeholder and team conflicts. Identifies conflict types (task, relationship, process), applies appropriate resolution techniques (collaboration, compromise, accommodation, avoidance, competition), and documents agreements and prevention measures.

## Principio Rector
El conflicto no es el problema — el conflicto no gestionado es el problema. Los conflictos de tarea (sobre qué hacer) son saludables y generan mejores soluciones. Los conflictos de relación (sobre quién tiene razón) son destructivos y deben desescalarse. El PM debe distinguir entre ambos y aplicar el enfoque correcto.

## Assumptions & Limits
- Assumes parties are willing to engage in resolution process [SUPUESTO]
- Assumes PM has organizational authority or mandate to mediate [STAKEHOLDER]
- Breaks when conflict involves legal disputes or HR violations — escalate to appropriate authority
- Does not address workplace harassment or discrimination — those require HR intervention
- Cultural context affects conflict resolution approach; techniques must be calibrated [SUPUESTO]
- Resolution agreements are only as strong as the follow-up mechanism enforcing them

## Usage

```bash
# Analyze and classify a specific conflict
/pm:conflict-resolution $PROJECT --type=analyze --conflict="resource-allocation"

# Design resolution approach for stakeholder disagreement
/pm:conflict-resolution $PROJECT --type=mediate --parties="sponsor,tech-lead"

# Create prevention measures for recurring conflicts
/pm:conflict-resolution $PROJECT --type=prevention --pattern="scope-disputes"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project identifier |
| `--type` | Yes | `analyze`, `mediate`, `prevention`, `follow-up` |
| `--conflict` | No | Conflict description or category |
| `--parties` | No | Involved parties |
| `--pattern` | No | Recurring conflict pattern to address |

## Service Type Routing
`{TIPO_PROYECTO}`: Matrix organizations have inherent reporting conflicts; Agile-Transformation creates culture conflicts; ERP creates process ownership conflicts; Multi-Program creates resource conflicts.

## Before Resolving

1. **Read** the stakeholder register to understand power/interest dynamics of conflicting parties
2. **Read** the RACI matrix to identify authority ambiguities that may be causing the conflict
3. **Glob** `skills/conflict-resolution/references/*.md` for resolution technique frameworks
4. **Grep** for prior conflict documentation or governance decisions related to the dispute

## Entrada (Input Requirements)
- Conflict description and parties involved
- Stakeholder register with power/interest analysis
- RACI matrix for authority clarity
- Governance framework and escalation paths
- Organizational conflict resolution policies

## Proceso (Protocol)
1. **Conflict identification** — Understand the nature, parties, and stakes of the conflict
2. **Type classification** — Classify as task, relationship, or process conflict
3. **Root cause analysis** — Identify underlying causes (resource scarcity, role ambiguity, values)
4. **Stakeholder assessment** — Assess each party's position, interest, and power
5. **Strategy selection** — Choose resolution approach based on urgency and relationship importance
6. **Mediation preparation** — Prepare neutral ground, ground rules, and structured dialogue
7. **Resolution facilitation** — Guide parties through interest-based negotiation
8. **Agreement documentation** — Document resolution terms and commitments
9. **Prevention measures** — Identify structural changes to prevent recurrence
10. **Follow-up** — Monitor agreement compliance and relationship recovery

## Edge Cases

1. **One party refuses to engage**: Document refusal. Attempt shuttle diplomacy (separate conversations). If unresolvable, escalate to their reporting authority with evidence. [STAKEHOLDER]
2. **Conflict involves the PM's own supervisor**: Recuse from mediation. Recommend neutral third-party mediator. Document conflict and proposed process. [PLAN]
3. **Cultural differences driving conflict**: Acknowledge cultural context explicitly. Adapt resolution techniques to participants' communication styles. Avoid imposing single cultural norm. [STAKEHOLDER]
4. **Conflict affecting critical path**: Prioritize resolution speed over perfection. Implement temporary working agreement while root cause resolution proceeds. [SCHEDULE]

## Example: Good vs Bad

**Good Conflict Resolution:**

| Attribute | Value |
|-----------|-------|
| Conflict classified | Type identified (task/relationship/process) |
| Root cause identified | Specific underlying cause documented |
| Resolution approach | Matched to conflict type and urgency |
| Agreement documented | Written terms with commitments from both parties |
| Prevention measures | Structural change to prevent recurrence |
| Follow-up scheduled | 2-week compliance check planned |

**Bad Conflict Resolution:**
Telling both parties to "work it out" without classification, root cause analysis, mediation, or agreement documentation. Fails because unstructured conflict resolution typically results in the more powerful party imposing their position, creating resentment and recurrence.

## Validation Gate
- [ ] Conflict classified by type (task, relationship, process) with evidence
- [ ] Root cause analysis identifies underlying drivers, not just surface symptoms
- [ ] Resolution approach matched to conflict type and urgency level
- [ ] All parties' perspectives documented with positions AND interests distinguished
- [ ] Agreement terms specific, written, and accepted by all parties
- [ ] Prevention measures address structural root cause, not just symptoms
- [ ] Follow-up compliance check scheduled within 2 weeks of agreement
- [ ] Unresolved conflict escalation risks quantified and documented
- [ ] All parties feel heard and process was fair [STAKEHOLDER]
- [ ] Resolution process respects methodology roles and governance [PLAN]

## Escalation Triggers
- Conflict affecting critical path activities
- Resolution attempts failed after 2 iterations
- Conflict involves sponsor or steering committee members
- Conflict creating team attrition risk

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before mediating to understand conflict theory | `references/body-of-knowledge.md` |
| State of the Art | When exploring advanced negotiation techniques | `references/state-of-the-art.md` |
| Knowledge Graph | To link conflict to governance and stakeholder management | `references/knowledge-graph.mmd` |
| Use Case Prompts | When preparing for mediation sessions | `prompts/use-case-prompts.md` |
| Metaprompts | To generate conflict analysis frameworks | `prompts/metaprompts.md` |
| Sample Output | To calibrate expected resolution documentation | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

---

---

## Sub-Agents

### Agreement Documenter


## Agreement Documenter Agent

### Core Responsibility

Transforms mediation outcomes into formal, trackable agreement documents that create accountability and prevent conflict recurrence. Ensures all parties have clear, unambiguous commitments with measurable success criteria and defined consequences for non-compliance.

### Process

1. **Capture raw agreements.** Extract all verbal commitments, concessions, and action items from mediation session notes.
2. **Structure into formal clauses.** Convert informal agreements into clear, specific, measurable commitment statements with owners and deadlines.
3. **Define success criteria.** Establish observable indicators that demonstrate each commitment has been fulfilled.
4. **Set review milestones.** Schedule concrete checkpoints where agreement adherence will be formally assessed.
5. **Document escalation consequences.** Define what happens if commitments are not met, including re-mediation triggers and authority escalation paths.
6. **Obtain sign-off.** Present the agreement to all parties for review, revision, and formal acceptance.
7. **Archive and distribute.** Store the agreement in the project repository and distribute copies to all parties and the project sponsor.

### Output Format

- **Resolution Agreement** — Formal document with numbered commitments, owners, deadlines, and success criteria.
- **Compliance Checklist** — Trackable list of all commitments with status indicators for review checkpoints.
- **Escalation Matrix** — Decision tree for handling non-compliance scenarios.

### Conflict Classifier


## Conflict Classifier Agent

### Core Responsibility

Classifies conflicts by type (task, process, relationship, status) using Thomas-Kilmann modes. This agent operates autonomously within the conflict resolution domain, applying systematic analysis and producing structured outputs that integrate with the broader project management framework.

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

### Conflict Diagnostician


## Conflict Diagnostician Agent

### Core Responsibility

Analyzes reported or observed conflicts to identify root causes, contributing factors, and systemic patterns. Uses structured diagnostic techniques to move beyond surface symptoms and uncover the underlying drivers—whether resource contention, role ambiguity, misaligned priorities, or interpersonal friction.

### Process

1. **Gather conflict signals.** Collect inputs from escalation reports, retrospective notes, stakeholder complaints, and team survey data.
2. **Classify conflict type.** Categorize as task-based, process-based, relationship-based, or status-based using established conflict taxonomies.
3. **Apply root cause analysis.** Use 5-Whys or fishbone techniques to trace symptoms to underlying structural or behavioral causes.
4. **Map involved parties.** Identify all stakeholders involved, their positions, their underlying interests, and their power dynamics.
5. **Assess severity and urgency.** Rate the conflict on impact (project timeline, team morale, deliverable quality) and time sensitivity.
6. **Identify systemic patterns.** Check if the conflict is an isolated incident or part of a recurring pattern across the project or organization.
7. **Produce diagnostic report.** Summarize findings with evidence tags, root cause hypothesis, and recommended Thomas-Kilmann approach.

### Output Format

- **Diagnostic Report** — Root cause analysis with evidence, conflict classification, and severity rating.
- **Stakeholder Conflict Map** — Visual showing parties, positions, interests, and power dynamics.
- **Pattern Analysis** — Assessment of whether the conflict is isolated or systemic with historical evidence.

### Mediation Facilitator


## Mediation Facilitator Agent

### Core Responsibility

Designs and guides mediation sessions between conflicting parties using the Thomas-Kilmann conflict mode instrument as a framework. Selects the appropriate resolution mode (competing, collaborating, compromising, avoiding, accommodating) based on the diagnostic report and facilitates structured dialogue toward agreement.

### Process

1. **Review diagnostic report.** Analyze the conflict diagnostician's findings to understand root causes, parties, and severity before designing the session.
2. **Select resolution mode.** Choose the optimal Thomas-Kilmann mode based on urgency, relationship importance, and power dynamics between parties.
3. **Design session structure.** Create an agenda with ground rules, time-boxed segments for each party's perspective, and collaborative solution-finding phases.
4. **Prepare parties individually.** Brief each party on the process, set expectations for constructive dialogue, and surface initial positions privately.
5. **Facilitate joint session.** Guide the dialogue through position sharing, interest exploration, option generation, and agreement building.
6. **Document agreements.** Capture all commitments, action items, owners, and deadlines in a formal agreement document.
7. **Define follow-up protocol.** Establish check-in points to verify agreement adherence and detect early signs of re-escalation.

### Output Format

- **Session Plan** — Agenda, ground rules, time allocation, and facilitation notes.
- **Agreement Document** — Formal record of commitments, action items, owners, and review dates.
- **Follow-Up Schedule** — Check-in cadence and re-escalation criteria.

### Prevention Analyst


## Prevention Analyst Agent

### Core Responsibility

Reviews resolved conflicts to identify systemic improvements that prevent recurrence. Extracts patterns from conflict history, maps them to organizational or process root causes, and produces actionable recommendations for governance, role clarity, and team structure adjustments.

### Process

1. **Aggregate conflict history.** Collect all resolved conflict records, diagnostic reports, and agreement documents from the project or portfolio.
2. **Identify recurring patterns.** Cluster conflicts by type, root cause, involved roles, and project phase to detect systemic trends.
3. **Map to structural causes.** Trace patterns to organizational factors: unclear RACI, resource contention, misaligned incentives, or governance gaps.
4. **Benchmark against frameworks.** Compare conflict frequency and types against industry benchmarks and organizational maturity models.
5. **Design preventive controls.** Propose specific process changes, role clarifications, or governance additions that address root structural causes.
6. **Estimate prevention ROI.** Quantify the cost of recurring conflicts (delays, rework, attrition) versus the cost of implementing preventive measures.
7. **Produce prevention roadmap.** Deliver a prioritized action plan with quick wins and longer-term structural improvements.

### Output Format

- **Conflict Pattern Report** — Analysis of recurring themes with frequency, severity, and root cause clustering.
- **Prevention Recommendations** — Prioritized list of structural improvements with expected impact and implementation effort.
- **Prevention ROI Analysis** — Cost comparison of conflict recurrence versus preventive investment.

### Resolution Strategy Selector


## Resolution Strategy Selector Agent

### Core Responsibility

Selects resolution strategy based on urgency, importance, and relationship value. This agent operates autonomously within the conflict resolution domain, applying systematic analysis and producing structured outputs that integrate with the broader project management framework.

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

### Root Cause Explorer


## Root Cause Explorer Agent

### Core Responsibility

Explores conflict root causes: resource scarcity, priority misalignment, role ambiguity, or values clash. This agent operates autonomously within the conflict resolution domain, applying systematic analysis and producing structured outputs that integrate with the broader project management framework.

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

