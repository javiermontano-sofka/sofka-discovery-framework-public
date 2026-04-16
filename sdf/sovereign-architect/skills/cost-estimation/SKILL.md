---
name: cost-estimation
author: JM Labs (Javier Montaño)
description: >
  Effort inductors analysis, scope driver identification, team composition planning,
  and risk-adjusted timeline estimation. Trigger: "cost estimation", "effort estimation",
  "scope drivers", "team composition", "timeline", "sizing".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Cost Estimation

Produce engineering effort estimates: identify scope drivers and effort inductors, design team compositions, calculate risk-adjusted timelines, and build estimation models grounded in evidence.

## Guiding Principle
> *"Estimation is not prediction — it is a range of probable outcomes. Express uncertainty honestly, identify assumptions explicitly, and always estimate in ranges, never single numbers."*

## Procedure

### Step 1 — Scope Analysis & Decomposition
1. Decompose the project into estimable work packages (epics, features, tasks)
2. Classify each work package by type: new development, integration, migration, configuration
3. Identify scope drivers: number of entities, integrations, user roles, environments
4. Map complexity factors: technology novelty, regulatory requirements, performance constraints
5. Produce a Work Breakdown Structure (WBS) with classification per item

### Step 2 — Effort Inductors
1. Identify effort inductors per work package: CRUD operations, API endpoints, data models, UI screens
2. Apply sizing model: story points, T-shirt sizes, or function point analysis
3. Calibrate estimates using historical data (velocity, similar past projects)
4. Factor in non-functional effort: testing (30-40%), CI/CD (10-15%), documentation (5-10%)
5. Produce a detailed effort breakdown with confidence ranges (optimistic, likely, pessimistic)

### Step 3 — Team Composition
1. Identify required skill profiles: frontend, backend, data, DevOps, QA, architect
2. Design team topology based on project scope and domain complexity
3. Calculate team ramp-up time for new technology or domain
4. Factor in part-time vs. full-time allocation and context switching overhead
5. Produce a staffing plan with roles, FTE counts, and timeline per phase

### Step 4 — Risk-Adjusted Timeline
1. Identify estimation risks: unknown requirements, third-party dependencies, technical uncertainty
2. Apply risk multipliers to affected work packages (1.2x-2x based on uncertainty)
3. Calculate three-point estimates: optimistic, most likely, pessimistic (PERT)
4. Build timeline with milestones, dependencies, and buffer allocation
5. Produce a confidence matrix: 50%, 75%, 90% probability timelines

## Quality Criteria
- Every estimate has optimistic, likely, and pessimistic ranges (never single numbers)
- Non-functional effort (testing, CI/CD, docs) explicitly included, not hidden
- Assumptions documented and validated with stakeholders
- Historical calibration data referenced when available

## Anti-Patterns
- Single-point estimates without ranges or confidence levels
- Padding estimates instead of explicitly modeling risk
- Ignoring non-functional effort (testing, deployment, documentation)
- Estimating without decomposition (gut-feel estimation on large scopes)
