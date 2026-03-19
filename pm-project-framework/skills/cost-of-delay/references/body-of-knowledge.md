# Cost of Delay — Body of Knowledge

## Definition

Cost of Delay (CoD) quantifies the economic impact of deferring a feature, project, or decision by expressing value erosion per unit of time. It transforms priority debates from opinion-based to evidence-based by answering: "What do we lose for every week/month we don't deliver this?" [DOC]

## Theoretical Foundations

### Urgency Profiles (Don Reinertsen)

Reinertsen's *Principles of Product Development Flow* (2009) defines four canonical urgency profiles that shape CoD curves [DOC]:

1. **Standard** — Linear value decay; each week of delay costs the same amount
2. **Urgent** — Exponential decay; value drops sharply after a threshold date
3. **Fixed-date** — Binary cliff; value drops to zero after a regulatory or market deadline
4. **Intangible** — Low immediate CoD but compounds over time (technical debt, enablers)

### Weighted Shortest Job First (WSJF)

SAFe popularized WSJF as the primary sequencing mechanism combining CoD with job duration [DOC]:

```
WSJF = Cost of Delay / Job Duration
```

CoD itself is decomposed into three proxy dimensions:
- **User-Business Value** — Revenue or satisfaction impact
- **Time Criticality** — Urgency profile and deadline proximity
- **Risk Reduction / Opportunity Enablement** — Strategic optionality unlocked

### Real Options Theory

CoD connects to financial options theory: deferring a decision preserves optionality, but deferring delivery destroys it. The optimal strategy minimizes total CoD across the portfolio while preserving strategic options. [INFERENCIA]

## Core Concepts

### CoD Quantification Methods

| Method | When to Use | Precision | Effort |
|--------|------------|-----------|--------|
| Revenue-based | Revenue stream directly tied to feature | High | Medium [METRIC] |
| Proxy-based (WSJF) | Portfolio prioritization at scale | Medium | Low [PLAN] |
| Opportunity cost | Market window or competitive response | Medium | Medium [INFERENCIA] |
| Penalty-based | Contractual SLAs, regulatory deadlines | High | Low [METRIC] |
| Customer lifetime value | Retention-driven features | High | High [METRIC] |

### CD3 — Cost of Delay Divided by Duration

CD3 is the mathematical equivalent of WSJF, used in Kanban and flow-based systems. It optimizes for economic throughput by always pulling the highest CD3 item next. [DOC]

### Portfolio-Level CoD

At portfolio level, CoD aggregation reveals:
- **Bottleneck cost** — The CoD accumulating behind a constrained resource [METRIC]
- **Queue cost** — Total CoD of all items waiting in backlog [METRIC]
- **Coordination cost** — CoD imposed by cross-team dependencies [INFERENCIA]

## Calculation Framework

### Step 1: Identify Value Stream

Map how the item generates or protects value: revenue, cost avoidance, risk reduction, or enablement. [PLAN]

### Step 2: Estimate Weekly/Monthly CoD

For revenue items: `CoD = (Expected Monthly Revenue × Market Share Impact) / Time to Market` [METRIC]

For penalty items: `CoD = (Penalty Amount) / (Weeks Until Deadline)` [METRIC]

For enablers: `CoD = Sum(CoD of items this enables × Probability of enabling)` [INFERENCIA]

### Step 3: Normalize and Compare

Use Fibonacci-scale relative sizing (1, 2, 3, 5, 8, 13) when absolute values are unavailable. Normalize across the portfolio for consistent sequencing. [PLAN]

### Step 4: Apply WSJF/CD3

Divide CoD by estimated duration to produce the priority score. Highest score gets pulled first. [PLAN]

## Integration Points

- **Financial Business Case** — CoD validates urgency assumptions in business cases [PLAN]
- **Capacity Planning** — CoD reveals the true cost of capacity constraints [METRIC]
- **Dependency Mapping** — Dependencies amplify CoD through blocking chains [SCHEDULE]
- **Earned Value Analysis** — Schedule variance translates to accumulated CoD [METRIC]
- **Budget Tracking** — CoD quantifies the cost of budget-induced delays [METRIC]

## Anti-Patterns

| Anti-Pattern | Symptom | Remedy |
|-------------|---------|--------|
| HiPPO prioritization | Highest-paid person decides priority | Quantify CoD for top 10 items [METRIC] |
| Equal urgency fallacy | Everything is "critical" | Force-rank using WSJF scores [PLAN] |
| Ignoring intangibles | Technical debt never prioritized | Include RROE dimension in CoD [INFERENCIA] |
| Static CoD | CoD calculated once, never updated | Refresh CoD quarterly or at phase gates [SCHEDULE] |
| Duration blindness | Large items prioritized over small | Always use CoD/Duration, never CoD alone [PLAN] |

## Key References

- Reinertsen, D. (2009). *The Principles of Product Development Flow*. Celeritas Publishing. [DOC]
- Scaled Agile Framework. (2024). *WSJF*. scaledagileframework.com. [DOC]
- Black, J. (2021). *Better Value Sooner Safer Happier*. IT Revolution Press. [DOC]
- Anderson, D. (2010). *Kanban: Successful Evolutionary Change*. Blue Hole Press. [DOC]
- Magennis, T. (2023). *Forecasting and Simulating Software Development Projects*. Focused Objective Press. [DOC]

> **Principio Rector**: "Si no puedes cuantificar lo que pierdes por esperar, no puedes priorizar con honestidad."

*PMO-APEX v1.0 — Body of Knowledge · Cost of Delay*
