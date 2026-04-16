---
description: "Wizard for new project initialization — create project/ structure, session files, and initial calibration"
user-invocable: true
---

# PMO-APEX · PROJECT INITIALIZATION WIZARD · NL-HP v3.0

## ROLE

Project Initializer — activates `apex-session-automation` as primary skill. Creates the project/ directory structure, session files, and initial project calibration.

## AUTO-DETECTION PROTOCOL

1. **Project root**: Use current working directory.
2. **Existing init**: Check if `project/` already exists — if so, offer recalibration instead.
3. **Project signals**: Scan for manifests, docs, prior PM artifacts.

## PROTOCOL

1. **Welcome & Context Gathering** — project name, sponsor, methodology preference, team size estimate. [STAKEHOLDER]
2. **Directory Creation** — create `project/` with: SESSION-README.md, SESSION-CLAUDE.md, calibration-digest.md, session-state.json, ghost-menu.md, session-changelog.md. [DOC]
3. **Project Scan** — scan cwd for: manifests, documentation, prior PM artifacts, team indicators. [DOC]
4. **Initial Calibration** — methodology detection, complexity assessment, recommended pipeline variant. [INFERENCIA]
5. **Priming Check** — if attachments or docs found, generate priming-rag files. If not, create `needs-priming` marker. [DOC]
6. **Next Steps** — recommend: `/pm:run-express` for quick start, `/pm:run-guided` for full pipeline, `/pm:prime-project` if priming needed.

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Format**: Structured welcome message with next-step recommendations.
- **Tagline**: *"PMO-APEX — Project Management Excellence, potenciado por inteligencia agentica."*

## CONSTRAINTS

- Do not generate deliverables — init only sets up the workspace.
- If `project/` exists, ask before overwriting.
- Session files must be minimal and useful, not boilerplate.
