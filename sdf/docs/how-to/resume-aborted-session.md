# How to resume an aborted session

**When you need this**: Previous session ended mid-pipeline (crash, meeting interruption, machine reboot).

**Prerequisites**: `.discovery/session-state.json` still exists.

**Time**: 2-5 min to reorient, then resume normal pipeline flow.

## Steps

1. Open Claude Code at the repo root. Hooks auto-regenerate `.discovery/SESSION-*.md`.
2. Read `.discovery/session-changelog.md` — last entry tells you where the pipeline stopped.
3. Check `ghost-menu.md` — shows the next command.
4. Resume:

   ```
   /sdf:a         # advance to next step
   ```

   Or more specifically:

   ```
   /sdf:go <P0..P9>    # jump to a specific stage
   ```

## Verification

- Next deliverable builds on the previous one's contents (check cross-references).
- `session-state.json` `stage` field matches what you expect.

## Common pitfalls

- If `.discovery/session-state.json` is corrupt, run `/sdf:reset-session`; you lose session continuity but files in `.discovery/` remain as evidence.
- If hooks fail to fire, restart Claude Code — MCP/hook registration needs a fresh session.

## See also

- `references/ontology/session-automation.md`
- [error-catalog E-SESS-*](../reference/error-catalog.md)
