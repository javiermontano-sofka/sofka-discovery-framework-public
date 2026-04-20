# Sofka SAGE — Agentic PreSales as Service

**SAGE** (Sofka Agentic Gateway to Excellence) turns Claude Code into a rigorous pre-sales discovery agency. It is not a prompt template; it's a complete agentic ecosystem with an evidence protocol, quality gates, a 4-layer architecture, and a testing suite that fails CI when the rules are broken.

## Current state — v13.4.0

| Resource | Count |
|----------|------:|
| Agents | 49 |
| Skills (7/7 INSIGNIA) | 214 |
| Commands | 101 |
| Ontology sub-files | 15 |
| NL-HP prompts | 42 |
| Quality gates | G0/G1/G1.5/G2/G3 (5) |
| Pytest tests | 57 (100% pass) |
| Functional extractors | 9 (csv/xlsx/docx/pdf/pptx/html/code/structured/generic) |
| Embedded MCP servers | 1 (NotebookLM, 35 tools) |

See `CLAUDE.md` for the version history (v13.0 → v13.4) and what each bump changed.

## What SAGE does (and what it is not)

**Does**: Drives a full pre-sales engagement from cold-repo intake to executive roadmap. Ingests heterogeneous attachments (FASE 0) → orchestrates a 7-expert committee through 4 ToT phases → enforces evidence tagging → emits brand-compliant deliverables (markdown + HTML) → maintains a session changelog for recovery.

**Is not**: A general-purpose coding assistant, a code generator, or a business advisor. Don't use SAGE for implementation tasks; hand off to the relevant specialist plugin (SAP, MAO, PM-APEX, etc.) once scope is locked.

**Cost / scope**: A full `/sdf:run-deep` pipeline produces ~7 deliverables, burns substantial tokens (committee = 7 agents × multiple turns), and typically takes 2-4 hours of wall-clock including human reviews at gates. Use `/sdf:run-express` (3 deliverables, ~90 min) for Go/No-Go triage.

## Install

```bash
# Option 1 — via marketplace (recommended)
cp -r <this-repo>/sdf ~/.claude/plugins/marketplaces/local-desktop-app-uploads/

# Option 2 — via git clone (if you're syncing upstream)
git clone https://github.com/sofka-technologies/discovery-framework.git \
  ~/.claude/plugins/marketplaces/local-desktop-app-uploads/sdf

# Bootstrap Python venv (3.10+ required, 3.13 tested) — extractors depend on it
bash ~/.claude/plugins/marketplaces/local-desktop-app-uploads/sdf/scripts/setup-attachments.sh

# NotebookLM CLI+MCP (unified package) — optional but recommended
bash <sdf-path>/scripts/nlm-install.sh && nlm login && nlm doctor
```

Restart Claude Code; `/sdf:menu` confirms activation.

## Entry points (which command to use when)

| Scenario | Command | Produces | Typical duration |
|----------|---------|----------|------------------|
| Uncertain, want to explore | `/sdf:menu` | Interactive command palette | — |
| Cold-repo intake | `/sdf:prime-repo` | `priming-rag-*.md` knowledge base | ~15 min |
| Go/No-Go decision | `/sdf:run-express` | Brief + AS-IS + Roadmap (3 deliverables) | ~90 min |
| Full facilitated engagement | `/sdf:run-guided` | 16 deliverables, human gate approvals | 2-4 days |
| Autonomous prototype | `/sdf:run-auto` | 16 deliverables, no pauses | ~3 h (real-time) |
| Architecture direction only | `/sdf:run-deep` | 7 deliverables (arch + spec + handover) | ~3 h |
| SAGE demo on current repo | `/sdf:demo` | Guided walkthrough, sample deliverable | ~20 min |
| Advance pipeline after gate | `/sdf:a` | Next phase artefacts | per-phase |

## Architecture (4-layer)

```
sdf/
├── agents/              49 subagents + 2 orchestrators · `name:` = filename · no Agent tool in subagents
├── commands/            101 /sdf:* commands · no foreign prefix refs (audit enforces)
├── skills/              214 skill dirs · all 7/7 INSIGNIA · SKILL.md auto-activates
├── references/
│   ├── ontology/        15 hub children — read on demand, not upfront
│   ├── skill-robustness-template/   Scaffold for new skills
│   └── priming-rag-*.md Auto-generated per ingested source
├── hooks/hooks.json     SessionStart + PostToolUse — ghost menu, changelog, context
├── scripts/             Audits, extractors, renderers, ecosystem batch tools
├── templates/           Jinja2 brand HTML base + markdown deliverable templates
├── .mcp.json            NotebookLM MCP stdio config (notebooklm-mcp binary)
├── landing.html         Interactive ecosystem landing (Sofka DS v5)
└── prompt-library.html  Searchable NL-HP prompt catalog
```

