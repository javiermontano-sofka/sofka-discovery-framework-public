---
name: excellence-loop
author: JM Labs (Javier Montaño)
description: >
  Applies a 10-point quality rubric to every artifact with iterative refinement until excellence criteria are met.
  Trigger: "excellence check", "quality rubric", "review artifact", "quality loop", "refine output".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Excellence Loop

Applies a rigorous 10-point quality rubric to every deliverable artifact, identifying gaps and iterating until all criteria score above threshold — transforming good work into excellent work.

## Guiding Principle

> *"Excellence is not a destination but a loop. Ship when every dimension scores above threshold, not when you run out of time."*

## Procedure

### Step 1 — Select the Rubric
1. Load the 10-point excellence rubric appropriate for the artifact type.
2. For technical documents: completeness, accuracy, evidence, structure, actionability, clarity, diagrams, consistency, audience-fit, next-steps.
3. For code deliverables: correctness, readability, testability, performance, security, maintainability, documentation, error-handling, naming, standards-compliance.
4. Customize rubric weights based on artifact priority (critical vs. supporting).
5. Set the threshold: minimum score per criterion (typically 7/10) and overall (typically 8/10).

### Step 2 — Score the Artifact
1. Evaluate each criterion independently on a 1-10 scale.
2. Provide specific evidence for each score: what is good, what is lacking.
3. Identify the lowest-scoring criteria as priority improvement targets.
4. Calculate the overall weighted score.
5. Determine the verdict: PASS (all criteria >= threshold), ITERATE (specific criteria below), REWORK (overall below threshold).

### Step 3 — Iterate on Gaps
1. For each criterion below threshold, define the specific improvement needed.
2. Apply improvements in priority order (lowest scores first).
3. Re-score only the modified criteria after each improvement pass.
4. Track iteration count — if more than 3 iterations on the same criterion, escalate for review.
5. Document what changed in each iteration for audit trail.

### Step 4 — Certify and Archive
1. When all criteria pass, stamp the artifact with the excellence certification.
2. Record the final scores and iteration history.
3. Add the ghost menu with next-step actions.
4. Update the artifact status from {WIP} to ready for review or {Aprobado}.
5. Feed the scoring data into the lessons-learned tracker for continuous improvement.

## Quality Criteria
- Every artifact is scored against a defined rubric before delivery.
- No criterion scores below the minimum threshold in the final version.
- Iteration history is documented showing progressive improvement.
- Rubric is calibrated quarterly based on feedback and lessons learned.

## Anti-Patterns
- Skipping the excellence loop due to time pressure ("good enough" mentality).
- Scoring all criteria at 10/10 without honest assessment (rubber stamping).
- Iterating endlessly on minor improvements (diminishing returns).
- Using the same rubric for all artifact types without customization.
