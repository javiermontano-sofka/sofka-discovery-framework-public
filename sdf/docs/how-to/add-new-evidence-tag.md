# How to add a new evidence tag (rare; requires ADR)

**When you need this**: A new evidence class emerges that doesn't fit the existing 8 tags.

**Warning**: Evidence tags are a stable contract. Adding one is a breaking change; requires an ADR superseding [ADR-0002](../adr/0002-evidence-tag-priority-chain.md). Use sparingly.

**Time**: 2-4 h including ADR + propagation.

## Steps

1. Write the superseding ADR: `sdf/docs/adr/NNNN-<slug>.md` (status `proposed`).
2. In the ADR:
   - Name the new tag (uppercase, Spanish where appropriate).
   - Position in the priority chain — which existing tags it sits between, and why.
   - Update the canonical chain.
3. On acceptance, update:
   - `references/ontology/protocol-zero-hallucination.md` — canonical chain.
   - `sdf/docs/reference/evidence-tags/README.md` — index.
   - `sdf/docs/reference/evidence-tags/<slug>.md` — spec (follow existing pattern).
   - `scripts/render_brand_html.py` — tag wrapping + CSS class.
   - `templates/brand-html-base.html` — CSS class definition (no green!).
4. Flip original ADR-0002 `status: superseded-by NNNN` (only field editable post-acceptance).

## Verification

- `count-parity.py` manifest updated (8 → 9 evidence tags).
- Render pipeline wraps the new tag in a span.
- Existing deliverables still render (no regression).

## Common pitfalls

- Changing priority order of existing tags — that's a different supersede; two ADRs, not one.
- Forgetting to update the CSS class map → tag renders unstyled.
- Adding a tag that duplicates an existing one with a nuance — prefer using locators within the existing tag.

## See also

- [ADR-0002](../adr/0002-evidence-tag-priority-chain.md)
- [`../explanation/why-evidence-tags.md`](../explanation/why-evidence-tags.md)
