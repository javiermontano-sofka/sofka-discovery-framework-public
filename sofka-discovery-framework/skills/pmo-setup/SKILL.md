---
name: apex-pmo-setup
description: >
  Use when the user asks to "set up a PMO", "design PMO", "create PMO charter",
  "implement project management office", "define PMO operating model",
  or mentions PMO design, project management office, PMO operating model,
  PMO governance, PMO implementation. Triggers on: designs PMO operating model,
  creates PMO charter and service catalog, defines PMO staffing and roles,
  establishes PMO governance framework, produces phased PMO implementation roadmap.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# PMO Design & Setup

**TL;DR**: Designs and plans the implementation of a Project Management Office including PMO type selection (supportive, controlling, directive), operating model, service catalog, staffing, governance framework, tools, and maturity roadmap. The PMO is the organizational engine that standardizes, governs, and improves project delivery.

## Principio Rector
Un PMO exitoso sirve a los proyectos, no al revés. El tipo de PMO (supportive, controlling, directive) debe alinearse con la cultura organizacional y la madurez de PM. Un PMO directive en una cultura altamente autónoma será rechazado; un PMO supportive en una organización inmadura será ignorado. Start where you are, not where you wish you were.

## Assumptions & Limits
- Assumes executive sponsor committed to PMO investment and authority [STAKEHOLDER]
- Assumes PMO maturity assessment has been completed or baseline is estimable [SUPUESTO]
- Breaks if organization has no executive buy-in — PMO without executive authority is a documentation team [STAKEHOLDER]
- Scope limited to PMO design and setup plan; ongoing PMO operations is a continuous engagement [PLAN]
- Does not replace organizational restructuring — PMO operates within existing org structure [PLAN]

## Usage
```bash
/pm:pmo-setup $ORG_NAME --type=supportive
/pm:pmo-setup $ORG_NAME --type=controlling --services=governance,reporting,methodology
/pm:pmo-setup $ORG_NAME --type=auto --from-maturity-assessment
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ORG_NAME` | Yes | Target organization identifier |
| `--type` | No | `supportive` / `controlling` / `directive` / `auto` (default: `auto`) |
| `--services` | No | Comma-separated PMO services to include |
| `--from-maturity-assessment` | No | Derive PMO type from maturity assessment results |

## Service Type Routing
`{TIPO_PROYECTO}`: PMO-Setup is the primary use case; Agile-Transformation designs Agile PMO; Portfolio uses PMO for portfolio governance; Enterprise uses Enterprise PMO design.

## Before Setting Up PMO
1. Read `pmo-maturity` assessment — understand current baseline and target maturity [PLAN]
2. Read organizational strategy — PMO services must align with strategic priorities [PLAN]
3. Glob `*governance*` and `*process*` — understand existing PM practices [PLAN]
4. Confirm executive sponsor commitment — PMO authority requires executive backing [STAKEHOLDER]

## Entrada (Input Requirements)
- PMO maturity assessment results (from `pmo-maturity`)
- Organizational strategy and PM needs
- Current PM practices and pain points
- Executive sponsor expectations
- Industry PMO benchmarks

## Proceso (Protocol)
1. **PMO type selection** — Choose supportive, controlling, or directive based on org maturity and needs
2. **Charter creation** — Draft PMO charter with mission, scope, authority, and success metrics
3. **Service catalog** — Define PMO services (standards, training, tools, reporting, consulting)
4. **Operating model** — Design PMO structure, roles, and processes
5. **Staffing plan** — Define PMO roles (head, analysts, coaches) and FTE requirements
6. **Governance framework** — Establish PMO governance including portfolio board
7. **Tool ecosystem** — Select and configure PM tool suite
8. **Standards library** — Create PM standards, templates, and methodology guides
9. **Implementation roadmap** — Plan phased PMO rollout (quick wins, foundation, maturity)
10. **Success metrics** — Define PMO value metrics (project success rate, cycle time, satisfaction)

## Edge Cases
1. **Organizational resistance to PMO authority** — Start with supportive model (service-first); earn trust through value delivery before introducing governance.
2. **PMO scope creep beyond charter** — Define explicit boundaries in charter; PMO does not own project delivery, it enables it.
3. **Executive sponsor changes mid-setup** — Re-confirm charter and authority with new sponsor; PMO design may need adjustment for new expectations.
4. **Multiple existing informal PMOs across business units** — Map existing capabilities; propose federated model with central standards and local execution.

