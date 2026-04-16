# Plugin QA (PQA) v3.0 -- Plugin Development Lifecycle

> **PQA** = Plugin Quality Auditor.
> Full-lifecycle framework for Claude Code plugins: create from scratch or QA existing plugins.
> The plugin that audits plugins -- and exemplifies every standard it enforces.
> 4 agents · 20 skills · 31 commands · 9 scripts · 13 ontology files · 9 movements · 4 quality gates.
> Brand: **JM Labs** | Prefix: `/pqa:` | License: MIT
> (c) 2026 JM Labs - Javier Montano.

---

## Quick Start

```
/pqa:audit              # Full QA audit (9 skills, report + scorecard)
/pqa:validate           # Quick structural validation (5 skills, fast)
/pqa:create <idea>      # Build a plugin from scratch (5 upstream movements)
/pqa:lifecycle <idea>   # Full lifecycle: create + QA (9 movements)
/pqa:fix                # Auto-fix common issues (asks before modifying)
/pqa:menu               # Show all 31 commands
```

---

## Ontology -- Index

This CLAUDE.md is a hub. Deep knowledge lives in 13 specialized sub-files:

| Need | Read |
|------|------|
| Evidence tags and severity rules | `references/ontology/protocol-evidence.md` |
| Pipeline flows and data contracts | `references/ontology/pipeline-orchestration.md` |
| 4 agents and their roles | `references/ontology/agent-roster.md` |
| 20 skills by movement | `references/ontology/skills-catalog.md` |
| 31 commands reference | `references/ontology/commands-reference.md` |
| Quality gates G1-G4 | `references/ontology/quality-gates.md` |
| Report/scorecard format, grading | `references/ontology/output-standards.md` |
| Session priming policy | `references/ontology/rag-priming-policy.md` |
| Hooks lifecycle, scripts, pqa/ dir | `references/ontology/session-automation.md` |
| Lessons learned (living) | `references/ontology/lessons-learned.md` |
| Intent-to-movement routing | `references/ontology/service-routing.md` |
| JM Labs branding | `references/ontology/brand-orchestration.md` |
| MOAT dimensions and scoring | `references/ontology/moat-methodology.md` |

---

## Hard Rules

1. **Evidence first** -- Every finding tagged: `[SPEC]` `[SCANNED]` `[INFERRED]` `[ASSUMED]`
2. **Read before write** -- Scan existing plugin structure before judging
3. **Gates are hard stops** -- G1, G2, G3, G4. Pause for explicit user approval
4. **Autoridad moral** -- PQA's own structure must pass its own audit at Grade A
5. **MOAT depth** -- Every PQA skill has full MOAT assets
6. **No invention** -- Do not fabricate files, metrics, or behavior
7. **Changelog** -- Every significant action logged to `pqa/session-changelog.md`

---

## Architecture

```
plugin-qa/
├── .claude-plugin/
│   └── plugin.json          # Manifest (name: pqa)
├── agents/                  # 4 specialized agents
├── commands/                # 31 commands (20 canonical + 11 aliases)
├── skills/                  # 20 skills (SKILL.md + references/ + examples/)
├── references/
│   ├── ontology/            # 13 operational knowledge files
│   ├── official-plugin-spec.md
│   ├── official-skill-spec.md
│   ├── official-agent-spec.md
│   ├── official-hook-spec.md
│   ├── moat-pattern-guide.md
│   └── lifecycle-pipeline.md
├── hooks/
│   └── hooks.json           # SessionStart + PostToolUse (Write|Edit)
├── scripts/                 # 9 operational scripts
├── CLAUDE.md                # This hub
└── README.md
```

---

## Session Automation

On plugin activation, hooks generate in `pqa/`:
- `SESSION-README.md` -- Target plugin context
- `SESSION-CLAUDE.md` -- Session instructions
- `calibration-digest.md` -- Plugin detection state
- `ghost-menu.md` -- Contextual navigation
- `session-changelog.md` -- Action log
- `session-state.json` -- Pipeline state tracker

PostToolUse hooks (Write|Edit) maintain changelog, prune context, and validate frontmatter.

> Detail: `references/ontology/session-automation.md`

---

## Domain References

The `references/` directory contains 6 digest files providing specification knowledge:

| File | Content |
|------|---------|
| `official-plugin-spec.md` | Claude Code plugin specification digest |
| `official-skill-spec.md` | Skill file format and frontmatter fields |
| `official-agent-spec.md` | Agent file format and subagent constraints |
| `official-hook-spec.md` | Hook types, events, and ToolUseContext rules |
| `moat-pattern-guide.md` | MOAT pattern methodology and scoring |
| `lifecycle-pipeline.md` | 9-movement pipeline orchestration reference |

---

## Lessons Learned

On corrections, update `references/ontology/lessons-learned.md`.
Review at session start to avoid repeating mistakes.

---

*PQA v3.0 -- The plugin that audits plugins. JM Labs - Javier Montano.*
