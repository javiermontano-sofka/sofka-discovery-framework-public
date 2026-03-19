# PMO-APEX v1.0 — Agentic Project Excellence

> Your IDE becomes an intelligent project office.

**PMO-APEX** is a Claude Code plugin that turns your terminal into a full-service project management office. It provides structured pipelines, expert agent committees, and zero-hallucination governance for planning, executing, and closing projects across any methodology.

## Quick Start

```bash
# Install as a Claude Code plugin
claude --plugin-dir ./pm-project-framework

# Initialize a new project
/pm:init

# Run the full autonomous pipeline
/pm:run-auto

# Or start with a guided session
/pm:run-guided
```

## What's Included

| Asset | Count | Description |
|-------|-------|-------------|
| Agents | 48 | Expert committee (3 triad + 9 core + 36 specialists) |
| Skills | 109 | MOAT-structured capabilities with progressive loading |
| Commands | 103 | User-invocable actions (69 primary + 34 aliases) |
| Scripts | 19 | Automation hooks (security, changelog, context, priming) |
| Ontology | 13 | Living knowledge sub-files |
| RAG Priming | 8 | Domain knowledge documents |
| Quality Gates | 5 | G0 (security) through G3 (final approval) |

## Pipeline Overview

```
Phase 0: Initiation     → Project Charter
Phase 1: Stakeholders   → Stakeholder Register + RACI
Phase 2: Scope          → WBS + Scope Baseline
Phase 3: Schedule       → Schedule Baseline (CPM/PERT)
Phase 3b: Steering      → Go/No-Go (7 Advisors, >=5/7)
Phase 4: Methodology    → Methodology Playbook
Phase 5: Resources      → Resource Plan + Budget Baseline
Phase 6: Execution      → Status Reports + EVM + Dashboard
Phase 7: Close-out      → Lessons Learned + Closure Report
```

## Supported Project Types

Set via `{TIPO_PROYECTO}` routing:

- **Agile** — Scrum, XP, Crystal
- **Kanban** — Flow-based, WIP limits
- **SAFe** — Scaled Agile (ART, PI Planning)
- **Waterfall** — Predictive, PMBOK/PRINCE2
- **Hybrid** — Mixed methodologies
- **PMO** — PMO setup and governance
- **Portfolio** — Multi-project portfolio management
- **Transformation** — Organizational change programs
- **Recovery** — Troubled project rescue
- **Multi-Method** — Custom methodology blend

## Key Commands

```bash
/pm:run-auto            # Full autonomous pipeline
/pm:run-express         # Charter + Schedule + Dashboard (1 session)
/pm:run-guided          # Co-created with human facilitation
/pm:run-deep            # Deep governance (7 deliverables, 2 gates)
/pm:menu                # Interactive command palette
/pm:a                   # Advance to next pipeline step
/pm:scan-secrets        # G0 security gate scan
/pm:export-pdf          # PDF with APEX branding
/pm:retrospective       # Quantitative retrospective
/pm:convert-skills      # Export to Cursor, Codex, Gemini, etc.
```

## Branding

- **Primary**: `#2563EB` Royal Blue
- **Accent**: `#F59E0B` Amber (NEVER green)
- **Dark**: `#0F172A` Slate 900
- **Font**: Inter

## Evidence Protocol

Every claim is tagged: `[PLAN]` `[SCHEDULE]` `[METRIC]` `[STAKEHOLDER]` `[DECISION]` `[INFERENCIA]` `[SUPUESTO]` `[HISTORICO]`

If >30% of claims are `[SUPUESTO]`, a warning banner is mandatory.

## Session Directory

On activation, the plugin generates session files in `.project/`:

```
.project/
├── SESSION-README.md          # Project context
├── SESSION-CLAUDE.md          # Orchestrator instructions
├── calibration-digest.md      # Priming state
├── ghost-menu.md              # Contextual navigation
├── session-changelog.md       # Continuity log
├── decision-log.md            # Decision registry
└── assumption-log.md          # Assumption tracking
```

## License

All Rights Reserved. (c) 2026 Sofka Technologies.

---

*PMO-APEX v1.0 — Agentic Project Excellence.*
*Sofka, your technology partner.*
