---
name: apex-methodology-assessment
description: >
  Use when the user asks to "assess methodology fit", "select PM methodology",
  "evaluate agile vs waterfall", "determine best approach", "score methodology options",
  or mentions methodology selection, framework comparison, agile readiness, approach
  evaluation. Triggers on: evaluates project characteristics against methodology criteria,
  produces weighted scoring matrix, recommends best-fit methodology with confidence level,
  identifies organizational readiness gaps, generates tailoring guidance.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Methodology Fit Assessment & Selection

**TL;DR**: Evaluates project characteristics against methodology criteria to recommend the best-fit approach (Scrum, Kanban, SAFe, Waterfall, Hybrid, LeSS/Nexus, Spotify). Uses a weighted scoring model based on scope certainty, team size, feedback frequency, regulatory constraints, organizational maturity, and stakeholder expectations.

## Principio Rector
No existe una metodología universalmente superior — existe la metodología correcta para el contexto correcto. La selección debe ser una decisión basada en evidencia, no en preferencia personal o tendencia de la industria. Los factores determinantes son: certeza del alcance, necesidad de feedback, tamaño del equipo, restricciones regulatorias, y madurez organizacional.

## Assumptions & Limits
- Assumes project charter with scope and constraints is available [SUPUESTO]
- Assumes organizational PM maturity baseline exists or can be estimated [SUPUESTO]
- Breaks if organizational mandate overrides assessment — document the mandate and its risks [STAKEHOLDER]
- Scope limited to methodology selection; methodology implementation is handled by specific framework skills [PLAN]
- Does not evaluate tools — methodology selection is independent of tooling [PLAN]

## Usage
```bash
/pm:methodology-assessment $PROJECT_NAME --dimensions=8
/pm:methodology-assessment $PROJECT_NAME --quick --compare=scrum,kanban,hybrid
/pm:methodology-assessment $PROJECT_NAME --full --include-tailoring
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT_NAME` | Yes | Target project identifier |
| `--dimensions` | No | Number of evaluation dimensions (default: 8) |
| `--compare` | No | Specific methodologies to compare |
| `--quick` | No | Abbreviated assessment (top 3 dimensions only) |
| `--include-tailoring` | No | Include tailoring recommendations |

## Service Type Routing
`{TIPO_PROYECTO}`: All project types use this skill as Phase 2 entry point. The assessment adapts its criteria weights based on project type (e.g., compliance projects weight regulatory criteria higher).

## Before Assessing Methodology
1. Read `project-charter` — extract scope certainty, constraints, and stakeholder expectations [PLAN]
2. Read `agile-assessment` or equivalent — understand organizational agile maturity [METRIC]
3. Glob `*regulatory*` and `*compliance*` — identify constraints that force specific approaches [PLAN]
4. Read historical project performance — past methodology success/failure informs selection [METRIC]

## Entrada (Input Requirements)
- Project charter with scope and constraints
- Team composition and agile maturity
- Organizational PM standards and preferences
- Regulatory and contractual requirements
- Historical project performance data

## Proceso (Protocol)
1. **Gather context** — Collect project characteristics across 8 evaluation dimensions
2. **Dimension scoring** — Rate each dimension (1-5): scope certainty, feedback need, team size, regulatory pressure, stakeholder availability, technical complexity, organizational maturity, change tolerance
3. **Weight application** — Apply project-type-specific weights to dimension scores
4. **Framework scoring** — Calculate fit score for each methodology option
5. **Gap analysis** — Identify organizational readiness gaps for top-scoring methodologies
6. **Recommendation** — Present top 2 options with pros/cons and confidence level
7. **Tailoring guidance** — Recommend specific adaptations for the selected methodology
8. **Validation** — Present recommendation to stakeholders for alignment

## Edge Cases
1. **Two methodologies score within 5% of each other** — Present both options; recommend pilot/PoC to differentiate; document that either is viable.
2. **Organizational mandate conflicts with assessment recommendation** — Document the assessment result; note the mandate; describe risks of mandate-driven selection.
3. **Team maturity insufficient for recommended methodology** — Include maturity building as prerequisite in implementation plan; consider interim simpler methodology.
4. **No historical data for comparison** — Rely on organizational maturity assessment and industry benchmarks; tag recommendation confidence as "Medium" with [INFERENCIA].

## Example: Good vs Bad

**Good Methodology Assessment:**
| Attribute | Value |
|-----------|-------|
| Dimensions scored | 8 dimensions, each 1-5 with evidence citation [METRIC] |
| Methodologies evaluated | 5 options: Scrum, Kanban, Waterfall, Hybrid, SAFe [PLAN] |
| Scoring matrix | Weighted scores with sensitivity analysis [METRIC] |
| Recommendation | Hybrid (score 4.2) over Scrum (3.8) with 85% confidence [METRIC] |
| Tailoring | 6 specific adaptations for the recommended hybrid approach [PLAN] |

**Bad Methodology Assessment:**
"We recommend Agile because it is modern and flexible." — No scoring, no dimension analysis, no alternatives evaluated, no evidence. Selection based on trend, not project fit.

## Salida (Deliverables)
- `02_methodology_assessment_{proyecto}_{WIP}.md` — Assessment report
- Scoring matrix (dimensions x methodologies)
- Radar chart of project characteristics (Mermaid)
- Gap analysis with readiness improvement actions
- Tailoring recommendations for selected methodology

## Validation Gate
- [ ] Every dimension score based on verifiable project or organizational data
- [ ] All viable methodologies evaluated — not just the preferred one
- [ ] Scoring criteria applied uniformly across all methodology options
- [ ] Recommendation includes confidence level (High/Medium/Low) with justification
- [ ] Clear implementation path with identified readiness gaps
- [ ] Decision rationale transparent — stakeholders can trace score to evidence
- [ ] Sensitivity analysis shows ranking stability under weight changes
- [ ] Methodology adoption risks identified for recommended option
- [ ] Stakeholders had opportunity to validate dimension scores
- [ ] Assessment follows structured method — not gut feeling with a framework label

## Escalation Triggers
- Two methodologies score within 5% of each other
- Organizational mandate conflicts with assessment recommendation
- Team maturity insufficient for recommended methodology
- No historical data for comparison

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
