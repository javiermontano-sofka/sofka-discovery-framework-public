---
name: priming-rag-risk-management
description: >
  RAG priming knowledge: Risk management — identification, qualitative/quantitative analysis, response strategies, monitoring
type: priming-rag
domain: project-management
---

# Risk Management — Core Knowledge Primer

> **Propósito RAG**: Este documento provee conocimiento de dominio para enriquecer el contexto del agente durante sesiones de gerencia de proyectos. No es un entregable — es material de referencia interno.

## Risk Management Process Overview

```
Plan Risk Management → Identify Risks → Qualitative Analysis → Quantitative Analysis
        ↑                                                              ↓
        └──────────── Monitor & Control ←── Implement Responses ←── Plan Responses
```

- Risk management is iterative, not a one-time activity
- Risk appetite, tolerance, and threshold set organizational boundaries
- Both threats (negative risks) and opportunities (positive risks) are managed

## Risk Identification

### Identification Techniques

| Technique | Description | Best For |
|-----------|------------|----------|
| Brainstorming | Open group session, no filtering | Initial identification, team engagement |
| Delphi Technique | Anonymous expert rounds to reach consensus | Avoiding groupthink, geographically dispersed experts |
| SWOT Analysis | Strengths, Weaknesses, Opportunities, Threats | Strategic-level risk identification |
| Assumption Analysis | Challenge every project assumption | Uncovering hidden risks in planning |
| Checklists | Historical risk lists from past projects | Ensuring no known categories missed |
| Root Cause Analysis | Identify underlying causes, not symptoms | Grouping related risks |
| Expert Interviews | One-on-one with SMEs | Deep domain-specific risks |
| PESTLE | Political, Economic, Social, Tech, Legal, Environmental | External risk scanning |
| Pre-mortem | Imagine the project has failed — what caused it? | Overcoming optimism bias |
| Ishikawa (Fishbone) | Trace causes by category | Understanding cause-effect relationships |

### Risk Breakdown Structure (RBS)

```
Project Risk
├── Technical
│   ├── Requirements (unclear, volatile, incomplete)
│   ├── Technology (unproven, complexity, integration)
│   ├── Performance (throughput, scalability, reliability)
│   └── Quality (defects, testing gaps, standards)
├── External
│   ├── Market (competition, demand shifts, pricing)
│   ├── Regulatory (compliance, new legislation)
│   ├── Suppliers (availability, performance, lock-in)
│   └── Environmental (weather, natural events, pandemic)
├── Organizational
│   ├── Resources (availability, skills, turnover)
│   ├── Funding (budget cuts, cash flow, approval delays)
│   ├── Dependencies (other projects, operations)
│   └── Priorities (competing initiatives, strategic shifts)
└── Project Management
    ├── Estimation (effort, duration, cost accuracy)
    ├── Planning (scope, schedule, integration)
    ├── Communication (stakeholders, team, sponsors)
    └── Control (change management, reporting, governance)
```

### Risk Statement Format (Cause-Event-Effect)
```
Because of [CAUSE/CONDITION],
there is a risk that [RISK EVENT] may occur,
which would lead to [IMPACT/CONSEQUENCE].
```

### Risk Register Fields
- Risk ID, Title, Description (cause-event-effect)
- Category (from RBS), Date identified, Owner, Actionee
- Probability, Impact, Risk Score, Priority ranking
- Response strategy, Response actions, Status
- Triggers (early warning indicators), Proximity (when might it occur)
- Secondary risks, Residual risk level

## Qualitative Risk Analysis

### Probability and Impact (P x I) Matrix — 5x5

| | Very Low (0.1) | Low (0.3) | Medium (0.5) | High (0.7) | Very High (0.9) |
|---|---|---|---|---|---|
| **Very High (0.9)** | 0.09 | 0.27 | 0.45 | 0.63 | 0.81 |
| **High (0.7)** | 0.07 | 0.21 | 0.35 | 0.49 | 0.63 |
| **Medium (0.5)** | 0.05 | 0.15 | 0.25 | 0.35 | 0.45 |
| **Low (0.3)** | 0.03 | 0.09 | 0.15 | 0.21 | 0.27 |
| **Very Low (0.1)** | 0.01 | 0.03 | 0.05 | 0.07 | 0.09 |

