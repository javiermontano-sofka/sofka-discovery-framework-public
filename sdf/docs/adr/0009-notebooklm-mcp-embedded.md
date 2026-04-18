# ADR-0009: NotebookLM MCP embedded via unified notebooklm-mcp-cli package

- **Status**: accepted
- **Date**: 2026-04-17
- **Deciders**: Javier Montaño
- **Supersedes**: —

## Context

NotebookLM's grounded synthesis is a force-multiplier for discovery: give it 50 PDFs, get back a cited summary. But the native UI isn't scriptable, and the unofficial REST endpoints drift. The `notebooklm-mcp-cli` package (Jacob BD, upstream) wraps both a CLI (`nlm`) and an MCP server (`notebooklm-mcp`) into one install, so SDF can use it programmatically and interactively from the same auth context.

## Decision

SDF embeds the NotebookLM integration via:

- **`.mcp.json` at plugin root** — declares the stdio MCP server so Claude Code auto-registers 35+ NLM tools when the plugin is active.
- **`scripts/nlm-install.sh`** — idempotent installer (uv / pipx / pip fallback chain).
- **`scripts/notebook-{auth-check,bootstrap}.sh`** — auth ergonomics.
- **4 `/sdf:notebook-*` commands** — create / research / query / audio.
- **Evidence tag `[NOTEBOOKLM]`** — for claims grounded in NLM synthesis (ADR-0002).

The user authenticates once via `nlm login`; both CLI and MCP share the token.

## Consequences

### Positive
- 50-PDF context ingestion that doesn't blow Claude's window.
- Grounded synthesis: NLM's citations carry into `[NOTEBOOKLM:notebook:source]` tags.
- One install, two surfaces (CLI for scripts, MCP for conversations).

### Negative
- External dependency on Google account + NLM availability.
- OAuth token has a refresh lifecycle; stale tokens fail silently until the user runs `nlm login` again.
- Upstream package is unofficial; breakage risk is bounded but non-zero.

### Neutral
- No vendor lock-in at the content layer: what comes out of NLM is markdown synthesis we store as a priming-rag doc, reusable even if NLM goes away.

## Alternatives considered

- **Pure Claude context window** — dismissed: too small for dozens of PDFs.
- **Custom RAG stack (Pinecone/Weaviate + chunker)** — dismissed: infra overhead, duplicates NLM's ready-made synthesis, worse grounding.
- **Google Vertex AI with Gemini** — dismissed: separate auth, separate cost center, reduces the monorepo's "one integration per capability" discipline.

## References

- `.mcp.json`
- `references/ontology/notebooklm-capabilities.md`
- https://github.com/jacob-bd/notebooklm-mcp-cli (upstream)
- ADR-0002 (`[NOTEBOOKLM]` evidence tag)
