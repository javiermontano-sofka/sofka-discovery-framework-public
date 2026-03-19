---
name: apex-risk-appetite-framework
description: >
  Use when the user asks to "define risk appetite", "set risk tolerance",
  "establish risk thresholds", "calibrate organizational risk levels", "create risk acceptance criteria",
  or mentions organizational risk tolerance, risk appetite statement, risk capacity,
  risk attitude, risk threshold matrix.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Risk Appetite & Tolerance Framework

**TL;DR**: Establishes the organizational risk appetite framework for the project including risk appetite statements, tolerance thresholds, risk capacity assessment, and decision criteria for risk acceptance. Ensures risk management decisions align with stakeholder expectations and organizational risk culture.

## Principio Rector
La tolerancia al riesgo no es uniforme — varía por dimensión (costo, tiempo, calidad, reputación), por stakeholder, y por contexto. Un framework de apetito de riesgo hace explícitas estas variaciones para que las decisiones de gestión de riesgos sean consistentes y alineadas con la cultura organizacional.

## Assumptions & Limits
- Assumes key stakeholders are available for risk attitude interviews [STAKEHOLDER]
- Assumes organizational risk management policies exist (even if informal) [SUPUESTO]
- Breaks when stakeholders refuse to articulate risk preferences — appetite cannot be inferred
- Does not manage individual risks; establishes the framework for risk decisions
- Assumes project charter defines constraints that bound risk capacity [PLAN]
- Limited to project/program risk appetite; enterprise risk appetite requires broader organizational engagement

## Usage

```bash
# Full risk appetite framework
/pm:risk-appetite-framework $ARGUMENTS="--charter charter.md --stakeholders stakeholder-register.md"

# Dimension-specific threshold definition
/pm:risk-appetite-framework --type thresholds --dimensions "cost,schedule,quality,reputation"

# Risk culture assessment only
/pm:risk-appetite-framework --type culture-assessment --org-context "fintech,regulated"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Path to charter and stakeholder register |
| `--type` | No | `full` (default), `thresholds`, `culture-assessment` |
| `--dimensions` | No | Comma-separated risk dimensions to assess |
| `--org-context` | No | Industry and regulatory context |

## Service Type Routing
`{TIPO_PROYECTO}`: Regulated industries have lower risk appetite for compliance; Startups have higher tolerance for schedule risk; Fixed-price contracts have low cost risk tolerance; Innovation projects tolerate more scope uncertainty.

## Before Defining Appetite
1. **Read** the project charter to understand constraints that bound risk capacity [PLAN]
2. **Read** the stakeholder register to identify who must be interviewed for risk attitudes [STAKEHOLDER]
3. **Glob** `**/risk_policy*` or `**/governance*` to find organizational risk management policies [PLAN]
4. **Grep** for regulatory requirements that mandate risk tolerance levels [PLAN]

## Entrada (Input Requirements)
- Organizational risk management policies
- Stakeholder risk perceptions and preferences
- Project charter with constraints
- Industry regulatory requirements
- Historical risk performance data

## Proceso (Protocol)
1. **Stakeholder risk interviews** — Gather risk attitudes from key stakeholders
2. **Dimension mapping** — Define risk dimensions (cost, schedule, scope, quality, reputation, compliance)
3. **Appetite statements** — Draft risk appetite statements per dimension
4. **Threshold definition** — Set quantitative thresholds (e.g., "schedule variance < 10% acceptable")
5. **Escalation mapping** — Define which risk levels require which authority level
6. **Decision framework** — Create risk acceptance criteria matrix
7. **Cultural assessment** — Evaluate organizational risk culture maturity
8. **Communication** — Socialize risk appetite framework with all stakeholders
9. **Integration** — Embed appetite thresholds into risk monitoring dashboards
10. **Review protocol** — Establish periodic review of risk appetite alignment

## Edge Cases
1. **Stakeholders disagree on risk appetite for a critical dimension** — Document all positions. Escalate to sponsor for arbitration. Never average conflicting risk appetites — choose the more conservative until resolved [STAKEHOLDER].
2. **Organizational culture is risk-averse but project requires innovation risk** — Create a project-specific risk exception with sponsor approval. Document the gap between organizational and project risk appetite with rationale [STAKEHOLDER].
3. **No historical data to calibrate thresholds** — Use industry benchmarks tagged as [SUPUESTO]. Schedule threshold recalibration after first project quarter with actual data [SUPUESTO].
4. **Regulatory change shifts risk appetite mid-project** — Trigger framework revision. Assess impact on all open risks and response plans. Notify all stakeholders of threshold changes [PLAN].

## Example: Good vs Bad

**Good example — Quantified risk appetite framework:**

| Attribute | Value |
|-----------|-------|
| Dimensions | 6 dimensions assessed (cost, schedule, scope, quality, reputation, compliance) |
| Appetite statements | 1 statement per dimension, approved by sponsor |
| Thresholds | Quantitative thresholds per dimension (e.g., schedule ≤10%, cost ≤15%) |
| Escalation matrix | 3 levels mapped to authority (PM, Sponsor, Board) |
| Decision criteria | Risk acceptance matrix with clear criteria |
| Review cadence | Quarterly appetite review scheduled |

**Bad example — Undefined risk appetite:**
"We have low risk tolerance" with no quantification, no dimension-specific thresholds, and no escalation criteria. Without quantified thresholds, every risk decision is subjective and inconsistent. "Low" means different things to different stakeholders.

## Salida (Deliverables)
- `03_risk_appetite_{proyecto}_{WIP}.md` — Risk appetite framework
- Risk appetite statements per dimension
- Threshold matrix with escalation levels
- Risk acceptance decision tree
- Stakeholder risk preference summary

## Validation Gate
- [ ] ≥5 risk dimensions assessed with appetite statements [PLAN]
- [ ] Every threshold is quantitative and measurable (not "low/medium/high") [METRIC]
- [ ] Escalation matrix maps risk levels to specific authority levels [PLAN]
- [ ] Key stakeholders interviewed and preferences documented [STAKEHOLDER]
- [ ] Risk acceptance criteria are testable (clear pass/fail) [METRIC]
- [ ] Framework reviewed and approved by sponsor [STAKEHOLDER]
- [ ] Thresholds integrated into risk monitoring dashboard [PLAN]
- [ ] Review cadence established (≥quarterly) [SCHEDULE]
- [ ] Evidence ratio: ≥75% [PLAN]/[STAKEHOLDER], <25% [SUPUESTO]
- [ ] Cultural assessment completed with maturity rating [INFERENCIA]

## Escalation Triggers
- Stakeholders disagree on risk appetite for critical dimension
- Organizational risk appetite conflicts with project requirements
- Risk appetite too restrictive for project type
- No executive sponsorship for risk appetite definition

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