4 sibling plugins (`metodologia-discovery-framework` GPL-3.0, `pm-project-framework`, `sovereign-architect`, `plugin-qa`) live inside `sdf/` and ship via `.claude-plugin/marketplace.json`. They follow their own release cycles — don't sync their files when working on SDF core.

## The pipeline (phases + gates)

```
FASE 0: Attachment ingestion (@attachment-processor)     ──┐
  ↓  priming-rag-*.md generated                            │
FASE R: Research augmentation (@research-scientist +        │
  ↓     NotebookLM MCP)                                    │ G0 · Security (secrets scan)
P0 Plan → P1 Stakeholders → P2 Brief → P3 AS-IS → P4 Flows │ G1 · Discovery Readiness (post-P4)
  ↓                                                          │
P5 Scenarios (ToT) → P5b Feasibility (Think Tank 7 Sabios)  │ G1.5 · Feasibility (post-P5b)
  ↓                                                          │
P6 Roadmap + Cost Estimation                                │ G2 · Budget & Scope (post-P6)
  ↓                                                          │
P7 Spec → P8 Pitch → P9 Handover                            │ G3 · Delivery (pre-handoff)
```

Each gate has a defined pass/fail checklist in `references/ontology/quality-gates.md`. Gates are hard stops — the orchestrator refuses to advance until criteria are met.

## Service-type routing

`{TIPO_SERVICIO}` is classified in FASE 0 and activates the right committee composition + skill set:

| Type | Alias | Direct command |
|------|-------|----------------|
| Software Development & Architecture | `SDA` | default (auto-detect) |
| Quality Assurance | `QA` | `/sdf:qa-discovery` |
| Robotic Process Automation | `RPA` | `/sdf:rpa-discovery` |
| Data & AI | `Data-AI` | `/sdf:ai-discovery` |
| Cloud Infrastructure | `Cloud` | `/sdf:cloud-discovery` |
| Staff Augmentation | `SAS` | `/sdf:sas-discovery` |
| Management & PMO | `Management` | `/sdf:management-discovery` |
| UX Design | `UX-Design` | `/sdf:ux-discovery` |
| Digital Transformation | `Digital-Transformation` | `/sdf:transformation` |
| Multi-service program | `Multi-Service` | auto (2+ types detected) |

Full routing matrix → `references/ontology/service-routing.md`.

## Committee of 49 agents

**Permanent triad** — active in every engagement:
- `@discovery-conductor` — impartial orchestrator, sequences phases, enforces gates (never performs analysis itself)
- `@delivery-manager` — timeline, scope, risks, stakeholder comms
- `@risk-controller` — continuous governance, escalation path

**Think Tank of 7 Sabios** — feasibility validation at G1.5:
Research Scientist · Economics Researcher · Systems Theorist · Technology Scout · Integration Researcher · Hardware Systems Engineer · Data Scientist

**~39 Specialists** — activated per `{TIPO_SERVICIO}` and phase (architecture, data, AI, security, UX, PMO, change management, finance, etc.)

Full roster → `references/ontology/agent-committee.md`.

## Evidence protocol

Every factual claim carries exactly one tag. Priority (v13.3+):

```
[CÓDIGO] > [ADJUNTO] > [CONFIG] > [DOC] > [NOTEBOOKLM] > [STAKEHOLDER] > [INFERENCIA] > [SUPUESTO]
```

Enforcement:
- `[ADJUNTO:file:loc]` without a matching `.discovery/priming-rag-*.md` → `@quality-guardian` fails the deliverable.
- `>30% [SUPUESTO]` → mandatory warning banner at the top of the document.
- `severity=CRÍTICO + [SUPUESTO]` → mandatory validation flag; pipeline cannot advance.

Full catalog → `references/ontology/protocol-zero-hallucination.md`.

## Brand contract (Design System v5)

| Token | Value | Rule |
|-------|-------|------|
| Primary | `#FF7E08` | Orange Sofka — CTA, accents, hero |
| Background | `#EFEAE4` | Warm beige — never pure white |
| Success | `#FFD700` | **Gold — green is forbidden** |
| Font | Inter (300/400/500/600/700) | No other typeface in brand deliverables |

