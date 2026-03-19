---
name: apex-kickoff-package
description: >
  Use when the user asks to "prepare kickoff", "create kickoff deck",
  "plan team alignment", "design project launch meeting", "build team charter",
  or mentions kickoff package, project kickoff, team alignment meeting, ground rules,
  team charter. Triggers on: creates kickoff presentation deck, designs team alignment
  agenda, facilitates ground rules agreement, produces communication quick-reference,
  compiles team charter from kickoff outcomes.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Kickoff Package & Team Alignment

**TL;DR**: Produces a complete kickoff package including presentation deck, agenda, team charter, ground rules, communication protocols, and action items. The kickoff sets the tone for the entire project — it aligns the team around objectives, methodology, expectations, and ways of working.

## Principio Rector
El kickoff no es una presentación — es un ritual de alineación. En 90 minutos, el equipo debe salir sabiendo: por qué existimos (purpose), qué haremos (scope), cómo trabajaremos (methodology), quién hace qué (roles), y qué esperamos de cada uno (ground rules). Un kickoff mediocre produce meses de desalineación.

## Assumptions & Limits
- Assumes project charter is approved before kickoff — kickoff without approved charter creates false starts [SUPUESTO]
- Assumes key team members and sponsor are available for the session [STAKEHOLDER]
- Breaks if team size exceeds 25 people — large teams need breakout format; single-room kickoff loses effectiveness [PLAN]
- Scope limited to kickoff design and facilitation materials; actual facilitation is a separate engagement [PLAN]
- Does not replace detailed methodology training — kickoff provides overview, training follows [PLAN]

## Usage
```bash
/pm:kickoff-package $PROJECT_NAME --format=presentation
/pm:kickoff-package $PROJECT_NAME --format=full --duration=120min
/pm:kickoff-package $PROJECT_NAME --format=remote --breakouts=3
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT_NAME` | Yes | Target project identifier |
| `--format` | No | `presentation` / `full` / `remote` (default: `full`) |
| `--duration` | No | Session duration (default: `90min`) |
| `--breakouts` | No | Number of breakout groups for large teams |

## Service Type Routing
`{TIPO_PROYECTO}`: Agile kickoffs focus on team norms and first sprint planning; Waterfall kickoffs are formal with detailed plan review; SAFe kickoffs prepare for first PI Planning; Transformation kickoffs emphasize vision and change.

## Before Preparing Kickoff
1. Read approved `project-charter` — all kickoff content derives from the charter [PLAN]
2. Glob `*raci*` and `*stakeholder*` — confirm roles and attendee list [STAKEHOLDER]
3. Read `methodology-playbook` — kickoff must introduce the selected methodology [PLAN]
4. Confirm sponsor availability — sponsor opening remarks set authority tone [STAKEHOLDER]

## Entrada (Input Requirements)
- Approved project charter
- Team roster and roles
- Methodology selection
- Key stakeholders list
- Communication plan

## Proceso (Protocol)
1. **Agenda design** — Create structured kickoff agenda (90-120 minutes)
2. **Purpose & context** — Prepare project context and why-it-matters narrative
3. **Scope overview** — Summarize scope, objectives, and success criteria
4. **Team introductions** — Plan team introduction activity
5. **Methodology overview** — Present how the team will work
6. **Roles & responsibilities** — Present RACI highlights
7. **Ground rules** — Facilitate team agreement on working norms
8. **Communication protocols** — Present communication plan highlights
9. **First actions** — Define immediate next steps and action items
10. **Team charter** — Compile team charter from kickoff agreements

## Edge Cases
1. **Key team members unable to attend** — Record session; schedule 1:1 alignment for absentees within 48 hours; do not postpone kickoff indefinitely.
2. **Sponsor not available for opening** — Pre-record sponsor message or have delegate read sponsor's statement; document sponsor alignment separately.
3. **Team exceeds 25 people** — Use breakout format with sub-team activities; plenary for context and closing only.
4. **Charter not approved before kickoff date** — Conduct "pre-kickoff alignment" session with draft charter; schedule formal kickoff after approval.

## Example: Good vs Bad

**Good Kickoff Package:**
| Attribute | Value |
|-----------|-------|
| Agenda | 90 min structured: 15 context, 20 scope, 10 intros, 15 methodology, 15 ground rules, 15 actions [SCHEDULE] |
| Sponsor opening | 5-minute why-it-matters from executive sponsor [STAKEHOLDER] |
| Ground rules | Team-generated and agreed, documented in team charter [PLAN] |
| Action items | 8 specific next steps with owners and deadlines [SCHEDULE] |
| Team charter | Compiled from kickoff agreements, distributed within 24h [PLAN] |

**Bad Kickoff Package:**
A 3-hour meeting where the PM reads the project plan slide by slide. No team interaction, no ground rules discussion, no action items. Team leaves confused about what to do Monday morning.

## Salida (Deliverables)
- Kickoff presentation deck
- Kickoff agenda with time allocations
- Team charter with ground rules
- Action items list with owners
- Communication quick-reference card

## Validation Gate
- [ ] All kickoff content traces to approved charter — no unapproved scope presented
- [ ] Agenda fits within allocated time with buffer for discussion
- [ ] Every attendee's role is clear before leaving the session
- [ ] Ground rules are team-generated, not PM-imposed
- [ ] Action items have specific owners and deadlines, not "TBD"
- [ ] Communication protocols documented in quick-reference format
- [ ] Team charter captures methodology overview, norms, and agreements
- [ ] Key risks shared with team — not hidden for later surprise
- [ ] Presentation clear for all audience levels (technical and non-technical)
- [ ] Kickoff sets the methodology tone — agile kickoffs feel agile, not waterfall

## Escalation Triggers
- Key team members unable to attend kickoff
- Sponsor not available for opening remarks
- Charter not approved before kickoff date
- Team size exceeds effective kickoff format

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
