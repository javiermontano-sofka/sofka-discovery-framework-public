# SAP Change Management & Adoption — Body of Knowledge

## 1. ADKAR Framework for SAP

ADKAR (Awareness, Desire, Knowledge, Ability, Reinforcement) is the primary framework for individual change management in SAP implementations.

### SAP-Specific Application

| Stage | SAP Context | Key Activities | Timing |
|-------|-------------|---------------|--------|
| **Awareness** | Why SAP? Why now? | Executive comms, town halls, FAQ | Discover/Prepare |
| **Desire** | What's in it for each role? | Benefits workshops, success stories | Prepare/Explore |
| **Knowledge** | How to use the new system | Training, Enable Now, sandbox | Explore/Realize |
| **Ability** | Can I do my daily work? | Hands-on practice, UAT, mentoring | Realize/Deploy |
| **Reinforcement** | Sustained adoption | Dashboards, recognition, feedback | Deploy/Run |

### Assessment Scale
- **H (High)**: Stage fully addressed, stakeholder group ready
- **M (Medium)**: Partially addressed, some gaps remain
- **L (Low)**: Not addressed, significant risk

**Target**: All stakeholder groups at "M" or "H" across all 5 stages before go-live.

---

## 2. Super-User Network

### Purpose
Trained power users who provide first-line support to peers during and after go-live.

### Structure

| Role | Ratio | Time Commitment |
|------|-------|----------------|
| Super-User Lead | 1 per module | 30-40% during go-live + hypercare |
| Super-User | 1 per 15-20 end users | 20-30% during go-live + hypercare |
| Floor Walker | Temporary (go-live week) | 100% during go-live week |

### Selection Criteria
1. Respected by peers (social influence)
2. Strong process knowledge
3. Technology aptitude
4. Available for training and support commitment
5. Positive attitude toward change

### Training Curriculum (5 days total)

| Day | Content |
|-----|---------|
| 1 | SAP navigation, Fiori launchpad, core concepts |
| 2-3 | Module-specific deep dive (config, transactions, reports) |
| 4 | Troubleshooting, common errors, escalation paths |
| 4.5 | Teaching skills — how to explain to peers |
| 5 | Mock support scenarios, role-playing |

---

## 3. Training Design

### Persona-Based Approach

| Persona | Modules | Format | Duration | Priority |
|---------|---------|--------|----------|----------|
| Finance Analyst | FI, CO | Instructor-led + Enable Now | 3 days | P1 |
| Project Manager | PS, SD | Instructor-led + sandbox | 3 days | P1 |
| Timesheet User | HCM/CATS | Enable Now guide (5 steps) | 30 min | P1 |
| Billing Specialist | SD, FI | Instructor-led + Enable Now | 2 days | P1 |
| Controller | CO, CO-PA | Instructor-led + reports workshop | 2 days | P2 |
| IT Administrator | Cross-module | Technical admin training | 2 days | P2 |
| Executive | Dashboards | 30-min overview | 30 min | P3 |

### Delivery Methods

| Method | Best For | Effort |
|--------|----------|--------|
| Instructor-led | Complex processes, new workflows | High |
| Enable Now (guided) | Step-by-step procedures in live system | Medium |
| Video | Awareness, executive overview | Low |
| Sandbox exercise | Hands-on practice with test data | Medium |
| Quick reference card | Daily cheat sheets per role | Low |

---

## 4. SAP Enable Now

### Content Types

| Type | Description | Use Case |
|------|-------------|----------|
| Guided Tour | Step-by-step overlay in live Fiori app | New user onboarding |
| Simulation | Practice mode (safe mistakes) | Pre-go-live training |
| Documentation | Auto-generated process docs with screenshots | Reference material |
| In-App Help | Context-sensitive help within Fiori | Just-in-time support |
| Knowledge Quiz | Assessment of learning outcomes | Training validation |

### Authoring Best Practices
1. Record in production-like system (not development)
2. Use generic test data (no real names)
3. One recording per task (5-15 steps)
4. Include decision points
5. Review with super-users before publishing
6. Update after every SAP quarterly update

---

## 5. Go-Live Readiness

### Scorecard (10 Dimensions, Weighted)

| # | Dimension | Weight |
|---|-----------|--------|
| 1 | Executive sponsorship active | 15% |
| 2 | Super-user network trained | 15% |
| 3 | End-user training completed (>= 90%) | 15% |
| 4 | UAT passed (>= 95%) | 10% |
| 5 | Data migration validated | 10% |
| 6 | Integration tests passed | 10% |
| 7 | Communication plan executed | 5% |
| 8 | Hypercare team staffed | 10% |
| 9 | Rollback plan tested | 5% |
| 10 | ADKAR assessment >= M all groups | 5% |

**Decision**: >= 70% = Go | 50-69% = Conditional Go | < 50% = No-Go

---

## 6. Hypercare Protocol

### Duration
- Standard: 4-6 weeks post-go-live
- Extended: 8-12 weeks (complex, multi-country)

### Support Levels

| Level | Response | Channel | Team |
|-------|----------|---------|------|
| L0 | Immediate | Enable Now in-app help | Self-service |
| L1 | < 2 hours | Slack/Teams | Super-users |
| L2 | < 4 hours | Ticketing system | Consulting team |
| L3 | < 8 hours | Escalation | SAP Basis / Dev |

### Exit Criteria
- 0 open critical tickets
- < 5 open high-priority tickets
- User satisfaction >= 3.5/5
- Super-user confidence >= 4/5
- Weekly ticket volume declining for 2+ weeks
- Process workarounds <= 3 (with improvement plans)

---

## 7. Adoption Metrics

### Dashboard KPIs

| Metric | Month 1 Target | Month 3 Target | Month 6 Target |
|--------|---------------|----------------|----------------|
| Login rate | >= 70% | >= 80% | >= 90% |
| Transaction volume | >= 80% projected | >= 90% | >= 100% |
| Support tickets/week | Declining trend | < 10/week | < 5/week |
| Process compliance | >= 75% | >= 85% | >= 95% |
| User satisfaction (NPS) | >= 3.0/5 | >= 3.5/5 | >= 4.0/5 |

### Risk Signals
- Login rate < 60% after Month 1 → investigate avoidance
- Tickets increasing → root cause analysis
- Workarounds growing → change management intervention
- NPS < 3.0 → executive escalation

---

*Reference derived from 39 deep-researched sources in NotebookLM notebook `SAP Change Management & Enable Now`.*
*Author: JM Labs (Javier Montano).*
