---
name: apex-staff-augmentation-plan
description: >
  Use when the user asks to "plan staff augmentation", "source external resources",
  "plan contractor onboarding", "design nearshore team integration", "manage vendor staffing",
  or mentions staff augmentation, contractor sourcing, augmentation needs, external staffing,
  nearshore/offshore, resource augmentation strategy.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Staff Augmentation Planning

**TL;DR**: Plans staff augmentation needs including role definitions, sourcing strategy, onboarding requirements, governance model, and exit criteria. Ensures augmented staff integrate seamlessly with internal teams while maintaining knowledge transfer and IP protection.

## Principio Rector
El staff augmentation no es "contratar freelancers" — es integrar talento externo como extensión del equipo. Los tres riesgos principales son: integración deficiente (equipo paralelo), dependencia de conocimiento (vendor lock-in humano), y pérdida de IP. Un buen plan de augmentation mitiga los tres.

## Assumptions & Limits
- Assumes skills gap analysis identifies specific gaps requiring external talent [PLAN]
- Assumes organizational augmentation policies and vendor relationships exist [SUPUESTO]
- Breaks when augmentation is used to avoid hiring for permanent needs — creates long-term dependency
- Does not select vendors; plans the augmentation structure. Use procurement for vendor selection
- Assumes budget for external resources is approved or approvable [SUPUESTO]
- Limited to staff augmentation model; for managed services or outsourcing use different skill

## Usage

```bash
# Full augmentation plan
/pm:staff-augmentation-plan $ARGUMENTS="--gaps skills-gap.md --budget '24 FTE-months'"

# Onboarding design only
/pm:staff-augmentation-plan --type onboarding --roles "3 backend, 2 QA"

# Exit planning for current augmented staff
/pm:staff-augmentation-plan --type exit --staff current-augmentation.md
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Path to skills gap analysis or resource needs |
| `--type` | No | `full` (default), `onboarding`, `exit`, `governance` |
| `--budget` | No | Budget in FTE-months for augmentation |
| `--roles` | No | Role descriptions for augmentation |
| `--model` | No | `onsite`, `remote`, `nearshore`, `offshore`, `hybrid` |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Augmented members join cross-functional teams; pair programming and knowledge transfer built into sprint cadence
- **Waterfall**: Role-based augmentation per work package; formal knowledge transfer milestones and handover documentation
- **SAFe**: ART-level augmentation with Scrum Masters, RTEs, or specialized engineers; PI boundary ramp-up/ramp-down planning
- **Transformation**: Augmentation with coaches, change managers, and organizational development specialists
- **Recovery**: Emergency augmentation for troubled projects; rapid deployment with crisis context briefing and clear exit criteria

## Before Planning Augmentation
1. **Read** the skills gap analysis to understand specific capability needs [PLAN]
2. **Read** the resource plan to identify internal gaps that cannot be filled [PLAN]
3. **Glob** `**/vendor*` or `**/procurement*` to find existing vendor relationships [PLAN]
4. **Grep** for augmentation-related lessons learned from prior projects [INFERENCIA]

## Entrada (Input Requirements)
- Skills gap analysis (from `skills-gap-analysis`)
- Resource plan with gaps
- Organizational augmentation policies
- Budget for external resources
- Timeline for resource needs

## Proceso (Protocol)
1. **Needs definition** — Define specific roles, skills, and duration needed
2. **Sourcing strategy** — Determine sourcing model (on-site, remote, nearshore, offshore)
3. **Vendor selection** — Identify preferred augmentation vendors
4. **Role specifications** — Create detailed role descriptions with technical and soft skill requirements
5. **Integration plan** — Design how augmented staff integrate with internal team
6. **Governance model** — Define reporting, performance review, and escalation for augmented staff
7. **Knowledge transfer** — Plan KT from augmented staff to internal team (prevent lock-in)
8. **IP protection** — Define IP and confidentiality agreements
9. **Exit criteria** — Define when and how augmented staff will transition out
10. **Budget tracking** — Establish augmentation cost tracking mechanism

## Edge Cases
1. **Augmented staff outperform internal team** — Investigate root cause (tooling, process, skills). Use augmented staff expertise for internal capability building, not replacement [STAKEHOLDER].
2. **Knowledge transfer not progressing** — Mandate paired work sessions. Reduce augmented staff scope to force KT. If KT fails, the augmentation creates dependency [PLAN].
3. **Internal team resistance to augmented staff** — Address through joint team-building. Clarify roles and expectations. Ensure augmented staff are treated as team members, not outsiders [STAKEHOLDER].
4. **Augmentation extending beyond planned duration** — Trigger exit planning review. Assess whether gap has become permanent (hire instead). Document augmentation cost trend [METRIC].

## Example: Good vs Bad

**Good example — Integrated augmentation plan:**

| Attribute | Value |
|-----------|-------|
| Roles | 3 roles with detailed specs (tech + soft skills) |
| Model | Nearshore remote with 4-hour timezone overlap |
| Integration | Sprint ceremonies, shared channels, pair programming |
| KT plan | Weekly KT sessions, documentation requirements |
| Exit criteria | 3 conditions: internal hire ready, KT complete, sprint velocity maintained |
| IP | NDA + IP assignment agreement per augmented resource |

**Bad example — Body shopping:**
"We need 5 developers, any skill level, ASAP." No role specifications, no integration plan, no KT requirements, no exit criteria. Augmentation without integration creates parallel teams. Without KT, departure creates knowledge holes.

## Salida (Deliverables)
- Staff augmentation plan
- Role specification documents
- Integration and onboarding checklist
- Knowledge transfer schedule
- Exit transition plan

## Validation Gate
- [ ] Every augmented role has detailed specification (tech + soft skills) [PLAN]
- [ ] Sourcing model justified with timezone/collaboration requirements [PLAN]
- [ ] Integration plan includes sprint ceremonies and communication channels [PLAN]
- [ ] Knowledge transfer schedule with milestones and verification [SCHEDULE]
- [ ] Exit criteria defined with measurable conditions [METRIC]
- [ ] IP protection agreements specified per role [PLAN]
- [ ] Budget tracked in FTE-months (never absolute prices) [METRIC]
- [ ] Governance model defines performance review cadence [PLAN]
- [ ] Evidence ratio: ≥75% [PLAN], <25% [SUPUESTO]
- [ ] Internal team engagement plan for smooth integration [STAKEHOLDER]

## Escalation Triggers
- Augmentation cost exceeding budget by > 15%
- Quality of augmented staff below requirements
- Knowledge transfer not progressing per plan
- Internal team resistance to augmented staff

## Additional Resources

| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | Staff augmentation models and governance | `references/body-of-knowledge.md` |
| State of the Art | Modern distributed team practices | `references/state-of-the-art.md` |
| Knowledge Graph | Augmentation in resource planning | `references/knowledge-graph.mmd` |
| Use Case Prompts | Augmentation scenarios | `prompts/use-case-prompts.md` |
| Metaprompts | Custom augmentation frameworks | `prompts/metaprompts.md` |
| Sample Output | Reference augmentation plan | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
