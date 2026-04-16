---
name: priming-rag-pmbok7
description: >
  RAG priming knowledge: PMBOK 7th Edition — principles, performance domains, tailoring, contrast with PMBOK 6
type: priming-rag
domain: project-management
---

# PMBOK 7th Edition — Core Knowledge Primer

> **Propósito RAG**: Este documento provee conocimiento de dominio para enriquecer el contexto del agente durante sesiones de gerencia de proyectos. No es un entregable — es material de referencia interno.

## Structural Shift: PMBOK 6 vs. PMBOK 7

| Aspect | PMBOK 6 (2017) | PMBOK 7 (2021) |
|--------|---------------|----------------|
| Structure | 10 Knowledge Areas, 49 processes | 12 Principles, 8 Performance Domains |
| Approach | Process-based (inputs → tools → outputs) | Principle-based (outcomes, not prescriptions) |
| Methodology | Primarily predictive (waterfall) | Development-approach agnostic (predictive, agile, hybrid) |
| Focus | How to manage projects (prescriptive) | Why practices lead to outcomes (descriptive) |
| Standards | PMBOK Guide itself was the standard | Separate: "The Standard for Project Management" |
| Tailoring | Mentioned but not emphasized | Core concept — tailor everything to context |
| Value delivery | Implied through deliverables | Explicit: projects exist to deliver value |
| System thinking | Limited | Projects within organizational value delivery systems |
| Companion | None | "Process Groups: A Practice Guide" (optional) |

### PMBOK 6 Process Groups (for reference)
1. Initiating (2 processes)
2. Planning (24 processes)
3. Executing (10 processes)
4. Monitoring & Controlling (12 processes)
5. Closing (1 process)

These still exist in the companion guide but are no longer the core structure.

## 12 Principles of Project Management

### Stewardship and Team

| # | Principle | Key Behaviors |
|---|-----------|--------------|
| 1 | Be a diligent, respectful, and caring steward | Act with integrity, care for well-being, be trustworthy with resources |
| 2 | Create a collaborative project team environment | Foster psychological safety, diverse perspectives, shared ownership |
| 3 | Effectively engage with stakeholders | Proactively understand needs, build productive relationships |

### Value and Systems

| # | Principle | Key Behaviors |
|---|-----------|--------------|
| 4 | Focus on value | Align work to business objectives, measure outcomes not outputs |
| 5 | Recognize, evaluate, and respond to system interactions | Understand project within organizational and external systems |
| 6 | Demonstrate leadership behaviors | Effective leadership regardless of title, adapt style to context |

### Complexity, Risk, and Change

| # | Principle | Key Behaviors |
|---|-----------|--------------|
| 7 | Tailor based on context | Adapt governance, approach, processes to environment |
| 8 | Build quality into processes and deliverables | Plan quality in, don't inspect it in; prevention over inspection |
| 9 | Navigate complexity | Identify complexity drivers, use appropriate response strategies |
| 10 | Optimize risk responses | Maximize opportunities, minimize threats, risk appetite awareness |
| 11 | Embrace adaptability and resiliency | Build capacity to respond to change, iterate, learn |
| 12 | Enable change to achieve the envisioned future state | Manage organizational change, not just project change |

## 8 Performance Domains

### 1. Stakeholder Performance Domain

**Desired Outcome**: productive working relationships with stakeholders throughout the project

| Activity | Tools/Techniques |
|----------|-----------------|
| Identify stakeholders | Stakeholder register, brainstorming, org charts |
| Understand and analyze | Power/interest grid, salience model, influence/impact |
| Prioritize engagement | Engagement assessment matrix |
| Engage stakeholders | Communication plan, relationship building |
| Monitor engagement | Stakeholder engagement tracker, satisfaction surveys |

#### Stakeholder Classification Models

| Model | Axes | Use When |
|-------|------|----------|
| Power/Interest grid | Power × Interest | Simple projects, clear stakeholder landscape |
| Salience model | Power × Legitimacy × Urgency | Complex stakeholder environments |
| Influence/Impact | Influence × Impact | Need to understand who can affect outcomes |
| Direction of Influence | Upward, Downward, Outward, Sideward | Understanding communication flows |

### 2. Team Performance Domain

**Desired Outcome**: high-performing team that produces desired outcomes

- **Servant leadership**: PM serves the team, removes impediments, enables success
- **Team development**: Forming → Storming → Norming → Performing → Adjourning (Tuckman)
- **Distributed teams**: explicit communication protocols, overlapping hours, asynchronous tools
- **Emotional intelligence**: self-awareness, self-regulation, motivation, empathy, social skills
- **Conflict management**: confront, collaborate, compromise, smooth, force, withdraw
- **T-shaped skills**: deep expertise in one area + broad capability across disciplines

### 3. Development Approach and Life Cycle

**Desired Outcome**: development approach consistent with project context

| Approach | Requirements | Change Rate | Delivery | Best For |
|----------|-------------|------------|----------|----------|
| Predictive | Clear, stable | Low | Single delivery at end | Construction, regulatory, hardware |
| Iterative | Evolving | Moderate | Periodic refinements | R&D, creative, exploration |
| Incremental | Known, deliverable in parts | Low-moderate | Functional subsets | Phased rollouts |
| Adaptive (Agile) | Unclear, emergent | High | Frequent small releases | Software, innovation, discovery |
| Hybrid | Mixed | Mixed | Combination | Most real-world projects |

#### Life Cycle Selection Criteria
- Requirements stability and clarity
- Risk level and uncertainty
- Stakeholder engagement needs
- Delivery flexibility expectations
- Regulatory and compliance constraints
- Team experience and maturity

