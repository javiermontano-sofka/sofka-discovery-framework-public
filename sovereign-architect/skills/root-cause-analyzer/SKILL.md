---
name: root-cause-analyzer
author: JM Labs (Javier Montaño)
description: >
  Systematic root cause tracing from symptoms through causal chains to actual causes.
  Trigger: "root cause analysis", "why is this failing", "trace the cause", "5 whys".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Root Cause Analyzer

Trace observable symptoms through causal chains to identify actual root causes, distinguishing symptoms from contributing factors and true origins.

## Guiding Principle

> *"Treating symptoms is maintenance. Finding root causes is engineering."*

## Procedure

### Step 1 — Symptom Documentation
1. Catalog all observable symptoms: errors, performance degradation, unexpected behavior.
2. Classify symptoms by severity and frequency.
3. Establish a timeline: when did symptoms first appear?
4. Correlate symptoms with recent changes (deployments, config changes, dependency updates).
5. Document each symptom with evidence `[HECHO]`.

### Step 2 — Causal Chain Tracing
1. For each symptom, apply the "5 Whys" technique to trace the causal chain.
2. Follow the code path from the symptom location backward through call chains.
3. Check for environmental factors: configuration, data, external dependencies.
4. Identify branching causes: multiple independent causes for the same symptom.
5. Document each level of the causal chain with evidence tags.

### Step 3 — Root Cause Identification
1. Distinguish symptoms (what you see) from contributing factors (what made it worse) from root causes (what started it).
2. Verify the proposed root cause: would removing it prevent all symptoms?
3. Check for multiple root causes that combine to produce the observed behavior.
4. Validate against the timeline: does the root cause precede all symptoms?
5. Tag findings: `[HECHO]` for verified, `[INFERENCIA]` for likely, `[SUPUESTO]` for hypothetical.

### Step 4 — Root Cause Report
1. Present each root cause with its full causal chain.
2. Recommend corrective actions (fix the root cause) vs. mitigations (reduce impact).
3. Suggest preventive measures to avoid recurrence.
4. Produce a causal chain diagram in Mermaid.

## Quality Criteria
- Clear distinction between symptoms, contributing factors, and root causes
- Each causal link supported by code or data evidence `[HECHO]`
- Causal chain validated against timeline
- Corrective vs. mitigation actions clearly separated

## Anti-Patterns
- Stopping at the first plausible cause without tracing deeper
- Confusing correlation with causation (timing coincidence)
- Blaming "human error" as a root cause (it's always a system design issue)
- Proposing fixes without verifying they address the actual root cause
