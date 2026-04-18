# Contributing (SDF-specific overrides)

Monorepo-level rules: [`../CONTRIBUTING.md`](../CONTRIBUTING.md). This file covers **SDF-only** particulars.

## Pre-PR gate (SDF)

```bash
cd sdf
bash scripts/audit-sdk-compliance.sh        # no Agent tool in subagents
bash scripts/audit-command-prefixes.sh      # only /sdf: prefix
python scripts/tests/validate_yaml.py       # 1,783 YAML frontmatters parse
bash scripts/validators/run-all.sh          # 6 docs validators
source scripts/.venv/bin/activate && pytest scripts/tests/ -q   # 57 tests
```

All five must exit 0.

## SDF-specific review points

1. **New skill** → must be 7/7 INSIGNIA. Run `python scripts/ecosystem/stamp-7of7.py` to scaffold missing dirs.
2. **New agent** → `tools:` array must not include `Agent` unless the agent is an orchestrator. `audit-sdk-compliance.sh` enforces.
3. **New command** → prefix `/sdf:` only. Foreign-prefix references fail `audit-command-prefixes.sh`.
4. **New ontology file** → add row to `CLAUDE.md` ontology index table. `count-parity` will flag if the count is miscited elsewhere.
5. **New validator** → see "How to add a new validator" in the B9 commit message; shared infra is `scripts/validators/_lib.py` + `_manifest.yaml`.
6. **New ADR** → copy `docs/adr/TEMPLATE.md` to the next sequential number. Numbering is dense; do not skip.

## Skill frontmatter contract

```yaml
---
name: <skill-name>                # kebab-case, matches directory
description: >
  First sentence is an action trigger (e.g. "Use this skill when..."). ≤ 450 chars.
allowed-tools:                    # optional
  - Read
  - Grep
author: Javier Montaño
contributors: "Jean Ruiz Granda (ad-hoc feedback & review), Catherine Rodrigo"
copyright: "© 2026 Sofka Technologies. All Rights Reserved."
co-authored-with: Claude Code
---
```

MAO skills (inside `metodologia-discovery-framework/`) substitute `"© 2026 Comunidad MetodologIA. Licensed under GPL-3.0."` for copyright. JM Labs skills substitute `"© 2026 JM Labs. Personal knowledge project."`.

## Agent frontmatter contract

```yaml
---
name: <agent-name>                # matches filename stem
description: "Use this subagent when …"
tools: [Read, Grep, Glob, Bash]   # no Agent tool unless orchestrator
model: sonnet                     # or haiku / opus based on role
author: Javier Montaño
contributors: "Jean Ruiz Granda (ad-hoc feedback & review), Catherine Rodrigo"
copyright: "© 2026 Sofka Technologies. All Rights Reserved."
co-authored-with: Claude Code
---
```

## Where things go

- **Global rules** (apply to every skill/agent) → `agents/_defaults.md`, `agents/_metacognitive-rules.md`
- **Per-plugin operational knowledge** → `references/ontology/*.md`
- **Per-plugin pedagogical docs** → `docs/` (Diátaxis quadrants)
- **Decisions** → `docs/adr/`
- **Scripts** → `scripts/` (plugin internals) or `scripts/ecosystem/` (multi-plugin batch work) or `scripts/validators/` (CI checks)

---

**Author**: Javier Montaño · **Contributors**: Jean Ruiz Granda, Catherine Rodrigo · **Co-authored with**: Claude Code · **Copyright**: © 2026 Sofka Technologies. All Rights Reserved.
