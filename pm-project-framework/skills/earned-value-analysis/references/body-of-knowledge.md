# Body of Knowledge — Earned Value Management (EVM)

> Standards, formulas, interpretation rules, and practitioner guidance for EVM analysis in project management.

---

## 1. Standards & Frameworks

### ANSI/EIA-748 — Earned Value Management Systems

- **Relevance:** The definitive EVM standard. Defines 32 guidelines across 5 categories: Organization, Planning/Scheduling/Budgeting, Accounting, Analysis/Management Reports, Revisions/Data Maintenance.
- **Use in skill:** For Waterfall projects requiring formal EVM compliance (government, defense, large infrastructure).
- **Source:** ANSI/EIA (2019). *ANSI/EIA-748-D Earned Value Management Systems*.

### PMI Practice Standard for Earned Value Management (3rd Edition)

- **Relevance:** PMI's interpretation of EVM for project managers. Covers setup, implementation, analysis, and reporting. More accessible than ANSI/EIA-748 for commercial projects.
- **Source:** PMI (2019). *Practice Standard for Earned Value Management — 3rd Edition*.

### ISO 21508:2018 — Earned Value Management in Project and Programme Management

- **Relevance:** International standard that makes EVM methodology-agnostic. Defines minimum EVM requirements adaptable to predictive, iterative, and hybrid approaches.
- **Source:** ISO (2018). *ISO 21508:2018 — Earned value management in project and programme management*.

---

## 2. Complete Formula Reference

### Foundational Metrics

| Metric | Formula | Meaning |
|--------|---------|---------|
| PV | Planned Value (budgeted cost of work scheduled) | How much work should be done by now |
| EV | Earned Value (budgeted cost of work performed) | How much work IS done (in budget terms) |
| AC | Actual Cost (actual cost of work performed) | How much was actually spent |
| BAC | Budget at Completion | Total approved budget |

### Variance Metrics

| Metric | Formula | Interpretation |
|--------|---------|---------------|
| CV | EV - AC | Positive = under budget; Negative = over budget |
| SV | EV - PV | Positive = ahead of schedule; Negative = behind |
| CV% | CV / EV × 100 | Cost variance as percentage |
| SV% | SV / PV × 100 | Schedule variance as percentage |

### Performance Indices

| Metric | Formula | Interpretation |
|--------|---------|---------------|
| CPI | EV / AC | >1.0 = cost efficient; <1.0 = cost overrun |
| SPI | EV / PV | >1.0 = ahead; <1.0 = behind schedule |
| CSI | CPI × SPI | Combined index; <0.8 = critical |

### Forecasting Formulas

| Metric | Formula | When to Use |
|--------|---------|------------|
| EAC₁ | BAC / CPI | Current CPI trend will continue (most common) |
| EAC₂ | AC + (BAC - EV) | Past is atypical; future at planned rate |
| EAC₃ | AC + (BAC - EV) / (CPI × SPI) | Both cost and schedule affect future work |
| EAC₄ | AC + Bottom-Up ETC | Management re-estimate of remaining work |
| ETC | EAC - AC | Remaining cost to complete |
| VAC | BAC - EAC | Variance at completion |

### EAC Formula Decision Tree

```
Is past performance representative of future? 
├── YES → Is schedule pressure affecting cost?
│   ├── YES → EAC₃ = AC + (BAC-EV)/(CPI×SPI)
│   └── NO  → EAC₁ = BAC/CPI
└── NO  → Is management re-estimating remaining work?
    ├── YES → EAC₄ = AC + Bottom-Up ETC
    └── NO  → EAC₂ = AC + (BAC-EV)
```

### To-Complete Performance Index

| Metric | Formula | Interpretation |
|--------|---------|---------------|
| TCPI(BAC) | (BAC - EV) / (BAC - AC) | Performance needed to finish at BAC |
| TCPI(EAC) | (BAC - EV) / (EAC - AC) | Performance needed to finish at EAC |

**TCPI feasibility thresholds:**
- TCPI ≤ 1.0: Recovery trivial (already on or under budget)
- TCPI 1.0-1.1: Recovery achievable with effort
- TCPI 1.1-1.2: Recovery difficult, requires intervention
- TCPI > 1.2: Recovery statistically improbable; recommend re-baseline

---

## 3. CPI Stability Rule

After 20% project completion, the cumulative CPI rarely changes by more than ±10%. This empirically validated rule (Christensen, 1993; DoD data 1970-2000) means:

- **Early CPI is unreliable** — Wait until ≥20% complete before trusting CPI for forecasting
- **Late CPI recovery is mythical** — If CPI = 0.85 at 30% complete, final CPI will likely be 0.77-0.94
- **Use for early warning** — CPI < 0.95 at 20% complete should trigger immediate investigation

**Source:** Christensen, D.S. (1993). "The Estimate at Completion Problem: A Review of Three Studies", *Project Management Journal*.

---

## 4. Earned Schedule (ES)

### Concept

Traditional SV and SPI become unreliable near project end (SV→0, SPI→1 regardless of delay). Earned Schedule solves this by measuring schedule variance in time units.

| Metric | Formula | Meaning |
|--------|---------|---------|
| ES | Time at which current EV should have been achieved | Schedule performance in time |
| SV(t) | ES - AT | Schedule variance in time units |
| SPI(t) | ES / AT | Schedule performance index (time-based) |

**When to use:** Always when project is >70% complete. SPI(t) is a more reliable schedule indicator than traditional SPI throughout the project.

**Source:** Lipke, W.H. (2003). "Schedule is Different", *The Measurable News*.

---

## 5. AgileEVM Adaptation

### Story Points as Value Units

| Traditional | AgileEVM Equivalent |
|-------------|-------------------|
| BAC (budget) | Total story points in release backlog |
| PV (planned) | Story points planned per sprint (velocity × sprints) |
| EV (earned) | Story points accepted per sprint |
| AC (actual) | Actual effort (FTE-hours or sprint count) |

### Sprint-Level Metrics

| Metric | AgileEVM Calculation |
|--------|---------------------|
| Release CPI | Total SP earned / (Actual sprints × Planned velocity) |
| Sprint SPI | SP earned this sprint / Planned SP this sprint |
| Release EAC | Total SP / CPI (remaining sprints needed) |

**Key difference:** In AgileEVM, "cost" can be measured in sprints rather than currency, making it price-free and compatible with PMO-APEX output standards.

**Source:** Sulaiman, T., Barton, B., Blackburn, T. (2006). "AgileEVM — Earned Value Management in Scrum Projects", *Agile Conference*.

---

## 6. RAG Thresholds (PMO-APEX Standard)

| Metric | Blue (On Track) | Amber (Warning) | Red (Critical) |
|--------|-----------------|-----------------|----------------|
| CPI | ≥ 0.95 | 0.90-0.94 | < 0.90 |
| SPI | ≥ 0.95 | 0.90-0.94 | < 0.90 |
| TCPI | ≤ 1.05 | 1.06-1.20 | > 1.20 |
| VAC | ≥ 0% | -1% to -5% | < -5% |

**Note:** APEX uses Blue/Amber/Red (NEVER green) per branding standards.

---

*PMO-APEX v1.0 — Body of Knowledge · Earned Value Management*
