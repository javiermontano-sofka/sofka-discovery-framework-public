# How to create a priming-rag from a URL (via NotebookLM)

**When you need this**: A public reference (vendor docs, RFC, blog) contains context the pipeline needs.

**Prerequisites**: `nlm doctor` passes.

**Time**: 5-15 min per URL.

## Steps

1. Create (or reuse) a notebook for this engagement:

   ```
   /sdf:notebook-create --name <engagement>-<topic>
   ```

2. Add the URL as a source:

   ```
   /sdf:notebook-add --url https://...
   ```

   Under the hood: `mcp__notebooklm__source_add(source_type=url, url=...)`.

3. Kick off a grounded synthesis:

   ```
   /sdf:notebook-research --notebook <name> --prompt "Summarize X as it relates to Y"
   ```

4. Export the synthesis as priming-rag:

   ```
   /sdf:notebook-query --notebook <name> --as-priming-rag
   ```

   Produces `.discovery/priming-rag-<notebook>.md`.

5. Claims in downstream deliverables cite with `[NOTEBOOKLM:<notebook>:<source>]`.

## Verification

- Priming-rag file exists.
- Citations resolve (check notebook source list).
- Synthesis is grounded (each paragraph has source citations).

## Common pitfalls

- URL behind auth or paywall → NLM can't fetch. Save locally first; use `feed-large-pdf-via-fase-0.md` instead.
- Notebook not found across sessions → `nlm login switch <profile>` may have changed account; `/sdf:notebook-list`.
- Using NLM synthesis where a direct `[ADJUNTO]` citation would be stronger → open the cited source, re-cite directly.

## See also

- [ADR-0009](../adr/0009-notebooklm-mcp-embedded.md)
- [`../explanation/why-notebooklm-mcp.md`](../explanation/why-notebooklm-mcp.md)
- `references/ontology/notebooklm-capabilities.md`
