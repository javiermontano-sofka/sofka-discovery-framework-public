---
name: plan-architecture
author: JM Labs (Javier Montaño)
description: >
  Generate plugin architecture plan with agent roles, skill-movement mapping, hook strategy, and command routing.
  Trigger: plan architecture, design plugin structure, architect plugin, plugin architecture, plan plugin layout.
argument-hint: "<plugin-brief-path>"
allowed-tools:
  - Read
  - Write
  - Glob
  - Grep
  - Bash
---

# Plan Architecture

> "Architecture is the art of making decisions you will not regret when the plugin grows."

Generate a complete architecture plan for a Claude Code plugin. Takes a plugin concept brief (from `ideate-plugin`) and produces a detailed technical plan covering agents, skills, hooks, commands, quality gates, and execution flows.

---

## Procedure

### Step 1 -- Parse Plugin Brief

- Read the plugin brief document at the provided path.
- Extract: problem statement, movement structure, component estimates, feasibility notes.
- If no brief exists at the path, report the error and suggest running `/pqa:ideate` first.
- Validate that the brief has the required sections. Tag findings: `[DOC]`.

### Step 2 -- Determine Agent Roles

- For each movement, decide whether it needs a dedicated agent or shares the plugin's primary agent.
- Apply the heuristic: a movement gets its own agent if it has 5+ skills OR fundamentally different tool needs.
- For each agent, define:
  - **Name**: kebab-case, role-descriptive (e.g., `code-analyzer`, `report-generator`).
  - **Boundary**: What it owns and what it delegates.
  - **Tool allowlist**: Minimum tools needed (least privilege).
  - **maxTurns**: Estimated based on skill count and complexity.
- Record the plugin subagent constraint: no hooks, mcpServers, or permissionMode in agent frontmatter. `[CONFIG]`

### Step 3 -- Map Skills to Movements

- For each movement from the brief, list the skills with:
  - **Name**: kebab-case verb-noun (e.g., `validate-structure`, `generate-report`).
  - **Purpose**: One sentence.
  - **Inputs**: What data/files it reads.
  - **Outputs**: What it produces (findings, artifacts, reports).
  - **Agent**: Which agent orchestrates it.
  - **Sequence**: Order within the movement (parallel or sequential).
- Verify no skill appears in multiple movements. `[DOC]`

### Step 4 -- Select Hooks from Compatibility Matrix

- Review the 22 lifecycle events available in Claude Code.
- For each proposed hook from the brief, validate against the type-event compatibility matrix:
  - `type:command` -- compatible with all 22 events.
  - `type:http` -- compatible with all 22 events.
  - `type:prompt` -- compatible with PreToolUse, PostToolUse, and PermissionRequest ONLY (requires ToolUseContext).
  - `type:agent` -- compatible with PreToolUse, PostToolUse, and PermissionRequest ONLY (requires ToolUseContext).
- Flag any incompatible combinations as `CRITICAL` (prompt/agent on non-ToolUseContext events) and propose alternatives.
- Document the hook strategy: which events, which types, what behavior. `[CONFIG]`

### Step 5 -- Define Command Routing

- For each user-facing operation, create a command entry:
  - **Canonical command**: Full descriptive name (e.g., `/prefix:validate`).
  - **Alias**: Optional single-letter shortcut (e.g., `/prefix:v`).
  - **Target**: Which skill or agent the command invokes.
  - **Arguments**: What the command passes through.
- Verify no command name conflicts with existing commands in the plugin ecosystem.
- Total commands = canonical + aliases. Document the count. `[DOC]`

### Step 6 -- Place Quality Gates

- Define quality gates between movements:
  - **Gate name**: Descriptive (e.g., `G1: Analysis Complete`).
  - **Trigger**: What must be true to pass (e.g., "all validate-* skills pass with zero CRITICALs").
  - **Blocker behavior**: What happens if the gate fails (pause, skip, abort).
