# Metaprompts — Team Performance & Health Tracking

> Meta-level strategies to maximize performance assessment effectiveness.

---

## 1. Goodhart's Law Guard

**Purpose:** Prevent metrics from becoming targets that distort behavior.

```
For each metric being tracked, apply Goodhart's Law check:

1. If velocity becomes a KPI, teams inflate story points → Check: are average
   story point sizes increasing while feature complexity is stable?

2. If throughput becomes a KPI, teams split items into tiny pieces → Check:
   is average item size decreasing without meaningful value per item?

3. If predictability becomes a KPI, teams sandbag commitments → Check:
   is the team committing to less than historical capacity?

4. If cycle time becomes a KPI, teams skip quality → Check:
   is defect rate increasing as cycle time decreases?

For each detected distortion:
- Remove the metric as a KPI (keep as diagnostic only)
- Replace with outcome metric that is harder to game
- Tag finding [METRIC] with remediation plan
```

---

## 2. Context-Aware Performance Assessment

**Purpose:** Ensure performance metrics are interpreted in proper context.

```
Before drawing conclusions from performance data:

CONTEXT 1 — Team Maturity:
- Forming teams (first 3 sprints): expect low, volatile velocity
- Storming teams: expect declining velocity (normal, not alarming)
- Norming/Performing: expect stable, predictable velocity

CONTEXT 2 — External Factors:
- Were there holidays, sick days, or team changes this period?
- Were there production incidents consuming team time?
- Were there organizational changes affecting focus?

CONTEXT 3 — Scope Complexity:
- Was this sprint's work more/less complex than average?
- Were there technical spikes or research tasks (lower velocity, higher learning)?

Adjust narrative based on context. Never present raw metrics
without contextual interpretation.
```

---

## 3. Progressive Disclosure Strategy

```
PHASE 1 — Always load:
- SKILL.md frontmatter + Proceso section
- Sprint/iteration data
- Team roster

PHASE 2 — On-demand:
- references/body-of-knowledge.md §2 (performance metrics)
  → When selecting which metrics to track
- references/body-of-knowledge.md §3 (health check models)
  → When facilitating health checks

PHASE 3 — Deep:
- references/state-of-the-art.md (DORA/SPACE)
  → For engineering teams with DevOps practices
- examples/sample-output.md
  → When formatting performance dashboard
```

---

*PMO-APEX v1.0 — Metaprompts · Team Performance & Health Tracking*
