---
name: apex-team-performance
description: >
  Use when the user asks to "track team performance", "measure velocity",
  "assess team health", "monitor team morale", "analyze productivity trends",
  or mentions team performance, velocity tracking, team health, morale,
  burndown, team metrics, sprint predictability.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Team Performance & Health Tracking

**TL;DR**: Tracks team performance through velocity/throughput metrics, burndown/burnup charts, and team health indicators. Monitors both productivity (output metrics) and sustainability (health, morale, cognitive load) to ensure the team delivers consistently without burning out.

## Principio Rector
La velocidad sin sostenibilidad es sprint hacia el burnout. Los mejores equipos son predecibles, no rápidos. Team health precede a team performance: un equipo con baja moral produce trabajo de baja calidad, sin importar cuántas horas trabaje. Los líderes que solo miden output y nunca miden health cosechan deuda organizacional.

## Assumptions & Limits
- Assumes ≥3 sprints of historical data for trend analysis [METRIC]
- Assumes team composition is stable enough for meaningful velocity tracking [SUPUESTO]
- Breaks when team changes >30% of members between sprints — velocity becomes meaningless
- Does not prescribe remediation; diagnoses. Use `retrospective-engine` for improvement actions
- Assumes team is willing to participate in health assessments [SUPUESTO]
- Limited to team-level tracking; for individual performance use organizational HR processes

## Usage

```bash
# Full team performance and health dashboard
/pm:team-performance $ARGUMENTS="--team 'Team Alpha' --sprints 5-8"

# Health assessment only
/pm:team-performance --type health --team "Team Alpha"

# Velocity trend analysis
/pm:team-performance --type velocity-trend --sprints 1-8 --forecast 4
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Team identifier and sprint range |
| `--type` | No | `full` (default), `health`, `velocity-trend`, `predictability` |
| `--sprints` | No | Sprint range for analysis |
| `--forecast` | No | Number of sprints to forecast |

## Service Type Routing
`{TIPO_PROYECTO}`: Scrum tracks velocity and sprint burndown; Kanban tracks throughput and cycle time; SAFe tracks PI predictability; Waterfall tracks schedule adherence and productivity rates.

## Before Tracking
1. **Read** sprint completion data to calculate velocity and throughput [METRIC]
2. **Read** previous team performance reports for trend baseline [METRIC]
3. **Glob** `**/burndown*` or `**/velocity*` to find existing tracking data [PLAN]
4. **Grep** for overtime, blocker, or morale mentions in retrospective outputs [INFERENCIA]

## Entrada (Input Requirements)
- Sprint/iteration completion data
- Team composition and allocation
- Work item completion metrics
- Team health survey results (if available)
- Historical velocity/throughput data

## Proceso (Protocol)
1. **Velocity tracking** — Calculate velocity per sprint (story points completed)
2. **Throughput tracking** — Measure items completed per period (Kanban)
3. **Burndown/burnup** — Generate sprint and release burndown/burnup charts
4. **Predictability metric** — Calculate % of sprint/PI commitments delivered
5. **Quality metrics** — Track defect escape rate, rework percentage
6. **Health assessment** — Conduct team health check (Spotify model or similar)
7. **Morale indicators** — Monitor overtime, voluntary turnover signals, engagement
8. **Trend analysis** — Identify performance and health trends over 5+ sprints
9. **Root cause analysis** — For declining metrics, identify contributing factors
10. **Improvement actions** — Recommend specific actions based on findings

## Edge Cases
1. **Velocity declining for 3+ sprints** — Do not increase pressure. Investigate root causes: scope creep, technical debt, team fatigue, dependency blocks. The decline is a symptom, not the problem [METRIC].
2. **Team health rated Red on multiple dimensions** — Trigger management intervention. Health problems compound — address the root dimension first (usually team dynamics or workload) [STAKEHOLDER].
3. **Velocity artificially inflated (story point inflation)** — Compare with throughput (item count) and lead time. If velocity rises but throughput is flat, points are inflated. Recalibrate estimation [METRIC].
4. **New team member joins mid-tracking** — Expect 2-3 sprint velocity dip during onboarding. Adjust forecast accordingly. Do not blame the team for the dip [INFERENCIA].

## Example: Good vs Bad

**Good example — Balanced performance dashboard:**

| Attribute | Value |
|-----------|-------|
| Velocity | 5-sprint trend: 28, 30, 32, 31, 33 (stable, slight upward) |
| Predictability | 85% of sprint commitments delivered |
| Quality | Defect escape rate 3% (below 5% threshold) |
| Health | 8/10 dimensions rated Blue, 2 Amber |
| Morale | No overtime trend, team engagement survey positive |
| Actions | 2 improvement recommendations from trend analysis |

**Bad example — Velocity-only tracking:**
"Team velocity is 35 points." Single metric, no trend, no quality, no health, no context. Velocity without health tracking optimizes for speed and ignores sustainability. A team delivering 35 points while burning out will deliver 15 points next quarter.

## Salida (Deliverables)
- Team performance dashboard
- Velocity/throughput trend charts
- Team health radar chart
- Burndown/burnup charts
- Performance improvement recommendations

## Validation Gate
- [ ] Velocity/throughput tracked over ≥3 sprints with trend analysis [METRIC]
- [ ] Predictability metric calculated (% commitments delivered) [METRIC]
- [ ] Quality metrics included (defect rate, rework %) [METRIC]
- [ ] Team health assessed on ≥8 dimensions [METRIC]
- [ ] Both output metrics and health indicators tracked (not just velocity) [PLAN]
- [ ] Trend analysis covers ≥5 data points [METRIC]
- [ ] Declining metrics have root cause hypothesis [INFERENCIA]
- [ ] Evidence ratio: ≥85% [METRIC], <15% [SUPUESTO]
- [ ] Recommendations are specific and actionable [PLAN]
- [ ] Dashboard readable by both team and management [PLAN]

## Escalation Triggers
- Velocity declining for 3+ consecutive sprints
- Team health rated "Red" on multiple dimensions
- Predictability below 60%
- Overtime exceeding sustainable threshold

## Additional Resources

| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | Team performance metrics and health models | `references/body-of-knowledge.md` |
| State of the Art | Modern team effectiveness research | `references/state-of-the-art.md` |
| Knowledge Graph | Team performance in execution phases | `references/knowledge-graph.mmd` |
| Use Case Prompts | Performance tracking scenarios | `prompts/use-case-prompts.md` |
| Metaprompts | Custom team metrics frameworks | `prompts/metaprompts.md` |
| Sample Output | Reference team dashboard | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
