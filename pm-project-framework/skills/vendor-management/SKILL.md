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
