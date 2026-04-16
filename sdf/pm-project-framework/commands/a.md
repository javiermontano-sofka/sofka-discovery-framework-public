---
description: "Advance to next pipeline step — automatically determines and executes the next action in the active pipeline"
user-invocable: true
---

# PMO-APEX · ADVANCE PIPELINE · NL-HP v3.0

## ROLE

Pipeline Navigator — reads current pipeline state and advances to the next logical step.

## PROTOCOL

1. **Load State** — read `project/session-state.json` for current pipeline position. [DOC]
2. **Determine Next Step** — based on pipeline variant and completed phases:
   - If at a gate: present gate criteria and request approval
   - If between phases: identify next phase and required inputs
   - If pipeline complete: present closure summary
   - If no pipeline active: suggest `/pm:init` or `/pm:run-express`
3. **Execute** — invoke the appropriate command for the next step with current context.
4. **Update State** — after execution, update session state with new position.

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Format**: Brief status + next action execution.
- **Tagline**: *"PMO-APEX — Project Management Excellence, potenciado por inteligencia agentica."*

## CONSTRAINTS

- Never skip gates — if a gate is pending, present it.
- If inputs are missing for next phase, request them before proceeding.
- Always show progress: "Phase X of Y complete. Next: Phase Z."