The brand-render smoke test greps for `#00ff00`, `#2ecc71`, `: green` and fails CI if any appear. Use `--pos` (`#FFD700`) for success signals.

Full tokens → `references/ontology/canonical-tokens.md`.

## Session automation

On `SessionStart`, hooks populate `.discovery/` with:

| File | Purpose |
|------|---------|
| `SESSION-README.md` | Context summary Claude reads first |
| `SESSION-CLAUDE.md` | Session-specific orchestrator instructions |
| `calibration-digest.md` | Priming + calibration state |
| `ghost-menu.md` | Contextual nav for the active deliverable |
| `session-changelog.md` | Running log for recovery / handoff |
| `session-state.json` | Pipeline state (phase, committee, gates passed) |
| `repo-index.json` | Repo inventory |

If no `priming-rag-*.md` exists, a `.needs-priming` marker prompts `/sdf:prime-repo`. Each attachment ingested or URL researched triggers recalibration.

Full flow → `references/ontology/session-automation.md`.

## Testing + CI

```bash
source scripts/.venv/bin/activate
pytest scripts/tests/ -v                          # 57 tests, 100% pass expected
python scripts/tests/validate_yaml.py             # 1,783 frontmatters parse OK
bash   scripts/audit-sdk-compliance.sh            # no Agent tool in subagents, etc.
bash   scripts/audit-command-prefixes.sh          # /sdf: only
python scripts/ecosystem/audit-compliance.py      # placeholder vs ai-generated tally
python scripts/ecosystem/run-skill-evals.py --sample 20 --mock   # end-to-end harness
```

`.github/workflows/test.yml` runs the same five checks on every push.

## Documentation

Operational ontology (agent-read) lives in [`references/ontology/`](references/ontology/). Pedagogical docs (human-read) live in [`docs/`](docs/README.md) — Diátaxis four-quadrant tree (tutorials · how-to · reference · explanation) plus 25 ADRs and C4 diagrams. Start at [`docs/README.md`](docs/README.md). Governance entry points: [`CONTRIBUTING.md`](CONTRIBUTING.md) · [`SECURITY.md`](SECURITY.md) · [`GLOSSARY.md`](GLOSSARY.md).

## Known limits

- `validate_yaml.py` checks parseability, not schema (`tools: [NotARealTool]` parses but fails at runtime).
- `heuristic-evals.py` produces deterministic skill-specific graders/evals — the floor, not the ceiling. Plan LLM polish per skill for v13.5+.
- End-to-end harness requires `claude` CLI for real-mode runs; CI uses `--mock` where most assertions fail by design (signal, not regression).
- NotebookLM uses Google's internal APIs; tool availability can change without notice. `nlm doctor` diagnoses auth/version issues.
- Sibling plugins (MAO GPL, PM, SA, plugin-qa) are shipped under `sdf/` but have independent release cycles; do not refactor them as part of SDF-core work.

## Decisions and trade-offs

- **Spanish as default language** — audience is LatAm enterprise. Evidence tags (`[CÓDIGO]` etc.) stay in Spanish for UI consistency; English comments stay in code.
- **Markdown-Excellence as output contract** — TL;DR + dense bullets + Mermaid + ghost menu. No wall-of-text prose. Rationale: pre-sales readers skim; density wins.
- **Filename convention `{phase}_{deliverable}_{client}_{WIP|Aprobado}.{ext}`** — drives auto-rendering in `landing.html` and enables session recovery. Renaming breaks the hooks.
- **MCP stdio for NotebookLM** — lower latency than HTTP, simpler DevOps, works in CI. Cost: requires `notebooklm-mcp` binary on PATH.
- **Heuristic-first evals/graders** — LLM generation doesn't scale to 1,100 skills economically. Heuristic sets a floor; human/LLM polish raises the ceiling over time.
- **Hub-and-spoke ontology (15 files, not one mega-doc)** — progressive disclosure keeps every session's context lean. Reading all 15 upfront wastes tokens.

## License + attribution

- **License**: All Rights Reserved — © 2026 Sofka Technologies
- **Tagline**: Tecnología para sofkianos.
- **Author**: Javier Montaño
- **Contributors**: Jean Ruiz Granda (ad-hoc feedback & review) · Catherine Rodrigo
- **Co-authored with**: Claude Code

*Sofka, your technology partner. Tecnología para sofkianos. — La excelencia no se improvisa, se diseña.*
