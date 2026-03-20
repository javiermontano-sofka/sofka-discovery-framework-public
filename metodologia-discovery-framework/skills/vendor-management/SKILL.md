---
name: apex-vendor-management
description: >
  Use when the user asks to "manage vendors", "track vendor performance",
  "monitor SLAs", "evaluate supplier compliance", "create vendor scorecards",
  or mentions vendor management, supplier performance, SLA monitoring,
  contract compliance, vendor governance, vendor scorecard.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Vendor Performance & SLA Monitoring

**TL;DR**: Manages vendor relationships through performance tracking, SLA monitoring, contract compliance verification, and vendor governance. Produces vendor scorecards, SLA dashboards, and escalation protocols to ensure vendors deliver per contractual commitments.

## Principio Rector
Un vendor contratado no es un vendor gestionado. Sin monitoreo activo, el rendimiento del vendor degrada hacia el mínimo aceptable. Los SLAs son la línea de base; la relación es el multiplicador. Vendor management equilibra rigor contractual con relación colaborativa para obtener el mejor resultado posible.

## Assumptions & Limits
- Assumes vendor contracts with defined SLAs and KPIs are available [PLAN]
- Assumes performance data is collectible per reporting period [METRIC]
- Breaks when vendor has no contractual SLAs — cannot monitor what is not defined
- Does not negotiate contracts; monitors and escalates. Negotiation is a procurement function
- Assumes escalation framework is defined in governance documents [SUPUESTO]
- Limited to vendor performance tracking; for vendor selection use `vendor-cost-analysis`

## Usage

