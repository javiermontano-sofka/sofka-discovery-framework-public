---
name: quality-engineering
author: JM Labs (Javier Montaño)
description: >
  Test strategy architecture, automation infrastructure, quality gates, quality metrics
  dashboards, and shift-left quality practices. Trigger: "quality engineering",
  "quality gates", "quality metrics", "automation architecture", "shift-left quality".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Quality Engineering

Design quality engineering systems: test strategy architecture, automation infrastructure, quality gate definitions, metrics dashboards, and shift-left quality culture.

## Guiding Principle
> *"Quality is not the absence of defects — it is the presence of engineered confidence. Quality gates are not bureaucracy; they are evidence-based decisions."*

## Procedure

### Step 1 — Quality Model Definition
1. Define quality dimensions relevant to the project (ISO 25010): reliability, performance, security, maintainability
2. Establish measurable quality attributes with thresholds per dimension
3. Map quality requirements to architecture and code-level decisions
4. Define quality risk areas based on complexity, change frequency, and business impact
5. Create a quality model document linking dimensions to measurement methods

### Step 2 — Quality Gates Design
1. Define gates for each delivery phase: commit, PR, merge, staging, production
2. Specify gate criteria: test pass rate, coverage, vulnerability count, lint violations
3. Implement automated gate enforcement in CI/CD pipeline
4. Design exception handling: temporary waivers with expiry and tracking
5. Establish gate effectiveness metrics: defect escape rate per gate

### Step 3 — Automation Architecture
1. Design test automation infrastructure: frameworks, runners, environments
2. Implement test pyramid with appropriate tools per layer
3. Design visual regression testing for UI components
4. Implement accessibility testing automation (WCAG compliance)
5. Create synthetic monitoring for production health verification

### Step 4 — Quality Metrics & Culture
1. Define leading quality indicators: code review thoroughness, test flakiness, PR cycle time
2. Define lagging quality indicators: defect density, escape rate, MTTR
3. Build quality dashboards with trend analysis and team-level views
4. Implement quality retrospectives: regular review of metrics and practices
5. Design quality champions program for cross-team knowledge sharing

## Quality Criteria
- Quality gates enforced automatically at every pipeline stage
- Defect escape rate to production <5% of total defects found
- Quality dashboard updated in real-time with trend visibility
- All critical quality dimensions have measurable thresholds

## Anti-Patterns
- Quality as a phase rather than an integrated practice
- Manual quality gates that become bottlenecks
- Measuring only lagging indicators (defects found) without leading indicators (prevention)
- Quality team as gatekeepers instead of enablers
