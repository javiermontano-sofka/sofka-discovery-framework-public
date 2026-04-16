# RAG Priming: Claude Code Skills Ecosystem 2026

> **Sources**: [alirezarezvani/claude-skills](https://github.com/alirezarezvani/claude-skills), [jeremylongshore/claude-code-plugins-plus-skills](https://github.com/jeremylongshore/claude-code-plugins-plus-skills), [claude-plugins.dev](https://claude-plugins.dev/skills), [claudecodemarketplace.com](https://claudecodemarketplace.com/)
> **Snapshot**: March 2026
> **Relevance**: Competitive landscape, distribution patterns, cross-platform standards

---

## 1. Ecosystem State (March 2026)

### Major Skill Repositories

| Repository | Skills | Agents | Cross-Platform | License |
|-----------|--------|--------|----------------|---------|
| **alirezarezvani/claude-skills** | 192+ | Yes | 11 tools (Claude Code, Codex, Gemini CLI, Cursor, Aider, Windsurf, Kilo Code, OpenCode, Augment, Antigravity) | Open |
| **jeremylongshore/claude-code-plugins-plus-skills** | 1367 agent skills | 340 plugins | Claude Code focused | Open |
| **garrytan/gstack** | 10 | — | Claude Code only | Open |
| **SAGE (Sofka)** | 104 MOAT skills | 48 agents | Claude Code only | Proprietary |
| **MAO (MetodologIA)** | 105 MOAT skills | 101 agents | Claude Code only | GPL-3.0 |

### Marketplace Status
- **No official Anthropic marketplace** yet (as of March 2026)
- Community-driven marketplaces: claudecodemarketplace.com, claude-plugins.dev
- Decentralized model: anyone can create a marketplace, no approval needed
- Enterprise: admins can create private plugin marketplaces with org-specific control

---

## 2. alirezarezvani/claude-skills — Deep Analysis

### Cross-Platform Architecture (11 Tools)

The critical innovation: **one skill definition, converted for 11 platforms**.

```bash
./scripts/convert.sh --tool all    # Convert for all platforms
./scripts/install.sh --tool cursor # Install for specific tool
```

**Supported targets**: Claude Code, OpenAI Codex, Gemini CLI, OpenClaw, Cursor, Aider, Windsurf, Kilo Code, OpenCode, Augment, Antigravity

### Installation Methods

1. **Plugin Marketplace CLI**: `/plugin marketplace add alirezarezvani/claude-skills`
2. **Universal Installer**: `npx agent-skills-cli add alirezarezvani/claude-skills`
3. **Git Clone + Scripts**: Platform-specific install scripts

### Domain Coverage (9 Domains)

| Domain | Count | Examples |
|--------|-------|---------|
| Engineering | 49 | Code review, architecture, testing, CI/CD, security |
| Marketing | 43 | SEO, CRO, content strategy, analytics |
| Product | 12 | Roadmap, user research, feature prioritization |
| C-Level Advisory | 28 | CEO, CTO, CFO, COO, CMO, CHRO advisors |
| Regulatory/Quality | 12 | GDPR, HIPAA, SOX, ISO compliance |
| Project Management | 6 | Agile, waterfall, hybrid PM |
| Business Growth | 4 | Customer success, growth hacking |
| Finance | 2 | Financial analysis, budgeting |
| Operations | 6+ | DevOps, SRE, incident management |

### Skill Structure (Standard)
```
skill-name/
├── SKILL.md          # Core instructions + YAML frontmatter
├── docs/             # Documentation
└── tests/            # Validation tests (some skills)
```

### Key Differentiators
- **Volume**: 192+ skills vs SAGE's 104 (but breadth vs depth tradeoff)
- **Cross-platform**: Works with 11 tools (SAGE = Claude Code only)
- **Flat structure**: No MOAT-style references/examples/scripts/
- **Generic domain coverage**: Broad (marketing, finance, C-level) vs SAGE's consulting depth
- **No quality gates**: No equivalent to G0-G3
- **No multi-agent orchestration**: Skills are standalone, no committee pattern

---

## 3. jeremylongshore/claude-code-plugins-plus-skills

### Scale
- **340 plugins** + **1367 agent skills**
- CCPI package manager for installation
- Interactive tutorials
- Production orchestration patterns

### Architecture Pattern
Massive breadth, community-contributed, less curated than SAGE/MAO.

---

## 4. Distribution & Packaging Standards (2026)

### Skill File Format (Universal Standard)
```markdown
---
name: skill-name
description: "Trigger description (3-5 phrases)"
version: 1.0.0
allowed-tools: [Read, Write, Edit, Bash, Grep, Glob]
---

# Skill Name

Instructions for the AI agent...
```

### Plugin Format (Claude Code Specific)
```
.claude-plugin/
├── plugin.json       # Manifest (name, version, description)
├── commands/         # Slash commands (*.md)
├── agents/           # Agent definitions (*.md)
├── skills/           # Skill bundles (*/SKILL.md)
└── hooks/            # Event hooks (hooks.json)
```

### Packaging for Distribution
- `.skill` ZIP files (standalone skill bundles)
- `.plugin` ZIP files (complete plugins)
- Git repos (most common: clone + symlink)
- npm packages (`npx agent-skills-cli`)

---

## 5. Competitive Positioning Analysis

### Where SAGE/MAO Leads
1. **Depth over breadth** — 104 skills with MOAT structure (references/, examples/, body-of-knowledge) vs 192+ flat skills
2. **Multi-agent orchestration** — 48 agents with committee deliberation vs standalone skills
3. **Quality gates** — G0-G3 sequential gates vs no quality assurance
4. **Evidence system** — [CODIGO], [DOC], [INFERENCIA] tagging vs no provenance tracking
5. **Zero-hallucination protocol** — Explicit anti-fabrication guardrails
6. **Domain specialization** — Deep consulting/pre-sales expertise vs generic breadth
7. **Branding & output** — Full design system with HTML/DOCX/XLSX/PPTX/PDF rendering
8. **Living ontology** — CLAUDE.md hub + 13 sub-files vs flat documentation

### Where SAGE/MAO Trails
1. **Cross-platform** — Claude Code only vs 11 platforms (critical gap)
2. **Distribution** — No marketplace presence vs npm/CLI/marketplace installers
3. **Browser automation** — No `/browse` equivalent
4. **CI/CD integration** — No PR review learning loop
5. **Quantitative retrospectives** — No data-driven session analytics
6. **Community reach** — Private/GPL vs open repos with stars and forks
7. **Install simplicity** — Plugin system vs one-line `npx` install

---

## 6. Strategic Opportunities

### 6.1 Cross-Platform Conversion Script
Create `scripts/convert.sh` that transforms SAGE SKILL.md files for Cursor, Codex CLI, Gemini CLI. This alone would 10x distribution surface.

### 6.2 npm Package Distribution
Publish skills as `npx sage-skills install consulting` or `npx mao-skills install discovery`.

### 6.3 Community Marketplace Presence
Register on claude-plugins.dev and claudecodemarketplace.com.

### 6.4 Skill Bundling by Use Case
Package skills into focused bundles: "Architecture Assessment Kit" (5 skills), "Discovery Quick Start" (8 skills), "Data Landscape Pack" (4 skills).

### 6.5 Browser Automation Skill
Adopt gstack's compiled Playwright pattern for `/sdf:browse` — client demo validation, UI/UX assessment, accessibility auditing.

### 6.6 Retrospective Analytics
Add `/sdf:retro` for discovery engagement metrics: time-per-phase, evidence density, recommendation accuracy, client satisfaction correlation.

---

## 7. Ecosystem Trends

1. **Convergence**: Skills becoming cross-platform (SKILL.md format works everywhere)
2. **Marketplace emergence**: Community-driven, not centralized (npm model, not App Store model)
3. **Agent SDK integration**: Skills feeding into agentic workflows (not just slash commands)
4. **Quality differentiation**: Volume is commoditized; depth/rigor is the moat
5. **Enterprise private registries**: Org-specific skill catalogs with access control
