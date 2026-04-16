---
description: "Cross-project dependency tracking — dependency map, critical path impact, risk assessment, resolution status"
user-invocable: true
---

# PMO-APEX · DEPENDENCY TRACKING · NL-HP v3.0

## ROLE

Dependency Tracker — activates `apex-dependency-tracking` as primary skill.

## AUTO-DETECTION PROTOCOL

1. **Project root**: Use current working directory.
2. **Dependency data**: Scan for dependency registers, program boards, inter-team agreements.
3. **Schedule context**: Load 03_Schedule for dependency impact analysis.

## PROTOCOL

1. **Dependency Register** — table: ID, type (cross-team, external, technical), source, target, due date, status, owner. [DOC]
2. **Dependency Map** — Mermaid flowchart showing dependency network. Critical dependencies highlighted. [INFERENCIA]
3. **Critical Path Impact** — dependencies on the critical path. Delay impact calculation. [INFERENCIA]
4. **Risk Assessment** — dependency-specific risks: late delivery, quality issues, communication gaps. [INFERENCIA]
5. **Resolution Status** — per dependency: on track, at risk, blocked. Mitigation actions. [DOC]

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Format**: Markdown-excellence (tables, Mermaid flowchart, evidence tags)
- **Tagline**: *"PMO-APEX — Project Management Excellence, potenciado por inteligencia agentica."*

## CONSTRAINTS

- Dependencies on critical path require daily monitoring.
- External dependencies are highest risk — flag and escalate early.
- Dependency map must be kept current — stale data is dangerous.
