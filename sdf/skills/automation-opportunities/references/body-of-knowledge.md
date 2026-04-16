# Body of Knowledge — Automation Opportunities

## 1. Foundations

Automation opportunity identification is the systematic process of discovering, evaluating, and prioritizing repetitive, rule-based, or error-prone project management tasks suitable for automation. [DOC]

### 1.1 Automation Candidate Criteria

| Criterion | Description | Weight |
|-----------|------------|--------|
| Frequency | Task occurs daily/weekly | High [METRIC] |
| Rule-based | Clear decision logic, low ambiguity | High [PLAN] |
| Error-prone | Manual execution causes defects | Medium [METRIC] |
| Time-consuming | >30 min per execution | Medium [SCHEDULE] |
| Stable process | Unlikely to change significantly | Medium [PLAN] |
| Data-driven | Inputs/outputs are structured | High [METRIC] |

### 1.2 Automation Categories in PM

| Category | Examples | Tools |
|----------|---------|-------|
| Reporting | Status reports, dashboards, burndown charts | Power BI, Grafana, custom scripts |
| Communication | Meeting scheduling, status notifications, reminders | Slack bots, Teams workflows, Zapier |
| Data Entry | Timesheet aggregation, metric collection, log updates | RPA, API integrations, webhooks |
| Quality Checks | Definition of Done verification, compliance scans | CI/CD gates, custom validators |
| Scheduling | Resource allocation, calendar management, sprint planning | AI schedulers, optimization algorithms |
| Documentation | Template generation, changelog updates, release notes | LLM-based generators, template engines |

## 2. Assessment Framework

### 2.1 Automation Feasibility Matrix

| Factor | Score 1 (Low) | Score 5 (High) |
|--------|--------------|----------------|
| Technical feasibility | Requires custom ML model | Simple API/script |
| Process maturity | Undocumented, ad-hoc | Well-documented SOP |
| ROI potential | <10 hours saved/quarter | >100 hours saved/quarter |
| Risk of automation | Customer-facing, high stakes | Internal, low stakes |
| Integration complexity | Legacy systems, no APIs | Modern stack, REST APIs |

### 2.2 ROI Calculation

```
Net Automation Value = (Hours Saved × Hourly Rate × Frequency) - (Development Cost + Maintenance Cost)
Payback Period = Development Cost / (Hours Saved × Hourly Rate × Frequency per month)
```

All calculations in FTE-months, never monetary values. [PLAN]

## 3. Implementation Approaches

| Approach | Effort | Scope | Best For |
|----------|--------|-------|----------|
| No-code (Zapier, Power Automate) | 0.1-0.5 sprints | Single workflow | Quick wins |
| Low-code (Retool, Appsmith) | 0.5-2 sprints | Department workflow | Medium complexity |
| Custom scripts (Python, Node.js) | 1-3 sprints | Cross-system integration | Technical teams |
| RPA (UiPath, Automation Anywhere) | 2-5 sprints | Legacy system interaction | Enterprise |
| AI/ML (LLM agents, predictive models) | 3-8 sprints | Decision support, generation | Advanced use cases |

## 4. Prioritization Methods

1. **Value vs. Effort Matrix** — Plot candidates on 2x2 grid [PLAN]
2. **RICE Scoring** — Reach, Impact, Confidence, Effort [METRIC]
3. **MoSCoW** — Must/Should/Could/Won't for automation backlog [SCHEDULE]
4. **Weighted Shortest Job First (WSJF)** — SAFe-aligned prioritization [PLAN]

## 5. Anti-Patterns

1. **Automating chaos** — Automating a broken process amplifies dysfunction [INFERENCIA]
2. **Over-engineering** — Building enterprise RPA for a 5-minute manual task [SUPUESTO]
3. **Ignoring maintenance** — Automated workflows degrade without ownership [METRIC]
4. **Automation bias** — Trusting automated output without human verification [STAKEHOLDER]

## 6. Standards & References

| Source | Document | Relevance |
|--------|----------|-----------|
| IEEE | IEEE 1012-2016 | Verification and validation for automation |
| ITIL 4 | Service Value System | Automation in service management |
| SAFe 6.0 | Continuous Delivery Pipeline | DevOps automation patterns |
| PMI | PM Digital Trends (2024) | PM automation landscape |

> *Principio Rector: "Automatizar es liberar al humano para pensar; no para dejar de pensar."*

*PMO-APEX v1.0 — Body of Knowledge · Automation Opportunities*
