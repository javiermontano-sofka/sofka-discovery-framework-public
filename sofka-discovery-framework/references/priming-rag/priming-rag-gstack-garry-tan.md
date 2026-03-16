# RAG Priming: gstack — Garry Tan's Claude Code Workflow Framework

> **Source**: [github.com/garrytan/gstack](https://github.com/garrytan/gstack) + [SitePoint analysis](https://www.sitepoint.com/gstack-garry-tan-claude-code/)
> **Author**: Garry Tan (President & CEO, Y Combinator)
> **Version**: v1.x (March 2026) — 10 skills, compiled browser binary, Conductor orchestration
> **Relevance**: Competing/complementary skill ecosystem for Claude Code — patterns to adopt or differentiate from

---

## 1. Core Thesis: Cognitive Modes

gstack's foundational insight: **different phases of software development require fundamentally different cognitive modes**. Planning ≠ review ≠ shipping ≠ QA. When you blur these into one generic assistant, "you get a mediocre blend of all four."

**Key quote (Garry Tan)**: "I don't want AI coding tools stuck in one mushy mode."

### The 10 Cognitive Modes

| Skill | Mode | Brain Type |
|-------|------|------------|
| `/plan-ceo-review` | Founder | "Brian Chesky mode" — ambitious user empathy, 10-star product thinking |
| `/plan-eng-review` | Tech Lead | Architecture lock, sequence diagrams, state machines, edge case enumeration |
| `/review` | Staff Engineer | Paranoid structural auditor — imagines production incidents |
| `/ship` | Release Engineer | Disciplined, procedural — syncs branch, tests, pushes, opens PR |
| `/browse` | QA Operator | Persistent Chromium browser with visual inspection capability |
| `/qa` | QA Lead | Diff-aware or full testing with health score computation |
| `/qa-only` | QA Reporter | Testing without auto-fix (report-only) |
| `/retro` | Engineering Manager | Data-driven retrospective (LOC/day, test ratio, PR sizes, streaks) |
| `/document-release` | Technical Writer | Updates docs to match shipped code |
| `/setup-browser-cookies` | Session Manager | Imports cookies from daily browser (Chrome, Arc, Brave, Edge) |

---

## 2. Architecture

### Skill Structure
Each skill = a Markdown prompt file. No YAML configs, no JSON schemas. Claude interprets the prompt dynamically. Skills are registered as Claude Code slash commands.

```
gstack/
├── plan-ceo-review/     (Founder mode)
├── plan-eng-review/     (Tech lead mode)
├── review/              (Paranoid reviewer)
├── ship/                (Release engineer)
├── browse/              (Browser binary + skill)
├── qa/                  (QA testing)
├── qa-only/             (QA report-only)
├── retro/               (Retrospective)
├── document-release/    (Doc writer)
├── setup-browser-cookies/ (Session manager)
├── bin/                 (Compiled binaries)
├── scripts/             (Utilities)
├── CLAUDE.md            (Claude Code config)
├── ARCHITECTURE.md      (Design doc)
├── conductor.json       (Parallel workspace config)
└── setup                (Installation script)
```

### Installation Pattern
- **Global**: `git clone → ~/.claude/skills/gstack && ./setup` (creates symlinks)
- **Project-local**: copy to `.claude/skills/gstack/`, run `./setup`
- Symlinks: each skill gets `~/.claude/skills/<skill-name>` → `~/.claude/skills/gstack/<skill-name>/`

### Browser Layer (`/browse`)
- Compiled native Playwright binary (~58MB), NOT an MCP bridge
- Persistent Chromium daemon: ~3s startup, ~100-200ms per command
- Cookie import decrypts via macOS Keychain
- Auto-shutdown after 30 min idle
- Each workspace gets isolated browser (process, cookies, tabs, logs)

---

## 3. Parallel Orchestration (Conductor)

Conductor enables **10 parallel Claude Code sessions**, each with:
- Isolated workspace (separate git worktree implied)
- Own browser instance
- Own `.gstack/` state directory
- No port collisions, no shared state

**Vision**: "One person, ten parallel agents, each with the right cognitive mode for its task."

---

## 4. Greptile Integration (Learning PR Review)

`/review` and `/ship` are **Greptile-aware**:
1. Read GitHub PR comments from Greptile
2. Classify each: valid issue (fix) | already-fixed (acknowledge) | false positive (dispute)
3. Learn from history at `~/.gstack/greptile-history.md`
4. Track "batting average" of PR review quality over time

---

## 5. Retrospective Analytics (`/retro`)

Parses git history to compute:
- LOC per day, test-to-code ratios, PR sizes
- Coding session times, shipping streaks
- Per-contributor breakdown
- JSON snapshots for longitudinal tracking

---

## 6. Differentiators vs. SAGE/MAO

| Dimension | gstack | SAGE/MAO |
|-----------|--------|----------|
| **Scope** | Dev workflow (plan → code → review → ship → QA) | Consulting discovery (stakeholders → AS-IS → scenarios → roadmap → pitch) |
| **Skill count** | 10 focused skills | 104+ MOAT skills |
| **Agent model** | Single-mode switching (one brain at a time) | Multi-agent committee (7 experts deliberating) |
| **Browser** | Compiled Playwright binary (native) | None (opportunity) |
| **CI/PR integration** | Greptile-aware review learning | None (opportunity) |
| **Retrospective** | Data-driven `/retro` with metrics | Session changelog (less quantitative) |
| **Packaging** | Simple symlinks, setup script | MOAT structure (references/, examples/, scripts/) |
| **Cross-platform** | Claude Code only | Claude Code only (opportunity for both) |
| **Parallel execution** | Conductor (10 sessions) | Worktrees + subagents |
| **Quality gates** | Implicit (review before ship) | Explicit G0-G3 gates |
| **Evidence** | None | [CODIGO], [DOC], [INFERENCIA], etc. |
| **Branding** | None | Full design system (colors, fonts, templates) |

---

## 7. Patterns Worth Adopting

### 7.1 Explicit Cognitive Mode Naming
gstack names each mode by its organizational role (CEO, Staff Engineer, QA Lead). SAGE names by deliverable phase. **Hybrid opportunity**: name SAGE modes both by phase AND cognitive style.

### 7.2 Compiled Browser Binary
gstack's browser is a first-class citizen. SAGE has no browser testing. For client demos, QA validation, and stakeholder walkthroughs, a `/sdf:browse` skill would be powerful.

### 7.3 PR Review Learning Loop
Greptile integration creates a feedback loop. SAGE could learn from past discovery outcomes: which patterns worked, which estimates were accurate.

### 7.4 Quantitative Retrospectives
`/retro` computes hard metrics from git history. SAGE could apply this to discovery: time-per-phase, evidence density, recommendation hit rate.

### 7.5 Symlink-Based Global Install
gstack's `./setup` creates clean symlinks. Simpler than SAGE's monorepo plugin approach for individual skill distribution.

### 7.6 Conductor-Style Parallel Discovery
Running 10 phases in parallel (where dependencies allow) would dramatically accelerate discovery engagements.

---

## 8. Patterns to NOT Adopt (Differentiation)

- **Simplicity over depth**: gstack's skills are thin prompts. SAGE's MOAT structure (references/, examples/, body-of-knowledge) is a competitive advantage.
- **No quality gates**: gstack trusts the model. SAGE's G0-G3 gates are essential for consulting rigor.
- **No evidence tagging**: gstack doesn't track source provenance. SAGE's evidence system is critical for zero-hallucination claims.
- **No multi-agent deliberation**: gstack uses one brain at a time. SAGE's committee pattern produces richer analysis.

---

## 9. Key Insight

> gstack is a "cognitive operating system" — it layers explicit thinking modes onto Claude Code. Its power derives from **task-specific prompting discipline**, not proprietary algorithms or deep knowledge bases.
>
> SAGE/MAO's power derives from **institutional knowledge, structured methodology, and multi-agent orchestration** — fundamentally different and complementary.
