---
name: priming-rag-agile-frameworks
description: >
  RAG priming knowledge: Agile frameworks — Scrum, XP, Crystal, DSDM — ceremonies, roles, artifacts, estimation
type: priming-rag
domain: project-management
---

# Agile Frameworks — Core Knowledge Primer

> **Propósito RAG**: Este documento provee conocimiento de dominio para enriquecer el contexto del agente durante sesiones de gerencia de proyectos. No es un entregable — es material de referencia interno.

## Scrum Framework (Scrum Guide 2020)

### Pillars of Empiricism
- **Transparency**: process and work visible to performers and inspectors
- **Inspection**: artifacts and progress inspected frequently to detect variances
- **Adaptation**: adjust process or material when deviations exceed acceptable limits

### Roles (Accountabilities)

| Role | Accountability | Anti-pattern |
|------|---------------|-------------|
| Product Owner | Maximize value, own Product Backlog ordering and transparency | Committee PO, proxy PO, absent PO |
| Scrum Master | Team effectiveness, process coaching, organizational impediment removal | Secretary SM, tech-lead SM, command-control SM |
| Developers | Self-managing, cross-functional delivery of Done Increment each Sprint | Hero culture, knowledge silos, waiting for permission |

### Events

| Event | Timebox (30-day Sprint) | Purpose | Key Output |
|-------|------------------------|---------|------------|
| Sprint Planning | 8 hours max | What + How for Sprint Goal | Sprint Backlog + Sprint Goal |
| Daily Scrum | 15 minutes | Inspect progress toward Sprint Goal | Adaptation plan for next 24h |
| Sprint Review | 4 hours max | Inspect Increment, adapt Backlog | Updated Product Backlog |
| Sprint Retrospective | 3 hours max | Inspect process, people, tools | Actionable improvements (at least 1 committed) |
| Sprint | 1-4 weeks (fixed) | Container event | Done Increment |

- Timeboxes scale proportionally for shorter Sprints
- Sprint Planning: Topic 1 (What — PO presents, team selects) + Topic 2 (How — team decomposes)
- Sprint Goal: single objective that provides coherence; the Sprint fails if the Goal is not met

### Artifacts & Commitments

| Artifact | Commitment | Purpose |
|----------|-----------|---------|
| Product Backlog | Product Goal | Ordered list of everything needed to improve the product |
| Sprint Backlog | Sprint Goal | Selected PBIs + plan for delivering the Sprint Goal |
| Increment | Definition of Done | Usable, valuable stepping stone toward the Product Goal |

### Sprint Mechanics

- **Velocity**: average story points completed per Sprint (use last 3-5 Sprints)
- **Burndown chart**: remaining work vs. time — shows daily progress within Sprint
- **Burnup chart**: completed work vs. total scope — reveals scope creep
- **Sprint capacity**: available person-days × focus factor (typically 0.6-0.8)
- **Yesterday's weather**: next Sprint forecast = last Sprint's velocity
- **Sprint cancellation**: only the PO can cancel; occurs when Sprint Goal becomes obsolete

## Extreme Programming (XP)

### Values
- Communication, Simplicity, Feedback, Courage, Respect

### Core Practices

| Practice | Description | Benefit |
|----------|------------|---------|
| Pair Programming | Two developers, one keyboard | Knowledge sharing, real-time review, defect reduction |
| TDD | Red → Green → Refactor cycle | Design quality, regression safety, living documentation |
| Continuous Integration | Integrate and build multiple times/day | Early defect detection |
| Collective Code Ownership | Any developer can modify any code | Eliminates bottlenecks, bus factor |
| Simple Design | YAGNI — only build what's needed now | Reduces waste and complexity |
| Refactoring | Improve design without changing behavior | Technical debt management |
| Small Releases | Frequent, small, valuable releases | Fast feedback loops |
| Planning Game | Developers estimate, business prioritizes | Balanced decision-making |
| Sustainable Pace | 40-hour weeks, no death marches | Long-term productivity |
| On-site Customer | Business representative available full-time | Fast clarification, reduced rework |
| Coding Standards | Agreed team conventions | Consistency enables collective ownership |
| Metaphor | Shared mental model of the system | Common vocabulary |

### XP Metrics
- **Defect rate**: defects found in production per release
- **Test coverage**: % of code covered by automated tests (target: >80%)
- **Build frequency**: integrations per day
- **Build success rate**: % of builds that pass

## Crystal Family (Alistair Cockburn)

### Classification by Team Size and Criticality

| Variant | Team Size | Criticality | Ceremony Weight |
|---------|-----------|-------------|-----------------|
| Crystal Clear | 1-6 | Loss of comfort (C) | Minimal |
| Crystal Yellow | 7-20 | Discretionary money (D) | Light |
| Crystal Orange | 21-40 | Essential money (E) | Moderate |
| Crystal Red | 41-80 | Loss of life (L) | Heavy |

### Seven Core Properties (all variants)
1. **Frequent delivery** — deployed to users every 2 weeks to 2 months
2. **Reflective improvement** — retrospectives after each delivery cycle
3. **Osmotic communication** — information flows by proximity and overhearing
4. **Personal safety** — people speak truth without fear of reprisal
5. **Focus** — uninterrupted time on 1-2 priorities
6. **Easy access to expert users** — real users available for rapid feedback
7. **Technical environment** — automated tests, CI, frequent integration

