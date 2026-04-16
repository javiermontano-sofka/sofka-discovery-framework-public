# Metaprompts — Integration Plan

## Metaprompt 1: Failure Mode Mapping

**Strategy**: Identify all failure modes at each integration point before implementation.

**Protocol**:
1. List every integration interface
2. For each, enumerate failure modes (timeout, data corruption, schema mismatch, auth failure)
3. Assess probability and impact per failure mode
4. Design detection mechanisms (monitoring, alerts)
5. Define recovery procedures for each failure mode

**Activation**:
> "Map failure modes for every integration point in this plan. For each interface, identify what can go wrong, how we detect it, and how we recover. Prioritize by probability x impact and ensure monitoring covers the top 10 failure modes."

## Metaprompt 2: Integration Sequence Optimizer

**Strategy**: Find the optimal order for integration activities to minimize risk and maximize early feedback.

**Protocol**:
1. Map all integration dependencies
2. Identify which integrations provide the most learning/risk reduction
3. Sequence for maximum early feedback (high-risk first)
4. Identify parallel integration opportunities
5. Produce an optimized integration timeline

**Activation**:
> "Optimize the integration sequence. Which integrations should happen first to maximize early feedback and reduce risk? Which can run in parallel? Produce a revised timeline that minimizes total integration risk exposure."

## Metaprompt 3: Data Quality Gate Design

**Strategy**: Define quality gates at each data integration point to catch issues before propagation.

**Protocol**:
1. For each data flow, define expected data quality metrics
2. Design automated validation rules (completeness, format, range, referential integrity)
3. Define thresholds for pass/warn/fail
4. Specify remediation actions for each threshold
5. Build into CI/CD pipeline where possible

**Activation**:
> "Design data quality gates for every data integration point. Define validation rules, thresholds, and automated checks that can be embedded in the integration pipeline. No data should flow through without quality verification."

*PMO-APEX v1.0 — Metaprompts · Integration Plan*