### 4. Planning Performance Domain

**Desired Outcome**: organized, deliberate, evolving approach to deliver outcomes

| Planning Element | Predictive | Adaptive | Hybrid |
|-----------------|-----------|---------|--------|
| Scope | WBS, scope statement | Product Backlog | WBS + Backlog |
| Schedule | Critical Path, Gantt | Sprint cadence | Milestones + Sprints |
| Cost | Bottom-up, parametric | Story-point-based | Blended estimation |
| Resources | Resource histogram | Team capacity | Both |
| Quality | Quality management plan | Definition of Done | Combined |

- Planning is iterative: initial plan + progressive elaboration
- Management reserves (unknown unknowns) vs. contingency reserves (known unknowns)
- Rolling wave planning: detailed near-term, high-level long-term

### 5. Project Work Performance Domain

**Desired Outcome**: efficient and effective project processes enabling team contributions

- Establish and maintain project processes
- Manage physical resources and procurements
- Integrated change control: evaluate, approve/reject, document all changes
- Knowledge management: lessons learned, knowledge repositories
- Manage project artifacts: documents, logs, registers

### 6. Delivery Performance Domain

**Desired Outcome**: projects deliver intended scope, quality, and stakeholder expectations

- Deliver value incrementally when possible
- Requirements management: elicit, analyze, document, validate, trace
- Quality dimensions: plan quality → manage quality → control quality
- Verify deliverables against acceptance criteria
- Measure delivered value against business case and benefits plan

### 7. Measurement Performance Domain

**Desired Outcome**: reliable data for decision-making and appropriate action

| Category | Metrics | Purpose |
|----------|---------|---------|
| Delivery | SPI, CPI, velocity, throughput | Is the project on track? |
| Stakeholder | NPS, satisfaction surveys | Are expectations met? |
| Business value | Benefits realized vs. planned | Is value being delivered? |
| Quality | Defect density, test coverage, escape rate | Is quality acceptable? |
| Team health | Morale surveys, turnover, NPS | Is the pace sustainable? |
| Forecast | EAC, ETC, burndown trend | Where are we heading? |

#### Measurement Tools
- Earned Value Management (see priming-rag-evm.md)
- Burndown/burnup charts
- Cumulative flow diagrams
- Control charts (process stability)
- Dashboards and information radiators

### 8. Uncertainty Performance Domain

**Desired Outcome**: awareness and management of risks, ambiguity, and volatility

| Uncertainty Type | Response Strategy |
|-----------------|-------------------|
| Risk (known unknowns) | Identify, analyze, plan responses, monitor |
| Ambiguity (lack of clarity) | Explore, prototype, experiment, build options |
| Complexity (emergent behavior) | Reframe, decouple, iterate, use complexity models |
| Volatility (rapid change) | Build reserves, contingency plans, flexibility |

- Overall project risk vs. individual risks: both require management
- Risk appetite, tolerance, and threshold inform response selection
- Complexity models: Cynefin (Simple, Complicated, Complex, Chaotic), Stacey Matrix

## Tailoring Framework

### What to Tailor
1. Life cycle and development approach
2. Processes and their depth/formality
3. Stakeholder engagement modes and frequency
4. Tools and techniques selection
5. Methods, templates, and artifacts
6. Governance and reporting cadence

### Tailoring Factors

| Factor | Key Considerations |
|--------|-------------------|
| Product/deliverable | Complexity, novelty, technology maturity, integration needs |
| Project team | Size, distribution, experience, stability, co-location |
| Organization | Culture, structure, governance maturity, PMO support |
| Industry | Regulatory requirements, compliance, safety-criticality |
| Current methodology | Organizational standard, constraints, flexibility |

### Tailoring Decision Flow
```
1. SELECT initial approach (predictive / adaptive / hybrid)
2. ADAPT to organization (culture, governance, maturity)
3. ADAPT to project (size, complexity, risk, team)
4. IMPLEMENT with continuous inspection
5. IMPROVE — adjust tailoring based on retrospective feedback
```

## Systems for Value Delivery

PMBOK 7 situates projects within an organizational value delivery system:

```
Organizational Strategy
    ↓
Portfolio Management (investments aligned to strategy)
    ↓
Program Management (coordinated benefits)
    ↓
Project Management (specific deliverables)
    ↓
Operations (sustained value)
    ↓
Benefits Realized (measurable impact)
```

### Governance Elements
- Decision rights, policies, accountability structures
- Phase gates (predictive) or Sprint reviews (adaptive)
- Compliance and regulatory constraints influence governance intensity
- Governance should be appropriate — neither too heavy nor too light

## Models, Methods, and Artifacts Referenced

### Models
- Situational leadership (Hersey & Blanchard)
- Servant leadership (Greenleaf)
- Tuckman team development
- Cynefin complexity framework (Snowden)
- Stacey complexity matrix
- ADKAR change management (Prosci)
- Kotter 8-step change model

### Methods
- Retrospectives, lessons learned, after-action reviews
- Earned value analysis, trend analysis, variance analysis
- Backlog refinement, Sprint planning, Kanban
- Risk assessment (qualitative and quantitative)
- Stakeholder analysis and engagement planning

## Quick Reference

| PMBOK 7 Element | Count | Focus |
|-----------------|-------|-------|
| Principles | 12 | Values and behaviors |
| Performance Domains | 8 | Outcome areas |
| Tailoring | Throughout | Context-appropriate adaptation |
| Models | Referenced | Thinking frameworks |
| Methods | Referenced | How to do the work |
| Artifacts | Referenced | Work products |

---
*PMO-APEX v1.0 — Agentic Project Excellence*
