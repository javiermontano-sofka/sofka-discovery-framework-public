---
name: apex-assumption-log
description: >
  Use when the user asks to "track assumptions", "document constraints", "log assumptions",
  "manage project assumptions", or "validate planning hypotheses".
  Activates when a stakeholder needs to create an assumption register, document project constraints,
  link assumptions to risks, establish assumption validation cadence, or audit planning
  hypotheses across the project lifecycle.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Assumption Tracking & Constraint Documentation

**TL;DR**: Maintains a living assumption log that captures, categorizes, and tracks all project assumptions and constraints. Each assumption is tagged with confidence level, impact if wrong, validation method, and responsible owner. Integrates with the risk register since invalidated assumptions become risks.

## Principio Rector
Toda planificación descansa sobre supuestos. Los supuestos no validados son riesgos encubiertos. Un proyecto maduro hace sus supuestos explícitos, los prioriza por impacto, y los valida activamente. Un supuesto que nadie cuestiona es el que más daño puede causar.

## Assumptions & Limits
- Assumes the project charter exists with initial assumptions to harvest [SUPUESTO]
- Assumes assumption owners are available and willing to validate within agreed cadence [SUPUESTO]
- Breaks when assumptions are embedded in contracts but not surfaced — legal review may be needed
- Scope limited to project-level assumptions; organizational assumptions require PMO escalation
- Does not replace risk management — invalidated assumptions feed the risk register
- Constraint documentation covers project constraints only, not organizational policies

## Usage

