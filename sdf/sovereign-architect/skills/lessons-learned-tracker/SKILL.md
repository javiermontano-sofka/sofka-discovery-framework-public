---
name: lessons-learned-tracker
author: JM Labs (Javier Montaño)
description: >
  Captures corrections, applies learnings across sessions, and prevents regression of past mistakes.
  Trigger: "lesson learned", "capture correction", "track mistake", "prevent regression", "apply learnings".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Lessons Learned Tracker

Captures, catalogs, and applies lessons learned from user corrections, failed approaches, and process improvements — creating an institutional memory that prevents the same mistakes from recurring.

## Guiding Principle

> *"A mistake made once is a lesson. A mistake made twice is a choice. A lesson tracked is a mistake prevented."*

## Procedure

### Step 1 — Capture the Lesson
1. Detect correction events: user corrects output, approach fails, assumption proves wrong.
2. Record the lesson with structured metadata: date, context, trigger, category.
3. Capture the incorrect behavior or output (what went wrong).
4. Capture the correct behavior or output (what should have happened).
5. Identify the root cause: knowledge gap, incorrect assumption, process failure, or context loss.

### Step 2 — Classify and Catalog
1. Assign a category: formatting, technical accuracy, process adherence, tool usage, domain knowledge.
2. Assign severity: CRITICAL (repeated errors harm trust), WARNING (occasional, fixable), NOTE (minor preference).
3. Extract a one-line rule from the lesson (e.g., "NEVER use green in Sofka brand colors").
4. Link to related lessons (pattern detection: are multiple lessons pointing to the same root cause?).
5. Store in the lessons-learned registry with a unique identifier.

### Step 3 — Apply Preventive Measures
1. Update relevant skill files, templates, or checklists to incorporate the lesson.
2. Add automated checks where possible (linting rules, validation scripts).
3. Create pre-flight checklists for common task types that include lessons as checkpoints.
4. Flag lessons that require changes to the orchestration network or CLAUDE.md.
5. Notify the user of applied changes so they can verify the correction is adequate.

### Step 4 — Verify Non-Regression
1. Before each major deliverable, review applicable lessons from the registry.
2. Run a lessons-learned checklist against the output before delivery.
3. Track regression rate: how often a previously-captured lesson's mistake recurs.
4. If regression occurs, escalate the lesson to a higher severity and add stronger guardrails.
5. Conduct monthly lessons-learned reviews to archive resolved items and identify trends.

## Quality Criteria
- Every user correction results in a cataloged lesson within the same session.
- Lessons include both the wrong and right behavior with clear distinction.
- Preventive measures are applied to prevent recurrence, not just documented.
- Regression rate is tracked and trends downward over time.

## Anti-Patterns
- Capturing lessons but never reviewing them before new tasks.
- Vague lessons that do not specify the correct behavior (e.g., "do better").
- Applying lessons too narrowly (fixing only the specific instance, not the pattern).
- Accumulating hundreds of lessons without pruning, categorizing, or prioritizing.
