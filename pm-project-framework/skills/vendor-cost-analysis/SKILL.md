---
name: apex-vendor-cost-analysis
description: >
  Use when the user asks to "compare vendor costs", "analyze TCO", "evaluate vendor proposals",
  "calculate total cost of ownership", "normalize vendor pricing",
  or mentions vendor comparison, total cost of ownership, vendor TCO, proposal evaluation,
  vendor scoring matrix, hidden cost analysis.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Vendor Cost Analysis & TCO

**TL;DR**: Performs total cost of ownership (TCO) analysis across vendor options including acquisition costs, implementation costs, operating costs, switching costs, and hidden costs. Produces normalized vendor comparison enabling evidence-based vendor selection decisions.

## Principio Rector
El precio de adquisición es la punta del iceberg. TCO revela los costos ocultos: implementación, personalización, capacitación, mantenimiento, licencias recurrentes, y costo de cambio. La decisión de vendor más barata al inicio puede ser la más costosa al final. NUNCA incluir precios absolutos — solo magnitudes relativas y ratios.

## Assumptions & Limits
- Assumes vendor proposals or quotes are available for comparison [PLAN]
- Assumes procurement criteria and weights are defined by stakeholders [STAKEHOLDER]
- Breaks when only one vendor option exists — TCO comparison requires ≥2 options
- Does not negotiate with vendors; analyzes proposals. Negotiation is a procurement function
- Assumes hidden cost checklist is applied to uncover undisclosed costs [SUPUESTO]
- CRITICAL: Never include absolute prices — use relative magnitudes, ratios, and FTE-months only

## Usage

```bash
# Full TCO analysis across vendors
/pm:vendor-cost-analysis $ARGUMENTS="--proposals vendor-A.md,vendor-B.md,vendor-C.md"

# Sensitivity analysis on existing TCO
/pm:vendor-cost-analysis --type sensitivity --baseline tco-report.md --variables "volume,term"

# Hidden cost identification
/pm:vendor-cost-analysis --type hidden-costs --proposal vendor-A.md
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Comma-separated paths to vendor proposals |
| `--type` | No | `full` (default), `sensitivity`, `hidden-costs`, `scoring` |
| `--period` | No | Analysis period in years (default 3) |
| `--variables` | No | Variables for sensitivity analysis |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: T&M vendor comparison with velocity-based value assessment; vendor team integration fit as evaluation criterion
- **Waterfall**: Formal TCO analysis across vendor proposals; sealed-bid comparison matrices with weighted scoring
- **SAFe**: Vendor evaluation for ART participation; capacity-based contract comparison; PI-aligned delivery commitment analysis
- **Portfolio**: Master service agreement comparison across portfolio vendors; strategic partnership TCO vs. project-by-project sourcing
- **Hybrid**: Mixed evaluation -- fixed-price for predictable vendor deliverables, T&M for iterative collaboration workstreams

## Before Analyzing Costs
1. **Read** all vendor proposals to understand pricing structures [PLAN]
2. **Read** procurement criteria and weights agreed by stakeholders [STAKEHOLDER]
3. **Glob** `**/contract*` or `**/procurement*` to find existing vendor agreements [PLAN]
4. **Grep** for hidden cost categories (customization, training, migration, support tiers) [PLAN]

## Entrada (Input Requirements)
- Vendor proposals or quotes
- Procurement criteria and weights
- Expected usage/volume projections
- Contract term and renewal expectations
- Hidden cost checklist (customization, training, migration)

## Proceso (Protocol)
1. **Cost category definition** — Define TCO categories (acquisition, implementation, operation, exit)
2. **Data normalization** — Normalize vendor proposals to common basis and timeframe
3. **Hidden cost identification** — Identify costs not in proposals (training, customization, downtime)
4. **TCO calculation** — Calculate total cost per vendor over analysis period
5. **Risk-adjusted TCO** — Apply risk factors for vendor-specific uncertainties
6. **Qualitative factors** — Assess non-cost factors (support quality, roadmap, stability)
7. **Scoring matrix** — Apply weighted scoring across cost and non-cost dimensions
8. **Sensitivity analysis** — Test how vendor ranking changes with volume/term assumptions
9. **Recommendation** — Present recommended vendor with rationale
10. **Negotiation guidance** — Identify areas for cost negotiation per vendor

## Edge Cases
1. **Vendors too close to differentiate on cost alone** — Apply qualitative factors with increased weight. Use sensitivity analysis to test ranking stability. If still tied, recommend pilot/POC [METRIC].
2. **Hidden costs significantly change initial ranking** — Document the finding prominently. Present both "as-quoted" and "TCO-adjusted" rankings side by side [METRIC].
3. **Single-vendor dependency identified** — Flag as strategic risk. Recommend multi-vendor strategy or contractual protections against lock-in. Quantify switching cost [PLAN].
4. **Vendor financial stability concerns** — Include vendor viability as risk factor in risk-adjusted TCO. Recommend credit check or financial health assessment [INFERENCIA].

## Example: Good vs Bad

**Good example — Comprehensive TCO analysis:**

| Attribute | Value |
|-----------|-------|
| Vendors compared | 3 vendors across 4 TCO categories |
| Normalization | All proposals normalized to 3-year, 100-user basis |
| Hidden costs | 5 hidden cost categories identified and quantified |
| Scoring | 8-dimension weighted scoring matrix |
| Sensitivity | Ranking stable across ±20% volume variation |
| Recommendation | Vendor B recommended — lowest risk-adjusted TCO ratio |

**Bad example — Price comparison:**
"Vendor A: cheap, Vendor B: expensive." No normalization, no hidden costs, no TCO categories, no qualitative factors. Price comparison without TCO analysis favors vendors who hide costs in implementation and operations. The cheapest quote is rarely the lowest TCO.

## Salida (Deliverables)
- Vendor comparison matrix (cost + non-cost dimensions)
- TCO breakdown per vendor (relative magnitudes)
- Risk-adjusted comparison
- Scoring matrix with weighted results
- Negotiation opportunity analysis

## Validation Gate
- [ ] ≥2 vendors compared across ≥4 TCO categories [METRIC]
- [ ] Proposals normalized to common basis (timeframe, volume, scope) [METRIC]
- [ ] Hidden costs identified and included in TCO [METRIC]
- [ ] Weighted scoring criteria agreed by stakeholders before application [STAKEHOLDER]
- [ ] Sensitivity analysis tests ranking stability [METRIC]
- [ ] No absolute prices in output — only ratios and relative magnitudes [PLAN]
- [ ] Risk-adjusted TCO includes vendor-specific risk factors [PLAN]
- [ ] Recommendation clearly stated with rationale [PLAN]
- [ ] Evidence ratio: ≥80% [METRIC]/[PLAN], <20% [SUPUESTO]
- [ ] Negotiation opportunities identified per vendor [PLAN]

## Escalation Triggers
- Vendors too close to differentiate on cost alone
- Hidden costs significantly change initial ranking
- Single-vendor dependency identified
- Vendor financial stability concerns

## Additional Resources

| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | TCO methodology and vendor evaluation | `references/body-of-knowledge.md` |
| State of the Art | Modern vendor assessment practices | `references/state-of-the-art.md` |
| Knowledge Graph | Vendor analysis in procurement | `references/knowledge-graph.mmd` |
| Use Case Prompts | TCO analysis scenarios | `prompts/use-case-prompts.md` |
| Metaprompts | Custom vendor evaluation frameworks | `prompts/metaprompts.md` |
| Sample Output | Reference TCO report | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