```bash
# Full vendor performance dashboard
/pm:vendor-management $ARGUMENTS="--vendor 'Vendor Alpha' --period Q1-2026"

# SLA compliance check
/pm:vendor-management --type sla-check --vendor "Vendor Alpha" --slas sla-definitions.md

# Vendor trend analysis
/pm:vendor-management --type trend --vendors vendor-inventory.md --periods 6
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Vendor identifier and reporting period |
| `--type` | No | `full` (default), `sla-check`, `trend`, `scorecard` |
| `--vendor` | No | Vendor name or path to vendor inventory |
| `--period` | No | Reporting period for performance data |

## Service Type Routing
`{TIPO_PROYECTO}`: Portfolio monitors implementation partner performance; PMO monitors service provider SLAs; Waterfall monitors equipment supplier delivery; All types with vendors need SLA tracking.

## Before Monitoring Vendors
1. **Read** vendor contracts to extract SLA definitions and KPIs [PLAN]
2. **Read** previous vendor scorecards for baseline comparison [METRIC]
3. **Glob** `**/vendor*` or `**/sla*` to find existing vendor tracking data [PLAN]
4. **Grep** for escalation history and issue patterns in vendor communications [INFERENCIA]

## Entrada (Input Requirements)
- Vendor contracts with SLAs and KPIs
- Vendor deliverable schedule
- Performance data (delivery dates, quality metrics)
- Issue history with vendors
- Escalation framework from governance

## Proceso (Protocol)
1. **SLA dashboard setup** — Configure SLA tracking per vendor per metric
2. **Performance data collection** — Gather actual performance data per reporting period
3. **Scorecard generation** — Calculate vendor scorecard (delivery, quality, communication, responsiveness)
4. **SLA compliance check** — Compare actual performance against contractual SLAs
5. **Trend analysis** — Track vendor performance trends over time
6. **Issue tracking** — Monitor open issues with each vendor
7. **Relationship review** — Conduct periodic vendor relationship reviews
8. **Escalation management** — Trigger escalation for SLA breaches per contract terms
9. **Improvement planning** — Collaborate with vendor on improvement plans
10. **Renewal/exit planning** — Assess vendor performance for contract renewal decisions

## Edge Cases
1. **Vendor meets SLAs but relationship is poor** — SLA compliance is necessary but insufficient. Assess communication, responsiveness, and proactiveness as qualitative factors. Recommend relationship review meeting [STAKEHOLDER].
2. **SLA breach on critical metric but vendor disputes measurement** — Review SLA measurement methodology in contract. If ambiguous, flag for contract clarification. Use objective data sources [METRIC].
3. **Vendor performance declining gradually (boiling frog)** — Trend analysis must flag sustained decline even if each period is individually acceptable. Set cumulative decline thresholds [METRIC].
4. **Single vendor with no alternative** — Flag as strategic risk. Monitor more frequently. Recommend contingency planning and market scan for alternatives [PLAN].

## Example: Good vs Bad

**Good example — Comprehensive vendor scorecard:**

| Attribute | Value |
|-----------|-------|
| Vendors tracked | 4 vendors across 5 SLA dimensions |
| SLA compliance | 3 vendors Green, 1 vendor Amber on delivery timeliness |
| Trend | 6-period trend shows stable or improving for 3 vendors |
| Issues | 2 open issues with resolution timelines |
| Escalation | 1 formal escalation triggered with improvement plan |
| Renewal | 1 vendor flagged for contract review due to declining quality |

**Bad example — Passive vendor tracking:**
"Vendor seems fine." No SLA measurement, no scorecard, no trend analysis. Without active monitoring, vendor performance degrades to minimum effort. By the time problems surface, recovery requires escalation that could have been avoided with early detection.

## Salida (Deliverables)
- Vendor performance scorecard
- SLA compliance dashboard
- Vendor trend analysis report
- Issue resolution tracker
- Contract compliance summary

## Validation Gate
- [ ] All contracted SLAs tracked with objective measurement [METRIC]
- [ ] Scorecard covers ≥4 dimensions (delivery, quality, communication, responsiveness) [METRIC]
- [ ] Trend analysis covers ≥3 reporting periods [METRIC]
- [ ] SLA breaches escalated per contractual terms [PLAN]
- [ ] Issue tracker includes resolution timelines and ownership [PLAN]
- [ ] Vendor dependency risks flagged for single-source vendors [PLAN]
- [ ] Scoring applied uniformly across all vendors [METRIC]
- [ ] Renewal/exit recommendation based on evidence [PLAN]
- [ ] Evidence ratio: ≥80% [METRIC]/[PLAN], <20% [SUPUESTO]
- [ ] Dashboard readable by both procurement and project teams [PLAN]

## Escalation Triggers
- SLA breach on critical delivery metric
- Vendor performance declining for 3+ periods
- Vendor communication unresponsive for > 48 hours
- Quality issues requiring rework exceeding 10%

## Additional Resources

| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | Vendor management best practices | `references/body-of-knowledge.md` |
| State of the Art | Modern vendor governance practices | `references/state-of-the-art.md` |
| Knowledge Graph | Vendor management in procurement | `references/knowledge-graph.mmd` |
| Use Case Prompts | Vendor monitoring scenarios | `prompts/use-case-prompts.md` |
| Metaprompts | Custom vendor frameworks | `prompts/metaprompts.md` |
| Sample Output | Reference vendor scorecard | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

---

---

## Sub-Agents

### Contract Risk Analyzer


# Contract Risk Analyzer Agent

## Core Responsibility

The Contract Risk Analyzer performs clause-by-clause examination of vendor agreements to identify contractual risks that could expose the organization to financial loss, operational disruption, or legal liability. It maps each risk to a severity-probability matrix, flags missing protective clauses, and recommends specific language amendments to strengthen the organization's negotiating position before contract execution.

## Process

1. **Ingest** the full contract document and any referenced schedules, exhibits, SOWs, and amendments, building a clause inventory with cross-references to standard protective provisions.
2. **Scan** for SLA definitions and gap analysis — verify that every critical service metric has a measurable target, measurement methodology, reporting cadence, and consequence for non-compliance.
3. **Examine** penalty and remedy clauses for proportionality, enforceability, and reciprocity, flagging one-sided provisions that limit vendor accountability or cap damages below acceptable thresholds.
4. **Assess** IP ownership provisions including work-product assignment, pre-existing IP carve-outs, license-back rights, and source code escrow obligations, tagging ambiguous language as `[RIESGO-ALTO]`.
5. **Evaluate** termination conditions covering convenience, cause, insolvency, and change-of-control triggers, verifying that transition assistance, data return, and wind-down periods are explicitly defined.
6. **Analyze** liability limitations including aggregate caps, exclusion of consequential damages, indemnification scope, and insurance requirements, benchmarking against industry standards.
7. **Produce** a prioritized risk register with severity ratings (Critical / High / Medium / Low), specific clause references, recommended amendments, and a negotiation strategy summary.

## Output Format

```markdown
# Contract Risk Analysis — {Vendor Name} / {Agreement Title}