## Example: Good vs Bad

**Good PMO Setup:**
| Attribute | Value |
|-----------|-------|
| PMO type | Controlling — justified by maturity assessment Level 2 and governance gaps [PLAN] |
| Charter | Mission, scope, authority, success metrics, review cadence [PLAN] |
| Service catalog | 8 services defined with maturity targets (3 active, 3 planned, 2 aspirational) [PLAN] |
| Staffing | PMO Head + 2 analysts + 1 coach = 4 FTE initial team [METRIC] |
| Roadmap | Phase 1: 3 months (governance + reporting); Phase 2: 6 months (methodology + tools) [SCHEDULE] |

**Bad PMO Setup:**
"We hired a PMO Manager and gave them an office." — No charter, no service catalog, no staffing plan, no governance framework. PMO operates ad-hoc and struggles to demonstrate value.

## Salida (Deliverables)
- `05_pmo_charter_{proyecto}_{WIP}.md` — PMO charter
- PMO service catalog
- PMO operating model and org chart
- Implementation roadmap
- PMO success metrics dashboard

## Validation Gate
- [ ] PMO type aligned to organizational reality — not aspirational
- [ ] Charter includes mission, scope, authority boundaries, and success metrics
- [ ] Service catalog defines at least 5 services with maturity levels
- [ ] Staffing plan realistic — FTE requirements justified by service catalog scope
- [ ] Governance framework establishes PMO authority for declared services
- [ ] Implementation roadmap phased — quick wins in first 90 days
- [ ] PMO value metrics defined and measurable from day 1
- [ ] Executive sponsor formally endorses charter
- [ ] PMO supports chosen methodologies without constraining them
- [ ] Success metrics dashboard designed for quarterly PMO health tracking

## Escalation Triggers
- Executive sponsor not committed to PMO investment
- Organizational resistance to PMO authority
- PMO scope creep beyond charter
- PMO metrics not improving after 6 months

## Additional Resources
| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | When designing PMOs per PMI and industry standards | `references/body-of-knowledge.md` |
| State of the Art | When implementing modern PMO operating models | `references/state-of-the-art.md` |
| Knowledge Graph | When mapping PMO setup to pipeline phases | `references/knowledge-graph.mmd` |
| Use Case Prompts | When generating PMO designs for specific organizational contexts | `prompts/use-case-prompts.md` |
| Metaprompts | When adapting PMO design for non-standard organizations | `prompts/metaprompts.md` |
| Sample Output | When reviewing expected PMO charter quality | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

---

---

## Sub-Agents

### Maturity Roadmap Designer


## Maturity Roadmap Designer Agent

### Core Responsibility
Design a phased roadmap for PMO maturity improvement from current state to target state, balancing quick wins with structural changes over a 12-24 month horizon.

### Process
1. **Assess Current State.** Document current PMO maturity level across dimensions: governance, methodology, people, tools, metrics, portfolio management, knowledge management, stakeholder management.
2. **Define Target State.** Establish target maturity level per dimension based on organizational strategy, industry benchmarks, and realistic advancement pace (typically 1-2 levels in 12-24 months).
3. **Identify Quick Wins.** Find improvements that can be implemented within 30 days with high visibility and low effort to build momentum and credibility.
4. **Design Phase Gates.** Structure the roadmap in 3-4 phases with clear milestones, success criteria, and decision points for continuing investment.
5. **Allocate Resources.** Estimate resource requirements per phase: dedicated PMO staff, external consultants, training budget, and tool licenses.
6. **Plan Change Management.** Identify organizational resistance points and design change management activities aligned with each improvement phase.
7. **Produce Roadmap Package.** Deliver phased roadmap with timeline, milestones, resource requirements, change management plan, and risk register.

### Output Format
- **Phased Roadmap** — Timeline with 3-4 phases, milestones, and deliverables per phase.
- **Quick Win Register** — Immediate improvements with 30-day implementation plan.
- **Resource and Investment Plan** — Estimated costs and staffing per phase.

### Pmo Model Selector


# PMO Model Selector

## Core Responsibility

