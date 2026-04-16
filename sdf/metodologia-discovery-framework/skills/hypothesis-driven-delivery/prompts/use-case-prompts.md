# Use-Case Prompts — Hypothesis-Driven Delivery

## Prompt 1: Convert Requirements to Hypotheses

**When**: Translating a traditional requirements document into hypothesis-driven backlog.

**Context variables**:
- `{REQUIREMENTS_DOC}`: Path to requirements document
- `{BUSINESS_GOALS}`: Key business objectives
- `{TIMELINE}`: Available experiment timeline

**Deliver**:
> "Convert the requirements in {REQUIREMENTS_DOC} into a hypothesis backlog. For each major requirement, formulate a hypothesis using the template: 'We believe {capability} will result in {outcome}. We will know we succeeded when {signal}.' Prioritize by business impact ({BUSINESS_GOALS}) and design minimum experiments within {TIMELINE}."

## Prompt 2: Experiment Portfolio Design

**When**: Planning a quarter of experiments for an innovation initiative.

**Context variables**:
- `{INITIATIVE_NAME}`: Innovation initiative
- `{BUDGET_FTE}`: Available FTE-months for experiments
- `{HYPOTHESIS_COUNT}`: Number of hypotheses to test

**Deliver**:
> "Design an experiment portfolio for {INITIATIVE_NAME} with {BUDGET_FTE} FTE-months to test {HYPOTHESIS_COUNT} hypotheses. For each experiment: define type (A/B, spike, MVP), duration, resource needs, success criteria, and kill criteria. Include portfolio-level investment allocation and option-value analysis."

## Prompt 3: Experiment Results Analysis

**When**: Analyzing results from completed experiments to make decisions.

**Context variables**:
- `{EXPERIMENT_DATA}`: Summary of experiment results
- `{ORIGINAL_HYPOTHESIS}`: The hypothesis being tested
- `{BUSINESS_CONTEXT}`: Current business situation

**Deliver**:
> "Analyze experiment results for hypothesis: {ORIGINAL_HYPOTHESIS}. Data: {EXPERIMENT_DATA}. Business context: {BUSINESS_CONTEXT}. Determine statistical significance, practical significance, and recommend: persevere (build the feature), pivot (modify and retest), or kill (abandon). Include confidence level and next steps."

*PMO-APEX v1.0 — Use-Case Prompts · Hypothesis-Driven Delivery*
