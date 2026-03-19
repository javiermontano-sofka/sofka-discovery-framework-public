---
name: apex-communication-plan
description: >
  Use when the user asks to "create a communication plan", "define communication matrix",
  "plan reporting cadence", "design stakeholder communications", or "establish escalation protocols".
  Activates when a stakeholder needs to design a communication matrix, define channel strategy,
  create reporting templates, establish escalation communication paths, or measure communication
  effectiveness across the project.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Communication Plan & Matrix

**TL;DR**: Designs a comprehensive communication management plan including communication matrix (who-what-when-how), channel strategy, reporting cadence, escalation communication protocols, and templates for recurring communications. Ensures the right information reaches the right stakeholder at the right time through the right channel.

## Principio Rector
La comunicación no es overhead — es el medio a través del cual el proyecto existe para sus stakeholders. Un proyecto sin comunicación efectiva es invisible; un proyecto invisible no recibe apoyo. La comunicación debe ser diseñada como un sistema, no dejada al azar.

## Assumptions & Limits
- Assumes a stakeholder register exists with communication preferences identified [SUPUESTO]
- Assumes organizational communication tools (email, Slack, Teams) are available [PLAN]
- Breaks when stakeholder register is incomplete — communication plan has blind spots
- Does not execute communications — provides the plan and templates for execution
- Escalation protocols require governance framework alignment; standalone escalation paths are risky
- Communication effectiveness measurement requires feedback collection mechanisms [METRIC]

## Usage

```bash
# Create full communication plan
/pm:communication-plan $PROJECT --type=full --source="stakeholder-register"

# Generate communication matrix
/pm:communication-plan $PROJECT --type=matrix

# Create communication templates for recurring reports
/pm:communication-plan $PROJECT --type=templates --reports="status,escalation,change"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project identifier |
| `--type` | Yes | `full`, `matrix`, `templates`, `escalation-protocol` |
| `--source` | No | Stakeholder register or input document |
| `--reports` | No | Comma-separated list of template types |

## Service Type Routing
`{TIPO_PROYECTO}`: Agile projects use information radiators and demo-driven communication; Waterfall uses formal status reports; SAFe uses PI-level communication; All types need escalation protocols.

## Before Planning

1. **Read** the stakeholder register to derive communication requirements per stakeholder group
2. **Read** the ceremony calendar to align communication cadence with meeting schedule
3. **Glob** `skills/communication-plan/references/*.md` for communication templates and best practices
4. **Grep** for existing organizational communication standards or templates

## Entrada (Input Requirements)
- Stakeholder register with communication preferences
- Project methodology and ceremony calendar
- Organizational communication standards
- Tool ecosystem (email, Slack, Teams, Jira, etc.)

## Proceso (Protocol)
1. **Communication requirements** — Derive from stakeholder register (who needs what information)
2. **Channel selection** — Match channels to message types (formal reports, real-time chat, dashboards)
3. **Cadence design** — Define frequency per communication type (daily, weekly, monthly, ad-hoc)
4. **Matrix construction** — Build WHO x WHAT x WHEN x HOW x BY WHOM matrix
5. **Template creation** — Design templates for recurring communications
6. **Escalation protocol** — Define communication paths for escalations
7. **Feedback mechanisms** — Establish channels for stakeholder feedback
8. **Tool integration** — Configure tools to automate routine communications
9. **Effectiveness metrics** — Define how communication effectiveness will be measured
10. **Plan approval** — Review and approve with key stakeholders

## Edge Cases

1. **Stakeholder prefers communication channel not available to project**: Document constraint. Propose nearest alternative with rationale. Get stakeholder agreement. [STAKEHOLDER]
2. **Communication overload complaints**: Audit communication volume per stakeholder. Consolidate overlapping communications. Implement opt-in for non-critical updates. [METRIC]
3. **Escalation path unclear during crisis**: Pre-define crisis communication protocol with contact tree, response SLA, and backup contacts. Test annually. [PLAN]
4. **Remote team across multiple time zones**: Design asynchronous-first communication. Reserve synchronous communication for decisions only. Document response SLA per channel. [SCHEDULE]

## Example: Good vs Bad

**Good Communication Plan:**

| Attribute | Value |
|-----------|-------|
| Matrix coverage | Every stakeholder group with specific needs |
| Channels defined | 4 channels matched to message types |
| Templates created | Status, escalation, change notification |
| Escalation protocol | 3-level escalation with SLAs |
| Feedback mechanism | Monthly communication effectiveness survey |
| Calendar alignment | Communication cadence matches ceremony calendar |

**Bad Communication Plan:**
A document that says "send weekly status emails to everyone." No matrix, no channel strategy, no templates, no escalation protocol. Fails because one-size-fits-all communication ensures that executives get too much detail and team members get too little context.

## Validation Gate
- [ ] Communication matrix covers every stakeholder group from the stakeholder register
- [ ] Every communication type has defined channel, frequency, sender, and audience
- [ ] ≥3 communication templates created (status report, escalation, change notification)
- [ ] Escalation protocol defines ≥2 escalation levels with response SLAs
- [ ] No stakeholder group without at least one scheduled communication touchpoint
- [ ] Feedback mechanism defined for measuring communication effectiveness
- [ ] Communication calendar does not conflict with ceremony calendar
- [ ] Tool integration plan for automating routine communications
- [ ] Stakeholders receive relevant, timely information through preferred channels [STAKEHOLDER]
- [ ] Communication cadence aligned with methodology rhythm [PLAN]

## Escalation Triggers
- Key stakeholder reports feeling uninformed
- Communication overload complaints from team
- Escalation path unclear during crisis
- Communication tool unavailability

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before planning to understand communication theory | `references/body-of-knowledge.md` |
| State of the Art | When evaluating modern communication tools | `references/state-of-the-art.md` |
| Knowledge Graph | To link communication to stakeholder register | `references/knowledge-graph.mmd` |
| Use Case Prompts | When scoping communication needs with stakeholders | `prompts/use-case-prompts.md` |
| Metaprompts | To generate communication templates | `prompts/metaprompts.md` |
| Sample Output | To calibrate expected communication plan format | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
