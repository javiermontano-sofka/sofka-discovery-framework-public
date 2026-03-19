---
name: apex-onboarding-playbook
description: >
  Use when the user asks to "create onboarding plan", "plan knowledge transfer",
  "design team onboarding", "reduce ramp-up time", "capture institutional knowledge",
  or mentions onboarding playbook, knowledge transfer, new team member ramp-up,
  team integration. Triggers on: creates role-specific onboarding paths, designs knowledge
  transfer sessions, establishes buddy system, defines ramp-up milestones, captures
  institutional knowledge for preservation.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Team Onboarding & Knowledge Transfer Playbook

**TL;DR**: Creates structured onboarding playbooks for new team members including role-specific learning paths, knowledge transfer sessions, buddy system design, and ramp-up milestones. Reduces time-to-productivity and preserves institutional knowledge through systematic knowledge transfer protocols.

## Principio Rector
Cada persona nueva que llega al proyecto sin onboarding estructurado consume capacidad del equipo existente de forma caótica. Un playbook de onboarding transforma el ramp-up de un evento aleatorio a un proceso predecible con milestones verificables. El costo de un buen onboarding se recupera en semanas; el costo de un mal onboarding se paga durante meses.

## Assumptions & Limits
- Assumes team structure and role definitions are stable — frequent reorgs undermine onboarding investment [SUPUESTO]
- Assumes knowledge owners are available for transfer sessions [STAKEHOLDER]
- Breaks if critical knowledge lives only in one person's head with no documentation — knowledge extraction must precede onboarding design [PLAN]
- Scope limited to project-level onboarding; organizational HR onboarding is separate [PLAN]
- Does not replace methodology training — references methodology playbook for process training [PLAN]

## Usage
```bash
/pm:onboarding-playbook $PROJECT_NAME --role=developer
/pm:onboarding-playbook $PROJECT_NAME --role=all --include=buddy-system
/pm:onboarding-playbook $PROJECT_NAME --role=pm --ramp-up=30days
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT_NAME` | Yes | Target project identifier |
| `--role` | No | `developer` / `analyst` / `pm` / `qa` / `all` (default: `all`) |
| `--include` | No | `buddy-system` / `knowledge-map` / `access-checklist` / `all` |
| `--ramp-up` | No | Target ramp-up period (default: `30days`) |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Onboarding to ceremonies, backlog, Definition of Done, and team working agreements; pair programming buddy system
- **Waterfall**: Formal onboarding to project plan, RACI, deliverable templates, and phase-gate procedures
- **SAFe**: ART-level onboarding covering PI cadence, team ceremonies, system demo expectations, and cross-team coordination
- **Kanban**: Onboarding to board policies, WIP limits, service classes, and flow metrics; shadowing through work item lifecycle
- **Transformation**: Onboarding includes change management context, stakeholder map orientation, and ADKAR awareness training
- **Recovery**: Accelerated onboarding for rescue team members; crisis context briefing and immediate priority alignment

## Before Creating Onboarding
1. Read `team-performance` and role definitions — understand current team structure [STAKEHOLDER]
2. Glob `*methodology-playbook*` — onboarding must reference the active methodology [PLAN]
3. Read tool ecosystem — compile access requirements list [PLAN]
4. Identify knowledge owners — map who holds critical knowledge for transfer sessions [STAKEHOLDER]

## Entrada (Input Requirements)
- Team structure and role definitions
- Project methodology and processes
- Tool ecosystem and access requirements
- Key project knowledge and context documents
- Buddy/mentor availability

## Proceso (Protocol)
1. **Role-specific paths** — Design learning path per role (PM, developer, analyst, QA)
2. **Knowledge map** — Identify critical knowledge areas and their owners
3. **Session design** — Plan knowledge transfer sessions (who teaches what when)
4. **Buddy assignment** — Pair new members with experienced buddies
5. **Access checklist** — Create tool, system, and document access checklist
6. **Milestone definition** — Define ramp-up milestones (day 1, week 1, week 2, month 1)
7. **Self-service resources** — Curate reading list and reference documentation
8. **Feedback loops** — Plan check-ins to assess onboarding effectiveness
9. **Institutional knowledge capture** — Document tacit knowledge that lives only in people's heads
10. **Playbook compilation** — Assemble role-specific onboarding playbooks

## Edge Cases
1. **Knowledge owner leaving before transfer complete** — Prioritize critical knowledge extraction; schedule intensive transfer sessions; document everything in written form as backup.
2. **New member joining mid-sprint or mid-phase** — Design "fast-track" onboarding that aligns with current cycle; defer deep-dive topics to next cycle boundary.
3. **Remote onboarding with no physical co-location** — Increase buddy check-in frequency; use video for all transfer sessions; create virtual "hallway" channel for informal questions.
4. **Multiple new members joining simultaneously** — Group onboarding for shared content; individual paths for role-specific knowledge; avoid overloading knowledge owners.

## Example: Good vs Bad

**Good Onboarding Playbook:**
| Attribute | Value |
|-----------|-------|
| Learning paths | 4 role-specific paths with daily activities for first 2 weeks [SCHEDULE] |
| Knowledge map | 12 knowledge areas mapped to 6 owners [STAKEHOLDER] |
| Ramp-up milestones | Day 1: environment setup; Week 1: first contribution; Month 1: independent delivery [SCHEDULE] |
| Buddy system | 1:1 pairing with daily 15-min check-ins for first 2 weeks [PLAN] |
| Access checklist | 18 tool/system access items with request process documented [PLAN] |

**Bad Onboarding Playbook:**
"Read the wiki and ask questions." — No structure, no milestones, no buddy, no knowledge transfer plan. New member wastes 2 weeks figuring things out while disrupting experienced team members randomly.

## Salida (Deliverables)
- Onboarding playbook per role
- Knowledge transfer schedule
- Access and setup checklist
- Ramp-up milestone tracker
- Buddy system guidelines

## Validation Gate
- [ ] Every role has a specific learning path — no one-size-fits-all onboarding
- [ ] Access requirements current and complete — verified against active tool ecosystem
- [ ] All critical knowledge areas covered with identified transfer owners
- [ ] Ramp-up milestones defined with measurable completion criteria
- [ ] New member can self-start on day 1 with the playbook alone
- [ ] Buddy assigned with defined check-in frequency and duration
- [ ] Knowledge transfer sessions scheduled with specific topics and owners
- [ ] Key-person knowledge risks addressed through documentation or cross-training
- [ ] Feedback mechanism captures onboarding effectiveness for continuous improvement
- [ ] Onboarding includes methodology-specific training aligned with project playbook

## Escalation Triggers
- Knowledge owner unavailable for transfer sessions
- Critical knowledge not documented anywhere
- New member not meeting ramp-up milestones
- Team lacking capacity to support onboarding

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
