---
name: design-agent
author: JM Labs (Javier Montaño)
description: >
  Design a plugin agent: role, tool allowlist, skill assignments, execution flows, operating principles.
  Trigger: design agent, agent design, create agent spec, plan agent, draft agent.
  Enforces plugin subagent constraints (no hooks/mcpServers/permissionMode in frontmatter).
argument-hint: "<agent-name> [plugin-path]"
allowed-tools:
  - Read
  - Write
  - Glob
  - Grep
  - Bash
---

# Design Agent

> "An agent is a role, not a god -- it owns a boundary, delegates within it, and never crosses it."

Design a plugin agent with complete frontmatter, role definition, skill assignments, execution flows, and operating principles. Prominently enforces the plugin subagent constraint: agents in plugins cannot use hooks, mcpServers, or permissionMode.

---

## CRITICAL: Plugin Subagent Constraints

**Plugin agents are subagents with restricted capabilities.** The following fields are FORBIDDEN in plugin agent frontmatter:

| Forbidden Field | Reason |
|----------------|--------|
| `hooks` | Plugin agents cannot define lifecycle hooks. Hooks belong in the plugin's `hooks.json`. |
| `mcpServers` | Plugin agents cannot start or connect to MCP servers. |
| `permissionMode` | Plugin agents cannot override the session's permission model. |

Attempting to use these fields will cause runtime errors or silent failures. This constraint is enforced by the Claude Code runtime and cannot be circumvented.

---

## Procedure

### Step 1 -- Define Role and Boundary

- Define the agent's role in one sentence following the pattern: "This agent {verb} {scope} by {method}."
- Establish the boundary: what the agent owns vs. what it delegates.
- Determine if this is the plugin's primary agent or a secondary specialist.
- Tag: `[DOC]` for role definition, `[CONFIG]` for boundary rules.

### Step 2 -- Draft Frontmatter

Draft the YAML frontmatter using ALL supported fields for plugin subagents:

| Field | Required | Type | Description |
|-------|----------|------|-------------|
| `name` | YES | string | kebab-case agent identifier |
| `description` | YES | string | Role summary + trigger phrases |
| `tools` | no | list[string] | Tool allowlist (same as skill `allowed-tools`) |
| `disallowedTools` | no | list[string] | Tool blocklist (opposite of `tools`) |
| `model` | no | string | Override model for this agent |
| `maxTurns` | no | integer | Maximum conversation turns before agent stops |
| `skills` | no | list[string] | Skills this agent can invoke |
| `memory` | no | object | Memory configuration for cross-session state |
| `background` | no | string | Background context loaded when agent activates |
| `isolation` | no | string | Isolation mode (e.g., `"worktree"` for git worktree isolation) |

**Use `tools` OR `disallowedTools`, never both.** If both are present, `disallowedTools` is ignored.

### Step 3 -- Map Skills to Agent

- List all skills this agent manages from the architecture plan.
- For each skill, specify:
  - Whether the agent invokes it directly or delegates to a sub-agent.
  - The typical invocation order (sequential, parallel, conditional).
  - Any shared data or state between skills.
- Verify skill names match the architecture plan. `[CODIGO]`

### Step 4 -- Design Execution Flows

- For each command the agent handles, document the execution flow:
  ```
  /prefix:command
  1. Agent receives request
  2. Runs skill-a
  3. If condition: runs skill-b, else: runs skill-c
  4. Collects results
  5. Presents to user
  ```
- Include error handling: what happens if a skill fails.
- Include quality gate checks between movements.
- Use Mermaid flowcharts for complex flows. `[DOC]`

### Step 5 -- Write Operating Principles

- Define 4-7 operating principles that govern the agent's behavior.
- Each principle must be:
  - **Specific** to this agent (not generic "be careful" advice).
  - **Actionable** (describes a behavior, not a value).
  - **Verifiable** (an observer can determine if it was followed).
- Common patterns:
  - "Read first, write never" (for analysis agents).
  - "Cite file + line" (for audit agents).
  - "Fail fast on CRITICAL" (for validation agents).
  - "Propose before creating" (for design agents).

### Step 6 -- Set maxTurns

- Estimate maxTurns based on:
  - Number of skills managed: roughly 3-5 turns per skill.
  - Complexity of execution flows: add 5 turns for complex routing.
  - User interaction points: add 2 turns per decision point.