### When to Use Crystal
- Scrum feels too prescriptive for the organization
- Team wants methodology tailored to size and criticality
- Lightweight governance with clear safety properties needed
- Incremental transition toward agile

## DSDM (Dynamic Systems Development Method)

### Eight Principles
1. Focus on the business need
2. Deliver on time (timeboxing is non-negotiable)
3. Collaborate (active stakeholder involvement)
4. Never compromise quality (quality level agreed at start)
5. Build incrementally from firm foundations
6. Develop iteratively (embrace change)
7. Communicate continuously and clearly
8. Demonstrate control (visible progress)

### MoSCoW Prioritization

| Category | Rule | Effort Target |
|----------|------|---------------|
| **Must** have | Non-negotiable for this timebox | ~60% |
| **Should** have | Important but not vital for launch | ~20% |
| **Could** have | Desirable; first to be dropped | ~20% |
| **Won't** have this time | Agreed out of scope for now | Documented for future |

- Contingency buffer = Should + Could items (~40% of effort)
- If running late: drop Could first, then Should
- Must items alone must not exceed 60% — if they do, scope is too large

### DSDM Phases
1. **Pre-project**: feasibility assessment, terms of reference
2. **Feasibility**: prototype to validate approach (days, not weeks)
3. **Foundations**: baseline architecture, prioritized requirements, delivery plan
4. **Evolutionary Development**: iterative, incremental build in timeboxes
5. **Deployment**: release to live environment, training, review

### DSDM Roles
- Business Sponsor, Business Visionary, Business Ambassador
- Technical Coordinator, Team Leader, Solution Developer, Solution Tester
- Project Manager, Business Analyst

## User Stories & Estimation

### User Story Format
```
As a [role], I want [capability], so that [benefit].
```

### INVEST Criteria

| Letter | Criterion | Validation Question |
|--------|-----------|-------------------|
| I | Independent | Can be developed and delivered in any order? |
| N | Negotiable | Is it a conversation placeholder, not a contract? |
| V | Valuable | Does it deliver value to user or business? |
| E | Estimable | Can the team reasonably size it? |
| S | Small | Does it fit in one Sprint? |
| T | Testable | Are there clear, verifiable acceptance criteria? |

### Acceptance Criteria Format (Given/When/Then)
```
Given [precondition/context]
When  [action/trigger]
Then  [expected result/outcome]
```

### Story Point Estimation Techniques

| Technique | When to Use | Notes |
|-----------|------------|-------|
| Planning Poker | Sprint planning, backlog refinement | Fibonacci: 1, 2, 3, 5, 8, 13, 21 |
| T-Shirt Sizing | Roadmap-level, large batch sizing | XS, S, M, L, XL — map to points later |
| Affinity Mapping | Initial backlog creation | Group into relative buckets silently |
| Bucket System | Very large backlogs (100+ items) | Buckets: 0, 1, 2, 3, 5, 8, 13, 20, 40, 100 |

### What Story Points Measure
- **Complexity** + **Effort** + **Uncertainty** (NOT hours)
- Anchor: pick a well-understood story as reference (e.g., "login form = 3 points")
- Stories > 13 points: split before Sprint Planning
- Stories > 21 points: must split — too large for single Sprint

## Definition of Done vs. Definition of Ready

| Definition of Ready (DoR) | Definition of Done (DoD) |
|---------------------------|--------------------------|
| Story written with INVEST criteria | Code complete and peer-reviewed |
| Acceptance criteria defined and agreed | Unit tests passing (coverage >80%) |
| Dependencies identified and resolved | Integration tests passing |
| UX/design mockups available (if needed) | No critical/high defects open |
| Sized by team (story points assigned) | Documentation updated |
| No known blockers | Deployed to staging environment |
| PO available for clarification | PO accepted against acceptance criteria |

### DoD Evolution Over Time
- Sprints 1-3: code + unit tests + code review
- Sprints 4-8: add integration tests + automated deployment
- Sprint 9+: add performance tests + security scan + monitoring + feature flags

## Velocity & Forecasting

### Velocity Stabilization Timeline
- Sprints 1-3: velocity is unreliable — do not make forecasts
- Sprints 4-6: emerging pattern — range-based forecasting only
- Sprint 7+: stable velocity — reliable forecasting possible

### Forecasting Formula
```
Remaining Story Points / Average Velocity = Sprints Remaining

Range: [Remaining / Max Velocity, Remaining / Min Velocity]
```

### Velocity Anti-patterns
- Inflating points to appear productive
- Comparing velocity across different teams
- Using velocity as a performance metric or KPI
- Not accounting for tech-debt Sprints or team changes
- Treating velocity as a commitment rather than a forecast

## Quick Reference

| Framework | Best For | Team Size | Key Differentiator |
|-----------|----------|-----------|-------------------|
| Scrum | Product development, regular cadence | 3-9 | Sprint-based, role clarity, empiricism |
| XP | Software quality, technical excellence | 4-12 | Engineering practices, TDD, pairing |
| Crystal | Tailoring by team size/criticality | 1-80 | Family of methods, safety properties |
| DSDM | Fixed-deadline projects, business focus | 5-20 | MoSCoW + timeboxing, never slip on time |
| Kanban | Continuous flow, support/ops | Any | WIP limits, no prescribed iterations |

---
*PMO-APEX v1.0 — Agentic Project Excellence*
