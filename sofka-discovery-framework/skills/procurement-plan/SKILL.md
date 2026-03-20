---
name: apex-procurement-plan
description: >
  Use when the user asks to "plan procurement", "make-or-buy analysis", "generate RFP",
  "evaluate vendors", "define vendor criteria", "select contract type",
  or mentions procurement, sourcing, contract types, vendor selection, outsourcing decisions.
  Triggers on: produces make-or-buy decision matrices, drafts RFP templates with evaluation
  scorecards, recommends contract types per procurement item, creates procurement timelines,
  designs vendor evaluation criteria.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Procurement Planning & Make-or-Buy Analysis

**TL;DR**: Produces a procurement management plan including make-or-buy decisions for each work package, RFP templates, vendor evaluation criteria, contract type recommendations (FFP, T&M, CPFF), and procurement timeline aligned with the project schedule.

## Principio Rector
Cada decisión de comprar vs. construir debe justificarse con análisis de capacidad interna, costo total de propiedad, y riesgo. La procurement no es solo "compras" — es gestión estratégica de la cadena de suministro del proyecto. El contrato correcto alinea incentivos; el contrato equivocado crea adversarios.

## Assumptions & Limits
- Assumes approved WBS with identifiable work packages for make-or-buy evaluation [SUPUESTO]
- Assumes organizational procurement policies and approved vendor lists are accessible [SUPUESTO]
- Breaks if procurement lead times exceed schedule buffer — procurement timeline must be validated against critical path [SCHEDULE]
- Scope limited to project procurement planning; enterprise procurement strategy is out of scope [PLAN]
- Does not execute procurement — produces decision-support documents and templates [PLAN]
- Contract values and vendor pricing are estimates; final negotiation is a separate process [SUPUESTO]

## Usage
```bash
/pm:procurement-plan $PROJECT_NAME --scope=full
/pm:procurement-plan $PROJECT_NAME --scope=make-or-buy --packages=all
/pm:procurement-plan $PROJECT_NAME --scope=rfp --vendor-count=3 --contract-type=t-and-m
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT_NAME` | Yes | Target project identifier |
| `--scope` | No | `full` / `make-or-buy` / `rfp` / `vendor-eval` (default: `full`) |
| `--packages` | No | `all` / comma-separated work package IDs |
| `--vendor-count` | No | Number of vendors to evaluate |
| `--contract-type` | No | `ffp` / `t-and-m` / `cpff` / `auto` (default: `auto`) |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Time-and-materials contracts with vendor teams; incremental delivery acceptance; collaborative vendor partnerships
- **Waterfall**: Fixed-price contracts with formal SOW; sealed-bid procurement; stage-gate vendor deliverable acceptance
- **SAFe**: Lean-Agile procurement with vendor PI participation; capacity-based contracts aligned to ART cadence
- **Hybrid**: Mixed contract types — fixed scope for predictable components, T&M for iterative workstreams
- **Portfolio**: Master service agreements across multiple projects; strategic vendor management and volume leverage
- **Transformation**: Change management vendor selection; consulting partner evaluation for organizational readiness

## Before Planning Procurement
1. Read approved `scope-wbs` — identify work packages requiring external resources [PLAN]
2. Glob `*resource*` and `*skills-gap*` — confirm internal capability gaps driving procurement need [PLAN]
3. Read organizational procurement policies — understand approval thresholds and required process [PLAN]
4. Read `schedule-baseline` — align procurement timeline with critical path [SCHEDULE]

## Entrada (Input Requirements)
- Approved WBS and resource plan
- Budget baseline with cost categories
- Organizational procurement policies
- Approved vendor list (if exists)
- Skills gap analysis from resource planning

## Proceso (Protocol)
1. **Identify procurement needs** — Review WBS for work packages requiring external resources
2. **Make-or-buy analysis** — Evaluate internal capability vs. external procurement per item
3. **Select contract types** — Recommend FFP, T&M, or CPFF based on scope certainty and risk
4. **Define evaluation criteria** — Establish weighted criteria (technical, cost, experience, risk)
5. **Draft RFP template** — Create standardized RFP with SOW, evaluation criteria, and terms
6. **Plan procurement timeline** — Align procurement activities with project schedule
7. **Risk assessment** — Identify procurement-specific risks (vendor lock-in, supply chain, quality)
8. **Define governance** — Establish contract management and performance monitoring approach

## Edge Cases
1. **Single vendor dependency for critical path items** — Document concentration risk; recommend dual-vendor strategy or pre-negotiated backup vendor agreement.
2. **Procurement lead time exceeds schedule buffer** — Fast-track procurement process; consider sole-source with justification; adjust schedule to accommodate.
3. **No qualified vendors for specialized needs** — Expand geographic search; consider capability building (build vs. buy shifts); document risk of limited vendor pool.
4. **Contract value exceeds organizational threshold** — Route through executive approval; prepare additional justification documentation; plan for extended approval timeline.

## Example: Good vs Bad

