# Plugin Idea Evaluation Framework

> Reference material for `ideate-plugin` skill. Use this canvas to evaluate plugin ideas systematically.

---

## 1. Value Proposition Canvas

Evaluate the plugin idea across four dimensions:

| Dimension | Question | Score (1-5) |
|-----------|----------|-------------|
| **Pain Severity** | How painful is the problem without this plugin? | |
| **Frequency** | How often does the target user encounter this problem? | |
| **Alternative Gap** | How well do existing tools/plugins solve this? (5 = no alternatives) | |
| **Automation Fit** | How well does this map to Claude Code's capabilities? | |

**Threshold**: Total score >= 14 suggests a strong plugin candidate. Below 10, reconsider.

---

## 2. Audience Fit Matrix

| Audience Segment | Needs This? | Has Access to Claude Code? | Would Discover It? |
|-----------------|-------------|---------------------------|-------------------|
| Solo developers | | | |
| Team leads | | | |
| DevOps engineers | | | |
| Architects | | | |
| PreSales / consultants | | | |

A plugin should strongly serve at least one segment. Serving multiple is a bonus but not required.

---

## 3. Competitive Landscape Analysis

For each existing plugin or tool that overlaps:

```
Plugin/Tool: {name}
Overlap: FULL | PARTIAL | TANGENTIAL
What it does well: ...
What it misses: ...
Differentiation opportunity: ...
```

If 3+ tools have FULL overlap, the idea needs significant differentiation or should be abandoned.

---

## 4. Complexity Estimation Guide

| Complexity | Skills | Agents | Hooks | Estimated Dev Time |
|-----------|--------|--------|-------|-------------------|
| MINIMAL | 1-5 | 0-1 | 0-2 | 1-2 sessions |
| STANDARD | 6-15 | 1-2 | 2-5 | 3-5 sessions |
| LARGE | 16-30 | 2-4 | 5-10 | 5-10 sessions |
| ENTERPRISE | 30+ | 4+ | 10+ | 10+ sessions |

---

## 5. Plugin Spec Constraint Checklist

Before proceeding, verify the idea does not require:

- [ ] Persistent background processes (not supported)
- [ ] Direct network access beyond what tools provide (limited)
- [ ] Write access outside the plugin sandbox (blocked)
- [ ] Interactive UI elements (not supported)
- [ ] Real-time event streaming (not supported)
- [ ] Database or persistent storage beyond `${CLAUDE_PLUGIN_DATA}` (limited)

If any box is checked, document the constraint and propose a workaround or scope reduction.

---

## 6. Naming Conventions

Plugin names must:
- Be kebab-case: `^[a-z][a-z0-9]*(-[a-z0-9]+)*$`
- Be 2-4 words (e.g., `plugin-qa`, `devops-toolkit`, `api-designer`)
- Not start with `claude-` (reserved namespace)
- Be globally unique within the target marketplace
- Be descriptive of purpose, not implementation

Good: `test-harness`, `doc-linter`, `schema-validator`
Bad: `my-plugin`, `tool-v2`, `claude-helper`, `utils`

---

## 7. Movement Design Heuristic

Group capabilities into movements using this heuristic:

1. **Can the user stop after this phase and have something useful?** If yes, it is a movement boundary.
2. **Does this phase produce an artifact that the next phase consumes?** If yes, they are sequential movements.
3. **Can these skills run in any order?** If yes, they belong to the same movement.

Aim for 2-5 movements. Fewer than 2 means the plugin is too simple for movements (use flat structure). More than 5 suggests the plugin should be split.
