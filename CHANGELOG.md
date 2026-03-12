# Changelog

All notable changes to the Sofka Discovery Framework plugin.

## [6.1.0] — 2026-03-12

### Added
- `project-program-management` skill — PMO governance backbone: phase gate management, resource orchestration, dependency control, proposal QA validation
- `risk-controlling-dynamics` skill — Proactive risk controller: assumption stress-testing, pre-mortem analysis, financial controls, worst-case scenario modeling
- 4 new agents: governance-tracker, proposal-qa-validator, risk-sentinel, premortem-analyst
- Pre-Gate 3 Proposal QA checkpoint: multidimensional validation before client delivery
- New "Governance & Risk" domain in skill catalog
- Deliverables P-01_Program_Governance and P-02_Risk_Controlling in manifest

### Changed
- Skill count: 46 → 48 (new governance & risk domain)
- Domain count: 7 → 8
- Orchestrator updated: Expert Panel includes governance cross-cutting roles, Proposal QA checkpoint added before G3
- Gate 3 criteria updated: now requires Proposal QA ≥3.5/5.0 and Risk Assessment
- piloto-auto pause triggers expanded: QA failure, critical assumptions, magnitude drift

## [6.0.0] — 2026-03-12

### Added
- `mermaid-diagramming` skill — Mermaid diagram generation with placement rules and accessibility
- `markdown-excellence.md` reference — moat-level output standard (tables, footnotes, callouts, anti-patterns)
- `template-catalog.md` reference — deliverable templates with format × variant matrix
- Output format protocol: markdown (default), html, docx, dual — switchable via `{FORMATO}` parameter
- A/B variant system: ejecutiva (~40% length) vs técnica (full) via `{VARIANTE}` parameter
- Smart HITL modes: piloto-auto (default), desatendido, supervisado, paso-a-paso
- 5% innovation margin in cost magnitude outputs
- Deliverable-specific Mermaid diagram prescriptions (C4, gantt, quadrant, sequence, ER, state)
- NL-HP v3.0 prompts: 16 rewritten with 10x quality density, cross-references, acceptance criteria

### Changed
- Skill count: 45 → 46 (added mermaid-diagramming)
- Default output format: HTML → Markdown (markdown-excellence standard)
- Default MODO: desatendido → piloto-auto (smart HITL)
- `cost-estimation` evolved: 5% innovation margin for operational excellence
- `discovery-orchestrator` updated: output protocol, engagement modes, 46-skill catalog
- 13 pipeline skills updated with output format + Mermaid diagram specs
- All 16 NL-HP prompts upgraded to v3.0 with new params (FORMATO, VARIANTE), quality density, edge cases

## [5.0.0] — 2026-03-12

### Added
- Phase 3b: Technical Feasibility + Software Viability (new pipeline stage after Gate 1)
- `technical-feasibility` skill — 6D multidimensional feasibility analysis with claim validation
- `software-viability` skill — forensic tech/AI validator (substance vs smoke, devoted deep-cut)
- `commercial-model` skill — value capture & deal structure (earned value, JV, usage-based, hybrid)
- 6 new agents: fact-checker, feasibility-analyst, tech-forensic, ai-validator, value-model-designer, deal-structurer
- Cost disclaimer framework: costear ≠ cobrar

### Changed
- `cost-estimation` evolved: cost drivers & magnitude indicators only, NEVER final prices
- Skill count: 42 → 45
- Pipeline phases: 7 → 8 (added Phase 3b)
- Discovery Pipeline category: 12 → 15 skills
- Orchestrator updated with Phase 3b checkpoint and skill catalog v5
- Version bump to 5.0.0 (breaking: cost output model changed)

## [4.1.0] — 2026-03-12

### Added
- Phase 6: Handover Operacional — discovery-to-operations/commercial transition
- `discovery-handover` skill with 8-section deliverable (S1-S8)
- 2 handover agents: ops-transition-planner, commercial-activator
- 7 pre-designed HTML templates for handover sections
- Deliverable 09_Handover_Operaciones.html in manifest
- Phase 6 integrated into orchestrator, /discovery, and /discovery-auto commands

### Changed
- Skill count: 41 → 42
- Pipeline phases: 0-5 → 0-6
- plugin.json version bump to 4.1.0
- Updated all references from "41 skills" to "42 skills"

## [4.0.0] — 2026-03-11

### Changed
- License: MIT → All Rights Reserved (Sofka Technologies proprietary)
- plugin.json license field updated to reference LICENSE file
- README license section updated
- Version bump to 4.0.0 (breaking: license change)

## [3.0.0] — 2026-03-11

### Added
- 30 new specialized skills across 6 domains (architecture, data, cloud/mobile, engineering, consulting, delivery)
- Skill Catalog in orchestrator: 41 skills organized by domain with expert ownership mapping
- On-demand skill activation based on discovery findings
- Expert-to-domain skill ownership matrix
- 22 new skill-level specialist agents (2 per pipeline skill)
- `settings.json` with discovery-conductor as default agent
- `LICENSE`
- `CHANGELOG.md`
- Author attribution on all files: Javier Montaño

### Changed
- Orchestrator evolved: committee declaration, discovery plan, input management, industry SME activation
- Conductor agent expanded: initialization duties, committee management, plan maintenance
- `/discovery` and `/discovery-auto` commands updated with full initialization protocol
- `plugin.json` updated to v3.0.0 with complete metadata

## [2.0.0] — 2026-03-11

### Added
- 4 commands: discovery (guided), discovery-auto, discovery-review, discovery-improve
- 8 dream team agents: conductor, technical-architect, domain-analyst, full-stack-generalist, delivery-manager, quality-guardian, data-strategist, change-catalyst
- Excellence loop applied to all skills and agents
- Phase numbering unified (Phase 0-5)

### Changed
- All 11 skills enhanced to moat level
- Skills made self-contained (no cross-references)

## [1.0.0] — 2026-03-10

### Added
- Initial release with 11 discovery pipeline skills
- Basic orchestrator
- 3 quality gates
- Inter-phase data contracts

**Autor:** Javier Montaño | Sofka Technologies
