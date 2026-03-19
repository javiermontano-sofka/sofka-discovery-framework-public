---
name: apex-contingency-planning
description: >
  Use when the user asks to "plan contingencies", "create fallback plans",
  "define contingency reserves", "design trigger-response protocols", or "calculate schedule reserves".
  Activates when a stakeholder needs to develop fallback strategies for high-priority risks,
  calculate schedule and cost reserves from quantitative analysis, define trigger protocols
  for rapid contingency activation, or track reserve consumption over time.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Contingency Planning & Reserve Management

**TL;DR**: Develops contingency plans and fallback strategies for high-priority risks. Calculates and manages contingency reserves (schedule and cost) based on quantitative risk analysis. Defines trigger-response protocols that enable rapid activation of pre-planned responses when risks materialize.

## Principio Rector
La contingencia no es "colchón" — es cobertura cuantificada contra incertidumbre. Cada peso y cada día de reserva debe rastrearse hasta un riesgo identificado. Los planes de contingencia se escriben cuando hay tiempo para pensar, se ejecutan cuando no lo hay. Un plan de contingencia que nadie ha leído es peor que no tener plan.

## Assumptions & Limits
- Assumes a prioritized risk register exists with probability and impact ratings [SUPUESTO]
- Assumes organizational reserve policies define acceptable reserve percentages [PLAN]
- Breaks when risk register is empty — contingency without identified risks is guesswork
- Monte Carlo simulation requires ≥50 schedule activities for statistical validity [METRIC]
- Does not replace risk response planning — contingency is the fallback when primary response fails
- Reserve tracking requires discipline; consumed reserves without documentation create audit gaps

## Usage

```bash
# Create contingency plans for top risks
/pm:contingency-planning $PROJECT --type=plans --risks="top-10"

# Calculate reserves from Monte Carlo results
/pm:contingency-planning $PROJECT --type=reserves --method="monte-carlo" --confidence=80

# Track reserve consumption
/pm:contingency-planning $PROJECT --type=tracking --period="2026-03"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project identifier |
| `--type` | Yes | `plans`, `reserves`, `tracking`, `trigger-protocols` |
| `--risks` | No | Risk filter (top-5, top-10, all-high) |
| `--method` | No | Reserve calculation method (emv, monte-carlo, percentage) |
| `--confidence` | No | Confidence level for Monte Carlo (P50, P80, P90) |

## Service Type Routing
`{TIPO_PROYECTO}`: All project types need contingency planning. Complex projects use Monte Carlo-based reserves; simpler projects use percentage-based reserves. Fixed-price contracts require tighter contingency management.

## Before Planning

1. **Read** the prioritized risk register to select risks requiring contingency plans
2. **Read** Monte Carlo simulation results (if available) for reserve calculations
3. **Glob** `skills/contingency-planning/references/*.md` for contingency plan templates
4. **Read** the budget and schedule baselines to understand reserve allocation context

## Entrada (Input Requirements)
- Prioritized risk register with response plans
- Monte Carlo simulation results (if available)
- Budget baseline with reserve allocations
- Schedule baseline with float analysis
- Organizational reserve policies

## Proceso (Protocol)
1. **Identify contingency needs** — Select risks requiring pre-planned fallback responses
2. **Design fallback plans** — Create step-by-step response for each contingency scenario
3. **Calculate schedule reserve** — Based on Monte Carlo P80-P50 gap or critical path float
4. **Calculate cost reserve** — Based on EMV summation or Monte Carlo cost confidence gap
5. **Define trigger protocols** — Establish exact conditions that activate each contingency plan
6. **Assign contingency owners** — Designate authorities for reserve release decisions
7. **Rehearsal planning** — Plan tabletop exercises for critical contingency scenarios
8. **Reserve tracking** — Establish mechanism to track reserve consumption over time
9. **Replenishment rules** — Define when and how consumed reserves are replenished
10. **Communication protocol** — Define who is notified when contingencies are activated

## Edge Cases

1. **No Monte Carlo data available**: Use EMV-based reserve calculation (sum of P x I for all identified risks). Tag as [INFERENCIA] and recommend Monte Carlo for next planning cycle. [METRIC]
2. **Multiple contingencies activated simultaneously**: Pre-define priority order for resource allocation when multiple plans compete. Activate war room protocol. [PLAN]
3. **Contingency plan proves inadequate when triggered**: Activate management reserve. Convene emergency steering committee. Document lessons for plan update. [STAKEHOLDER]
4. **Reserve consumed >50% before project midpoint**: Trigger reserve audit. Determine if consumption is from planned risk responses or scope creep. Request additional funding if justified. [METRIC]

## Example: Good vs Bad

**Good Contingency Plan:**

| Attribute | Value |
|-----------|-------|
| Risks covered | All High + Critical priority risks |
| Fallback plans | Step-by-step with owner and timeline |
| Reserve calculation | Based on Monte Carlo P80 or EMV sum |
| Trigger protocols | Specific, unambiguous activation conditions |
| Reserve tracking | Monthly burn-down with consumption analysis |
| Rehearsal | Annual tabletop for top 3 scenarios |

**Bad Contingency Plan:**
A document saying "10% contingency reserve" without linking reserves to specific risks, no fallback plans, no trigger protocols, and no tracking mechanism. Fails because arbitrary percentage-based reserves provide no risk coverage assurance and no activation guidance when risks materialize.

## Validation Gate
- [ ] Every High and Critical risk has a documented contingency/fallback plan
- [ ] Schedule reserve calculated from Monte Carlo (P80-P50) or critical path float analysis
- [ ] Cost reserve calculated from EMV summation or Monte Carlo cost gap — not arbitrary percentage
- [ ] Trigger protocols define exact, unambiguous conditions for each contingency activation
- [ ] Every contingency plan has an assigned owner with authority to activate
- [ ] Reserve tracking mechanism established with monthly consumption reporting
- [ ] ≥1 tabletop rehearsal planned for critical contingency scenarios
- [ ] Reserve replenishment rules documented for post-activation recovery
- [ ] Sponsors understand reserve purpose and approve allocation [STAKEHOLDER]
- [ ] Reserve management aligned with project governance and methodology [PLAN]

## Escalation Triggers
- Contingency reserves consumed past 50% threshold
- Multiple contingency plans activated simultaneously
- Contingency plan proves inadequate when triggered
- Reserve replenishment requires additional funding approval

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before planning to understand reserve management theory | `references/body-of-knowledge.md` |
| State of the Art | When evaluating Monte Carlo simulation approaches | `references/state-of-the-art.md` |
| Knowledge Graph | To link contingency to risk register and budget | `references/knowledge-graph.mmd` |
| Use Case Prompts | When designing trigger protocols | `prompts/use-case-prompts.md` |
| Metaprompts | To generate contingency response cards | `prompts/metaprompts.md` |
| Sample Output | To calibrate expected contingency plan format | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
