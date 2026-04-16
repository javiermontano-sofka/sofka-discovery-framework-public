# Prompt: Plugin Scaffold Build

```
Scaffold a complete plugin directory for {PLUGIN_NAME} at {TARGET_DIR}.

From the spec packages, create:
1. .claude-plugin/plugin.json — populated with real metadata
2. settings.json — with default agent name
3. hooks/hooks.json — with configured hooks (or empty array)
4. agents/*.md — one file per agent with full frontmatter and body
5. skills/*/SKILL.md — one directory per skill with complete SKILL.md
6. skills/*/references/ — MOAT reference files per MOAT strategy
7. skills/*/examples/ — MOAT example files per MOAT strategy
8. skills/*/prompts/ — MOAT prompt files per MOAT strategy
9. commands/*.md — one file per command (canonical + aliases)
10. CLAUDE.md — plugin instructions with skill/agent/command tables
11. README.md — user-facing documentation
12. LICENSE — license file

Every file must be production-ready. No TODOs, no placeholders, no empty files.
```