**Good Procurement Plan:**
| Attribute | Value |
|-----------|-------|
| Make-or-buy matrix | 12 work packages analyzed: 4 buy, 2 build, 6 no procurement needed [PLAN] |
| Contract types | FFP for infra (certain scope), T&M for development (evolving scope) [PLAN] |
| Evaluation criteria | 5 weighted criteria with rubrics per procurement item [METRIC] |
| RFP template | Standardized with SOW, evaluation scorecard, and contract terms [PLAN] |
| Timeline | Procurement start 6 weeks before critical path need; aligned with schedule [SCHEDULE] |

**Bad Procurement Plan:**
"We need to hire a vendor for the development work." — No make-or-buy analysis, no contract type recommendation, no evaluation criteria, no timeline. Procurement proceeds ad-hoc with whatever vendor is available.

## Salida (Deliverables)
- `01_procurement_plan_{proyecto}_{WIP}.md` — Procurement management plan
- Make-or-buy decision matrix with justification
- RFP template with evaluation scorecard
- Procurement timeline aligned with project schedule
- Contract type recommendations per procurement item

## Validation Gate
- [ ] Make-or-buy decisions evidence-based with capability and cost comparison
- [ ] Cost comparisons use consistent basis (total cost of ownership, not just unit price)
- [ ] All external procurement needs identified from WBS — no gaps
- [ ] Procurement timeline aligned with project schedule — lead times validated
- [ ] RFP ready for distribution with complete SOW and evaluation criteria
- [ ] Evaluation criteria unambiguous — independent evaluators produce consistent scores
- [ ] Procurement items trace to WBS work packages
- [ ] Vendor concentration risks identified and documented
- [ ] Contract types justified by scope certainty and risk profile per item
- [ ] Procurement cadence fits project methodology — agile procurement for agile workstreams

## Escalation Triggers
- Single vendor dependency for critical path items
- Procurement lead time exceeds schedule buffer
- No qualified vendors for specialized needs
- Contract value exceeds organizational approval threshold

## Additional Resources
| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | When applying PMBOK procurement management | `references/body-of-knowledge.md` |
| State of the Art | When implementing Lean-Agile procurement practices | `references/state-of-the-art.md` |
| Knowledge Graph | When mapping procurement to pipeline planning phases | `references/knowledge-graph.mmd` |
| Use Case Prompts | When generating procurement plans for specific contract types | `prompts/use-case-prompts.md` |
| Metaprompts | When adapting procurement for non-standard sourcing | `prompts/metaprompts.md` |
| Sample Output | When reviewing expected procurement plan quality | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

---

---

## Sub-Agents

### Contract Administrator


## Contract Administrator Agent

### Core Responsibility
Plan the complete contract administration lifecycle: from contract execution through performance monitoring, deliverable acceptance, payment management, change orders, dispute resolution, and contract closure.

### Process
1. **Design Payment Schedule.** Structure payment milestones aligned with deliverable acceptance: advance, progress payments, milestone payments, and retention/holdback amounts.
2. **Define Acceptance Criteria.** Establish specific, measurable acceptance criteria for each contractual deliverable with testing/review procedures and responsible reviewers.
3. **Plan Performance Monitoring.** Design vendor performance monitoring: SLA tracking, quality metrics, timeliness metrics, and communication responsiveness with reporting frequency.
4. **Establish Change Order Process.** Define process for contract modifications: change request form, impact analysis, approval authority, and baseline update procedure.
5. **Design Dispute Resolution.** Create tiered dispute resolution: informal resolution (PM level), formal escalation (steering level), mediation, and contractual remedies.
6. **Plan Contract Closure.** Define contract closure checklist: final deliverable acceptance, performance review, final payment, warranty/support transition, and lessons learned.
7. **Produce Administration Plan.** Deliver complete contract administration plan with payment schedule, acceptance procedures, monitoring framework, and dispute resolution.

### Output Format
- **Payment Milestone Table** — Milestone, Deliverable, Amount, Acceptance Criteria, Approval Authority.
- **Performance Scorecard Template** — SLA metrics, quality measures, and RAG thresholds for vendor reporting.
- **Contract Administration Checklist** — Phase-by-phase administration activities from execution to closure.

### Make Buy Analyzer


# Make-Buy Analyzer

## Core Responsibility

The Make-Buy Analyzer systematically evaluates every project component, work package, and deliverable to determine whether internal execution or external procurement delivers superior value. It applies quantitative cost modeling alongside qualitative assessments of organizational capability, schedule impact, intellectual property considerations, and long-term strategic alignment to produce defensible sourcing recommendations that minimize total cost of ownership while preserving competitive advantage.

## Process

1. **Inventory** all project components, work packages, and deliverables that are candidates for external procurement, categorizing each by domain, complexity, and criticality.
2. **Estimate** internal production costs including labor, tooling, infrastructure, opportunity cost, and learning curve for each candidate component.
3. **Benchmark** external market pricing through vendor research, historical contract data, and analogous project references to establish realistic buy-side cost baselines.
4. **Assess** organizational capability gaps by mapping required competencies against current team skills, available capacity, and technology readiness levels.
5. **Evaluate** strategic factors including intellectual property retention, core competency protection, vendor dependency risks, and long-term maintenance implications.
6. **Score** each component using a weighted decision matrix that balances cost differential, schedule impact, quality risk, strategic value, and flexibility.
7. **Recommend** make-or-buy disposition for each component with confidence levels, sensitivity analysis on key assumptions, and escalation flags for borderline decisions.

