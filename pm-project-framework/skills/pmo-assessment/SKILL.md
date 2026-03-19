---
name: apex-pmo-assessment
description: >
  Use when the user asks to "assess PMO effectiveness", "evaluate PMO value",
  "review PMO structure", "measure PMO impact", "audit PMO services",
  or mentions PMO assessment, PMO evaluation, PMO capability review, PMO performance
  assessment, PMO value assessment. Triggers on: evaluates PMO operating model effectiveness,
  measures stakeholder value perception, assesses PMO service catalog maturity, quantifies
  PMO impact on project success rates, produces PMO transformation roadmap.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# PMO Assessment

**TL;DR**: Evaluates PMO effectiveness across strategic alignment, governance quality, service delivery, stakeholder satisfaction, and value realization. Assesses the PMO's operating model (supportive, controlling, directive), its service catalog maturity, and its perceived value by both project teams and executive sponsors. Produces a PMO effectiveness scorecard and a transformation roadmap.

## Principio Rector
Un PMO que no puede demostrar su valor será eliminado en la próxima reestructuración. La evaluación no mide cuántos templates tiene el PMO, sino cuánto valor perciben los stakeholders: los PMs buscan al PMO por ayuda o lo evitan por burocracia? Los ejecutivos confían en los datos del PMO para tomar decisiones?

## Assumptions & Limits
- Assumes PMO exists in some form — if no PMO exists, use `pmo-setup` instead [PLAN]
- Assumes access to PMO stakeholders for perception surveys and interviews [STAKEHOLDER]
- Breaks if PMO self-assesses without external validation — self-assessment bias produces inflated scores [METRIC]
- Scope limited to PMO effectiveness; individual project performance assessment uses other skills [PLAN]
- Does not prescribe PMO type — assesses effectiveness against the PMO's own declared model [PLAN]

## Usage
```bash
/pm:pmo-assessment $ORG_NAME --scope=full
/pm:pmo-assessment $ORG_NAME --scope=services --include=perception-survey
/pm:pmo-assessment $ORG_NAME --scope=value-realization --benchmark=industry
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ORG_NAME` | Yes | Target organization identifier |
| `--scope` | No | `full` / `services` / `governance` / `value-realization` |
| `--include` | No | `perception-survey` / `benchmark` / `both` |
| `--benchmark` | No | `industry` / `sector` / `internal` |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Assess PMO's ability to support Agile teams without imposing waterfall governance
- **Waterfall**: Assess PMO's phase-gate governance quality and reporting effectiveness
- **SAFe**: Assess Lean-Agile Center of Excellence (LACE) capabilities alongside traditional PMO
- **Kanban**: Assess PMO's flow-based governance and portfolio visualization
- **Hybrid**: Assess PMO's ability to govern mixed-methodology portfolio
- **PMO**: Primary use — full PMO effectiveness assessment
- **Portfolio**: Assess PMO's portfolio management and strategic alignment capabilities
- **Transformation**: Baseline PMO capability before organizational transformation

## Before Assessing PMO
1. Read PMO charter and operating model documentation — understand declared model [PLAN]
2. Glob `*service*` and `*catalog*` — inventory PMO services [PLAN]
3. Design stakeholder perception survey — prepare before interviews [STAKEHOLDER]
4. Read project performance data managed by PMO — quantify PMO impact [METRIC]

## Entrada (Input Requirements)
- PMO charter and operating model documentation
- PMO service catalog (formal or informal)
- PMO staffing and competency profiles
- Stakeholder perception data (surveys, interviews)
- Project performance data managed by PMO

## Proceso (Protocol)
1. **Operating model identification** — Classify PMO type (supportive, controlling, directive, hybrid)
2. **Service catalog assessment** — Inventory and rate PMO services by maturity and adoption
3. **Governance quality review** — Evaluate quality gates, reporting, and decision frameworks
4. **Stakeholder perception analysis** — Measure value perception from PMs, sponsors, and teams
5. **Strategic alignment check** — Assess how well PMO connects project portfolio to strategy
6. **Resource management assessment** — Evaluate PMO's resource allocation and capacity planning
7. **Data and reporting quality** — Assess accuracy, timeliness, and actionability of PMO reports
8. **Methodology support** — Rate PMO's methodology guidance and training capabilities
9. **Value realization** — Quantify PMO's impact on project success rates
10. **Transformation roadmap** — Design PMO evolution plan based on assessment findings

## Edge Cases
1. **PMO perceived as obstacle by majority of teams** — Root cause analysis required before roadmap; likely indicates controlling model in autonomous culture or bureaucratic overhead.
2. **PMO data quality so low that executives distrust reports** — Prioritize data quality remediation as first roadmap item; value demonstration impossible without trusted data.
3. **PMO lacks authority to enforce governance** — Authority gap is structural, not PMO performance issue; escalate to executive for charter authority realignment.
4. **Multiple PMOs with overlapping mandates** — Map overlaps explicitly; recommend consolidation or clear boundary definition before assessing individual effectiveness.

## Example: Good vs Bad

**Good PMO Assessment:**
| Attribute | Value |
|-----------|-------|
| Operating model | Classified as "controlling" with evidence from 8 service areas [PLAN] |
| Service maturity | 12 services rated on 5-point scale; 4 mature, 5 developing, 3 nascent [METRIC] |
| Stakeholder perception | Survey of 42 respondents; PM satisfaction 3.8/5, executive trust 3.2/5 [METRIC] |
| Value realization | Projects with PMO support: 72% on-time vs. 48% without [METRIC] |
| Roadmap | 12-month transformation from controlling to enabling model [SCHEDULE] |

**Bad PMO Assessment:**
"The PMO is doing fine." — No service maturity rating, no stakeholder perception data, no value quantification, no improvement roadmap. Assessment provides no basis for PMO investment or transformation decisions.

## Salida (Deliverables)
- `05_pmo_assessment_{proyecto}_{WIP}.md` — PMO effectiveness report
- PMO service maturity matrix
- Stakeholder perception scorecard
- Value realization analysis
- PMO transformation roadmap

## Validation Gate
- [ ] Assessment based on data and stakeholder feedback, not PMO self-report alone
- [ ] Operating model correctly classified against industry definitions
- [ ] All PMO functions and services evaluated — no gaps in coverage
- [ ] Same assessment criteria applied across all PMO service areas
- [ ] Transformation roadmap includes quick wins (3 months) and structural changes (12 months)
- [ ] Results understandable by both PMO staff and executive sponsors
- [ ] Each finding links to specific evidence or stakeholder feedback citation
- [ ] Risks of PMO underperformance on project portfolio quantified
- [ ] Assessment answers "is this PMO worth its cost?" with evidence
- [ ] PMO evaluated against its declared operating model, not an abstract ideal

## Escalation Triggers
- PMO perceived as obstacle by majority of project teams
- PMO data quality so low that executives distrust reports
- PMO operating model misaligned with organizational methodology portfolio
- PMO lacks authority to enforce governance it is chartered to provide

## Additional Resources
| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | When applying PMO assessment frameworks | `references/body-of-knowledge.md` |
| State of the Art | When referencing modern PMO operating models | `references/state-of-the-art.md` |
| Knowledge Graph | When mapping PMO assessment to pipeline phases | `references/knowledge-graph.mmd` |
| Use Case Prompts | When generating assessments for specific PMO types | `prompts/use-case-prompts.md` |
| Metaprompts | When adapting assessment for non-standard PMO structures | `prompts/metaprompts.md` |
| Sample Output | When reviewing expected PMO assessment quality | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
