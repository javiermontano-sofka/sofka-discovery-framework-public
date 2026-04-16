---
name: priming-rag-prince2
description: >
  RAG priming knowledge: PRINCE2 7th Edition — principles, themes, processes, tailoring, PRINCE2 Agile hybrid
type: priming-rag
domain: project-management
---

# PRINCE2 7th Edition — Core Knowledge Primer

> **Propósito RAG**: Este documento provee conocimiento de dominio para enriquecer el contexto del agente durante sesiones de gerencia de proyectos. No es un entregable — es material de referencia interno.

## PRINCE2 Overview

- **Full name**: PRojects IN Controlled Environments, 7th Edition (2023)
- **Owner**: PeopleCert (previously AXELOS)
- **Philosophy**: Business Case-driven, managed by exception, organized by management stages
- **Key differentiator**: Separates management stages from technical stages; focuses on governance

### PRINCE2 7th Edition Changes
- Refreshed language, more inclusive and modern
- Stronger emphasis on people, culture, and sustainability
- Better integration with agile and iterative approaches
- Updated practices (previously "themes") and processes
- Focus on digital transformation context

## Seven Principles

Principles are non-negotiable. If any principle is not applied, the project is not using PRINCE2.

| # | Principle | Implication |
|---|-----------|------------|
| 1 | Ensure continued business justification | Business Case reviewed at every stage gate; stop if no longer viable |
| 2 | Learn from experience | Lessons log maintained; lessons reports at stage and project close |
| 3 | Define roles and responsibilities | Clear accountability via Organization theme; no ambiguity |
| 4 | Manage by stages | Project divided into management stages with decision points |
| 5 | Manage by exception | Tolerances set at each level; escalate only when exceeded |
| 6 | Focus on products | Product-based planning; deliverables defined before activities |
| 7 | Tailor to suit the project | Framework adapted to size, complexity, importance, risk |

## Seven Practices (formerly Themes)

Practices are aspects of project management that must be addressed continuously throughout the project.

### 1. Business Case

| Element | Description |
|---------|------------|
| Purpose | Establish and maintain justification for the project |
| Key document | Business Case (outline → detailed → updated per stage) |
| Content | Reasons, options, benefits, dis-benefits, costs, timescales, risks |
| Accountability | Executive owns the Business Case |
| Review points | At each stage gate and when exceptions occur |

#### Benefits Management Approach
- Identifies benefits, dis-benefits, measurement methods
- Assigns benefit owners (often operational roles, not PM)
- Post-project reviews to confirm benefit realization

### 2. Organization

| Role | Responsibility | Level |
|------|---------------|-------|
| Corporate/Programme Management | Commission, set constraints | Above project |
| Project Board | Authorize stages, make decisions | Directing |
| Executive | Business Case owner, single point of accountability | Directing |
| Senior User | Specify user requirements, confirm acceptance | Directing |
| Senior Supplier | Provide resources, technical integrity | Directing |
| Project Manager | Day-to-day management within tolerances | Managing |
| Team Manager | Manage team delivery of Work Packages | Delivering |
| Project Assurance | Independent oversight (business, user, supplier) | Monitoring |
| Project Support | Administrative support, tools, methods | Support |
| Change Authority | Approve changes within delegated limits | Managing |

#### Management by Exception — Tolerance Levels
```
Corporate/Programme → sets PROJECT tolerances → Project Board
Project Board       → sets STAGE tolerances   → Project Manager
Project Manager     → sets WORK PACKAGE tolerances → Team Manager
```

Tolerance dimensions: Time, Cost, Scope, Quality, Risk, Benefits

### 3. Quality

| Concept | Definition |
|---------|-----------|
| Quality Planning | Define quality expectations, acceptance criteria, quality methods |
| Quality Control | Verify products meet criteria (testing, inspection, review) |
| Quality Assurance | Independent check that processes are followed |
| Product Description | Defines each product: purpose, composition, quality criteria, quality method |

#### Quality Review Technique
- **Roles**: Chair, Presenter, Reviewer, Administrator
- **Steps**: Prepare → Review → Follow-up → Sign-off
- **Focus**: Does the product meet its quality criteria?

### 4. Plans

Three levels of plans in PRINCE2:

