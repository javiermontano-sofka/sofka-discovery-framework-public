# How to write a new Architecture Decision Record

**When you need this**: An architectural choice is being made (or was made implicitly) that deserves a numbered record.

**Prerequisites**: The decision is actually made — ADRs record outcomes, not deliberations.

**Time**: 30-60 min.

## Steps

1. Find the next ADR number:

   ```bash
   ls sdf/docs/adr/ | grep -E '^[0-9]{4}' | sort | tail -1
   ```

2. Copy the template:

   ```bash
   cp sdf/docs/adr/TEMPLATE.md sdf/docs/adr/NNNN-<slug>.md
   ```

3. Fill in required fields:

   - `Status: proposed` initially.
   - `Date:` ISO 8601.
   - `Deciders:` names.
   - `Context` (3-6 sentences — what forcing function?).
   - `Decision` (a single concrete sentence).
   - `Consequences` (Positive / Negative / Neutral bullets).
   - `Alternatives` — at least one named alternative, with dismissal reason.
   - `References` — prior art, related ADRs, code.

4. Open PR. On merge, reviewers change status to `accepted`.
5. Once `accepted`, the file is **immutable** — no edits except flipping `Status` to `superseded-by` later.

## Verification

- `python sdf/scripts/validators/adr-integrity.py` passes.
- ADR cross-links resolve (links to other ADRs, explanation essays).
- Filename matches `NNNN-<slug>.md` convention.

## Common pitfalls

- Skipping alternatives → the ADR documents a position, not a choice.
- Editing after acceptance → `adr-integrity.py` fails (git log catches).
- Number collision in parallel PRs → last-in re-numbers.

## See also

- [ADR TEMPLATE](../adr/TEMPLATE.md)
- [`../explanation/why-adrs.md`](../explanation/why-adrs.md)
- [`supersede-existing-adr.md`](supersede-existing-adr.md)
