---
name: sofka-sap-change-adoption
author: JM Labs (Javier Montano)
description: >
  SAP organizational change management and adoption skill. Covers ADKAR framework
  adapted for SAP implementations, SAP Enable Now training design, super-user network,
  go-live readiness assessment, hypercare planning, and adoption metrics. Use when
  planning SAP change management, designing training programs, assessing organizational
  readiness, or planning hypercare periods.
  Trigger: SAP change management, SAP adoption, SAP training, SAP Enable Now, ADKAR
  for SAP, super-user network, go-live readiness, hypercare, SAP OCM.
argument-hint: "<phase-or-audience> [--focus awareness|training|readiness|hypercare]"
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - Agent
---

# SAP Organizational Change & Adoption

> "The system goes live on day one. Adoption takes six months. Plan for both."

## Purpose

Design and execute organizational change management for SAP implementations using ADKAR framework, SAP Enable Now, super-user networks, and structured readiness assessments. Ensure that go-live translates into sustained adoption.

## When to Use

- Planning change management for SAP implementation
- Designing training programs per user persona
- Building super-user networks
- Assessing go-live readiness
- Planning hypercare period and support structure
- Measuring adoption after go-live

---

## Table of Contents

1. [ADKAR for SAP Implementations](#1-adkar-for-sap-implementations)

> Deep knowledge: `references/body-of-knowledge.md`
> Skill dependencies: `references/knowledge-graph.mmd`
2. [Super-User Network Design](#2-super-user-network-design)
3. [Training Design per Persona](#3-training-design-per-persona)
4. [SAP Enable Now Reference](#4-sap-enable-now-reference)
5. [Go-Live Readiness Scorecard](#5-go-live-readiness-scorecard)
6. [Hypercare Protocol](#6-hypercare-protocol)
7. [Adoption Metrics](#7-adoption-metrics)

---

## 1. ADKAR for SAP Implementations

### Framework Application

| ADKAR Stage | SAP Context | Activities | Timing |
|-------------|-------------|-----------|--------|
| **Awareness** | Why are we moving to SAP? | Executive communication, town halls, FAQ | Discover/Prepare |
| **Desire** | What's in it for me? | Benefits workshops per role, success stories | Prepare/Explore |
| **Knowledge** | How do I use the new system? | Training programs, Enable Now, sandbox access | Explore/Realize |
| **Ability** | Can I do my job in SAP? | Hands-on practice, UAT participation, mentoring | Realize/Deploy |
| **Reinforcement** | How do we sustain adoption? | Adoption dashboards, recognition, feedback loops | Deploy/Run |

### ADKAR Assessment per Stakeholder Group

| Stakeholder Group | A | D | K | Ab | R | Overall | Action |
|------------------|---|---|---|----|----|---------|--------|
| Executive sponsors | H | H | M | M | M | Ready | Maintain engagement |
| Middle management | M | L | L | L | L | At risk | Focus on Desire + Knowledge |
| End users (finance) | M | M | L | L | L | At risk | Training priority |
| End users (projects) | L | M | M | L | L | At risk | Awareness + Training |
| IT team | H | H | H | M | M | Ready | Focus on Ability |

**Scale**: L=Low, M=Medium, H=High. Target all "M" or "H" before go-live.

---

## 2. Super-User Network Design

### Purpose
Super-users are trained power users who provide first-line support to their peers during and after go-live.

### Structure
| Role | Ratio | Responsibilities |
|------|-------|-----------------|
| **Super-User Lead** | 1 per module | Owns module-level support, escalates to consulting team |
| **Super-User** | 1 per 15-20 end users | First-line support, answer questions, report issues |
| **Floor Walker** | Temporary (go-live week) | Physical presence during go-live, hands-on help |

### Super-User Selection Criteria
- Respected by peers (influence)
- Process knowledge (understands the business)
- SAP aptitude (comfortable with technology)
- Available (can dedicate 20-30% time during go-live + hypercare)
- Positive attitude toward change

### Super-User Training Plan
| Phase | Content | Duration |
|-------|---------|----------|
| **Foundation** | SAP navigation, Fiori launchpad, core concepts | 1 day |
| **Module Deep-Dive** | Module-specific config, transactions, reports | 2-3 days |
| **Troubleshooting** | Common errors, workarounds, escalation paths | 1 day |
| **Teaching Skills** | How to explain to peers, demo techniques | Half day |
| **Rehearsal** | Mock support scenarios, role-playing | Half day |

---

## 3. Training Design per Persona

### Persona-Based Training Matrix

| Persona | Modules | Training Format | Duration | Priority |
|---------|---------|----------------|----------|----------|
| **Finance Analyst** | FI, CO | Instructor-led + Enable Now | 3 days | P1 |
| **Project Manager** | PS, SD | Instructor-led + sandbox exercises | 3 days | P1 |
| **Timesheet User** | HCM/CATS | Enable Now guide (5-step) | 30 min | P1 |
| **Billing Specialist** | SD, FI | Instructor-led + Enable Now | 2 days | P1 |
| **Controller** | CO, CO-PA | Instructor-led + reports workshop | 2 days | P2 |
| **IT Administrator** | Cross | Technical admin training | 2 days | P2 |
| **Executive** | Dashboards | 30-min overview + Enable Now | 30 min | P3 |

### Training Delivery Methods
| Method | When to Use | Effort |
|--------|-------------|--------|
| **Instructor-led** | Complex processes, new workflows | High |
| **Enable Now (guided)** | Step-by-step procedures in live system | Medium |
| **Video** | Awareness, executive overview | Low |
| **Sandbox exercise** | Hands-on practice with test data | Medium |
| **Quick reference card** | Daily cheat sheets per role | Low |

---

## 4. SAP Enable Now Reference

### Content Types
| Type | Description | Use Case |
|------|-------------|----------|
| **Guided Tour** | Step-by-step overlay in live Fiori app | New user onboarding |
| **Simulation** | Practice mode (safe to make mistakes) | Training before go-live |
| **Documentation** | Auto-generated process docs with screenshots | Reference material |
| **In-App Help** | Context-sensitive help within Fiori | Just-in-time support |
| **Knowledge Quiz** | Assessment of learning outcomes | Training validation |

### Enable Now Authoring Best Practices
1. Record in production-like system (not development)
2. Use generic test data (no real employee/client names)
3. One recording per task (keep short: 5-15 steps)
4. Include decision points ("If X, then click Y")
5. Review with super-users before publishing
6. Update after every SAP quarterly update

---

## 5. Go-Live Readiness Scorecard

| # | Dimension | Weight | Score (1-5) | Weighted |
|---|-----------|--------|-------------|----------|
| 1 | Executive sponsorship active | 15% | | |
| 2 | Super-user network trained | 15% | | |
| 3 | End-user training completed (>= 90%) | 15% | | |
| 4 | UAT passed (>= 95%) | 10% | | |
| 5 | Data migration validated | 10% | | |
| 6 | Integration tests passed | 10% | | |
| 7 | Communication plan executed | 5% | | |
| 8 | Hypercare team staffed | 10% | | |
| 9 | Rollback plan tested | 5% | | |
| 10 | ADKAR assessment >= Medium across all groups | 5% | | |
| | **Total (weighted sum)** | 100% | | **{score}** |

**Decision**: >= 70% = Go | 50-69% = Conditional Go (with mitigations) | < 50% = No-Go

---

## 6. Hypercare Protocol

### Duration
- **Standard**: 4-6 weeks post-go-live
- **Extended**: 8-12 weeks (for complex, multi-module, multi-country)

### Support Structure
| Level | Response Time | Channel | Team |
|-------|-------------|---------|------|
| **L0: Self-service** | Immediate | Enable Now in-app help | — |
| **L1: Super-user** | < 2 hours | Slack/Teams channel | Super-users |
| **L2: Functional** | < 4 hours | Ticketing system | Consulting team |
| **L3: Technical** | < 8 hours | Escalation | SAP Basis / Dev team |

### Hypercare Exit Criteria
| Criterion | Target |
|-----------|--------|
| Open critical tickets | 0 |
| Open high-priority tickets | < 5 |
| User satisfaction survey | >= 3.5/5 |
| Super-user confidence score | >= 4/5 |
| Weekly ticket volume trend | Declining for 2+ weeks |
| Process workarounds active | <= 3 (with improvement plans) |

---

## 7. Adoption Metrics

### Dashboard Metrics (Post Go-Live)

| Metric | Measurement | Target (Month 3) | Target (Month 6) |
|--------|------------|-------------------|-------------------|
| **Login rate** | Unique users / total users (weekly) | >= 80% | >= 90% |
| **Transaction volume** | Key transactions per day | >= 90% of projected | >= 100% |
| **Support tickets** | New tickets per week | Declining trend | < 5/week |
| **Enable Now usage** | Guided tour completions | Stable | Declining (users know the system) |
| **Process compliance** | % transactions following standard process | >= 85% | >= 95% |
| **User satisfaction** | NPS or satisfaction survey | >= 3.5/5 | >= 4.0/5 |

### Adoption Risk Signals
| Signal | Action |
|--------|--------|
| Login rate < 60% after Month 1 | Investigate — are users avoiding SAP? |
| Support tickets increasing | Root cause analysis — training gap or system issue? |
| Workarounds growing | Change management intervention |
| NPS < 3.0 | Executive escalation + focused improvement sprint |

---

## Quality Criteria

1. ADKAR assessment completed per stakeholder group
2. Super-user network designed with selection criteria and training plan
3. Training matrix covers all personas with appropriate delivery methods
4. Go-live readiness scorecard completed with weighted scoring
5. Hypercare protocol defined with escalation levels and exit criteria
6. Adoption metrics dashboard designed with targets at Month 3 and Month 6

## Anti-Patterns

1. **Training as afterthought** — Start change management in Prepare, not Deploy
2. **One training for all** — Different personas need different depth and format
3. **No super-users** — Without peer support, L2 team is overwhelmed at go-live
4. **Hypercare too short** — 2 weeks is insufficient; plan for minimum 4-6 weeks
5. **No adoption metrics** — If you don't measure adoption, you can't improve it

## Cross-References

- **sofka-sap-discovery**: Change management scoped during discovery
- **sofka-sap-activate-methodology**: Change management spans Explore through Run
- **sofka-sap-testing-validation**: UAT and training are interdependent
- **change-readiness-assessment**: SDF change readiness skill (non-SAP specific)
- **adoption-strategy**: SDF adoption strategy patterns
