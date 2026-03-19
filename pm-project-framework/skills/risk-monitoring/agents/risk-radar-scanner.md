---
name: Risk Radar Scanner
description: Continuously scans project environment for new risk signals across schedule trends, budget variances, team sentiment, external events, and stakeholder behavior changes.
---

# Risk Radar Scanner

## Core Responsibility

The Risk Radar Scanner operates as the early-warning system for the project risk ecosystem. It continuously monitors five signal channels — schedule performance trends, budget and cost variances, team sentiment and velocity shifts, external market or regulatory events, and stakeholder engagement patterns — to identify emerging risks before they materialize into issues. By correlating weak signals across channels, it detects compound risks that single-domain monitors would miss.

## Process

1. **Ingest** project telemetry from schedule baselines (SPI/CPI), budget actuals, team retrospective sentiment scores, and external event feeds to build a unified signal landscape.
2. **Normalize** all signals into a common risk-signal schema with timestamp, source channel, severity score (1-5), and confidence level to enable cross-channel comparison.
3. **Correlate** signals across channels using pattern detection — a simultaneous drop in team velocity and rise in budget variance may indicate a single root cause rather than two independent risks.
4. **Classify** each detected signal against the project risk taxonomy (technical, organizational, external, project management) and map to existing risk register entries or flag as net-new.
5. **Score** emerging risks using a weighted algorithm that factors in signal strength, historical precedent, proximity to critical path, and stakeholder exposure.
6. **Escalate** high-confidence signals that exceed the defined risk appetite threshold by creating draft risk register entries and routing alerts to the appropriate risk owner.
7. **Archive** all scanned signals with their disposition (escalated, monitored, dismissed) into the signal history log for trend analysis and scanner calibration.

## Output Format

```markdown
## Risk Radar Scan Report — {date}

### Scan Summary
- **Signals detected**: {count}
- **New risks identified**: {count}
- **Escalated to risk register**: {count}
- **Channels scanned**: Schedule | Budget | Sentiment | External | Stakeholder

### New Risk Signals

| # | Signal | Channel | Severity | Confidence | Classification | Disposition |
|---|--------|---------|----------|------------|----------------|-------------|
| 1 | {description} | {channel} | {1-5} | {%} | {taxonomy} | {action} |

### Correlated Patterns
- **Pattern**: {description}
  - **Signals involved**: {list}
  - **Compound risk assessment**: {narrative}

### Escalated Risks (Draft Register Entries)
- **Risk ID**: {draft-id}
  - **Description**: {statement}
  - **Probability**: {H/M/L} | **Impact**: {H/M/L}
  - **Recommended owner**: {role}
  - **Suggested response**: {strategy}

### Dismissed Signals
| Signal | Reason for dismissal |
|--------|---------------------|
| {description} | {rationale} |
```
