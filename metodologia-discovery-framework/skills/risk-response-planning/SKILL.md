---
name: apex-risk-response-planning
description: >
  Use when the user asks to "plan risk responses", "create mitigation strategies",
  "define risk treatments", "design contingency plans", "assign risk owners",
  or mentions risk mitigation, risk transfer, risk avoidance, risk acceptance,
  response strategies, trigger-response mapping.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Risk Response Planning

**TL;DR**: Develops specific response strategies for each identified risk: avoid, transfer, mitigate, or accept for threats; exploit, share, enhance, or accept for opportunities. Each response includes action plans, trigger conditions, responsible owners, and cost/schedule impact. Updates the project plan with risk-related activities.

## Principio Rector
Identificar un riesgo sin planificar una respuesta es como diagnosticar una enfermedad sin prescribir tratamiento. La respuesta debe ser proporcional al riesgo: no gastar más en mitigación que el impacto esperado. Las mejores respuestas eliminan la causa raíz; las segundas mejores reducen la probabilidad o el impacto.

## Assumptions & Limits
- Assumes prioritized risk register exists from risk identification/qualitative analysis [PLAN]
- Assumes risk quantification results are available for cost-benefit analysis [METRIC]
- Breaks when risk appetite is undefined — cannot determine proportional responses
- Does not identify risks; plans responses for already-identified risks
- Assumes budget baseline includes contingency reserves [SUPUESTO]
- Limited to proactive response planning; crisis response uses different protocols

## Usage

