# Tutorial 03 — Deep research via NotebookLM

**Goal**: Create a NotebookLM notebook for an engagement, kick off a deep research, import the grounded synthesis as a priming-rag.

**Prerequisites**: `nlm login` succeeded. `nlm doctor` passes. You have 3-5 relevant URLs or PDFs for research.

**Time**: ~30 min (mostly async — NLM deep research takes a few minutes to complete).

## Step 1 — Install / verify NotebookLM MCP

```bash
bash sdf/scripts/nlm-install.sh
nlm doctor
```

Expect `OK — authenticated`.

## Step 2 — Create a notebook

```
/sdf:notebook-create --name acme-retail-modernization
```

## Step 3 — Add sources

Add a URL:

```
/sdf:notebook-add --notebook acme-retail-modernization --url https://martinfowler.com/articles/break-monolith-into-microservices.html
```

Add a local PDF:

```
/sdf:notebook-add --notebook acme-retail-modernization --file .discovery/inbox/arch-spec.pdf
```

## Step 4 — Kick off deep research

```
/sdf:notebook-research \
    --notebook acme-retail-modernization \
    --prompt "What are the key risks in strangler-fig migration for a mid-size e-commerce monolith, citing sources?"
```

This is async. Poll status:

```
/sdf:notebook-research-status --notebook acme-retail-modernization
```

Wait until `status: complete`.

## Step 5 — Import the synthesis as priming-rag

```
/sdf:notebook-query --notebook acme-retail-modernization --as-priming-rag
```

Produces `.discovery/priming-rag-acme-retail-modernization.md`.

## Step 6 — Use in a deliverable

Run or re-run a pipeline stage. Claims now cite `[NOTEBOOKLM:acme-retail-modernization:<source>]` where the NLM synthesis was grounded.

## What success looks like

- Notebook exists; sources added.
- Deep research completed.
- Priming-rag file contains cited synthesis.
- Downstream deliverables leverage `[NOTEBOOKLM]` evidence.

## What's next

- [Tutorial 04 — Brand HTML render](04-brand-html-render.md)
- [`docs/explanation/why-notebooklm-mcp.md`](../explanation/why-notebooklm-mcp.md)
