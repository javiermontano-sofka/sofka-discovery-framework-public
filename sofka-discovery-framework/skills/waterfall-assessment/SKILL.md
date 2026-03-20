---
name: apex-waterfall-assessment
description: >
  Use when the user asks to "assess waterfall maturity", "evaluate traditional PM practices",
  "check PMBOK adherence", "review predictive methodology readiness", "audit phase-gate compliance",
  or mentions waterfall assessment, traditional PM maturity, PMBOK compliance,
  PRINCE2 maturity, predictive PM evaluation, earned value adoption.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Waterfall / Traditional PM Maturity Assessment

**TL;DR**: Assesses organizational maturity in traditional/predictive project management across PMBOK knowledge areas and PRINCE2 principles. Evaluates process standardization, baseline management discipline, earned value adoption, change control rigor, documentation quality, and governance effectiveness. Produces a knowledge-area maturity matrix, process gap analysis, and an improvement roadmap toward predictable, controlled project delivery.

## Principio Rector
La madurez en gestión predictiva no se mide por cuántos documentos se producen, sino por cuántas decisiones se toman con evidencia de baseline y cuántos desvíos se detectan antes de que se conviertan en crisis. Un proyecto waterfall maduro no es burocrático — es predecible. La diferencia está en usar los controles para decidir, no solo para documentar.

## Assumptions & Limits
- Assumes the organization runs ≥3 projects using predictive methodology for meaningful assessment [METRIC]
- Assumes PM process documentation and templates are accessible [PLAN]
- Breaks when organization has no formal PM processes — there is nothing to assess; use `waterfall-framework` to design first
- Does not implement improvements; assesses maturity. Use `waterfall-framework` for implementation
- Assumes historical project performance data (SV, CV, scope changes) is available [SUPUESTO]
- Limited to PM process maturity; for organizational maturity models (OPM3, P3M3) use dedicated frameworks

## Usage