- Formula: `maxTurns = (skills * 4) + (complexity_bonus) + (interaction_points * 2)`
- Round up to nearest 5 for headroom.
- Document the calculation. `[INFERENCIA]`

### Step 7 -- Validate Against Constraints

- Verify the designed agent does NOT include forbidden fields (hooks, mcpServers, permissionMode).
- Verify tools listed are available in the Claude Code environment.
- Verify skill names exist or are planned in the architecture.
- Cross-reference with the constraint matrix in `references/agent-constraint-matrix.md`. `[CONFIG]`

### Step 8 -- Compose Agent Body

- Structure the agent markdown body:
  ```
  # Agent Name
  **Role**: {one-sentence role description}
  ## Responsibilities
  ## Skills Assigned
  ## Execution Flows
  ## Operating Principles
  ## Delegation Criteria (if multi-agent plugin)
  ```
- Target length: 60-120 lines depending on complexity.
- Present for review. Write file only on user confirmation.

---

## Quality Criteria

- [ ] Agent frontmatter contains NO forbidden fields (hooks, mcpServers, permissionMode). `[CONFIG]`
- [ ] Every skill listed in the agent body exists in the architecture plan. `[CODIGO]`
- [ ] Execution flows cover all commands the agent handles. `[DOC]`
- [ ] Operating principles are specific, actionable, and verifiable. `[DOC]`
- [ ] maxTurns calculation is documented with rationale. `[INFERENCIA]`
- [ ] Tool selection follows least privilege -- no unnecessary tools. `[CONFIG]`

## Assumptions & Limits

- This skill produces an agent design document, not the final `.md` file. The output is a specification for review before `spec-agent-command` produces the deployable artifact.
- The forbidden fields list (hooks, mcpServers, permissionMode) reflects the current Claude Code runtime. If future versions allow these for plugin subagents, this constraint must be updated.
- The maxTurns formula is a heuristic estimate. Actual turn usage depends on task complexity, user interaction, and model behavior at runtime.
- Cannot validate that operating principles will actually be followed by the LLM -- they are prompt-level guidance, not enforced constraints.
- Agent skill assignments assume the architecture plan is finalized. If skills are added or removed after agent design, the agent must be redesigned.

## Good vs Bad

**Bad agent design:**
```
---
name: my-agent
description: Handles things
hooks:
  PreToolUse: [...]
---
# My Agent
This agent does validation.
```
Missing: forbidden `hooks` field, no tool allowlist, no skills assigned, no execution flows, no operating principles.

**Good agent design:**
```
---
name: plugin-qa-engineer
description: >
  Orchestrates validation, audit, and reporting for plugin quality assurance.
  Trigger: qa engineer, run validation, audit plugin.
tools:
  - Read
  - Glob
  - Grep
  - Bash
maxTurns: 45
---
# Plugin QA Engineer
**Role**: This agent validates plugin quality by orchestrating 9 QA skills across 4 movements.
## Skills Assigned
| Skill | Movement | Invocation |
|-------|----------|------------|
| validate-structure | VALIDATE | Sequential, first |
| validate-manifest | VALIDATE | Sequential, second |
## Operating Principles
1. Read first, write never -- this agent only reads and reports.
2. Cite file + line for every finding.
```
Includes: no forbidden fields, tool allowlist, maxTurns, structured body, skill table, operating principles.

## Anti-Patterns

1. Including `hooks` in agent frontmatter (forbidden for plugin subagents -- causes runtime error).
2. Setting `maxTurns` too low (agent stops mid-execution) or too high (wastes resources).
3. Creating an agent that manages only one skill (merge the agent's logic into the skill).
4. Defining `tools` AND `disallowedTools` simultaneously (disallowedTools is silently ignored).
5. Writing operating principles that are generic platitudes instead of specific behavioral rules.
6. Omitting delegation criteria in a multi-agent plugin (ambiguous handoffs).

## Edge Cases

1. Plugin has only one agent -- the agent IS the plugin orchestrator. Include all skills.
2. Agent needs to invoke skills from another plugin -- currently not supported. Document the limitation.
3. Agent handles a command that spans multiple movements with quality gates -- document the gate check in the execution flow.
4. Agent should have different tool access for different skills -- use `allowed-tools` at the skill level to restrict per-skill.
5. Agent needs background context from reference files -- use the `background` field with the reference file path.
