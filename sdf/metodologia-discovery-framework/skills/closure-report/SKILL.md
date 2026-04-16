---
name: apex-closure-report
description: >
  Use when the user asks to "close the project", "generate closure report",
  "document final metrics", "perform administrative closure", or "obtain formal acceptance".
  Activates when a stakeholder needs to produce a project closure report, compare final
  actuals vs baseline, compile lessons learned, obtain formal sponsor acceptance, or execute
  administrative closure including resource release and documentation archiving.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Project Closure Report

**TL;DR**: Produces a comprehensive project closure report including final metrics vs. baseline, benefits realization assessment, lessons learned summary, formal acceptance documentation, and administrative closure checklist. Ensures organizational knowledge capture and formal project termination.

## Principio Rector
El cierre no es un trámite — es la última oportunidad de capturar valor del proyecto. Las lecciones no documentadas se pierden; los beneficios no medidos se asumen; los contratos no cerrados generan obligaciones fantasma. Un cierre formal protege a la organización y alimenta la mejora continua.

## Assumptions & Limits
- Assumes project baselines exist for comparison against final actuals [SUPUESTO]
- Assumes sponsor is available to sign formal acceptance documentation [STAKEHOLDER]
- Breaks when project was cancelled without formal baselines — adapt to termination report format
- Does not track post-project benefits — that continues under `benefits-realization-plan`
- Contract closure requires legal/procurement input beyond PM scope [SUPUESTO]
- Lessons learned are only valuable if fed into organizational knowledge management system

## Usage

