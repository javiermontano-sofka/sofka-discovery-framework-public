# Sofka SAGE v13.4 — Agentic PreSales as Service

**SAGE** (Sofka Agentic Gateway to Excellence) turns your IDE into a pre-sales discovery agency: 49 agents, 214 skills, 101 commands, a 4-phase ToT pipeline with G0–G3 quality gates, FASE 0 attachment ingestion, NotebookLM CLI+MCP unified access, and a deterministic Sofka DS v5 brand renderer.

This `CLAUDE.md` is a **hub**, not a manual. It states the inviolable rules, the entry-point commands, and the reading path. Each section ends with a pointer; read sub-files only when the task demands them.

## What changed recently

| Version | Date | Headline |
|---------|------|----------|
| **13.4.0** | 2026-04-17 | Separated author (Javier) from copyright (Sofka) + added contributors; unified `notebooklm-mcp-cli` documented (35 tools, CLI+MCP) |
| 13.3.0 | 2026-04-17 | Testing strategy shipped (57 pytest, end-to-end harness, GitHub Actions CI); 1,103 graders + 477 evals lifted from placeholder to ai-generated |
| 13.2.0 | 2026-04-17 | 100% structural INSIGNIA across 1,104 skills |
| 13.1.0 | 2026-04-17 | Ecosystem quality lift: 358 agents frontmatter, 227 name reconciliations, 291 YAML structural bugs fixed |
| 13.0.0 | 2026-04-17 | SAP-grade hardening: FASE 0 attachments, NotebookLM MCP, brand HTML render |

Full delta → `CHANGELOG.md`.

## Quick start (3 happy paths)

```bash
/sdf:menu              # Interactive palette — always start here if uncertain
/sdf:run-auto          # End-to-end pipeline, no pauses (prototype / low-stakes)
/sdf:run-guided        # Pipeline with human facilitation at each gate (default for real engagements)
```

Less common but load-bearing:

```bash
/sdf:a                 # Advance to the next phase (only if current gate passed)
/sdf:run-express       # Go/No-Go in one session (3 deliverables, ~90 min)
/sdf:run-deep          # Architecture direction (7 deliverables, 2 gates, ~3h)
/sdf:demo              # Guided walkthrough of SAGE against the current repo
/sdf:prime-repo        # Build priming-rag-*.md for a cold repo
```

## Zero-hallucination protocol (non-negotiable)

Every factual claim in a deliverable carries exactly one evidence tag:

```
[CÓDIGO] > [ADJUNTO] > [CONFIG] > [DOC] > [NOTEBOOKLM] > [STAKEHOLDER] > [INFERENCIA] > [SUPUESTO]
```

- `[ADJUNTO:file.ext:locator]` requires a matching `.discovery/priming-rag-*.md` or `@quality-guardian` refuses the deliverable.
- `>30% [SUPUESTO]` triggers a mandatory warning banner at the top of the document.
- `severity=CRÍTICO + [SUPUESTO]` triggers a mandatory validation flag — pipeline cannot advance until resolved.
- Inferences are never presented as facts. `[INFERENCIA]` must name the evidence it derives from.

Full rules → `references/ontology/protocol-zero-hallucination.md`.

## Ontology index (read on demand)

| Need | File |
|------|------|
| Evidence-tag catalog + priority order | `references/ontology/protocol-zero-hallucination.md` |
| Pipeline phases (FASE 0/R/1-4) + gate criteria | `references/ontology/pipeline-orchestration.md` |
| Quality-gate pass/fail thresholds | `references/ontology/quality-gates.md` |
| Agent roster, roles, committee composition | `references/ontology/agent-committee.md` |
| Skill catalog by domain | `references/ontology/skills-catalog.md` |
| Command reference | `references/ontology/commands-reference.md` |
| RAG-priming policy + attachment intake | `references/ontology/rag-priming-policy.md` |
| Attachment taxonomy + extractors | `references/ontology/attachment-taxonomy.md` |
| Output format + naming (`{WIP}`/`{Aprobado}`) | `references/ontology/output-standards.md` |
| Service-type routing (SDA/QA/RPA/Data-AI/…) | `references/ontology/service-routing.md` |
| Session auto-artefacts in `.discovery/` | `references/ontology/session-automation.md` |
| Multi-brand orchestration (Sofka/MAO/JM) | `references/ontology/brand-orchestration.md` |
| Canonical CSS tokens (DS v5) | `references/ontology/canonical-tokens.md` |
| **NotebookLM CLI + MCP (35 tools)** | `references/ontology/notebooklm-capabilities.md` |
| Lessons learned (append here after corrections) | `references/ontology/lessons-learned.md` |

## Pedagogical docs (for humans, outside a session)

The operational ontology above is read by agents mid-session. For human-facing understanding, use [`docs/`](docs/README.md) — Diátaxis four-quadrant tree (tutorials · how-to · reference · explanation) + ADRs + diagrams. Start at [`docs/README.md`](docs/README.md). Concepts like HITL, INSIGNIA, ToT, DS v5, evidence tags all have a [`GLOSSARY.md`](GLOSSARY.md) entry.

Global orchestration rules (metacognition, input amplification, workflow discipline, auto-calibration, RAG priming, self-improvement) live at `~/.claude/orchestration/`. Consult them for cross-plugin behaviour.

## Hard rules (violations block delivery)

