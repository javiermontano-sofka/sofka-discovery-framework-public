---
name: Risk Report Generator
description: Produces periodic risk reports including heat map updates, top-10 risks, newly identified risks, triggered risks, closed risks, and risk reserve burn-down.
---

# Risk Report Generator

## Core Responsibility

The Risk Report Generator consolidates all risk monitoring data into structured, stakeholder-ready reports on a defined cadence (weekly, bi-weekly, or per-sprint). It assembles the current risk heat map, ranks the top-10 risks by exposure score, highlights newly identified and recently closed risks, documents any triggered risks and their response status, and tracks risk reserve consumption against the planned burn-down curve. The output is formatted for three audiences: executive summary for sponsors, detailed register for the PM, and action-focused view for risk owners.

## Process

1. **Aggregate** current risk register data including all active risks with their latest probability, impact, exposure scores, ownership, status, and response strategy effectiveness ratings.
2. **Build** the risk heat map by plotting each active risk on the probability-impact matrix, color-coding by category, and annotating movement arrows for risks that shifted since the last report.
3. **Rank** risks by composite exposure score (probability x impact x proximity x detectability) to produce the top-10 list with trend indicators showing position changes from the previous period.
4. **Categorize** period activity into four buckets: newly identified risks (with source attribution), triggered risks (with contingency activation status), risks under active mitigation (with progress percentage), and closed risks (with resolution summary).
5. **Calculate** risk reserve burn-down by comparing actual reserve consumption against the planned spend curve, flagging any period where consumption exceeds plan by more than 15%.
6. **Compose** three report tiers: executive dashboard (1 page, visual-heavy), management detail (full register with narrative), and owner action list (filtered by assignee with deadlines).
7. **Validate** report completeness against the reporting checklist — every active risk must appear, all triggered risks must show response status, and reserve figures must reconcile with finance data.

## Output Format

```markdown
## Risk Monitoring Report — {period} ({date range})

### Executive Dashboard

**Risk Posture**: {Green | Yellow | Red}
**Active Risks**: {count} | **New**: {count} | **Closed**: {count} | **Triggered**: {count}
**Risk Reserve**: {consumed}% consumed | {remaining}% remaining

### Risk Heat Map

|  | Negligible | Minor | Moderate | Major | Catastrophic |
|--|-----------|-------|----------|-------|-------------|
| **Almost Certain** | {IDs} | {IDs} | {IDs} | {IDs} | {IDs} |
| **Likely** | {IDs} | {IDs} | {IDs} | {IDs} | {IDs} |
| **Possible** | {IDs} | {IDs} | {IDs} | {IDs} | {IDs} |
| **Unlikely** | {IDs} | {IDs} | {IDs} | {IDs} | {IDs} |
| **Rare** | {IDs} | {IDs} | {IDs} | {IDs} | {IDs} |

### Top 10 Risks

| Rank | Chg | Risk ID | Description | P | I | Exposure | Owner | Status | Response |
|------|-----|---------|-------------|---|---|----------|-------|--------|----------|
| 1 | {arrow} | {id} | {summary} | {H/M/L} | {H/M/L} | {score} | {name} | {status} | {strategy} |

### Newly Identified Risks
| Risk ID | Description | Source | P | I | Owner | Response Plan |
|---------|-------------|--------|---|---|-------|---------------|
| {id} | {summary} | {source} | {H/M/L} | {H/M/L} | {name} | {strategy} |

### Triggered Risks
| Risk ID | Description | Trigger Date | Contingency | Response Status | Impact Realized |
|---------|-------------|-------------|-------------|-----------------|-----------------|
| {id} | {summary} | {date} | {plan} | {status} | {assessment} |

### Closed Risks
| Risk ID | Description | Resolution | Days Open | Lessons Learned |
|---------|-------------|------------|-----------|-----------------|
| {id} | {summary} | {how closed} | {n} | {key takeaway} |

### Risk Reserve Burn-Down

| Period | Planned Spend | Actual Spend | Cumulative | Remaining | Variance |
|--------|--------------|-------------|------------|-----------|----------|
| {period} | {amount} | {amount} | {amount} | {amount} | {+/-} |

**Forecast**: Reserve {sufficient | at risk | insufficient} for remaining project duration.

### Actions Required This Period
| # | Action | Risk ID | Owner | Deadline | Priority |
|---|--------|---------|-------|----------|----------|
| 1 | {action} | {id} | {name} | {date} | {H/M/L} |
```
