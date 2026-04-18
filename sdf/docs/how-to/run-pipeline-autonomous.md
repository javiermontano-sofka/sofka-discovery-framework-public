# How to run the pipeline autonomously

**When you need this**: You want an end-to-end discovery artefact with minimal supervision — e.g. overnight batch run, demo prep.

**Prerequisites**: Plugin installed; session started; `{TIPO_SERVICIO}` ready to declare.

**Time**: 3-10 hours wall-clock (unattended).

## Steps

1. Open Claude Code at the repo root.
2. Invoke:

   ```
   /sdf:run-auto --tipo <SDA|QA|RPA|Data-AI|Cloud|SAS|Management|UX-Design|Digital-Transformation|Multi-Service>
   ```

3. Attach any source files via `--adjuntos` if relevant:

   ```
   /sdf:run-auto --tipo SDA --adjuntos contracts.pdf transactions.xlsx
   ```

4. Leave it running. Gates become advisory, logged not blocking.
5. On return, review outputs in `.discovery/` and any branded HTML in root.

## Verification

- `session-state.json` shows `status: complete`.
- All P0-P9 deliverables exist.
- Gate advisories (if any) are in `ghost-menu.md` + `session-changelog.md`.

## Common pitfalls

- Gate advisories in `--auto` are silent; review the changelog before sending output.
- FASE 0 cannot run if attachment formats are unrecognized — pre-flight with `/sdf:notebook-list-extractors`.

## See also

- [`run-pipeline-with-gates.md`](run-pipeline-with-gates.md) — interactive equivalent
- [ADR-0004](../adr/0004-hitl-three-modes.md) — HITL modes rationale
