---
name: priming-rag-team-topologies
description: >
  RAG priming knowledge: Team Topologies — team types, interaction modes, Conway's Law, cognitive load, RACI, team health
type: priming-rag
domain: project-management
---

# Team Topologies & Team Design — Core Knowledge Primer

> **Propósito RAG**: Este documento provee conocimiento de dominio para enriquecer el contexto del agente durante sesiones de gerencia de proyectos. No es un entregable — es material de referencia interno.

## Team Topologies Framework (Skelton & Pais)

### Four Fundamental Team Types

| Team Type | Purpose | Characteristics | Example |
|-----------|---------|----------------|---------|
| Stream-aligned | Deliver value in a single business domain | End-to-end ownership, aligned to value stream, primary type | Product team, feature team, journey team |
| Enabling | Help stream-aligned teams overcome obstacles | Temporary engagement, coaches/mentors, fills gaps | DevOps enablement, security coaching, cloud migration |
| Complicated Subsystem | Own subsystem requiring deep specialist knowledge | Heavy expertise, reduces cognitive load on others | ML engine, video codec, financial calculation |
| Platform | Provide internal services reducing cognitive load | Self-service APIs, documentation-driven, treats consumers as customers | Developer platform, CI/CD, data platform |

### Team Type Distribution (Typical)
- **Stream-aligned**: 60-80% of all teams (majority)
- **Platform**: 10-20% (supporting infrastructure)
- **Enabling**: 5-10% (temporary, rotating focus)
- **Complicated Subsystem**: 5-10% (only when genuinely needed)

Anti-pattern: if the majority of teams are NOT stream-aligned, the organization has a structural problem.

## Three Interaction Modes

| Mode | Description | Duration | Signal to Watch |
|------|------------|----------|----------------|
| Collaboration | Two teams work closely on shared goal | Temporary (weeks to months) | High overhead; should evolve to X-as-a-Service |
| X-as-a-Service | One team provides service consumed via API/contract | Ongoing | Clear interface, minimal coordination needed |
| Facilitating | One team helps another learn/adopt capability | Temporary (weeks) | Enabling team facilitates, then moves on |

### Interaction Mode Evolution
```
Collaboration (discovery phase)
    ↓ once interface is understood
X-as-a-Service (steady state)

Facilitating (capability building)
    ↓ once capability is internalized
Team independence (no ongoing interaction needed)
```

### Expected Interaction Patterns

| Provider → Consumer | Interaction Mode |
|---------------------|-----------------|
| Platform → Stream-aligned | X-as-a-Service |
| Enabling → Stream-aligned | Facilitating |
| Stream-aligned ↔ Stream-aligned | Collaboration (temporary) or X-as-a-Service (steady) |
| Complicated Subsystem → Stream-aligned | X-as-a-Service |

## Conway's Law

> "Any organization that designs a system will produce a design whose structure is a copy of the organization's communication structure." — Melvin Conway (1967)

### Implications for Project Management
- Team structure directly shapes software/system architecture
- To get a desired architecture, design the teams to match
- Cross-team dependencies create cross-system coupling
- Reorganizing teams without considering architecture creates friction

### Inverse Conway Maneuver
- Deliberately structure teams to produce the desired architecture
- Design team topology FIRST, then let architecture emerge
- Requires organizational willingness to align structure with technical goals

### Practical Application

| Desired Architecture | Team Structure |
|---------------------|---------------|
| Microservices | Small, autonomous teams per service |
| Monolith | Single team or tightly coupled teams |
| Platform + services | Platform team + stream-aligned consumers |
| Event-driven | Teams aligned to domains/bounded contexts |

## Cognitive Load

### Three Types of Cognitive Load

| Type | Definition | Management Strategy |
|------|-----------|-------------------|
| Intrinsic | Inherent complexity of the task | Training, skill development, simplification |
| Extraneous | Unnecessary complexity from environment | Remove friction, improve tooling, reduce bureaucracy |
| Germane | Effort to learn and build mental models | Encourage learning, provide context, foster expertise |

### Cognitive Load as Team Design Constraint
- **Goal**: minimize extraneous, optimize intrinsic, maximize germane
- **Team size**: limit to 5-9 members (cognitive capacity)
- **Domain complexity**: if one team can't own a domain, split it
- **Services per team**: limit to what the team can mentally model
- **Platform teams** exist to reduce cognitive load on stream-aligned teams

### Cognitive Load Assessment Questions
1. Does the team own more services/components than it can mentally model?
2. Is the team spending >30% time on tasks outside its core domain?
3. Does the team need expertise in too many technology stacks?
4. Are team members context-switching between unrelated domains frequently?
5. Has lead time increased despite stable velocity?

If 2+ answers are yes, the team is likely cognitively overloaded.

## RACI Matrix

### Definition

| Letter | Role | Rule |
|--------|------|------|
| R | Responsible | Does the work. At least one R per task. |
| A | Accountable | Approves/owns the outcome. Exactly one A per task. |
| C | Consulted | Provides input before decision (two-way). |
| I | Informed | Notified after decision (one-way). |

### RACI Design Rules
1. Every task must have exactly one **A** (single accountability)
2. Every task must have at least one **R** (someone does the work)
3. Minimize **C** entries (too many = decision bottleneck)
4. **A** and **R** can be the same person for simple tasks
5. If a row has no **A**, accountability is unclear — fix immediately
6. If a column has all **R/A**, that person is overloaded

### RACI Template Example

