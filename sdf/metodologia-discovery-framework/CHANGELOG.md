# Changelog — MAO Framework

All notable changes to the MAO Framework plugin (formerly MetodologIA Discovery Framework).

## [12.0.0] — 2026-03-15

### Living Ontology Architecture
- CLAUDE.md refactored to 119-line routing hub
- 12 ontology sub-files in `references/ontology/` (living documents)
- `lessons-learned.md` — auto-updated with session corrections
- `brand-orchestration.md` — 3-brand detection and isolation rules

### New UX Commands
- `/mao:menu` — Interactive command palette with pipeline state awareness
- `/mao:a` — Advance to next pipeline step with gate validation
- `/mao:demo` — Guided walkthrough of MAO on current repo
- Command count: 84 → 87

### Canonical Token Unification
- `references/ontology/canonical-tokens.md` — single source of truth for CSS tokens
- Validated against Acme Corp production deliverables
- 27 `--mao-*` custom properties standardized
- Default light background `#0F172A` (NOT dark, NOT white)
- Inter as sole font (Clash Grotesk removed)
- Design System v5 Unified reconciled with v4 Acme Corp tokens

### 3-Brand Orchestration
- Global CLAUDE.md expanded: MetodologIA + MetodologIA + JM Labs
- Context auto-detection rules (working directory, keywords, prefix)
- Brand isolation enforced (NEVER mix)
- JM Labs personal brand: #14B8A6 teal, "Ideas into systems."

### Plugin Metadata
- Version bump: 11.0.0 → 12.0.0
- 48 agents, 100 skills, 87 commands, 13 ontology sub-files

---

## [11.0.0] — 2026-03-14

### Rebrand — MAO Framework (Agentic Gateway to Excellence)
- **Naming**: "MetodologIA Discovery Framework" → "MAO Framework" across all assets
- **Identity**: Universal Discovery Framework — tu IDE se convierte en una agencia de discovery
- **Technical prefix**: `/mao:` se mantiene para backward-compatibility

### Zero-Hallucination Protocol
- Evidence tagging obligatorio: [CÓDIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO]
- Banner de advertencia si >30% es [SUPUESTO]
- Confidence levels por tag (Alta/Media/Baja)
- Flag obligatorio en hallazgos severity=CRÍTICO + [SUPUESTO]

### Hook System v2.0
- **Ghost menu hook**: Navegación contextual persistente en cada artefacto
- **Session changelog hook**: Registro automático para continuidad ante crisis
- **Session context hook**: Genera SESSION-README.md + SESSION-CLAUDE.md por repo
- **PostToolUse hook**: Changelog automático en cada Write/Edit
- SessionStart mejorado: escaneo + contexto + ghost menu + changelog + priming

### RAG-Priming Enhancement
- 8 nuevos priming-RAG docs agrupados (agents-roster, commands-reference, skills-catalog, plugin-infrastructure, prompts-library, html-assets, global-ecosystem, adjuntos-policy)
- Master index de 696+ líneas con inventario completo del ecosistema
- Política automática de procesamiento de adjuntos
- `.discovery/` como directorio estándar de sesión

