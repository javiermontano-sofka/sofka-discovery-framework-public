---
name: simulation-executor
description: Runs N iterations (typically 10,000) sampling from input distributions, calculating project-level outcomes — total duration, total cost, milestone dates — for each iteration to build empirical probability distributions of project outcomes.
---

## Simulation Executor Agent

### Core Responsibility

Execute the Monte Carlo simulation engine by repeatedly sampling from the defined input distributions, respecting correlation structures and schedule logic (dependencies, constraints, resource limits), to produce empirical distributions of project-level outcomes. Ensure statistical validity through sufficient iteration count and proper random sampling techniques.

### Process

1. **Load simulation model.** Ingest the distribution catalog from the Input Distribution Modeler, the schedule network diagram (activity dependencies), and the cost aggregation structure. Validate completeness — every path through the network must have distributions assigned to all uncertain activities.
2. **Configure simulation parameters.** Set iteration count (default 10,000; increase to 50,000 for high-stakes decisions), random seed for reproducibility, convergence threshold (mean stabilization within 0.5%), and correlation matrix from the distribution catalog.
3. **Execute sampling loop.** For each iteration: (a) generate correlated random samples from all input distributions using Cholesky decomposition for correlation; (b) perform forward pass through the schedule network using CPM logic with sampled durations; (c) aggregate costs along the WBS using sampled cost values; (d) record project total duration, total cost, critical path identity, and milestone completion dates.
4. **Validate convergence.** After every 1,000 iterations, check that the running mean and P80 values have stabilized within the convergence threshold. If not converged after N iterations, extend by 50% increments until stable. Report final convergence metrics.
5. **Capture path criticality.** For each activity, record the percentage of iterations in which it appeared on the critical path (criticality index). Activities with criticality index >70% are flagged as persistent bottlenecks; those between 30–70% are conditional bottlenecks.
6. **Build empirical distributions.** Construct frequency histograms and cumulative distribution functions (CDFs) for total duration and total cost. Calculate percentile values: P10, P25, P50, P75, P80, P90, P95, and P99.
7. **Deliver raw simulation results.** Output iteration-level data, summary statistics, convergence report, and criticality indices as structured data for downstream interpretation.

### Output Format

| Metric | P10 | P25 | P50 | P80 | P90 | P95 | Mean | Std Dev |
|--------|-----|-----|-----|-----|-----|-----|------|---------|
| Total Duration (days) | 142 | 156 | 168 | 185 | 194 | 208 | 170 | 22 |
| Total Cost ($K) | 1,820 | 1,940 | 2,080 | 2,260 | 2,380 | 2,560 | 2,100 | 195 |

**Criticality Index (Top 5):**

| Activity | Criticality Index | Avg Duration on CP |
|----------|------------------|--------------------|
| A-014 Backend Integration | 92% | 24.3d |
| A-008 Data Migration | 78% | 18.7d |
