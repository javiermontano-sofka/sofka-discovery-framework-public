# SAP Enterprise Plugin v2.1

> Standalone multi-agent plugin for SAP S/4HANA Cloud discovery, implementation, and operations in Claude Code.
> **Author**: Javier Montaño

## Features

- 🧠 **6 specialist agents** with delegation framework
- 🎯 **10 delegator commands** with `/sap:` prefix
- 📋 **12 deterministic templates** (no hallucinated format)
- 🛡️ **5 local validation scripts** (bash, zero-API)
- 📚 **11 SAP skills** + **22 reference files**
- ⚡ **Clean Core enforced** — Level D violations rejected
- 🔬 **Evidence-tagged outputs** — mandatory `[CÓDIGO]` `[CONFIG]` `[DOC]` `[SUPUESTO]` tags
- 🚫 **Zero-API mode** — no external tokens required

## Installation

### Option 1: Symlink (Development)

```bash
# Clone or download the plugin
cd ~/Downloads
unzip sap-enterprise-plugin-v2.1.zip

# Link to Claude Code plugins directory
ln -s "$PWD/sap-enterprise-plugin" ~/.claude/plugins/data/sap-enterprise-plugin

# Restart Claude Code → plugin loads automatically
```

### Option 2: Copy to Plugins Directory

```bash
unzip sap-enterprise-plugin-v2.1.zip -d ~/.claude/plugins/data/
```

### Verify Installation

In Claude Code:
```
/sap:menu
```

Should display the command palette.

## Quick Start

```bash
# Full SAP discovery pipeline
/sap:discovery AcmeCorp

# Assessment standalone
/sap:assess

# Workshop Fit-to-Standard
/sap:fit-to-standard CO

# Generate ABAP Cloud extension
/sap:generate-abap "Custom approval workflow"
```

## Architecture

```
sap-enterprise-plugin/
├── .claude-plugin/plugin.json      # Plugin manifest
├── agents/                          # 6 specialist agents
│   ├── _defaults.md                # Shared rules
│   ├── sap-orchestrator.md         # Master conductor
│   ├── abap-expert.md              # ABAP Cloud + RAP
│   ├── functional-lead.md          # F2S + scoring
│   ├── module-specialist.md        # CO/SD/PS/FI/MM/HCM
│   ├── sap-docs-steward.md         # Reference validator
│   └── qa-validator.md             # Auditor
├── commands/                        # 10 commands (/sap:*)
├── skills/                          # 11 SAP skills
├── templates/                       # 12 deterministic templates
├── scripts/                         # 5 bash validators
├── references/                      # body-of-knowledge + knowledge-graphs
├── hooks/hooks.json                # SessionStart + PostToolUse hooks
├── settings.json                    # Default agent: sap-orchestrator
├── CLAUDE.md                        # Documentation hub
└── README.md                        # This file
```

## Multi-Agent Delegation

```
@sap-orchestrator (default)
    ├─ @abap-expert         → /sap:generate-abap
    ├─ @functional-lead     → /sap:fit-to-standard, /sap:gap-analysis
    ├─ @module-specialist   → /sap:module-config
    ├─ @sap-docs-steward    → consulted by all (reference validation)
    └─ @qa-validator        → consulted by all (blocking QA)
```

## Hard Rules

1. All generated files bear author: **Javier Montaño**
2. Evidence tags mandatory on every factual claim
3. Clean Core compliance >= 5/6 per extension (else rejected)
4. Templates mandatory — agents load from `templates/` before output
5. QA from `@qa-validator` blocks delivery if violations found
6. No prices — only FTE-months (P50/P80/P95)
7. Spanish (Latin American) as default output language

## Usage Examples

### Full Discovery Pipeline

```
/sap:discovery AcmeCorp --mode guided
```

Produces 9 deliverables aligned to SAP Activate Discover + Prepare phases:
- `00_SAP_Landscape_AcmeCorp_WIP.md`
- `01_SAP_Scope_AcmeCorp_WIP.md`
- `02_FitToStandard_AcmeCorp_WIP.md`
- `03_Gap_Registry_AcmeCorp_WIP.md`
- `04_Solution_Architecture_AcmeCorp_WIP.md`
- `05_Migration_Plan_AcmeCorp_WIP.md`
- `06_SAP_Roadmap_AcmeCorp_WIP.md`
- `07_SAP_Pitch_AcmeCorp.html`
- `08_SAP_Handover_AcmeCorp.md`

### ABAP Cloud Generation

```
/sap:generate-abap "Custom timesheet approval workflow for PS projects"
```

Generates `.abap-cloud-extension/` with:
- CDS entities (root + projection)
- Behavior definition with draft handling
- Service definition + OData V4 binding
- Fiori Elements metadata annotations
- ABAP Unit tests
- Communication Arrangement documentation

All validated by `@qa-validator` against `scripts/validate-clean-core.sh`.

## License

All Rights Reserved © 2026 Javier Montaño.

## Support

- Documentation hub: [`CLAUDE.md`](./CLAUDE.md)
- Command palette: `/sap:menu`
- Author: javier.montano.guz@gmail.com

---

*SAP Enterprise Plugin v2.1 — Diseñado y desarrollado por Javier Montaño.*
