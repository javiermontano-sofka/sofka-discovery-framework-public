# Tutorial 06 — Write your first ADR

**Goal**: Author a proposed ADR using the template, link it from a deliverable, understand the immutability contract.

**Prerequisites**: You know of a recent decision (real or hypothetical) that deserves a record.

**Time**: ~30 min.

## Step 1 — Choose the decision

For this tutorial, use: "We use Spanish LatAm register for client deliverables" (even though this is already ADR-0012, we'll scaffold a parallel throwaway).

## Step 2 — Find the next number

```bash
ls sdf/docs/adr/ | grep -E '^[0-9]{4}' | sort | tail -1
```

If the last is `0025-*`, you'd use `0026-`. For this tutorial, use `9999-tutorial-spanish-register.md` to avoid collision.

## Step 3 — Copy the template

```bash
cp sdf/docs/adr/TEMPLATE.md sdf/docs/adr/9999-tutorial-spanish-register.md
```

## Step 4 — Fill in

Edit the file. Suggested content (partial):

```markdown
# ADR-9999: Use Spanish LatAm register for client deliverables (tutorial)

- **Status**: proposed
- **Date**: 2026-04-17
- **Deciders**: <your name>

## Context

Our primary client base is in Latin America. English-first deliverables require translation ...

## Decision

Default output language: Spanish, LatAm enterprise register.

## Consequences

### Positive
- Native-quality Spanish output.

### Negative
- Extra discipline required of contributors.

## Alternatives considered
- English-first + translation — dismissed: translation adds step.

## References
- ADR-0012 (the real decision; this is a tutorial duplicate)
```

## Step 5 — Validate

```bash
python sdf/scripts/validators/adr-integrity.py
```

Expect pass (status is `proposed`; no immutability concern yet).

## Step 6 — Understand acceptance

In a real PR:

- Reviewer approves → they change `Status: proposed` to `Status: accepted`.
- Once accepted, **the file is immutable**. Only the `Superseded-by` field can change later.
- Editing an accepted ADR fails `adr-integrity.py` on the next CI run.

## Step 7 — Clean up (tutorial only)

```bash
rm sdf/docs/adr/9999-tutorial-spanish-register.md
```

## What success looks like

- You wrote an ADR.
- You understand: proposed → accepted → (maybe) superseded-by.
- You understand why editing accepted ADRs is forbidden.

## What's next

- [Tutorial 07 — Handle a regression](07-handle-a-regression.md)
- [`/docs/how-to/write-new-adr.md`](../how-to/write-new-adr.md)
- [`/docs/how-to/supersede-existing-adr.md`](../how-to/supersede-existing-adr.md)
