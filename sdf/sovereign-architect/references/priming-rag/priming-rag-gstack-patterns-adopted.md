# Priming-RAG: gstack Patterns Adopted for SA
> Sovereign Architect — Patterns adopted from Garry Tan's gstack
> Generated: 2026-03-18 | Version: v1.0
> Source: github.com/garrytan/gstack analysis

---

## Executive Summary
- gstack introduces cognitive mode switching for different development phases [HECHO]
- Conductor enables parallel Claude Code sessions (up to 10) [HECHO]
- Compiled Playwright browser binary for first-class browser automation [HECHO]
- Quantitative retrospectives from git history [HECHO]
- Greptile integration for PR review learning loop [HECHO]

## Patterns Adopted

### 1. Cognitive Mode Naming
- SA maps gstack's cognitive modes to its 4 movements [INFERENCIA]
- CREATE = Ship mode (disciplined, procedural) [INFERENCIA]
- REVIEW = Staff Engineer mode (paranoid structural auditor) [INFERENCIA]
- EVOLVE = Tech Lead mode (architecture, edge cases) [INFERENCIA]
- REPAIR = QA Lead mode (testing, health scoring) [INFERENCIA]

### 2. Browser Automation (/sa:browse)
- Adopted: MCP Playwright for visual application audit [HECHO]
- Not adopted: compiled binary approach (MCP is more maintainable) [INFERENCIA]
- Use cases: UI audit, accessibility check, visual regression, client demos [HECHO]

### 3. Quantitative Retrospective (/sa:retro-quant)
- Adopted: git history analysis for metrics [HECHO]
- Metrics: LOC/day, test-to-code ratio, PR sizes, commit frequency [HECHO]
- Per-contributor breakdown with JSON snapshots [HECHO]
- Extended: evidence density per artifact, recommendation accuracy [INFERENCIA]

### 4. Conductor-Style Parallelism
- Not directly adopted: SA uses Agent tool + worktrees instead [INFERENCIA]
- SA approach: subagents for parallel phase execution [HECHO]
- Benefit: no separate orchestrator binary needed [INFERENCIA]

## Patterns NOT Adopted (Differentiation)
- Thin prompt skills (SA keeps MOAT depth with references/, examples/) [HECHO]
- No quality gates in gstack (SA maintains G0-G2) [HECHO]
- No evidence tagging in gstack (SA maintains zero-hallucination protocol) [HECHO]
- No multi-agent deliberation (SA maintains committee pattern) [HECHO]

## Query Hooks
- "What did SA adopt from gstack?" → Browser audit, quant retro, cognitive mode naming
- "Why not adopt Conductor?" → SA uses Agent tool + worktrees for parallel execution