- Minimum: one gate between each movement boundary.
- Gate criteria must be testable and evidence-based. `[DOC]`

### Step 7 -- Generate Architecture Diagrams

- Produce Mermaid diagrams for:
  1. **Component map**: Agents, skills, commands, hooks and their relationships.
  2. **Execution flow**: Sequential/parallel skill execution within each movement.
  3. **Delegation graph**: Agent-to-skill ownership.
- Diagrams must be valid Mermaid syntax. `[CODIGO]`

### Step 8 -- Write Architecture Plan

- Compile all outputs into `architecture-plan.md`:
  ```
  # Architecture Plan: {plugin-name}
  ## Overview
  ## Agent Roles
  ## Skill-Movement Map
  ## Hook Strategy
  ## Command Routing Table
  ## Quality Gates
  ## Diagrams
  ## Component Summary
  ## Next Steps
  ```
- Include a component summary table: total agents, skills, commands, hooks.
- Present the plan for review. Suggest running `/pqa:plan-moat` next.
- Write the file only if the user confirms. `[DOC]`

---

## Quality Criteria

- [ ] Every skill has exactly one owning agent -- no orphaned skills. `[CODIGO]`
- [ ] Every hook type-event combination is compatible per the matrix. `[CONFIG]`
- [ ] Command names are unique and follow kebab-case conventions. `[CODIGO]`
- [ ] Quality gates have testable, measurable criteria. `[DOC]`
- [ ] Mermaid diagrams render correctly (valid syntax). `[CODIGO]`
- [ ] The plan accounts for all components estimated in the brief. `[DOC]`
- [ ] Plugin subagent constraints are documented prominently. `[CONFIG]`

## Assumptions & Limits

- This skill produces a plan document, not code. It does not create directories, files, or scaffolds -- that is `build-plugin-scaffold`'s job.
- The hook compatibility matrix is taken as authoritative. If the official Claude Code spec changes, this skill's Step 4 must be updated to match.
- Agent count heuristic (5+ skills = dedicated agent) is a guideline, not a rule. Simple plugins may work fine with a single agent regardless of skill count.
- Cannot validate that the proposed architecture is optimal -- only that it is internally consistent and spec-compliant.
- Mermaid diagram generation assumes the user's rendering environment supports Mermaid syntax. No fallback for environments that do not.

## Good vs Bad

**Bad architecture plan excerpt:**
```
## Agents
- Agent 1: handles stuff
- Agent 2: handles other stuff
```
Missing: no tool allowlist, no boundaries, no maxTurns, no skill assignments.

**Good architecture plan excerpt:**
```
## Agent Roles
| Agent | Boundary | Skills Owned | Tools | maxTurns |
|-------|----------|-------------|-------|----------|
| code-analyzer | Owns validation movement. Reads only. | validate-structure, validate-manifest, validate-components | Read, Glob, Grep | 25 |
| report-generator | Owns reporting movement. Writes report files. | generate-qa-report, generate-qa-scorecard | Read, Glob, Write | 15 |
```
Includes: agent name, boundary, skills owned, tool allowlist, maxTurns estimate.

## Anti-Patterns

1. Creating one agent per skill -- agents should manage groups of related skills.
2. Using `type:prompt` hooks on Stop or Compact events (runtime error).
3. Defining quality gates without measurable criteria ("it looks good" is not a gate).
4. Creating aliases for commands that are rarely used (aliases are for frequent operations).
5. Putting all skills in a single movement (defeats the purpose of movement-based organization).

## Edge Cases

1. Plugin with a single movement -- valid for simple plugins. Skip quality gates between movements but add an exit gate.
2. Plugin with no hooks -- valid. Many plugins operate entirely on-demand. Document the decision.
3. Brief proposes more than 4 agents -- review whether some can be merged. More than 4 agents is a code smell for plugins.
4. A skill needs Write access but the movement is labeled "read-only" -- resolve the contradiction before proceeding.
