# Methodology Playbook — Body of Knowledge

> PMO-APEX Skill Reference | Domain: Methodology Operationalization | Last updated: 2026-03-17

---

## 1. Ceremony Design Standards

### Scrum Ceremonies
| Ceremony | Duration (team 7) | Frequency | Key Output |
|----------|:---:|:---:|---|
| Sprint Planning | 2-4h | Per sprint | Sprint backlog + sprint goal [DOC] |
| Daily Standup | 15 min | Daily | Impediment list, plan for day [DOC] |
| Sprint Review | 1-2h | Per sprint | Increment feedback, backlog updates [DOC] |
| Sprint Retrospective | 1-1.5h | Per sprint | Improvement actions for next sprint [DOC] |
| Backlog Refinement | 1-2h | Weekly | Refined PBIs for upcoming sprints [DOC] |

### Waterfall Ceremonies
| Ceremony | Duration | Frequency | Key Output |
|----------|:---:|:---:|---|
| Phase Gate Review | 2-4h | Per phase | Go/no-go decision [DECISION] |
| Status Meeting | 1h | Weekly | Status report, issue log updates [DOC] |
| Steering Committee | 2h | Monthly | Strategic decisions, escalations [DECISION] |
| Change Control Board | 1h | As needed | Change request disposition [DECISION] |

---

## 2. Definition of Done Framework

### DoD Levels
| Level | Scope | Example Criteria |
|-------|-------|-----------------|
| Story/Task | Individual work item | Code complete, tested, reviewed, documented [PLAN] |
| Feature/Epic | Business capability | Integrated, UAT passed, stakeholder accepted [PLAN] |
| Sprint/Iteration | Time-box | All committed items Done, increment deployable [PLAN] |
| Release/Phase | Delivery milestone | Non-functional requirements met, compliance verified [PLAN] |

---

## 3. Cadence Calendar Design

### Meeting Load Guidelines
- Total ceremony time should not exceed 20% of team capacity [PLAN]
- Buffer 15% for ad-hoc collaboration [PLAN]
- Protect focus time blocks (minimum 2h uninterrupted) [PLAN]
- Avoid Monday and Friday for major ceremonies [SCHEDULE]

---

## 4. Adaptation Rules

| Trigger | Assessment | Action |
|---------|-----------|--------|
| Team feedback in retro | Ceremony not adding value | Modify format or reduce frequency [PLAN] |
| Team exceeds 12 people | Ceremony effectiveness drops | Split into sub-teams with sync [PLAN] |
| Remote team challenges | Low engagement in ceremonies | Add async components, shorter syncs [PLAN] |
| Methodology misalignment | Ceremonies feel wrong for work type | Re-assess methodology fit [PLAN] |

---

## 5. Integration Points

- **Upstream**: `methodology-assessment` provides the selected methodology [PLAN]
- **Downstream**: `ceremony-design` provides detailed ceremony facilitation guides [PLAN]
- **Cross-reference**: `kickoff-package` introduces methodology from playbook [PLAN]
- **Feedback**: `retrospective-engine` drives playbook adaptation [PLAN]

---

*PMO-APEX v1.0 — Body of Knowledge: Methodology Playbook*
