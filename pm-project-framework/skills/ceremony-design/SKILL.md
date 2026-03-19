---
name: apex-ceremony-design
description: >
  Use when the user asks to "design ceremonies", "plan meeting cadence",
  "create facilitation guides", "define ceremony templates", or "optimize meeting calendar".
  Activates when a stakeholder needs to design a complete ceremony calendar, define time-boxes
  and agendas per ceremony, create facilitation guides, identify ceremony anti-patterns,
  or measure ceremony effectiveness across the project lifecycle.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Ceremony Cadence & Facilitation Design

**TL;DR**: Designs the complete ceremony calendar including cadence, time-boxes, agendas, facilitation guides, and templates for all project ceremonies. Adapts to selected methodology (Scrum events, Kanban cadences, SAFe ceremonies, or waterfall reviews) while ensuring each ceremony has a clear purpose, defined participants, and measurable outcomes.

## Principio Rector
Las ceremonias son el sistema nervioso del proyecto — transmiten información, generan alineación, y catalizan decisiones. Una ceremonia sin propósito claro es una reunión disfrazada. Cada ceremonia debe responder: qué decisión se toma aquí que no puede tomarse de otra forma.

## Assumptions & Limits
- Assumes a methodology has been selected (from `methodology-assessment`) [SUPUESTO]
- Assumes team structure and time zones are known for calendar feasibility [PLAN]
- Breaks when stakeholder availability is completely unknown — calendar becomes aspirational
- Does not facilitate ceremonies — that is the role of `ceremony-facilitation`
- Ceremony design for distributed teams requires explicit time-zone overlap analysis
- Anti-pattern catalog is based on common patterns; organization-specific anti-patterns require observation

## Usage

```bash
# Design full ceremony calendar for a Scrum project
/pm:ceremony-design $PROJECT --type=full --methodology="scrum"

# Design ceremony calendar for SAFe ART
/pm:ceremony-design $PROJECT --type=full --methodology="safe" --level="art"

# Generate anti-pattern catalog for existing ceremonies
/pm:ceremony-design $PROJECT --type=anti-patterns --current="true"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project identifier |
| `--type` | Yes | `full`, `single-ceremony`, `anti-patterns`, `effectiveness` |
| `--methodology` | No | `scrum`, `kanban`, `safe`, `waterfall`, `hybrid` |
| `--level` | No | Organizational level (team, art, portfolio) |
| `--current` | No | Analyze current ceremonies (true/false) |

## Service Type Routing
`{TIPO_PROYECTO}`: Scrum projects get 5 events; Kanban gets 7 cadences; SAFe adds PI-level events; Waterfall gets phase reviews; Hybrid blends based on component approach.

## Before Designing

1. **Read** the methodology assessment to confirm the selected framework and its ceremony requirements
2. **Read** team structure and organizational calendar to identify availability constraints
3. **Glob** `skills/ceremony-design/references/*.md` for ceremony templates and best practices
4. **Grep** for existing meeting schedules or ceremony feedback from retrospectives

## Entrada (Input Requirements)
- Selected methodology (from `methodology-assessment`)
- Team structure and time zones
- Stakeholder availability constraints
- Organizational calendar and meeting culture
- Tool preferences (virtual/in-person/hybrid)

## Proceso (Protocol)
1. **List required ceremonies** — Based on selected methodology, identify all mandatory and optional ceremonies
2. **Define purpose** — Document the specific purpose and expected outcome of each ceremony
3. **Set cadence and time-box** — Assign frequency and duration respecting methodology guidelines
4. **Design agendas** — Create structured agendas with time allocations per section
5. **Identify participants** — Define required and optional attendees per ceremony
6. **Create facilitation guides** — Document facilitation techniques, opening/closing rituals
7. **Design templates** — Create artifacts (boards, documents) needed during ceremonies
8. **Calendar integration** — Build unified calendar view showing all ceremonies
9. **Anti-pattern guide** — Document common ceremony anti-patterns and how to avoid them
10. **Effectiveness metrics** — Define how to measure ceremony value (NPS, action item completion)

## Edge Cases

1. **Distributed team across >3 time zones**: Design asynchronous ceremony alternatives (async standups, recorded demos). Require ≥2 hours overlap for synchronous ceremonies. [PLAN]
2. **Ceremony fatigue reported by team**: Audit ceremony hours vs. productive hours ratio. Target ≤15% of team time in ceremonies. Merge or eliminate low-value ceremonies. [METRIC]
3. **Stakeholders unable to attend mandatory ceremonies**: Design asynchronous input mechanism (pre-recorded updates, async voting). Never skip ceremony — adapt format. [STAKEHOLDER]
4. **Methodology requires ceremony but team finds no value**: Document team feedback. Propose experiment: modify format for 3 cycles, measure effectiveness, decide to keep/modify/drop. [PLAN]

## Example: Good vs Bad

**Good Ceremony Design:**

| Attribute | Value |
|-----------|-------|
| Ceremonies defined | All methodology-required + 2 optional |
| Purpose per ceremony | Specific decision or outcome documented |
| Time-boxes | Aligned with methodology guidelines |
| Agendas | Structured with time allocations per section |
| Participants | Required vs optional clearly defined |
| Anti-patterns | ≥5 identified with prevention measures |

**Bad Ceremony Design:**
A calendar with "Team Meeting - Monday 9am" and "Status Update - Friday 3pm" without purpose, agenda, participants, or time-boxes. No methodology alignment. No anti-pattern awareness. Fails because unnamed meetings without purpose become status-reporting rituals that consume time without producing decisions.

## Validation Gate
- [ ] Every methodology-required ceremony is included — no mandatory ceremony omitted
- [ ] Each ceremony has documented purpose stating what decision or outcome it produces
- [ ] Time-boxes respect methodology guidelines (e.g., Sprint Review ≤4h for 4-week sprint)
- [ ] Structured agendas with time allocations per section for every ceremony
- [ ] Required vs optional participants defined — no ceremony with "everyone invited"
- [ ] Calendar view shows no ceremony conflicts across the full cadence
- [ ] ≥5 anti-patterns documented with prevention measures
- [ ] Ceremony effectiveness metrics defined (NPS, action completion rate)
- [ ] Stakeholders see cadence rationale aligned with their information needs [STAKEHOLDER]
- [ ] Ceremonies true to framework principles, not ceremonial theater [PLAN]

## Escalation Triggers
- Calendar conflicts preventing required ceremonies
- Key stakeholders unable to attend mandatory ceremonies
- Ceremony fatigue reported by team
- Ceremonies not producing intended outcomes after 3 cycles

## Salida (Deliverables)

- Primary deliverable: ceremony playbook with cadence calendar
- All outputs tagged with evidence markers
- Mermaid diagrams where applicable
- Executive summary for stakeholder consumption

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before designing to understand ceremony frameworks | `references/body-of-knowledge.md` |
| State of the Art | When exploring innovative ceremony formats | `references/state-of-the-art.md` |
| Knowledge Graph | To link ceremonies to methodology and facilitation | `references/knowledge-graph.mmd` |
| Use Case Prompts | When scoping ceremony requirements | `prompts/use-case-prompts.md` |
| Metaprompts | To generate ceremony card templates | `prompts/metaprompts.md` |
| Sample Output | To calibrate expected ceremony design format | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
