---
name: apex-scrum-framework
description: >
  Use when the user asks to "implement Scrum", "plan sprints", "define ceremonies",
  "set up Scrum artifacts", "design sprint cadence", or mentions Scrum, sprint planning,
  daily standup, sprint review, retrospective, product backlog, sprint backlog,
  Definition of Done, velocity tracking.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Scrum Framework Implementation

**TL;DR**: Designs and tailors a Scrum implementation including sprint cadence, ceremony definitions, artifact templates, role assignments, and Definition of Done. Adapts Scrum to the organization's context while preserving the empirical pillars of transparency, inspection, and adaptation.

## Principio Rector
Scrum no es un proceso — es un framework para descubrir procesos. Su poder radica en los tres pilares del empirismo: transparencia (todos ven la misma realidad), inspección (evaluación frecuente del progreso), y adaptación (ajuste basado en evidencia). Implementar Scrum sin entender el empirismo es hacer waterfall en sprints de 2 semanas.

## Assumptions & Limits
- Assumes team size is 3-9 developers (Scrum Guide recommended range) [PLAN]
- Assumes a Product Owner is identified or will be assigned [STAKEHOLDER]
- Breaks when team has zero agile experience and no coaching support — provide training first
- Does not manage the product backlog; designs the framework for managing it
- Assumes organizational constraints allow sprint cadence (regular time-boxed iterations) [SUPUESTO]
- Limited to single-team Scrum; for multi-team coordination use `safe-framework` or `less-nexus-framework`

## Usage

```bash
# Full Scrum implementation design
/pm:scrum-framework $ARGUMENTS="--team-size 7 --sprint-length 2w"

# Ceremony design only
/pm:scrum-framework --type ceremonies --sprint-length 2w --team "Team Alpha"

# Definition of Done creation
/pm:scrum-framework --type dod --quality-requirements quality-plan.md
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Team size and sprint configuration |
| `--type` | No | `full` (default), `ceremonies`, `dod`, `metrics`, `rollout` |
| `--team-size` | No | Number of developers (3-9) |
| `--sprint-length` | No | Sprint duration: `1w`, `2w`, `3w`, `4w` |
| `--team` | No | Team name identifier |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Standard Scrum with technical practices (TDD, CI/CD); sprint cadence drives all planning and delivery
- **SAFe**: Scrum at team level within ART; ceremonies align to PI cadence; team-level retrospectives feed ART inspect-and-adapt
- **Hybrid**: Scrum sprints within waterfall phases; sprint reviews map to phase gate deliverables; dual reporting
- **Transformation**: Scrum as reference model for coaching; ceremonies adapted for business stakeholders and change adoption tracking

## Before Implementing
1. **Read** methodology assessment results to confirm Scrum is appropriate [PLAN]
2. **Read** team composition to verify team size and skill distribution [PLAN]
3. **Glob** `**/backlog*` to check if a product backlog already exists [PLAN]
4. **Grep** for organizational constraints that might impact sprint cadence (release windows, governance cycles) [PLAN]

## Entrada (Input Requirements)
- Methodology assessment results (from `methodology-assessment`)
- Team composition and size
- Product/project scope and backlog items
- Organizational constraints (meeting schedules, reporting requirements)
- Team's agile maturity level

## Proceso (Protocol)
1. **Assess fit** — Verify Scrum is appropriate for team size (3-9), scope uncertainty, and org culture
2. **Define sprint cadence** — Select sprint length (1-4 weeks) based on feedback cycle needs
3. **Design ceremonies** — Tailor Sprint Planning, Daily Scrum, Sprint Review, Retrospective
4. **Define artifacts** — Product Backlog structure, Sprint Backlog format, Increment criteria
5. **Assign roles** — Product Owner, Scrum Master, Development Team with clear accountabilities
6. **Create Definition of Done** — Establish DoD checklist with quality criteria
7. **Backlog initialization** — Structure initial product backlog with user stories and acceptance criteria
8. **Metrics framework** — Define velocity tracking, burndown/burnup charts, sprint goals
9. **Scaling considerations** — If multi-team, reference `less-nexus-framework` or `safe-framework`
10. **Rollout plan** — Phased adoption with training, coaching, and feedback loops

## Edge Cases
1. **Team size outside 3-9 range** — For smaller teams, consider Kanban. For larger teams, split into multiple Scrum teams with coordination framework. Do not stretch Scrum to sizes it was not designed for [PLAN].
2. **Product Owner not available for ceremonies** — Flag as critical risk. A part-time PO leads to a part-time product. Recommend PO proxy only if PO delegates authority explicitly [STAKEHOLDER].
3. **Organization mandates practices conflicting with Scrum values** — Document the conflicts. Propose Scrum adaptations that preserve empiricism. If core values (transparency, inspection, adaptation) are compromised, recommend hybrid instead [INFERENCIA].
4. **Remote/distributed team** — Design ceremonies for remote-first: async daily standup options, virtual Sprint Review with recording, retrospective using digital boards [PLAN].

## Example: Good vs Bad

**Good example — Thoughtful Scrum implementation:**

| Attribute | Value |
|-----------|-------|
| Sprint length | 2 weeks (justified by feedback cycle needs) |
| Ceremonies | All 5 events defined with time-boxes and agendas |
| Roles | PO, SM, 6 developers — all with clear accountabilities |
| DoD | 12-item checklist covering code, test, review, deploy |
| Metrics | Velocity, sprint burndown, sprint goal completion rate |
| Rollout | 3-sprint trial with coaching before full adoption |

**Bad example — Waterfall in sprints:**
Sprint Planning assigns tasks top-down, no Daily Scrum because "we have Jira", Sprint Review is a demo with no feedback loop, Retrospective skipped because "we're too busy." This preserves the ceremony names while violating every Scrum principle. No empiricism, no self-management, no adaptation.

## Salida (Deliverables)
- `02_scrum_playbook_{proyecto}_{WIP}.md` — Scrum implementation guide
- Ceremony calendar with time-boxes and agendas
- Artifact templates (Product Backlog, Sprint Backlog)
- Role descriptions and accountability matrix
- Sprint metrics dashboard template

## Validation Gate
- [ ] All 5 Scrum events defined with time-boxes [PLAN]
- [ ] All 3 Scrum artifacts defined with format and ownership [PLAN]
- [ ] Team size within 3-9 developer range (or scaling referenced) [METRIC]
- [ ] Definition of Done has ≥8 testable criteria [PLAN]
- [ ] Sprint length justified with feedback cycle rationale [PLAN]
- [ ] PO, SM, and Development Team accountabilities documented [PLAN]
- [ ] Metrics framework includes velocity and sprint goal completion [METRIC]
- [ ] Rollout plan includes training before first sprint [SCHEDULE]
- [ ] Evidence ratio: ≥80% [PLAN], <20% [SUPUESTO]
- [ ] Implementation aligned with Scrum Guide 2020 principles [PLAN]

## Escalation Triggers
- Team size outside 3-9 range without scaling framework
- Product Owner not available for ceremonies
- Organization mandates practices conflicting with Scrum values
- No dedicated Scrum Master available

## Additional Resources

| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | Scrum Guide 2020 and implementation patterns | `references/body-of-knowledge.md` |
| State of the Art | Modern Scrum practices and adaptations | `references/state-of-the-art.md` |
| Knowledge Graph | Scrum in methodology framework | `references/knowledge-graph.mmd` |
| Use Case Prompts | Scrum implementation scenarios | `prompts/use-case-prompts.md` |
| Metaprompts | Custom Scrum adaptations | `prompts/metaprompts.md` |
| Sample Output | Reference Scrum playbook | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
