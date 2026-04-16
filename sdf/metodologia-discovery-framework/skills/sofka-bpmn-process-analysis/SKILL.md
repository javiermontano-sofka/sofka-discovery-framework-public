---
name: sofka-bpmn-process-analysis
author: JM Labs (Javier Montano)
description: >
  BPMN 2.0 process modeling and analysis skill for AS-IS/TO-BE business process
  documentation, bottleneck identification, automation opportunity assessment, process
  maturity scoring, and process improvement design. Use whenever the user mentions
  process mapping, BPMN, business process, process flow, swimlane, AS-IS process,
  TO-BE process, process improvement, operational workflow, delivery monitoring, process
  maturity, or needs to model how work flows through an organization. Especially relevant
  for SAP fit-to-standard workshops, IT services company operations, and service variant
  analysis. Also trigger for RACI assignment, automation ROI, or compliance audit trail.
  Trigger: BPMN, process mapping, AS-IS TO-BE, process flow, swimlane, process maturity,
  automation ROI, RACI, fit-to-standard, process improvement, operational workflow.
argument-hint: "<process-name-or-area> [--mode asis|tobe|fts]"
allowed-tools:
  - Read
  - Write
  - Glob
  - Grep
  - Bash
  - Agent
---

# BPMN Process Analysis & Modeling Skill

> "A process you can't see is a process you can't improve."

## Purpose

Model, analyze, and improve business processes using BPMN 2.0 notation. Delivers AS-IS documentation with pain points, TO-BE design with automation opportunities, process maturity scoring, automation ROI, and SAP fit-to-standard alignment. Produces HTML deliverables with Sofka branding.

## When to Use

- Documenting AS-IS business processes
- Designing TO-BE improved processes
- Conducting SAP fit-to-standard workshops
- Analyzing operational bottlenecks in IT services
- Creating process improvement proposals with ROI
- Assessing process maturity levels
- Designing RACI assignments per step
- Building compliance/audit trail documentation

---

## Table of Contents

