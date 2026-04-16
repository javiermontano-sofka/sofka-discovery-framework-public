---
name: friction-detector
author: JM Labs (Javier Montaño)
description: >
  Systematic scan across 10 friction categories affecting development velocity.
  Trigger: "detect friction", "what's slowing us down", "friction analysis", "velocity blockers".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Friction Detector

Systematically identify friction across 10 categories that reduce development velocity, code quality, and team effectiveness.

## Guiding Principle

> *"Friction is invisible until you measure it. Small frictions compound into massive slowdowns."*

## Procedure

### Step 1 — Tooling & Build Friction
1. Measure build/compile time and identify bottlenecks.
2. Check for missing caching in build pipeline.
3. Assess IDE support quality: type checking speed, autocomplete, error detection.
4. Identify manual steps that should be automated.
5. Score: 0 (no friction) to 10 (severe friction) per category.

### Step 2 — Code & Architecture Friction
1. **Complexity friction**: Functions/classes too large or complex to understand quickly.
2. **Coupling friction**: Changes in one module require changes in many others.
3. **Naming friction**: Inconsistent or misleading names that require context-switching.
4. **Pattern friction**: Multiple patterns for the same problem (inconsistency).
5. **Abstraction friction**: Wrong abstraction level — too abstract or too concrete.

### Step 3 — Process & Workflow Friction
1. **Review friction**: PR review bottlenecks, unclear review standards.
2. **Testing friction**: Slow tests, flaky tests, difficult test setup.
3. **Deployment friction**: Manual steps, long deployment times, risky rollbacks.
4. **Communication friction**: Tribal knowledge, missing documentation, unclear ownership.
5. **Onboarding friction**: Time to productivity for new team members.

### Step 4 — Friction Report
1. Score each of the 10 categories on a 0-10 scale with evidence.
2. Calculate a total friction index (sum / 100).
3. Identify the top 3 friction multipliers (frictions that make other frictions worse).
4. Recommend friction-reduction actions ranked by effort vs. impact.

## Quality Criteria
- Each friction score backed by specific evidence `[HECHO]`
- All 10 categories assessed, not just the obvious ones
- Friction multipliers identified (cascading effects)
- Recommendations include effort estimates

## Anti-Patterns
- Only measuring build time as a proxy for all friction
- Ignoring cognitive and process friction (they're harder to measure but often worse)
- Treating friction reduction as a one-time project instead of ongoing practice
- Blaming individuals instead of identifying systemic friction sources
