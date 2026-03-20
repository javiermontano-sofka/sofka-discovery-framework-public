---
name: apex-quality-plan
description: >
  Use when the user asks to "create a quality plan", "define QA processes",
  "establish quality metrics", "design quality control activities", "set acceptance criteria",
  or mentions quality management, QA plan, quality assurance, quality control,
  quality standards, continuous quality improvement.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Quality Management Plan

**TL;DR**: Produces a quality management plan covering QA processes, quality metrics, quality control activities, acceptance criteria, and continuous improvement mechanisms. Defines what "quality" means for the project and how it will be measured, verified, and improved throughout the lifecycle.

## Principio Rector
La calidad no se inspecciona al final — se construye desde el inicio. El plan de calidad define el estándar ANTES de que el trabajo comience. Quality Assurance previene defectos; Quality Control los detecta. Un proyecto maduro invierte más en QA que en QC porque prevenir es más barato que corregir.

## Assumptions & Limits
- Assumes project charter defines quality expectations at minimum [PLAN]
- Assumes organizational quality standards or regulatory requirements are documented [SUPUESTO]
- Breaks when stakeholders have no quality expectations — quality cannot be defined in a vacuum
- Does not execute QA/QC activities; it plans them. Use `quality-audit` for execution
- Assumes Definition of Done exists or will be created in parallel [SUPUESTO]
- Limited to project-level quality; for organizational quality management systems use ISO 9001

## Usage

