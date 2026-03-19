---
name: apex-ceremony-facilitation
description: >
  Use when the user asks to "facilitate a ceremony", "run a retrospective",
  "lead sprint planning", "moderate a meeting", or "design facilitation techniques".
  Activates when a stakeholder needs facilitation guides for project ceremonies, engagement
  techniques for team workshops, conflict navigation protocols for heated discussions,
  anti-pattern recognition during ceremony execution, or ceremony effectiveness measurement.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Ceremony Facilitation Guides

**TL;DR**: Provides detailed facilitation guides for project ceremonies including opening/closing rituals, facilitation techniques, engagement activities, time management, and anti-pattern recognition. Each guide enables any team member to facilitate effectively, not just the Scrum Master or PM.

## Principio Rector
La facilitación no es moderación — es el arte de crear las condiciones para que el grupo alcance mejores conclusiones que cualquier individuo. Un buen facilitador no tiene opinión en la discusión; tiene expertise en el proceso de discusión. La neutralidad es el superpoder del facilitador.

## Assumptions & Limits
- Assumes ceremony design exists with defined purpose, participants, and agendas [SUPUESTO]
- Assumes facilitator has reviewed the guide before the ceremony [PLAN]
- Breaks when team size exceeds facilitation technique capacity (>15 for most techniques)
- Virtual facilitation requires different techniques than in-person — specify format upfront
- Does not replace facilitator skill development — guides are aids, not substitutes for practice
- Engagement techniques assume psychological safety; toxic environments need intervention first

## Usage

```bash
# Generate facilitation guide for sprint retrospective
/pm:ceremony-facilitation $PROJECT --ceremony="retrospective" --format="virtual"

# Generate engagement technique cards for PI Planning
/pm:ceremony-facilitation $PROJECT --ceremony="pi-planning" --team-size=50

# Generate anti-pattern recognition guide
/pm:ceremony-facilitation $PROJECT --type=anti-patterns --ceremony="all"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project identifier |
| `--ceremony` | Yes | Ceremony type (retrospective, planning, review, standup, pi-planning, all) |
| `--format` | No | `virtual`, `in-person`, `hybrid` |
| `--team-size` | No | Number of participants for technique selection |
| `--type` | No | `guide`, `techniques`, `anti-patterns` |

## Service Type Routing
`{TIPO_PROYECTO}`: Scrum ceremonies get specific facilitation techniques per event; Kanban cadences use flow-focused facilitation; SAFe PI Planning requires large-group facilitation; Waterfall reviews use formal presentation facilitation.

## Before Facilitating

1. **Read** the ceremony design document to understand purpose, agenda, and expected outcomes
2. **Read** team composition data to select appropriate engagement techniques for group size
3. **Glob** `skills/ceremony-facilitation/references/*.md` for technique libraries and anti-pattern catalogs
4. **Grep** for previous ceremony feedback to identify recurring facilitation challenges

## Entrada (Input Requirements)
- Ceremony design and calendar (from `ceremony-design`)
- Team composition and dynamics
- Facilitation skill level of team
- Virtual/in-person/hybrid meeting format
- Previous ceremony effectiveness feedback

## Proceso (Protocol)
1. **Ceremony selection** — Identify which ceremony needs facilitation support
2. **Preparation checklist** — Create pre-ceremony preparation list (materials, data, participants)
3. **Opening design** — Design check-in activity to set tone and focus
4. **Agenda facilitation** — Create time-boxed agenda with facilitation notes per section
5. **Engagement techniques** — Select techniques (dot voting, 1-2-4-all, silent brainstorming, fishbowl)
6. **Conflict navigation** — Prepare approaches for common conflicts or disagreements
7. **Decision protocol** — Define how decisions will be made (consensus, consent, majority)
8. **Closing design** — Design check-out and action item capture
9. **Anti-pattern alerts** — Document common facilitation anti-patterns to avoid
10. **Feedback mechanism** — Plan how to gather ceremony effectiveness feedback

## Edge Cases

1. **Virtual ceremony with cameras off**: Design engagement that does not rely on visual cues. Use polls, chat, and round-robin verbal check-ins. Time-box responses to prevent silence. [PLAN]
2. **Dominant personality controlling discussion**: Use structured techniques (silent brainstorming, round-robin) that equalize voice. Facilitate explicitly: "Let's hear from someone who hasn't spoken yet." [STAKEHOLDER]
3. **Team of >15 people in a single ceremony**: Split into breakout groups of 4-5. Use 1-2-4-all structure. Reconvene for synthesis. Never facilitate open discussion with >10 people. [PLAN]
4. **Ceremony consistently runs over time**: Review agenda time allocations. Identify which section overruns. Apply stricter time-boxing with visible timer. Parking lot off-topic items. [METRIC]

## Example: Good vs Bad

**Good Facilitation Guide:**

| Attribute | Value |
|-----------|-------|
| Preparation checklist | 8 items with responsible parties |
| Opening design | Check-in activity with 5-minute time-box |
| Engagement techniques | 3 techniques selected for group size |
| Conflict protocol | Specific de-escalation steps documented |
| Decision method | Consent-based with fallback to majority |
| Closing | Action item capture + ceremony NPS poll |

**Bad Facilitation Guide:**
A document that says "run the meeting according to the agenda." No opening activity, no engagement techniques, no conflict protocol, no decision method, no closing ritual. Fails because it provides no facilitation value — any meeting can be "run according to the agenda" but few produce meaningful outcomes without deliberate facilitation design.

## Validation Gate
- [ ] Every ceremony guide includes preparation checklist with ≥5 pre-ceremony items
- [ ] Opening check-in activity designed with specific time-box (≤10% of total ceremony time)
- [ ] ≥2 engagement techniques selected per ceremony, appropriate for group size and format
- [ ] Conflict navigation protocol includes ≥2 de-escalation approaches
- [ ] Decision protocol explicitly stated (consensus, consent, majority, or authority)
- [ ] Closing includes action item capture mechanism and ceremony feedback collection
- [ ] Anti-pattern alerts include ≥3 patterns with specific facilitator responses
- [ ] Guide usable by any team member, not just Scrum Master or PM
- [ ] Ceremonies produce meaningful outcomes visible to stakeholders [STAKEHOLDER]
- [ ] Facilitation fits methodology spirit, not just ceremony mechanics [PLAN]

## Escalation Triggers
- Ceremonies consistently not achieving objectives
- Team disengagement increasing
- Facilitation skills insufficient across team
- Virtual facilitation tools unavailable

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before designing guides to understand facilitation theory | `references/body-of-knowledge.md` |
| State of the Art | When exploring new engagement techniques | `references/state-of-the-art.md` |
| Knowledge Graph | To link facilitation to ceremony design | `references/knowledge-graph.mmd` |
| Use Case Prompts | When selecting techniques for specific ceremonies | `prompts/use-case-prompts.md` |
| Metaprompts | To generate custom facilitation guides | `prompts/metaprompts.md` |
| Sample Output | To calibrate expected facilitation guide format | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
