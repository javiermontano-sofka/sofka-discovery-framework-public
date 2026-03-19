---
name: apex-engagement-strategy
description: >
  Use when the user asks to "create engagement strategy", "plan stakeholder engagement",
  "design influence approach", "manage stakeholder resistance", or "build coalition support".
  Activates when a stakeholder needs to design targeted engagement strategies, move stakeholders
  from current to desired engagement levels, build champion coalitions, analyze and respond
  to resistance, or track engagement effectiveness over time.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Stakeholder Engagement Strategy

**TL;DR**: Designs targeted engagement strategies to move each stakeholder from their current engagement level to the desired level. Includes influence tactics, engagement activities, coalition building, and resistance management approaches tailored to stakeholder power, interest, and current disposition.

## Principio Rector
El engagement no se ordena — se diseña. Cada stakeholder tiene motivaciones, preocupaciones y estilos de comunicación únicos. La estrategia de engagement es un plan de influencia ética: comprender qué le importa a cada stakeholder y mostrar cómo el proyecto sirve a esos intereses.

## Assumptions & Limits
- Assumes a stakeholder register with power/interest analysis exists [SUPUESTO]
- Assumes current engagement levels are assessed through observation, not self-reporting [PLAN]
- Breaks when stakeholder landscape changes significantly without reassessment
- Does not execute engagement activities — provides strategy and action plans
- Resistance analysis requires honest assessment; organizations with blame culture produce sanitized inputs
- Engagement tracking requires longitudinal observation; single-point assessments are misleading [METRIC]

## Usage

```bash
# Create full engagement strategy from stakeholder register
/pm:engagement-strategy $PROJECT --type=full --source="stakeholder-register"

# Design resistance management approach for specific stakeholders
/pm:engagement-strategy $PROJECT --type=resistance --stakeholders="VP-Finance,CTO"

# Build coalition map for project support
/pm:engagement-strategy $PROJECT --type=coalition --objective="budget-approval"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project identifier |
| `--type` | Yes | `full`, `resistance`, `coalition`, `tracking`, `single-stakeholder` |
| `--source` | No | Stakeholder register or analysis document |
| `--stakeholders` | No | Specific stakeholders to focus on |
| `--objective` | No | Coalition objective |

## Service Type Routing
`{TIPO_PROYECTO}`: Transformation requires intensive engagement for change adoption; Portfolio needs functional champion engagement per module; Agile needs management engagement for culture shift.

## Before Strategizing

1. **Read** the stakeholder register with power/interest analysis and current engagement levels
2. **Read** organizational political landscape and historical engagement successes/failures
3. **Glob** `skills/engagement-strategy/references/*.md` for influence frameworks and tactics
4. **Grep** for prior engagement feedback or stakeholder satisfaction data

## Entrada (Input Requirements)
- Stakeholder register with power/interest analysis
- Current vs. desired engagement levels
- Organizational political landscape
- Historical engagement successes and failures

## Proceso (Protocol)
1. **Gap prioritization** — Rank engagement gaps by impact on project success
2. **Motivation mapping** — Understand each key stakeholder's drivers and concerns
3. **Influence approach** — Design specific tactics per stakeholder (coalition, demonstration, data, authority)
4. **Activity design** — Plan engagement activities (demos, workshops, one-on-ones, site visits)
5. **Coalition building** — Identify and leverage champion stakeholders to influence others
6. **Resistance analysis** — Understand root causes of resistance (fear, loss, uncertainty)
7. **Resistance response** — Design specific approaches for resistant stakeholders
8. **Timeline** — Schedule engagement activities aligned with project milestones
9. **Effectiveness tracking** — Define metrics to measure engagement progress
10. **Adaptation protocol** — Plan for adjusting strategies based on results

## Edge Cases

1. **Key stakeholder engagement declining despite efforts**: Reassess motivation mapping. Engagement may address wrong concern. Conduct private 1-on-1 to surface real issue. [STAKEHOLDER]
2. **Active sabotage detected**: Document evidence objectively. Escalate to sponsor with impact analysis. Do not confront directly — use governance channels. [PLAN]
3. **Sponsor engagement below "Supportive"**: Critical risk to project survival. Immediate 1-on-1 with sponsor. Realign project value proposition to sponsor's priorities. [STAKEHOLDER]
4. **Coalition insufficient to overcome organized resistance**: Expand coalition search. Seek higher-authority champions. Consider phased approach to demonstrate value before full rollout. [PLAN]

## Example: Good vs Bad

**Good Engagement Strategy:**

| Attribute | Value |
|-----------|-------|
| Stakeholders covered | Every key stakeholder with individual strategy |
| Motivation mapping | Specific drivers and concerns per stakeholder |
| Influence tactics | Tailored per stakeholder (data, demo, authority) |
| Coalition map | Champions identified with influence pathways |
| Resistance response | Root causes addressed, not symptoms |
| Tracking metrics | Engagement level measured quarterly |

**Bad Engagement Strategy:**
A plan that says "engage all stakeholders through monthly emails." No individual strategies, no motivation mapping, no coalition building, no resistance analysis. Fails because uniform engagement ignores the reality that each stakeholder has unique motivations and responds to different influence approaches.

## Validation Gate
- [ ] Every key stakeholder has individual engagement strategy with motivation mapping
- [ ] Current and desired engagement levels documented for each stakeholder
- [ ] Influence tactics tailored per stakeholder — no one-size-fits-all approach
- [ ] ≥3 engagement activities planned and scheduled per critical stakeholder
- [ ] Coalition map identifies ≥2 champion stakeholders with influence pathways
- [ ] Resistance root causes analyzed (fear, loss, uncertainty) — not just symptoms
- [ ] Engagement tracking metrics defined with measurement cadence (monthly or quarterly)
- [ ] Adaptation protocol defines when and how to adjust failing strategies
- [ ] All approaches ethical and respectful of stakeholder autonomy [STAKEHOLDER]
- [ ] Engagement cadence aligned with project rhythm and milestones [PLAN]

## Escalation Triggers
- Key stakeholder engagement declining despite efforts
- Active sabotage detected
- Sponsor engagement below "Supportive" level
- Coalition insufficient to overcome organized resistance

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before strategizing to understand influence theory | `references/body-of-knowledge.md` |
| State of the Art | When exploring modern engagement approaches | `references/state-of-the-art.md` |
| Knowledge Graph | To link engagement to stakeholder register and communication plan | `references/knowledge-graph.mmd` |
| Use Case Prompts | When designing engagement activities | `prompts/use-case-prompts.md` |
| Metaprompts | To generate stakeholder engagement templates | `prompts/metaprompts.md` |
| Sample Output | To calibrate expected engagement strategy format | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
