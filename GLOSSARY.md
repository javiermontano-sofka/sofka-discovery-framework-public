# Glossary

Canonical definitions for acronyms, proper nouns, and terms-of-art used across this monorepo. Every ALL-CAPS token in an elevated doc must either appear here or in `sdf/scripts/validators/_manifest.yaml:acronym_whitelist`. The `acronym-gate` CI job enforces this.

Rule: on first use in a doc, expand the acronym inline and link here (`[SAGE](GLOSSARY.md#sage)`). Subsequent uses within the same doc can use the short form.

## Core concepts

### SAGE
**Sofka Agentic Gateway to Excellence**. The overall methodology and plugin identity. Turns an IDE into an agentic pre-sales agency. See `sdf/README.md` for the implementation, `sdf/CLAUDE.md` for the operational hub.

### SDF
**Sofka Discovery Framework**. The plugin namespace (`/sdf:` prefix) and the directory `sdf/` in this monorepo. Synonym for SAGE in most contexts; SDF is the technical identifier, SAGE is the methodology identifier.

### SAP
Enterprise software vendor (Systeme, Anwendungen und Produkte). Context: `sap-enterprise-plugin/` is the SAP-focused plugin (prefix `/sap:`) covering S/4HANA Cloud discovery, Clean Core compliance, ABAP Cloud extensions, Fit-to-Standard workshops, etc.

### MAO
**MetodologIA de Aprovechamiento de Oportunidades**. The sibling plugin inside `sdf/metodologia-discovery-framework/`. Open-methodology variant of SAGE, licensed GPL-3.0. Independent release cycle.

### MOAT
**Modernization-Oriented Acceleration Technology**. Classification for SDF skills (`skills/*/` directories are "MOAT skills"). Signals the skill drives modernization outcomes rather than being a commodity task. Defined in `sdf/references/ontology/skills-catalog.md`.

### INSIGNIA
Structural contract for a fully-complete SDF skill. A skill is **7/7 INSIGNIA** when it has all seven components:
1. `SKILL.md` (the trigger + workflow)
2. `agents/grader.md` (QA criteria)
3. `evals/evals.json` (test cases)
4. `references/` (non-empty)
5. `examples/` (non-empty)
6. `scripts/` (non-empty)
7. `prompts/` (non-empty)

The term is internal to SDF, not external. `scripts/ecosystem/stamp-7of7.py` idempotently scaffolds missing dirs. `audit-compliance.py` classifies each skill.

### ToT
**Tree of Thoughts**. Reasoning pattern (Yao et al., 2023) adopted by SAGE for its 4-phase pipeline: Branching (generate diverse proposals) → Evaluate (score each branch) → Prune (drop low-confidence branches) → Expand (develop the winner). Distinct from the 11-stage deliverable pipeline (P0–P9) — ToT is the *meta-cycle*; P0–P9 are the *artefact phases*.

### NL-HP
**Natural Language — High Performance**. Prompt style used in `sdf/prompts/*.md`: structured ROL / OBJETIVO / PROTOCOLO / RESTRICCIONES / CRITERIOS / EDGE-CASES / ===params / ===inputs blocks. Optimized for consistent orchestrator behaviour. Library: `sdf/prompt-library.html`.

### Diátaxis
Documentation framework by Daniele Procida. Four quadrants on two axes (theoretical↔practical × acquisition↔application):
- **Tutorials** — learning-oriented (theoretical + acquisition)
- **How-to guides** — goal-oriented (practical + application)
- **Reference** — information-oriented (theoretical + application)
- **Explanation** — understanding-oriented (practical + acquisition)

`sdf/docs/` follows this taxonomy at top level.

### ADR
**Architecture Decision Record**. One-file, immutable-once-accepted record of a single architectural decision. Format by Michael Nygard (2011): Title / Status / Context / Decision / Consequences. `sdf/docs/adr/` holds them with `NNNN-slug.md` naming.

### arc42
Software architecture documentation template by Peter Hruschka and Gernot Starke. 12 canonical sections. SAGE uses a lite version of its headings inside `sdf/docs/explanation/architecture-overview.md` but splits sections into separate files per SAGE's progressive-disclosure principle.

### C4
Hierarchical software architecture diagramming model by Simon Brown. Four levels: L1 System Context, L2 Containers, L3 Components, L4 Code. SAGE uses L1–L3 (Mermaid syntax in `sdf/docs/diagrams/c4/`); L4 is unnecessary at its abstraction level.

### Zettelkasten
Knowledge management methodology by Niklas Luhmann. Atomic notes (one idea per file) with heavy cross-linking by keyword. Emergent structure rather than imposed hierarchy. SAGE applies it to `sdf/references/ontology/` (operational) and partially to `sdf/docs/explanation/` (pedagogical).

## Pipeline + operational terms

### FASE
Spanish for "phase". Used in SAGE pipeline labels: FASE 0 (attachment ingestion), FASE R (research augmentation), FASE 1–4 (ToT meta-phases).

### FASE 0
Attachment ingestion phase. Runs before any committee branching. `@attachment-processor` normalizes `.csv/.xlsx/.docx/.pdf/.pptx/.html/.py/.tsx/.sql/.json/.yaml/.xml` inputs into `.discovery/priming-rag-*.md` with `[ADJUNTO:file:locator]` evidence tags.

### HITL
**Human-In-The-Loop**. Interaction mode where the human reviews/approves at each gate. SAGE ships three HITL modes: `--auto` (no pauses, prototype), `--hitos` (pause at each gate, default for real engagements), `--paso-a-paso` (pause after every step, maximum control).

