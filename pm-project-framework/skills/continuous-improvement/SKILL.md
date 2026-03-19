---
name: apex-continuous-improvement
description: >
  Use when the user asks to "improve processes", "run a retrospective analysis",
  "implement kaizen", "optimize PDCA cycles", or "track improvement implementation".
  Activates when a stakeholder needs to identify improvement opportunities from project data,
  apply root cause analysis techniques, prioritize improvements by effort-impact ratio,
  implement PDCA cycles, or embed improvements into standard processes.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Continuous Improvement & Kaizen

**TL;DR**: Implements systematic continuous improvement through retrospective analysis, PDCA cycles, kaizen events, and process optimization. Identifies improvement opportunities from project data, quality audits, team feedback, and lessons learned. Prioritizes improvements by effort-impact ratio and tracks implementation.

## Principio Rector
La mejora continua no es un evento — es una disciplina. Cada sprint, cada fase, cada entregable es una oportunidad para mejorar el proceso que lo produjo. La clave no es la cantidad de mejoras identificadas sino la cantidad implementadas y verificadas. Una mejora no verificada es una intención, no una mejora.

## Assumptions & Limits
- Assumes retrospective or feedback data exists to identify improvement opportunities [SUPUESTO]
- Assumes team has capacity to implement improvements alongside delivery work [PLAN]
- Breaks when improvement backlog grows indefinitely without implementation — signals deeper issue
- Root cause analysis requires honest team participation; blame culture produces sanitized inputs
- Does not implement organizational process changes — those require PMO-level authority [STAKEHOLDER]
- Improvement verification requires before/after metrics; without metrics, improvement is assumed

## Usage

```bash
# Identify improvement opportunities from retrospective data
/pm:continuous-improvement $PROJECT --type=identify --source="retrospectives"

# Run PDCA cycle for a specific improvement
/pm:continuous-improvement $PROJECT --type=pdca --improvement="reduce-rework"

# Track improvement implementation across the project
/pm:continuous-improvement $PROJECT --type=track --status="all"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project identifier |
| `--type` | Yes | `identify`, `pdca`, `track`, `verify`, `share` |
| `--source` | No | Data source (retrospectives, audits, metrics, feedback) |
| `--improvement` | No | Specific improvement to manage |
| `--status` | No | Filter by status (open, in-progress, verified, standardized) |

## Service Type Routing
`{TIPO_PROYECTO}`: Agile uses sprint retrospectives; Kanban uses service delivery reviews; SAFe uses Inspect & Adapt; Waterfall uses phase lessons learned; All types use PDCA.

## Before Improving

1. **Read** retrospective outputs and team feedback to harvest improvement candidates
2. **Read** quality audit findings for process improvement opportunities
3. **Glob** `skills/continuous-improvement/references/*.md` for improvement frameworks
4. **Grep** for process metrics and trend data to identify data-driven improvement areas

## Entrada (Input Requirements)
- Retrospective outputs and team feedback
- Quality audit findings
- Process metrics and trend data
- Lessons learned register
- Customer/stakeholder satisfaction data

## Proceso (Protocol)
1. **Opportunity identification** — Collect improvement ideas from all sources
2. **Root cause analysis** — Use 5 Whys, fishbone, or Pareto to find root causes
3. **Prioritization** — Rank by effort-impact matrix (quick wins first)
4. **Action design** — Define specific improvement actions with owners and deadlines
5. **PDCA cycle** — Plan the improvement, Do implement, Check results, Act to standardize
6. **Metric tracking** — Define how improvement will be measured
7. **Implementation** — Execute improvement actions
8. **Verification** — Confirm improvement achieved desired result
9. **Standardization** — Embed successful improvements into standard processes
10. **Knowledge sharing** — Share improvements across teams and projects

## Edge Cases

1. **Same issue recurring in 3+ retrospectives**: Escalate from team-level to organizational-level problem. Root cause is likely structural, not procedural. Require management intervention. [STAKEHOLDER]
2. **Improvement backlog growing faster than implementation**: Pause identification. Focus sprint on implementing top 3 improvements. Reset backlog capacity before adding new items. [PLAN]
3. **Team disengaged from improvement process**: Diagnose cause (fatigue, futility, blame culture). Demonstrate quick win implementation to rebuild trust. Reduce improvement scope to 1 item per cycle. [METRIC]
4. **No before-state metrics available for verification**: Establish metrics NOW for next improvement cycle. For current cycle, use qualitative team assessment with [INFERENCIA] tag. [METRIC]

## Example: Good vs Bad

**Good Continuous Improvement:**

| Attribute | Value |
|-----------|-------|
| Opportunities identified | 12 from 4 data sources |
| Root cause analysis | 5 Whys or fishbone for each |
| Prioritization | Effort-impact matrix with 4 quick wins |
| PDCA cycles | Complete for top 3 improvements |
| Verification | Before/after metrics compared |
| Standardization | 2 improvements embedded in process |

**Bad Continuous Improvement:**
A retrospective action item list with "improve testing" and "communicate better" — no root cause analysis, no prioritization, no PDCA cycle, no metrics, no verification. Fails because vague improvement intentions without structured implementation and measurement never produce actual improvement.

## Validation Gate
- [ ] ≥5 improvement opportunities identified from ≥2 different data sources
- [ ] Root cause analysis completed for every improvement using structured technique (5 Whys, fishbone, Pareto)
- [ ] Effort-impact prioritization matrix produced with ≥2 quick wins identified
- [ ] Every improvement action has specific owner, deadline, and success metric
- [ ] PDCA cycle documented for each active improvement (Plan, Do, Check, Act phases)
- [ ] Before/after metrics compared for every completed improvement
- [ ] ≥1 verified improvement standardized into team or organizational process
- [ ] Improvement risks assessed (unintended consequences, regression)
- [ ] Improvements visible to stakeholders demonstrating team learning [STAKEHOLDER]
- [ ] Improvement cadence aligned with methodology rhythm [PLAN]

## Escalation Triggers
- Same issue recurring in 3+ retrospectives without resolution
- Improvement backlog growing faster than implementation
- Team disengaged from improvement process
- Process metrics degrading despite improvement efforts

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before starting to understand PDCA and kaizen frameworks | `references/body-of-knowledge.md` |
| State of the Art | When exploring advanced improvement methodologies | `references/state-of-the-art.md` |
| Knowledge Graph | To link improvement to retrospectives and quality | `references/knowledge-graph.mmd` |
| Use Case Prompts | When facilitating improvement workshops | `prompts/use-case-prompts.md` |
| Metaprompts | To generate root cause analysis templates | `prompts/metaprompts.md` |
| Sample Output | To calibrate expected improvement report format | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
