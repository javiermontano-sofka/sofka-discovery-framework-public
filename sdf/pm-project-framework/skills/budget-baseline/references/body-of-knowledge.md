# Body of Knowledge — Budget Baseline

## 1. Foundations

A budget baseline is the approved time-phased budget used to measure, monitor, and control project cost performance. It represents the sum of all authorized budgets allocated to work scheduled. [DOC]

### 1.1 Core Components

| Component | Description | Source |
|-----------|------------|--------|
| Cost Estimates | Bottom-up or parametric estimates per work package | PMBOK 7th Ed [PLAN] |
| Contingency Reserve | Budget for identified risks (within baseline) | PMI Practice Standard |
| Management Reserve | Budget for unknown-unknowns (outside baseline) | PMI Practice Standard |
| Time-Phasing | Distribution of budget across project timeline | EVM Standard |
| Performance Measurement Baseline (PMB) | Integrated scope-schedule-cost baseline | EIA-748 |

### 1.2 Estimation Methods

| Method | Accuracy Range | When to Use |
|--------|---------------|-------------|
| Analogous | -25% to +75% | Early phases, limited data [INFERENCIA] |
| Parametric | -15% to +25% | Historical data available [METRIC] |
| Bottom-up | -5% to +10% | Detailed WBS available [PLAN] |
| Three-point (PERT) | -10% to +15% | Uncertainty quantification [METRIC] |

## 2. Baseline Development Process

1. **Develop cost estimates** per work package [PLAN]
2. **Add contingency reserves** based on risk register [INFERENCIA]
3. **Time-phase the budget** against the schedule baseline [SCHEDULE]
4. **Aggregate to project level** producing the S-curve [METRIC]
5. **Obtain formal approval** from sponsor/governance board [STAKEHOLDER]

## 3. S-Curve Representation

The cumulative budget baseline forms an S-curve showing planned expenditure over time. Key reference points:
- **Early phase**: Slow spending (planning, mobilization) [SCHEDULE]
- **Execution phase**: Steep curve (peak spending) [METRIC]
- **Closing phase**: Curve flattens (winding down) [SCHEDULE]

## 4. Baseline Change Control

| Trigger | Process | Authority |
|---------|---------|-----------|
| Scope change | Change request → CCB approval → Re-baseline | Change Control Board [STAKEHOLDER] |
| Risk event | Contingency draw → Document in log | PM + Sponsor [PLAN] |
| Management reserve | Formal request → Sponsor approval | Sponsor [STAKEHOLDER] |
| Re-baseline | Full re-estimation → New baseline version | Governance Board [STAKEHOLDER] |

## 5. Integration Points

- **Earned Value Management** — Budget baseline = Planned Value (PV) curve [METRIC]
- **Schedule Baseline** — Time-phasing must align with activity dates [SCHEDULE]
- **Risk Register** — Contingency reserves linked to specific risks [PLAN]
- **Scope Baseline** — Cost estimates trace to WBS work packages [PLAN]

## 6. Standards & References

| Source | Document | Relevance |
|--------|----------|-----------|
| PMI | PMBOK 7th Edition | Cost management performance domain |
| PMI | Practice Standard for EVM | Baseline measurement techniques |
| EIA | EIA-748-D | Earned Value Management Systems standard |
| AACE | Cost Estimate Classification System | Estimation accuracy classes |
| ISO | ISO 21508:2018 | Earned value management in PM |

> *Principio Rector: "El baseline no es un presupuesto; es una promesa medible de desempenio financiero."*

*PMO-APEX v1.0 — Body of Knowledge · Budget Baseline*
