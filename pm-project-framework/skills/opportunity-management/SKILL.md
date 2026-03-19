---
name: apex-opportunity-management
description: >
  Use when the user asks to "manage positive risks", "exploit opportunities",
  "enhance project benefits", "capture upside potential", "optimize project outcomes",
  or mentions positive risk, opportunity exploitation, opportunity enhancement, upside
  risk management. Triggers on: identifies upside potential in project execution,
  applies exploit/share/enhance/accept strategies, quantifies opportunity value,
  integrates opportunity actions into project plan, tracks opportunity realization.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Opportunity Management (Positive Risk)

**TL;DR**: Manages positive risks (opportunities) using exploit, share, enhance, and accept strategies. Identifies upside potential in project execution that could deliver additional value, accelerate timelines, or reduce costs beyond baseline expectations.

## Principio Rector
La gestión de riesgos no es solo sobre amenazas — las oportunidades son riesgos positivos que merecen la misma disciplina. Un equipo que solo gestiona el downside pierde la mitad del valor de la gestión de riesgos. Las oportunidades explotadas son lo que transforma un proyecto "en presupuesto" en un proyecto que supera expectativas.

## Assumptions & Limits
- Assumes risk register includes opportunity section or can be extended [SUPUESTO]
- Assumes stakeholders value upside management, not just downside protection [STAKEHOLDER]
- Breaks if organizational culture only rewards risk avoidance — opportunity management requires investment tolerance [STAKEHOLDER]
- Scope limited to project-level opportunities; strategic opportunities require portfolio-level decision [PLAN]
- Does not replace threat management — complements it; threats still need mitigation [PLAN]

## Usage
```bash
/pm:opportunity-management $PROJECT_NAME --scan
/pm:opportunity-management $PROJECT_NAME --strategy=exploit --opportunity="Early vendor delivery"
/pm:opportunity-management $PROJECT_NAME --report --tracking=dashboard
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT_NAME` | Yes | Target project identifier |
| `--scan` | No | Scan project for opportunity identification |
| `--strategy` | No | `exploit` / `share` / `enhance` / `accept` |
| `--opportunity` | No | Specific opportunity description |
| `--report` | No | Generate opportunity tracking report |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Opportunities captured as backlog items; velocity gains and scope optimization exploited through sprint experiments
- **Waterfall**: Formal opportunity register with quantified upside; opportunities evaluated at phase gates for exploitation decisions
- **SAFe**: Opportunities surfaced during PI Planning; enabler features for technology reuse; innovation sprints for exploration
- **Kanban**: Flow optimization opportunities — WIP tuning, bottleneck elimination, and throughput gains tracked as positive outcomes
- **Transformation**: Early adoption benefits, cultural momentum, and organizational learning opportunities beyond original scope
- **Recovery**: Turnaround opportunities — quick wins that restore stakeholder confidence and create positive momentum

## Before Managing Opportunities
1. Read `risk-register` — identify existing opportunity entries [PLAN]
2. Glob `*baseline*` — understand schedule and cost baselines that opportunities could improve [SCHEDULE]
3. Read team capabilities — skills beyond minimum may enable opportunities [STAKEHOLDER]
4. Review stakeholder aspirational goals — opportunities align with what stakeholders hope for beyond baseline [STAKEHOLDER]

## Entrada (Input Requirements)
- Risk register (opportunity section)
- Project baselines (schedule, cost, scope)
- Team skills and capabilities beyond minimum
- Market and technology trends
- Stakeholder aspirational goals

## Proceso (Protocol)
1. **Opportunity identification** — Scan for positive risks across all project dimensions
2. **Assessment** — Rate probability and positive impact of each opportunity
3. **Strategy selection** — Choose exploit, share, enhance, or accept for each opportunity
4. **Action planning** — Define specific actions to increase probability or impact
5. **Investment analysis** — Calculate cost of pursuing vs. expected upside
6. **Owner assignment** — Designate opportunity champion
7. **Integration** — Add opportunity-related activities to project plan
8. **Monitoring** — Track opportunity realization progress

## Edge Cases
1. **High-value opportunity requires scope change** — Route through change control with positive business case; opportunity investment must be approved like any scope change.
2. **Pursuing opportunity conflicts with risk mitigation** — Quantify both sides; present trade-off analysis to governance; never sacrifice threat mitigation for opportunity pursuit.
3. **Opportunity window closing before approval process completes** — Pre-approve opportunity response budget thresholds with governance; define "opportunity response authority" like emergency procurement authority.
4. **Opportunity realization cannot be measured** — Define proxy metrics before pursuing; if value cannot be observed, question whether the opportunity is real.

## Example: Good vs Bad

**Good Opportunity Management:**
| Attribute | Value |
|-----------|-------|
| Opportunities identified | 8 across schedule, cost, and scope dimensions [PLAN] |
| Strategy per opportunity | 2 exploit, 3 enhance, 1 share, 2 accept [PLAN] |
| Investment analysis | 3 opportunities with positive ROI above 2x investment cost [METRIC] |
| Opportunity champion | Named owner for each actively pursued opportunity [STAKEHOLDER] |
| Tracking | Monthly realization report with baseline impact quantified [METRIC] |

**Bad Opportunity Management:**
No opportunity register exists. Risk management focuses exclusively on threats. Positive outcomes happen by accident, and no one tracks whether the project could have delivered more value.

## Salida (Deliverables)
- Opportunity register with strategies
- Opportunity-benefit mapping
- Investment-return analysis per opportunity
- Updated project plan with opportunity activities
- Opportunity realization tracking dashboard

## Validation Gate
- [ ] Opportunities identified across all project dimensions — not just technical
- [ ] Each opportunity has quantified probability and positive impact [METRIC]
- [ ] Strategy (exploit/share/enhance/accept) assigned with specific actions
- [ ] Investment cost of pursuing opportunity calculated and justified
- [ ] Every actively pursued opportunity has a named champion
- [ ] Opportunity actions integrated into project schedule with dates
- [ ] Downside of pursuing each opportunity assessed — no blind optimism
- [ ] Upside potential visible to sponsors in regular reporting
- [ ] Opportunity management cadence integrated with project methodology rhythm
- [ ] Realization tracked monthly against baseline improvement targets

## Escalation Triggers
- High-value opportunity requires scope change to exploit
- Opportunity window closing before team can act
- Pursuing opportunity conflicts with risk mitigation
- Opportunity requires additional investment beyond authority

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
