# Body of Knowledge — Capacity Planning

## 1. Foundations

Capacity planning determines the team's ability to deliver work within a given timeframe by analyzing available resources, skills, and constraints against demand. [DOC]

### 1.1 Key Concepts

| Concept | Definition | Metric |
|---------|-----------|--------|
| Capacity | Total available work hours/points per period | FTE-hours or story points [METRIC] |
| Demand | Work requested for a period | Backlog size, committed scope [PLAN] |
| Utilization | Actual productive time / Available time | Percentage (target 70-85%) [METRIC] |
| Allocation | Assignment of capacity to projects/streams | FTE-months per project [SCHEDULE] |
| Buffer | Reserved capacity for unplanned work | 10-20% of total capacity [PLAN] |

### 1.2 Capacity Factors

| Factor | Impact | Calculation |
|--------|--------|-------------|
| Holidays/PTO | -10-15% of raw capacity | Calendar-based [SCHEDULE] |
| Meetings/ceremonies | -15-20% | Meeting audit [METRIC] |
| Context switching | -10-30% | Multi-project penalty [INFERENCIA] |
| Ramp-up time | -20-50% first 2 sprints | New team member adjustment [STAKEHOLDER] |
| Technical debt | -5-15% | Sprint allocation for maintenance [PLAN] |

## 2. Planning Methods

### 2.1 Velocity-Based (Agile)

- Use 3-sprint rolling average velocity as capacity proxy [METRIC]
- Adjust for known absences and team changes [SCHEDULE]
- Apply focus factor (typically 0.6-0.8) to raw capacity [INFERENCIA]

### 2.2 FTE-Based (Traditional)

- Calculate available FTE-hours per period [METRIC]
- Map required skills to available resources [STAKEHOLDER]
- Identify skill gaps and over-allocations [PLAN]

### 2.3 Flow-Based (Kanban)

- Use throughput (items/week) as capacity metric [METRIC]
- Apply Little's Law: Avg Cycle Time = WIP / Throughput [METRIC]
- Adjust WIP limits based on capacity constraints [PLAN]

## 3. Multi-Project Capacity

| Allocation Pattern | Context Switching Cost | Recommendation |
|-------------------|----------------------|----------------|
| 1 project (100%) | 0% | Ideal for complex work [PLAN] |
| 2 projects (50/50) | 20% | Acceptable if planned [SCHEDULE] |
| 3 projects (33 each) | 40% | Avoid if possible [INFERENCIA] |
| 4+ projects | 50%+ | Strongly discourage [STAKEHOLDER] |

## 4. Standards & References

| Source | Document | Relevance |
|--------|----------|-----------|
| PMI | PMBOK 7th Ed., Resource Performance Domain | Resource capacity management |
| SAFe 6.0 | PI Planning | Team capacity for PI |
| Kanban University | Kanban Guide | Flow-based capacity |
| Gerald Weinberg | Quality Software Management | Context switching research |

> *Principio Rector: "La capacidad no es un numero fijo; es una variable que depende de contexto, moral y enfoque."*

*PMO-APEX v1.0 — Body of Knowledge · Capacity Planning*