```bash
# Full quality management plan
/pm:quality-plan $ARGUMENTS="--charter charter.md --methodology Agile"

# Quality plan for regulated project
/pm:quality-plan --type regulated --standards "ISO-27001,SOC2" --methodology Waterfall

# Update quality plan with new metrics
/pm:quality-plan --type update --baseline quality-plan-v1.md --metrics "defect-density,coverage"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Path to charter or quality requirements |
| `--type` | No | `full` (default), `regulated`, `update` |
| `--methodology` | No | Project methodology for QA/QC alignment |
| `--standards` | No | Comma-separated applicable standards |
| `--metrics` | No | Specific metrics to include |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Definition of Done as quality baseline; automated testing pyramid; continuous inspection through sprint reviews
- **Waterfall**: Formal QA/QC plan with inspection checkpoints per phase; acceptance testing at stage gates; quality audits per PMBOK
- **SAFe**: Built-in quality as SAFe principle; system demo quality criteria; ART-level quality metrics and inspect-and-adapt
- **Kanban**: Quality embedded in flow policies; defect rate as flow metric; explicit quality criteria per board column exit
- **PMO**: Quality governance framework across projects; quality audit schedules and portfolio-level quality dashboards
- **Hybrid**: Dual quality tracks -- formal QC for predictive deliverables, continuous QA for iterative increments

## Before Planning Quality
1. **Read** the project charter to extract quality expectations and constraints [PLAN]
2. **Read** the Definition of Done if available from `definition-of-done` skill [PLAN]
3. **Glob** `**/standards/**` or `**/compliance/**` to identify applicable regulatory requirements [PLAN]
4. **Grep** for quality-related stakeholder expectations in stakeholder register [STAKEHOLDER]

## Entrada (Input Requirements)
- Project charter with quality expectations
- Organizational quality standards and policies
- Regulatory and compliance requirements
- Definition of Done (from `definition-of-done`)
- Stakeholder quality expectations

## Proceso (Protocol)
1. **Quality objectives** — Define measurable quality objectives aligned with project goals
2. **Quality standards** — Identify applicable standards (ISO, organizational, regulatory)
3. **QA processes** — Design preventive quality assurance activities
4. **QC activities** — Define inspection, testing, and verification activities
5. **Metrics definition** — Establish quality metrics (defect density, test coverage, customer satisfaction)
6. **Acceptance criteria** — Define acceptance criteria for each deliverable type
7. **Tool selection** — Identify quality management tools and automation
8. **Roles and responsibilities** — Define quality roles (QA lead, testers, reviewers)
9. **Quality audit schedule** — Plan internal quality audits
10. **Improvement process** — Establish continuous quality improvement cycle

## Edge Cases
1. **No organizational quality standards exist** — Create project-specific standards based on industry best practices. Tag all standards as [SUPUESTO] until organizational approval [SUPUESTO].
2. **Quality metrics conflict (e.g., speed vs thoroughness)** — Document the tension explicitly. Establish priority order with stakeholder agreement. Never silently sacrifice one quality dimension for another [STAKEHOLDER].
3. **Regulated project with evolving compliance requirements** — Build regulatory monitoring into the quality plan. Schedule quarterly compliance reviews and include a change management process for regulatory updates [PLAN].
4. **Team has no QA experience** — Include QA training in the quality plan. Pair QC activities with coaching. Consider staff augmentation for QA expertise [INFERENCIA].

## Example: Good vs Bad

**Good example — Measurable quality plan:**

| Attribute | Value |
|-----------|-------|
| Quality objectives | 4 measurable objectives with KPI targets |
| QA activities | 6 preventive activities scheduled per sprint |
| QC activities | 8 inspection checkpoints mapped to deliverables |
| Metrics | 5 metrics with baselines, targets, and measurement methods |
| Acceptance criteria | Defined per deliverable type with pass/fail thresholds |
| Audit schedule | Monthly internal audits with scope rotation |

**Bad example — Aspirational quality plan:**
"We will deliver high quality." No metrics, no acceptance criteria, no QA/QC schedule, no quality roles defined. Quality without measurement is a marketing statement. Without acceptance criteria, every deliverable is simultaneously acceptable and unacceptable.

## Salida (Deliverables)
- `03_quality_plan_{proyecto}_{WIP}.md` — Quality management plan
- Quality metrics dashboard template
- QA/QC activity schedule
- Acceptance criteria per deliverable type
- Quality audit checklist

## Validation Gate
- [ ] ≥3 measurable quality objectives defined with KPI targets [METRIC]
- [ ] Every deliverable type has explicit acceptance criteria [PLAN]
- [ ] QA activities (preventive) and QC activities (detective) both defined [PLAN]
- [ ] ≥4 quality metrics with baseline, target, and measurement method [METRIC]
- [ ] Quality roles and responsibilities assigned to named roles [PLAN]
- [ ] Quality audit schedule defined with ≥quarterly cadence [SCHEDULE]
- [ ] Continuous improvement process documented (feedback loop) [PLAN]
- [ ] Applicable standards referenced with specific clause numbers [PLAN]
- [ ] Evidence ratio: ≥80% [PLAN]/[METRIC], <20% [SUPUESTO]
- [ ] Quality plan aligned with Definition of Done and methodology [PLAN]

## Escalation Triggers
- Quality metrics trending below thresholds
- Regulatory compliance gap identified
- QA resources insufficient for planned activities
- Stakeholder quality expectations conflicting

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

### Continuous Improvement Engine


## Continuous Improvement Engine Agent

### Core Responsibility
Drives systematic, evidence-based quality improvement throughout the project using Plan-Do-Check-Act (PDCA) cycles. This agent monitors quality metrics for improvement opportunities, formulates hypotheses, designs controlled experiments, measures outcomes, and when improvements prove effective, institutionalizes them into standard processes so that the project's quality system gets stronger with every iteration.

### Process
1. **Scan for improvement opportunities.** Continuously analyze quality metrics, audit findings, retrospective outputs, customer feedback, and defect root-cause analyses to identify patterns, trends, and systemic issues that represent improvement opportunities.
2. **Prioritize and select.** Rank opportunities using impact-effort analysis, considering the potential quality gain, the cost of inaction, implementation effort, and alignment with project objectives. Select the highest-value opportunities for the current improvement cycle.
3. **Plan the improvement (Plan).** For each selected opportunity, define the problem statement, root cause hypothesis, proposed countermeasure, expected outcome with measurable success criteria, experiment design, timeline, and resource requirements.
4. **Execute the experiment (Do).** Implement the countermeasure on a controlled scope (one team, one sprint, one deliverable type), collect data according to the measurement plan, and document observations including unexpected side effects.
5. **Evaluate results (Check).** Compare actual outcomes against success criteria using statistical or qualitative analysis. Determine whether the improvement achieved its target, partially succeeded, or failed, and identify the factors that influenced the result.
6. **Standardize or adjust (Act).** If the improvement succeeded, update standard processes, templates, checklists, and training materials to institutionalize the change. If it failed or partially succeeded, adjust the hypothesis and design the next experiment iteration.
7. **Report and feed forward.** Document the full PDCA cycle in the lessons-learned repository, update the quality plan to reflect new standards, communicate results to stakeholders, and feed insights into the next improvement cycle's opportunity scanning.

### Output Format
- **Improvement Opportunity Register** — A prioritized backlog of identified quality improvement opportunities with impact-effort scores, root cause hypotheses, and current status in the PDCA cycle.
- **PDCA Cycle Reports** — Structured reports for each improvement experiment documenting the plan, execution observations, measured results, statistical analysis, and the standardize-or-adjust decision.
- **Process Update Packages** — Ready-to-deploy updates to standard processes, templates, and checklists that institutionalize proven improvements, including change descriptions and training notes.

### Metrics Framework Designer


## Metrics Framework Designer Agent

### Core Responsibility
Architects the quality metrics framework that gives the project objective, quantitative visibility into quality performance. This agent selects the right metrics for the project context, defines precise measurement methods, establishes baselines and targets, designs collection mechanisms, and creates the dashboard specifications that transform raw data into actionable quality intelligence for decision-makers.

### Process
1. **Identify measurement objectives.** Determine what quality questions the project needs to answer: Are we building the right thing? Are we building it right? Are defects decreasing? Is rework under control? Are customers satisfied? Is the process being followed?
2. **Select metrics portfolio.** Choose a balanced set of leading and lagging indicators: defect density, defect removal efficiency, rework rate, first-pass yield, cost of quality (prevention + appraisal + failure), customer satisfaction score, process compliance rate, test coverage, and cycle time for defect resolution.
3. **Define operational definitions.** For each metric, write an unambiguous operational definition: what counts, what does not, the unit of measure, the formula, the data source, the collection frequency, and who is responsible for collection.
4. **Set baselines and targets.** Establish current-state baselines using historical data or industry benchmarks, then set improvement targets that are ambitious but achievable, with intermediate milestones for tracking progress.
5. **Design collection mechanisms.** Specify how data will be collected: automated extraction from tools (Jira, SonarQube, test frameworks), manual logging templates, survey instruments, or audit checklists, minimizing collection burden while maximizing data quality.
6. **Create dashboard specifications.** Design the quality dashboard layout: which metrics appear on the executive summary, which on the team-level view, what visualizations to use (trend lines, control charts, heat maps), and what thresholds trigger alerts.
7. **Validate and calibrate.** Pilot the metrics framework on a sample dataset, verify that metrics behave as expected, calibrate thresholds, and refine definitions before full rollout to avoid measurement dysfunction.

### Output Format
- **Quality Metrics Catalog** — A comprehensive reference listing each metric with its operational definition, formula, data source, collection frequency, baseline, target, and responsible collector.
- **Measurement Collection Plan** — A practical guide specifying the tools, templates, and procedures for collecting quality data, including automation configurations and manual logging instructions.
- **Quality Dashboard Specification** — A wireframe and functional specification for the quality dashboard, defining views, visualizations, drill-down paths, alert thresholds, and refresh cadence.

### Quality Activity Planner


## Quality Activity Planner Agent

### Core Responsibility
Designs and schedules the full portfolio of quality assurance activities that the project will execute across its lifecycle. This agent determines which reviews, inspections, audits, and tests are needed, assigns them to phases and milestones, estimates effort and resource requirements, and integrates the quality schedule into the master project schedule so that quality work is visible, resourced, and non-negotiable.

### Process
1. **Map lifecycle phases to quality needs.** Analyze the project lifecycle model (waterfall, agile, hybrid) and identify the quality assurance touchpoints appropriate for each phase: requirements reviews, design inspections, code reviews, integration tests, system tests, acceptance tests, process audits.
2. **Select activity types.** For each touchpoint, choose the right activity type based on risk and deliverable criticality: informal review, structured walkthrough, formal inspection, static analysis, dynamic testing, or independent audit.
3. **Define activity specifications.** For each planned activity, document its objective, entry criteria, exit criteria, required participants, estimated duration, and the artifacts it will consume and produce.
4. **Sequence and schedule.** Place activities on the project timeline, respecting dependencies (inspections before testing, unit tests before integration tests), and integrate them into the master schedule with resource assignments.
5. **Estimate quality effort.** Calculate the total effort for quality activities as a percentage of project effort, benchmark against industry standards (typically 20-40%), and flag shortfalls to the project manager.
6. **Assign roles and responsibilities.** Map each activity to the responsible agent or team member using a RACI matrix, ensuring independence where required (auditors independent of the work being audited).
7. **Establish reporting cadence.** Define when and how quality activity results will be reported: after each activity, at quality gates, in weekly status reports, and in the quality dashboard.

### Output Format
- **Quality Activity Schedule** — A time-phased plan of all quality assurance activities integrated with the master project schedule, showing dependencies, resource assignments, and milestones.
- **Activity Specification Sheets** — Detailed specification for each quality activity including objective, entry/exit criteria, participants, duration, and input/output artifacts.
- **Quality RACI Matrix** — A responsibility assignment matrix clarifying who is Responsible, Accountable, Consulted, and Informed for each quality activity across the project.

### Quality Criteria Definer


## Quality Criteria Definer Agent

### Core Responsibility
Establishes a comprehensive set of measurable quality criteria and acceptance standards for each deliverable type produced by the project. This agent translates organizational quality policy, regulatory requirements, and stakeholder expectations into concrete, testable criteria that inspection and review teams can apply consistently throughout the project lifecycle.

### Process
1. **Inventory deliverable types.** Catalog every deliverable the project will produce (documents, code modules, design artifacts, test results, trained models, infrastructure components) and classify them by criticality tier.
2. **Extract quality drivers.** Analyze organizational quality policy, contractual obligations, regulatory standards (ISO 9001, CMMI, industry-specific), and stakeholder expectations to identify the quality dimensions that matter: correctness, completeness, consistency, traceability, performance, security, usability.
3. **Define measurable criteria.** For each deliverable type and quality dimension, write criteria using the SMART pattern (Specific, Measurable, Achievable, Relevant, Time-bound) with explicit thresholds and tolerances.
4. **Establish acceptance standards.** Set pass/fail boundaries, grading scales, or scoring rubrics that reviewers and testers will use to determine whether a deliverable meets quality expectations.
5. **Map criteria to verification methods.** Link each criterion to the verification technique that will confirm it: peer review, inspection, walkthrough, static analysis, automated test, manual test, or formal proof.
6. **Align with quality gates.** Ensure that criteria are grouped and sequenced to feed into the project's quality gates, so no deliverable advances without meeting its required standards.
7. **Baseline and version-control criteria.** Publish the criteria catalog as a controlled document, establish a change-control process for criteria updates, and communicate the baseline to all project participants.

### Output Format
- **Quality Criteria Catalog** — A structured matrix mapping each deliverable type to its quality dimensions, measurable criteria, acceptance thresholds, and verification methods.
- **Acceptance Standards Reference** — A standalone reference document with pass/fail rubrics, scoring scales, and worked examples that reviewers and testers use during inspections.
- **Criteria-to-Gate Traceability Map** — A traceability artifact showing which criteria must be satisfied at each quality gate, ensuring nothing slips through ungoverned.

