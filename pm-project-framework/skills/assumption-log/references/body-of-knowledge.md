# Body of Knowledge — Assumption Log

## 1. Foundations

Assumption logging is a systematic practice for identifying, documenting, tracking, and validating project assumptions. Unvalidated assumptions are the leading source of project risk. [DOC]

### 1.1 Definitions

| Term | Definition | Source |
|------|-----------|--------|
| Assumption | A factor considered true without proof for planning purposes | PMBOK 7th Edition |
| Constraint | A limiting factor that affects project execution | PMBOK 7th Edition |
| Dependency | A logical relationship between activities | PMI Practice Standard |
| Validation | Process of confirming an assumption with evidence | ISO 21502 |

### 1.2 Assumption Categories

| Category | Examples | Risk Level |
|----------|---------|------------|
| Technical | "The API supports 10K concurrent users" | High [METRIC] |
| Resource | "Senior architect available from Sprint 3" | Medium [SCHEDULE] |
| Business | "Regulatory approval by Q2" | High [STAKEHOLDER] |
| Financial | "Cloud costs under 2 FTE-months/year" | Medium [PLAN] |
| Organizational | "Stakeholders available for weekly reviews" | Low [STAKEHOLDER] |
| External | "Vendor delivers SDK by March" | High [SCHEDULE] |

## 2. Assumption Lifecycle

```
Identify → Document → Classify → Assign Owner → Plan Validation → Validate → Close/Escalate
```

### 2.1 Identification Techniques

1. **Pre-mortem analysis** — "If this project fails, what did we assume wrongly?" [INFERENCIA]
2. **Constraint mapping** — For each constraint, what assumption underlies it? [PLAN]
3. **Stakeholder interviews** — "What must be true for this plan to work?" [STAKEHOLDER]
4. **Planning poker assumptions** — During estimation, surface hidden assumptions [METRIC]
5. **Document review** — Extract implicit assumptions from charters and proposals [DOC]

### 2.2 Classification Matrix

| Impact | High Probability | Low Probability |
|--------|-----------------|----------------|
| High | Monitor closely (weekly) | Contingency plan required |
| Low | Track monthly | Log and review quarterly |

## 3. Validation Strategies

| Strategy | When to Use | Effort |
|----------|------------|--------|
| Proof of Concept | Technical assumptions | 1-2 sprints |
| Stakeholder Confirmation | Business/org assumptions | 1-2 meetings |
| Market Research | External assumptions | 1-2 weeks |
| Prototype Testing | User behavior assumptions | 1 sprint |
| Expert Consultation | Domain-specific assumptions | 2-3 sessions |

## 4. Integration with Risk Management

Every unvalidated assumption is a potential risk:
- **Assumption validated TRUE** → Remove from log, update plan [PLAN]
- **Assumption validated FALSE** → Trigger risk response, update scope/schedule [SCHEDULE]
- **Assumption invalidated** → Escalate to change control board [STAKEHOLDER]

## 5. Log Structure (PMO-APEX Standard)

| Field | Description | Required |
|-------|------------|----------|
| ID | Unique identifier (A-001) | Yes |
| Description | Clear statement of the assumption | Yes |
| Category | Technical/Resource/Business/Financial/Org/External | Yes |
| Impact | High/Medium/Low | Yes |
| Probability | High/Medium/Low that assumption is true | Yes |
| Owner | Person responsible for validation | Yes |
| Validation Method | How to confirm or deny | Yes |
| Target Date | When validation should complete | Yes |
| Status | Open/Validating/Validated/Invalidated | Yes |
| Evidence | Link to validation evidence | When available |

## 6. Standards & References

| Source | Document | Relevance |
|--------|----------|-----------|
| PMI | PMBOK 7th Ed., Section 4.1 | Assumption identification |
| ISO | ISO 21502:2020 | Project governance |
| PRINCE2 | Business Case assumptions | Benefits assumptions |
| SAFe | Lean Business Case | Hypothesis-driven assumptions |

> *Principio Rector: "Un supuesto no validado es una bomba de tiempo con temporizador desconocido."*

*PMO-APEX v1.0 — Body of Knowledge · Assumption Log*
