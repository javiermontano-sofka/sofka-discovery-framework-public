# Body of Knowledge — Hypothesis-Driven Delivery

## 1. Foundations of Hypothesis-Driven Delivery

Hypothesis-driven delivery (HDD) applies the scientific method to project execution. Rather than building to specification, teams formulate testable hypotheses, design minimal experiments, collect data, and make evidence-based decisions. [DOC]

### 1.1 The Hypothesis Canvas

| Element | Description | Example |
|---------|-------------|---------|
| Belief | What we think is true | "Users prefer self-service onboarding" |
| Hypothesis | Testable statement | "If we add self-service, activation increases 30%" |
| Experiment | Minimal test design | A/B test with 500 users over 2 weeks |
| Metric | Success indicator | Activation rate, time-to-value |
| Decision | Outcome-based action | Pivot, persevere, or kill |

### 1.2 HDD vs Traditional Delivery

| Aspect | Traditional | Hypothesis-Driven |
|--------|------------|-------------------|
| Planning | Upfront specification | Hypothesis backlog |
| Execution | Build to spec | Run experiments |
| Success Criteria | Scope delivered | Hypothesis validated |
| Failure Mode | Scope creep | Invalid hypothesis (learning) |
| Governance | Milestone gates | Evidence gates |

## 2. Standards and Frameworks

### 2.1 Lean Startup Methodology

Eric Ries' Build-Measure-Learn loop forms the foundation of HDD. Minimum Viable Products (MVPs) serve as experiments to validate business hypotheses. [DOC]

### 2.2 ThoughtWorks Hypothesis-Driven Development

ThoughtWorks formalized HDD for software delivery: "We believe {this capability} will result in {this outcome}. We will know we have succeeded when {measurable signal}." [DOC]

### 2.3 Dual Track Agile

Combines discovery (hypothesis validation) with delivery (proven feature development) in parallel sprint tracks. Discovery generates validated backlog items for delivery. [DOC]

## 3. Hypothesis Taxonomy

| Type | Purpose | Validation Method |
|------|---------|-------------------|
| Value Hypothesis | Will users want this? | Prototype testing, surveys |
| Usability Hypothesis | Can users use this? | Usability testing |
| Feasibility Hypothesis | Can we build this? | Technical spike, POC |
| Viability Hypothesis | Should we build this? | Financial modeling |
| Growth Hypothesis | Will this scale? | Cohort analysis |

## 4. Experiment Design

### 4.1 Experiment Types

1. **A/B Test** — Compare two variants with statistical significance [METRIC]
2. **Smoke Test** — Gauge interest before building (landing page, fake door) [PLAN]
3. **Concierge MVP** — Manual service to validate before automating [DOC]
4. **Wizard of Oz** — Appears automated but humans operate behind the scenes [DOC]
5. **Technical Spike** — Time-boxed investigation of feasibility [PLAN]

### 4.2 Statistical Rigor

| Concept | Minimum Standard | PM Application |
|---------|-----------------|----------------|
| Sample Size | Power analysis (80% power) | User experiment sizing |
| Significance Level | p < 0.05 | Feature decision threshold |
| Confidence Interval | 95% CI | Metric range reporting |
| Effect Size | Minimum detectable effect | Business-relevant threshold |

## 5. Evidence-Based Decision Framework

```
Hypothesis → Experiment → Data → Decision
                                    ├── Persevere (hypothesis confirmed)
                                    ├── Pivot (partial confirmation, adjust)
                                    └── Kill (hypothesis rejected)
```

## 6. Common Pitfalls

1. **Confirmation Bias** — Designing experiments to confirm, not test [INFERENCIA]
2. **Vanity Metrics** — Measuring activity instead of outcomes
3. **Experiment Creep** — Experiments growing into full features
4. **Analysis Paralysis** — Over-testing instead of deciding
5. **HiPPO Override** — Highest-paid person overrides experiment results

## 7. Academic References

1. Ries, E. — *The Lean Startup* (Crown, 2011)
2. Thomke, S. — *Experimentation Works* (HBR Press, 2020)
3. Gothelf, J. & Seiden, J. — *Lean UX* (O'Reilly, 3rd ed., 2021)
4. ThoughtWorks — "Hypothesis-Driven Development" (2014)
5. Kohavi, R. et al. — *Trustworthy Online Controlled Experiments* (Cambridge, 2020)

*PMO-APEX v1.0 — Body of Knowledge · Hypothesis-Driven Delivery*