```bash
# Full waterfall maturity assessment
/pm:waterfall-assessment $ARGUMENTS="--org 'PMO Central' --projects project-portfolio.md"

# Knowledge area deep-dive
/pm:waterfall-assessment --type knowledge-area --area "schedule,cost,risk"

# Benchmark comparison
/pm:waterfall-assessment --type benchmark --sector financial-services
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Organization/PMO identifier and project portfolio |
| `--type` | No | `full` (default), `knowledge-area`, `benchmark`, `gap-analysis` |
| `--area` | No | Specific PMBOK knowledge areas to assess |
| `--sector` | No | Industry sector for benchmark comparison |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Assess residual waterfall practices needed for compliance or contractual obligations
- **Waterfall**: Primary use — full maturity assessment across all PMBOK knowledge areas
- **SAFe**: Assess traditional PM capabilities needed at portfolio and solution train levels
- **Kanban**: Assess baseline management and formal planning capabilities alongside flow practices
- **Hybrid**: Assess waterfall component maturity within hybrid methodology structure
- **PMO**: Assess organizational standardization of traditional PM processes
- **Portfolio**: Assess predictive planning maturity for portfolio-level forecasting
- **Transformation**: Baseline traditional PM maturity before methodology transformation

## Before Assessing Maturity
1. **Read** current PM methodology documentation and templates [PLAN]
2. **Read** historical project performance reports (schedule variance, cost variance) [METRIC]
3. **Glob** `**/process*` or `**/template*` to find PM process artifacts [PLAN]
4. **Grep** for EVM, baseline, change control, and gate references in project documentation [INFERENCIA]

## Entrada (Input Requirements)
- Current PM processes, templates, and standards documentation
- Historical project performance data (schedule variance, cost variance, scope changes)
- EVM usage practices and baseline management discipline
- Change control processes and compliance rates
- Governance structure and gate effectiveness data

## Proceso (Protocol)
1. **Knowledge area mapping** — Assess maturity per PMBOK knowledge area (scope, schedule, cost, quality, resource, communication, risk, procurement, stakeholder, integration)
2. **Process standardization** — Evaluate degree of process standardization and template usage across projects
3. **Baseline management** — Assess quality and discipline of scope, schedule, and cost baseline management
4. **Change control rigor** — Evaluate change request process compliance and CCB effectiveness
5. **EVM adoption** — Assess earned value management implementation depth and usage for decisions
6. **Documentation quality** — Review documentation completeness, currency, and actual usage by teams
7. **Governance effectiveness** — Evaluate phase-gate compliance, steering committee decision quality
8. **Organizational learning** — Assess lessons learned capture, storage, and application to new projects
9. **Benchmark comparison** — Compare maturity levels against industry and sector benchmarks
10. **Improvement roadmap** — Design phased improvement plan prioritized by delivery predictability impact

## Edge Cases
1. **Organization claims maturity but performance data contradicts** — Trust data over self-assessment. Compare claimed process adherence with actual project variance data. Document the gap explicitly [METRIC].
2. **Inconsistent maturity across departments** — Assess per department, then aggregate. Inconsistency itself is a finding — standardization is a maturity indicator [INFERENCIA].
3. **Templates exist but are not used** — Template existence ≠ process maturity. Assess actual adoption rates. Templates without enforcement are shelf-ware [METRIC].
4. **Organization undergoing methodology transformation** — Baseline current waterfall maturity before transformation begins. This becomes the "before" measurement [PLAN].

## Example: Good vs Bad

**Good example — Evidence-based maturity assessment:**

| Attribute | Value |
|-----------|-------|
| Knowledge areas | All 10 PMBOK areas assessed with evidence |
| Maturity range | Level 2-4 across areas (average 2.8/5) |
| Strongest area | Risk management (Level 4) — active risk registers on 90% of projects |
| Weakest area | Earned value (Level 1) — EVM not used on any project |
| Standardization | 65% template adoption rate across projects |
| Roadmap | 12-month improvement plan with 3 quick wins and 4 structural changes |

**Bad example — Checklist maturity:**
"We have templates for everything, so we are mature." Template existence without adoption tracking, performance data analysis, or governance effectiveness assessment is not a maturity evaluation. Maturity is measured by outcomes (predictability), not by artifact count.

## Salida (Deliverables)
- `05_waterfall_assessment_{proyecto}_{WIP}.md` — Traditional PM maturity report
- PMBOK knowledge area maturity matrix (10 areas x 5 levels)
- Process standardization scorecard with adoption rates
- Gap analysis prioritized by impact on delivery predictability
- Improvement roadmap with quick wins and structural changes

## Validation Gate
- [ ] All 10 PMBOK knowledge areas assessed with evidence-backed scores [METRIC]
- [ ] Maturity levels calibrated on consistent 1-5 scale with clear criteria [METRIC]
- [ ] Process standardization measured by adoption rates, not template existence [METRIC]
- [ ] EVM adoption depth assessed (not just presence/absence) [METRIC]
- [ ] Change control compliance rate quantified [METRIC]
- [ ] Governance effectiveness assessed with decision quality evidence [PLAN]
- [ ] Benchmark comparison against sector standards included [PLAN]
- [ ] Improvement roadmap prioritized by predictability impact [PLAN]
- [ ] Evidence ratio: ≥80% [METRIC]/[PLAN], <20% [SUPUESTO]
- [ ] Assessment grounded in PMBOK/PRINCE2, not Agile-biased criteria [PLAN]

## Escalation Triggers
- No formal PM processes standardized despite running regulated or contractual projects
- EVM not used in any project with budget above organizational threshold
- Change control consistently bypassed with no consequence
- Phase gates rubber-stamped without substantive review

## Additional Resources

| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | Traditional PM maturity models | `references/body-of-knowledge.md` |
| State of the Art | Modern predictive PM practices | `references/state-of-the-art.md` |
| Knowledge Graph | Waterfall assessment in methodology | `references/knowledge-graph.mmd` |
| Use Case Prompts | Maturity assessment scenarios | `prompts/use-case-prompts.md` |
| Metaprompts | Custom assessment frameworks | `prompts/metaprompts.md` |
| Sample Output | Reference maturity report | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

---

---

## Sub-Agents

### Documentation Quality Reviewer


## Documentation Quality Reviewer Agent

### Core Responsibility

Assesses the quality, completeness, and consistency of project documentation across all waterfall phases, ensuring that documents serve their intended purpose of enabling handoffs, supporting audit trails, and providing a reliable basis for downstream work.

### Process

1. **Inventory required documents.** List all documents mandated by the methodology framework for each phase (charter, requirements spec, design docs, test plans, etc.).
2. **Assess completeness.** For each required document, verify its existence, currency, and completeness against the documentation standard template.
3. **Evaluate content quality.** Review documents for clarity, precision, ambiguity, internal consistency, and fitness for their intended audience.
4. **Check cross-document alignment.** Verify that information is consistent across related documents (requirements align with design, design aligns with test plans).
5. **Measure document currency.** Assess whether documents are updated when changes occur or whether they become stale after initial creation.
6. **Evaluate accessibility.** Determine whether documents are stored, versioned, and accessible to all stakeholders who need them.
7. **Produce quality assessment.** Generate a document quality scorecard with specific gaps, inconsistencies, and improvement priorities.

### Output Format

- **Documentation Completeness Matrix** — Checklist of required vs actual documents per phase with quality ratings.
- **Cross-Document Consistency Report** — Identified inconsistencies and misalignments between related documents.
- **Documentation Improvement Plan** — Prioritized actions to improve document quality and maintenance practices.

### Documentation Quality Scorer


## Documentation Quality Scorer Agent

### Core Responsibility

Scores documentation quality. This agent operates autonomously, applying systematic analysis and producing structured outputs.

### Process

1. **Gather Inputs.** Collect all relevant data, documents, and stakeholder inputs needed for analysis.
2. **Analyze Context.** Assess the project context, methodology, phase, and constraints.
3. **Apply Framework.** Apply the appropriate analytical framework or model.
4. **Generate Findings.** Produce detailed findings with evidence tags and quantified impacts.
5. **Validate Results.** Cross-check findings against related artifacts for consistency.
6. **Formulate Recommendations.** Transform findings into actionable recommendations with owners and timelines.
7. **Deliver Output.** Produce the final structured output with executive summary, analysis, and action items.

### Output Format

- **Analysis Report** — Structured findings with evidence tags and severity ratings.
- **Recommendation Register** — Actionable items with owners, deadlines, and success criteria.
- **Executive Summary** — 3-5 bullet point summary for stakeholder communication.

### Phase Gate Compliance Auditor


## Phase-Gate Compliance Auditor Agent

### Core Responsibility

Evaluates the rigor and effectiveness of the organization's phase-gate process by verifying that each project phase produces the required deliverables at the mandated quality level, that gate reviews are substantive rather than rubber-stamp, and that gate decisions are enforced.

### Process

1. **Map phase-gate model.** Document the organization's phase-gate model including phases, gates, required deliverables, approval criteria, and decision options (Go/Kill/Hold/Recycle).
2. **Audit deliverable completeness.** For each completed gate, verify that all required deliverables were submitted and met their acceptance criteria.
3. **Assess gate review quality.** Evaluate whether gate reviews involve appropriate stakeholders, allocate sufficient time, and apply genuine scrutiny to deliverables.
4. **Analyze gate decisions.** Review the distribution of gate decisions across projects — if gates never produce Kill/Hold decisions, the process may lack rigor.
5. **Measure phase adherence.** Determine whether work from later phases bleeds into earlier phases (phase leakage) or whether phases are properly sequential.
6. **Evaluate escalation paths.** Assess what happens when projects fail a gate — whether recycling processes are defined and enforced.
7. **Produce compliance report.** Generate a comprehensive compliance assessment with a project-by-project gate status and systemic improvement recommendations.

### Output Format

- **Gate Compliance Matrix** — Project-by-project status of gate deliverables and decision outcomes.
- **Phase Leakage Analysis** — Evidence of work starting before gate approval and its impact on project outcomes.
- **Gate Effectiveness Report** — Assessment of gate review rigor with recommendations for strengthening the process.

### Process Adherence Tracker


## Process Adherence Tracker Agent

### Core Responsibility

Tracks process adherence. This agent operates autonomously, applying systematic analysis and producing structured outputs.

### Process

1. **Gather Inputs.** Collect all relevant data, documents, and stakeholder inputs needed for analysis.
2. **Analyze Context.** Assess the project context, methodology, phase, and constraints.
3. **Apply Framework.** Apply the appropriate analytical framework or model.
4. **Generate Findings.** Produce detailed findings with evidence tags and quantified impacts.
5. **Validate Results.** Cross-check findings against related artifacts for consistency.
6. **Formulate Recommendations.** Transform findings into actionable recommendations with owners and timelines.
7. **Deliver Output.** Produce the final structured output with executive summary, analysis, and action items.

### Output Format

- **Analysis Report** — Structured findings with evidence tags and severity ratings.
- **Recommendation Register** — Actionable items with owners, deadlines, and success criteria.
- **Executive Summary** — 3-5 bullet point summary for stakeholder communication.

### Requirements Stability Analyst


## Requirements Stability Analyst Agent

### Core Responsibility

Measures the stability of requirements throughout the waterfall project lifecycle, tracking change requests, scope creep, and requirements volatility to assess whether the predictive approach is appropriate for the project's requirements profile and change dynamics.

### Process

1. **Baseline requirements inventory.** Document the total number of requirements at baseline and their categorization (functional, non-functional, interface, regulatory).
2. **Track change volume.** Measure the number of change requests submitted per phase and their disposition (approved, rejected, deferred).
3. **Calculate volatility index.** Compute the requirements volatility rate as the ratio of changed requirements to total requirements over the project lifecycle.
4. **Analyze change timing.** Determine when in the lifecycle changes occur — early changes are normal while late changes signal process problems or poor upfront analysis.
5. **Assess impact propagation.** Evaluate how individual requirement changes cascade through design, development, and testing phases in terms of rework effort.
6. **Evaluate traceability.** Verify that requirements traceability matrices are maintained and that changes can be traced through all downstream artifacts.
7. **Recommend stability improvements.** Propose practices to improve requirements stability or, if volatility is inherently high, recommend methodology adjustments.

### Output Format

- **Requirements Volatility Report** — Change volume, timing distribution, and volatility index with trend analysis.
- **Impact Cascade Analysis** — Downstream rework costs and schedule impacts of requirement changes by phase.
- **Stability Improvement Plan** — Recommendations for reducing requirements churn or adapting the methodology to handle it.

### Requirements Stability Measurer


## Requirements Stability Measurer Agent

### Core Responsibility

Measures requirements stability. This agent operates autonomously, applying systematic analysis and producing structured outputs.

### Process

1. **Gather Inputs.** Collect all relevant data, documents, and stakeholder inputs needed for analysis.
2. **Analyze Context.** Assess the project context, methodology, phase, and constraints.
3. **Apply Framework.** Apply the appropriate analytical framework or model.
4. **Generate Findings.** Produce detailed findings with evidence tags and quantified impacts.
5. **Validate Results.** Cross-check findings against related artifacts for consistency.
6. **Formulate Recommendations.** Transform findings into actionable recommendations with owners and timelines.
7. **Deliver Output.** Produce the final structured output with executive summary, analysis, and action items.

### Output Format

- **Analysis Report** — Structured findings with evidence tags and severity ratings.
- **Recommendation Register** — Actionable items with owners, deadlines, and success criteria.
- **Executive Summary** — 3-5 bullet point summary for stakeholder communication.

### Waterfall Process Optimizer


## Waterfall Process Optimizer Agent

### Core Responsibility

Identifies opportunities to streamline and optimize the waterfall process without sacrificing the predictive discipline, governance rigor, and documentation standards that make waterfall appropriate for the project context, focusing on eliminating waste while preserving value.

### Process

1. **Map end-to-end process.** Document the complete waterfall process flow including all activities, handoffs, reviews, approvals, and wait states.
2. **Identify waste categories.** Classify process waste using lean categories: waiting, overprocessing, defects, handoff losses, unnecessary documentation, and redundant reviews.
3. **Measure cycle efficiency.** Calculate the ratio of value-adding time to total elapsed time for each phase to identify phases with excessive overhead.
4. **Analyze handoff effectiveness.** Evaluate inter-phase handoffs for information loss, delays, and rework caused by incomplete or unclear deliverables.
5. **Benchmark against standards.** Compare the organization's waterfall process against industry standards (PMBOK, PRINCE2) to identify unnecessary additions or missing practices.
6. **Design optimized process.** Propose specific process improvements that reduce waste and cycle time while maintaining gate rigor and documentation standards.
7. **Create optimization roadmap.** Produce a phased implementation plan for process improvements with expected efficiency gains and risk mitigation.

### Output Format

- **Process Waste Analysis** — Categorized waste identification with quantified time and cost impact.
- **Cycle Efficiency Report** — Phase-by-phase efficiency ratios with improvement targets.
- **Optimization Roadmap** — Prioritized process improvements with implementation sequence and expected ROI.

