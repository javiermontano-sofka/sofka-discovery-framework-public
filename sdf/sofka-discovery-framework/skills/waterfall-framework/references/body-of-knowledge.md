# Body of Knowledge — Waterfall Framework Implementation

## 1. Definition and Scope

Waterfall framework implementation designs and deploys plan-driven project delivery structures within an organization. It establishes the stage-gate model, process group templates, governance cadence, WBS standards, earned value baselines, and change control mechanisms that form the operational backbone of predictive project management. [DOC]

## 2. Foundational Frameworks

| Framework | Source | Key Contribution |
|-----------|--------|-----------------|
| PMBOK 6th Edition (Process Groups) | PMI, 2017 | 5 process groups, 49 processes, ITTO structure |
| PMBOK 7th Edition (Principles) | PMI, 2021 | 12 principles + 8 performance domains |
| PRINCE2 | AXELOS | 7 themes, 7 processes, stage-gate governance |
| V-Model | German Federal Ministry | Verification-validation pairing per phase |
| Stage-Gate (Cooper) | Cooper, 1990 | Innovation-focused gate design |

## 3. Stage-Gate Architecture

| Gate | Name | Key Decision | Mandatory Artifacts |
|:----:|------|-------------|-------------------|
| G0 | Concept Screen | Is this worth exploring? | Business case draft [PLAN] |
| G1 | Business Case Approval | Invest in detailed planning? | Charter, preliminary scope [PLAN] |
| G1.5 | Planning Checkpoint | Is the plan realistic? | WBS, schedule, budget baseline [SCHEDULE] |
| G2 | Execution Readiness | Ready to execute? | Resource plan, risk register, baselines [PLAN] |
| G3 | Closure Approval | Complete and hand over? | Deliverable acceptance, lessons learned [METRIC] |

## 4. Process Group Templates

| Process Group | Key Templates | Tailoring Options |
|--------------|--------------|-------------------|
| Initiating | Charter, stakeholder register, assumption log | Light (1-page charter) vs. Full |
| Planning | WBS, schedule, budget, risk register, RACI | Scope: phase-level vs. work-package |
| Executing | Status report, change request, deliverable log | Frequency: weekly vs. bi-weekly |
| Monitoring & Controlling | EVM dashboard, variance report, forecast | Threshold-based vs. continuous |
| Closing | Lessons learned, acceptance sign-off, archive | Template vs. workshop format |

## 5. WBS Standards

| Level | Content | Numbering | Responsibility |
|:-----:|---------|-----------|---------------|
| 0 | Project name | 1.0 | Project sponsor |
| 1 | Phase/deliverable | 1.1 | Project manager |
| 2 | Work package | 1.1.1 | Work package owner |
| 3 | Activity | 1.1.1.1 | Team member |

**Rules:** Every work package must be estimable (8-80 hour rule), assignable to one owner, and traceable to a deliverable. 100% rule applies — WBS must capture all project scope. [PLAN]

## 6. Earned Value Baseline Setup

| Metric | Formula | Interpretation |
|--------|---------|---------------|
| PV (Planned Value) | Cumulative budget per schedule | What should have been spent |
| EV (Earned Value) | % complete × BAC | What was actually accomplished |
| AC (Actual Cost) | Real expenditure | What was actually spent |
| SPI | EV / PV | Schedule efficiency (target: 0.95-1.05) [METRIC] |
| CPI | EV / AC | Cost efficiency (target: 0.95-1.05) [METRIC] |
| EAC | BAC / CPI | Estimate at completion |

## 7. Tailoring Guidelines

| Project Size | Recommended Tailoring | Gate Model |
|-------------|----------------------|-----------|
| Small (<6 months, <5 FTE) | Lite templates, 3 gates (G1, G2, G3) | Simplified |
| Medium (6-18 months, 5-20 FTE) | Standard templates, 5 gates | Full |
| Large (>18 months, >20 FTE) | Full templates + sub-gates, 5+ gates | Extended with checkpoints |
| Regulated | Full + compliance artifacts | Extended with audit gates |

## 8. Academic and Industry References

1. PMI. *PMBOK Guide*, 6th/7th Edition, 2017/2021
2. AXELOS. *Managing Successful Projects with PRINCE2*, 2017
3. Cooper, R.G. *Winning at New Products*, Basic Books, 5th Ed, 2017
4. Royce, W.W. *Managing the Development of Large Software Systems*, IEEE, 1970
5. German Federal Ministry. *V-Modell XT*, 2005
6. Fleming, Q.W. & Koppelman, J.M. *Earned Value Project Management*, PMI, 2010
7. Wysocki, R.K. *Effective Project Management: Traditional, Agile, Extreme*, Wiley, 2019

*PMO-APEX v1.0 — Body of Knowledge · Waterfall Framework*
