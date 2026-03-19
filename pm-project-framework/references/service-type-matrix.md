# Service Type Matrix — TIPO_PROYECTO Routing

## Auto-Detection Signals

| Tipo | Señales Primarias | Señales Secundarias | Estimación |
|------|-------------------|---------------------|------------|
| **Agile** | "sprint", "scrum", "backlog", "velocity" | "user story", "retrospective", "standup" | Story points |
| **Kanban** | "kanban", "WIP limit", "cycle time" | "flow", "pull system", "lead time" | Cycle time |
| **SAFe** | "SAFe", "PI planning", "ART" | "value stream", "WSJF", "enabler" | PI velocity |
| **Waterfall** | "PMBOK", "PRINCE2", "Gantt" | "stage gate", "WBS", "critical path" | FTE-meses |
| **Hybrid** | "hybrid", "agile-waterfall" | Mixed signals from 2+ types | Mixto |
| **PMO** | "PMO", "governance model" | "project management office", "portfolio" | FTE-meses |
| **Portfolio** | "portfolio", "program", "multi-project" | "PPM", "strategic alignment" | Portfolio units |
| **Transformation** | "transformation", "modernization" | "enterprise-wide", "change management" | Program increments |
| **Recovery** | "rescue", "troubled", "red project" | "turnaround", "audit", "health check" | Sprints to green |
| **Multi-Method** | 2+ señales simultáneas | Ambiguous signals | Mixto |

## Agent Activation by TIPO_PROYECTO

| Agent | Agile | Kanban | SAFe | Waterfall | Hybrid | PMO | Portfolio | Transform | Recovery |
|-------|:-----:|:------:|:----:|:---------:|:------:|:---:|:---------:|:---------:|:--------:|
| project-conductor | ● | ● | ● | ● | ● | ● | ● | ● | ● |
| delivery-lead | ● | ● | ● | ● | ● | ● | ● | ● | ● |
| risk-manager | ● | ● | ● | ● | ● | ● | ● | ● | ● |
| scrum-master | ● | | ● | | ● | | | | |
| kanban-coach | | ● | | | ● | | | | |
| safe-consultant | | | ● | | | | | | |
| pmbok-specialist | | | | ● | ● | ● | | | |
| prince2-practitioner | | | | ● | | | | | |
| agile-coach | ● | ● | ● | | ● | | | ● | |
| pmo-architect | | | | | | ● | ● | | |
| portfolio-analyst | | | | | | | ● | | |

## Skill Routing by TIPO_PROYECTO

| Skill Domain | Agile | Kanban | SAFe | Waterfall | Hybrid |
|-------------|:-----:|:------:|:----:|:---------:|:------:|
| scrum-framework | ● | | ● | | ● |
| kanban-system | | ● | ● | | ● |
| safe-framework | | | ● | | |
| waterfall-framework | | | | ● | ● |
| ceremony-design | ● | | ● | | ● |
| definition-of-done | ● | | ● | | ● |
| earned-value-analysis | | | ● | ● | ● |
| risk-register | ● | ● | ● | ● | ● |
| schedule-baseline | ● | | ● | ● | ● |
| scope-wbs | | | | ● | ● |

## Estimation Units by TIPO_PROYECTO

| Tipo | Unidad Primaria | Unidad Secundaria |
|------|----------------|-------------------|
| Agile | Story points | Velocity (SP/sprint) |
| Kanban | Cycle time (days) | Throughput (items/week) |
| SAFe | PI velocity (SP) | Feature cycle time |
| Waterfall | FTE-meses | Calendar days |
| Hybrid | Mixto (SP + FTE) | Blended velocity |
| PMO | FTE-meses | Projects/quarter |
| Portfolio | Portfolio value units | Investment ROI |
| Transformation | Program increments | Change adoption % |
| Recovery | Sprints to green | Risk burn-down rate |

## Conflict Resolution
When multiple types are detected:
1. Explicit `/pm:` parameter wins
2. `project/session-state.json` tipo_proyecto field
3. Strongest signal count
4. Ask user to disambiguate

---
*PMO-APEX v1.0 — Service Type Routing Matrix*