### Risk Score Thresholds

| Score Range | Priority | Action |
|-------------|----------|--------|
| 0.50 - 1.00 | Critical | Immediate response plan, escalate to sponsor |
| 0.25 - 0.49 | High | Response plan required, active monitoring |
| 0.10 - 0.24 | Medium | Response plan recommended, periodic review |
| 0.01 - 0.09 | Low | Accept or watchlist, review at milestones |

### Impact Scales

| Level | Schedule | Cost | Scope | Quality |
|-------|----------|------|-------|---------|
| Very Low | <1 week slip | <5% overrun | Barely noticeable | Marginal impact |
| Low | 1-2 weeks | 5-10% | Minor areas affected | Minor degradation |
| Medium | 2-4 weeks | 10-20% | Major areas affected | Requires sponsor approval |
| High | 1-3 months | 20-40% | Unacceptable to sponsor | Very significant |
| Very High | >3 months | >40% | End item effectively useless | Deliverable unusable |

### Risk Urgency Assessment
- **Proximity**: when might the risk occur? (imminent, near-term, long-term)
- **Velocity**: how quickly will impact be felt once it occurs?
- **Detectability**: how much warning will we have?
- Combine urgency with P x I for comprehensive prioritization

## Quantitative Risk Analysis

### When to Use Quantitative Analysis
- High-stakes projects requiring cost/schedule confidence intervals
- Regulatory or contractual requirements for probabilistic analysis
- Need to determine contingency reserve amounts
- Multiple risks with interdependencies

### Monte Carlo Simulation

| Aspect | Details |
|--------|---------|
| Purpose | Generate probability distribution of project outcomes (cost, schedule) |
| Inputs | Three-point estimates (optimistic, most likely, pessimistic) per activity |
| Process | Run 1,000-10,000 iterations with random sampling from distributions |
| Outputs | Probability distribution, confidence intervals, sensitivity ranking |
| Key output | P50, P75, P80, P90 values for cost/schedule |

#### Distribution Types

| Distribution | Use When |
|-------------|----------|
| Triangular | Simple, 3 estimates available |
| PERT/Beta | Weighted toward most likely (most common) |
| Normal | Symmetric, well-understood variables |
| Uniform | Equal probability across range |
| Lognormal | Positive skew, cost items |

#### PERT Three-Point Estimate
```
Expected = (Optimistic + 4 x Most_Likely + Pessimistic) / 6
Std Dev  = (Pessimistic - Optimistic) / 6
```

#### Confidence Level Selection

| Level | Use For |
|-------|---------|
| P50 | 50% chance — baseline plan (aggressive) |
| P75 | 75% chance — moderate risk appetite |
| P80 | 80% chance — common organizational standard |
| P90 | 90% chance — conservative, risk-averse |

#### Contingency Calculation
```
Contingency Reserve = P(selected) - P50

Example: P80 cost = $1.2M, P50 cost = $1.0M
Contingency = $200K (20% of baseline)
```

### Decision Tree Analysis

```
Decision Node [□] → choose between options
Chance Node   [○] → probability of outcomes
End Node      [△] → payoff value

EMV = Σ (Probability x Payoff) for each branch
```

#### Example
```
□ Build vs. Buy
├── Build
│   ├── ○ Success (0.7) → $500K value
│   └── ○ Failure (0.3) → -$200K value
│   EMV(Build) = 0.7(500) + 0.3(-200) = $290K
└── Buy
    ├── ○ Good vendor (0.8) → $300K value
    └── ○ Bad vendor (0.2) → $50K value
    EMV(Buy) = 0.8(300) + 0.2(50) = $250K
→ Build has higher EMV ($290K > $250K)
```

### Sensitivity Analysis (Tornado Diagram)
- Ranks variables by impact on project outcome
- Wide bars = high sensitivity (focus area)
- Narrow bars = low sensitivity (less concern)
- Use to prioritize risk response budget allocation