| Activity | PM | Sponsor | Tech Lead | QA Lead | DevOps |
|----------|-----|---------|-----------|---------|--------|
| Project charter | R | A | C | I | I |
| Architecture design | C | I | A/R | C | C |
| Sprint planning | A/R | I | R | R | I |
| Code review | I | I | A/R | C | I |
| Deployment | I | I | C | C | A/R |
| Release sign-off | R | A | C | C | I |

### RACI Variants

| Variant | Added Role | When to Use |
|---------|-----------|-------------|
| RASCI | S = Supportive (assists R) | When support roles need clarity |
| DACI | D = Driver (drives decision) | Decision-focused mapping |
| RAPID | Recommend, Agree, Perform, Input, Decide | Complex decision processes |

## Tuckman's Stages of Team Development

| Stage | Characteristics | PM Actions |
|-------|----------------|-----------|
| Forming | Polite, cautious, dependent on leader | Set clear objectives, define roles, establish norms |
| Storming | Conflict emerges, power struggles, resistance | Facilitate conflict resolution, coach, maintain focus |
| Norming | Cohesion develops, norms established, trust | Encourage collaboration, delegate more |
| Performing | High performance, autonomous, results-focused | Empower, remove obstacles, celebrate |
| Adjourning | Disbanding, reflection, transition | Recognize contributions, capture lessons |

### Key Insights
- Teams do not progress linearly — new members can cause regression to forming
- Storming is necessary — avoiding it leads to artificial harmony and hidden conflict
- High-performing teams minimize forming/storming time, maximize performing
- Remote teams: prolonged forming/storming without deliberate intervention
- Typical timeline: 3-6 months to performing (co-located), 6-12 months (distributed)

## Team Health Metrics

### Health Check Dimensions (Spotify-inspired)

| Dimension | Green | Yellow | Red |
|-----------|-------|--------|-----|
| Delivering value | Great stuff regularly | Delivers but inconsistent | Rarely delivers value |
| Speed | Fast, things flow | Some delays | Slow, things take forever |
| Mission | Excited, clear purpose | Somewhat clear | Don't know why we exist |
| Fun | Love working here | Okay most days | Boring or stressful |
| Learning | Learning a lot | Some learning | Stagnant |
| Support | Great tools, easy help | Some gaps | Blocked often |
| Teamwork | Great collaboration | Usually good | Dysfunction |
| Autonomy | Control what we work on | Some influence | No control, told what to do |
| Codebase health | Clean, easy to change | Some tech debt | Afraid to change anything |

### Quantitative Team Metrics

| Metric | Calculation | Target |
|--------|------------|--------|
| Velocity stability | Std dev / mean | <20% |
| Lead time | Idea → production | Decreasing trend |
| Deployment frequency | Deploys per period | Increasing |
| Change failure rate | Failed / total changes | <15% |
| MTTR | Mean time to restore | <1 hour |
| Team NPS | Recommendation score | >50 |
| Unplanned work ratio | Unplanned / total | <20% |

### DORA Metrics (DevOps Research and Assessment)

| Metric | Elite | High | Medium | Low |
|--------|-------|------|--------|-----|
| Deployment frequency | Multiple/day | Weekly-monthly | Monthly-6 months | <6 months |
| Lead time for changes | <1 hour | 1 day-1 week | 1 week-1 month | >1 month |
| Change failure rate | 0-15% | 16-30% | 16-30% | >30% |
| Time to restore | <1 hour | <1 day | 1 day-1 week | >1 week |

## Team Design Decision Framework

### Step 1: Map Value Streams
- Identify how value flows from concept to customer
- Each value stream should have one or more stream-aligned teams

### Step 2: Assess Cognitive Load
- For each team: domain complexity, number of services, tech stack breadth
- If overloaded: split the team or create platform/complicated-subsystem team

### Step 3: Define Interaction Modes
- Map expected interactions between all teams
- Identify collaboration (temporary) vs. X-as-a-Service (ongoing)

### Step 4: Identify Platform Needs
- What internal services reduce cognitive load across multiple teams?
- Build thinnest viable platform — evolve based on demand

### Step 5: Plan Enabling Teams
- What capability gaps exist across stream-aligned teams?
- Deploy enabling teams on temporary missions (4-8 weeks)

### Team Sizing Guidelines

| Factor | Guideline |
|--------|----------|
| Minimum viable team | 4-5 (resilience against absence) |
| Optimal team size | 5-9 (two-pizza rule, cognitive limits) |
| Maximum team size | 12-15 (beyond: communication overhead dominates) |
| Teams per value stream | 1-3 (more = coordination overhead) |
| Platform team | 3-8 per service area |
| Enabling team | 2-4 specialists |

## Quick Reference

| Concept | Key Rule | Anti-Pattern |
|---------|----------|-------------|
| Team types | 4 types, stream-aligned is primary | Most teams NOT stream-aligned |
| Interaction modes | 3 modes, collaboration is temporary | Permanent collaboration = coupling |
| Conway's Law | Team structure = system structure | Ignoring team-architecture alignment |
| Cognitive load | Minimize extraneous, optimize intrinsic | Team owns too many domains |
| RACI | Exactly 1 A per task | No A or multiple A = no accountability |
| Tuckman | Storming is necessary | Skipping storming = hidden conflict |
| Team size | 5-9 optimal | >12 people = communication breakdown |

---
*PMO-APEX v1.0 — Agentic Project Excellence*
