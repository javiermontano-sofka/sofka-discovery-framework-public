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