### Expected Monetary Value (EMV)
```
EMV = Probability x Impact (monetary)
Threat EMV  → negative (cost)
Opportunity EMV → positive (savings/revenue)
Total Project EMV = Σ all individual risk EMVs
```

## Response Strategies

### Threat Response Strategies

| Strategy | Description | When to Use |
|----------|------------|------------|
| Avoid | Eliminate the threat by changing plan | High P x I; alternative exists |
| Mitigate | Reduce probability or impact | P or I can be meaningfully reduced |
| Transfer | Shift impact to third party (insurance, contract) | Financial impact transferable |
| Accept (Active) | Prepare contingency reserve/plan | Low priority or response cost > impact |
| Accept (Passive) | Acknowledge, no proactive action | Very low P x I |
| Escalate | Move to higher authority | Exceeds project authority or scope |

### Opportunity Response Strategies

| Strategy | Description | When to Use |
|----------|------------|------------|
| Exploit | Ensure opportunity is realized | High-value, within reach |
| Enhance | Increase probability or positive impact | Can amplify the benefit |
| Share | Transfer to party best positioned | Partner can better capture value |
| Accept | Acknowledge but don't actively pursue | Benefit welcome but not worth investment |
| Escalate | Move to program/portfolio level | Exceeds project scope |

### Secondary and Residual Risks
- **Secondary risk**: new risk created by implementing a response
- **Residual risk**: risk remaining after response is implemented
- Both must be documented and monitored
- Residual risk should be within organizational risk tolerance

## Risk Monitoring and Control

### Monitoring Activities

| Activity | Frequency | Purpose |
|----------|-----------|---------|
| Risk register review | Weekly/bi-weekly | Update status, reassess, identify new risks |
| Trigger monitoring | Continuous | Watch for early warning indicators |
| Risk audit | Per phase/stage gate | Evaluate risk process effectiveness |
| Variance analysis | Per reporting period | Compare actual vs. planned risk exposure |
| Reserve analysis | Monthly | Assess remaining contingency adequacy |

### Risk Metrics and KPIs

| Metric | Calculation | Target |
|--------|------------|--------|
| Risk Exposure | Σ (P x I) for all active risks | Decreasing trend |
| Response Effectiveness | Risks mitigated / Responses implemented | >80% |
| Contingency Burn Rate | Used / Allocated | <75% at midpoint |
| Risk Velocity | New risks / period | Stable or decreasing |
| Top Risk Age | Days since identification | Decreasing (being resolved) |

### Risk Reporting Elements
- Top 10 risks with status and trend arrows
- Risk heat map (P x I matrix with current distribution)
- Risk trend chart (new, closed, active over time)
- Contingency status (remaining vs. planned)
- Escalated risks requiring management decision
- Watch list (low-priority risks that could escalate)

## Risk Appetite Framework

| Appetite | Description | Typical Response |
|----------|------------|-----------------|
| Risk Averse | Avoid uncertainty; prefer known outcomes | Transfer, avoid, heavy contingency, P90 estimates |
| Risk Neutral | Balance risk and return | Mitigate, optimize, moderate contingency, P75-P80 |
| Risk Seeking | Pursue higher returns despite uncertainty | Accept, exploit opportunities, lean contingency, P50 |

### Tolerance vs. Threshold
- **Tolerance**: degree of acceptable variation around objectives
- **Threshold**: specific trigger point for escalation or action
- Example: tolerance = +/-10% schedule; threshold = if SPI < 0.85, escalate

## Quick Reference

| Phase | Key Activities | Key Outputs |
|-------|---------------|-------------|
| Plan | Define approach, roles, categories, thresholds | Risk management plan |
| Identify | Brainstorm, checklists, RBS, interviews, pre-mortem | Risk register |
| Qualitative | P x I matrix, urgency, categorization | Prioritized risk list |
| Quantitative | Monte Carlo, decision trees, sensitivity, EMV | Confidence intervals, contingency |
| Response | Select strategies, assign owners, plan actions | Updated register, reserves |
| Monitor | Reviews, audits, trigger watch, reserve analysis | Status reports, change requests |

---
*PMO-APEX v1.0 — Agentic Project Excellence*
