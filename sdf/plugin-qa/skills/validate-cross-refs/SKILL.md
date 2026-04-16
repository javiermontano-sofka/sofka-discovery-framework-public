---
name: validate-cross-refs
description: "Validates cross-reference integrity across all plugin components. Detects broken references, orphaned skills, missing aliases, and settings.json inconsistencies. Triggers: validate cross-refs, check references, dependency audit, orphan detection."
author: JM Labs (Javier Montaño)
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
---

# Validate Cross-References

> "An orphaned skill is dead code. A broken reference is a runtime error waiting to happen."

Validates that all internal references between plugin components (agents referencing skills, commands referencing agents, aliases pointing to canonical commands, settings.json declaring agents) are valid and resolvable. Detects orphaned components that no other file references.

---

## Procedure

### Step 1 -- Build Component Inventory

- Enumerate all skills: glob `skills/*/SKILL.md`, extract the `name` from frontmatter. Build map: `skill-name -> file-path`.
- Enumerate all agents: glob `agents/*.md`, extract the `name` from frontmatter. Build map: `agent-name -> file-path`.
- Enumerate all commands: glob `commands/*.md`, extract filename (without `.md`) as command name. Build map: `command-name -> file-path`.
- Report total counts per type.

### Step 2 -- Validate Agent-to-Skill References

- For each agent file, scan the body for skill name references.
- Look for patterns: skill names in tables, backtick-quoted names, explicit lists of assigned skills.
- For each referenced skill name, verify it exists in the skill inventory.
- Report `CRITICAL` for any skill reference that does not match an existing skill.
- Report the agent file and line number where the broken reference appears.

### Step 3 -- Validate Command-to-Skill/Agent References

- For each command file, scan body for skill and agent references.
- Commands may reference skills they invoke or agents they delegate to.
- For each reference, verify existence in the corresponding inventory.
- Report `CRITICAL` for broken references with file and line context.

### Step 4 -- Validate Alias Commands

- Identify commands with `alias-of` in their frontmatter.
- Verify the `alias-of` value matches an existing command name (the canonical command).
- Report `CRITICAL` if the alias target does not exist.
- Report `CRITICAL` for circular aliases (A aliases B, B aliases A).
- Report `WARNING` for alias chains (A aliases B, B aliases C) -- recommend direct aliasing.

### Step 5 -- Validate settings.json Agent Reference

- If `settings.json` exists in the plugin root, read it.
- Check for `agent` key (canonical). If `defaultAgent` is found instead, report `INFO: Consider migrating to "agent" key`. Verify the referenced agent exists in `agents/`.
- Report `CRITICAL` if the declared agent does not exist.
- If settings.json does not exist, report `INFO: No settings.json found`.

### Step 6 -- Detect Orphaned Components

- A skill is **orphaned** if no agent file and no command file references it by name.
- An agent is **orphaned** if no command references it and settings.json does not declare it as default.
- Report `WARNING` for each orphaned skill with its name and path.
- Report `INFO` for orphaned agents (an agent may be used implicitly).
- Note: commands are user-invocable and therefore never considered orphaned.

### Step 7 -- Check CLAUDE.md Command Coverage

- If a `CLAUDE.md` file exists at the plugin root, read it.
- Extract all command names mentioned in CLAUDE.md.
- Compare against the command inventory.
- Report `WARNING` for any command not mentioned in CLAUDE.md (undocumented command).
- Report `WARNING` for any command mentioned in CLAUDE.md that does not exist (stale reference).

### Step 8 -- Generate Cross-Reference Report

- Produce findings table: `| Severity | Source File | Reference | Target | Status |`.
- Include a dependency summary section:
  - Agents and the skills they reference (validated).
  - Commands and the agents/skills they reference (validated).
  - Orphaned components list.
- If all references resolve and no orphans: "Cross-reference validation PASSED".

---

## Quality Criteria

- [ ] Reference detection uses multiple patterns (backtick names, table cells, prose mentions) to avoid false negatives.
- [ ] Orphan detection accounts for implicit usage (agent declared in settings.json counts as referenced).
- [ ] Alias chain detection follows the full chain, not just one level.
- [ ] CLAUDE.md checks are case-insensitive for command name matching.
- [ ] Every broken reference includes the source file, line number, referenced name, and a "Did you mean?" suggestion when edit distance is close.

## Assumptions & Limits

- Read-only. This skill never creates or modifies any plugin files.
- Reference detection is heuristic -- a skill name mentioned in prose (e.g., "similar to validate-hooks") counts as a reference even if it is not an actual invocation.
- Cannot detect runtime references (e.g., a hook command that dynamically invokes a skill by name via environment variable).
- Orphan detection has false positives for skills that are invoked implicitly by convention rather than explicit reference in an agent or command file.
- Edit distance for "Did you mean?" suggestions uses a simple Levenshtein threshold (distance ≤ 2) -- unusual names may not match.

## Good vs Bad

**Bad finding:**
```
Broken reference found.
```
Missing: no source file, no target, no suggestion.

**Good finding:**
```
CRITICAL | agents/plugin-qa-engineer.md:15 | Skill reference "valdate-hooks" does not exist. Did you mean "validate-hooks"? (edit distance: 1)
```
Includes: severity, source file with line number, broken reference, suggestion with edit distance.

## Anti-Patterns

1. Only checking backtick-quoted references and missing table-based skill assignments in agents.
2. Reporting commands as orphaned (they are user-facing entry points by definition).
3. Not following alias chains to detect circular references.
4. Treating a missing CLAUDE.md as a CRITICAL error (it is optional).

## Edge Cases

1. Agent references a skill that exists but has a typo in the name (e.g., `valdate-hooks`) -- CRITICAL with "Did you mean `validate-hooks`?" suggestion using edit distance.
2. Plugin with only commands and no agents or skills -- valid architecture, no orphan warnings.
3. Multiple agents referencing the same skill -- valid, not a duplicate.
4. Command with `alias-of` pointing to another alias -- WARNING for alias chain depth > 1.
5. settings.json with `defaultAgent` set to an empty string -- CRITICAL.
