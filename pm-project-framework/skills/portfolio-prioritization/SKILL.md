---
name: apex-portfolio-prioritization
description: >
  Use when the user asks to "prioritize projects", "score portfolio", "rank investments",
  "build scoring model", "optimize portfolio mix", or mentions portfolio prioritization,
  scoring models, strategic alignment scoring, portfolio ranking, investment prioritization.
  Triggers on: builds weighted scoring models for project prioritization, calculates
  efficient frontier for portfolio optimization, runs sensitivity analysis on rankings,
  facilitates data-driven investment decisions, produces ranked portfolio with transparent scoring.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Portfolio Prioritization & Scoring Models

**TL;DR**: Applies weighted scoring models to prioritize projects within a portfolio based on strategic alignment, financial return, risk, resource requirements, and urgency. Produces ranked portfolio with transparent scoring rationale enabling data-driven investment decisions.

## Principio Rector
Sin priorización explícita, toda organización termina priorizando por quien grita más fuerte. Un modelo de scoring transforma debates políticos en decisiones basadas en criterios. La transparencia del modelo es tan importante como su precisión: los stakeholders deben entender y aceptar los criterios ANTES de ver los resultados.

## Assumptions & Limits
- Assumes strategic objectives are defined and can be used as alignment criteria [SUPUESTO]
- Assumes financial data (NPV, ROI) available per candidate project [SUPUESTO]
- Breaks if stakeholders reject criteria after seeing results — criteria must be agreed before scoring [STAKEHOLDER]
- Scope limited to portfolio-level prioritization; project-internal prioritization (backlog) uses methodology skills [PLAN]
- Does not make the investment decision — provides decision support with transparent scoring [PLAN]

## Usage
```bash
/pm:portfolio-prioritization $PORTFOLIO_NAME --criteria=5 --scale=1-10
/pm:portfolio-prioritization $PORTFOLIO_NAME --method=weighted-scoring --sensitivity
/pm:portfolio-prioritization $PORTFOLIO_NAME --method=efficient-frontier --constraints=budget,resources
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PORTFOLIO_NAME` | Yes | Target portfolio identifier |
| `--criteria` | No | Number of scoring criteria (default: 5) |
| `--scale` | No | Scoring scale (`1-5` / `1-10`) (default: `1-5`) |
| `--method` | No | `weighted-scoring` / `efficient-frontier` / `both` |
| `--sensitivity` | No | Include sensitivity analysis |
| `--constraints` | No | Constraint types for optimization |

## Service Type Routing
`{TIPO_PROYECTO}`: PMO uses portfolio-level scoring; Portfolio uses multi-criteria decision analysis; Strategic planning uses balanced scorecard alignment; All types benefit from objective prioritization.

## Before Prioritizing Portfolio
1. Read organizational strategy — derive strategic alignment criteria [PLAN]
2. Glob `*financial*` and `*business-case*` — collect financial data per candidate project [METRIC]
3. Read resource capacity — understand constraint boundaries for optimization [METRIC]
4. Facilitate criteria agreement with stakeholders — BEFORE scoring begins [STAKEHOLDER]

## Entrada (Input Requirements)
- Portfolio of candidate projects/initiatives
- Organizational strategy and objectives
- Financial data per project (NPV, ROI estimates)
- Resource availability constraints
- Risk assessments per project

## Proceso (Protocol)
1. **Criteria definition** — Define scoring criteria (strategic alignment, financial return, risk, capability fit)
2. **Weight assignment** — Assign weights per criterion based on organizational priorities
3. **Scoring scale** — Define consistent scoring scale (1-5 or 1-10) with rubrics
4. **Project scoring** — Score each project against each criterion
5. **Weighted calculation** — Calculate weighted total score per project
6. **Constraint analysis** — Apply resource and budget constraints to feasibility
7. **Efficient frontier** — Identify optimal portfolio mix (maximum value within constraints)
8. **Sensitivity analysis** — Test ranking stability under weight changes
9. **Stakeholder review** — Present results for alignment and validation
10. **Recommendation** — Produce ranked portfolio with investment recommendations

## Edge Cases
1. **Stakeholders reject criteria after seeing results** — Governance failure; document the rejection; recommend re-scoring only after new criteria are agreed without knowledge of scores.
2. **Multiple projects tied within decision threshold** — Use tiebreaker criteria (urgency, risk, strategic uniqueness); if still tied, recommend parallel execution or PoC to differentiate.
3. **Resource constraints eliminate top-scored projects** — Present efficient frontier showing trade-offs; recommend resource expansion or project phasing.
4. **Political pressure to override scoring** — Document the override formally; track overridden project performance vs. model prediction for future calibration.

## Example: Good vs Bad

**Good Portfolio Prioritization:**
| Attribute | Value |
|-----------|-------|
| Criteria | 5 weighted criteria agreed by portfolio board before scoring [STAKEHOLDER] |
| Scoring | 12 projects scored 1-10 with rubrics per criterion [METRIC] |
| Sensitivity | Top 3 ranking stable across weight variations up to 15% [METRIC] |
| Efficient frontier | Optimal mix: 8 projects within budget delivering 85% of total portfolio value [METRIC] |
| Transparency | Every score justified with evidence; scoring reproducible by independent reviewer [PLAN] |

**Bad Portfolio Prioritization:**
"The CEO wants these 5 projects." — No criteria, no scoring, no alternatives analysis, no constraint consideration. Portfolio reflects authority, not strategic value optimization.

## Salida (Deliverables)
- Portfolio scoring matrix
- Ranked project list with scores
- Efficient frontier analysis
- Sensitivity analysis results
- Investment recommendation summary

## Validation Gate
- [ ] Scores based on project data, not stakeholder lobbying
- [ ] Scoring rubrics defined and consistently applied across all projects
- [ ] All candidate projects evaluated — no exclusions without documented rationale
- [ ] Criteria weights agreed by governance BEFORE scoring began
- [ ] Ranking directly supports funding decisions with actionable recommendations
- [ ] Scoring transparent and reproducible by independent reviewer
- [ ] Sensitivity analysis shows ranking stability under reasonable weight variations
- [ ] Risk-adjusted prioritization available alongside nominal scoring
- [ ] Decision-makers trust the process — criteria agreement documented
- [ ] Efficient frontier analysis shows optimal portfolio mix within constraints

## Escalation Triggers
- Stakeholders reject scoring criteria after seeing results
- Multiple projects tied within decision threshold
- Resource constraints eliminate top-scored projects
- Political pressure to override scoring results

## Additional Resources
| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | When applying multi-criteria decision analysis methods | `references/body-of-knowledge.md` |
| State of the Art | When implementing modern portfolio optimization | `references/state-of-the-art.md` |
| Knowledge Graph | When mapping prioritization to portfolio governance | `references/knowledge-graph.mmd` |
| Use Case Prompts | When generating prioritization for specific portfolio types | `prompts/use-case-prompts.md` |
| Metaprompts | When adapting scoring models for non-standard contexts | `prompts/metaprompts.md` |
| Sample Output | When reviewing expected prioritization quality | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