```bash
# Generate full closure report
/pm:closure-report $PROJECT --type=full

# Generate lessons learned compilation only
/pm:closure-report $PROJECT --type=lessons-learned

# Generate administrative closure checklist
/pm:closure-report $PROJECT --type=admin-closure
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project identifier |
| `--type` | Yes | `full`, `lessons-learned`, `admin-closure`, `acceptance` |
| `--include-benefits` | No | Include benefits realization snapshot (true/false) |

## Service Type Routing
`{TIPO_PROYECTO}`: Agile uses iteration-level closure + release closure; Waterfall uses formal phase-gate closure; SAFe uses PI-level closure; All types require formal administrative closure.

## Before Closing

1. **Read** project baselines (scope, schedule, budget) for comparison against final actuals
2. **Read** the lessons learned register to compile and categorize all captured lessons
3. **Glob** `skills/closure-report/references/*.md` for closure report templates and checklists
4. **Grep** for outstanding issues, residual risks, and pending action items across project artifacts

## Entrada (Input Requirements)
- Project baselines (scope, schedule, budget)
- Actual performance data (final EVM, quality metrics)
- Lessons learned register
- Benefits realization data
- Outstanding issues and risks
- Contract and vendor closure status

## Proceso (Protocol)
1. **Performance summary** — Compare final actuals vs. baseline (schedule, cost, scope)
2. **Benefits assessment** — Evaluate benefits realized vs. planned
3. **Quality summary** — Summarize quality metrics and conformance
4. **Lessons consolidation** — Compile and categorize all lessons learned
5. **Outstanding items** — Document unresolved issues, residual risks, pending actions
6. **Contract closure** — Verify all contracts closed and obligations met
7. **Knowledge transfer** — Ensure operational knowledge transferred to receiving team
8. **Archive plan** — Define project archive structure and retention policy
9. **Formal acceptance** — Obtain signed acceptance from sponsor/customer
10. **Administrative closure** — Release resources, close accounts, archive documentation

## Edge Cases

1. **Sponsor refuses to sign acceptance**: Document specific objections. Negotiate resolution path. If unresolvable, escalate to steering committee with evidence of deliverable completeness. [STAKEHOLDER]
2. **Project cancelled before completion**: Produce termination report instead. Document sunk costs, salvageable deliverables, and lessons from cancellation decision. [PLAN]
3. **Outstanding issues with no resolution path**: Transfer ownership to operational team with SLA. Document handoff agreement. Never close project with orphaned issues. [SCHEDULE]
4. **Benefits significantly below projections**: Document variance with root cause analysis. Recommend corrective actions for benefit recovery. Tag projections as [INFERENCIA]. [METRIC]

## Example: Good vs Bad

**Good Closure Report:**

| Attribute | Value |
|-----------|-------|
| Performance summary | Planned vs actual for scope, schedule, cost |
| Benefits assessment | Quantified with baseline comparison |
| Lessons learned | ≥10 categorized with actionable recommendations |
| Outstanding items | Each assigned to operational owner with deadline |
| Formal acceptance | Signed by sponsor with acceptance criteria met |
| Administrative closure | Checklist 100% complete |

**Bad Closure Report:**
An email saying "the project is done" without metrics, lessons learned, acceptance documentation, or administrative closure. Fails because it leaves the organization without performance data for future estimation, no lessons for improvement, and no formal record of project completion.

## Validation Gate
- [ ] Final actuals compared against baseline for scope, schedule, AND cost dimensions
- [ ] Benefits realization assessed with quantified variance from planned targets
- [ ] ≥10 lessons learned compiled, categorized, and submitted to organizational knowledge base
- [ ] Every outstanding item assigned to an owner with deadline and resolution path
- [ ] Formal acceptance obtained with sponsor signature or documented objection
- [ ] All contracts verified as closed with obligations fulfilled
- [ ] Knowledge transfer to operational team documented and confirmed
- [ ] Project archive structure defined with retention policy
- [ ] Sponsor receives formal closure with performance summary [STAKEHOLDER]
- [ ] Closure process aligned with methodology requirements [PLAN]

## Escalation Triggers
- Sponsor refuses to sign acceptance
- Outstanding issues with no resolution path
- Benefits significantly below projections
- Contract disputes unresolved at closure

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before closing to understand closure best practices | `references/body-of-knowledge.md` |
| State of the Art | When designing innovative closure approaches | `references/state-of-the-art.md` |
| Knowledge Graph | To link closure to lessons learned and benefits | `references/knowledge-graph.mmd` |
| Use Case Prompts | When facilitating closure workshops | `prompts/use-case-prompts.md` |
| Metaprompts | To generate closure report templates | `prompts/metaprompts.md` |
| Sample Output | To calibrate expected closure report format | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

---

---

## Sub-Agents

### Contract Closure Specialist


## Contract Closure Specialist Agent

### Core Responsibility
Manages the formal closure of every procurement relationship associated with the project, ensuring that all vendor contracts and service-level agreements are settled, final invoices are reconciled, vendor performance is evaluated and documented, warranty and support transition terms are activated, and no financial or legal obligations remain open that could create post-project liability.

### Process
1. **Inventory active contracts.** Compile a complete registry of all project-related contracts, purchase orders, service agreements, SLAs, and licensing arrangements, including amendments and change orders issued during execution.
2. **Verify deliverable fulfillment.** For each contract, confirm that the vendor has delivered all contracted goods, services, and documentation by cross-referencing against the contract deliverable schedule and acceptance records.
3. **Reconcile financial obligations.** Review all invoices submitted, payments made, retentions held, and outstanding amounts; ensure final invoicing is triggered and that all financial transactions are reconciled against the contract value and approved change orders.
4. **Conduct vendor performance review.** Evaluate each vendor against contracted SLAs, quality standards, and responsiveness criteria; document performance ratings and any formal disputes or escalations that occurred during the engagement.
5. **Execute formal closure actions.** Prepare and obtain signatures on contract closure letters or completion certificates, release retained amounts per contractual terms, and archive all contract documentation in the organizational repository.
6. **Activate warranty and support terms.** Confirm that post-project warranty periods, maintenance agreements, and support SLAs are properly activated with clear ownership transfer to the operations or support team.
7. **Produce contract closure package.** Generate the final Contract Closure Report including the closure status of each contract, financial reconciliation summary, vendor performance evaluations, and a register of any residual obligations such as warranties or indemnities.

### Output Format
- **Contract Closure Matrix** — Status table for every contract showing deliverable completion, financial reconciliation, closure letter status, and residual obligations.
- **Vendor Performance Scorecards** — Individual evaluations per vendor covering quality, timeliness, responsiveness, and overall satisfaction rating.
- **Financial Reconciliation Summary** — Consolidated view of contracted amounts, actual spend, retentions, final payments, and any disputed amounts with resolution status.

### Deliverable Acceptance Auditor


## Deliverable Acceptance Auditor Agent

### Core Responsibility
Conducts a comprehensive audit of every project deliverable against the approved scope baseline, verifying that each item has received formal stakeholder acceptance, that sign-off documentation is complete and properly archived, and that any conditional acceptances or outstanding punch-list items are explicitly documented with remediation owners and deadlines.

### Process
1. **Extract deliverable registry.** Pull the complete list of committed deliverables from the project scope baseline, WBS dictionary, and any approved change requests that added or removed scope items.
2. **Map acceptance evidence.** For each deliverable, locate the corresponding acceptance certificate, sign-off email, UAT sign-off form, or equivalent formal approval artifact.
3. **Validate sign-off authority.** Confirm that each acceptance was provided by an authorized stakeholder as defined in the RACI matrix or project charter, flagging any approvals from unauthorized parties.
4. **Identify gaps and conditionals.** Catalog deliverables lacking formal acceptance, those accepted with conditions or caveats, and any items where acceptance was verbal but not documented in writing.
5. **Reconcile against change log.** Cross-reference the deliverable list with the change log to ensure descoped items are properly marked as removed and newly added items are included in the acceptance audit.
6. **Compile remediation register.** For each gap or conditional acceptance, create an actionable remediation entry with owner, deadline, and escalation path to ensure closure before the project is formally closed.
7. **Produce acceptance audit report.** Generate the final Deliverable Acceptance Audit Report summarizing acceptance status, outstanding items, risk exposure from unaccepted deliverables, and recommendations for the closure decision.

### Output Format
- **Deliverable Acceptance Matrix** — Tabular view of every deliverable with acceptance status, approver, date, and evidence reference.
- **Gap and Remediation Register** — List of unaccepted or conditionally accepted deliverables with remediation actions, owners, and deadlines.
- **Acceptance Audit Summary** — Executive narrative with acceptance rate metrics, risk assessment, and go/no-go recommendation for formal closure.

### Knowledge Transfer Architect


## Knowledge Transfer Architect Agent

### Core Responsibility
Architects and orchestrates the complete knowledge transfer from the project team to the receiving operations, support, and business teams, ensuring that tacit and explicit knowledge is captured, handoff documentation is comprehensive and actionable, support transition plans are executable, and organizational learning is preserved in accessible repositories for future project teams and strategic decision-making.

### Process
1. **Map knowledge domains.** Identify all knowledge domains generated by the project including technical architecture, operational procedures, configuration details, business rules, integration touchpoints, known issues, and undocumented workarounds discovered during execution.
2. **Identify receiving audiences.** Define the target audiences for knowledge transfer: operations team, L1/L2/L3 support tiers, business process owners, future development teams, and the PMO or portfolio management office for lessons learned.
3. **Design transfer mechanisms.** For each knowledge domain and audience combination, select the appropriate transfer method: formal documentation, walkthrough sessions, shadowing periods, recorded demonstrations, runbooks, or interactive workshops.
4. **Produce handoff documentation.** Create or validate the completeness of operations manuals, system administration guides, runbooks, architecture decision records, configuration inventories, and troubleshooting guides tailored to each receiving audience.
5. **Execute transition sessions.** Facilitate structured knowledge transfer sessions with defined agendas, competency checkpoints, and feedback loops to ensure recipients can independently operate, support, and maintain the delivered solution.
6. **Capture organizational knowledge.** Distill project lessons learned, best practices, reusable assets, and estimation benchmarks into the organizational knowledge base, tagged for discoverability by future project teams.
7. **Validate transfer completeness.** Conduct readiness assessments with receiving teams, verify that all critical knowledge has been absorbed through competency checks or dry-run exercises, and obtain formal sign-off on knowledge transfer completion.

### Output Format
- **Knowledge Transfer Plan** — Structured plan mapping knowledge domains to audiences, transfer methods, schedule, and responsible parties.
- **Operations Handoff Package** — Complete documentation set including runbooks, architecture guides, configuration inventories, and troubleshooting procedures.
- **Lessons Learned Repository Entry** — Curated set of project lessons, best practices, anti-patterns, and reusable templates submitted to the organizational knowledge base.

### Performance Summarizer


## Performance Summarizer Agent

### Core Responsibility
Aggregates and analyzes the complete performance history of the project, producing a definitive final performance report that compares actual results against the approved baselines for schedule, budget, scope, and quality, including root-cause explanations for all significant variances and lessons that inform future estimation and planning accuracy.

### Process
1. **Collect baseline snapshots.** Retrieve the approved schedule baseline, cost baseline, scope baseline, and quality metrics targets from the project management plan and any re-baselining approvals.
2. **Gather actuals data.** Extract final actual values from the project schedule (completion dates, milestone actuals), financial systems (actual spend, committed costs, accruals), scope tracking (features delivered, requirements fulfilled), and quality logs (defect counts, test pass rates, SLA compliance).
3. **Calculate variance metrics.** Compute Schedule Variance (SV), Schedule Performance Index (SPI), Cost Variance (CV), Cost Performance Index (CPI), scope completion percentage, and quality KPI actuals vs. targets for each measurement period and cumulatively.
4. **Perform root-cause analysis.** For each variance exceeding the defined threshold (typically plus or minus 10%), document the root cause, contributing factors, when the variance was first detected, and what corrective actions were taken.
5. **Assess trend patterns.** Analyze performance trends across the project lifecycle to identify systemic estimation issues, recurring risk categories, or process gaps that drove sustained variances.
6. **Benchmark against organizational data.** Where available, compare project performance against organizational benchmarks, portfolio averages, or industry standards to contextualize results.
7. **Synthesize performance narrative.** Produce the final Project Performance Report with executive summary, detailed metrics tables, variance explanations, trend analysis, and actionable recommendations for improving estimation accuracy on future projects.

### Output Format
- **Performance Dashboard** — Visual summary with SPI, CPI, scope completion, and quality KPIs presented as gauges or trend charts in tabular Markdown.
- **Variance Analysis Register** — Detailed table of all significant variances with root cause, impact, corrective action taken, and residual effect.
- **Final Performance Report** — Comprehensive narrative covering schedule, budget, scope, and quality performance with lessons for organizational process improvement.

