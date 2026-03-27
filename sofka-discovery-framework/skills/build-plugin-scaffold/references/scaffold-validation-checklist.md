# Scaffold Validation Checklist

Post-scaffold validation items to verify a newly built plugin is complete and correct. Used by `build-plugin-scaffold` Step 12.

---

## Required Files

| File | Location | Purpose | Severity if Missing |
|------|----------|---------|---------------------|
| `plugin.json` | `.claude-plugin/` | Plugin manifest | CRITICAL |
| `settings.json` | Plugin root | Default agent config | CRITICAL |
| `hooks.json` | `hooks/` | Hook definitions | WARNING |
| `CLAUDE.md` | Plugin root | Quick start + tables | WARNING |
| `README.md` | Plugin root | User documentation | INFO |
| `LICENSE` | Plugin root | License terms | INFO |

## Required Directories

| Directory | Purpose | Severity if Missing |
|-----------|---------|---------------------|
| `.claude-plugin/` | Plugin metadata | CRITICAL |
| `skills/` | Skill definitions | CRITICAL |
| `commands/` | Command definitions | CRITICAL |
| `agents/` | Agent definitions | WARNING |
| `hooks/` | Hook scripts | WARNING |

## Content Validation

### plugin.json
- [ ] Valid JSON syntax
- [ ] `name` field present and non-empty
- [ ] `version` field present and follows semver
- [ ] `description` field present and non-empty

### settings.json
- [ ] Valid JSON syntax
- [ ] `agent` field references an existing agent file

### hooks.json
- [ ] Valid JSON syntax
- [ ] `hooks` is an array
- [ ] Each hook has `type`, `event`, and execution fields

### Agent Files
- [ ] Valid YAML frontmatter
- [ ] `name` field matches filename
- [ ] `description` field present
- [ ] No forbidden fields: `hooks`, `mcpServers`, `permissionMode`

### Command Files
- [ ] Valid YAML frontmatter
- [ ] `description` field present
- [ ] `user-invocable: true` present
- [ ] Alias files have `alias-of` pointing to valid canonical

### Skill Directories
- [ ] Each contains `SKILL.md`
- [ ] SKILL.md has valid YAML frontmatter
- [ ] `name` matches directory name
- [ ] `description` field present

## Naming Conventions
- [ ] All directories are kebab-case
- [ ] All file names (excluding extensions) are kebab-case
- [ ] `.claude-plugin` is exact (not `.Claude-Plugin` or variants)