```bash
# Full response planning for all prioritized risks
/pm:risk-response-planning $ARGUMENTS="--risk-register risks.md --budget budget.md"

# Response planning for top 10 risks only
/pm:risk-response-planning --type top-n --count 10

# Update responses after quantification
/pm:risk-response-planning --type update --quantification quant-report.md
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Path to risk register and budget baseline |
| `--type` | No | `full` (default), `top-n`, `update`, `opportunities` |
| `--count` | No | Number of top risks to address (default all prioritized) |
| `--appetite` | No | Path to risk appetite framework |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Spikes and prototypes as mitigation; risk responses embedded in sprint backlog; contingency absorbed in velocity buffer
- **Waterfall**: Formal response plans with contingency reserves; risk triggers monitored at phase gates; contractual risk transfer
- **SAFe**: ROAM-based responses at PI level; risk mitigation features prioritized in PI backlog; program-level contingency
- **Hybrid**: Phase-level formal responses for high-impact risks; sprint-level experimental responses for emergent risks
- **Recovery**: Aggressive mitigation of critical-path risks; triage-based response prioritization; emergency contingency activation
- **Portfolio**: Cross-project risk response coordination; portfolio-level risk reserves and escalation protocols

## Before Planning Responses
1. **Read** the prioritized risk register to understand risk rankings and impacts [PLAN]
2. **Read** risk quantification results for cost-benefit analysis of responses [METRIC]
3. **Read** risk appetite framework to calibrate response proportionality [PLAN]
4. **Grep** for available contingency in budget baseline and schedule float [SCHEDULE]

## Entrada (Input Requirements)
- Prioritized risk register (from `risk-register`)
- Risk quantification results (from `risk-quantification`)
- Budget baseline with contingency reserves
- Schedule baseline with float analysis
- Stakeholder risk appetite (from `risk-appetite-framework`)

## Proceso (Protocol)
1. **Prioritize for response** — Select risks requiring active response (top risks by P x I score)
2. **Strategy selection** — For each risk, evaluate response strategies and select best fit
3. **Action planning** — Define specific actions, responsible parties, and deadlines for each response
4. **Trigger definition** — Establish trigger conditions that activate contingency responses
5. **Cost-benefit analysis** — Verify response cost does not exceed expected impact
6. **Secondary risk assessment** — Identify risks created by the response strategies themselves
7. **Residual risk assessment** — Estimate remaining risk after response implementation
8. **Update project plan** — Add risk response activities to schedule and budget
9. **Fallback planning** — Define fallback plans for risks where primary response fails
10. **Communication plan** — Define how risk responses will be communicated to stakeholders

## Edge Cases
1. **No viable response for a critical risk** — Document the residual risk explicitly. Escalate to sponsor with acceptance decision. Add to watchlist with enhanced monitoring [STAKEHOLDER].
2. **Response cost exceeds available contingency** — Request additional contingency, or reprioritize responses. Present trade-off: which risks will be accepted to fund mitigation of others? [PLAN].
3. **Multiple risks requiring simultaneous response activation** — Prioritize by critical path impact. Assess whether combined response creates resource contention. Plan for scenario of multiple concurrent triggers [SCHEDULE].
4. **Opportunity risk identified** — Apply positive risk strategies: exploit, share, enhance, or accept. Ensure positive risks receive equal planning rigor as threats [PLAN].

## Example: Good vs Bad

**Good example — Proportional risk responses:**

| Attribute | Value |
|-----------|-------|
| Risks with responses | 15 risks with strategy assigned |
| Strategies | 3 mitigate, 2 avoid, 2 transfer, 5 accept, 3 contingency |
| Trigger conditions | All 15 have measurable trigger conditions |
| Cost-benefit | Every mitigation cost < 50% of expected impact |
| Secondary risks | 2 secondary risks identified from responses |
| Residual risk | Documented for all 15 risks |

**Bad example — Generic responses:**
"Monitor the risk" for every entry. Monitoring is not a response — it is observation. Without specific actions, trigger conditions, and responsible owners, risk responses exist only on paper and will not activate when needed.

## Salida (Deliverables)
- `03_risk_responses_{proyecto}_{WIP}.md` — Risk response plan
- Response strategy matrix (risk x strategy x actions)
- Trigger-response mapping table
- Updated schedule with risk response activities
- Residual risk summary

## Validation Gate
- [ ] Every high-priority risk has a specific response strategy (not just "monitor") [PLAN]
- [ ] Every response has a named owner and deadline [PLAN]
- [ ] Every response has measurable trigger condition [METRIC]
- [ ] Cost-benefit verified: response cost ≤ expected impact [METRIC]
- [ ] Secondary risks identified for all mitigation and avoidance strategies [PLAN]
- [ ] Residual risk documented for every risk with response [PLAN]
- [ ] Fallback plans defined for top 5 risks [PLAN]
- [ ] Risk response activities added to project schedule [SCHEDULE]
- [ ] Evidence ratio: ≥80% [PLAN]/[METRIC], <20% [SUPUESTO]
- [ ] Communication plan covers how responses will be reported to stakeholders [STAKEHOLDER]

## Escalation Triggers
- No viable response for a critical risk
- Response cost exceeds available contingency
- Multiple risks requiring simultaneous response activation
- Risk owner unable to execute assigned response

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before starting to understand standards and frameworks | `references/body-of-knowledge.md` |
| State of the Art | When benchmarking against industry trends | `references/state-of-the-art.md` |
| Knowledge Graph | To understand skill dependencies and data flow | `references/knowledge-graph.mmd` |
| Use Case Prompts | For specific scenarios and prompt templates | `prompts/use-case-prompts.md` |
| Metaprompts | To enhance output quality and reduce bias | `prompts/metaprompts.md` |
| Sample Output | Reference for deliverable format and structure | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

---

---

## Sub-Agents

### Contingency Trigger Definer


# Contingency Trigger Definer Agent

## Core Responsibility

The Contingency Trigger Definer Agent establishes precise, observable trigger conditions that activate contingency and fallback plans when primary risk responses prove insufficient. It specifies leading indicators (early-warning signals), quantitative threshold values, monitoring frequency and responsible monitors, escalation chains, and automatic activation rules — eliminating ambiguity so that the project team knows exactly when to shift from the primary response to the contingency plan without waiting for subjective judgment calls.

## Process

1. **Review** each risk's primary response plan and identify the failure modes — the specific conditions under which the primary response would not achieve the target residual risk level.
2. **Identify** leading indicators for each failure mode: measurable signals that precede full risk materialization (e.g., vendor SLA breach rate trending upward, defect density exceeding threshold in sprint N-2).
3. **Set** quantitative trigger thresholds for each indicator using historical data, industry benchmarks, or expert judgment — documenting the data source and confidence level for each threshold.
4. **Define** monitoring protocol: who measures, measurement method, data source, reporting frequency, and dashboard or tooling integration.
5. **Design** activation rules using IF-THEN logic with compound conditions where appropriate (e.g., IF indicator A > threshold AND indicator B trend is upward for 2 consecutive periods THEN activate contingency).
6. **Map** the escalation chain: who is notified, in what order, with what authority level, and within what time window after trigger activation.
7. **Document** the complete Contingency Trigger Specification including trigger cards, monitoring dashboard requirements, activation decision tree, and escalation matrix.

## Output Format

```markdown
## Contingency Trigger Specification — {Risk ID}: {Risk Title}

### Trigger Summary
- Primary response: {strategy description}
- Number of trigger conditions defined: {N}
- Monitoring cadence: {frequency}
- Auto-activation: {yes/no}

### Trigger Cards

#### Trigger T-{nn}: {Indicator Name}
- **Leading indicator**: {description}
- **Data source**: {system, report, or manual observation}
- **Measurement method**: {how it is measured}
- **Threshold**: {operator} {value} {unit} (e.g., > 15% defect rate)
- **Confidence**: {high|medium|low} — based on {source}
- **Monitoring frequency**: {daily|weekly|per-sprint|per-milestone}
- **Responsible monitor**: {name, role}

