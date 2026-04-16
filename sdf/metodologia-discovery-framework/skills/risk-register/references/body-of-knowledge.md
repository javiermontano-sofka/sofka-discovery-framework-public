# Body of Knowledge — Risk Register & Identification

> Academic, industrial, and practitioner sources for risk identification, categorization, assessment, and register management in project management.

---

## 1. Foundational Frameworks

### ISO 31000:2018 — Risk Management Guidelines

- **Relevance:** Universal risk management standard applicable across all project types. Defines the risk management process: scope/context/criteria → risk assessment (identification, analysis, evaluation) → risk treatment → monitoring/review.
- **Key principles:** Integrated, structured, inclusive, dynamic, best available information, human/cultural factors, continual improvement.
- **Use in skill:** The 10-step protocol maps directly to ISO 31000's process. Risk identification techniques align with clause 6.4.2.
- **Source:** ISO (2018). *ISO 31000:2018 — Risk management — Guidelines*.

### PMBOK 7th Edition — Uncertainty Performance Domain

- **Relevance:** PMI's treatment of uncertainty encompasses risks, ambiguity, and complexity. PMBOK 7 shifts from process-based to principle-based approach. The Uncertainty performance domain describes how to navigate unknown events.
- **Key concepts:** Risk attitudes (appetite, tolerance, threshold), general uncertainty vs specific risks, emergent risks.
- **Use in skill:** Risk appetite framework from this domain informs the `--threshold` parameter and escalation triggers.
- **Source:** PMI (2021). *A Guide to the Project Management Body of Knowledge (PMBOK Guide) — 7th Edition*.

### PMBOK 6th Edition — Risk Management Knowledge Area

- **Relevance:** Process-based risk management with 7 processes: Plan Risk Management, Identify Risks, Perform Qualitative Analysis, Perform Quantitative Analysis, Plan Risk Responses, Implement Risk Responses, Monitor Risks.
- **Key tools:** Risk Breakdown Structure (RBS), Probability-Impact matrix, SWOT analysis, assumptions and constraints analysis, prompt lists.
- **Use in skill:** The RBS taxonomy (Technical, External, Organizational, PM) and P×I scoring directly from PMBOK 6.
- **Source:** PMI (2017). *PMBOK Guide — 6th Edition*, Chapter 11.

---

## 2. Risk Identification Techniques

### Brainstorming (Structured)

- **Description:** Group technique where participants generate risk ideas without judgment. Most effective with diverse stakeholders (technical, business, operations).
- **Best practice:** Use Crawford Slip Method for introverted teams — each participant writes risks on slips independently before group discussion. Eliminates anchoring bias.
- **When to use:** Always as first technique. Captures tacit knowledge and team concerns.

### Delphi Technique

- **Description:** Anonymous iterative expert consultation. Experts independently assess risks, results are aggregated, shared anonymously, and experts revise until convergence.
- **Best practice:** 3 rounds maximum. Use when experts are geographically distributed or when politics might suppress honest assessment.
- **When to use:** No historical data available (Edge Case 1). Senior stakeholders who might dominate brainstorming.

### SWOT Analysis (Risk-Focused)

- **Description:** Strengths/Weaknesses/Opportunities/Threats mapped to project context. Weaknesses and Threats generate risk candidates; Strengths and Opportunities generate positive risk (opportunity) candidates.
- **Best practice:** Conduct after stakeholder analysis. Each SWOT quadrant should yield ≥3 risk candidates.
- **When to use:** Early in project when strategic context is being established.

### Assumption Analysis

- **Description:** Review all documented assumptions; each assumption with confidence <0.7 becomes a candidate risk. Assumptions are the hidden source of most project risks.
- **Best practice:** Cross-reference with assumption log. Every assumption that could invalidate a deliverable or milestone must have a corresponding risk.
- **When to use:** Always. This is the most frequently missed technique.

### Root Cause Analysis (Ishikawa/Fishbone)

- **Description:** Work backward from potential failure modes to identify root causes. Categories: People, Process, Technology, Environment, Management, Materials.
- **Best practice:** Focus on risks that have materialized in similar projects. Use historical data from lessons-learned repositories.
- **When to use:** Recovery projects, projects in domains with known failure patterns.

### Checklist Analysis

- **Description:** Domain-specific risk checklists from organizational knowledge base or industry standards. Ensures systematic coverage of known risk categories.
- **Best practice:** Never use checklists alone — they miss novel risks. Always combine with brainstorming or SWOT.
- **When to use:** As a completeness check after other techniques.

### Pre-Mortem Analysis

- **Description:** Imagine the project has failed. Ask: "What went wrong?" This inverts the usual optimism bias by assuming failure first.
- **Best practice:** Conduct with the full project team. Each member writes independently what caused the "failure" before group discussion.
- **When to use:** When team exhibits optimism bias or has never failed a similar project.

