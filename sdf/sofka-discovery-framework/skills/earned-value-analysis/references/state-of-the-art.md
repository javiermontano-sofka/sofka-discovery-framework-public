# State of the Art — Earned Value Management (2024-2026)

> Current trends, emerging practices, and open debates in EVM for modern project management.

---

## 1. Dominant Trends

### 1.1 Earned Schedule Replacing Traditional SV/SPI

- **What's happening:** Earned Schedule (Lipke, 2003) has gained mainstream adoption. Traditional SV and SPI are mathematically flawed near project end — they converge to 0 and 1.0 regardless of actual delay. ES measures schedule performance in time units, producing reliable metrics throughout the lifecycle.
- **Impact on skill:** Always calculate SV(t) and SPI(t) alongside traditional metrics. Present ES as primary schedule indicator when project >50% complete.
- **Evidence:** PMI (2024). *Practice Standard for Earned Value Management* recommends ES. NATO adopted ES for defense projects (2023).
- **Evidence tag:** [DOC]

### 1.2 AgileEVM as Standard Practice

- **What's happening:** AgileEVM (story points as value units) is no longer experimental. Organizations like Spotify, ING, and SAFe-adopting enterprises use sprint-level CPI/SPI to track release health. Tools like Jira Advanced Roadmaps and Azure DevOps now include built-in EVM calculations for agile teams.
- **Impact on skill:** When `{TIPO_PROYECTO}` is Agile or SAFe, default to AgileEVM. Use velocity as the value measurement unit. Express forecasts in sprints, not currency.
- **Evidence:** Sulaiman et al. (2006) original paper; SAFe 6.0 metrics guide (2024); Jira Cloud EVM plugin adoption >10K installations.
- **Evidence tag:** [DOC]

### 1.3 Predictive Analytics Augmenting EVM

- **What's happening:** ML models trained on historical project data can predict final CPI/SPI with higher accuracy than traditional EVM formulas alone. Models incorporate non-EVM signals (team sentiment, commit velocity, defect rates) alongside traditional metrics.
- **Impact on skill:** Reference `predictive-analytics` skill for ML-augmented forecasting. Tag ML predictions as `[INFERENCIA]` alongside traditional EAC calculations tagged `[METRIC]`.
- **Evidence:** PMI (2025). *AI in Project Management*; Gartner (2025) "Predictive Project Analytics Market Guide."
- **Evidence tag:** [INFERENCIA]

### 1.4 Real-Time EVM Dashboards

- **What's happening:** Monthly EVM reporting is being replaced by real-time dashboards fed by automated data pipelines (Jira→EVM calculations→PowerBI/Grafana). This enables continuous performance monitoring rather than periodic snapshots.
- **Impact on skill:** Output should include dashboard specification for `dashboard-tooling` skill. EVM metrics should be designed for automated refresh, not manual recalculation.
- **Evidence:** Microsoft Project Online EVM dashboards (2024); Planisware EVM real-time module (2025).
- **Evidence tag:** [DOC]

### 1.5 EVM for Non-Traditional Projects (Services, R&D, Innovation)

- **What's happening:** EVM is being adapted for domains where "% complete" is ambiguous: R&D (milestone-based EV), services (hours-based EV), and innovation (hypothesis-validated EV). ISO 21508 explicitly supports these adaptations.
- **Impact on skill:** When project type is Transformation or innovation-heavy, use milestone-weighted or deliverable-based EV measurement instead of traditional % complete.
- **Evidence:** ISO 21508 (2018); PMI (2024) *EVM in Non-Traditional Settings* whitepaper.
- **Evidence tag:** [DOC]

---

## 2. Open Debates

### % Complete: Subjective or Objective?
- Traditional EVM relies on % complete which is notoriously subjective ("90% complete for 50% of the project"). Best practice: use 0/100, 25/75, or 50/50 measurement methods for work packages. Avoid subjective % estimates.

### EVM in Agile: Useful or Overhead?
- Critics argue EVM adds overhead to agile teams. Proponents (Sulaiman, SAFe) argue lightweight AgileEVM provides portfolio-level visibility without disrupting team cadence. PMO-APEX position: use AgileEVM at release/PI level, not sprint level.

---

*PMO-APEX v1.0 — State of the Art · Earned Value Management*