1. [BPMN 2.0 Element Catalog](#bpmn-20-element-catalog)
2. [AS-IS Modeling Framework](#as-is-modeling-framework)
3. [TO-BE Modeling Framework](#to-be-modeling-framework)
4. [IT Services Process Patterns](#it-services-process-patterns)
5. [SAP Fit-to-Standard](#sap-fit-to-standard-alignment)
6. [Visualization](#html-visualization-approach)
7. [Deliverable Structure](#deliverable-structure)

> For project-specific variants, RACI templates, maturity model, compliance: `references/henka-process-variants.md`

---

## BPMN 2.0 Element Catalog

### Containers
- **Pool**: Top-level participant. Separate pools per external entity.
- **Lane**: Role/department subdivision within a pool.

### Activities
- **User Task**: Manual human activity. Name: Verb + Object ("Approve Timesheet")
- **Service Task**: Automated operation. SAP transactions, API calls.
- **Script Task**: Automated logic without external call.
- **Manual Task**: Physical work, not automatable.
- **Subprocess**: Collapsed (+) for reusable; Expanded for inline.

### Gateways
- **Exclusive (XOR)**: ONE path. IF/THEN/ELSE.
- **Parallel (AND)**: ALL paths simultaneously.
- **Inclusive (OR)**: One or MORE paths.
- **Event-Based**: Race condition: whichever event first.

### Events
- **Start**: None, Message, Timer, Signal, Conditional, Error
- **Intermediate**: Message, Timer, Signal, Error, Escalation
- **End**: None, Message, Error, Cancel, Terminate, Signal

### Flows
- **Sequence Flow**: Solid arrows (within pool)
- **Message Flow**: Dashed arrows (between pools)
- **Association**: Dotted lines (data to tasks)

---

## AS-IS Modeling Framework

### Discovery Methodology
1. **Interview actual performers** (not management assumptions)
2. Document exception flows and workarounds
3. Note manual handoffs between systems
4. Identify redundant approvals
5. Track waiting periods and batching delays
6. Use process mining data if available

### Capture Per Process Step
| Attribute | Description |
|-----------|-------------|
| Actor | Role (not person name) |
| Action | Verb + object |
| System | Tool/system used |
| Input/Output | Data consumed/produced |
| Duration | Active work time |
| Wait Time | Queue time before step |
| Exceptions | What can go wrong |
| Pain Points | Friction, workarounds |

### RACI Per Step
| Role | Definition | Rule |
|------|-----------|------|
| **R** (Responsible) | Performs the work | Exactly 1 |
| **A** (Accountable) | Owns the outcome | Exactly 1 |
| **C** (Consulted) | Input before execution | 0+ |
| **I** (Informed) | Notified after | 0+ |

### Pain Point Classification
| Category | Description | Visual |
|----------|-------------|--------|
| Bottleneck | High wait time, queues | Red border |
| Manual Workaround | Process outside system | Orange border |
| Data Quality | Errors, rework | Yellow border |
| Dependency | External wait | Blue border |
| Knowledge Gap | Tribal knowledge | Violet border |

---

## TO-BE Modeling Framework

### Improvement Categories
1. **Automation**: Manual → service tasks (SAP workflow, API)
2. **Elimination**: Remove non-value-added steps
3. **Parallelization**: Sequential → parallel where possible
4. **Standardization**: Unify variants with parameterization
5. **Digitization**: Paper/email → system-based (Fiori, self-service)
6. **Monitoring**: Add dashboards, KPIs, alerts

### Process Metrics
| Metric | Formula | Target |
|--------|---------|--------|
| Cycle Time | End - Start | Minimize |
| Throughput | Completed / Period | Maximize |
| Wait Time | Total - Active | Minimize |
| Rework Rate | Corrections / Total | Minimize |
| Automation Rate | Automated / Total steps | Maximize |
| First-Pass Yield | Correct first / Total | Maximize |
| Utilization | Billable / Available hrs | 75-85% |

### Automation ROI Template
```
Annual Manual Cost = (Hours/month x 12) x Hourly Rate
Automation Dev Cost = One-time build + test
Annual Maintenance = ~15-20% of dev cost
Annual Savings = Manual Cost - Maintenance
ROI = Savings / Dev Cost x 100%
Payback = Dev Cost / (Savings - Maintenance)
```

---

## IT Services Process Patterns

### Pattern 1: Resource Allocation
```
START -> [Assess Requirements] -> [Check Availability]
  -> XOR{Available?}
    YES -> [Allocate] -> [Update Metrics] -> END
    NO -> XOR{Priority?} HIGH -> [Override/Hire] | MEDIUM -> [Queue]
```

### Pattern 2: Project Lifecycle (E2E)
```
START -> [Create Client] -> [Legal Validate] -> [Master Data]
  -> [Create Project+SD] -> [Assign Resources] -> [Monthly Cycle]
  -> PARALLEL{[Hours], [Novelties], [Forecasts]}
  -> [Validate] -> [Invoice] -> [Close Period] -> END
```

### Pattern 3: Billing Cycle
```
START -> [Collect Timesheets] -> [Validate]
  -> XOR{Valid?} NO -> [Correct] YES -> [Calculate Billable]
  -> [Apply Rates] -> [FX if cross-border] -> [Create Invoice]
  -> [Approval] -> [Send] -> [Post AR] -> END
```

### Pattern 4: Timesheet Approval
```
START -> [Submit] -> [Auto Validation]
  -> XOR{Valid?} NO -> [Return] YES -> [PM Approval]
  -> XOR{Approved?} REJECT -> [Return] APPROVE -> [Financial check]
  -> PARALLEL{[Payroll], [Billing], [Profitability]} -> END
```

---

## Process Maturity Model

| Level | Name | Characteristics |
|-------|------|----------------|
| 1 | **Ad-hoc** | Undocumented, person-dependent, tribal knowledge |
| 2 | **Documented** | AS-IS captured but not standardized |
| 3 | **Standardized** | Single process across GEOs, parameterized |
| 4 | **Measured** | KPIs tracked, SLAs defined, dashboards |
| 5 | **Optimized** | Continuous improvement, process mining |

---

## SAP Fit-to-Standard Alignment

### BPMN-to-SAP Module Mapping
| BPMN Lane | SAP Module | Key Apps |
|-----------|-----------|----------|
| Resource Mgmt | PS/HCM | Timesheet, Resource Planning |
| Cost Control | CO | Activity Types, Cost Centers |
| Sales & Billing | SD | Sales Orders, Billing Docs |
| Revenue Rec | FI-RA | Scope 1IL |
| Project Mgmt | PS | WBS Elements |
| Intercompany | FI/CO | Scope 1GP/40Y |

### Gap Decision Tree
```
SAP standard covers 80%+?
|-- YES: Config? -> Configure. Key User Ext? -> Extend.
|       Process change OK? -> Workaround. Else -> Custom (escalate).
|-- NO: Critical? -> Hybrid. Not critical? -> Defer.
```

---

## HTML Visualization Approach

### Mermaid — Sofka Brand
```javascript
%%{init: {'theme': 'base', 'themeVariables': {
  'primaryColor': '#FF7E08', 'primaryTextColor': '#000000',
  'primaryBorderColor': '#CC6506', 'lineColor': '#333130',
  'secondaryColor': '#EFEAE4', 'tertiaryColor': '#FAF8F6',
  'fontFamily': 'Inter, system-ui, sans-serif'
}}}%%
```

### Mermaid — Neutral
```javascript
%%{init: {'theme': 'neutral'}}%%
```

---

## Deliverable Structure

### AS-IS: `XX_Analisis_Proceso_ASIS_Deep.html`
1. Executive Dashboard: Scope, pain points
2. Process Inventory with maturity scores
3. BPMN diagrams with annotations
4. RACI per step
5. Pain Point Registry
6. Metrics Baseline
7. Recommendations with ROI

### TO-BE: `XX_Analisis_Proceso_TOBE_Deep.html`
1. Improvement summary, projected ROI
2. Optimized BPMN with change annotations
3. Service variant flows (distinct per model)
4. SAP Alignment Matrix with gap scores
5. Metrics Targets vs baseline
6. Compliance Matrix
7. Change Impact Assessment

---

## Quality Criteria

1. All processes use BPMN 2.0 notation (pools, lanes, gateways, events)
2. Every step has: actor, action, system, input/output, duration, wait time
3. RACI assigned per step (exactly 1 R, exactly 1 A)
4. Pain points classified with business impact
5. Maturity scored per area with target levels
6. Automation ROI calculated per candidate
7. Service variants modeled as distinct flows (not exceptions)

## Anti-Patterns

1. **Happy path only** — Must include exceptions, errors, rework loops.
2. **Variants as exceptions** — Different service models are distinct flows, not edge cases.
3. **RACI without A** — Every step needs exactly one accountable person.
4. **Default Mermaid styling** — Always apply brand theme or neutral fallback.

## Edge Cases

1. **Per-account allocation files** — Staffing may use N files per client. Process flows must reflect this multiplicity.
2. **Broken milestone variant** — If milestones are forced to hours, model AS-IS as-is (broken), don't sanitize. TO-BE must show proper milestone flow.
3. **Cross-border billing** — Adds IC posting, FX, and TP documentation as distinct subprocess.

## Cross-References

- **sofka-sap-implementation**: Module config, gap scoring, integration architecture
- **sofka-regional-finance**: CTC rates for ROI, compliance requirements
