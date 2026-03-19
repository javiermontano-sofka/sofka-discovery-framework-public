---
name: priming-rag-scaled-agile
description: >
  RAG priming knowledge: Scaled agile frameworks — SAFe 6.0, LeSS, Nexus, Spotify Model — scaling patterns and anti-patterns
type: priming-rag
domain: project-management
---

# Scaled Agile Frameworks — Core Knowledge Primer

> **Propósito RAG**: Este documento provee conocimiento de dominio para enriquecer el contexto del agente durante sesiones de gerencia de proyectos. No es un entregable — es material de referencia interno.

## SAFe 6.0 (Scaled Agile Framework)

### Seven Core Competencies
1. **Team and Technical Agility** — cross-functional agile teams with engineering excellence
2. **Agile Product Delivery** — customer-centric, Design Thinking, continuous delivery pipeline
3. **Enterprise Solution Delivery** — coordinate large-scale solutions across multiple ARTs
4. **Lean Portfolio Management** — strategy, investment funding, governance with lean budgets
5. **Organizational Agility** — lean-thinking culture, business agility across the enterprise
6. **Continuous Learning Culture** — innovation, relentless improvement, learning organization
7. **Lean-Agile Leadership** — leaders model and teach lean-agile mindset

### SAFe Configurations

| Configuration | When to Use | Key Elements |
|--------------|-------------|-------------|
| Essential SAFe | Single ART, starting point | ART, PI Planning, Team/ART Backlogs |
| Large Solution SAFe | Multiple ARTs, single solution | Solution Train, Pre/Post PI Planning, Capabilities |
| Portfolio SAFe | Enterprise strategy alignment | Lean Portfolio Management, Strategic Themes, Epics |
| Full SAFe | All of the above combined | Complete framework for large enterprises |

### Agile Release Train (ART)

- Long-lived team of agile teams: typically 50-125 people
- Synchronized on a common cadence (Program Increment)
- Aligned to a single value stream
- Develops and delivers value incrementally

#### ART Roles

| Role | Responsibility |
|------|---------------|
| Release Train Engineer (RTE) | Servant leader, facilitates ART events, removes impediments |
| Product Management | Owns ART backlog, defines features, sets PI objectives |
| System Architect | Architectural runway, technical guidance across teams |
| Business Owners | Stakeholder group, evaluates PI objectives, participates in PI Planning |
| Scrum Masters | Team-level coaching and facilitation |
| Product Owners | Team-level backlog management |

### Program Increment (PI) Planning

- **Duration**: 2-day face-to-face event every 8-12 weeks (typically 5 iterations)
- **Participants**: all ART members simultaneously (50-125 people)
- **Iteration model**: 4 development iterations + 1 Innovation & Planning (IP) iteration

#### PI Planning Outputs
- PI Objectives (team and ART level) with business value scores
- Program Board: feature delivery timeline + cross-team dependencies
- ROAM'd risks (Resolved, Owned, Accepted, Mitigated)
- Confidence vote: fist-of-five (target: average 3+, no 1s or 2s)

#### PI Planning Agenda

| Day 1 | Day 2 |
|-------|-------|
| Business context & vision | Planning adjustments |
| Architecture vision & practices | Dependency resolution |
| Team breakouts: draft plans | Final plan review |
| Draft plan review | Confidence vote |
| Management review & problem-solving | Planning retrospective |

### WSJF Prioritization (Weighted Shortest Job First)

```
WSJF = Cost of Delay / Job Duration

Cost of Delay = User-Business Value + Time Criticality + Risk Reduction/Opportunity Enablement
```

| Component | Scale | Question |
|-----------|-------|---------|
| User-Business Value | 1-21 (Fibonacci) | What is the relative value to users/business? |
| Time Criticality | 1-21 | How does delay affect this item's value? |
| Risk Reduction / Opportunity Enablement | 1-21 | Does this reduce risk or enable future opportunities? |
| Job Size (Duration) | 1-21 | What is the relative effort? |

- Higher WSJF = do first
- Recalculate at PI boundaries as values shift
- Use relative sizing, not absolute

### Lean Budgeting

