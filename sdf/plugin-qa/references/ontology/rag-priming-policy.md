# PQA RAG Priming Policy

> What PQA loads at session start and how context is managed.

## Session Initialization

On `SessionStart`, PQA hooks execute in order:

1. **plugin-scan.sh** -- Detect if working directory contains a Claude Code plugin
2. **session-context-gen.sh** -- Generate SESSION-README.md, SESSION-CLAUDE.md, calibration-digest.md
3. **session-init.sh** -- Create session-state.json with pipeline tracker
4. **ghost-menu-inject.sh** -- Generate contextual navigation menu
5. **session-changelog.sh** -- Initialize action log

## Context Loading

PQA does NOT load its own reference files at session start. Instead:

- **On demand**: Skills load their required references when invoked
- **Lazy loading**: The 6 reference digest files (`references/*.md`) are read only when a skill needs them
- **Ontology**: The 13 ontology files (`references/ontology/*.md`) are navigated via CLAUDE.md pointers

## Session Directory (`pqa/`)

Created automatically by hooks in the working directory:

| File | Purpose |
|------|---------|
| `active-plugin` | Guard marker (contains "pqa") |
| `SESSION-README.md` | Context about the target plugin |
| `SESSION-CLAUDE.md` | Session-specific instructions |
| `calibration-digest.md` | Plugin detection and component counts |
| `ghost-menu.md` | Contextual navigation |
| `session-changelog.md` | Timestamped action log |
| `session-state.json` | Pipeline state tracker |

## Context Pruning

PostToolUse hook `context-prune.sh` auto-compresses `pqa/` files exceeding 150 lines:
- Keeps first 20 lines (header) + last 30 lines (recent)
- Archives full content as `.bak`

---
*PQA v3.0 — Load what you need, when you need it.*
