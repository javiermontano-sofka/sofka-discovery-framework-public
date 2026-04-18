# Tutorial 02 — Feed attachments via FASE 0

**Goal**: Ingest a spreadsheet and a PDF, watch them become `[ADJUNTO]` evidence in a deliverable.

**Prerequisites**: Tutorial 01 complete. Two files: a CSV (e.g. transaction log) and a PDF (e.g. architecture spec). Use any real files you have; client data works.

**Time**: ~20 min.

## Step 1 — Prepare the inbox

```bash
mkdir -p .discovery/inbox
cp ~/path/to/transactions.csv .discovery/inbox/
cp ~/path/to/arch-spec.pdf .discovery/inbox/
```

## Step 2 — Prime the session with attachments

```
/sdf:prime-repo --adjuntos .discovery/inbox/transactions.csv .discovery/inbox/arch-spec.pdf
```

The orchestrator dispatches to the CSV extractor and the PDF extractor. You'll see:

```
[FASE 0] Extracting transactions.csv ... OK (145 rows, 12 columns)
[FASE 0] Extracting arch-spec.pdf ... OK (48 pages)
[FASE 0] Emitted .discovery/priming-rag-transactions.md
[FASE 0] Emitted .discovery/priming-rag-arch-spec.md
```

## Step 3 — Inspect a priming-rag

```bash
cat .discovery/priming-rag-transactions.md | head -40
```

You'll see a normalized markdown rendering of the CSV — columns, first N rows, detected patterns.

## Step 4 — Run a pipeline stage that uses the attachments

```
/sdf:go P3
```

P3 AS-IS now has real evidence. Claims cite `[ADJUNTO:transactions.csv:row=42]` or `[ADJUNTO:arch-spec.pdf:page=12]`.

## Step 5 — Verify traceability

Pick a claim. Click (or `Ctrl+F` to find) the locator. Open the source file at that page/row. Confirm the claim is actually there.

This is the zero-hallucination protocol in action.

## What success looks like

- Two priming-rag files in `.discovery/`.
- P3 AS-IS evidence density ≥ 60 % at priority 1-4 tags.
- Every `[ADJUNTO]` claim traceable to a specific locator.

## What's next

- [Tutorial 03 — NotebookLM research](03-notebooklm-research.md)
- [`docs/how-to/feed-large-pdf-via-fase-0.md`](../how-to/feed-large-pdf-via-fase-0.md) — for large PDFs