| Concept | Description |
|---------|------------|
| Value Stream Funding | Budget allocated to value streams, not projects |
| Guardrails | Spending policies: capacity allocation, investment horizons |
| Epic Funding | Lightweight business cases for epics; go/no-go at Lean Portfolio Management |
| Participatory Budgeting | Stakeholders collaborate on budget allocation |
| Dynamic budget | Reallocate quarterly based on outcomes, not annual fixed budgets |

#### Investment Horizons (Horizon Model)
- **Horizon 1**: Existing products/services (majority of budget)
- **Horizon 2**: Emerging opportunities (moderate investment)
- **Horizon 3**: Exploratory research (small, experimental budget)

### SAFe Ceremonies Beyond Team Level

| Ceremony | Level | Frequency | Purpose |
|----------|-------|-----------|---------|
| PI Planning | ART | Per PI (8-12 weeks) | Alignment, planning, risk identification |
| System Demo | ART | Every iteration | Integrated solution demonstration |
| Inspect & Adapt | ART | End of PI | Retrospective + problem-solving workshop |
| ART Sync | ART | Weekly | Cross-team coordination |
| Scrum of Scrums | ART | 2-3x/week | Impediment resolution |
| PO Sync | ART | Weekly | Backlog alignment across teams |
| Pre/Post PI Planning | Solution Train | Per PI | Cross-ART alignment |
| Solution Demo | Solution Train | Per PI | Full solution demonstration |

### SAFe Metrics

| Level | Metric | Target |
|-------|--------|--------|
| Team | Velocity, Sprint burndown | Predictable (not increasing) |
| ART | PI predictability (planned vs. actual objectives) | 80-100% |
| ART | Feature cycle time | Decreasing trend |
| Solution | Solution Train sync | Dependencies resolved on time |
| Portfolio | Lean budget guardrails compliance | 100% |
| Portfolio | Epic lead time | Decreasing trend |

## LeSS (Large-Scale Scrum)

### Philosophy
LeSS is Scrum — applied to multiple teams working on one product. Descale organizational complexity rather than adding process.

### LeSS vs. LeSS Huge

| Aspect | LeSS | LeSS Huge |
|--------|------|-----------|
| Teams | 2-8 | 8+ |
| Product Owner | 1 PO | 1 PO + Area Product Owners |
| Product Backlog | 1 shared backlog | 1 overall + Area Backlogs |
| Sprint | Shared Sprint | Shared Sprint |
| Coordination | Self-managing | Requirement Areas |

### LeSS Events

| Event | Scope | Key Difference from Scrum |
|-------|-------|--------------------------|
| Sprint Planning Part 1 | All teams together | Shared; teams select items, identify cross-team work |
| Sprint Planning Part 2 | Per team | Standard Scrum; teams design their approach |
| Daily Scrum | Per team | Standard; cross-team observers welcome |
| Overall Retrospective | All teams + management | Systemic improvement, organizational impediments |
| Sprint Review | All teams together | Bazaar-style with stakeholders; all teams demo |

### LeSS Hard Rules
- One Product Owner, one Product Backlog for the whole product
- All teams in a common Sprint
- Teams are cross-functional, cross-component feature teams (not component teams)
- Definition of Done is common across all teams and expands over time
- Each team has a Scrum Master (1 SM per 1-3 teams)

### LeSS Guides (Key Practices)
- Feature teams over component teams
- Communities of Practice for technical alignment
- Multi-team Sprint Planning for dependency management
- Travelers: team members temporarily join other teams for knowledge transfer

## Nexus (Scaled Scrum by Scrum.org)

### Framework Overview
- Extension of Scrum for 3-9 Scrum Teams on a single product
- Adds: Nexus Integration Team, Nexus Sprint Backlog, Integrated Increment

### Nexus Integration Team (NIT)
- Accountable for successful integration of all teams' work
- Composed of: Product Owner + Scrum Master + cross-team members
- Ensures the Integrated Increment meets the Definition of Done each Sprint
- Coaching and mentoring role, not command-and-control

### Nexus Events

| Event | Purpose | Participants |
|-------|---------|-------------|
| Nexus Sprint Planning | Coordinate cross-team work, minimize dependencies | All teams + NIT |
| Nexus Daily Scrum | Surface integration issues, resolve blockers | Representatives from each team |
| Nexus Sprint Review | Inspect integrated increment with stakeholders | All teams + stakeholders |
| Nexus Sprint Retrospective | Improve cross-team collaboration and integration | All teams |