```bash
# Create initial assumption log from charter
/pm:assumption-log $PROJECT --type=initialize --source="charter"

# Add a new assumption to the log
/pm:assumption-log $PROJECT --type=add --category="technical" --confidence="medium"

# Run assumption validation review
/pm:assumption-log $PROJECT --type=review --scope="high-impact"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project identifier |
| `--type` | Yes | `initialize`, `add`, `review`, `audit` |
| `--source` | No | Source document for harvesting assumptions |
| `--category` | No | `technical`, `organizational`, `financial`, `resource`, `external` |
| `--confidence` | No | `high`, `medium`, `low` |
| `--scope` | No | Filter for review scope |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Assumptions validated through sprint experiments; living log refined during retrospectives and backlog grooming
- **Waterfall**: Formal assumption register per PMBOK; assumptions frozen at planning, tracked through change control
- **SAFe**: Assumptions surfaced during PI Planning; validated across iterations; cross-ART assumptions escalated to solution train
- **Hybrid**: Phase-level assumptions managed formally; iteration-level assumptions validated empirically within each phase
- **Transformation**: Organizational readiness assumptions; change adoption rate hypotheses; cultural resistance assumptions
- **Recovery**: Assumptions re-validated aggressively; root-cause analysis of failed assumptions from troubled project history

## Before Logging

1. **Read** the project charter to harvest initial assumptions from scope, timeline, and resource sections
2. **Glob** `*.md` in the project deliverables folder for implicit assumptions in planning documents
3. **Read** the risk register to identify assumptions already linked to risks
4. **Grep** for `[SUPUESTO]` tags across existing project artifacts to find undocumented assumptions

## Entrada (Input Requirements)
- Project charter with initial assumptions
- Input analysis digest
- Stakeholder interviews and meeting notes
- Technical assessment findings
- Historical lessons learned

## Proceso (Protocol)
1. **Harvest assumptions** — Extract from all project documents and conversations
2. **Categorize** — Classify as technical, organizational, financial, resource, or external
3. **Assess confidence** — Rate each assumption: High (>80%), Medium (50-80%), Low (<50%)
4. **Impact analysis** — Rate impact if assumption proves false: Critical, High, Medium, Low
5. **Define validation method** — Specify how and when each assumption will be tested
6. **Assign owners** — Designate a responsible party for validating each assumption
7. **Link to risks** — Map low-confidence/high-impact assumptions to risk register entries
8. **Document constraints** — Separately catalog hard constraints (non-negotiable) vs. soft constraints
9. **Establish review cadence** — Set schedule for assumption review (weekly for active project)
10. **Track status** — Maintain status: Open, Validated, Invalidated, Converted-to-Risk

## Edge Cases

1. **Assumption is actually a fact**: If verifiable evidence exists, reclassify as a documented fact and remove from assumption log. Tag with [METRIC] or [PLAN] evidence. [PLAN]
2. **Assumption owner leaves the project**: Immediately reassign to another team member. Flag orphaned assumptions in next review cycle. Never leave an assumption unowned. [STAKEHOLDER]
3. **Constraint changes mid-project**: Treat as a change request — run impact analysis on all dependent planning artifacts. Update assumption log AND trigger change control. [SCHEDULE]
4. **Assumption invalidated with critical impact**: Immediately create risk register entry, notify sponsor, and trigger contingency plan review. Do not wait for next scheduled review. [PLAN]
5. **Stakeholders disagree on assumption validity**: Document both positions with evidence tags. Escalate to steering committee if impact is Critical. [STAKEHOLDER]

## Example: Good vs Bad

**Good Assumption Log:**

| Attribute | Value |
|-----------|-------|
| Assumptions harvested | 24 from 6 source documents |
| Categorization | 100% categorized across 5 categories |
| Confidence rated | Every assumption with justified confidence level |
| Validation methods | Specific, testable methods for each assumption |
| Owner assigned | 100% ownership coverage |
| Risk linkage | Low-confidence/high-impact linked to risk register |

**Bad Assumption Log:**
A document listing "we assume the team will be available" and "we assume the technology works" without confidence levels, impact analysis, validation methods, or owners. No linkage to risk register. Never reviewed after initial creation. Fails because it is a static list rather than a living management instrument — assumptions degrade into forgotten text.

## Validation Gate
- [ ] Every assumption has category, confidence level, impact rating, and assigned owner
- [ ] ≥80% of assumptions have specific, testable validation methods defined
- [ ] All Low-confidence + High/Critical-impact assumptions linked to risk register entries
- [ ] Constraints separated into hard (non-negotiable) vs. soft (flexible) categories
- [ ] Review cadence established and first review date scheduled
- [ ] No assumption without a source document or conversation reference
- [ ] Assumption heat map (confidence x impact) generated for prioritization
- [ ] Status tracking mechanism in place (Open, Validated, Invalidated, Converted-to-Risk)
- [ ] Decision-makers can see key assumptions affecting their domain [STAKEHOLDER]
- [ ] Review cadence aligned with project methodology rhythm [PLAN]

## Escalation Triggers
- Critical assumption invalidated
- More than 5 low-confidence assumptions on critical path
- Assumption owner unavailable or unresponsive
- Constraint changes invalidating project plan

## Salida (Deliverables)

- Primary deliverable: assumption register with validation plan
- All outputs tagged with evidence markers
- Mermaid diagrams where applicable
- Executive summary for stakeholder consumption

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

### Assumption Harvester


## Assumption Harvester Agent

### Core Responsibility

Mines project documentation, stakeholder communications, and planning artifacts to identify explicit and implicit assumptions that underpin project decisions. Surfaces hidden assumptions that teams take for granted but that carry significant risk if proven false, ensuring they are logged, categorized, and tracked.

### Process

1. **Scan project artifacts.** Parse the project charter, SOW, business case, technical architecture docs, and planning materials for stated and implied assumptions.
2. **Analyze stakeholder inputs.** Review meeting notes, interview transcripts, and email threads for assumptions embedded in stakeholder expectations.
3. **Detect implicit assumptions.** Identify unstated beliefs underlying estimates, timelines, resource plans, and technical decisions.
4. **Categorize by domain.** Classify each assumption into domains: technical, resource, schedule, budget, organizational, regulatory, or market.
5. **Assess confidence level.** Rate each assumption's likelihood of being true (high, medium, low) based on available evidence.
6. **Link to dependencies.** Map each assumption to the project decisions, estimates, or plans that depend on it being true.
7. **Log with metadata.** Record each assumption with ID, description, category, confidence, source, owner, and dependent decisions.

### Output Format

- **Assumption Register** — Structured log with ID, description, category, confidence rating, source, and owner.
- **Dependency Map** — Visual showing which project decisions depend on which assumptions.
- **Harvest Summary** — Statistics on assumptions by category and confidence level with areas of highest exposure.

### Assumption Risk Linker


## Assumption Risk Linker Agent

### Core Responsibility

Links assumptions to risks: quantifies impact if assumption proves false, creates risk entries. This agent operates autonomously within the assumption log domain, applying systematic analysis and producing structured outputs that integrate with the broader project management framework.

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

### Assumption Status Tracker


## Assumption Status Tracker Agent

### Core Responsibility

Tracks assumption lifecycle: Open to Under Validation to Validated/Invalidated with alerts. This agent operates autonomously within the assumption log domain, applying systematic analysis and producing structured outputs that integrate with the broader project management framework.

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

### Risk Linker


## Risk Linker Agent

### Core Responsibility

Establishes bidirectional traceability between the assumption log and risk register, ensuring every high-impact assumption has a corresponding risk entry and every risk is traceable to its underlying assumptions. Quantifies the project exposure if key assumptions prove false.

### Process

1. **Cross-reference registers.** Compare each assumption against existing risk register entries to identify already-covered and uncovered assumptions.
2. **Generate risk entries.** For uncovered high-impact assumptions, draft corresponding risk register entries with probability, impact, and response strategies.
3. **Assess cascade effects.** Analyze what happens when an assumption fails: which plans break, which estimates become invalid, and which deliverables are at risk.
4. **Quantify exposure.** Estimate the schedule, budget, and scope impact if each high-impact assumption proves false.
5. **Prioritize by exposure.** Rank assumption-risk pairs by total project exposure to focus validation efforts on the highest-impact items.
6. **Create trigger indicators.** Define observable leading indicators that would signal an assumption is becoming invalid before full failure.
7. **Update risk register.** Produce formatted risk entries ready for incorporation into the project risk register with assumption cross-references.

### Output Format

- **Assumption-Risk Linkage Matrix** — Table mapping each assumption to its corresponding risk entry with exposure quantification.
- **Exposure Summary** — Ranked list of assumption-risk pairs by total project impact (schedule, budget, scope).
- **Trigger Indicator Catalog** — Leading indicators for each high-impact assumption with monitoring instructions.

### Status Tracker


## Status Tracker Agent

### Core Responsibility

Monitors the lifecycle status of all logged assumptions from initial identification through validation to closure. Maintains a living dashboard of assumption health, triggers alerts when assumptions change status, and ensures the project team reacts appropriately to invalidated assumptions before they impact delivery.

### Process

1. **Define status taxonomy.** Establish standard statuses: Open, Under Validation, Validated (True), Invalidated (False), Expired, and Superseded.
2. **Track status transitions.** Monitor and record every status change with timestamp, evidence, and responsible party for audit trail.
3. **Generate status dashboard.** Produce a current-state view of all assumptions showing distribution across statuses with trend indicators.
4. **Trigger invalidation alerts.** When an assumption is marked Invalidated, automatically notify the assumption owner, risk manager, and project sponsor.
5. **Enforce deadline compliance.** Flag assumptions approaching validation deadlines without progress and escalate to the project manager.
6. **Produce periodic reports.** Generate weekly or sprint-level assumption status summaries showing new additions, status changes, and aging open items.
7. **Archive closed assumptions.** Move validated and invalidated assumptions to archive with lessons learned for future project reference.

### Output Format

- **Assumption Dashboard** — Current-state summary with counts by status, aging analysis, and trend indicators.
- **Status Change Log** — Chronological record of all status transitions with evidence and responsible parties.
- **Escalation Report** — List of assumptions requiring immediate attention due to invalidation or deadline proximity.

### Validation Plan Designer


## Validation Plan Designer Agent

### Core Responsibility

Designs validation plans: how to test, when to test, who is responsible, and fallback if invalidated. This agent operates autonomously within the assumption log domain, applying systematic analysis and producing structured outputs that integrate with the broader project management framework.

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

### Validation Planner


## Validation Planner Agent

### Core Responsibility

Creates actionable validation plans for critical project assumptions, defining how, when, and by whom each assumption will be tested or confirmed. Prioritizes validation efforts by exposure level, ensuring the highest-risk assumptions are validated earliest in the project lifecycle.

### Process

1. **Prioritize for validation.** Select assumptions requiring active validation based on confidence level (low/medium) and project impact (high/critical).
2. **Design validation methods.** For each assumption, define the validation approach: prototype, POC, expert review, data analysis, stakeholder confirmation, or market test.
3. **Assign validation owners.** Designate who is responsible for executing each validation activity and who approves the results.
4. **Set validation deadlines.** Establish by-when dates aligned with project decision points that depend on the assumption being confirmed.
5. **Define success criteria.** Specify what evidence would confirm or invalidate each assumption and what threshold constitutes a pass/fail.
6. **Plan contingencies.** For each assumption, define the fallback plan if validation reveals the assumption is false.
7. **Schedule validation reviews.** Create a regular review cadence to track validation progress and escalate assumptions that remain unvalidated past their deadlines.

### Output Format

- **Validation Plan** — Table of assumptions with validation method, owner, deadline, success criteria, and contingency plan.
- **Validation Calendar** — Timeline showing when each validation activity must complete relative to project milestones.
- **Contingency Playbook** — Pre-defined response plans for each assumption that could fail validation.

