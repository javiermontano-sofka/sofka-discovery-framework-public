---
name: apex-strategic-alignment
description: >
  Use when the user asks to "check strategic alignment", "map projects to strategy",
  "track OKRs", "identify strategic orphans", "verify portfolio-strategy fit",
  or mentions strategic alignment, strategy-to-project traceability, OKR tracking,
  balanced scorecard alignment, portfolio investment alignment.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Strategy-to-Project Traceability & OKR Alignment

**TL;DR**: Maps project portfolios to organizational strategy ensuring every project contributes to strategic objectives. Uses OKR (Objectives and Key Results) framework or balanced scorecard to create traceable links from strategic goals to portfolio investment to project deliverables. Identifies strategic orphans (projects without strategic justification) and coverage gaps (strategic goals without project support).

## Principio Rector
Un proyecto que no contribuye a la estrategia organizacional es una distracción elegante. La alineación estratégica no es un checklist al inicio del proyecto — es una validación continua de que la inversión sigue generando valor estratégico. Cuando la estrategia pivotea, los proyectos deben pivotar o justificar su continuación.

## Assumptions & Limits
- Assumes organizational strategic plan with objectives is documented [PLAN]
- Assumes OKRs or equivalent goal framework exists [SUPUESTO]
- Breaks when organization has no documented strategy — alignment requires a reference point
- Does not create strategy; maps projects to it. Strategy creation is an executive function
- Assumes portfolio of active projects is known and accessible [PLAN]
- Limited to strategy-project alignment; for strategy execution use transformation skills

## Usage

```bash
# Full strategic alignment analysis
/pm:strategic-alignment $ARGUMENTS="--strategy strategy-plan.md --portfolio portfolio.md"

# Orphan project detection
/pm:strategic-alignment --type orphan-scan --portfolio portfolio.md

# Coverage gap analysis
/pm:strategic-alignment --type coverage --strategy strategy-plan.md
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Path to strategy document and portfolio |
| `--type` | No | `full` (default), `orphan-scan`, `coverage`, `drift-detection` |
| `--portfolio` | No | Path to portfolio of active projects |
| `--strategy` | No | Path to organizational strategy document |

## Service Type Routing
`{TIPO_PROYECTO}`: Portfolio uses strategic alignment for investment decisions; PMO uses it for project justification; Digital-Transformation maps to transformation vision; All types validate strategic contribution.

## Before Aligning
1. **Read** the organizational strategic plan to understand objectives and key results [PLAN]
2. **Read** portfolio of active and proposed projects with their charters [PLAN]
3. **Glob** `**/OKR*` or `**/balanced_scorecard*` to find goal frameworks [PLAN]
4. **Grep** for strategic alignment claims in project charters [INFERENCIA]

## Entrada (Input Requirements)
- Organizational strategic plan with objectives
- OKRs or balanced scorecard
- Portfolio of active and proposed projects
- Project charters with objectives
- Investment themes and budget allocation

## Proceso (Protocol)
1. **Strategy decomposition** — Break down strategic objectives into measurable key results
2. **Project mapping** — Map each project to strategic objectives it supports
3. **Coverage analysis** — Identify strategic goals with insufficient project support
4. **Orphan detection** — Identify projects without clear strategic justification
5. **Investment alignment** — Compare budget allocation vs. strategic priority areas
6. **Contribution scoring** — Rate each project's contribution to strategic objectives
7. **Drift detection** — Identify projects whose strategic alignment has weakened
8. **Rebalancing recommendations** — Suggest portfolio adjustments for better alignment
9. **Visualization** — Create strategy-to-project traceability map (Mermaid)
10. **Ongoing monitoring** — Establish quarterly alignment review cadence

## Edge Cases
1. **>20% of portfolio has no strategic alignment** — Trigger portfolio review. Each orphan project needs justification or termination recommendation. Present opportunity cost analysis [METRIC].
2. **Strategy changes mid-cycle** — Trigger full realignment. All projects must re-validate strategic contribution. Recommend portfolio rebalancing [PLAN].
3. **Strategic objective with zero project support** — Flag as coverage gap. Recommend project initiation or reallocation of existing project scope to address the gap [PLAN].
4. **Project aligned to multiple strategic objectives** — Score contribution per objective. Primary alignment determines portfolio categorization. Secondary alignments are benefits, not justification [INFERENCIA].

## Example: Good vs Bad

**Good example — Quantified strategic alignment:**

| Attribute | Value |
|-----------|-------|
| Strategic objectives | 6 objectives with measurable key results |
| Projects mapped | 12 projects with contribution scores |
| Coverage | All 6 objectives have ≥1 supporting project |
| Orphans | 1 orphan project identified (recommendation: terminate) |
| Investment | Budget allocation matches strategic priority within ±10% |
| Drift | 2 projects with weakening alignment flagged for review |

**Bad example — Alignment theater:**
"All projects are strategically aligned" with no scoring, no coverage analysis, no orphan detection. Without contribution scoring, alignment claims are untested assertions. Every project can claim alignment to a vague strategy.

## Salida (Deliverables)
- Strategy-to-project alignment matrix
- Coverage gap analysis
- Strategic orphan list
- Investment vs. strategy allocation chart
- Rebalancing recommendations

## Validation Gate
- [ ] Every project mapped to ≥1 strategic objective with contribution score [PLAN]
- [ ] Coverage analysis identifies objectives with insufficient project support [PLAN]
- [ ] Orphan projects identified with recommendation (justify, pivot, or terminate) [PLAN]
- [ ] Investment allocation compared to strategic priority weighting [METRIC]
- [ ] Contribution scoring applied consistently across all projects [METRIC]
- [ ] Drift detection identifies projects with weakening alignment [INFERENCIA]
- [ ] Traceability visualization (Mermaid) shows strategy-project connections [PLAN]
- [ ] Quarterly review cadence established [SCHEDULE]
- [ ] Evidence ratio: ≥80% [PLAN]/[METRIC], <20% [SUPUESTO]
- [ ] Rebalancing recommendations quantify trade-offs [METRIC]

## Escalation Triggers
- More than 20% of portfolio has no strategic alignment
- Strategic objective with zero project support
- Budget allocation misaligned with strategic priorities by > 25%
- Strategy change requiring portfolio rebalancing

## Additional Resources

| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | Portfolio alignment and OKR frameworks | `references/body-of-knowledge.md` |
| State of the Art | Modern strategy execution practices | `references/state-of-the-art.md` |
| Knowledge Graph | Strategic alignment in portfolio governance | `references/knowledge-graph.mmd` |
| Use Case Prompts | Alignment analysis scenarios | `prompts/use-case-prompts.md` |
| Metaprompts | Custom alignment frameworks | `prompts/metaprompts.md` |
| Sample Output | Reference alignment matrix | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