### Nexus Artifacts
- **Nexus Sprint Backlog**: composite view highlighting dependencies and integration work
- **Integrated Increment**: combined, tested, integrated work of all teams
- **Product Backlog**: single backlog (same as Scrum) refined for cross-team awareness

## Spotify Model

### Disclaimer
The Spotify Model is not a framework — it describes how Spotify organized engineering at a point in time. It is inspirational, not prescriptive. Spotify itself has evolved beyond it.

### Organizational Units

| Unit | Description | Typical Size | Purpose |
|------|-----------|-------------|---------|
| Squad | Autonomous team (mini-startup) | 6-12 | End-to-end delivery of a feature area |
| Tribe | Collection of related squads | <150 (Dunbar) | Alignment, shared mission |
| Chapter | Functional specialists across squads within a tribe | Varies | Technical excellence, career growth, standards |
| Guild | Community of interest across all tribes | Open membership | Knowledge sharing, cross-pollination |

### Key Principles
- **Autonomy with alignment**: squads decide how; leadership decides what and why
- **Loosely coupled, tightly aligned**: minimize dependencies, maximize shared purpose
- **Trust over control**: guardrails, not gates; trust teams to make decisions
- **Community over structure**: chapters and guilds provide organic knowledge sharing

### Alignment Model
```
Strategy → Mission per Tribe → Autonomy per Squad → Alignment via Chapters/Guilds
```

## Scaling Decision Framework

| Condition | Recommended Approach |
|-----------|---------------------|
| 2-3 teams, single product | Nexus or informal Scrum-of-Scrums |
| 4-8 teams, single product | LeSS or Nexus |
| 8+ teams, single product | LeSS Huge |
| Multiple products, enterprise alignment needed | SAFe (start Essential, scale as needed) |
| Strong engineering culture, high autonomy | Spotify-inspired model |
| Heavy regulation, formal governance required | SAFe (provides governance artifacts) |
| Organization resists prescribed frameworks | LeSS (descaling philosophy) |

## Scaling Anti-Patterns

| Anti-Pattern | Symptom | Root Cause |
|-------------|---------|-----------|
| Scaling before fixing team-level Scrum | Chaos amplified at scale | Broken fundamentals |
| Excessive dependencies between teams | PI Planning consumed by dependency boards | Component teams, not feature teams |
| ART too large (>150 people) | Coordination overhead exceeds value | Poor value stream mapping |
| Framework tourism | Switching frameworks annually | Seeking a silver bullet |
| Partial adoption | Cherry-pick ceremonies, ignore principles | Avoiding organizational change |
| Fake PI Planning | 2-day meeting with no real commitment | Management override of team plans |
| SAFe as waterfall | Using SAFe structure with waterfall mindset | Cultural resistance to agile |

## Cross-Framework Comparison

| Dimension | SAFe 6.0 | LeSS | Nexus | Spotify |
|-----------|---------|------|-------|---------|
| Prescriptiveness | High | Low (descaling) | Medium | Inspirational only |
| Typical scale | 50-10,000+ | 10-2,000 | 15-80 | 50-1,000+ |
| Roles added | Many (RTE, PM, SA) | Minimal | Nexus Integration Team | Chapters, Guilds |
| Ceremony overhead | Significant | Minimal beyond Scrum | Moderate | Minimal |
| Product Owners | Multiple levels | 1 PO (strict rule) | 1 PO | Per squad |
| Portfolio level | Yes (LPM) | No | No | Tribal alignment |
| Best for | Large enterprises, regulated | Simplicity at scale | 3-9 teams, single product | Engineering culture focus |
| Certification | Extensive (SA, SPC, RTE) | Limited (CLP) | None required | None |

## Quick Reference

| Framework | Start Here | Key Ceremony | Key Metric |
|-----------|-----------|-------------|------------|
| SAFe | Essential SAFe, single ART | PI Planning | PI Predictability |
| LeSS | 2-3 feature teams, 1 PO | Overall Retrospective | Team velocity consistency |
| Nexus | 3-9 teams, integration focus | Nexus Sprint Planning | Integration success rate |
| Spotify | Tribe/squad structure | Guild meetups | Squad health checks |

---
*PMO-APEX v1.0 — Agentic Project Excellence*
