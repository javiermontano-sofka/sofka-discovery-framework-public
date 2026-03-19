---
name: apex-devops-pm-alignment
description: >
  Use when the user asks to "align DevOps with PM", "bridge CI/CD with milestones",
  "integrate deployment pipelines with project tracking", "map DORA metrics to PM KPIs",
  or "design release-milestone binding". Activates when a stakeholder needs to map CI/CD
  pipelines to milestone tracking, align release cadences with sprint ceremonies, correlate
  DORA metrics with project KPIs, or design an integrated DevOps-PM operating model.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# DevOps-PM Alignment

**TL;DR**: Bridges DevOps engineering practices with PM governance by mapping CI/CD pipelines to milestone tracking, release cadences to sprint ceremonies, deployment metrics to project KPIs, and infrastructure changes to change control. Produces an integrated operating model where engineering velocity and project visibility reinforce each other.

## Principio Rector
DevOps sin gobernanza de proyecto es velocidad sin dirección; gobernanza de proyecto sin DevOps es visibilidad sin velocidad. El alineamiento no es imponer burocracia al pipeline ni automatizar la rendición de cuentas — es crear un modelo operativo donde cada deploy sea un hito trazable y cada milestone tenga evidencia de entrega real.

## Assumptions & Limits
- Assumes CI/CD pipelines exist and are documented [SUPUESTO]
- Assumes PM and engineering teams are willing to collaborate on integration [STAKEHOLDER]
- Breaks when no CI/CD pipeline exists — recommend DevOps foundation before alignment
- Does not implement CI/CD pipelines — designs the alignment layer between DevOps and PM
- DORA metrics (deployment frequency, lead time, MTTR, change failure rate) are standard alignment points
- Tooling integration depends on API availability between DevOps and PM tools [SUPUESTO]

## Usage

```bash
# Map CI/CD pipeline to project milestones
/pm:devops-pm-alignment $PROJECT --type=pipeline-mapping

# Correlate DORA metrics with PM KPIs
/pm:devops-pm-alignment $PROJECT --type=metric-alignment --dora="all"

# Design integrated operating model
/pm:devops-pm-alignment $PROJECT --type=operating-model
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project identifier |
| `--type` | Yes | `pipeline-mapping`, `metric-alignment`, `operating-model`, `ceremony-integration` |
| `--dora` | No | DORA metrics to correlate (all, deployment-frequency, lead-time) |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Map sprint increments to deployment pipelines, automate sprint metrics from CI/CD
- **Waterfall**: Map phase gates to release gates, align environment promotion with project phases
- **SAFe**: Map ART cadences to release trains, PI objectives to epic-level deployments
- **Kanban**: Map flow metrics to deployment frequency, WIP limits to concurrent release branches
- **Hybrid**: Integrate phase-gate approvals with continuous delivery checkpoints
- **Transformation**: Design target DevOps-PM operating model for organizational change

## Before Aligning

1. **Read** the current CI/CD pipeline architecture to understand deployment workflow
2. **Read** the project management process to identify milestone and ceremony structure
3. **Glob** `skills/devops-pm-alignment/references/*.md` for integration patterns
4. **Grep** for existing automation or reporting that bridges DevOps and PM data

## Entrada (Input Requirements)
- Current CI/CD pipeline architecture and tooling
- Project management tool and workflow configuration
- Release management process (if exists)
- Deployment frequency and environment topology
- Current pain points in visibility or coordination

## Proceso (Protocol)
1. **Current state mapping** — Document existing CI/CD pipeline and PM process independently
2. **Integration point identification** — Find natural connection points between DevOps and PM
3. **Metric alignment** — Map DevOps metrics (DORA) to PM KPIs (schedule, quality, scope)
4. **Ceremony integration** — Design ceremonies that serve both engineering and governance needs
5. **Tooling bridge design** — Define integrations between CI/CD tools and PM tools
6. **Change control mapping** — Align infrastructure/code changes with change control board
7. **Release-milestone binding** — Bind release cadence to project milestone tracking
8. **Automated reporting** — Design automated status extraction from deployment pipelines
9. **Escalation protocol** — Define when pipeline failures escalate to project-level risks
10. **Operating model documentation** — Compile integrated DevOps-PM operating model

## Edge Cases

1. **No CI/CD pipeline exists**: Document current manual deployment process. Design minimum viable pipeline as prerequisite. Alignment begins after basic CI/CD is established. [PLAN]
2. **PM and engineering use incompatible tools**: Design data export/import bridge. If no API exists, recommend tool consolidation or middleware. [SUPUESTO]
3. **Deployment frequency exceeds PM tracking capacity**: Aggregate deployments to sprint/release level for PM tracking. Keep detailed deployment logs in engineering tools. [METRIC]
4. **Change control blocks engineering velocity**: Calibrate change control to methodology. Exempt routine deployments from CCB. Reserve formal control for infrastructure and baseline changes. [STAKEHOLDER]

## Example: Good vs Bad

**Good DevOps-PM Alignment:**

| Attribute | Value |
|-----------|-------|
| Pipeline mapping | Every CI/CD stage mapped to PM milestone |
| DORA-PM correlation | 4 DORA metrics mapped to PM KPIs |
| Ceremony integration | ≥2 ceremonies serving both domains |
| Automated reporting | Status extracted from pipeline without manual input |
| Operating model | Documented with roles, tools, and cadence |
| Escalation protocol | Pipeline failure to project risk threshold defined |

**Bad DevOps-PM Alignment:**
A document saying "engineering should report to PM weekly" without pipeline mapping, no metric correlation, no ceremony integration, no automation. Fails because manual reporting creates overhead and lag — the whole point of alignment is that deployment data automatically informs project status.

## Validation Gate
- [ ] Every CI/CD pipeline stage mapped to corresponding PM milestone or tracking point
- [ ] ≥3 DORA metrics correlated with PM KPIs with documented relationship
- [ ] ≥2 ceremonies designed to serve both engineering and governance needs
- [ ] Automated reporting extracts status from pipelines without manual PM intervention
- [ ] Release-milestone binding documented with clear trigger for milestone completion
- [ ] Change control calibrated to methodology — not blocking routine deployments
- [ ] Escalation protocol defines when pipeline failures become project-level risks
- [ ] Operating model documented and agreed by both engineering and PM leads
- [ ] Both engineering leads and PMO see unified visibility [STAKEHOLDER]
- [ ] Integration respects declared PM methodology cadence [PLAN]

## Escalation Triggers
- No CI/CD pipeline exists (manual deployments only)
- PM and engineering teams use incompatible tooling with no API bridge
- Deployment frequency exceeds project tracking capacity
- Change control process blocks engineering velocity beyond acceptable limits

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before aligning to understand DevOps-PM integration theory | `references/body-of-knowledge.md` |
| State of the Art | When evaluating DevOps-PM tooling integration | `references/state-of-the-art.md` |
| Knowledge Graph | To link alignment to CI/CD, ceremonies, and governance | `references/knowledge-graph.mmd` |
| Use Case Prompts | When scoping integration requirements | `prompts/use-case-prompts.md` |
| Metaprompts | To generate operating model templates | `prompts/metaprompts.md` |
| Sample Output | To calibrate expected alignment documentation | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
