# Claude Code Plugin Directory Specification

> Digest of required and optional directories/files for a valid Claude Code plugin.

## Required Structure

```
<plugin-root>/
  .claude-plugin/
    plugin.json          # REQUIRED — only file allowed here
  skills/                # REQUIRED (unless commands-only plugin)
    <skill-name>/
      SKILL.md           # REQUIRED per skill
      references/        # Optional MOAT asset
      examples/          # Optional MOAT asset
      prompts/           # Optional MOAT asset
  commands/              # REQUIRED
    <command-name>.md    # One file per command
  agents/                # RECOMMENDED
    <agent-name>.md      # One file per agent
  hooks/                 # OPTIONAL
    hooks.json           # Hook configuration
  CLAUDE.md              # RECOMMENDED — plugin instructions
  README.md              # RECOMMENDED — plugin documentation
  settings.json          # OPTIONAL — default agent config
  LICENSE                # RECOMMENDED
```

## Naming Rules

- All directory and file names (excluding extensions): **kebab-case**
- Pattern: `^[a-z][a-z0-9]*(-[a-z0-9]+)*$`
- `.claude-plugin` directory name is case-sensitive on Linux/macOS

## Severity Classification

| Condition | Severity |
|-----------|----------|
| Missing `.claude-plugin/plugin.json` | CRITICAL |
| Missing `skills/` or `commands/` | CRITICAL |
| Skill directory missing `SKILL.md` | CRITICAL |
| Nested skill directories | CRITICAL |
| Missing `agents/` | WARNING |
| Missing `hooks/` | INFO |
| Non-kebab-case naming | WARNING |
| Unexpected files in `.claude-plugin/` | WARNING |
| Symlinks in plugin tree | WARNING |
| Empty directories | WARNING (skills/) / INFO (others) |
| `.DS_Store`, `.gitkeep` | INFO |
