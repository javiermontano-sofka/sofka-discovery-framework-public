# Body of Knowledge — Project Health Check

## 1. Definition and Scope

A project health check is a systematic assessment of a project's current status across multiple dimensions — schedule, budget, scope, quality, team, stakeholders, and risks — to identify early warning signs and recommend corrective actions. Unlike status reporting (backward-looking), health checks are diagnostic and forward-looking. [DOC]

## 2. Foundational Frameworks

| Framework | Source | Key Contribution |
|-----------|--------|-----------------|
| PMBOK Monitoring & Controlling | PMI, 2021 | Earned value, variance analysis |
| PRINCE2 Health Check | AXELOS | Tolerance-based exception reporting |
| Agile Health Radar | Spotify, 2014 | Team-centric health dimensions |
| Project Audit Standards | ISO 19011 | Independent assessment methodology |
| Gateway Review Process | UK OGC | Stage-gate health assessments |

## 3. Health Dimensions

### 3.1 Schedule Health
- Schedule Performance Index (SPI) = EV / PV
- Critical path analysis and float consumption
- Milestone adherence rate
- Velocity trend (agile) [METRIC]

### 3.2 Budget Health
- Cost Performance Index (CPI) = EV / AC
- Budget burn rate vs. planned rate
- Estimate at Completion (EAC) variance
- Funding runway analysis [METRIC]

### 3.3 Scope Health
- Requirements stability index (changes per sprint)
- Scope creep indicators
- Acceptance criteria completeness
- Backlog health (groomed vs. ungroomed ratio) [PLAN]

### 3.4 Quality Health
- Defect density and trend
- Technical debt accumulation rate
- Test coverage and pass rates
- Customer satisfaction scores [METRIC]

### 3.5 Team Health
- Team morale and engagement
- Attrition and turnover risk
- Skills coverage gaps
- Collaboration effectiveness [STAKEHOLDER]

### 3.6 Stakeholder Health
- Stakeholder engagement level vs. plan
- Decision backlog (pending approvals)
- Communication effectiveness score
- Escalation frequency [STAKEHOLDER]

## 4. RAG Status Framework

| Color | Criteria | Action Required |
|-------|----------|----------------|
| Green | Within tolerance, on track | Continue monitoring |
| Amber | Approaching tolerance limits | Corrective action plan |
| Red | Outside tolerance | Escalation + recovery plan |
| Grey | Insufficient data to assess | Data collection required |

## 5. Health Check Methodologies

| Method | Approach | Frequency | Depth |
|--------|----------|-----------|-------|
| Self-Assessment | PM-led questionnaire | Weekly/Sprint | Shallow |
| Peer Review | Cross-PM evaluation | Monthly | Medium |
| Independent Audit | External assessor | Quarterly | Deep |
| Automated Dashboard | Tool-driven metrics | Continuous | Metric-focused |
| Stakeholder Survey | 360-degree feedback | Quarterly | Perception-focused |

## 6. Early Warning Indicators

| Indicator | Signal | Threshold |
|-----------|--------|-----------|
| SPI declining 3 consecutive periods | Schedule slippage trend | SPI < 0.90 |
| Team overtime > 20% for 2+ sprints | Burnout risk | Sustained >120% capacity |
| Stakeholder meeting cancellations | Disengagement | >2 consecutive misses |
| Defect reopen rate increasing | Quality degradation | >15% reopen rate |
| Scope change requests accelerating | Scope instability | >3 changes per sprint |

## 7. Health Check Report Structure

1. Executive Summary (RAG dashboard)
2. Dimension-by-dimension assessment
3. Trend analysis (improving/stable/declining)
4. Root cause analysis for Red/Amber items
5. Recommended corrective actions
6. Risks to future health
7. Decision points for steering committee [PLAN]

## 8. Tools and Techniques

- Earned Value Management (EVM) calculations
- Burndown/burnup charts with trend lines
- Risk heat maps with movement indicators
- Team health radar charts (Spotify model)
- Stakeholder engagement assessment matrix [METRIC]

## 9. Academic and Industry References

1. PMI. *A Guide to the Project Management Body of Knowledge* (7th Ed.), 2021
2. AXELOS. *PRINCE2 Health Check Approach*, 2017
3. Kniberg, H. & Ivarsson, A. *Scaling Agile @ Spotify*, 2012
4. OGC. *Gateway Review Process*, UK Government, 2007
5. Fleming, Q. & Koppelman, J. *Earned Value Project Management*, PMI, 2010
6. ISO. *ISO 19011 — Auditing Management Systems*, 2018
7. Stellman, A. & Greene, J. *Learning Agile*, O'Reilly, 2014

*PMO-APEX v1.0 — Body of Knowledge · Project Health Check*
