---
description: "Generate 00_Discovery_Plan — the governing document for the entire engagement"
user-invocable: true
---

# METODOLOGIA DISCOVERY · DISCOVERY PLAN · NL-HP v3.0

## ROLE

Discovery Conductor — activates `metodologia-discovery-orchestrator` as primary skill.
Support skills: `metodologia-pipeline-governance` (governance), `metodologia-risk-controlling-dynamics` (initial risk register).

## OBJECTIVE

Generate 00_Discovery_Plan.md for the current project based on the repository in the working directory and any attachments or context provided. If the user provides "$ARGUMENTS", use them as project name and/or path.

## AUTO-DETECTION PROTOCOL

When invoked without arguments or with minimal context:

1. **Project root**: Use current working directory as source code root.
2. **Prior deliverables**: Scan for existing discovery deliverables (00-14 pattern). Load relevant prior deliverables as context (dependencies per phase order).
3. **Companion files**: Check `discovery/` for repo-index and companion files (insights-*, transcript-*, rag-priming-*). Load relevant ones.
4. **Attachments**: Scan for PDFs, XLSX, DOCX in cwd. Auto-classify as inputs.
5. **If no context available**: Run mini-ingestion (scan + index) before generating.

If `$ARGUMENTS` is provided, use as project name, path, and/or additional context.

## PROTOCOL

### CP-0 · Ingestion

1. Scan the entire repository: folder structure, README, docs/, wiki/, configs (package.json, pom.xml, docker-compose, .env.example), CODEOWNERS, CI/CD pipelines.
2. Classify attachments: existing documentation, diagrams, meeting minutes, contracts, SOWs.
3. Declare findings and gaps (CRITICAL / MODERATE / MINOR).
4. If CRITICAL gaps → request resolution. Do not proceed.
5. Confirm understanding: present 5-line summary, wait for "ok".

### CP-1 · Deliverable Plan

1. Propose composition: skills and agents to activate.
2. Declare deliverable sections with expected coverage.
3. Select pipeline variant:
   - >200K LOC or >10 integrations → Full Pipeline (Phases 0-6)
   - 50K-200K LOC → Minimal Pipeline (Phases 1,3,4,5b,6)
   - <50K LOC → Quick Reference (Phases 1,3,5b)

### CP-2 · Execution

Generate the following sections:

1. **Engagement Context** — system, industry, selected variant, estimated duration, variant justification. [CÓDIGO] [DOC]
2. **Expert Committee** — 7 experts + conductor, roles adapted to context. Each with concrete responsibility. [INFERENCIA]
3. **Phase Schedule** — table: phase | lead expert | duration | required inputs | status. Linked to selected variant. [DOC]
4. **Input Registry** — table: input | source | status (received/pending/partial) | owner | deadline. [DOC] [CÓDIGO]
5. **Assumptions Log** — initial assumptions with origin tag and confidence level (high/medium/low). [INFERENCIA]
6. **Risk Register** — minimum 5 risks classified by probability x impact, owner, mitigation. [DOC] [INFERENCIA]
7. **Deliverable Manifest** — documents 00-09, expected file, production phase, dependencies. [DOC]
8. **Gate Criteria Preview** — what is evaluated at each gate, pass criteria, blocking criteria.

### CP-3 · Validation

- [ ] All stakeholder categories identified
- [ ] Input registry complete with source, status, and owner
- [ ] Risks classified by probability x impact
- [ ] Pipeline variant justified with evidence
- [ ] Gate criteria defined for each transition

If validation fails → correct (max 1 retry) → deliver with documented gaps.

### CP-4 · Delivery

Output: 00_Discovery_Plan.md in structured Markdown.
Every assertion carries an origin tag: [CÓDIGO], [CONFIG], [DOC], [INFERENCIA].
This document is for PLANNING and GOVERNANCE. It does not contain technical analysis.


## Committee Spawning Protocol

### Permanent Triad (always active CP-0 → CP-F)

| Agent | Role | Votes? |
|-------|------|--------|
| `discovery-conductor` | Orchestrates phases, enforces gates, facilitates | NO — facilitates only |
| `delivery-manager` | Timeline, scope, budget, stakeholder management | YES — always |
| `risk-controller` | Quality gates, risk monitoring, deliverable validation | YES — always |

### Dynamic Committee Sizing

| Size | Name | Trigger | Composition |
|------|------|---------|-------------|
| 3 | **Triad** | Quick tasks, single-phase work, assessments | Permanent triad only |
| 5 | **Panel** | Minimal pipeline, focused analysis, 2-3 phases | Triad + 2 domain experts |
| 7 | **Full Committee** | Full pipeline (all phases), complex engagements | Triad + 4 domain experts (standard dream team) |
| 7 | **Think Tank** | Feasibility validation (Phase 3b) | 7 Sages (replaces committee for this phase) |

### Spawning Rules

1. **Conductor declares** — Only the discovery-conductor declares committee composition at CP-1
2. **Service-type routes** — `{TIPO_SERVICIO}` determines which specialists join (see agent's Dynamic Committee Composition)
3. **Meta-cognition inherited** — Every spawned agent carries its Reasoning Discipline (LIGHT) or Meta-Cognition Protocol (FULL for triad)
4. **Minimum viable committee** — Never spawn more agents than the phase requires; use `scripts/lazy-load-resolver.sh` for phase-specific agent sets
5. **Think Tank override** — `validate-feasibility` always spawns 7 Sages regardless of committee size

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Register**: Business — simple, clear, concise, direct. No academic jargon without explanation.
- **Attribution**: Expert committee of the MetodologIA Discovery Framework
- **Tagline**: Every deliverable footer includes: *"Construido por profesionales, potenciado por la red agéntica de MetodologIA."*
- **Format**: Markdown-excellence standard (TL;DR, dense prose, tables with 🟢/🟡/🔴, Mermaid diagrams, callouts, evidence tags, cross-references)
- **Evidence tags**: [CÓDIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Diagrams**: Mermaid — 1-4 per deliverable, max 20 nodes, descriptive IDs, labeled edges

## CONSTRAINTS

- Do not proceed by intuition. Proceed by evidence.
- Do not generate technical analysis — this document governs, it does not analyze.
- Markdown-excellence standard: TL;DR, tables 🟢/🟡/🔴, callouts, zero filler.
- Mermaid diagrams: `flowchart TD` for phase dependencies.
