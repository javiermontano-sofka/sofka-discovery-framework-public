# Body of Knowledge — Kanban System

## 1. Foundations of Kanban System Design

A Kanban system is a pull-based workflow management system that uses visual signals to control work flow through defined stages. It limits work in progress to optimize delivery predictability and throughput. [DOC]

### 1.1 Core Elements

| Element | Purpose | Design Decision |
|---------|---------|-----------------|
| Board | Visualize workflow | Columns map to process stages |
| Cards | Represent work items | Information density, card types |
| WIP Limits | Control flow | Per column, per person, or per swim lane |
| Pull Signals | Trigger work movement | Capacity-based or time-based |
| Policies | Define rules | Entry/exit criteria per column |
| Cadences | Feedback mechanisms | Daily, weekly, monthly reviews |

### 1.2 System Design Principles

1. **Visualize** — Make work and workflow visible to all stakeholders. [DOC]
2. **Limit WIP** — Constrain concurrent work to improve flow. [DOC]
3. **Manage Flow** — Monitor, measure, and optimize delivery flow. [METRIC]
4. **Make Policies Explicit** — Document and display process rules. [DOC]
5. **Feedback Loops** — Regular cadences for inspection and adaptation. [PLAN]
6. **Improve Collaboratively** — Use models and data to drive improvement. [INFERENCIA]

## 2. System Architecture

### 2.1 Board Design Patterns

| Pattern | Structure | Best For |
|---------|----------|---------|
| Simple Flow | To Do → Doing → Done | Small teams, simple work |
| Expanded Flow | Backlog → Analysis → Dev → Test → Deploy → Done | Software delivery |
| Discovery-Delivery | Discovery track ∥ Delivery track | Dual-track agile |
| Tiered | Strategic → Tactical → Operational | Portfolio Kanban |
| Class of Service | Expedite / Fixed Date / Standard / Intangible lanes | Mixed work types |

### 2.2 WIP Limit Strategies

| Strategy | Description | When to Use |
|----------|-------------|------------|
| Column WIP | Max items per column | Default approach |
| Personal WIP | Max items per person | Specialist teams |
| Swimlane WIP | Max items per type/class | Mixed work types |
| Total System WIP | Max items in entire system | Flow control |
| CONWIP | Constant WIP; new in only when old exits | Manufacturing origin |

## 3. Classes of Service

| Class | Policy | SLE Target | WIP Allocation |
|-------|--------|-----------|----------------|
| Expedite | Immediate start, bypass queue | ASAP | Max 1 at a time |
| Fixed Date | Must complete by specific date | Per commitment | Reserved capacity |
| Standard | FIFO within priority | 85th percentile | Majority of WIP |
| Intangible | Improvement and tech debt | Best effort | 10-20% capacity |

## 4. Cadence Design

| Cadence | Frequency | Purpose | Participants |
|---------|-----------|---------|-------------|
| Daily Standup | Daily | Flow focus, blocker resolution | Team |
| Replenishment | Weekly | Select new work from options | PO + Team Lead |
| Delivery Planning | Bi-weekly | Coordinate releases | Team + Stakeholders |
| Service Delivery Review | Monthly | Flow metrics review | Team + Management |
| Operations Review | Quarterly | Cross-team flow optimization | Leadership |
| Strategy Review | Quarterly | Strategic alignment | Executives |
| Risk Review | Monthly | Systemic risk assessment | Team + Management |

## 5. Metrics and Forecasting

| Metric | Formula | Forecasting Use |
|--------|---------|----------------|
| Lead Time | Request date to delivery date | Customer expectation |
| Cycle Time | Start date to completion date | Team performance |
| Throughput | Completed items per time unit | Capacity planning |
| WIP | Items in active work | Little's Law application |
| Flow Efficiency | Value-add time / total time | Process improvement |

## 6. Common Pitfalls

1. **No WIP Limits** — Board without limits is a wishboard, not Kanban [INFERENCIA]
2. **Ignoring Blocked Items** — Letting blockers age without action
3. **Push not Pull** — Managers assigning work instead of team pulling
4. **Column Overload** — Too many or too few columns
5. **No Cadences** — Board exists but no review ceremonies

## 7. Academic References

1. Anderson, D. — *Kanban: Successful Evolutionary Change for Your Technology Business* (2010)
2. Burrows, M. — *Kanban from the Inside* (2014)
3. Leopold, K. — *Practical Kanban* (2017)
4. Vacanti, D. — *Actionable Agile Metrics for Predictability* (2015)
5. Kanban University — *The Kanban Guide* (2020)

*PMO-APEX v1.0 — Body of Knowledge · Kanban System*
