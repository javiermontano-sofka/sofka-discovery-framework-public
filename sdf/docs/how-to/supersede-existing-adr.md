# How to supersede an existing ADR

**When you need this**: A past decision is being reversed or materially changed.

**Prerequisites**: The old ADR is `status: accepted`; the new thinking is ready to be recorded.

**Time**: 30-60 min.

## Steps

1. Write the new ADR following [`write-new-adr.md`](write-new-adr.md). In its frontmatter:

   ```yaml
   supersedes: NNNN   # the ADR being replaced
   ```

   In the Context section, explain why the old decision no longer holds.

2. In the old ADR (`NNNN-<slug>.md`), edit **only** the Status line:

   ```
   - **Status**: superseded-by MMMM
   ```

   Do NOT edit anything else in the old ADR. `adr-integrity.py` allows this one field to change.

3. Add a `Superseded-by:` field in the old ADR if it wasn't there (empty before):

   ```
   - **Superseded-by**: MMMM
   ```

4. Open PR; reviewers accept both ADRs together.

## Verification

- Both ADRs remain visible in `docs/adr/`.
- `adr-integrity.py` passes — only the Status/Superseded-by fields changed on the old ADR.
- `docs/adr/README.md` index reflects the supersede chain.

## Common pitfalls

- Editing the old ADR's body — breaks immutability; `adr-integrity.py` fails.
- Deleting the old ADR — never. History is a feature.
- Forgetting to update the Status on the old ADR — readers land there without the pointer forward.

## See also

- [`write-new-adr.md`](write-new-adr.md)
- [ADR README](../adr/README.md) — supersede lifecycle