1. **Evidence first** — a claim without a tag becomes `[SUPUESTO]` or is removed.
2. **Gates are hard stops** — G0 (security), G1 (discovery), G1.5 (analysis), G2 (feasibility), G3 (delivery). No phase skipping.
3. **No prices** — FTE-meses P50/P80/P95 with variance disclaimer. USD/COP/EUR amounts fail review.
4. **No green** — brand rule. `#00ff00`, `#2ecc71`, `: green` all fail CI brand-render smoke. Use `--pos` (`#FFD700`) for success states.
5. **Ghost menu** on every significant deliverable — readers need a next-step path.
6. **Session changelog** — every significant action logged in `.discovery/session-changelog.md`.
7. **RAG priming before branching** — if `.discovery/priming-rag-*.md` is missing, the orchestrator must create it or refuse to proceed.
8. **`{TIPO_SERVICIO}` routing** — the first step is classifying the engagement so the right agents/skills activate.
9. **Cross-deliverable consistency** — AS-IS, flow map, scenarios, and roadmap must agree. Discrepancies trigger `@quality-guardian` escalation.
10. **Excellence loop** — 10 criteria per deliverable (see `references/ontology/output-standards.md`).

## Output standards (short form)

- **Format**: Markdown-Excellence — TL;DR + dense bullets + Mermaid diagrams + ghost menu. No wall-of-text prose.
- **Language**: Spanish, LatAm business register. Evidence tags stay in Spanish (`[CÓDIGO]` not `[CODE]`).
- **Brand**: orange `#FF7E08` · gold `#FFD700` · background `#EFEAE4` · font Inter. Never green.
- **Filenames**: `{phase}_{deliverable}_{client}_{WIP|Aprobado}.{ext}` — e.g. `03_ASIS_Bancoomeva_{WIP}.md`. Filenames drive auto-rendering in `landing.html`.
- **Deliverables are files**, not inline messages. Write to `.discovery/` or `project/` so the session hooks can track them.

Full spec → `references/ontology/output-standards.md`.

## Repository shape

```
sdf/
├── agents/                    # 49 subagents (+ 2 orchestrators); `name:` = filename stem
├── commands/                  # 101 /sdf:* commands (including 4 notebook-*, render-html, menu, a, demo)
├── skills/                    # 214 skills, each a 7/7 INSIGNIA directory
├── references/
│   ├── ontology/              # 15 specialised sub-files (this hub's children)
│   ├── skill-robustness-template/   # Scaffold for new skills
│   ├── priming-rag-*.md       # RAG priming knowledge, auto-generated per source
│   └── *.md                   # Service matrix, design system, other cross-cutting docs
├── hooks/hooks.json           # SessionStart + PostToolUse (ghost menu, changelog, context gen)
├── scripts/                   # Audits, extractors, renderers, ecosystem batch tools
├── templates/                 # Jinja2 brand HTML base + markdown deliverable templates
├── .mcp.json                  # NotebookLM MCP stdio config
├── landing.html               # Interactive ecosystem landing (Sofka DS v5)
└── prompt-library.html        # Searchable NL-HP prompt catalog
```

Four sibling plugins live under `sdf/` (`metodologia-discovery-framework` GPL-3.0, `pm-project-framework`, `sovereign-architect`, `plugin-qa`). They're shipped via `.claude-plugin/marketplace.json` and follow their own release cycles — do not sync their files when working on SDF core.

## Session automation (what the hooks do for you)

On `SessionStart`, the hooks populate `.discovery/` with:

| Artefact | Purpose |
|----------|---------|
| `SESSION-README.md` | Project context summary Claude reads first |
| `SESSION-CLAUDE.md` | Session-specific instructions layered on top of this file |
| `calibration-digest.md` | Priming + calibration state |
| `ghost-menu.md` | Contextual nav for the current deliverable |
| `session-changelog.md` | Running log for recovery / handoff |
| `session-state.json` | Pipeline state (phase, committee, gates passed) |

If no `priming-rag-*.md` exists, a `.needs-priming` marker prompts `/sdf:prime-repo`. Every attachment ingested or URL researched generates a fresh `priming-rag-{name}.md` and triggers recalibration.

Full flow → `references/ontology/session-automation.md`.

## Lessons learned (living doc)

When the user corrects the orchestrator's behaviour, append the correction to `references/ontology/lessons-learned.md` with a timestamp. Read it at the start of every session to avoid recurring mistakes. This is the mechanism by which SAGE compounds knowledge across engagements.

## Known limits

- `validate_yaml.py` checks parseability, not schema correctness. A SKILL.md with `tools: [NotARealTool]` parses but still fails at runtime.
- `heuristic-evals.py` produces skill-specific graders/evals deterministically but without human judgement — suitable as a floor, not a ceiling. Plan an LLM-polish pass per skill for v13.5+.
- The end-to-end harness (`run-skill-evals.py`) depends on `claude` CLI being on PATH for real mode. CI uses `--mock` and expects most assertions to fail — that's signal, not regression.
- NotebookLM uses internal Google APIs (disclosed upstream); availability and tool shape can change without notice.

---

- **Author**: Javier Montaño
- **Contributors**: Jean Ruiz Granda (ad-hoc feedback & review) · Catherine Rodrigo
- **Co-authored with**: Claude Code
- **Copyright**: © 2026 Sofka Technologies. All Rights Reserved. Tecnología para sofkianos.  
**Tagline**: Tecnología para sofkianos.

*Sofka, your technology partner.*
