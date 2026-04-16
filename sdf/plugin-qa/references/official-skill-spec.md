# Official Skill Specification Digest

> Source: Claude Code official documentation
> Scope: SKILL.md frontmatter, body rules, invocation, context budget, and locations

---

## 1. Skill Structure

A skill is a **directory** containing a `SKILL.md` file. Optional companion directories:

```
my-skill/
  SKILL.md              # REQUIRED — frontmatter + body
  references/           # Supplementary knowledge (loaded on demand)
  examples/             # Example inputs/outputs
  prompts/              # Reusable prompt fragments
  scripts/              # Shell/Python scripts for hooks or build
  assets/               # Static files (templates, schemas, images)
```

---

## 2. Frontmatter Fields

All fields are optional unless noted. Frontmatter uses YAML between `---` delimiters.

| Field | Type | Default | Constraints / Notes |
|-------|------|---------|---------------------|
| `name` | string | directory name | Lowercase + hyphens only. Max 64 chars. |
| `description` | string | first paragraph of body | Claude uses this for auto-invoke decisions. Write in third person with 3-5 trigger phrases. |
| `argument-hint` | string | none | Autocomplete hint shown in `/` menu. E.g. `"[issue-number]"` |
| `disable-model-invocation` | boolean | false | `true` = only the user can invoke (via `/` or direct mention). Claude never auto-invokes. |
| `user-invocable` | boolean | true | `false` = hidden from the `/` menu. Only other skills/agents or Claude can invoke. |
| `allowed-tools` | array[string] | all tools | Allowlist of tools. Values: `Read`, `Write`, `Edit`, `Glob`, `Grep`, `Bash`, `Agent`, `Skill`, `WebFetch`, `WebSearch`, `TodoWrite`, `NotebookEdit`, etc. |
| `model` | string | inherit | `sonnet`, `opus`, `haiku`, or full model ID (e.g. `claude-sonnet-4-20250514`). |
| `context` | string | inline | `"fork"` = run in a forked subagent (separate context window). |
| `agent` | string | default | Which subagent type to use when `context: fork`. |
| `hooks` | object | none | Hooks scoped to this skill's lifecycle (same schema as global hooks). |

---

## 3. Invocation Matrix

| `user-invocable` | `disable-model-invocation` | Who can invoke |
|-------------------|----------------------------|----------------|
| true (default) | false (default) | User via `/` menu + Claude auto-invokes |
| true | true | User via `/` menu only |
| false | false | Claude auto-invokes only (hidden from user) |
| false | true | Nobody (effectively disabled) |

---

## 4. String Substitutions

Available in the SKILL.md body (not frontmatter):

| Variable | Expands to |
|----------|------------|
| `$ARGUMENTS` | Full argument string passed by user |
| `$ARGUMENTS[N]` | Nth whitespace-delimited argument (0-indexed) |
| `$N` | Shorthand for `$ARGUMENTS[N]` (e.g. `$0`, `$1`) |
| `${CLAUDE_SESSION_ID}` | Current session UUID |
| `${CLAUDE_SKILL_DIR}` | Absolute path to this skill's directory |

---

## 5. Dynamic Context

Use `!` backtick syntax to inline command output at load time:

```markdown
Current branch: !`git branch --show-current`
File list: !`ls src/`
```

The command runs when the skill is loaded, and its stdout replaces the expression.

---

## 6. Body Rules

- Write in **imperative form** (commands, not descriptions)
- Maximum **500 lines** in SKILL.md body
- Overflow content goes to `references/` directory
- Explain **WHY** not just WHAT
- Prefer **tables over bullet lists** for structured data
- Use **code blocks** for templates, schemas, and examples
- First paragraph becomes the default `description` if not set in frontmatter

---

## 7. Context Budget

- Skills consume approximately **2% of the context window**
- Fallback budget: **16,000 characters** if context window size is unknown
- Override with environment variable: `SLASH_COMMAND_TOOL_CHAR_BUDGET=<chars>`
- Content beyond budget is truncated — put highest-priority content first
- References are loaded on demand and count against budget when loaded

---

## 8. Skill Location Priority

Resolution order (highest priority wins):

1. **Enterprise managed** — provisioned by org admin
2. **Personal** — `~/.claude/skills/`
3. **Project** — `.claude/skills/`
4. **Plugin** — namespaced as `plugin-name:skill-name`

If two skills share a name, the higher-priority location wins.

---

## 9. Plugin-Namespaced Skills

Skills from plugins are invoked with their plugin prefix:

```
/my-plugin:my-skill [arguments]
```

The namespace prevents collisions between plugins and between plugins and local skills.

---

## 10. References Directory Convention

Files in `references/` are not auto-loaded. Skills must explicitly read them:

```markdown
Read ${CLAUDE_SKILL_DIR}/references/api-guide.md for API details.
```

References longer than 300 lines should include a table of contents at the top.

---

## 11. Allowed-Tools Catalog

Common tool names for the `allowed-tools` array:

| Tool | Purpose |
|------|---------|
| `Read` | Read files from disk |
| `Write` | Create or overwrite files |
| `Edit` | Surgical string replacements in files |
| `Glob` | Find files by pattern |
| `Grep` | Search file contents by regex |
| `Bash` | Execute shell commands |
| `Agent` | Spawn a subagent |
| `Skill` | Invoke another skill |
| `WebFetch` | Fetch and process a URL |
| `WebSearch` | Web search |
| `TodoWrite` | Manage task lists |
| `NotebookEdit` | Edit Jupyter notebooks |

Omitting `allowed-tools` grants access to all available tools.