## TL;DR
- Total risks identified: {N}
- Critical: {N} | High: {N} | Medium: {N} | Low: {N}
- Top risk: {1-line description}
- Recommendation: {Proceed with amendments / Renegotiate / Do not sign}

## Risk Register
| # | Clause Ref | Risk Description | Category | Severity | Probability | Recommended Amendment | Tag |
|---|-----------|-----------------|----------|----------|-------------|----------------------|-----|
| 1 | Section X.Y | ... | SLA Gap | Critical | High | ... | [DOC] |
| 2 | Section X.Y | ... | IP Ownership | High | Medium | ... | [DOC] |

## SLA Gap Analysis
| Service Metric | Defined? | Target | Measurement | Penalty | Gap |
|---------------|----------|--------|-------------|---------|-----|
| ... | Yes/No | ... | ... | ... | ... |

## IP & Ownership Review
- Work product assignment: {Yes/No/Partial}
- Pre-existing IP carve-outs: {Defined/Undefined}
- Source code escrow: {Required/Not required}
- License-back rights: {Granted/Not granted}

## Termination & Exit Analysis
| Trigger | Defined? | Notice Period | Transition Assistance | Data Return |
|---------|----------|--------------|----------------------|-------------|
| Convenience | ... | ... | ... | ... |
| Cause | ... | ... | ... | ... |
| Insolvency | ... | ... | ... | ... |

## Liability & Indemnification
- Aggregate liability cap: {Amount/Multiple of fees}
- Consequential damages: {Included/Excluded}
- Indemnification scope: {Mutual/One-sided}
- Insurance minimums: {Specified/Not specified}

## Negotiation Strategy
1. **Must-have amendments**: {list}
2. **Nice-to-have amendments**: {list}
3. **Walk-away triggers**: {list}

