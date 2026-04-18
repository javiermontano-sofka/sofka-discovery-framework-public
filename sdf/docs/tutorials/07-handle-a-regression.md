# Tutorial 07 — Handle a doc regression (antifragile loop in practice)

**Goal**: Simulate a simple doc bug, apply the 5-step corrections loop, end with a permanent improvement.

**Prerequisites**: Tutorial 06 done. Familiarity with the antifragile loop concept.

**Time**: ~45 min.

## The simulated bug

We'll pretend the SDF README says "48 agents" when the true count is 49. (It doesn't — this is tutorial play-acting.)

## Step 1 — Simulate the bug

Open `sdf/README.md` and temporarily (locally only; don't commit) edit one "49 agents" mention to "48 agents".

## Step 2 — Run the validators

```bash
bash sdf/scripts/validators/run-all.sh
```

`count-parity.py` should flag:

```
[ERROR] sdf/README.md: claim "48 agents" ≠ filesystem count 49
```

The validator caught what a human might miss. This is step 3 (add a validator) already applied — the validator was shipped in B9.

## Step 3 — Fix

Revert the "48 agents" back to "49 agents".

## Step 4 — Record the lesson

Even though this was simulated, practice the loop:

```bash
bash sdf/scripts/ecosystem/record-lesson.sh count-drift
```

Fill the template. Date, mistake ("tutorial — simulated count drift"), root cause ("demo"), fix ("reverted edit"), validator-added ("count-parity.py — pre-existing").

## Step 5 — Check CHANGELOG

In a real regression you'd add a CHANGELOG entry. For the tutorial, read an existing entry:

```bash
head -30 sdf/CHANGELOG.md
```

Notice how v13.4.1 entries reference validators + ADRs.

## Step 6 — Reflect

Observe:

- **Step 1 (fix)** was trivial because the drift was visible.
- **Step 3 (validator)** was already in place because prior lessons built it.
- **Step 2 (lesson)** captured the event for future memory.

This is the antifragile property at work: each cycle strengthens the next.

## Step 7 — Review what a real regression looks like

Open `sdf/references/ontology/lessons-learned.md`. Read the entry dated 2026-04-17 — the "215 skills" drift lesson that this cycle's count-parity validator was built from.

## What success looks like

- Validator caught the drift.
- You ran the loop end-to-end.
- You can articulate why "fix + move on" is insufficient.

## What's next

You've completed the tutorial series. Next steps:

- Run your first real engagement with `/sdf:run-guided`.
- Read [`/docs/explanation/architecture-overview.md`](../explanation/architecture-overview.md) for breadth.
- Browse [`/docs/adr/`](../adr/README.md) for the decision space.
- Contribute: start with [`/docs/how-to/author-new-skill.md`](../how-to/author-new-skill.md).

Welcome to SAGE.
