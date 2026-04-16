# PQA Session Automation

> Hooks lifecycle, scripts, and the `pqa/` work directory.

## Hooks Architecture

PQA uses 2 hook events with `type:command` only:

### SessionStart (5 hooks)

| Order | Script | Purpose |
|-------|--------|---------|
| 1 | `plugin-scan.sh` | Detect plugin in working directory |
| 2 | `session-context-gen.sh` | Generate 3 session files |
| 3 | `session-init.sh` | Create session-state.json |
| 4 | `ghost-menu-inject.sh` | Generate ghost menu |
| 5 | `session-changelog.sh` | Initialize changelog |

### PostToolUse (3 hooks, matcher: `Write|Edit`)

| Order | Script | Purpose |
|-------|--------|---------|
| 1 | `session-changelog.sh` | Log the write/edit action |
| 2 | `context-prune.sh` | Compress files >150 lines |
| 3 | `post-write-validate.sh` | Validate frontmatter integrity |

## Active Plugin Guard

All hooks use the guard pattern to avoid interference with other plugins:

```bash
G="$1/pqa/active-plugin"; M="pqa"
[ -f "$G" ] && [ "$(cat "$G" 2>/dev/null)" != "$M" ] && exit 0
```

If another plugin (SA, MAO, SDF) owns the session, PQA hooks exit silently.

## Scripts Inventory (9 scripts)

| Script | Hook | Purpose |
|--------|------|---------|
| `plugin-scan.sh` | SessionStart | Detect plugin structure markers |
| `session-context-gen.sh` | SessionStart | Generate session context files |
| `session-init.sh` | SessionStart | Initialize session state |
| `ghost-menu-inject.sh` | SessionStart | Generate navigation menu |
| `session-changelog.sh` | Both | Initialize/append changelog |
| `auto-prime-check.sh` | SessionStart | Check if session is primed |
| `context-prune.sh` | PostToolUse | Auto-compress large files |
| `post-write-validate.sh` | PostToolUse | Frontmatter validation |
| `index-plugin.sh` | Manual | Generate plugin inventory JSON |

## Session State Schema

```json
{
  "version": "3.0",
  "plugin": "target-plugin-name",
  "targetDir": "/path/to/plugin",
  "movement": "IDLE",
  "gatesPassed": [],
  "findings": { "critical": 0, "warning": 0, "info": 0 },
  "skillsExecuted": [],
  "createdAt": "2026-03-19T00:00:00Z"
}
```

---
*PQA v3.0 — Automated context, zero manual setup.*
