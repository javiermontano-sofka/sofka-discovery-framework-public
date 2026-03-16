---
name: metodologia-cross-platform-convert
description: Cross-platform skill converter that transforms MAO MOAT skills into formats compatible with Cursor, Codex CLI, Gemini CLI, Aider, and Windsurf. Use when the user asks to convert skills, export for other tools, make skills cross-platform, or distribute skills to non-Claude tools. Triggered by "convert skills", "export for cursor", "cross-platform", "convert to codex".
author: Comunidad MetodologIA
version: 1.0.0
category: Herramientas & DX
tags: [cross-platform, conversion, cursor, codex, gemini, aider, windsurf, distribution]
allowed-tools: [Read, Write, Edit, Bash, Grep, Glob]
---

# metodologia-cross-platform-convert

> Converts MAO MOAT skills to formats compatible with 5+ AI coding platforms.
> Expands MAO's reach beyond Claude Code without sacrificing MOAT quality.

---

## TL;DR

Runs `scripts/convert-skills.sh` to transform SKILL.md files into platform-specific formats. Handles Claude-specific tool references, frontmatter adaptation, and content truncation for each target platform. Output: ready-to-install skill packages for Cursor, OpenAI Codex CLI, Gemini CLI, Aider, and Windsurf.

---

## Supported Targets

| Target | Output Format | Install Location |
|--------|--------------|-----------------|
| **Cursor** | `.cursor/rules/*.mdc` | Project `.cursor/rules/` |
| **Codex CLI** | `AGENTS.md` (single file) | Project root |
| **Gemini CLI** | `.gemini/style.md` | Project `.gemini/` |
| **Aider** | `CONVENTIONS.md` | Project root |
| **Windsurf** | `.windsurfrules` | Project root |

---

## Conversion Process

1. **Extract Frontmatter** — Parse SKILL.md YAML (name, description)
2. **Extract Body** — Content after second `---` delimiter
3. **Strip Claude-Specific References** — Replace tool names:
   - `Agent tool` → `subagent`
   - `Bash tool` → `terminal`
   - `Read/Write/Edit tool` → `file reader/writer/editor`
   - `Grep/Glob tool` → `search/file finder`
   - Remove `allowed-tools:` from frontmatter
4. **Format for Target** — Apply platform-specific wrapping
5. **Write Output** — Save to `converted/{target}/` directory

---

## Usage

```bash
# Convert all skills for all platforms
bash scripts/convert-skills.sh all ./skills ./converted

# Convert for specific platform
bash scripts/convert-skills.sh cursor ./skills ./converted

# Convert from plugin directory
bash scripts/convert-skills.sh all "$PLUGIN_DIR/skills" ./converted
```

---

## What Converts vs. What Doesn't

### Converts (60% of MAO)
- Individual assessment skills (architecture, data, cloud, security)
- Analysis skills (asis, flow-mapping, scenario-analysis)
- Documentation skills (technical-writing, copywriting)
- Quality skills (testing-strategy, quality-engineering)

### Does NOT Convert (40% — Claude Code Native)
- Discovery orchestrator (requires Agent tool, subagents)
- Pipeline governance (requires hooks, quality gates)
- Multi-agent committee patterns (requires Agent spawning)
- Session automation (requires SessionStart/PostToolUse hooks)
- Evidence tagging system (requires PostToolUse validation)

---

## Quality Notes

- Converted skills lose MOAT depth (references/, examples/ not included)
- Cross-platform versions are L1/L2 equivalent (metadata + core body)
- Full L3 depth only available in Claude Code (native MOAT loading)
- This is intentional: Claude Code remains the premium experience
