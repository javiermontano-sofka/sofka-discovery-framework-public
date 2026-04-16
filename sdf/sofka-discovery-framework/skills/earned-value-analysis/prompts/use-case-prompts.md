# Use Case Prompts — Earned Value Management

> Ready-to-use prompts for the most frequent EVM analysis scenarios.

---

## 1. Standard Period EVM Report

**When:** Monthly or sprint-level EVM reporting for a single project.

```
Run EVM analysis for {PROJECT_NAME}, reporting period {PERIOD}.

Context:
- BAC: {BAC} FTE-hours
- PV this period: {PV}
- EV this period: {EV}
- AC this period: {AC}
- % Complete: {PCT}
- Previous CPI trend: {CPI_TREND}

Deliver:
1. Complete metrics table (all 11 EVM metrics)
2. CPI/SPI trend chart (Mermaid) over available periods
3. EAC forecast with formula justification
4. RAG traffic light assessment per metric
5. Management action recommendations for any Red/Amber metric

Parameters:
- {TIPO_PROYECTO}: Waterfall
- {MODO}: piloto-auto
```

---

## 2. AgileEVM Sprint Report

**When:** Sprint-level earned value tracking for agile teams.

```
Run AgileEVM for {TEAM_NAME}, Sprint {SPRINT_NUM} of release {RELEASE}.

Context:
- Total release backlog: {TOTAL_SP} story points
- Planned velocity: {VELOCITY} SP/sprint
- Sprints in release: {TOTAL_SPRINTS}
- SP earned this sprint: {SP_EARNED}
- Cumulative SP earned: {CUM_SP}
- Sprints elapsed: {ELAPSED}

Deliver:
1. AgileEVM metrics (Release CPI, Sprint SPI, Release EAC in sprints)
2. Release burnup with EV overlay
3. Sprint-over-sprint CPI trend
4. Forecast: sprints needed to complete release at current velocity
5. Risk flag if Release CPI < 0.9

Parameters:
- {TIPO_PROYECTO}: Agile
- {MODO}: desatendido
```

---

## 3. Recovery Project EVM Forensics

**When:** Analyzing a troubled project's EVM history to understand when and why it diverged.

```
Perform forensic EVM analysis on troubled project {PROJECT_NAME}.

Context:
- Original BAC: {ORIG_BAC}
- Current EAC estimate: {CURRENT_EAC}
- Periods of data available: {PERIODS}
- Known issues: {ISSUES}

Deliver:
1. Historical CPI/SPI reconstruction (when did divergence start?)
2. Root cause correlation (which periods saw biggest CPI drops and why)
3. CPI stability analysis (is the trend worsening, stabilizing, or improving?)
4. Three EAC scenarios (optimistic/likely/pessimistic) with formula variants
5. TCPI analysis: is recovery to BAC feasible?
6. Recommendation: continue/re-baseline/descope/cancel

Parameters:
- {TIPO_PROYECTO}: Recovery
- {MODO}: supervisado
```

---

## 4. Portfolio-Level EVM Dashboard

**When:** PMO needs aggregated EVM view across multiple projects.

```
Generate portfolio EVM dashboard for {PORTFOLIO_NAME}.

Projects:
{PROJECT_LIST with BAC, CPI, SPI per project}

Deliver:
1. Portfolio EVM summary table (project × metrics matrix)
2. Portfolio CPI/SPI scatter plot (identify outliers)
3. Aggregate portfolio health index (weighted by BAC)
4. Projects requiring intervention (CPI < 0.9 OR SPI < 0.9)
5. Portfolio-level EAC vs total BAC with variance

Parameters:
- {TIPO_PROYECTO}: Portfolio
- {MODO}: piloto-auto
```

---

*PMO-APEX v1.0 — Use Case Prompts · Earned Value Management*
