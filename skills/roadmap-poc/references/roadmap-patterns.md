# Roadmap & PoC Patterns Reference

Templates and patterns for sofka-roadmap-poc skill deliverables.

## Prerequisites Validation Table Template

HTML-ready prerequisites table with status chips, deadline tracking, and critical path indicators:

```markdown
| ID | Prerequisite | Description | Status | Owner | Deadline | Blocker | Delay Impact |
|:---|:---|:---|:---:|:---|:---|:---:|:---|
| P1 | VPN Access | Dev environment connectivity | ✅ Complete | IT Sponsor | 2026-03-10 | Yes | Timeline +5 days, Cost +$25K if missed |
| P2 | Source Code | Git repo & branch strategy | ⚠️ In Progress | Dev Lead | 2026-03-08 | Yes | Timeline +3 days, Cost +$15K if missed |
| P3 | API Specifications | Message tramas & contracts | ✅ Complete | Arch Team | 2026-03-05 | No | Workaround: use previous API version |
| P4 | Legacy Libraries | Required binary dependencies | 🔴 Blocked | Infrastructure | 2026-03-12 | Yes | Timeline +7 days, Cost +$35K if missed |
| P5 | Identity/LDAP | User provisioning & roles | ⚠️ In Progress | Security | 2026-03-11 | Yes | Timeline +4 days, Cost +$20K if missed |
| P6 | Tech Specs | Database schema, contracts | ✅ Complete | Tech Leads | 2026-03-05 | No | Workaround: proceed with preliminary schema |
| P7 | Hardware | Dev machines, test environment | ⚠️ In Progress | Procurement | 2026-03-15 | Yes | Timeline +6 days, Cost +$30K if missed |
| P8 | Security Audit | Pen testing & clearance | 🔴 Blocked | CISO | 2026-04-01 | Yes | Timeline +14 days, Cost +$70K if missed |
| P9 | Compliance | Regulatory requirements doc | ⏳ Not Started | Compliance | 2026-03-20 | Yes | Timeline +8 days, Cost +$40K if missed |
```

Status indicators and meaning:
- ✅ Complete: Ready to proceed
- ⚠️ In Progress: On track, ETA known
- 🔴 Blocked: Waiting on external dependency; escalation required
- ⏳ Not Started: Not yet initiated; high risk if Blocker=Yes

Blocker column: "Yes" if missing blocks Phase 1 start; "No" if can proceed with documented workaround

Delay Impact column: Quantifies cost of missing deadline to justify mitigation investment. Format: "Timeline +X days, Cost +$Y if missed"

## Kickoff Agenda Template

| Activity | Owner | Duration | Outcomes |
|:---|:---|:---:|:---|
| **AS-IS Context Session** | Tech Lead + Client PM | 2h | Current state documented, pain points captured, constraints identified |
| **Definition of Done Workshop** | Sofka Lead + Stakeholders | 1.5h | DoD document approved, acceptance criteria signed off, quality bar set |
| **Sofka Setup (parallel)** | Sofka Ops | 3h | VPN/network access granted, dev workspace ready, tools installed |
| **Client Provisioning (parallel)** | Client IT | 3h | Infrastructure provisioned, data access granted, executive sponsorship confirmed |

## Sprint Breakdown Card Template — Daily Grid

### Sprint N: [Theme Name] — Weeks X-Y

**Target Feature/Capability:** [Clear description of what Sprint produces and measurable success criteria]

**Daily Breakdown — Capacity Planning:**

| Days | Activities | Owner | Hours | Deliverable | Done Criteria |
|:---|:---|:---|:---:|:---|:---|
| 1-2 | [Task A: verb-noun format] + [Task B] | [Role, not name] | 12h | [Concrete artifact] | Reviewed, code merged, tests passing |
| 1-2 | [Task C] | [Role] | 8h | [Specific output] | Acceptance test passes |
| 3-4 | [Task D: Integration focus] + [Task E] | [Role] | 10h | [Integration artifact] | E2E test passing in staging |
| 3-4 | [Task F: Testing] | [QA Role] | 10h | [Test report] | ≥80% pass rate |
| 5 | Demo prep (no new development) | [Lead Role] | 4h | [Presentation + working feature] | Demo succeeds, UAT session scheduled |
| 5 | UAT session (stakeholder review) | [QA Role] | 4h | [UAT sign-off] | Stakeholder approval documented |

**Capacity Summary:** [X] engineers × 5 days × 6 productive hours/day = [Y] total hours available; [Z]% allocated

**Deliverables Checklist (with acceptance criteria):**
- [ ] Deliverable 1 — Done when: [specific test passes, artifact reviewed, stakeholder approves]
- [ ] Deliverable 2 — Done when: [measurable success criteria]
- [ ] Deliverable 3 — Done when: [acceptance test passes]
- [ ] Deliverable 4 — Done when: [peer review approved, coverage >80%]
- [ ] Deliverable 5 — Done when: [UAT sign-off obtained]

