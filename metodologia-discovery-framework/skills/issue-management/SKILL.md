---
name: apex-issue-management
description: >
  Use when the user asks to "track issues", "manage project issues", "resolve blockers",
  "create issue log", "remove impediments", or mentions issue tracking, issue resolution,
  blocker management, impediment removal, issue escalation. Triggers on: creates issue
  tracking workflow, assigns issue resolution owners, enforces resolution SLAs, captures
  root cause analysis, produces issue trend analysis.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Issue Management & Resolution

**TL;DR**: Implements issue tracking and resolution workflow for project issues (risks that have materialized, blockers, impediments, and problems). Establishes classification, priority assignment, resolution workflow, escalation paths, and closure criteria. Issues are risks that happened — they demand immediate action, not analysis.

## Principio Rector
Un issue no es un riesgo — es una realidad que requiere acción inmediata. La velocidad de resolución determina el impacto: un issue resuelto en 24 horas es un inconveniente; el mismo issue sin resolver en 2 semanas es un factor de fracaso. El sistema de issue management prioriza resolución sobre documentación.

## Assumptions & Limits
- Assumes governance framework with escalation paths exists or will be created concurrently [SUPUESTO]
- Assumes team has authority to resolve operational issues without governance approval [SUPUESTO]
- Breaks if escalation matrix is undefined — issues without escalation paths accumulate indefinitely [PLAN]
- Scope limited to project-level issues; organizational or enterprise issues require PMO escalation [PLAN]
- Does not replace risk management — issues are materialized risks; prevention stays in risk register [PLAN]

## Usage
```bash
/pm:issue-management $PROJECT_NAME --setup
/pm:issue-management $PROJECT_NAME --log-issue --severity=critical --category=resource
/pm:issue-management $PROJECT_NAME --report --period=sprint
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT_NAME` | Yes | Target project identifier |
| `--setup` | No | Initialize issue tracking system |
| `--log-issue` | No | Log a new issue |
| `--severity` | No | `critical` / `high` / `medium` / `low` |
| `--category` | No | `technical` / `resource` / `scope` / `external` / `process` |
| `--report` | No | Generate issue status report |

## Service Type Routing
`{TIPO_PROYECTO}`: Agile tracks impediments in daily standups; Waterfall uses formal issue logs; SAFe uses program-level impediment boards; All types need escalation paths.

## Before Managing Issues
1. Read `governance-framework` — confirm escalation paths and authority levels exist [PLAN]
2. Glob `*risk-register*` — identify risks that may have materialized as issues [PLAN]
3. Read team communication channels — confirm issue reporting mechanisms are established [STAKEHOLDER]
4. Review resolution SLAs — confirm time-based targets are defined per severity [SCHEDULE]

## Entrada (Input Requirements)
- Project governance framework
- Escalation matrix and authority levels
- Risk register (for risk-converted issues)
- Team communication channels

## Proceso (Protocol)
1. **Issue intake** — Capture issue with standardized template (what, when, who, impact)
2. **Classification** — Categorize: Technical, Resource, Scope, External, Process
3. **Priority assignment** — Rate urgency x impact: Critical (24h), High (48h), Medium (1 week), Low (2 weeks)
4. **Owner assignment** — Designate resolver with authority to act
5. **Resolution planning** — Define actions, timeline, and resources needed
6. **Escalation routing** — If owner cannot resolve, escalate per governance framework
7. **Progress tracking** — Monitor resolution progress against SLA
8. **Resolution verification** — Confirm issue is resolved and root cause addressed
9. **Lessons capture** — Document root cause and prevention measures
10. **Register update** — Close issue in log with resolution summary

## Edge Cases
1. **Same issue recurring after declared resolution** — Reopen with root-cause-not-addressed flag; escalate to structural fix rather than symptomatic resolution.
2. **Critical issue with no available resolver** — Escalate immediately to governance; propose temporary workaround with documented risk acceptance.
3. **Issue requires budget or scope change** — Route through change control; issue remains open with "pending change approval" status.
4. **Issue backlog growing faster than resolution rate** — Trigger systemic review; likely indicates understaffing, process failure, or scope problem rather than individual issue management.
5. **External issue outside project control** — Document dependency on external resolution; define internal workaround if possible; set monitoring frequency.

## Example: Good vs Bad

**Good Issue Management:**
| Attribute | Value |
|-----------|-------|
| Issue template | Standardized: what, when, who, impact, category, severity [PLAN] |
| SLA compliance | 92% of issues resolved within SLA targets [METRIC] |
| Escalation path | 3-tier escalation with time triggers (24h, 48h, 1 week) [SCHEDULE] |
| Root cause analysis | Completed for all Critical and High issues [PLAN] |
| Trend analysis | Monthly report showing issue patterns by category [METRIC] |

