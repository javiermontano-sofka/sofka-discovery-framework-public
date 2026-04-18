# Why NotebookLM MCP (and how we use it without overcommitting)

NotebookLM is Google's grounded-synthesis tool: give it 10-50 source documents, get back citation-anchored answers. For pre-sales discovery — where clients arrive with tens of specs, contracts, and process documents — it's a force multiplier. The `notebooklm-mcp-cli` package (Jacob BD, upstream) packages both a CLI (`nlm`) and an MCP server (`notebooklm-mcp`), letting SDF use it programmatically from the same auth context.

This essay explains why we embed it, where it fits in the evidence hierarchy, and how we limit vendor lock-in.

## The problem

Claude's context window is large but bounded. A 50-PDF discovery corpus blows it. The two alternatives — ignore the documents (lose fidelity) or manually summarize each (slow, human-graded) — both fail at pre-sales scale.

NotebookLM solves this specifically: its grounded synthesis is the documents' own voice, cited and traceable. A cited summary is not a hallucination even when the original documents exceed context.

## Why MCP, not REST

Direct REST integration with NotebookLM's private endpoints is brittle (they change). The MCP server (`notebooklm-mcp`) wraps them and exposes a stable tool surface (source_add, studio_create, etc.). Changes at Google can be absorbed in the MCP layer without SDF changes.

Separately: MCP integrates natively with Claude Code. No custom auth layer, no bespoke prompt wiring — tools appear in the agent's toolset.

## Evidence hierarchy positioning

`[NOTEBOOKLM]` sits at priority 5 of 8 — below `[DOC]` but above `[STAKEHOLDER]`:

```
CÓDIGO > ADJUNTO > CONFIG > DOC > NOTEBOOKLM > STAKEHOLDER > INFERENCIA > SUPUESTO
```

Why not higher: NLM can still hallucinate within grounded docs; the grounding is evidence of source existence, not perfect fidelity of synthesis. Direct citation (`[ADJUNTO]`) is stronger when available.

Why not lower: NLM's synthesis is grounded in named sources with page-level citations. It's stronger than unsourced inference.

The practical workflow: use NLM for corpus-level understanding; when a specific claim is load-bearing, open the cited source and re-cite as `[ADJUNTO]` (stronger) or `[DOC]`.

## How we limit vendor lock-in

- **Output is markdown.** NLM's synthesis is saved to a priming-rag doc. If NLM vanishes, the markdown remains.
- **Source docs are owned.** NLM holds references; the source PDFs/CSVs live in `.discovery/inbox/` or a user-controlled location.
- **Evidence tags preserve attribution.** `[NOTEBOOKLM:<notebook>:<source>]` is traceable regardless of platform.
- **No orchestration depends on NLM.** Pipelines work without it; NLM accelerates when available.

## Authentication model

`nlm login` authenticates once; both CLI and MCP share the token. OAuth refresh happens transparently.

Failure mode: stale token fails silently. Recovery: `nlm login` again. `scripts/notebook-auth-check.sh` pre-flights before pipeline runs.

## When NLM doesn't help

- **Small corpora.** Fewer than ~10 documents fit Claude's context directly; NLM adds an unnecessary hop.
- **Highly structured data.** CSVs and JSON are better parsed by extractors (FASE 0), not synthesized by NLM.
- **Very fresh content.** NLM indexing has latency; newly-added sources may not be queryable immediately.

## Costs

- **External dependency.** Google account + NLM availability.
- **Unofficial upstream.** `notebooklm-mcp-cli` is community-maintained. Breakage risk is bounded but non-zero.
- **Data residency.** NLM stores source docs on Google's infrastructure. For certain clients (banking, gov), this is a no-go — document in engagement intake.

## Related

- [ADR-0009](../adr/0009-notebooklm-mcp-embedded.md)
- [ADR-0002](../adr/0002-evidence-tag-priority-chain.md) (the `[NOTEBOOKLM]` tag)
- `references/ontology/notebooklm-capabilities.md`
- Upstream: https://github.com/jacob-bd/notebooklm-mcp-cli
