---
name: ideate-plugin
author: JM Labs (Javier Montaño)
description: >
  Generate a structured plugin concept brief from a user idea. Trigger: ideate plugin, brainstorm plugin, plugin concept, new plugin idea, create plugin concept.
  Researches existing plugins for overlap, proposes movement structure and component counts.
argument-hint: "<plugin-idea or problem-statement>"
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
---

# Ideate Plugin

> "Every great plugin begins as a clear problem statement, not a feature list."

Generate a structured plugin concept brief from a user's idea or problem statement. This skill transforms vague intentions into a concrete, reviewable document that serves as the foundation for architecture planning.

This is a **read-only** skill. It researches and proposes but never creates plugin files.

---

## Procedure

### Step 1 -- Elicit Purpose and Scope

- Ask the user to describe the problem their plugin solves in one sentence.
- If the user provides only a name or feature list, reframe: "What workflow does this improve? For whom?"
- Capture: **problem statement**, **target audience**, **primary use cases** (3-5).
- Tag the source: `[STAKEHOLDER]` for user-provided info, `[INFERENCIA]` for derived scope.

### Step 2 -- Research Existing Plugins for Overlap

- Scan all directories under the known plugin paths for existing `plugin.json` manifests.
- Read the `name`, `description`, and `keywords` fields from each manifest found.
- Compare the proposed plugin's purpose against existing plugins.
- If overlap is found, report it explicitly: "Plugin `{name}` already covers {capability}."
- Classify overlap as: `FULL` (abandon idea), `PARTIAL` (differentiate), `NONE` (proceed).

### Step 3 -- Generate Name Candidates

- Propose 3-5 name candidates in kebab-case format: `^[a-z][a-z0-9]*(-[a-z0-9]+)*$`.
- Each name should be: descriptive, concise (2-3 words max), unique across known plugins.
- Verify uniqueness by checking against names found in Step 2.
- Present names with a brief rationale for each.
- Recommend one name with `[RECOMMENDED]` tag.

### Step 4 -- Propose Movement Structure

- Based on the use cases, propose how the plugin's capabilities group into movements.
- A movement is a logical phase of work (e.g., ANALYZE, GENERATE, VALIDATE).
- Recommend 2-5 movements with clear boundaries between them.
- For each movement, list the expected skills and their one-line purpose.
- Reference `references/plugin-idea-framework.md` for the evaluation canvas.

### Step 5 -- Estimate Component Counts

- Estimate the number of: skills, agents, commands (canonical + aliases), hooks.
- Provide a complexity rating: `MINIMAL` (1-5 skills), `STANDARD` (6-15), `LARGE` (16-30), `ENTERPRISE` (30+).
- For each agent, describe its role in one sentence.
- For hooks, specify which lifecycle events are needed and why.

### Step 6 -- Assess Feasibility and Risks

- Evaluate against the Plugin Idea Framework dimensions (see references/).
- Identify: tool dependencies, external service needs, security considerations.
- Flag any capabilities that push against Claude Code plugin constraints.
- Rate overall feasibility: `HIGH`, `MEDIUM`, `LOW` with justification.

### Step 7 -- Write Plugin Brief

- Compile all findings into a structured `plugin-brief.md` document.
- Format:
  ```
  # Plugin Brief: {recommended-name}
  ## Problem Statement
  ## Target Audience
  ## Use Cases
  ## Overlap Analysis
  ## Proposed Name: {name} (alternatives: ...)
  ## Movement Structure
  ## Component Estimates
  ## Feasibility Assessment
  ## Next Steps
  ```
- Present the brief to the user for review. Do NOT write the file unless explicitly asked.
- Suggest running `/pqa:plan` as the next step if the brief is approved.

---

## Quality Criteria

- [ ] The problem statement is a single clear sentence, not a feature list. `[DOC]`
- [ ] Overlap analysis includes evidence from actual plugin manifests found on disk. `[CODIGO]`
- [ ] All name candidates pass the kebab-case regex and are unique. `[CODIGO]`
- [ ] Movement structure has clear boundaries -- no skill belongs to two movements. `[DOC]`
- [ ] Component estimates include rationale, not just numbers. `[DOC]`
- [ ] Feasibility assessment references specific plugin spec constraints. `[CONFIG]`

## Assumptions & Limits

- Read-only. This skill researches and proposes but never creates plugin files or directories.
- Overlap analysis scans known plugin paths on the local filesystem only. It cannot detect plugins in remote registries, other machines, or private repositories.
- Name uniqueness is checked against locally installed plugins. A name may still conflict with a published plugin the user has not installed.
- Feasibility assessment is based on the current Claude Code plugin spec. Capabilities may expand in future versions, making currently infeasible ideas viable.
- The plugin brief is a proposal document, not a commitment. The architecture plan (Step 2 of the lifecycle) may restructure movements and components.

## Good vs Bad

**Bad plugin brief:**
```
# Plugin Brief: my-tool
This plugin does linting and formatting and validation and reporting.
Skills: lint, format, validate, report.
```
Missing: no problem statement, no target audience, no overlap analysis, no movement structure, no feasibility.

**Good plugin brief:**
```
# Plugin Brief: code-quality-gate
## Problem Statement
Developers lack a single command to enforce code quality standards before committing.
## Target Audience
Teams using Claude Code for development who need pre-commit quality checks.
## Overlap Analysis
- `plugin-qa` covers plugin QA, not general code quality. Overlap: NONE.
## Proposed Name: code-quality-gate (alternatives: pre-commit-check, quality-enforcer)
## Movement Structure
1. ANALYZE (scan-code, detect-issues) → 2. REPORT (generate-findings) → 3. FIX (auto-fix-issues)
## Component Estimates
Skills: 5 | Agents: 1 | Commands: 6 (4 canonical + 2 aliases) | Complexity: STANDARD
## Feasibility: HIGH — all capabilities within plugin spec constraints.
```
Includes: clear problem, audience, evidence-based overlap, movement structure, estimates with rationale, feasibility.

## Anti-Patterns

1. Skipping the overlap research and assuming the idea is novel without evidence.
2. Proposing names that duplicate existing plugin names in the ecosystem.
3. Creating movements with only one skill each -- that is a flat structure pretending to be organized.
4. Estimating component counts without understanding the use cases first.
5. Writing the brief file to disk without user approval (this is a read-only skill).

## Edge Cases

1. User provides a fully formed spec instead of an idea -- validate it against the framework rather than starting from scratch.
2. Overlap analysis finds a near-exact match -- recommend contributing to the existing plugin instead.
3. The idea requires capabilities beyond Claude Code plugins (e.g., persistent servers, databases) -- document the constraint and propose workarounds or scope reduction.
4. User wants a plugin with a single skill and no movements -- valid for micro-plugins, document as `MINIMAL` complexity.