### Activation Rules

| Rule ID | Condition | Action | Time Window |
|---------|-----------|--------|-------------|
| AR-01   | IF T-01 > threshold | Alert risk owner | Within 4 hrs |
| AR-02   | IF T-01 > threshold AND T-02 trend upward x2 periods | Activate contingency plan CP-{nn} | Within 24 hrs |
| AR-03   | IF contingency ineffective after {N} days | Escalate to sponsor + activate fallback | Within 48 hrs |

### Escalation Matrix

| Level | Triggered When | Notified | Authority | Response Window |
|-------|---------------|----------|-----------|-----------------|
| L1    | Single trigger breached | Risk Owner | Adjust within plan | 24 hrs |
| L2    | Compound trigger activated | PM + Sponsor | Approve contingency budget | 48 hrs |
| L3    | Contingency plan fails | Steering Committee | Scope/schedule change authority | 72 hrs |

### Decision Tree
{Mermaid flowchart from normal monitoring → trigger detection → activation → escalation}
```

### Mitigation Plan Designer


# Mitigation Plan Designer Agent

## Core Responsibility

The Mitigation Plan Designer Agent translates high-level mitigation strategies into executable action plans with granular tasks, named owners, firm deadlines, quantified resource requirements, and measurable success criteria. Each plan is structured to reduce either the probability or impact of the risk (or both) to an acceptable residual level, and includes dependencies, prerequisites, and integration points with the project schedule to prevent mitigation activities from becoming schedule risks themselves.

## Process

1. **Receive** the risk entry and its selected mitigation strategy from the Strategy Selector, including target residual risk level and budget allocation.
2. **Decompose** the mitigation strategy into discrete, actionable tasks using a work breakdown approach — each task must be completable within a single reporting period.
3. **Assign** a responsible owner and accountable approver (RACI) to every task, verifying availability and competency against the project resource plan.
4. **Schedule** each task with start date, deadline, effort estimate, and dependency links, ensuring integration with the master project schedule and no critical-path conflicts.
5. **Quantify** resource requirements (budget, personnel hours, tools, third-party services) and validate against the allocated mitigation budget from the Strategy Selection Report.
6. **Define** measurable success criteria for each task and for the overall mitigation plan — criteria must be binary (met/not met) and tied to observable evidence.
7. **Package** the complete Mitigation Action Plan with an executive summary, task register, RACI matrix, resource budget, schedule integration notes, and success criteria checklist.

## Output Format

```markdown
## Mitigation Action Plan — {Risk ID}: {Risk Title}

### Executive Summary
- Target: Reduce {probability|impact|both} from {current} to {target}
- Timeline: {start} to {end}
- Budget: ${allocated}
- Owner: {name, role}

### Task Register

| # | Task | Owner | Start | Deadline | Effort (hrs) | Budget | Dependency | Success Criterion |
|---|------|-------|-------|----------|-------------|--------|------------|-------------------|
| 1 | ...  | ...   | ...   | ...      | ...         | ...    | ...        | ...               |

### RACI Matrix

| Task | Responsible | Accountable | Consulted | Informed |
|------|------------|-------------|-----------|----------|
| ...  | ...        | ...         | ...       | ...      |

### Resource Budget
- Personnel: {hours} hrs @ ${rate} = ${total}
- Tools/licenses: ${amount}
- Third-party services: ${amount}
- **Total: ${amount} of ${allocated} allocated**

### Schedule Integration
- Critical path impact: {none|{detail}}
- Parallel execution opportunities: {list}
- Milestone alignment: {list}

### Success Criteria Checklist
- [ ] {Criterion 1 — observable, measurable}
- [ ] {Criterion 2}
- [ ] Overall: Residual risk score <= {target threshold}
```

### Residual Risk Assessor


# Residual Risk Assessor Agent

## Core Responsibility

The Residual Risk Assessor Agent performs post-response risk reassessment to determine whether planned response strategies reduce risk exposure to levels within the organization's defined tolerance. It recalculates probability and impact after accounting for the planned response, identifies secondary risks introduced by the response itself (e.g., a vendor transfer creating a new dependency risk), quantifies the gap between residual exposure and the tolerance threshold, and recommends corrective action when residual risk exceeds acceptable levels — closing the feedback loop in the risk response planning cycle.

## Process

1. **Collect** the original risk assessment (pre-response probability, impact, EMV) and the detailed response plan from the Mitigation Plan Designer and Strategy Selector outputs.
2. **Model** the expected effect of the planned response on probability and impact using historical effectiveness data, expert judgment, or simulation — documenting assumptions and confidence intervals.
3. **Calculate** residual risk scores (residual probability x residual impact) and residual EMV for each risk, applying the same scoring scales used in the original assessment for consistency.
4. **Identify** secondary risks created by the response strategy itself (e.g., transferring risk to a vendor introduces vendor lock-in risk; avoiding a feature reduces market competitiveness) and assess each secondary risk through the standard probability-impact framework.
5. **Compare** residual risk levels and aggregate exposure against the organization's risk tolerance thresholds defined in the Risk Management Plan, flagging any risk that remains above tolerance.
6. **Recommend** corrective actions for out-of-tolerance risks: enhanced mitigation, strategy change, additional contingency, management reserve increase, or formal risk acceptance with sponsor sign-off.
7. **Produce** the Residual Risk Assessment Report with pre/post comparison, secondary risk register, tolerance compliance matrix, and corrective action recommendations.

## Output Format

```markdown
## Residual Risk Assessment Report

