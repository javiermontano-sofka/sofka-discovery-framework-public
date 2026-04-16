# Metaprompts — Hypothesis-Driven Delivery

## Metaprompt 1: Hypothesis Quality Checker

**Strategy**: Evaluate hypotheses for testability, specificity, and business relevance.

**Protocol**:
1. Check each hypothesis has all elements: belief, testable statement, metric, threshold
2. Verify the hypothesis is falsifiable (can be proven wrong)
3. Ensure the metric is measurable with available data
4. Confirm the success threshold is business-relevant (not arbitrary)
5. Rate each hypothesis on a quality scale and improve weak ones

**Activation**:
> "Review each hypothesis in this backlog for quality. Is it falsifiable? Is the metric measurable? Is the success threshold business-relevant? Rate each 1-5 and rewrite any scoring below 3."

## Metaprompt 2: Confirmation Bias Detector

**Strategy**: Identify experiments designed to confirm rather than genuinely test hypotheses.

**Protocol**:
1. For each experiment, ask: "What result would disprove the hypothesis?"
2. Check if the experiment can realistically produce that result
3. Verify sample sizes are adequate for detecting both positive and negative effects
4. Look for cherry-picked metrics that only show success
5. Redesign biased experiments with proper controls

**Activation**:
> "Audit these experiments for confirmation bias. For each, identify what a negative result would look like and whether the experiment design can detect it. Flag experiments where only positive outcomes are possible and redesign them."

## Metaprompt 3: Experiment Efficiency Optimizer

**Strategy**: Minimize time and resources while maximizing learning from experiments.

**Protocol**:
1. Identify experiments that can be combined or parallelized
2. Find the minimum viable experiment for each hypothesis
3. Sequence experiments to maximize learning cascade (later experiments build on earlier results)
4. Calculate total experiment portfolio cost and expected information value
5. Recommend the optimal experiment schedule

**Activation**:
> "Optimize this experiment portfolio for maximum learning per FTE-month invested. Identify opportunities to combine experiments, reduce scope to minimum viable tests, and sequence for maximum learning cascade."

*PMO-APEX v1.0 — Metaprompts · Hypothesis-Driven Delivery*