### Prompt Lists

- **Description:** Structured question lists that prompt risk identification in specific domains. Common frameworks: PESTLE (Political, Economic, Social, Technological, Legal, Environmental), TECOP (Technical, Environmental, Commercial, Operational, Political).
- **When to use:** To ensure coverage of external and environmental risk categories often missed by technical teams.

---

## 3. Risk Breakdown Structure (RBS) Taxonomy

### Standard 4-Level RBS

| L1 Category | L2 Sub-Category | Examples |
|-------------|-----------------|----------|
| **Technical** | Requirements | Scope creep, unclear requirements, changing specs |
| | Technology | Unproven technology, integration complexity, performance |
| | Quality | Defect rates, testing adequacy, technical debt |
| | Complexity | System interdependencies, data migration, legacy constraints |
| **External** | Vendors/Suppliers | Vendor bankruptcy, SLA violations, delivery delays |
| | Regulatory | Compliance changes, audit findings, legal constraints |
| | Market | Economic downturn, competitor actions, currency fluctuation |
| | Natural | Weather, pandemic, natural disasters |
| **Organizational** | Resources | Staff turnover, skill gaps, availability conflicts |
| | Funding | Budget cuts, funding delays, cost overruns |
| | Dependencies | Cross-project dependencies, shared resource conflicts |
| | Culture | Resistance to change, communication breakdowns, politics |
| **Project Management** | Estimation | Schedule overrun, effort underestimation, scope underestimation |
| | Planning | Inadequate planning, unrealistic milestones, missing activities |
| | Controlling | Inadequate tracking, delayed escalation, poor reporting |
| | Communication | Stakeholder misalignment, information asymmetry |

---

## 4. Probability-Impact Assessment

### 5-Point Scale (Standard)

| Rating | Probability | Impact Description |
|--------|------------|-------------------|
| Very Low | 0.1 (1-10%) | Negligible effect on objectives |
| Low | 0.3 (11-30%) | Minor effect, workarounds available |
| Medium | 0.5 (31-50%) | Moderate effect, requires response planning |
| High | 0.7 (51-70%) | Significant effect on objectives |
| Very High | 0.9 (71-90%) | Severe effect, may require project restructuring |

### P×I Matrix (Heat Map)

| | Very Low (0.1) | Low (0.3) | Medium (0.5) | High (0.7) | Very High (0.9) |
|---|---|---|---|---|---|
| **Very High (0.9)** | 0.09 | 0.27 | 0.45 | 0.63 | 0.81 |
| **High (0.7)** | 0.07 | 0.21 | 0.35 | 0.49 | 0.63 |
| **Medium (0.5)** | 0.05 | 0.15 | 0.25 | 0.35 | 0.45 |
| **Low (0.3)** | 0.03 | 0.09 | 0.15 | 0.21 | 0.27 |
| **Very Low (0.1)** | 0.01 | 0.03 | 0.05 | 0.07 | 0.09 |

**Color coding:**
- Red (Critical): P×I ≥ 0.36
- Amber (High): 0.15 ≤ P×I < 0.36
- Yellow (Medium): 0.05 ≤ P×I < 0.15
- Green (Low): P×I < 0.05

---

## 5. Risk Statement Format

### Cause-Event-Effect (Metalanguage)

```
Because [definite cause/condition exists],
there is a risk that [uncertain event may occur],
which would result in [impact on project objectives].
```

### Risk Register Columns (Standard)

| Column | Description | Required |
|--------|------------|----------|
| Risk ID | Unique identifier (R-NNN) | Yes |
| Risk Statement | Cause-event-effect format | Yes |
| RBS Category | L1 > L2 classification | Yes |
| Probability | 0.1–0.9 scale | Yes |
| Impact (Schedule) | 0.1–0.9 scale | Yes |
| Impact (Cost) | 0.1–0.9 scale | Yes |
| Impact (Scope) | 0.1–0.9 scale | Yes |
| P×I Score | Max of schedule/cost/scope impacts × probability | Yes |
| Priority | Rank by P×I score | Yes |
| Owner | Named individual | Yes |
| Status | Open, Mitigating, Watching, Closed, Materialized | Yes |
| Evidence Tag | [PLAN], [METRIC], [STAKEHOLDER], [SUPUESTO] | Yes |
| WBS Reference | Linked WBS element | Recommended |
| Response Strategy | Avoid, Transfer, Mitigate, Accept, Escalate | Phase 2 |
| Trigger | Observable condition that activates the risk | Phase 2 |

---

*PMO-APEX v1.0 — Body of Knowledge · Risk Register & Identification*