**Bad Issue Management:**
"We have a list of issues somewhere." — No classification, no SLAs, no assigned owners, no escalation paths. Issues languish indefinitely; critical blockers treated same as minor inconveniences.

## Salida (Deliverables)
- Issue tracking log with status
- Resolution SLA compliance report
- Escalation history
- Root cause analysis summaries
- Issue trend analysis

## Validation Gate
- [ ] Every issue has assigned owner with authority and deadline
- [ ] Classification applied consistently — same severity criteria across all issues
- [ ] Resolution SLAs defined for every severity level and enforced
- [ ] Critical issues have resolution path within 24 hours
- [ ] Root cause analysis completed for every Critical and High issue
- [ ] Issue descriptions enable action without requiring clarification meetings
- [ ] Issues linked to originating risks or root causes where applicable
- [ ] Issue patterns analyzed monthly — systemic patterns escalated
- [ ] Critical issues visible to sponsors within 4 hours of identification
- [ ] Issue workflow integrated with project methodology (standup, phase gate, etc.)

## Escalation Triggers
- Critical issue unresolved past 24-hour SLA
- Issue backlog growing faster than resolution rate
- Same issue recurring after declared resolution
- Issue requires budget or scope change to resolve

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

### Issue Classifier


# Issue Classifier Agent

## Core Responsibility

The Issue Classifier agent triages incoming project issues by assigning a structured taxonomy across three dimensions: type (technical, resource, scope, external, organizational), severity (critical/high/medium/low), and urgency (immediate/within-sprint/within-release). This classification drives downstream routing to the appropriate resolution agents, ensures SLA compliance, and provides portfolio-level visibility into issue distribution patterns that may signal systemic risks.

## Process

1. **Ingest** the issue report, extracting the reported symptoms, affected components, timeline of occurrence, and any preliminary impact assessment provided by the reporter.
2. **Categorize** the issue type by mapping symptoms to the five-type taxonomy: technical (code, infrastructure, integration), resource (staffing, skills, availability), scope (requirements drift, change requests, ambiguity), external (vendor, regulatory, market), or organizational (process, communication, governance).
3. **Assess** severity by evaluating the blast radius — critical blocks delivery or causes data loss, high degrades key functionality, medium impacts non-critical paths, low is cosmetic or minor inconvenience.
4. **Determine** urgency by cross-referencing the issue against sprint boundaries, release dates, and dependency chains — immediate requires same-day action, within-sprint allows current iteration resolution, within-release permits backlog scheduling.
5. **Validate** the classification against historical patterns by comparing with previously classified issues of similar type to ensure consistency and detect potential misclassification.
6. **Tag** the issue record with the full taxonomy triple (type/severity/urgency), attach classification rationale with evidence tags, and flag any ambiguity requiring human adjudication.
7. **Route** the classified issue to the appropriate downstream agent — critical/immediate issues go directly to the Escalation Engine, others proceed to Root Cause Analyzer or Resolution Plan Builder based on complexity.

## Output Format

```markdown
## Issue Classification Report

| Field | Value |
|-------|-------|
| Issue ID | {ID} |
| Summary | {one-line description} |
| Type | {technical | resource | scope | external | organizational} |
| Severity | {critical | high | medium | low} |
| Urgency | {immediate | within-sprint | within-release} |
| Affected Components | {list} |
| Classification Rationale | {evidence-backed reasoning} |
| Routing | {next agent or action} |
| Confidence | {high | medium | low} |

### Evidence
- {evidence items with tags: [CODIGO] [CONFIG] [DOC] [INFERENCIA] [SUPUESTO]}

### Ambiguity Flags
- {any dimensions requiring human validation}
```

### Issue Escalation Engine


# Issue Escalation Engine Agent

## Core Responsibility

The Issue Escalation Engine agent enforces time-based escalation policies to ensure no issue stalls without visibility. It monitors issue age against severity-driven SLA thresholds — critical issues escalate after 24 hours without resolution, high after 48 hours — and routes escalations through a defined organizational path from team lead to project manager to steering committee. The agent maintains a real-time escalation dashboard, generates proactive alerts before SLA breaches, and provides decision-makers with the context they need to unblock resolution without re-investigation.

## Process