| Plan Level | Created By | Authorized By | Scope |
|-----------|-----------|---------------|-------|
| Project Plan | Project Manager | Project Board | Entire project (high-level) |
| Stage Plan | Project Manager | Project Board | Current management stage (detailed) |
| Team Plan | Team Manager | Project Manager | Work Package delivery (optional) |
| Exception Plan | Project Manager | Project Board | Replaces current Stage Plan when tolerances exceeded |

#### Product-Based Planning Steps
1. Write the Project Product Description
2. Create the Product Breakdown Structure (PBS)
3. Write Product Descriptions for each product
4. Create the Product Flow Diagram (sequence and dependencies)
5. Derive activities and estimates from the product flow

### 5. Risk

| Step | Activities |
|------|-----------|
| Identify | Risk register, risk description (cause-event-effect), categories |
| Assess | Probability, impact, proximity, expected value |
| Plan | Select response: avoid, reduce, transfer, accept, share (opportunity: exploit, enhance, share, reject) |
| Implement | Execute planned responses, assign risk owners and risk actionees |
| Communicate | Risk reporting in Highlight Reports, stage-end reports |

#### Risk Register Fields
- Risk ID, Author, Date identified
- Category, Description (cause → event → effect)
- Probability, Impact, Expected value, Proximity
- Risk response, Owner, Actionee, Status

### 6. Change

| Change Type | Description |
|------------|------------|
| Request for Change (RFC) | Proposed change to a baselined product |
| Off-specification | Product not meeting its specification |
| Problem/Concern | Issue that needs resolution but is not a change or off-spec |

#### Issue and Change Control Procedure
1. Capture in Issue Register
2. Examine: assess impact on Business Case, time, cost, quality, scope, risk
3. Propose: formulate options with impact analysis
4. Decide: Change Authority or Project Board approves/rejects
5. Implement: update plans, products, and registers

### 7. Progress

| Report | From → To | Frequency | Content |
|--------|-----------|-----------|---------|
| Checkpoint Report | Team Manager → PM | Per work package schedule | Work package progress |
| Highlight Report | PM → Project Board | Per stage (typically bi-weekly) | Stage progress, issues, risks |
| End Stage Report | PM → Project Board | Each stage boundary | Stage performance, lessons, next stage plan |
| End Project Report | PM → Project Board | Project close | Project performance vs. plan |
| Exception Report | PM → Project Board | When tolerance exceeded | Situation, options, recommendation |
| Lessons Report | PM → Corporate | Stage/project close | What worked, what didn't, recommendations |

## Seven Processes

### Process Flow
```
Pre-project:    Starting Up a Project (SU)
                        ↓
Initiation:     Directing a Project (DP) ← → Initiating a Project (IP)
                        ↓
Delivery:       Controlling a Stage (CS) ← → Managing Product Delivery (MP)
(per stage)             ↓
Stage boundary: Managing a Stage Boundary (SB) → DP authorizes next stage
                        ↓
Closing:        Closing a Project (CP)
```

### Process Details

| Process | Abbreviation | Purpose | Key Activities |
|---------|-------------|---------|---------------|
| Starting Up a Project | SU | Pre-project: is this worth initiating? | Appoint Executive/PM, outline Business Case, design project approach |
| Directing a Project | DP | Project Board authorizes and oversees | Authorize initiation, stages, exceptions, closure |
| Initiating a Project | IP | Establish solid foundation | Create PID, detailed Business Case, project plans, controls |
| Controlling a Stage | CS | PM manages current stage | Authorize work packages, review progress, capture issues, report |
| Managing Product Delivery | MP | Team Manager delivers products | Accept work packages, execute, deliver completed products |
| Managing a Stage Boundary | SB | Prepare for next stage decision | Update Business Case, report stage performance, plan next stage |
| Closing a Project | CP | Controlled close | Verify acceptance, evaluate project, hand over, capture lessons |

### Project Initiation Documentation (PID)
The PID is the master document that defines the project. It includes:
- Project Definition (scope, objectives, constraints)
- Business Case
- Project approach and management approaches (quality, risk, change, communication)
- Project Plan
- Controls (tolerances, reporting, stage structure)
- Tailoring decisions

## Tailoring PRINCE2

### Tailoring by Project Size

