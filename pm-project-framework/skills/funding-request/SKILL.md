---
name: apex-funding-request
description: >
  Use when the user asks to "request funding", "justify budget", "prepare investment proposal",
  "build capital request", "draft funding justification", or mentions funding request, budget
  justification, capital request, investment proposal. Triggers on: prepares an investment case,
  drafts a budget approval package, justifies project funding, builds a capital expenditure request,
  creates a funding drawdown schedule.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Funding Request & Investment Proposal

**TL;DR**: Produces a structured funding request document that combines financial business case with strategic alignment narrative. Designed for budget approval committees and executive decision-makers, presenting investment requirements, expected returns, risk assessment, and implementation timeline in a decision-ready format.

## Principio Rector
Un funding request no es un pedido de dinero — es una propuesta de inversión. Debe responder tres preguntas: por qué esta inversión (strategic alignment), cuánto y cuándo (financial model), y qué pasa si no invertimos (cost of inaction). El formato debe respetar el proceso de aprobación organizacional.

## Assumptions & Limits
- Assumes a financial business case already exists or can be derived from available data [SUPUESTO]
- Assumes organizational approval thresholds and governance processes are documented [SUPUESTO]
- Breaks if ROI cannot be quantified — qualitative-only justifications require different framing [PLAN]
- Scope limited to project-level funding; portfolio-level investment decisions use `portfolio-prioritization` [PLAN]
- Does not produce legal or contractual financial commitments — output is decision-support only [PLAN]
- Currency, tax, and regulatory compliance are organization-specific and must be validated externally [SUPUESTO]

## Usage
```bash
/pm:funding-request $PROJECT_NAME --type=capital
/pm:funding-request $PROJECT_NAME --type=operational --phases=3
/pm:funding-request $PROJECT_NAME --type=staged --gate=G2
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT_NAME` | Yes | Target project identifier |
| `--type` | No | `capital` / `operational` / `staged` (default: `capital`) |
| `--phases` | No | Number of funding phases (default: 1) |
| `--gate` | No | Gate triggering the request (G1, G2, G3) |

## Service Type Routing
`{TIPO_PROYECTO}`: All types produce funding requests. Format varies by organizational approval process. Large investments require staged funding gates.

## Before Requesting Funding
1. Read `financial-business-case` output — verify NPV, IRR, and payback exist [PLAN]
2. Glob `*charter*` and `*benefits*` — confirm strategic alignment narrative is documented [PLAN]
3. Read organizational approval thresholds — confirm correct approval path for funding amount [STAKEHOLDER]
4. Verify cost estimates have confidence ranges at P50 or above — point estimates without ranges weaken the request [METRIC]

## Entrada (Input Requirements)
- Financial business case (from `financial-business-case`)
- Project charter with strategic alignment
- Cost estimates with confidence ranges
- Benefits realization plan
- Organizational funding approval process

## Proceso (Protocol)
1. **Executive summary** — Craft compelling one-page investment summary
2. **Strategic alignment** — Connect investment to organizational strategy and OKRs
3. **Investment requirements** — Detail funding amounts by category and phase
4. **Return analysis** — Present NPV, IRR, payback from business case
5. **Risk assessment** — Summarize investment risks and mitigation strategies
6. **Alternatives analysis** — Compare with alternative investments and cost of doing nothing
7. **Implementation timeline** — Show funding drawdown schedule aligned with milestones
8. **Governance plan** — Describe how investment will be governed and tracked
9. **Approval request** — Format per organizational approval requirements
10. **Supporting documents** — Reference detailed supporting analyses

## Edge Cases
1. **No financial business case exists** — Generate simplified ROI model using cost-estimation and benefits-realization-plan data; tag all projections as [SUPUESTO] and escalate for validation.
2. **Funding exceeds single-authority threshold** — Split into staged requests per gate; each stage must independently justify its investment with deliverables tied to the next gate.
3. **Competing projects in same funding pool** — Include comparative positioning section; reference portfolio-prioritization scores if available.
4. **Cost of inaction cannot be quantified** — Use qualitative risk framing (regulatory exposure, competitive disadvantage) with explicit [INFERENCIA] tags.
5. **Multi-currency or multi-entity funding** — Normalize to single reporting currency; document exchange rate assumptions as [SUPUESTO].

## Example: Good vs Bad

**Good Funding Request:**
| Attribute | Value |
|-----------|-------|
| Executive summary | One page, answers why/how much/when |
| Strategic alignment | Linked to 2 specific OKRs with evidence [PLAN] |
| Financial model | NPV positive at P50; IRR 18%; payback 14 months [METRIC] |
| Risk section | 4 risks with mitigation, cost of inaction quantified [METRIC] |
| Drawdown schedule | Phased across 3 gates with release criteria [SCHEDULE] |
| Approval path | Matches organizational threshold for amount requested [STAKEHOLDER] |

**Bad Funding Request:**
"We need $2M for digital transformation." — No strategic linkage, no ROI, no risk assessment, no phasing, no approval path alignment. The committee cannot decide because the request provides no decision-support evidence.

## Salida (Deliverables)
- `00_funding_request_{proyecto}_{WIP}.md` — Funding request document
- Executive investment summary (one-page)
- Funding drawdown schedule
- Risk-adjusted return analysis
- Alternative comparison table

## Validation Gate
- [ ] Every financial projection traces to a verified business case — zero unlinked numbers
- [ ] NPV, IRR, and payback period present with confidence at P50 or above
- [ ] 3 or more alternatives analyzed including "do nothing"
- [ ] Funding amounts match detailed cost estimates within 5%
- [ ] All organizational approval criteria addressed — no missing fields
- [ ] Every dollar traces to a WBS work package [PLAN]
- [ ] Risk section includes 4 or more investment risks with quantified impact
- [ ] No [SUPUESTO] tag on financial totals without explicit validation plan
- [ ] Approval committee can render decision without requesting additional information
- [ ] Drawdown schedule aligned with project milestones and gate criteria

## Escalation Triggers
- Funding requirement exceeds organizational threshold
- ROI below minimum acceptable for funding category
- Strategic alignment questioned by review committee
- Competing projects vying for same funding pool

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
