# Body of Knowledge — Jira Configuration

## 1. Foundations of Jira Configuration for PM

Jira configuration for project management extends beyond basic issue tracking to encompass workflow design, field schemes, automation rules, and reporting that align with the chosen methodology (agile, hybrid, or predictive). [DOC]

### 1.1 Configuration Layers

| Layer | Components | Governance Level |
|-------|-----------|-----------------|
| Global | Issue types, field configs, permission schemes | Jira Admin |
| Project | Workflows, boards, filters, dashboards | PM + Admin |
| Team | Sprint config, columns, WIP limits | Team Lead |
| Personal | Filters, notifications, dashboard gadgets | Individual |

### 1.2 Issue Type Hierarchy

1. **Initiative** — Strategic objective spanning multiple epics. [DOC]
2. **Epic** — Large body of work decomposed into stories. [DOC]
3. **Story** — User-facing feature or requirement. [DOC]
4. **Task** — Technical or operational work item. [DOC]
5. **Sub-task** — Decomposition of story/task for sprint planning. [DOC]
6. **Bug** — Defect requiring resolution. [DOC]
7. **Risk/Issue/Decision** — RAID tracking items. [PLAN]

## 2. Workflow Design Patterns

### 2.1 Standard Agile Workflow

To Do → In Progress → In Review → Done

### 2.2 Hybrid Workflow with Gates

Backlog → Ready → In Progress → Review → Gate Approval → Done

### 2.3 Kanban Flow

Backlog → Selected → In Progress (WIP: 3) → Testing → Done

## 3. Board Configuration

| Board Type | Best For | Key Config |
|-----------|---------|------------|
| Scrum Board | Sprint-based teams | Sprint planning, burndown |
| Kanban Board | Flow-based teams | WIP limits, cumulative flow |
| Next-Gen Board | Simple projects | Minimal config needed |
| Portfolio Board | Multi-project view | Cross-project tracking |

## 4. Field Configuration

| Field | Purpose | Required Level |
|-------|---------|----------------|
| Story Points | Estimation | Story/Task |
| Priority | Triage | All |
| Component | Module tracking | Story/Bug |
| Label | Cross-cutting concerns | All |
| Sprint | Iteration assignment | Story/Task |
| Fix Version | Release tracking | Story/Bug |
| Due Date | Deadline tracking | Task/Sub-task |

## 5. Automation Rules

| Trigger | Condition | Action | Use Case |
|---------|-----------|--------|----------|
| Issue created | Type = Bug | Set priority based on severity | Auto-triage |
| Status → Done | All sub-tasks done | Transition parent | Cascade completion |
| Sprint started | Unestimated stories | Comment warning | Quality gate |
| Due date approaching | 2 days before | Notify assignee | Deadline management |
| Issue idle > 5 days | Status = In Progress | Escalation comment | Bottleneck detection |

## 6. Reporting Configuration

| Report | Configuration | Audience |
|--------|-------------|----------|
| Burndown Chart | Sprint scope, story points | Team |
| Velocity Chart | Sprint history | PM/Scrum Master |
| Cumulative Flow | Board columns, date range | PM/Manager |
| Control Chart | Cycle time by issue type | Process improvement |
| Dashboard | Custom gadgets, filters | Stakeholders |

## 7. Common Pitfalls

1. **Over-Customization** — Too many custom fields reducing usability [INFERENCIA]
2. **Workflow Complexity** — 15+ statuses confusing team members
3. **No Governance** — Anyone can change configuration
4. **Permission Chaos** — Inconsistent access across projects
5. **Dashboard Bloat** — Too many gadgets, no actionable insights

## 8. References

1. Atlassian — *Jira Administration Guide* (2025)
2. Atlassian — *Jira Best Practices for Agile Teams* (2024)
3. SAFe — *Jira Alignment for SAFe* (scaledagileframework.com)
4. Atlassian — *Automation for Jira Documentation* (2025)
5. Radigan, D. — *Jira Agile Essentials* (Packt, 2015)

*PMO-APEX v1.0 — Body of Knowledge · Jira Configuration*