## Output Format

- **Decision Matrix Table**: Component | Make Cost | Buy Cost | Capability Gap | Strategic Score | Recommendation | Confidence
- **Executive Summary**: Top-line make-vs-buy split with total cost comparison and risk-adjusted savings
- **Detailed Analysis Cards**: One per component with full scoring rationale, assumptions, and sensitivity ranges
- **Risk Register Addendum**: Procurement-specific risks identified during analysis with proposed mitigations

### Procurement Strategy Designer


# Procurement Strategy Designer

## Core Responsibility

The Procurement Strategy Designer translates make-vs-buy decisions into a comprehensive procurement strategy that defines how each external acquisition will be sourced, contracted, and scheduled. It selects optimal contract types based on scope certainty and risk appetite, determines single-vendor versus multi-vendor sourcing approaches, establishes procurement milestones synchronized with the project schedule, and ensures alignment with organizational procurement policies, compliance requirements, and budget cycle constraints.

## Process

1. **Classify** each procurement item by complexity, value tier, scope certainty, and market availability to determine the appropriate procurement pathway (direct award, competitive bid, framework agreement).
2. **Select** the optimal contract type for each procurement — fixed-price for well-defined scope, time-and-materials for exploratory work, cost-plus for high-uncertainty deliverables — documenting the rationale and risk allocation.
3. **Design** the sourcing approach per item: sole-source with justification, single-vendor competitive, or multi-vendor competitive; define vendor pool size targets and prequalification criteria.
4. **Sequence** procurement activities against the project schedule, identifying long-lead items, critical-path dependencies, and parallel procurement opportunities to minimize schedule risk.
5. **Define** evaluation frameworks for each procurement including technical scoring criteria, commercial evaluation methodology, reference check protocols, and weighted scoring models.
6. **Establish** governance checkpoints including procurement approval thresholds, delegation of authority levels, protest/challenge procedures, and compliance verification gates.
7. **Consolidate** the strategy into a procurement management plan with timeline, responsibility matrix, budget allocation by procurement, and contingency reserves for procurement delays.

## Output Format

- **Procurement Strategy Summary**: One-page overview with total procurement count, value distribution, contract type mix, and timeline span
- **Contract Type Matrix**: Procurement Item | Contract Type | Rationale | Risk Owner | Estimated Value | Schedule Window
- **Sourcing Plan**: Approach per item with vendor pool strategy, prequalification criteria, and competition level
- **Procurement Timeline**: Gantt-aligned view showing RFP release, evaluation, award, and mobilization milestones per procurement
- **Governance Framework**: Approval thresholds, escalation paths, and compliance checkpoints

### Rfp Builder


# RFP Builder

## Core Responsibility

The RFP Builder transforms procurement strategy decisions into professional, comprehensive solicitation documents that clearly communicate project requirements, evaluation methodology, and submission expectations to prospective vendors. It produces RFPs for service-heavy procurements and RFQs for commodity or well-specified items, ensuring each document contains unambiguous scope definitions, measurable acceptance criteria, fair and transparent evaluation weightings, and legally sound terms that protect the buyer while attracting quality vendor responses.

## Process

1. **Extract** requirements from project documentation, work breakdown structure, and technical specifications, organizing them into mandatory (must-have), desirable (scored), and informational (context) categories.
2. **Structure** the solicitation document with standard sections: background and objectives, scope of work, technical requirements, commercial requirements, submission instructions, evaluation criteria, and contractual terms.
3. **Define** evaluation criteria with explicit weightings — typically technical approach (30-40%), team qualifications (15-25%), past performance (10-20%), commercial terms (20-30%) — calibrated to procurement priorities.
4. **Specify** the submission format including page limits, required attachments (resumes, references, financial statements), pricing breakdown templates, and compliance checklists to ensure comparable proposals.
5. **Draft** the evaluation process: receipt and compliance screening, independent technical scoring, commercial normalization, consensus scoring sessions, shortlist and oral presentations, best-and-final-offer round if applicable.
6. **Incorporate** contractual scaffolding including draft terms and conditions, service level agreements, intellectual property clauses, data protection requirements, and insurance minimums.
7. **Validate** the complete document against organizational procurement standards, legal review requirements, fairness principles, and accessibility guidelines before release authorization.

## Output Format

- **RFP/RFQ Document**: Complete solicitation document with all sections, appendices, and submission templates
- **Evaluation Scorecard Template**: Criteria | Weight | Rating Scale | Scoring Guidance | Evaluator Field
- **Vendor Communication Plan**: Q&A timeline, pre-proposal conference agenda, amendment process, and contact protocols
- **Compliance Checklist**: Mandatory requirements checklist for screening vendor submissions before detailed evaluation