### Executive Summary
- Risks reassessed: {N}
- Within tolerance after response: {n} ({%})
- Above tolerance — corrective action needed: {n} ({%})
- Secondary risks identified: {n}
- Net EMV reduction: ${original_total} -> ${residual_total} ({%} reduction)

### Pre/Post Comparison

| Risk ID | Title | Pre-Prob | Pre-Impact | Pre-EMV | Strategy | Post-Prob | Post-Impact | Residual EMV | Status |
|---------|-------|----------|-----------|---------|----------|-----------|-------------|-------------|--------|
| R-001   | ...   | ...      | ...       | ...     | ...      | ...       | ...         | ...         | WITHIN / ABOVE |

### Secondary Risk Register

| Sec-Risk ID | Source Risk | Secondary Risk Description | Probability | Impact | EMV | Response Needed |
|-------------|-----------|---------------------------|-------------|--------|-----|-----------------|
| SR-001      | R-003     | ...                       | ...         | ...    | ... | Yes/No          |

### Tolerance Compliance Matrix

| Risk ID | Residual Score | Tolerance Threshold | Gap | Compliant |
|---------|---------------|--------------------|----|-----------|
| R-001   | ...           | ...                | ...| YES / NO  |

### Corrective Action Recommendations

| Risk ID | Issue | Recommended Action | Est. Cost | Expected Residual After Correction |
|---------|-------|--------------------|-----------|-----------------------------------|
| R-005   | Residual EMV exceeds tolerance by 20% | Add secondary mitigation: {detail} | ${amount} | {score} — WITHIN tolerance |

### Approval Required
- Risks requiring formal risk acceptance by sponsor: {list}
- Management reserve adjustment needed: {yes/no — amount}
```

### Strategy Selector


# Strategy Selector Agent

## Core Responsibility

The Strategy Selector Agent evaluates each identified risk against the organization's risk appetite, available budget, timeline constraints, and stakeholder priorities to recommend the most cost-effective response strategy from the five canonical options: avoid, transfer, mitigate, accept, or escalate. It produces a defensible rationale for every selection, ensuring alignment between the chosen strategy and the project's risk tolerance thresholds defined in the Risk Management Plan.

## Process

1. **Ingest** the prioritized risk register with probability, impact, and risk score for each entry.
2. **Classify** each risk by category (technical, external, organizational, project management) and map it to the relevant risk appetite threshold.
3. **Evaluate** the five canonical strategies (avoid, transfer, mitigate, accept, escalate) against cost-benefit criteria for every risk, calculating expected monetary value (EMV) reduction per dollar spent.
4. **Score** each candidate strategy using a weighted decision matrix that considers cost-effectiveness, feasibility, time-to-implement, side-effect potential, and alignment with organizational risk appetite.
5. **Select** the highest-scoring strategy for each risk and document the selection rationale, rejected alternatives, and assumptions.
6. **Validate** that the aggregated cost of all selected strategies fits within the management reserve and contingency budget allocations.
7. **Publish** the Strategy Selection Report containing per-risk strategy assignments, rationale summaries, budget impact, and escalation flags for risks requiring sponsor approval.

## Output Format

```markdown
## Risk Response Strategy Selection Report

### Summary
- Total risks assessed: {N}
- Strategy distribution: Avoid ({n}), Transfer ({n}), Mitigate ({n}), Accept ({n}), Escalate ({n})
- Total response budget required: ${amount}
- Risks requiring sponsor escalation: {n}

### Per-Risk Strategy Assignment

| Risk ID | Risk Title | Score | Strategy | Rationale | Est. Cost | EMV Reduction |
|---------|-----------|-------|----------|-----------|-----------|---------------|
| R-001   | ...       | ...   | ...      | ...       | ...       | ...           |

### Rejected Alternatives Log
- **R-001**: Transfer rejected — insurance premium exceeds mitigation cost by 40%
- ...

### Budget Alignment
- Management reserve available: ${amount}
- Total strategy cost: ${amount}
- Remaining reserve: ${amount}
- Status: WITHIN TOLERANCE / OVER BUDGET — escalation required
```

