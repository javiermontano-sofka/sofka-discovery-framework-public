---
name: apex-discovery-retrospective
description: >
  Use when the user asks to "run a project discovery retrospective", "review discovery outcomes",
  "assess discovery effectiveness", "calibrate pipeline parameters", or "measure discovery quality".
  Activates when a stakeholder needs to conduct a quantitative post-discovery review, measure
  pipeline execution quality, assess deliverable completeness, evaluate estimation accuracy,
  or update APEX pipeline parameters based on retrospective findings.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Discovery Retrospective

**TL;DR**: Conducts a quantitative post-discovery retrospective analyzing pipeline execution quality, deliverable completeness, stakeholder satisfaction, estimation accuracy, and methodology fit. Produces measurable insights that improve future discovery cycles and calibrate APEX pipeline parameters.

## Principio Rector
La retrospectiva de discovery no es un ejercicio de catarsis — es un instrumento de calibración. Cada ciclo de discovery debe producir datos que mejoren el siguiente: cuánto tardamos, cuánto acertamos, qué supuestos se validaron. Sin métricas, la mejora es ilusión.

## Assumptions & Limits
- Assumes discovery pipeline has been executed with deliverables produced [PLAN]
- Assumes session changelog and decision log are available for timeline analysis [SUPUESTO]
- Breaks when no session data was captured — retrospective becomes opinion-based, not data-driven
- Estimation accuracy measurement requires post-discovery actuals, which may not yet exist
- Does not replace sprint retrospectives — this is pipeline-level, not ceremony-level
- Calibration updates require organizational authority to modify pipeline parameters [STAKEHOLDER]

## Usage

```bash
# Run full discovery retrospective
/pm:discovery-retrospective $PROJECT --type=full

# Assess deliverable quality only
/pm:discovery-retrospective $PROJECT --type=quality-audit

# Update pipeline calibration parameters
/pm:discovery-retrospective $PROJECT --type=calibrate --update="true"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project identifier |
| `--type` | Yes | `full`, `quality-audit`, `calibrate`, `timeline-analysis` |
| `--update` | No | Apply calibration updates (true/false) |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Focus on sprint-0/inception quality, backlog readiness, DoR compliance
- **Waterfall**: Focus on requirements completeness, estimation accuracy, phase-gate quality
- **SAFe**: Focus on PI planning readiness, ART alignment, architectural runway assessment
- **Kanban**: Focus on flow establishment quality, WIP calibration, service class definition
- **Hybrid**: Assess methodology selection decision quality and integration effectiveness
- **PMO**: Aggregate discovery metrics across portfolio for organizational learning
- **Recovery**: Assess what the original discovery missed that led to project distress

## Before Retrospecting

1. **Read** all discovery deliverables produced during the pipeline for completeness assessment
2. **Read** the session changelog to reconstruct timeline and decision history
3. **Glob** `skills/discovery-retrospective/references/*.md` for retrospective scoring rubrics
4. **Grep** for `[SUPUESTO]` tags across deliverables to assess assumption validation rates

## Entrada (Input Requirements)
- All discovery deliverables produced during the pipeline
- Session changelog and decision log
- Time spent per phase and deliverable
- Stakeholder feedback (formal and informal)
- Original discovery scope vs. actual coverage

## Proceso (Protocol)
1. **Deliverable inventory** — Catalog all outputs produced during discovery
2. **Completeness scoring** — Rate each deliverable against quality checklist
3. **Timeline analysis** — Compare planned vs. actual time per phase
4. **Estimation accuracy** — Measure how discovery estimates tracked against actuals (if available)
5. **Stakeholder satisfaction** — Collect and quantify stakeholder feedback
6. **Assumption validation** — Review which [SUPUESTO] tags were validated vs. invalidated
7. **Pipeline friction** — Identify bottlenecks, rework cycles, and blocked phases
8. **Methodology fit** — Assess whether selected methodology proved appropriate
9. **Improvement actions** — Define specific, measurable improvements for next discovery
10. **Calibration update** — Update APEX pipeline parameters based on findings

## Edge Cases

1. **No session data captured during discovery**: Use deliverable timestamps and git history as proxy. Tag all timeline findings as [INFERENCIA]. Recommend session tracking for future cycles. [SUPUESTO]
2. **Stakeholder satisfaction below threshold**: Deep-dive into dissatisfaction drivers. Separate content quality issues from communication/expectation issues. Design targeted improvements. [STAKEHOLDER]
3. **Critical deliverables missing or incomplete**: Flag as Critical finding. Root-cause analysis: was it scope creep, capacity issue, or skill gap? Design preventive measure. [PLAN]
4. **Estimation variance >50%**: Analyze whether variance is from scope change, effort underestimation, or complexity underestimation. Calibrate estimation parameters accordingly. [METRIC]

## Example: Good vs Bad

**Good Discovery Retrospective:**

| Attribute | Value |
|-----------|-------|
| Deliverables scored | 100% against quality checklists |
| Timeline analysis | Planned vs actual per phase with variance |
| Assumption validation | X validated, Y invalidated, Z still open |
| Stakeholder satisfaction | Quantified score with driver analysis |
| Improvement actions | ≥5 specific, measurable, assigned |
| Calibration updates | Pipeline parameters adjusted with rationale |

**Bad Discovery Retrospective:**
A meeting where everyone says "it went well" without metrics, scoring, or timeline analysis. No assumption validation. No calibration updates. Fails because feel-good retrospectives produce no data for improvement — the next discovery cycle will repeat the same patterns.

## Validation Gate
- [ ] Every deliverable scored against its quality checklist with quantified score
- [ ] Timeline analysis compares planned vs actual for every phase with variance explanation
- [ ] ≥80% of [SUPUESTO] tags reviewed with validated/invalidated/open status
- [ ] Stakeholder satisfaction quantified (score or NPS) with satisfaction driver analysis
- [ ] ≥5 improvement actions defined with specific, measurable criteria and owners
- [ ] Pipeline friction points identified with quantified impact (rework hours, blocked days)
- [ ] Methodology fit assessment documented with evidence
- [ ] Calibration parameter updates documented with rationale and evidence
- [ ] Stakeholders see concrete improvement commitments [STAKEHOLDER]
- [ ] Retro format aligned with project methodology [PLAN]

## Escalation Triggers
- Discovery quality score below 60% across multiple dimensions
- Stakeholder satisfaction below acceptable threshold
- Critical deliverables missing or fundamentally incomplete
- Estimation variance exceeding 50% on key dimensions

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before retrospecting to understand assessment rubrics | `references/body-of-knowledge.md` |
| State of the Art | When evaluating quantitative retro approaches | `references/state-of-the-art.md` |
| Knowledge Graph | To link retro to pipeline orchestration | `references/knowledge-graph.mmd` |
| Use Case Prompts | When facilitating retrospective sessions | `prompts/use-case-prompts.md` |
| Metaprompts | To generate scoring rubric templates | `prompts/metaprompts.md` |
| Sample Output | To calibrate expected retrospective report format | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
