---
name: apex-methodology-playbook
description: >
  Use when the user asks to "create a methodology playbook", "define project ceremonies",
  "design cadences and rituals", "build a Definition of Done", "operationalize methodology",
  or mentions methodology playbook, ceremony design, cadence definition, methodology selection,
  DoD, project rituals. Triggers on: codifies methodology into actionable playbook, designs
  ceremonies with agendas and durations, creates Definition of Done per deliverable type,
  maps roles to ceremonies, produces ceremony calendar.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Methodology Playbook

**TL;DR**: Core Phase 4 deliverable that codifies the selected methodology into an actionable playbook: ceremonies with agendas and durations, cadences with frequencies and participants, Definition of Done per deliverable type, escalation protocols, and role responsibilities. Transforms methodology selection from a slide deck decision into an operational contract the team can execute.

## Principio Rector
Una metodología seleccionada pero no operacionalizada es un powerpoint, no un proceso. El playbook convierte la decisión metodológica en un contrato operativo con ceremonias concretas, cadencias definidas y criterios de completitud medibles. Si el equipo no puede abrir el playbook el lunes y saber exactamente qué hacer, el playbook falla.

## Assumptions & Limits
- Assumes methodology has been selected via `methodology-assessment` or stakeholder decision [SUPUESTO]
- Assumes team structure and availability are known for ceremony scheduling [STAKEHOLDER]
- Breaks if methodology selection was not evidence-based — playbook operationalizes a decision; it cannot fix a bad decision [PLAN]
- Scope limited to playbook creation; ongoing methodology coaching is separate [PLAN]
- Does not override organizational ceremony mandates — adapts within constraints [PLAN]

## Usage
```bash
/pm:methodology-playbook $PROJECT_NAME --methodology=scrum
/pm:methodology-playbook $PROJECT_NAME --methodology=hybrid --include=dod,ceremonies,cadences
/pm:methodology-playbook $PROJECT_NAME --methodology=safe --team-count=6
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT_NAME` | Yes | Target project identifier |
| `--methodology` | Yes | `scrum` / `kanban` / `safe` / `waterfall` / `hybrid` |
| `--include` | No | `dod` / `ceremonies` / `cadences` / `all` (default: `all`) |
| `--team-count` | No | Number of teams for multi-team ceremony design |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Sprint ceremonies (planning, daily, review, retro), backlog cadences, DoD per story type
- **Waterfall**: Phase-gate ceremonies, milestone reviews, deliverable approval cadences, phase DoD
- **SAFe**: PI planning, ART sync, system demo, I&A, Scrum of Scrums cadences, multi-level DoD
- **Kanban**: Replenishment, delivery planning, standup, ops review, strategy review cadences
- **Hybrid**: Integrated ceremony calendar combining iterative and sequential rituals
- **PMO**: Standard ceremony catalog for governed projects, governance review cadences
- **Portfolio**: Investment review, portfolio rebalancing, strategic alignment cadences
- **Transformation**: Change management cadences, adoption pulse checks, readiness reviews

## Before Creating Playbook
1. Read `methodology-assessment` — confirm methodology selection and rationale [PLAN]
2. Glob `*team*` and `*resource*` — understand team size, distribution, and time zones [STAKEHOLDER]
3. Read organizational constraints — blackout periods, existing meetings, governance cadences [SCHEDULE]
4. Review stakeholder availability — governance ceremonies need sponsor participation [STAKEHOLDER]

## Entrada (Input Requirements)
- Selected methodology (from methodology assessment or stakeholder decision)
- Team size, distribution, and time zones
- Project duration and phase structure
- Organizational constraints (existing meetings, blackout periods)
- Stakeholder availability and governance requirements

## Proceso (Protocol)
1. **Methodology confirmation** — Validate selected methodology and any customization constraints
2. **Ceremony catalog** — Define all ceremonies with purpose, agenda, duration, frequency, participants
3. **Cadence calendar** — Design recurring cadence calendar (weekly, bi-weekly, PI-level)
4. **DoD definition** — Create Definition of Done per deliverable type and acceptance criteria
5. **Role mapping** — Map ceremony roles to project team members
6. **Artifact specification** — Define inputs and outputs for each ceremony
7. **Escalation protocol** — Design escalation paths when ceremonies reveal blockers
8. **Tool mapping** — Specify which tools support each ceremony and cadence
9. **Adaptation rules** — Define when and how to modify ceremonies based on team feedback
10. **Playbook compilation** — Assemble comprehensive, searchable playbook document

## Edge Cases
1. **Team distributed across 3+ time zones** — Design asynchronous components for every ceremony; limit synchronous time to decisions-only; define "follow-the-sun" cadence.
2. **Ceremony calendar creates meeting overload (above 20%)** — Reduce frequency or combine ceremonies; prioritize value-adding ceremonies; cut reporting-only meetings.
3. **DoD criteria conflict with contractual acceptance criteria** — Map contractual requirements into DoD; where conflict exists, contractual criteria take precedence with documented rationale.
4. **Team size changes mid-project** — Include adaptation rules in playbook; define thresholds where ceremony format must change (e.g., above 12 people split into sub-teams).

## Example: Good vs Bad

**Good Methodology Playbook:**
| Attribute | Value |
|-----------|-------|
| Ceremonies | 7 ceremonies defined with purpose, agenda, duration, frequency, participants [SCHEDULE] |
| Cadence calendar | Visual calendar importable to team calendars [SCHEDULE] |
| DoD matrix | DoD per deliverable type (story, feature, epic) with measurable criteria [PLAN] |
| Role mapping | Every ceremony role mapped to named team member [STAKEHOLDER] |
| Adaptation rules | 4 triggers for ceremony modification with team retrospective input [PLAN] |

**Bad Methodology Playbook:**
"We will follow Scrum." — No ceremony details, no cadence calendar, no DoD, no role mapping. Team interprets Scrum differently; ceremonies become informal and inconsistent.

## Salida (Deliverables)
- `04_methodology_playbook_{proyecto}_{WIP}.md` — Complete methodology playbook
- Ceremony catalog with agendas and templates
- Cadence calendar (visual, importable to team calendars)
- Definition of Done matrix per deliverable type
- Role-ceremony responsibility matrix

## Validation Gate
- [ ] Every methodology-required ceremony included with purpose, agenda, duration, and frequency
- [ ] Ceremony durations realistic for team size — no 2-hour standups
- [ ] Cadences do not create meeting overload — total ceremony time below 20% of team capacity
- [ ] DoD criteria measurable and testable — no subjective "quality is good enough"
- [ ] Role mapping complete — every ceremony has named facilitator and required participants
- [ ] Artifact inputs/outputs specified per ceremony — no ceremony without defined outputs
- [ ] Escalation protocol handles blockers surfaced in ceremonies
- [ ] Playbook faithful to selected methodology principles — not a generic hybrid
- [ ] Adaptation rules defined — team can modify ceremonies based on retrospective feedback
- [ ] Any team member can execute from the playbook alone without prior methodology training

## Escalation Triggers
- Selected methodology incompatible with organizational constraints
- Team size or distribution makes required ceremonies impractical
- Stakeholder availability prevents governance cadences
- DoD criteria conflict with contractual acceptance criteria

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
