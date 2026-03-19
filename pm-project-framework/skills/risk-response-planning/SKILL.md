---
name: apex-risk-response-planning
description: >
  Use when the user asks to "plan risk responses", "create mitigation strategies",
  "define risk treatments", "design contingency plans", "assign risk owners",
  or mentions risk mitigation, risk transfer, risk avoidance, risk acceptance,
  response strategies, trigger-response mapping.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Risk Response Planning

**TL;DR**: Develops specific response strategies for each identified risk: avoid, transfer, mitigate, or accept for threats; exploit, share, enhance, or accept for opportunities. Each response includes action plans, trigger conditions, responsible owners, and cost/schedule impact. Updates the project plan with risk-related activities.

## Principio Rector
Identificar un riesgo sin planificar una respuesta es como diagnosticar una enfermedad sin prescribir tratamiento. La respuesta debe ser proporcional al riesgo: no gastar más en mitigación que el impacto esperado. Las mejores respuestas eliminan la causa raíz; las segundas mejores reducen la probabilidad o el impacto.

## Assumptions & Limits
- Assumes prioritized risk register exists from risk identification/qualitative analysis [PLAN]
- Assumes risk quantification results are available for cost-benefit analysis [METRIC]
- Breaks when risk appetite is undefined — cannot determine proportional responses
- Does not identify risks; plans responses for already-identified risks
- Assumes budget baseline includes contingency reserves [SUPUESTO]
- Limited to proactive response planning; crisis response uses different protocols

## Usage

```bash
# Full response planning for all prioritized risks
/pm:risk-response-planning $ARGUMENTS="--risk-register risks.md --budget budget.md"

# Response planning for top 10 risks only
/pm:risk-response-planning --type top-n --count 10

# Update responses after quantification
/pm:risk-response-planning --type update --quantification quant-report.md
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Path to risk register and budget baseline |
| `--type` | No | `full` (default), `top-n`, `update`, `opportunities` |
| `--count` | No | Number of top risks to address (default all prioritized) |
| `--appetite` | No | Path to risk appetite framework |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Spikes and prototypes as mitigation; risk responses embedded in sprint backlog; contingency absorbed in velocity buffer
- **Waterfall**: Formal response plans with contingency reserves; risk triggers monitored at phase gates; contractual risk transfer
- **SAFe**: ROAM-based responses at PI level; risk mitigation features prioritized in PI backlog; program-level contingency
- **Hybrid**: Phase-level formal responses for high-impact risks; sprint-level experimental responses for emergent risks
- **Recovery**: Aggressive mitigation of critical-path risks; triage-based response prioritization; emergency contingency activation
- **Portfolio**: Cross-project risk response coordination; portfolio-level risk reserves and escalation protocols

## Before Planning Responses
1. **Read** the prioritized risk register to understand risk rankings and impacts [PLAN]
2. **Read** risk quantification results for cost-benefit analysis of responses [METRIC]
3. **Read** risk appetite framework to calibrate response proportionality [PLAN]
4. **Grep** for available contingency in budget baseline and schedule float [SCHEDULE]

## Entrada (Input Requirements)
- Prioritized risk register (from `risk-register`)
- Risk quantification results (from `risk-quantification`)
- Budget baseline with contingency reserves
- Schedule baseline with float analysis
- Stakeholder risk appetite (from `risk-appetite-framework`)

## Proceso (Protocol)
1. **Prioritize for response** — Select risks requiring active response (top risks by P x I score)
2. **Strategy selection** — For each risk, evaluate response strategies and select best fit
3. **Action planning** — Define specific actions, responsible parties, and deadlines for each response
4. **Trigger definition** — Establish trigger conditions that activate contingency responses
5. **Cost-benefit analysis** — Verify response cost does not exceed expected impact
6. **Secondary risk assessment** — Identify risks created by the response strategies themselves
7. **Residual risk assessment** — Estimate remaining risk after response implementation
8. **Update project plan** — Add risk response activities to schedule and budget
9. **Fallback planning** — Define fallback plans for risks where primary response fails
10. **Communication plan** — Define how risk responses will be communicated to stakeholders

## Edge Cases
1. **No viable response for a critical risk** — Document the residual risk explicitly. Escalate to sponsor with acceptance decision. Add to watchlist with enhanced monitoring [STAKEHOLDER].
2. **Response cost exceeds available contingency** — Request additional contingency, or reprioritize responses. Present trade-off: which risks will be accepted to fund mitigation of others? [PLAN].
3. **Multiple risks requiring simultaneous response activation** — Prioritize by critical path impact. Assess whether combined response creates resource contention. Plan for scenario of multiple concurrent triggers [SCHEDULE].
4. **Opportunity risk identified** — Apply positive risk strategies: exploit, share, enhance, or accept. Ensure positive risks receive equal planning rigor as threats [PLAN].

## Example: Good vs Bad

**Good example — Proportional risk responses:**

| Attribute | Value |
|-----------|-------|
| Risks with responses | 15 risks with strategy assigned |
| Strategies | 3 mitigate, 2 avoid, 2 transfer, 5 accept, 3 contingency |
| Trigger conditions | All 15 have measurable trigger conditions |
| Cost-benefit | Every mitigation cost < 50% of expected impact |
| Secondary risks | 2 secondary risks identified from responses |
| Residual risk | Documented for all 15 risks |

**Bad example — Generic responses:**
"Monitor the risk" for every entry. Monitoring is not a response — it is observation. Without specific actions, trigger conditions, and responsible owners, risk responses exist only on paper and will not activate when needed.

## Salida (Deliverables)
- `03_risk_responses_{proyecto}_{WIP}.md` — Risk response plan
- Response strategy matrix (risk x strategy x actions)
- Trigger-response mapping table
- Updated schedule with risk response activities
- Residual risk summary

## Validation Gate
- [ ] Every high-priority risk has a specific response strategy (not just "monitor") [PLAN]
- [ ] Every response has a named owner and deadline [PLAN]
- [ ] Every response has measurable trigger condition [METRIC]
- [ ] Cost-benefit verified: response cost ≤ expected impact [METRIC]
- [ ] Secondary risks identified for all mitigation and avoidance strategies [PLAN]
- [ ] Residual risk documented for every risk with response [PLAN]
- [ ] Fallback plans defined for top 5 risks [PLAN]
- [ ] Risk response activities added to project schedule [SCHEDULE]
- [ ] Evidence ratio: ≥80% [PLAN]/[METRIC], <20% [SUPUESTO]
- [ ] Communication plan covers how responses will be reported to stakeholders [STAKEHOLDER]

## Escalation Triggers
- No viable response for a critical risk
- Response cost exceeds available contingency
- Multiple risks requiring simultaneous response activation
- Risk owner unable to execute assigned response

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