This agent evaluates the organization's current project management maturity, portfolio complexity, leadership expectations, and cultural dynamics to recommend the most appropriate PMO operating model. It produces a justified recommendation that balances governance rigor with organizational readiness, ensuring the selected model can be adopted without excessive resistance while still delivering the control and visibility that stakeholders require.

## Process

1. **Assess** the organization's current project management maturity level using a structured questionnaire covering process standardization, tool adoption, competency levels, and executive sponsorship strength.
2. **Analyze** the project portfolio complexity by evaluating the number of concurrent projects, cross-functional dependencies, budget ranges, technology diversity, and strategic alignment requirements.
3. **Map** the cultural context by identifying decision-making patterns (centralized vs. distributed), tolerance for governance overhead, historical change adoption rates, and stakeholder power dynamics.
4. **Evaluate** each PMO model (supportive, controlling, directive) against the collected data, scoring fit across dimensions of maturity readiness, complexity coverage, cultural alignment, and implementation feasibility.
5. **Identify** hybrid opportunities where a phased approach may apply — starting with a supportive model and evolving toward controlling or directive as organizational maturity increases.
6. **Recommend** the optimal PMO model with a clear rationale document that maps each organizational factor to the model's strengths, including risk factors and mitigation strategies for adoption challenges.
7. **Validate** the recommendation against industry benchmarks and comparable case studies, producing a final decision brief with executive summary, scoring matrix, and transition considerations.

## Output Format

```markdown
# PMO Model Recommendation

## Executive Summary
[1-paragraph recommendation with model name and key rationale]

## Organizational Assessment
| Dimension               | Current State | Score (1-5) |
|-------------------------|---------------|-------------|
| PM Maturity             | ...           | ...         |
| Portfolio Complexity    | ...           | ...         |
| Cultural Readiness      | ...           | ...         |
| Executive Sponsorship   | ...           | ...         |

## Model Evaluation Matrix
| Criteria                | Supportive | Controlling | Directive |
|-------------------------|------------|-------------|-----------|
| Maturity Fit            | ...        | ...         | ...       |
| Complexity Coverage     | ...        | ...         | ...       |
| Cultural Alignment      | ...        | ...         | ...       |
| Implementation Feasibility | ...     | ...         | ...       |
| **Total Score**         | ...        | ...         | ...       |

## Recommended Model
[Model name + detailed justification]

## Risks & Mitigations
- [Risk 1]: [Mitigation]
- [Risk 2]: [Mitigation]

## Transition Considerations
[Phased evolution path if applicable]
```

### Process Framework Builder


# Process Framework Builder

## Core Responsibility

This agent designs and documents the end-to-end PMO process framework that governs how projects are initiated, prioritized, executed, monitored, and closed within the organization. It establishes standardized workflows for project intake, portfolio prioritization, governance decision-making, status reporting cadences, resource allocation, and knowledge capture — ensuring each process integrates cleanly with the others and scales appropriately for the organization's size and complexity.

## Process

1. **Inventory** existing project management processes across the organization, identifying formal procedures, informal practices, gaps, and redundancies through stakeholder interviews and document review.
2. **Define** the project intake process including submission criteria, intake forms, initial screening gates, feasibility assessment steps, and approval workflows with clear RACI assignments.
3. **Design** the prioritization framework using weighted scoring models that evaluate strategic alignment, financial impact, resource availability, risk exposure, and urgency to produce a ranked project pipeline.
4. **Establish** the governance structure by specifying decision bodies (steering committee, change control board, portfolio review board), their authority levels, meeting cadences, escalation paths, and quorum requirements.
5. **Build** the reporting and monitoring processes including KPI definitions, dashboard specifications, status report templates, health check criteria, and exception reporting triggers with defined thresholds.
6. **Architect** the resource management process covering capacity planning, allocation requests, conflict resolution procedures, skills tracking, and utilization monitoring with feedback loops to portfolio planning.
7. **Codify** the knowledge management process including lessons learned capture points, retrospective formats, knowledge base structure, searchability requirements, and mandatory contribution triggers at phase gates and project closure.

## Output Format

