---
name: apex-organizational-change
description: >
  Use when the user asks to "plan change management", "implement ADKAR",
  "manage organizational change", "plan adoption", "design resistance management",
  or mentions OCM, organizational change management, ADKAR, change readiness,
  adoption planning. Triggers on: designs ADKAR-based change interventions,
  assesses change readiness, creates communication campaigns, builds training plans,
  manages resistance through structured interventions, measures adoption KPIs.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Organizational Change Management (OCM)

**TL;DR**: Designs and implements organizational change management using the ADKAR model (Awareness, Desire, Knowledge, Ability, Reinforcement). Covers change impact assessment, stakeholder readiness, communication campaigns, training plans, resistance management, and adoption measurement to ensure project deliverables are actually used.

## Principio Rector
La entrega técnica sin adopción organizacional es un fracaso elegante. ADKAR funciona porque aborda el cambio como un journey individual: primero la persona debe SABER por qué cambiar, luego QUERER cambiar, luego saber CÓMO, luego ser CAPAZ, y finalmente MANTENER el cambio. Saltar pasos es la causa principal de adopción fallida.

## Assumptions & Limits
- Assumes executive sponsor is committed to championing the change visibly [STAKEHOLDER]
- Assumes impacted roles and process changes have been mapped from project scope [SUPUESTO]
- Breaks if organizational culture punishes change failure — fear-based cultures resist all change [STAKEHOLDER]
- Scope limited to project-level OCM; enterprise-wide transformation OCM requires dedicated OCM program [PLAN]
- Does not replace HR change processes — complements them with project-specific interventions [PLAN]
- ADKAR model assumed; other models (Kotter, Bridges) can be mapped but ADKAR is primary [PLAN]

## Usage
```bash
/pm:organizational-change $PROJECT_NAME --model=adkar --phase=assessment
/pm:organizational-change $PROJECT_NAME --phase=plan --audiences=3
/pm:organizational-change $PROJECT_NAME --phase=execute --track=adoption
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT_NAME` | Yes | Target project identifier |
| `--model` | No | `adkar` / `kotter` / `bridges` (default: `adkar`) |
| `--phase` | No | `assessment` / `plan` / `execute` / `reinforce` |
| `--audiences` | No | Number of impacted audience groups |
| `--track` | No | `adoption` / `resistance` / `both` |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Transformation**: Core domain — 70% of effort is change management; ADKAR applied enterprise-wide with dedicated OCM team
- **Agile**: Agile adoption itself is an OCM initiative; coaching, mindset shifts, and ceremony adoption require structured change management
- **SAFe**: PI-cadence change management; Lean-Agile leadership transformation; ADKAR applied to ART-level organizational shifts
- **Waterfall**: OCM as a formal workstream within the project plan; training schedules aligned to phase-gate deliverables
- **Hybrid**: Dual change tracks — process change for predictive components, mindset change for adaptive components
- **Recovery**: Crisis-mode OCM; urgent stakeholder re-engagement; trust rebuilding and resistance resolution for troubled projects

## Before Planning Change
1. Read `stakeholder-register` — identify impacted groups and their current engagement levels [STAKEHOLDER]
2. Glob `*impact*` and `*scope*` — understand what changes and who is affected [PLAN]
3. Read organizational culture data — assess baseline change readiness [STAKEHOLDER]
4. Confirm sponsor availability and commitment — OCM without visible sponsorship fails [STAKEHOLDER]

## Entrada (Input Requirements)
- Project scope and impact assessment
- Stakeholder register and engagement levels
- Current organizational culture assessment
- Impacted roles and process changes
- Historical change success/failure data

## Proceso (Protocol)
1. **Change impact assessment** — Map what changes, who is impacted, and how severely
2. **Readiness assessment** — Evaluate organizational readiness using ADKAR diagnostic
3. **Change strategy** — Define overall change approach (top-down, grassroots, both)
4. **ADKAR plan per audience** — Design interventions for each ADKAR element per impacted group
5. **Communication campaign** — Design awareness and desire-building communication
6. **Training plan** — Create knowledge and ability-building program
7. **Resistance management** — Identify resistance sources and design specific interventions
8. **Champion network** — Recruit and equip change champions in each impacted area
9. **Reinforcement plan** — Design mechanisms to sustain change (incentives, governance, metrics)
10. **Adoption measurement** — Define adoption KPIs and measurement approach

## Edge Cases
1. **Widespread "Desire" gap in ADKAR diagnostic** — Communication alone cannot create desire; identify specific "what's in it for me" per audience; consider pilot success stories as proof points.
2. **Middle management actively resisting** — Design specific middle management intervention; address their legitimate concerns about role changes; they are the change bottleneck.
3. **Change fatigue from multiple concurrent changes** — Consolidate communication; prioritize this change against competing changes; consider sequencing rather than parallel rollout.
4. **Executive sponsor not visibly championing** — Escalate via governance; document impact of invisible sponsorship on adoption metrics; provide specific sponsorship actions roadmap.
5. **Adoption below 50% at target date** — Trigger reinforcement escalation; diagnose which ADKAR element is the barrier; redesign intervention for the specific gap.

## Example: Good vs Bad

**Good OCM Plan:**
| Attribute | Value |
|-----------|-------|
| ADKAR assessment | 3 audience groups assessed across all 5 ADKAR elements [METRIC] |
| Communication campaign | 12-week calendar with weekly messages mapped to ADKAR stages [SCHEDULE] |
| Training plan | Role-specific training for 4 audience groups with proficiency assessment [PLAN] |
| Champion network | 15 champions across 5 departments with monthly enablement [STAKEHOLDER] |
| Adoption KPIs | 3 measurable KPIs with baseline, target, and measurement frequency [METRIC] |

**Bad OCM Plan:**
"We will send an email and schedule training." — No ADKAR assessment, no audience segmentation, no resistance management, no champion network, no adoption measurement. Adoption left to hope.

## Salida (Deliverables)
- `02_ocm_plan_{proyecto}_{WIP}.md` — OCM plan document
- ADKAR assessment and intervention plan
- Communication campaign calendar
- Training program design
- Adoption measurement dashboard
- Resistance management playbook

## Validation Gate
- [ ] Change impacts mapped for every impacted role and process
- [ ] ADKAR assessment completed for every audience group with specific gap identification
- [ ] Communication campaign calendar scheduled with messages mapped to ADKAR stages
- [ ] Training program covers Knowledge and Ability for every impacted audience
- [ ] Resistance sources identified with specific intervention per source
- [ ] Champion network includes at least 1 champion per impacted department
- [ ] Reinforcement mechanisms designed to sustain change beyond initial adoption
- [ ] Adoption KPIs defined with baseline, target, measurement method, and frequency
- [ ] OCM cadence aligned with project timeline — interventions timed to delivery milestones
- [ ] Impacted people feel supported, not coerced — change approach respects human dignity

## Escalation Triggers
- ADKAR diagnostic shows widespread "Desire" gap
- Change champion attrition > 20%
- Adoption metrics below 50% at target date
- Executive sponsor not visibly championing change
- Organized resistance from middle management

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
