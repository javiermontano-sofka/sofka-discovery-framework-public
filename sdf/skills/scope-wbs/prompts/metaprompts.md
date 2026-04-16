# Metaprompts — Scope WBS

## Meta-Strategy 1: 100% Rule Validation

**Purpose:** Ensure WBS captures all project work without gaps or overlaps

```
Apply strict 100% rule validation:
1. Does each parent element = sum of all child elements? Check every branch.
2. Is project management work included? (Planning, monitoring, reporting)
3. Is testing/QA work included at each deliverable level?
4. Is documentation and training included?
5. Is deployment and transition work included?
Any gap violates the 100% rule and will cause scope omission downstream.
```

## Meta-Strategy 2: Decomposition Depth Optimization

**Purpose:** Ensure work packages are neither too large nor too granular

```
For each work package, verify:
1. Can it be estimated within ±15% accuracy? If not, decompose further.
2. Can it be completed within 1-2 sprints (or 8-80 hours)? If not, decompose.
3. Can it be assigned to a single owner? If not, decompose.
4. Is it so small that tracking overhead exceeds value? If yes, aggregate up.
Sweet spot: 3-5 levels of decomposition for most projects.
```

## Meta-Strategy 3: Scope Boundary Stress Test

**Purpose:** Prevent scope ambiguity at project boundaries

```
For each item marked "in scope," ask:
1. Where exactly does this item's scope END? Define the boundary.
2. What adjacent work might a stakeholder assume is included? Verify with stakeholder.
3. Is there a written acceptance criterion for this scope item?
For each item marked "out of scope," ask:
1. Has the responsible party for this work been identified?
2. Is there a dependency from out-of-scope to in-scope items?
Document all boundary clarifications.
```

*PMO-APEX v1.0 — Metaprompts · Scope WBS*
