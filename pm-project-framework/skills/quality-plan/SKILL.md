---
name: apex-quality-plan
description: >
  Use when the user asks to "create a quality plan", "define QA processes",
  "establish quality metrics", "design quality control activities", "set acceptance criteria",
  or mentions quality management, QA plan, quality assurance, quality control,
  quality standards, continuous quality improvement.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Quality Management Plan

**TL;DR**: Produces a quality management plan covering QA processes, quality metrics, quality control activities, acceptance criteria, and continuous improvement mechanisms. Defines what "quality" means for the project and how it will be measured, verified, and improved throughout the lifecycle.

## Principio Rector
La calidad no se inspecciona al final — se construye desde el inicio. El plan de calidad define el estándar ANTES de que el trabajo comience. Quality Assurance previene defectos; Quality Control los detecta. Un proyecto maduro invierte más en QA que en QC porque prevenir es más barato que corregir.

## Assumptions & Limits
- Assumes project charter defines quality expectations at minimum [PLAN]
- Assumes organizational quality standards or regulatory requirements are documented [SUPUESTO]
- Breaks when stakeholders have no quality expectations — quality cannot be defined in a vacuum
- Does not execute QA/QC activities; it plans them. Use `quality-audit` for execution
- Assumes Definition of Done exists or will be created in parallel [SUPUESTO]
- Limited to project-level quality; for organizational quality management systems use ISO 9001

## Usage

```bash
# Full quality management plan
/pm:quality-plan $ARGUMENTS="--charter charter.md --methodology Agile"

# Quality plan for regulated project
/pm:quality-plan --type regulated --standards "ISO-27001,SOC2" --methodology Waterfall

# Update quality plan with new metrics
/pm:quality-plan --type update --baseline quality-plan-v1.md --metrics "defect-density,coverage"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Path to charter or quality requirements |
| `--type` | No | `full` (default), `regulated`, `update` |
| `--methodology` | No | Project methodology for QA/QC alignment |
| `--standards` | No | Comma-separated applicable standards |
| `--metrics` | No | Specific metrics to include |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Definition of Done as quality baseline; automated testing pyramid; continuous inspection through sprint reviews
- **Waterfall**: Formal QA/QC plan with inspection checkpoints per phase; acceptance testing at stage gates; quality audits per PMBOK
- **SAFe**: Built-in quality as SAFe principle; system demo quality criteria; ART-level quality metrics and inspect-and-adapt
- **Kanban**: Quality embedded in flow policies; defect rate as flow metric; explicit quality criteria per board column exit
- **PMO**: Quality governance framework across projects; quality audit schedules and portfolio-level quality dashboards
- **Hybrid**: Dual quality tracks -- formal QC for predictive deliverables, continuous QA for iterative increments

## Before Planning Quality
1. **Read** the project charter to extract quality expectations and constraints [PLAN]
2. **Read** the Definition of Done if available from `definition-of-done` skill [PLAN]
3. **Glob** `**/standards/**` or `**/compliance/**` to identify applicable regulatory requirements [PLAN]
4. **Grep** for quality-related stakeholder expectations in stakeholder register [STAKEHOLDER]

## Entrada (Input Requirements)
- Project charter with quality expectations
- Organizational quality standards and policies
- Regulatory and compliance requirements
- Definition of Done (from `definition-of-done`)
- Stakeholder quality expectations

## Proceso (Protocol)
1. **Quality objectives** — Define measurable quality objectives aligned with project goals
2. **Quality standards** — Identify applicable standards (ISO, organizational, regulatory)
3. **QA processes** — Design preventive quality assurance activities
4. **QC activities** — Define inspection, testing, and verification activities
5. **Metrics definition** — Establish quality metrics (defect density, test coverage, customer satisfaction)
6. **Acceptance criteria** — Define acceptance criteria for each deliverable type
7. **Tool selection** — Identify quality management tools and automation
8. **Roles and responsibilities** — Define quality roles (QA lead, testers, reviewers)
9. **Quality audit schedule** — Plan internal quality audits
10. **Improvement process** — Establish continuous quality improvement cycle

## Edge Cases
1. **No organizational quality standards exist** — Create project-specific standards based on industry best practices. Tag all standards as [SUPUESTO] until organizational approval [SUPUESTO].
2. **Quality metrics conflict (e.g., speed vs thoroughness)** — Document the tension explicitly. Establish priority order with stakeholder agreement. Never silently sacrifice one quality dimension for another [STAKEHOLDER].
3. **Regulated project with evolving compliance requirements** — Build regulatory monitoring into the quality plan. Schedule quarterly compliance reviews and include a change management process for regulatory updates [PLAN].
4. **Team has no QA experience** — Include QA training in the quality plan. Pair QC activities with coaching. Consider staff augmentation for QA expertise [INFERENCIA].

## Example: Good vs Bad

**Good example — Measurable quality plan:**

| Attribute | Value |
|-----------|-------|
| Quality objectives | 4 measurable objectives with KPI targets |
| QA activities | 6 preventive activities scheduled per sprint |
| QC activities | 8 inspection checkpoints mapped to deliverables |
| Metrics | 5 metrics with baselines, targets, and measurement methods |
| Acceptance criteria | Defined per deliverable type with pass/fail thresholds |
| Audit schedule | Monthly internal audits with scope rotation |

**Bad example — Aspirational quality plan:**
"We will deliver high quality." No metrics, no acceptance criteria, no QA/QC schedule, no quality roles defined. Quality without measurement is a marketing statement. Without acceptance criteria, every deliverable is simultaneously acceptable and unacceptable.

## Salida (Deliverables)
- `03_quality_plan_{proyecto}_{WIP}.md` — Quality management plan
- Quality metrics dashboard template
- QA/QC activity schedule
- Acceptance criteria per deliverable type
- Quality audit checklist

## Validation Gate
- [ ] ≥3 measurable quality objectives defined with KPI targets [METRIC]
- [ ] Every deliverable type has explicit acceptance criteria [PLAN]
- [ ] QA activities (preventive) and QC activities (detective) both defined [PLAN]
- [ ] ≥4 quality metrics with baseline, target, and measurement method [METRIC]
- [ ] Quality roles and responsibilities assigned to named roles [PLAN]
- [ ] Quality audit schedule defined with ≥quarterly cadence [SCHEDULE]
- [ ] Continuous improvement process documented (feedback loop) [PLAN]
- [ ] Applicable standards referenced with specific clause numbers [PLAN]
- [ ] Evidence ratio: ≥80% [PLAN]/[METRIC], <20% [SUPUESTO]
- [ ] Quality plan aligned with Definition of Done and methodology [PLAN]

## Escalation Triggers
- Quality metrics trending below thresholds
- Regulatory compliance gap identified
- QA resources insufficient for planned activities
- Stakeholder quality expectations conflicting

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