**Dependencies:** [Which tasks must complete before Day 3] — Critical path marked with ★
**Risks:** [Known blockers for this sprint with mitigation]

**Sign-Off Authority:** [Tech Lead name] + [QA Lead name] must approve before proceeding to next sprint

## Gate Criteria Checklist — With Risk Evaluation

### Gate N→M: [Gate Name]

**Decision Point:** [What decision is being made? e.g., "Proceed to Sprint 2 or execute remediation"]

**Gate Criteria with Evaluation:**
| # | Criterion | PASS | FAIL | CONDITIONAL | Evidence | Approver |
|:---|:---|:---:|:---:|:---:|:---|:---|
| 1 | [Criterion A — measurable] | ☐ | ☐ | ☐ | [Artifact/test proving status] | [Approver role] |
| 2 | [Criterion B — testable] | ☐ | ☐ | ☐ | [Proof document] | [Approver role] |
| 3 | [Criterion C — reviewable] | ☐ | ☐ | ☐ | [Sign-off document] | [Approver role] |
| 4 | [Criterion D — auditable] | ☐ | ☐ | ☐ | [Test results] | [Approver role] |
| 5 | [Criterion E — verifiable] | ☐ | ☐ | ☐ | [Stakeholder approval] | [Approver role] |

**Conditional Criteria (if any):**
- Criterion [N] is CONDITIONAL because: [specific gap description]
  - Mitigation: [action to resolve] | Owner: [role] | ETA: [date]
  - Risk of proceeding: [impact if not fully met] | Approval: [stakeholder sign-off required]

**Go/No-Go Recommendation:**
- **GO** if: All PASS or all CONDITIONAL with documented mitigations and stakeholder approval
- **REMEDIATION REQUIRED** if: ≥1 FAIL criterion (document remediation sprint plan below)
- **ESCALATE** if: ≥2 FAIL criteria or budget impact >10% (requires steering committee review)

**Remediation Sprint Plan (if NO-GO):**
- Affected criteria: [List all FAIL items]
- Root causes: [5 Whys analysis]
- Remediation tasks: [Task list with owner, hours, deadline]
- Cost/timeline impact: [Delay days, $ cost]
- Re-gate review date: [When gate will be re-evaluated]
- Proceed authority: [Who approves after remediation]

**Gate Sign-Off:** [Tech Lead] + [QA Lead] + [Product Owner] must all approve before proceeding

## Timeline ASCII with Milestone Markers

```
┌─────────────────────────────────────────────────────────────────────────────┐
│ EXECUTION TIMELINE — [Project Name] — [Total duration: X weeks]             │
├─────────────────────────────────────────────────────────────────────────────┤
│ Week 0          │ Week 1-2        │ Week 3-4        │ Week 5-6   │ Week 7+ │
│ PRE-SERVICE     │ SPRINT 1        │ SPRINT 2        │ HARDENING  │ DEPLOY  │
│ & Onboarding    │ Foundation      │ Integration     │ & Optimize │ LIVE    │
│ ★ GO/NO-GO      │ ★ Demo Gate 1   │ ★ Gate 1→2      │ ★ Prod OK  │ ★ Live  │
│                 │                 │                 │            │         │
│ Kickoff ┼ Setup │ Dev ┼ Test ┼ UAT│ Integrate ┼ Prod│ Monitor ┼  │ Support │
│  Phase 0 Gate   │   Phase 1 Gate  │   Phase 2 Gate  │ Phase 3 Ok │ Phase 4 │
└─────────────────────────────────────────────────────────────────────────────┘

★ = Gate decision point (GO/NO-GO), must pass before advancing
Critical path: Phase 0 ★ → Phase 1 ★ → Phase 2 ★ → Phase 3 ★ → Production
Slack path: [Identify any non-critical activities that can slip without blocking delivery]

Milestone Details:
├─ Week 0 end: Gate 0→1 PASS/FAIL — Proceed to Sprint 1?
├─ Week 2 end: Gate 1→2 PASS/FAIL — Proceed to Sprint 2?
├─ Week 4 end: Gate 2→3 PASS/FAIL — Ready for production hardening?
├─ Week 6 end: Gate 3→4 PASS/FAIL — Ready for production deployment?
└─ Week 7+: Post-launch support & monitoring begin
```

Gantt-style representation with capacity indicators:
```
Activity                | W0  | W1  | W2  | W3  | W4  | W5  | W6  |
Pre-Service Kickoff     |═══  |     |     |     |     |     |     |  [Gate 0]
Sprint 1 (Team: N eng)  |     |═════════  |     |     |     |     |  [Gate 1]
Sprint 2 (Team: M eng)  |     |     |═════════  |     |     |     |  [Gate 2]
Hardening (Team: L eng) |     |     |     |═════════  |     |     |  [Gate 3]
Deploy Prep             |     |     |     |     |═══  |     |     |
Prod Support Ready      |     |     |     |     |     |═════════   |
```

