---
name: apex-copywriting
description: >
  Use when the user asks to "write persuasive content", "create messaging",
  "draft project marketing", "craft elevator pitches", or "design stakeholder narratives".
  Activates when a stakeholder needs persuasive project communications, elevator pitches,
  change narratives, internal marketing copy, value propositions for diverse audiences,
  or FAQ documents addressing common stakeholder objections.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Persuasive Writing & Messaging

**TL;DR**: Produces persuasive project communications including elevator pitches, stakeholder messaging, change narratives, internal marketing, and value propositions. Tailors tone, structure, and messaging to specific audiences to drive engagement, buy-in, and action.

## Principio Rector
La gestión de proyectos es, en gran parte, gestión de narrativas. Cómo se comunica un proyecto determina cómo se percibe. Un proyecto técnicamente sólido con comunicación deficiente será subestimado; un proyecto promedio con comunicación excelente será celebrado. El copywriting transforma hechos en historias que generan acción.

## Assumptions & Limits
- Assumes message objective and target audience are defined before writing [PLAN]
- Assumes key facts and data are available and verified [SUPUESTO]
- Breaks when the message objective conflicts with project reality — do not write fiction
- Does not create deceptive messaging — persuasion must be grounded in evidence
- Tone calibration requires understanding of organizational culture [SUPUESTO]
- Multi-channel adaptation requires knowledge of channel constraints (character limits, format)

## Usage

```bash
# Create elevator pitch for project
/pm:copywriting $PROJECT --type=pitch --audience="executive" --length="30-second"

# Write change narrative for transformation initiative
/pm:copywriting $PROJECT --type=narrative --audience="all-staff" --tone="inspirational"

# Generate FAQ for common objections
/pm:copywriting $PROJECT --type=faq --objections="cost,timeline,disruption"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project identifier |
| `--type` | Yes | `pitch`, `narrative`, `faq`, `value-proposition`, `messaging-matrix` |
| `--audience` | No | Target audience (executive, technical, all-staff, customer) |
| `--tone` | No | Desired tone (formal, conversational, urgent, inspirational) |
| `--length` | No | Content length (30-second, 2-minute, one-page) |
| `--objections` | No | Common objections to address in FAQ |

## Service Type Routing
`{TIPO_PROYECTO}`: Transformation needs change narratives; Agile needs agile value messaging; PMO needs PMO value proposition; All types need stakeholder communication.

## Before Writing

1. **Read** the stakeholder register to understand audience motivations and communication preferences
2. **Read** the project charter for key facts, objectives, and value proposition
3. **Glob** `skills/copywriting/references/*.md` for messaging frameworks and tone guidelines
4. **Grep** for existing project communications to maintain consistency

## Entrada (Input Requirements)
- Message objective and target audience
- Key facts and data to communicate
- Desired audience action or response
- Tone and style requirements
- Channel and format constraints

## Proceso (Protocol)
1. **Audience profiling** — Understand audience motivations, concerns, and language
2. **Message framing** — Choose frame (benefit, problem-solution, comparison, narrative)
3. **Value proposition** — Craft clear value proposition for the audience
4. **Draft creation** — Write initial copy with attention to structure and flow
5. **Persuasion techniques** — Apply appropriate techniques (social proof, urgency, authority)
6. **Call to action** — Include clear, specific call to action
7. **Tone calibration** — Adjust tone (formal, conversational, urgent, inspirational)
8. **Review and refine** — Iterate on clarity, conciseness, and impact
9. **Multi-version** — Create versions for different channels if needed
10. **Testing** — Review with sample audience member for effectiveness

## Edge Cases

1. **Audience is hostile to the project**: Lead with acknowledged concerns, not benefits. Demonstrate listening before persuading. Use evidence-based messaging with [METRIC] tags. [STAKEHOLDER]
2. **Conflicting messages from different project channels**: Audit all existing communications. Create master messaging matrix for consistency. Designate single source of truth for each message type. [PLAN]
3. **Messaging accuracy challenged**: Provide evidence trail for every factual claim. Remove or tag unsupported claims. Credibility once lost is nearly impossible to recover. [METRIC]
4. **Multiple audiences with opposing interests**: Create audience-specific versions with shared core message. Never promise contradictory outcomes to different audiences. [STAKEHOLDER]

## Example: Good vs Bad

**Good Copywriting:**

| Attribute | Value |
|-----------|-------|
| Audience profiling | Specific motivations and concerns documented |
| Message framing | Problem-solution with evidence |
| Elevator pitch | 30-second and 2-minute versions |
| Call to action | Specific, actionable, time-bound |
| Multi-channel | Adapted for email, presentation, Slack |
| Evidence-backed | Every claim traceable to project data |

**Bad Copywriting:**
A generic message saying "this project will transform our organization" sent to all audiences through all channels with no audience-specific framing, no evidence, no call to action. Fails because generic messaging resonates with no one — effective communication requires audience-specific framing and evidence-based claims.

## Validation Gate
- [ ] Every message has defined target audience with specific motivations documented
- [ ] Claims supported by project data — no unsupported assertions
- [ ] Clear, specific call to action included in every communication piece
- [ ] Key messages adapted for ≥2 audiences or channels
- [ ] Elevator pitch available in ≥2 lengths (30-second, 2-minute)
- [ ] Messaging matrix maps audience x message x channel for consistency
- [ ] No overpromising — claims aligned with realistic project outcomes
- [ ] Tone calibrated to organizational culture and audience expectations
- [ ] Audience motivated to take desired action after reading [STAKEHOLDER]
- [ ] Messaging aligns with project brand and communication plan [PLAN]

## Escalation Triggers
- Key messaging rejected by stakeholders
- Conflicting messages from different project channels
- Messaging accuracy challenged
- Audience not responding to communications

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before writing to understand persuasion frameworks | `references/body-of-knowledge.md` |
| State of the Art | When exploring modern communication techniques | `references/state-of-the-art.md` |
| Knowledge Graph | To link copywriting to stakeholder and communication plan | `references/knowledge-graph.mmd` |
| Use Case Prompts | When crafting messages for specific audiences | `prompts/use-case-prompts.md` |
| Metaprompts | To generate messaging matrix templates | `prompts/metaprompts.md` |
| Sample Output | To calibrate expected messaging quality | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
