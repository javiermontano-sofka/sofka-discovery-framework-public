---
name: apex-closure-report
description: >
  Use when the user asks to "close the project", "generate closure report",
  "document final metrics", "perform administrative closure", or "obtain formal acceptance".
  Activates when a stakeholder needs to produce a project closure report, compare final
  actuals vs baseline, compile lessons learned, obtain formal sponsor acceptance, or execute
  administrative closure including resource release and documentation archiving.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Project Closure Report

**TL;DR**: Produces a comprehensive project closure report including final metrics vs. baseline, benefits realization assessment, lessons learned summary, formal acceptance documentation, and administrative closure checklist. Ensures organizational knowledge capture and formal project termination.

## Principio Rector
El cierre no es un trámite — es la última oportunidad de capturar valor del proyecto. Las lecciones no documentadas se pierden; los beneficios no medidos se asumen; los contratos no cerrados generan obligaciones fantasma. Un cierre formal protege a la organización y alimenta la mejora continua.

## Assumptions & Limits
- Assumes project baselines exist for comparison against final actuals [SUPUESTO]
- Assumes sponsor is available to sign formal acceptance documentation [STAKEHOLDER]
- Breaks when project was cancelled without formal baselines — adapt to termination report format
- Does not track post-project benefits — that continues under `benefits-realization-plan`
- Contract closure requires legal/procurement input beyond PM scope [SUPUESTO]
- Lessons learned are only valuable if fed into organizational knowledge management system

## Usage

```bash
# Generate full closure report
/pm:closure-report $PROJECT --type=full

# Generate lessons learned compilation only
/pm:closure-report $PROJECT --type=lessons-learned

# Generate administrative closure checklist
/pm:closure-report $PROJECT --type=admin-closure
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project identifier |
| `--type` | Yes | `full`, `lessons-learned`, `admin-closure`, `acceptance` |
| `--include-benefits` | No | Include benefits realization snapshot (true/false) |

## Service Type Routing
`{TIPO_PROYECTO}`: Agile uses iteration-level closure + release closure; Waterfall uses formal phase-gate closure; SAFe uses PI-level closure; All types require formal administrative closure.

## Before Closing

1. **Read** project baselines (scope, schedule, budget) for comparison against final actuals
2. **Read** the lessons learned register to compile and categorize all captured lessons
3. **Glob** `skills/closure-report/references/*.md` for closure report templates and checklists
4. **Grep** for outstanding issues, residual risks, and pending action items across project artifacts

## Entrada (Input Requirements)
- Project baselines (scope, schedule, budget)
- Actual performance data (final EVM, quality metrics)
- Lessons learned register
- Benefits realization data
- Outstanding issues and risks
- Contract and vendor closure status

## Proceso (Protocol)
1. **Performance summary** — Compare final actuals vs. baseline (schedule, cost, scope)
2. **Benefits assessment** — Evaluate benefits realized vs. planned
3. **Quality summary** — Summarize quality metrics and conformance
4. **Lessons consolidation** — Compile and categorize all lessons learned
5. **Outstanding items** — Document unresolved issues, residual risks, pending actions
6. **Contract closure** — Verify all contracts closed and obligations met
7. **Knowledge transfer** — Ensure operational knowledge transferred to receiving team
8. **Archive plan** — Define project archive structure and retention policy
9. **Formal acceptance** — Obtain signed acceptance from sponsor/customer
10. **Administrative closure** — Release resources, close accounts, archive documentation

## Edge Cases

1. **Sponsor refuses to sign acceptance**: Document specific objections. Negotiate resolution path. If unresolvable, escalate to steering committee with evidence of deliverable completeness. [STAKEHOLDER]
2. **Project cancelled before completion**: Produce termination report instead. Document sunk costs, salvageable deliverables, and lessons from cancellation decision. [PLAN]
3. **Outstanding issues with no resolution path**: Transfer ownership to operational team with SLA. Document handoff agreement. Never close project with orphaned issues. [SCHEDULE]
4. **Benefits significantly below projections**: Document variance with root cause analysis. Recommend corrective actions for benefit recovery. Tag projections as [INFERENCIA]. [METRIC]

## Example: Good vs Bad

**Good Closure Report:**

| Attribute | Value |
|-----------|-------|
| Performance summary | Planned vs actual for scope, schedule, cost |
| Benefits assessment | Quantified with baseline comparison |
| Lessons learned | ≥10 categorized with actionable recommendations |
| Outstanding items | Each assigned to operational owner with deadline |
| Formal acceptance | Signed by sponsor with acceptance criteria met |
| Administrative closure | Checklist 100% complete |

**Bad Closure Report:**
An email saying "the project is done" without metrics, lessons learned, acceptance documentation, or administrative closure. Fails because it leaves the organization without performance data for future estimation, no lessons for improvement, and no formal record of project completion.

## Validation Gate
- [ ] Final actuals compared against baseline for scope, schedule, AND cost dimensions
- [ ] Benefits realization assessed with quantified variance from planned targets
- [ ] ≥10 lessons learned compiled, categorized, and submitted to organizational knowledge base
- [ ] Every outstanding item assigned to an owner with deadline and resolution path
- [ ] Formal acceptance obtained with sponsor signature or documented objection
- [ ] All contracts verified as closed with obligations fulfilled
- [ ] Knowledge transfer to operational team documented and confirmed
- [ ] Project archive structure defined with retention policy
- [ ] Sponsor receives formal closure with performance summary [STAKEHOLDER]
- [ ] Closure process aligned with methodology requirements [PLAN]

## Escalation Triggers
- Sponsor refuses to sign acceptance
- Outstanding issues with no resolution path
- Benefits significantly below projections
- Contract disputes unresolved at closure

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before closing to understand closure best practices | `references/body-of-knowledge.md` |
| State of the Art | When designing innovative closure approaches | `references/state-of-the-art.md` |
| Knowledge Graph | To link closure to lessons learned and benefits | `references/knowledge-graph.mmd` |
| Use Case Prompts | When facilitating closure workshops | `prompts/use-case-prompts.md` |
| Metaprompts | To generate closure report templates | `prompts/metaprompts.md` |
| Sample Output | To calibrate expected closure report format | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