Dependencies: [List critical path items, e.g., "Sprint 1 blocks Sprint 2 start", "Gate 1 approval required before Day 15"]

## Parallel Setup Grid Template

```
┌──────────────────────────────┬──────────────────────────────┐
│ SOFKA SETUP (Internal)       │ CLIENT SETUP (External)      │
├──────────────────────────────┼──────────────────────────────┤
│ • VPN/Network access         │ • Infrastructure provisioning│
│ • Dev workspace setup        │ • Executive sponsorship      │
│ • Dev tools installation     │ • Data access & backup       │
│ • Team onboarding program    │ • Regulatory approvals       │
│ • Communication channels     │ • Support team briefing      │
│ • Knowledge base access      │ • User provisioning          │
│ • CI/CD pipeline access      │ • Compliance sign-off        │
└──────────────────────────────┴──────────────────────────────┘
```

## Risk Register Template

| ID | Risk | Probability | Impact | Mitigation | Owner | Status |
|:---|:---|:---:|:---:|:---|:---|:---|
| R1 | [Risk description] | High | High | [Mitigation plan] | [Owner] | Active |
| R2 | [Risk description] | Medium | High | [Mitigation plan] | [Owner] | Active |
| R3 | [Risk description] | High | Medium | [Mitigation plan] | [Owner] | Monitoring |
| R4 | [Risk description] | Medium | Medium | [Mitigation plan] | [Owner] | Monitoring |
| R5 | [Risk description] | Low | High | [Mitigation plan] | [Owner] | Accepted |

Probability scale: Low | Medium | High
Impact scale: Low (3) | Medium (5) | High (8)
Risk score = Probability × Impact

## Team Composition Card Template

```
TEAM STRUCTURE

Sofka Contribution
├─ [N] senior engineers @ [cost/month]
├─ [M] mid-level engineers @ [cost/month]
├─ [K] QA specialists @ [cost/month]
├─ [L] Tech lead @ [cost/month]
└─ Total Sofka FTE: [X] (cost: $[Total/month])

Client Contribution
├─ [A] subject matter experts (dedicated)
├─ [B] infrastructure resources (part-time)
├─ [C] QA/UAT resources (dedicated)
├─ [D] product owner/sponsor (part-time)
└─ Total Client FTE: [Y] (internal cost)

Leads
├─ Project Lead: [Name, Sofka]
├─ Tech Lead: [Name, Sofka]
├─ Product Owner: [Name, Client]
└─ QA Lead: [Name, Sofka/Client]

Governance
├─ Steering Committee: [Frequency]
├─ Tech Reviewers: [Frequency]
├─ Status cadence: Daily standup, weekly review
└─ Escalation path: [Names, titles]
```

## Budget Range Card Template

```
INVESTMENT SUMMARY

Sofka Services
├─ Engineering labor (senior/mid): $[X]
├─ QA & testing: $[Y]
├─ Project management: $[Z]
└─ Subtotal: $[Services]

Infrastructure & Tools
├─ Cloud compute/services: $[A]
├─ Dev tools & licenses: $[B]
├─ Infrastructure setup: $[C]
└─ Subtotal: $[Infrastructure]

Other Costs
├─ Training & knowledge transfer: $[D]
├─ Travel & meetings: $[E]
└─ Subtotal: $[Other]

Contingency (15%): $[Contingency]

TOTAL INVESTMENT: $[Total]
Monthly burn rate: $[/month]
Investment period: [Months]

Funding gates:
├─ Gate 0: Approve $[Phase 1 budget] (Week 0)
├─ Gate 1: Approve $[Phase 2 budget] (Week 2)
└─ Gate 2: Approve remaining (Week 4)
```

## HTML Generation Checklist

When converting roadmap to HTML:

- [ ] Hero section with project name, timeline overview, key milestones
- [ ] Pre-Service section with formatted kickoff agenda table
- [ ] Parallel setup cards clearly separating Sofka vs Client responsibilities
- [ ] Prerequisites table with:
  - Color-coded status chips (green/yellow/red/gray)
  - Owner names and deadlines
  - Blocker flag column highlighted for blocking items
- [ ] Sprint 1 & 2 sections with:
  - Daily breakdown table
  - Deliverables as interactive checkboxes
  - Acceptance criteria for each deliverable
- [ ] Timeline visualization (ASCII art or Gantt chart)
- [ ] 3-stage Gate criteria sections with clear go/no-go conditions
- [ ] Risk register table with sorting by probability/impact
- [ ] Team composition card with FTE breakdown
- [ ] Budget card with cost breakdown and burn rate
- [ ] Responsive design (tables scroll horizontally on mobile)
- [ ] Print-friendly styles (no background colors, clear text)
- [ ] Footer with metadata (generated date, version, approvers)