1. **Monitor** the active issue backlog continuously, comparing each issue's age (time since classification) against the escalation policy thresholds: critical >24h, high >48h, medium >1 sprint, low >1 release cycle.
2. **Detect** SLA breach risk by calculating time-to-breach for each open issue and generating early warning alerts at 75% of the threshold (18h for critical, 36h for high) to give resolution owners a final window to act.
3. **Trigger** auto-escalation when an issue crosses its threshold, advancing it to the next tier in the escalation path: Level 1 (team lead) to Level 2 (project manager/scrum master) to Level 3 (program manager/sponsor) to Level 4 (steering committee/executive).
4. **Package** the escalation brief by assembling the issue classification, root cause analysis (if available), current resolution plan status, blocker description, and a specific ask — what decision or resource is needed from the escalation target to unblock progress.
5. **Notify** the appropriate decision-maker with the escalation brief, ensuring the alert format matches the recipient's communication channel preference and includes a clear action deadline to prevent the escalation from itself becoming stale.
6. **Track** the escalation lifecycle: timestamp of each escalation event, who was notified, what response was received, what action was taken, and whether the escalation resulted in unblocking or requires further elevation.
7. **Report** on escalation patterns across the portfolio — frequency by type, average time-to-escalation, resolution rate per escalation level, and recurring blockers — to identify systemic bottlenecks in the organization's issue resolution capability.

## Output Format

```markdown
## Escalation Alert

### Issue Context
| Field | Value |
|-------|-------|
| Issue ID | {ID} |
| Summary | {one-line description} |
| Severity / Urgency | {severity} / {urgency} |
| Age | {hours/days since classification} |
| SLA Threshold | {threshold for this severity} |
| SLA Status | {breached | at-risk (X% elapsed) | within-SLA} |

### Escalation Details
| Field | Value |
|-------|-------|
| Escalation Level | {L1 | L2 | L3 | L4} |
| Escalated To | {role/name} |
| Escalated From | {previous owner} |
| Escalation Reason | {SLA breach | manual | blocker} |

### Current Status
- **Resolution Plan**: {exists/in-progress/blocked/none}
- **Blocker**: {what is preventing resolution}
- **Prior Actions Taken**: {summary of attempts}

### Decision Required
> {Specific ask: approve resource, remove dependency, make scope decision, etc.}

### Action Deadline
- **Respond by**: {date/time — typically 4h for L3+, 8h for L2}


## Escalation Dashboard (Portfolio View)

| Issue ID | Severity | Age | SLA Status | Current Level | Blocker |
|----------|----------|-----|------------|---------------|---------|
| {ID} | {sev} | {age} | {status} | {L1-L4} | {blocker} |

### Escalation Metrics
| Metric | Value |
|--------|-------|
| Active Escalations | {count} |
| Avg Time-to-Escalation | {hours} |
| L1 Resolution Rate | {%} |
| L2 Resolution Rate | {%} |
| Repeat Escalations (same root cause) | {count} |
| Top Blocker Category | {category} |
```

### Issue Root Cause Analyzer


# Issue Root Cause Analyzer Agent

## Core Responsibility

The Issue Root Cause Analyzer agent applies systematic analytical techniques — primarily the 5 Whys method and Ishikawa (fishbone) diagrams — to move beyond surface-level symptoms and identify the true underlying causes of project issues. By distinguishing proximate triggers from systemic root causes, this agent enables durable fixes that prevent recurrence rather than temporary patches that leave the organization vulnerable to repeated failures across projects and teams.

## Process

1. **Collect** all available evidence related to the issue: classification report from the Issue Classifier, timeline of events, affected artifacts, logs, stakeholder statements, and any prior occurrences of similar issues in the project or portfolio.
2. **Separate** observed symptoms from candidate causes by building a symptom map — listing what was seen, when, by whom, and under what conditions — to avoid conflating observable effects with their origins.
3. **Apply** the 5 Whys technique iteratively, starting from the primary symptom and drilling down through each causal layer, documenting each "why" with supporting evidence and marking assumptions explicitly with `[SUPUESTO]` tags.
4. **Construct** an Ishikawa diagram across six standard categories (People, Process, Technology, Environment, Materials, Measurement) to identify contributing factors that may have created the conditions for the root cause to manifest.
5. **Validate** the identified root cause by testing it against a counterfactual: if this cause had been absent, would the issue have occurred? Cross-reference with historical issue data to confirm pattern consistency.
6. **Classify** the root cause as either isolated (one-time confluence of factors) or systemic (recurring pattern indicating a process, tooling, or organizational gap that affects multiple workstreams).
7. **Document** the complete analysis chain with full traceability from symptom to root cause, including the Ishikawa decomposition, the 5 Whys chain, confidence level, and specific recommendations for both immediate remediation and long-term prevention.

## Output Format