### Design System v5 — Dark Authority
- Referencia canónica: `references/design-system-v5.md`
- 10 componentes documentados (nav, hero, cards, badges, buttons, tables, code, modals, stats, ghost-menu)
- Regla absoluta: gold (#22D3EE) para éxito, NUNCA verde
- Patrones de composición: landing, one-pager, entregable técnico

### Prompt Library NL-HP v3.0
- 44 prompts en estilo NL-HP playbook (ROL, OBJETIVO, PROTOCOLO, RESTRICCIONES, CRITERIOS, EDGE CASES, ===params, ===inputs)
- Versionado: v0 (robustened), v1 (NL-HP)
- Prompt-library.html actualizado con excerpts NL-HP

### HTML Assets
- landing.html: MAO branding, v11.0
- prompt-library.html: MAO branding, NL-HP excerpts, v11.0

### Marketplace
- marketplace.json actualizado a v2.0.0
- Plugin registrado como v11.0.0 con keywords MAO

---

## [10.0.0] — 2026-03-14

### Added — Full Roster Merge

**48-Agent Specialist Committee (was 12 in v9.0.0)**
- Restored 34 domain specialists from previous roster
- Added 2 new agents: product-strategist, compliance-analyst
- All 4 service-type agents from v9.0.0 retained: ai-strategist, process-automation-specialist, qa-strategist, transformation-architect
- Total: 12 core + 36 domain specialists = 48 agents

**100 MOAT Skills (was 59 in v9.0.0)**
- Restored 19 skills from previous roster
- Added 22 new skills across 13 domains: compliance-assessment, product-strategy, vendor-assessment, integration-architecture, capacity-planning, disaster-recovery, accessibility-audit, team-topology, migration-playbook, sla-design, incident-management, tech-debt-assessment, dependency-analysis, release-strategy, documentation-architecture, developer-experience, governance-framework, maturity-assessment, sustainability-assessment, competitive-intelligence, poc-lab, onboarding-playbook
- All 11 service discovery skills from v9.0.0 retained
- All 9 universalized skills with {TIPO_SERVICIO} retained

**84 Commands (was 21 in v9.0.0)**
- Restored 61 alias commands from previous roster
- Added 2 new commands: benchmark-maturity, simulate-scenarios
- All 4 service-type commands from v9.0.0 retained

### Architecture
- Full specialist roster + universal services + expanded coverage = best of both worlds
- 48 agents, 100 skills, 84 commands, 20 priming-RAG files, {TIPO_SERVICIO} (10 values)
- All v9.0.0 universalization retained: service-type routing, dynamic committee, priming-RAG
- New CLAUDE.md optimized for agentic pre-sales ecosystem onboarding
- New landing.html with Authority design principles (dark mode, Minto Pyramid, Neo-Swiss)

---

## [9.0.0] — 2026-03-14

### Added — Universal Services Discovery Platform

**`{TIPO_SERVICIO}` Parameter (10 values)**
- New routing parameter: `SDA` (default) | `QA` | `Management` | `RPA` | `Data-AI` | `Cloud` | `SAS` | `UX-Design` | `Digital-Transformation` | `Multi-Service`
- Auto-detection rules (10-step priority) with user confirmation
- Full backward compatibility — omitting parameter defaults to SDA behavior

**11 New Service Discovery Skills (MOAT pattern)**
- `rpa-discovery` — Process landscape, automation readiness scoring, bot architecture (7 sections)
- `qa-service-discovery` — TMMi assessment, PITT methodology, test factory design (7 sections)
- `ai-center-discovery` — AI readiness (AI SCALE), use case portfolio, model governance (8 sections)
- `management-discovery` — PMO maturity, methodology fitness, Factor WOW (7 sections)
- `staff-augmentation-discovery` — Talent gap, skills matrix, staffing model (6 sections)
- `digital-transformation-discovery` — Digital maturity, multi-service program design (7 sections)
- `cloud-service-discovery` — Cloud readiness, DORA metrics, FinOps (6 sections)
- `bi-analytics-discovery` — Data maturity (DCAM), BI landscape, self-service (7 sections)
- `ux-design-discovery` — Design maturity, design system, UX research capability (7 sections)
- `mentoring-training-discovery` — Capability assessment, learning paths, knowledge transfer (6 sections)
- `mini-apps-discovery` — Citizen developer readiness, low-code platform assessment (6 sections)

**4 New Agents**
- `process-automation-specialist` — RPA/BPM expert (activated for {TIPO_SERVICIO}=RPA)
- `ai-strategist` — AI SCALE methodology, MLOps, responsible AI (activated for Data-AI)
- `qa-strategist` — TMMi, PITT, test factory, ISTQB alignment (activated for QA)
- `transformation-architect` — Multi-service program design, cross-workstream governance (activated for Digital-Transformation/Multi-Service)

**4 New Shortcut Commands**
- `rpa-discovery` — RPA & process automation discovery
- `qa-discovery` — QA-as-a-service discovery
- `ai-discovery` — AI Center & data platform discovery
- `transformation` — Digital transformation program discovery

**20 Priming-RAG Knowledge Files**
- Corporate, SDA, QA, Management, RPA, Data-AI, AI Center, Cloud, SAS capabilities
- Banking and Retail industry intelligence
- CoE Management, APM Guidelines, AI SCALE methodology references
- Service models, impact metrics, certifications, contractual models
- Service-type routing matrix reference

### Changed
- **discovery-orchestrator**: 48 → 59 skills, 8 → 9 domains, service-type-aware routing
- **discovery-conductor**: Step 0 service type detection, dynamic committee (7-10 experts), service-type input validation
- **asis-analysis**: Universal assessment with 8 service-type variant section sets
- **cost-estimation**: Universal sizing methods (COCOMO II for SDA only, service-specific methods for others)
- **flow-mapping**: Context-dependent truth source (not code-only), service-type domain models
- **functional-spec**: Service-type deliverable inventory and acceptance criteria
- **software-viability**: Universal viability scale (tools, platforms, methodologies)
- **testing-strategy**: QA-as-a-service variant (QS1-QS5)
- **software-architecture, devsecops-architecture, database-architecture**: Scoping notes added
- **discovery.md, asis.md, flows.md, spec.md**: Added {TIPO_SERVICIO} parameter support
- **plugin.json**: v7.0.0 → v9.0.0, updated description and keywords
- **CLAUDE.md**: Added {TIPO_SERVICIO} to Common Parameters, service-type commands to Quick Reference

### Skill Count
- Previous: 48 skills, 8 agents, 17 commands
- Current: 59 skills, 12 agents, 21 commands, 20 priming-RAG files

---

## [7.0.0] — 2026-03-12

### Added — NL-HP v3.0 Integration
- **10 document commands**: `plan`, `stakeholders`, `brief`, `asis`, `flows`, `scenarios`, `roadmap`, `spec`, `pitch`, `handover` — individual deliverable generation following NL-HP v3.0 checkpoint protocol (CP-0→CP-4)
- **3 pipeline flow commands**: `express` (Go/No-Go, 3 deliverables), `intermediate` (architectural direction, 7 deliverables), full pipeline updated to NL-HP v3.0
- **1 rescue command**: `rescue` — diagnose, repair, and complete stalled discoveries
- **Checkpoint model**: CP-0 (Ingesta), CP-1 (Plan), CP-N (Phase), CP-F (Final validation) embedded in all commands
- **Cross-reference system**: all deliverables linked via `→ See 03_AS-IS § Section` convention
- **Mermaid diagram catalog**: prescribed diagrams per deliverable (C4Context, sequenceDiagram, gantt, quadrantChart, etc.)

### Changed
- `discovery` command: rewritten with NL-HP v3.0 full pipeline protocol (completo.md)
- `discovery-auto` command: rewritten with NL-HP v3.0 autonomous mode (desatendido)
- `discovery-review` command: rewritten with NL-HP v3.0 audit protocol (revisar.md) — per-deliverable criteria, cross-consistency matrix, verdict system
- `discovery-improve` command: rewritten with NL-HP v3.0 evolution protocol (evolucionar.md) — delta reporting, preservation rules
- CLAUDE.md: comprehensive command reference with all 17 commands organized by category
- Plugin version bumped to 7.0.0

### Architecture
- Total commands: 17 (was 4) — 10 document + 3 pipeline + 4 operations
- Total agents: 8 (unchanged)
- Total skills: 48 (unchanged)
- NL-HP v3.0 prompts fully integrated into plugin command structure
- Evidence tagging standard: [CÓDIGO], [CONFIG], [DOC], [INFERENCIA]
- Quality standard: markdown-excellence with TL;DR, 🟢/🟡/🔴 tables, Mermaid, callouts

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
- License: MIT → MIT (Comunidad MetodologIA proprietary)
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

**Autor:** Javier Montaño | Comunidad MetodologIA
