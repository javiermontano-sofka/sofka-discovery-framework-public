# `[NOTEBOOKLM]`

- **Priority**: 5 / 8
- **Class (CSS)**: `t td`

## When to use

A claim grounded in a NotebookLM synthesis ([ADR-0009](../../adr/0009-notebooklm-mcp-embedded.md)). NLM provides citation-grounded summaries over a set of sources; the tag acknowledges that the synthesis is second-hand evidence — NLM did the work.

## Locator format

```
[NOTEBOOKLM:<notebook-name>:<source-id>]
[NOTEBOOKLM:bancoomeva-discovery:transactions.xlsx]
[NOTEBOOKLM:cross-notebook-query:result-id=q8274]
```

Notebook name identifies the NLM notebook; source-id points at the NLM source (file ID or cross-query result).

## Examples

- `El ETL actual procesa 4.2M registros diarios [NOTEBOOKLM:banco-discovery:etl-spec.pdf]`

## NOT to use for

- Claims that can be traced directly to a source file — prefer `[ADJUNTO]`, which is higher priority and more auditable.
- NLM outputs treated as authoritative — NLM can still hallucinate within grounded docs; verify before upgrading priority.

## Reviewer check

Open the NotebookLM notebook. Verify the source exists. If NLM's summary drifts from the source, cite the source directly with `[ADJUNTO]` instead.
