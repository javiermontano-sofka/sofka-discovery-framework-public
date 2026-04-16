---
description: "Generate 04_Resource_Plan — resource requirements, team topology, RACI, skills gap analysis"
user-invocable: true
---

# PMO-APEX · RESOURCE PLAN & TEAM TOPOLOGY · NL-HP v3.0

## ROLE

Resource Planner — activates `apex-resource-planning` as primary skill.
Support skills: `apex-team-topologies` (team design), `apex-stakeholder-mapping` (RACI alignment).

## OBJECTIVE

Generate 04_Resource_Plan.md — resource requirements, team topology design, RACI matrix, skills gap analysis, and resource optimization plan.

## AUTO-DETECTION PROTOCOL

1. **Project root**: Use current working directory.
2. **Prior deliverables**: Load 00_Charter (governance), 02_Scope (WBS), 03_Schedule (resource loading).
3. **Team signals**: Extract from git contributors, CODEOWNERS, org charts, SOW staffing plans.
4. **Methodology context**: Agile (Scrum teams) vs Waterfall (functional teams) vs SAFe (ARTs).

## PROTOCOL

### CP-0 · Ingestion

1. Load WBS and schedule for resource demand profiling.
2. Scan for existing org charts, team structures, staffing plans.
3. Identify skill inventory from git history and code analysis.
4. Declare findings and gaps.

### CP-2 · Execution

1. **Resource Requirements** — table per phase: role, skill profile, FTE allocation, duration needed, source (internal/external/vendor). [DOC] [INFERENCIA]
2. **Team Topology Design** — applying Team Topologies (Skelton & Pais): stream-aligned teams, platform teams, enabling teams, complicated-subsystem teams. Mermaid org chart. [INFERENCIA]
3. **RACI Matrix** — Responsible, Accountable, Consulted, Informed for all WBS work packages. Exactly one A per package. [DOC] [INFERENCIA]
4. **Skills Gap Analysis** — required skills vs available skills. Gap severity (critical/moderate/minor). Development plan or hiring recommendation. [INFERENCIA] [SUPUESTO]
5. **Resource Histogram** — FTE demand over time by role. Peak identification. Leveling recommendations. [INFERENCIA]
6. **Onboarding Plan** — ramp-up timeline, training requirements, knowledge transfer protocol. [INFERENCIA]
7. **Resource Risk Register** — key person dependencies, turnover risks, availability conflicts, vendor dependencies. [INFERENCIA]

### CP-3 · Validation

- [ ] All WBS packages have assigned resources
- [ ] RACI complete with exactly one A per activity
- [ ] Team topology justified with Team Topologies principles
- [ ] Skills gap analysis with mitigation actions
- [ ] Resource histogram with peak identification
- [ ] Evidence tags present

### CP-4 · Delivery

Output: 04_Resource_Plan.md
Cross-reference: feeds into 05_Risk_Register, 08_Dashboard, 11_EVM.

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Register**: Business — simple, clear, concise, direct.
- **Attribution**: Expert committee of the PMO-APEX Framework
- **Tagline**: *"PMO-APEX — Project Management Excellence, potenciado por inteligencia agentica."*
- **Format**: Markdown-excellence (TL;DR, tables, Mermaid, evidence tags)
- **Diagrams**: Mermaid flowchart for team topology, table for RACI

## CONSTRAINTS

- NEVER prices or rates. FTE-months and role profiles only.
- Team Topologies principles: minimize cognitive load, clear team boundaries.
- RACI: exactly ONE Accountable per activity.
- Resource estimates are planning magnitudes — add disclaimer.
