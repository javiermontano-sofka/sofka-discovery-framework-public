# Tutorial 04 — Render a deliverable as branded HTML

**Goal**: Take a markdown deliverable, emit a branded HTML file, verify brand compliance.

**Prerequisites**: At least one P3 or P5 deliverable exists from a previous tutorial.

**Time**: ~15 min.

## Step 1 — Locate a deliverable

```bash
ls .discovery/*.md
```

Pick one, e.g. `.discovery/P3_ASIS_AcmeRetail_{WIP}.md`.

## Step 2 — Render with the right style

```bash
bash scripts/render-brand-html.sh \
    .discovery/P3_ASIS_AcmeRetail_{WIP}.md \
    --out .discovery/P3_ASIS_AcmeRetail.html \
    --style discovery \
    --title "Análisis AS-IS — Acme Retail" \
    --lead "Snapshot del monolito actual + constraints de modernización" \
    --meta cliente="Acme Retail" fecha="2026-04-17"
```

## Step 3 — Open in browser

On macOS:

```bash
open .discovery/P3_ASIS_AcmeRetail.html
```

You should see:

- Orange hero strip at the top, black background.
- Evidence tags highlighted (orange for priority 1-4, subtle for priority 5-8).
- Tables in a scrollable wrapper (`.tw`).
- Ghost menu at the bottom (`## Siguientes pasos`).
- Footer with author + copyright.

## Step 4 — Verify brand compliance

Brand checklist:

- [ ] Primary color is `#FF7E08` orange (not another orange).
- [ ] No green anywhere.
- [ ] Font is Inter (may fall back to system if offline — layout must be stable).
- [ ] Background is cream (`#EFEAE4`), not white.
- [ ] Print preview works (no nav, no shadows).

If any fails, the template is broken; reinstall or file an issue.

## Step 5 — Try other styles

```bash
bash scripts/render-brand-html.sh \
    .discovery/P3_ASIS_AcmeRetail_{WIP}.md \
    --out /tmp/comite-view.html \
    --style comite
```

Compare. Note the nav + pills differences per style.

## What success looks like

- Deliverable renders identically across devices (determinism).
- No green. Brand-compliant.
- Print preview works.

## What's next

- [Tutorial 05 — Author a new skill](05-author-a-new-skill.md)
- [`/docs/explanation/why-brand-html-is-deterministic.md`](../explanation/why-brand-html-is-deterministic.md)
