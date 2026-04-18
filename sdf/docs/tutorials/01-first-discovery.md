# Tutorial 01 — Your first discovery in 45 minutes

**Goal**: Produce your first 3 deliverables (Plan · AS-IS · Roadmap) for a fictional client using `/sdf:run-express`.

**Prerequisites**: SDF plugin installed. Claude Code open. A fresh git-clean working directory.

**Time**: ~45 min (unattended ~30 min; ~15 min reviewing).

## What you'll build

An express discovery pack for "Acme Retail", a fictional mid-sized e-commerce company looking to modernize its monolith.

## Step 1 — Start the session

Open Claude Code at the repo root. Hooks regenerate `.discovery/SESSION-*.md` automatically.

Confirm the plugin is active:

```
/sdf:menu
```

You should see a palette of SDF commands.

## Step 2 — Prime the session (optional)

If you have attachments (you don't yet), you'd drop them in `.discovery/inbox/` and run `/sdf:prime-repo --adjuntos …`. For this tutorial, skip it.

## Step 3 — Invoke the express pipeline

```
/sdf:run-express --tipo SDA --cliente "Acme Retail"
```

The orchestrator asks clarifying questions. Answer briefly:

- **Industry**: "E-commerce".
- **Main pain**: "Monolith slows down feature delivery; want to modernize."
- **Scope**: "Architecture assessment + roadmap."

## Step 4 — Watch the pipeline

You'll see:

1. **P0 Plan** — orchestrator composes the engagement plan.
2. **P3 AS-IS** — the committee synthesizes the current-state snapshot from available evidence (will be heavy on `[SUPUESTO]` since we have no real attachments).
3. **G1** gate — advisory (express mode reduces gates to G1 + G3).
4. **P5 Scenarios** — 3 candidate modernization paths.
5. **P6 Roadmap** — with FTE ranges (no prices).
6. **G3** gate — final review.

## Step 5 — Review the deliverables

Check `.discovery/`:

```bash
ls .discovery/
```

You should see `P0_*`, `P3_*`, `P5_*`, `P6_*` files. Open them. Notice:

- Every claim has an evidence tag.
- `[SUPUESTO]` dense because no attachments — banner warning.
- Ghost menu at the bottom of each.

## Step 6 — Render one as HTML

```
/sdf:render-html .discovery/P3_ASIS_AcmeRetail_{WIP}.md --style discovery
```

Open the resulting `.html` in your browser. Confirm orange + black + gold, no green.

## What success looks like

- 4 deliverables in `.discovery/`.
- One branded HTML.
- Ghost menu on every deliverable pointing to next steps.
- You know where to click next.

## What's next

- [Tutorial 02 — Feed attachments via FASE 0](02-feed-attachments.md)
- [`/docs/how-to/run-pipeline-with-gates.md`](../how-to/run-pipeline-with-gates.md) — for deeper engagements