| Element | Small/Simple | Medium | Large/Complex |
|---------|-------------|--------|---------------|
| Stages | 2 (initiation + delivery) | 3-4 | 5+ |
| Reports | Informal, verbal | Standard templates | Formal, detailed |
| Roles | Combined (PM = TM) | Standard allocation | Full role set + project support |
| Plans | Project plan only | Project + stage plans | Project + stage + team plans |
| Registers | Simplified | Standard | Comprehensive with tools |
| Governance | Light Project Board | Regular board meetings | Formal governance structure |

### Tailoring Factors
- Project scale (budget, duration, team size)
- Complexity (technical, organizational, stakeholder)
- Criticality (impact of failure)
- Organizational maturity (PMO support, methodology adoption)
- External constraints (regulation, contracts)

## PRINCE2 Agile Hybrid

### Concept
PRINCE2 Agile combines PRINCE2 governance and control with agile delivery methods. It is not a separate method but guidance on how to tailor PRINCE2 for agile environments.

### Key Adaptations

| PRINCE2 Element | Agile Adaptation |
|----------------|-----------------|
| Management stages | Align with release cadence or PI boundaries |
| Work Packages | Map to Sprints or iterations with user stories |
| Product Descriptions | Acceptance criteria, Definition of Done |
| Tolerances | Fix time and cost; flex scope (MoSCoW) |
| Highlight Reports | Include velocity, burndown, retrospective outcomes |
| Quality review | Sprint review + Sprint retrospective |
| Stage gates | End-of-release review with Business Case validation |

### Five Targets in PRINCE2 Agile

| Target | Focus | Fixed or Flex |
|--------|-------|---------------|
| Time | Deadlines, timeboxes | Fix (timebox the work) |
| Cost | Budget | Fix (within tolerance) |
| Scope | Features, MoSCoW | Flex (descope Could/Should) |
| Quality | Acceptance criteria | Fix (never compromise) |
| Benefits | Business Case | Focus (primary driver) |

### Agilometer
Assessment tool to evaluate project suitability for agile approaches:
- Flexibility on what is delivered
- Level of collaboration
- Ease of communication
- Ability to work iteratively
- Stakeholder engagement willingness

### Agilometer Scoring

| Factor | Low Agile Suitability | High Agile Suitability |
|--------|----------------------|----------------------|
| Flexibility | Fixed scope contract, no flexibility | MoSCoW, scope negotiable |
| Collaboration | Distributed, low trust, formal | Co-located, high trust, informal |
| Communication | Formal documents only | Rich, face-to-face, visual |
| Iterative capability | Sequential processes required | Can deliver incrementally |
| Stakeholder engagement | Absent, delegate-only | Active, available, empowered |

## PRINCE2 Management Products (26 Total)

### Baselines
- Business Case, Benefits Management Approach
- Project Product Description, Product Descriptions
- Project Plan, Stage Plan, Team Plan, Exception Plan
- PID (Project Initiation Documentation)

### Records
- Daily Log, Lessons Log, Risk Register, Issue Register, Quality Register
- Configuration Item Records

### Reports
- Checkpoint Report, Highlight Report, End Stage Report
- End Project Report, Exception Report, Lessons Report
- Product Status Account

## PRINCE2 vs. PMBOK 7 vs. SAFe

| Aspect | PRINCE2 7 | PMBOK 7 | SAFe 6.0 |
|--------|----------|---------|----------|
| Origin | UK government | PMI (US, global) | Scaled Agile Inc. |
| Type | Method (prescriptive) | Standard (descriptive) | Framework (prescriptive) |
| Focus | Business Case governance | Principle-based domains | Scaled agile delivery |
| Scale | Single project | Single project | Program/portfolio |
| Agile integration | PRINCE2 Agile | Agile Practice Guide | Native agile |
| Certification | Foundation + Practitioner | PMP, CAPM | SA, SPC, RTE, POPM |
| Business Case | Mandatory, continuous | Referenced | Lean Business Case |
| Best for | Governance-heavy, stage-gated | Flexible, principle-driven | Large-scale agile |

## Quick Reference

| Element | PRINCE2 Count | Purpose |
|---------|--------------|---------|
| Principles | 7 | Non-negotiable rules |
| Practices (Themes) | 7 | Continuous management aspects |
| Processes | 7 | Sequential workflow |
| Management Products | 26 | Baselines, records, reports |
| Roles | 9+ | Clear accountability |
| Tolerance dimensions | 6 | Time, cost, scope, quality, risk, benefits |

---
*PMO-APEX v1.0 — Agentic Project Excellence*