### F2S
**Fit-to-Standard**. SAP Activate workshop methodology: scoring SAP standard processes against client needs on four dimensions (business fit / complexity / configurability / adoption readiness). Command: `/sap:ajuste-estandar <module>`.

### SDA
**Software Development & Architecture**. Default service-type classification (`{TIPO_SERVICIO}=SDA`). Triggers the standard 7-expert committee + technical-architect lead.

### QA
**Quality Assurance**. Service-type classification. Adds `@qa-strategist` (TMMi, PITT methodology) to the committee. Command: `/sdf:qa-discovery`.

### RPA
**Robotic Process Automation**. Service-type classification. Adds `@process-automation-specialist` (process mining, bot architecture, UiPath/Automation Anywhere/Power Automate). Command: `/sdf:rpa-discovery`.

### SAS
**Staff Augmentation Services**. Service-type classification. Emphasizes skills-gap analysis, role/team composition, onboarding planning. Command: `/sdf:sas-discovery`.

### DS v5
**Design System v5**. Sofka's canonical brand system. Tokens: `--o #FF7E08` (orange primary), `--bk #000`, `--bg #EFEAE4` (warm beige background), `--pos #FFD700` (gold for success). Font: Inter. **Green is forbidden.** Full spec: `sdf/references/ontology/canonical-tokens.md`.

### MCP
**Model Context Protocol**. Anthropic's protocol for connecting external tool servers to Claude. SAGE ships one MCP server bundled (`sdf/.mcp.json` → `notebooklm-mcp`) with 35 tools. See `sdf/references/ontology/notebooklm-capabilities.md`.

### NotebookLM
Google product for curated knowledge bases with AI-powered query. SAGE integrates via the `notebooklm-mcp-cli` package which ships both the `nlm` CLI and the `notebooklm-mcp` MCP server.

### CLAUDE_PLUGIN_ROOT
Environment variable set by Claude Code to the absolute path of the currently-loaded plugin directory. Required for portable path references in hooks, commands, and scripts. Scripts use the fallback pattern `${CLAUDE_PLUGIN_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}` to work standalone.

### WIP / Aprobado
Filename-convention suffixes indicating document state. Pattern: `{phase}_{deliverable}_{client}_{WIP|Aprobado}.{ext}`. The `landing.html` asset renders WIP docs with a visible banner. Transition to `Aprobado` is a formal gate step.

## Evidence tags (priority order)

All caps by convention. See `sdf/references/ontology/protocol-zero-hallucination.md` for full rules.

| Tag | Meaning |
|-----|---------|
| **CÓDIGO** | Verified by direct source-code reading |
| **ADJUNTO** | Extracted from an attached file ingested via FASE 0 |
| **CONFIG** | Found in a configuration file |
| **DOC** | Cited from project documentation |
| **NOTEBOOKLM** | Retrieved from a curated NotebookLM knowledge base |
| **STAKEHOLDER** | Stated by a named human stakeholder |
| **INFERENCIA** | Reasoned from other evidence — must cite the inputs |
| **SUPUESTO** | Assumption not yet verified — triggers validation |

Auxiliary tag: **VACIO_CRITICO** marks a missing input that blocks pipeline advance.

## Quality gates

### G0 Security
Secrets scan on attachments and source; runs before FASE R. Ensures no API keys / tokens leak into evidence.

### G1 Discovery Readiness
Post-P4 (Flows). Confirms AS-IS analysis has evidence density ≥ 70% high-confidence tags, stakeholder map ≥ 5 roles, and no `[VACIO_CRITICO]` flags.

### G1.5 Feasibility
Post-P5b. Think Tank of 7 Sabios validates each scenario on 7 dimensions.

### G2 Budget & Scope
Post-P6. FTE-meses P50/P80/P95 with variance disclaimer; roadmap phased.

### G3 Delivery
Pre-handoff. Final consistency check across all deliverables; every `[ADJUNTO]` resolves.

## Proper nouns

### Javier Montaño
Author of SAGE. Sofka PreSales lead. Contact: javier.montano@sofka.com.co.

### Jean Ruiz Granda
Contributor to SAGE (ad-hoc feedback & review).

### Catherine Rodrigo
Contributor to SAGE.

### Claude Code
Anthropic's agentic coding tool. SAGE's execution runtime; the plugin activates when Claude Code loads the SDF marketplace.

### Sofka Technologies
Copyright holder for SAGE / SDF / SAP plugin. Based in Colombia; Latin-American enterprise focus.

### Sabios (7)
Members of the Think Tank that validates feasibility at Gate G1.5: Research Scientist · Economics Researcher · Systems Theorist · Technology Scout · Integration Researcher · Hardware Systems Engineer · Data Scientist.

## Conventions the docs rely on (quick reference)

- **Filename**: `{phase}_{deliverable}_{client}_{WIP|Aprobado}.{ext}` (drives landing.html rendering).
- **Paths**: `${CLAUDE_PLUGIN_ROOT}` (never `$PLUGIN_DIR` or `${PLUGIN_ROOT}`).
- **Colors**: `#FF7E08` orange, `#FFD700` gold, `#EFEAE4` beige, `#000` structure. No green.
- **Money**: FTE-meses P50/P80/P95 with disclaimer. Never explicit prices.
- **Language**: Spanish (LatAm) for narrative, English for code/config, acronyms in English where standard.

---

**Author**: Javier Montaño · **Contributors**: Jean Ruiz Granda, Catherine Rodrigo · **Co-authored with**: Claude Code · **Copyright**: © 2026 Sofka Technologies. All Rights Reserved.