```markdown
# PMO Process Framework

## Process Architecture Overview
[Diagram description: how processes interconnect]

## 1. Project Intake Process
- **Trigger**: [What initiates intake]
- **Steps**: [Numbered workflow]
- **RACI**: [Responsible, Accountable, Consulted, Informed]
- **SLA**: [Expected turnaround]
- **Artifacts**: [Forms, checklists]

## 2. Prioritization Framework
- **Model**: [Weighted scoring / MoSCoW / Cost-of-delay]
- **Criteria & Weights**: [Table]
- **Review Cadence**: [Frequency]
- **Output**: [Ranked backlog format]

## 3. Governance Structure
- **Decision Bodies**: [Name, authority, cadence]
- **Escalation Matrix**: [Levels and triggers]
- **Gate Criteria**: [Phase gate definitions]

## 4. Reporting & Monitoring
- **KPIs**: [List with targets]
- **Cadence**: [Weekly/monthly/quarterly]
- **Exception Triggers**: [Thresholds]

## 5. Resource Management
- **Allocation Process**: [Workflow]
- **Conflict Resolution**: [Procedure]
- **Capacity Review**: [Cadence and method]

## 6. Knowledge Management
- **Capture Points**: [When and how]
- **Repository Structure**: [Categories]
- **Contribution Requirements**: [Mandatory triggers]

## Process Integration Map
[How each process feeds into the others]
```

### Template Library Creator


# Template Library Creator

## Core Responsibility

This agent designs, creates, and documents a comprehensive PMO template library that standardizes project documentation across the organization. Each template is crafted with clear section structures, instructional guidance, fill-in prompts, and usage guidelines that ensure consistency while remaining flexible enough to accommodate different project types and sizes. The library serves as the single source of truth for all project documentation standards.

## Process

1. **Audit** the organization's existing templates and documentation practices, identifying what works well, what causes confusion, what is missing, and where inconsistencies between teams create reporting and governance friction.
2. **Design** the project charter template with sections for business case summary, objectives, scope boundaries, success criteria, key milestones, stakeholder list, assumptions, constraints, budget summary, and approval signatures — including instructional tooltips for each field.
3. **Build** the status report template with standardized RAG indicators, milestone tracking, risk summary, issue log, budget burn-down, next-period plan, and escalation section — calibrated to the organization's reporting cadence and audience levels (executive vs. operational).
4. **Construct** the risk register and change request templates ensuring they integrate with the governance framework: risk register with probability-impact scoring, response strategies, and ownership; change request with impact analysis, approval workflow tracking, and implementation plan fields.
5. **Develop** the lessons learned template with structured categories (process, technical, people, tools), root cause fields, actionable recommendation sections, and cross-reference links to knowledge management repository — designed for both mid-project and end-of-project capture.
6. **Create** the closure report template covering final deliverables checklist, benefits realization status, budget variance analysis, schedule variance analysis, stakeholder satisfaction summary, lessons learned reference, and resource release confirmation.
7. **Publish** the complete template library with a master index, version control guidelines, customization rules (which fields are mandatory vs. optional by project tier), and a quick-start guide that maps each template to its lifecycle phase and governance gate.

## Output Format

```markdown
# PMO Template Library

## Library Index
| Template              | Lifecycle Phase | Gate     | Mandatory Fields | Optional Fields |
|-----------------------|-----------------|----------|------------------|-----------------|
| Project Charter       | Initiation      | G1       | ...              | ...             |
| Status Report         | Execution       | Ongoing  | ...              | ...             |
| Risk Register         | Planning+       | G2+      | ...              | ...             |
| Change Request        | Execution       | As needed| ...              | ...             |
| Lessons Learned       | All phases      | G3+      | ...              | ...             |
| Closure Report        | Closing         | G4       | ...              | ...             |

## Template: [Name]
### Purpose
[When and why to use this template]

### Sections
1. **[Section Name]** — [Description + fill-in guidance]
2. **[Section Name]** — [Description + fill-in guidance]
...

### Usage Guidelines
- **Who fills it**: [Role]
- **When**: [Trigger event]
- **Approval**: [Required approvers]
- **Storage**: [Where to save]

### Customization Rules
- **Tier 1 projects (>$X)**: All fields mandatory
- **Tier 2 projects**: [Reduced set]
- **Tier 3 projects**: [Minimum viable set]

## Version Control
- Template version: [X.Y]
- Last updated: [Date]
- Change log: [Summary of changes]

## Quick-Start Guide
[Step-by-step for first-time users]
```