> Ghost Menu: `/pm:vendor-negotiate` | `/pm:vendor-evaluate` | `/pm:vendor-onboard`
```

### Performance Monitor


## Performance Monitor Agent

### Core Responsibility
Continuously monitor vendor performance against contractual SLAs and quality standards, producing periodic scorecards that track delivery quality, timeliness, communication, and issue resolution to ensure vendor accountability.

### Process
1. **Define Monitoring Framework.** Establish KPIs aligned with contract SLAs: delivery timeliness (% on-time), quality (defect rate), communication (response time), and issue resolution (time-to-fix).
2. **Collect Performance Data.** Gather data from delivery records, quality reports, communication logs, and issue trackers at defined frequency (weekly/monthly).
3. **Calculate Scorecard.** Compute KPI scores, compare against SLA thresholds, and apply RAG status: Green (meets/exceeds), Amber (within tolerance), Red (below SLA).
4. **Analyze Trends.** Track performance trends over time: improving, stable, or declining. Identify patterns (e.g., quality drops during crunch periods).
5. **Generate Performance Report.** Produce vendor performance scorecard with KPI scores, trends, and RAG status for management review.
6. **Trigger Escalation.** When performance falls below SLA for 2+ consecutive periods, initiate escalation process with formal notification to vendor.
7. **Recommend Actions.** Based on performance data, recommend: continue as-is, request improvement plan, invoke penalty clauses, or initiate vendor replacement process.

### Output Format
- **Vendor Scorecard** — Table: KPI, SLA Target, Actual, RAG Status, Trend, Notes.
- **Trend Analysis** — Charts showing KPI performance over last 6 reporting periods.
- **Action Recommendation** — Specific recommended action based on performance assessment.

### Relationship Manager


## Relationship Manager Agent

### Core Responsibility
Manage the ongoing vendor relationship beyond contract compliance: facilitate regular review meetings, maintain open communication channels, resolve friction points, and develop strategic partnerships that create mutual value.

### Process
1. **Establish Review Cadence.** Set regular vendor review meetings: operational reviews (weekly/bi-weekly), management reviews (monthly), and strategic reviews (quarterly) with appropriate attendees at each level.
2. **Design Meeting Agendas.** Create structured agendas for each review level: operational (deliverables, blockers, issues), management (performance, risks, changes), strategic (roadmap, innovation, partnership evolution).
3. **Build Escalation Protocol.** Define multi-tier escalation: operational team → account manager → vendor executive → contractual remedies, with response time expectations at each tier.
4. **Monitor Relationship Health.** Track relationship indicators: meeting attendance, communication responsiveness, proactive problem-solving, and mutual trust level.
5. **Address Friction Points.** Identify and resolve relationship friction: unclear expectations, cultural differences, communication gaps, or competing priorities.
6. **Explore Strategic Value.** Look for opportunities to create mutual value beyond the current contract: knowledge sharing, innovation collaboration, volume discounts, or expanded engagement.
7. **Produce Relationship Report.** Deliver quarterly relationship assessment with health score, friction points, opportunities, and action items.

### Output Format
- **Relationship Health Dashboard** — Health indicators with RAG status and trend arrows.
- **Review Calendar** — Scheduled reviews at operational, management, and strategic levels.
- **Action Register** — Open items from vendor reviews with owners and deadlines.

### Vendor Evaluator


# Vendor Evaluator Agent

## Core Responsibility

The Vendor Evaluator conducts structured, multi-dimensional assessments of candidate vendors against a weighted scorecard aligned with engagement objectives. It synthesizes quantitative metrics (pricing, financial ratios, delivery SLAs) with qualitative signals (cultural fit, reference checks, innovation posture) to produce a defensible ranking that supports informed procurement decisions and minimizes selection bias.

## Process

1. **Define** the evaluation framework by establishing weighted criteria categories (technical capability 25%, financial stability 20%, cultural fit 15%, references 15%, pricing 15%, delivery track record 10%) and calibrating weights to the engagement's strategic priority.
2. **Gather** vendor submissions, capability decks, financial disclosures, and reference contacts into a structured intake dossier per candidate, flagging any missing documentation as `[GAP]`.
3. **Score** each vendor against every criterion using a 1-5 Likert scale with explicit rubric definitions, documenting evidence tags (`[DOC]`, `[REFERENCIA]`, `[INFERENCIA]`) for each rating.
4. **Validate** financial stability through public filings, credit reports, and revenue trajectory analysis, tagging any unverifiable claims as `[SUPUESTO]`.
5. **Conduct** reference interviews using a standardized questionnaire covering delivery quality, responsiveness, flexibility, and willingness to re-engage, normalizing scores across respondents.
6. **Synthesize** a composite weighted score per vendor, producing a ranked shortlist with sensitivity analysis showing how weight changes affect the ranking order.
7. **Recommend** a primary vendor and runner-up with a decision memo summarizing strengths, risks, and conditions for engagement, including a ghost menu of next actions.

## Output Format

```markdown
# Vendor Evaluation Report — {Engagement Name}

## TL;DR
- Top vendor: {Name} — weighted score {X}/5.0
- Runner-up: {Name} — weighted score {Y}/5.0
- Key differentiator: {1-line summary}

## Evaluation Criteria & Weights
| Criterion | Weight | Description |
|-----------|--------|-------------|
| ... | ...% | ... |

## Vendor Scorecards
### {Vendor A}
| Criterion | Score (1-5) | Evidence | Tag |
|-----------|-------------|----------|-----|
| ... | ... | ... | [DOC] |

**Composite Score**: {X}/5.0

### {Vendor B}
(repeat structure)

## Sensitivity Analysis
| Scenario | Vendor A | Vendor B | Vendor C | Vendor D |
|----------|----------|----------|----------|----------|
| Baseline | ... | ... | ... | ... |
| +10% Technical | ... | ... | ... | ... |

## Recommendation
- **Primary**: {Vendor} — rationale
- **Runner-up**: {Vendor} — rationale
- **Conditions**: {engagement prerequisites}

## Risks & Mitigations
| Risk | Severity | Mitigation |
|------|----------|------------|
| ... | ... | ... |

> Ghost Menu: `/pm:vendor-contract-review` | `/pm:vendor-negotiate` | `/pm:vendor-onboard`
```

