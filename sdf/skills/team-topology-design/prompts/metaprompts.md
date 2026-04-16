# Metaprompts — Team Topology Design

> Meta-level strategies to maximize team topology design effectiveness.

---

## 1. Conway's Law Alignment Verification

**Purpose:** Verify that proposed team structure produces desired architecture.

```
For each team in the design:

1. Map team → system components owned
2. For each cross-team dependency:
   - Does the dependency reflect a desired architectural boundary?
   - Or does it indicate a team boundary that will produce unwanted coupling?
3. If team boundary contradicts desired architecture:
   - Adjust team boundary to match architecture
   - OR adjust architecture to match team boundary (sometimes teams are right)
4. Produce alignment matrix:
   | Team | Components Owned | Dependencies | Architecture Alignment |
```

---

## 2. Cognitive Load Calibration

**Purpose:** Ensure cognitive load assessments are evidence-based, not assumed.

```
For each team's cognitive load score:

1. VERIFY domain count: count distinct business domains the team must understand
2. VERIFY service count: count services the team deploys and operates
3. VERIFY tech diversity: count distinct technology stacks in daily use
4. VERIFY dependency count: count teams this team must coordinate with weekly
5. CROSS-CHECK with team: does the team agree with the assessment?

If team reports lower load than metrics suggest → they may have adapted
(normalization of overload). Investigate further.

If team reports higher load than metrics suggest → hidden complexity exists.
Interview for undocumented responsibilities.

Tag verified scores [METRIC], unverified [SUPUESTO].
```

---

## 3. Progressive Disclosure Strategy

```
PHASE 1 — Always load:
- SKILL.md frontmatter + Proceso section
- Current org structure
- Architecture overview

PHASE 2 — On-demand:
- references/body-of-knowledge.md §2 (team type design rules)
  → When classifying teams
- references/body-of-knowledge.md §3 (interaction modes)
  → When designing team interactions

PHASE 3 — Deep:
- references/state-of-the-art.md
  → When platform engineering or dynamic reteaming is relevant
- examples/sample-output.md
  → When formatting topology map
```

---

*PMO-APEX v1.0 — Metaprompts · Team Topology Design*
