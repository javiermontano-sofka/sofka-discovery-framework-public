---
name: apex-conflict-resolution
description: >
  Use when the user asks to "resolve stakeholder conflict", "manage team conflict",
  "mediate disagreements", "navigate political disputes", or "de-escalate team tensions".
  Activates when a stakeholder needs to classify conflict types, apply resolution techniques,
  facilitate interest-based negotiation, build coalitions for alignment, or design structural
  prevention measures to avoid recurring conflicts.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Stakeholder Conflict Management

**TL;DR**: Provides conflict resolution frameworks and protocols for managing stakeholder and team conflicts. Identifies conflict types (task, relationship, process), applies appropriate resolution techniques (collaboration, compromise, accommodation, avoidance, competition), and documents agreements and prevention measures.

## Principio Rector
El conflicto no es el problema — el conflicto no gestionado es el problema. Los conflictos de tarea (sobre qué hacer) son saludables y generan mejores soluciones. Los conflictos de relación (sobre quién tiene razón) son destructivos y deben desescalarse. El PM debe distinguir entre ambos y aplicar el enfoque correcto.

## Assumptions & Limits
- Assumes parties are willing to engage in resolution process [SUPUESTO]
- Assumes PM has organizational authority or mandate to mediate [STAKEHOLDER]
- Breaks when conflict involves legal disputes or HR violations — escalate to appropriate authority
- Does not address workplace harassment or discrimination — those require HR intervention
- Cultural context affects conflict resolution approach; techniques must be calibrated [SUPUESTO]
- Resolution agreements are only as strong as the follow-up mechanism enforcing them

## Usage

```bash
# Analyze and classify a specific conflict
/pm:conflict-resolution $PROJECT --type=analyze --conflict="resource-allocation"

# Design resolution approach for stakeholder disagreement
/pm:conflict-resolution $PROJECT --type=mediate --parties="sponsor,tech-lead"

# Create prevention measures for recurring conflicts
/pm:conflict-resolution $PROJECT --type=prevention --pattern="scope-disputes"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project identifier |
| `--type` | Yes | `analyze`, `mediate`, `prevention`, `follow-up` |
| `--conflict` | No | Conflict description or category |
| `--parties` | No | Involved parties |
| `--pattern` | No | Recurring conflict pattern to address |

## Service Type Routing
`{TIPO_PROYECTO}`: Matrix organizations have inherent reporting conflicts; Agile-Transformation creates culture conflicts; ERP creates process ownership conflicts; Multi-Program creates resource conflicts.

## Before Resolving

1. **Read** the stakeholder register to understand power/interest dynamics of conflicting parties
2. **Read** the RACI matrix to identify authority ambiguities that may be causing the conflict
3. **Glob** `skills/conflict-resolution/references/*.md` for resolution technique frameworks
4. **Grep** for prior conflict documentation or governance decisions related to the dispute

## Entrada (Input Requirements)
- Conflict description and parties involved
- Stakeholder register with power/interest analysis
- RACI matrix for authority clarity
- Governance framework and escalation paths
- Organizational conflict resolution policies

## Proceso (Protocol)
1. **Conflict identification** — Understand the nature, parties, and stakes of the conflict
2. **Type classification** — Classify as task, relationship, or process conflict
3. **Root cause analysis** — Identify underlying causes (resource scarcity, role ambiguity, values)
4. **Stakeholder assessment** — Assess each party's position, interest, and power
5. **Strategy selection** — Choose resolution approach based on urgency and relationship importance
6. **Mediation preparation** — Prepare neutral ground, ground rules, and structured dialogue
7. **Resolution facilitation** — Guide parties through interest-based negotiation
8. **Agreement documentation** — Document resolution terms and commitments
9. **Prevention measures** — Identify structural changes to prevent recurrence
10. **Follow-up** — Monitor agreement compliance and relationship recovery

## Edge Cases

1. **One party refuses to engage**: Document refusal. Attempt shuttle diplomacy (separate conversations). If unresolvable, escalate to their reporting authority with evidence. [STAKEHOLDER]
2. **Conflict involves the PM's own supervisor**: Recuse from mediation. Recommend neutral third-party mediator. Document conflict and proposed process. [PLAN]
3. **Cultural differences driving conflict**: Acknowledge cultural context explicitly. Adapt resolution techniques to participants' communication styles. Avoid imposing single cultural norm. [STAKEHOLDER]
4. **Conflict affecting critical path**: Prioritize resolution speed over perfection. Implement temporary working agreement while root cause resolution proceeds. [SCHEDULE]

## Example: Good vs Bad

**Good Conflict Resolution:**

| Attribute | Value |
|-----------|-------|
| Conflict classified | Type identified (task/relationship/process) |
| Root cause identified | Specific underlying cause documented |
| Resolution approach | Matched to conflict type and urgency |
| Agreement documented | Written terms with commitments from both parties |
| Prevention measures | Structural change to prevent recurrence |
| Follow-up scheduled | 2-week compliance check planned |

**Bad Conflict Resolution:**
Telling both parties to "work it out" without classification, root cause analysis, mediation, or agreement documentation. Fails because unstructured conflict resolution typically results in the more powerful party imposing their position, creating resentment and recurrence.

## Validation Gate
- [ ] Conflict classified by type (task, relationship, process) with evidence
- [ ] Root cause analysis identifies underlying drivers, not just surface symptoms
- [ ] Resolution approach matched to conflict type and urgency level
- [ ] All parties' perspectives documented with positions AND interests distinguished
- [ ] Agreement terms specific, written, and accepted by all parties
- [ ] Prevention measures address structural root cause, not just symptoms
- [ ] Follow-up compliance check scheduled within 2 weeks of agreement
- [ ] Unresolved conflict escalation risks quantified and documented
- [ ] All parties feel heard and process was fair [STAKEHOLDER]
- [ ] Resolution process respects methodology roles and governance [PLAN]

## Escalation Triggers
- Conflict affecting critical path activities
- Resolution attempts failed after 2 iterations
- Conflict involves sponsor or steering committee members
- Conflict creating team attrition risk

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before mediating to understand conflict theory | `references/body-of-knowledge.md` |
| State of the Art | When exploring advanced negotiation techniques | `references/state-of-the-art.md` |
| Knowledge Graph | To link conflict to governance and stakeholder management | `references/knowledge-graph.mmd` |
| Use Case Prompts | When preparing for mediation sessions | `prompts/use-case-prompts.md` |
| Metaprompts | To generate conflict analysis frameworks | `prompts/metaprompts.md` |
| Sample Output | To calibrate expected resolution documentation | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
