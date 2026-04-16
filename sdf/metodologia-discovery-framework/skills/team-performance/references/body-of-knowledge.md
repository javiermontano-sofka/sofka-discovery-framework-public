# Body of Knowledge — Team Performance & Health Tracking

> Academic, industrial, and practitioner sources for velocity tracking, health checks, burndown analysis, and sustainable delivery metrics.

---

## 1. Foundational Frameworks

### PMBOK 7th Edition — Team & Measurement Performance Domains

- **Relevance:** PMI combines team development with measurement to ensure sustainable delivery. The Team domain covers high-performing team characteristics; the Measurement domain covers establishing and tracking metrics.
- **Key concepts:** Servant leadership, team charter, velocity/throughput, leading vs lagging indicators.
- **Source:** PMI (2021). *PMBOK Guide — 7th Edition*.

### Accelerate (DORA Metrics)

- **Relevance:** The four key metrics of software delivery performance: deployment frequency, lead time for changes, change failure rate, time to restore service. These provide objective, comparable team performance measures.
- **Key insight:** Elite teams score well on ALL four metrics — they are fast AND stable. Speed and quality are not trade-offs.
- **Use in skill:** Use DORA metrics for engineering teams alongside agile metrics (velocity, throughput).
- **Source:** Forsgren, N., Humble, J. & Kim, G. (2018). *Accelerate*; DORA (2024). *State of DevOps Report*.

### Tuckman's Team Development Model

- **Relevance:** Teams progress through Forming, Storming, Norming, Performing stages. Performance metrics should be interpreted in context of team maturity — a Forming team will have lower velocity than a Performing team.
- **Use in skill:** Factor team maturity stage into performance assessment. Don't compare Forming team velocity to Performing team velocity.
- **Source:** Tuckman, B. (1965). *Developmental Sequence in Small Groups*.

---

## 2. Performance Metrics

### Agile Metrics

| Metric | What It Measures | Healthy Range | Warning Signs |
|--------|-----------------|--------------|---------------|
| Velocity | Story points completed per sprint | Stable ±15% over 5 sprints | Declining 3+ sprints; wild fluctuation |
| Predictability | % of sprint commitment delivered | 80-100% | Below 70%; always 100% (sandbagging) |
| Throughput | Items completed per unit time | Stable or increasing trend | Declining despite stable team |
| Cycle Time | Time from start to done per item | Decreasing or stable | Increasing over time |
| WIP | Items in progress simultaneously | ≤ team size | WIP >> team size; context switching |

### Waterfall Metrics

| Metric | What It Measures | Healthy Range | Warning Signs |
|--------|-----------------|--------------|---------------|
| SPI | Schedule Performance Index | 0.95-1.05 | <0.85 or >1.15 |
| CPI | Cost Performance Index | 0.95-1.05 | <0.85 or >1.15 |
| Defect Density | Defects per KLOC | <2.0 (industry average) | >3.0 |
| Rework Rate | % of work requiring rework | <10% | >20% |

### Health Metrics (Sustainability)

| Metric | What It Measures | Healthy Range | Warning Signs |
|--------|-----------------|--------------|---------------|
| Overtime hours | Sustainability | <5 hours/week average | >10 hours/week for 3+ weeks |
| Team satisfaction | Morale | 7+/10 average | <5/10 or declining trend |
| Voluntary turnover | Retention | <10% annual | >20% or key person departure |
| Learning time | Growth | ≥10% of work time | 0% (no time for learning) |
| Cognitive load | Mental capacity | Self-assessed manageable | Team reports overwhelm |

---

## 3. Health Check Models

### Spotify Squad Health Check (Adapted)

11 dimensions with traffic light (Blue/Amber/Red per APEX branding):

1. **Delivering value** — Are we producing valuable outcomes?
2. **Easy to release** — Is deployment painless?
3. **Fun** — Do we enjoy our work?
4. **Health of codebase** — Is our code maintainable?
5. **Learning** — Are we growing our skills?
6. **Mission** — Do we know and care about our mission?
7. **Pawns or players** — Do we control our destiny?
8. **Speed** — Can we deliver quickly when needed?
9. **Suitable process** — Does our process help (not hinder)?
10. **Support** — Do we help each other?
11. **Teamwork** — Do we work well together?

### Trend Analysis Framework

Track health check results over 5+ periods to identify:
- **Improving:** Dimension moved from Red/Amber to Amber/Blue
- **Stable:** Dimension unchanged for 3+ periods
- **Declining:** Dimension moved from Blue/Amber to Amber/Red
- **Volatile:** Dimension oscillating between colors

---

## 4. Burnout Detection

### Early Warning Signs

| Signal | Description | Response |
|--------|------------|----------|
| Quality decline | Previously reliable team member producing errors | 1:1 conversation, workload review |
| Disengagement | Reduced participation in ceremonies | Team retrospective, individual check-in |
| Overtime normalization | Overtime becomes expected, not exceptional | Reduce WIP, reassess sprint commitment |
| Cynicism increase | Negative attitude toward process and leadership | Team health retrospective, leadership review |
| Absenteeism spike | Increased sick days or mental health days | Confidential wellness check, workload review |

---

*PMO-APEX v1.0 — Body of Knowledge · Team Performance & Health Tracking*