```markdown
## Root Cause Analysis Report

### Issue Summary
| Field | Value |
|-------|-------|
| Issue ID | {ID} |
| Classification | {type/severity/urgency from classifier} |
| Analysis Date | {date} |

### Symptom Map
| # | Symptom | Observed By | When | Conditions |
|---|---------|-------------|------|------------|
| 1 | {symptom} | {who} | {when} | {context} |

### 5 Whys Chain
1. **Why** did {symptom} occur? → {cause 1} `[evidence tag]`
2. **Why** did {cause 1} occur? → {cause 2} `[evidence tag]`
3. **Why** did {cause 2} occur? → {cause 3} `[evidence tag]`
4. **Why** did {cause 3} occur? → {cause 4} `[evidence tag]`
5. **Why** did {cause 4} occur? → **ROOT CAUSE**: {root cause} `[evidence tag]`

### Ishikawa Decomposition
| Category | Contributing Factors |
|----------|---------------------|
| People | {factors} |
| Process | {factors} |
| Technology | {factors} |
| Environment | {factors} |
| Materials | {factors} |
| Measurement | {factors} |

### Root Cause Determination
- **Root Cause**: {statement}
- **Type**: {isolated | systemic}
- **Confidence**: {high | medium | low}
- **Counterfactual Test**: {if X had been different, would issue have occurred?}

### Recommendations
| # | Action | Scope | Priority |
|---|--------|-------|----------|
| 1 | {immediate remediation} | {this issue} | {immediate} |
| 2 | {preventive measure} | {portfolio-wide} | {within-release} |
```

### Resolution Plan Builder


# Resolution Plan Builder Agent

## Core Responsibility

The Resolution Plan Builder agent transforms analyzed issues into actionable, time-bound resolution plans that cover the full lifecycle from immediate containment through permanent fix and verification. Each plan assigns clear ownership, defines dependencies and blockers, establishes measurable success criteria, and includes verification steps to confirm the issue is genuinely resolved — not merely suppressed. The agent ensures every plan is realistic given current resource constraints and aligned with sprint and release cadences.

## Process

1. **Review** the Issue Classifier output and Root Cause Analysis report to understand the full issue context: type, severity, urgency, root cause determination, and any contributing factors identified through Ishikawa decomposition.
2. **Design** the immediate containment action — a short-term measure that stops the bleeding without necessarily addressing the root cause (e.g., rollback, feature flag, manual workaround, temporary resource reallocation) with a target activation window of hours, not days.
3. **Define** the root cause fix as a discrete, implementable work item with clear acceptance criteria, estimated effort in hours, required skills, and any technical or organizational prerequisites that must be satisfied first.
4. **Assign** ownership by mapping each action to a named role or individual, ensuring no action is orphaned, and establishing a single accountable owner for the overall resolution even when multiple contributors are involved.
5. **Sequence** the resolution timeline by ordering containment, fix, and verification activities against sprint boundaries, identifying hard dependencies between actions, and flagging any parallel execution opportunities that could compress the schedule.
6. **Map** dependencies and risks — external teams, vendor responses, environment availability, approval gates — and define contingency paths for each dependency that could introduce delay.
7. **Specify** verification criteria: what tests, metrics, or stakeholder sign-offs confirm the issue is resolved, including a monitoring period post-fix to detect regression and a formal closure checklist.

## Output Format

```markdown
## Issue Resolution Plan

### Overview
| Field | Value |
|-------|-------|
| Issue ID | {ID} |
| Severity / Urgency | {severity} / {urgency} |
| Root Cause | {from RCA report} |
| Plan Owner | {name/role} |
| Target Resolution Date | {date} |

### Phase 1: Immediate Containment
| Action | Owner | Deadline | Status |
|--------|-------|----------|--------|
| {containment action} | {owner} | {hours/date} | {pending} |

### Phase 2: Root Cause Fix
| Action | Owner | Effort | Dependencies | Deadline |
|--------|-------|--------|--------------|----------|
| {fix action} | {owner} | {hours} | {deps} | {date} |

### Phase 3: Verification & Closure
| Criterion | Method | Owner | Target Date |
|-----------|--------|-------|-------------|
| {what must be true} | {how to verify} | {who} | {when} |

### Dependencies & Risks
| Dependency | Owner | Risk if Delayed | Contingency |
|------------|-------|-----------------|-------------|
| {dep} | {who} | {impact} | {plan B} |

### Timeline
```
Phase 1 (Containment): {start} → {end}
Phase 2 (Fix):         {start} → {end}
Phase 3 (Verify):      {start} → {end}
Monitoring Period:      {start} → {end}
```

### Closure Checklist
- [ ] Containment confirmed effective
- [ ] Root cause fix deployed
- [ ] Verification criteria met
- [ ] Monitoring period passed without regression
- [ ] Stakeholder sign-off obtained
- [ ] Lessons learned captured
```

