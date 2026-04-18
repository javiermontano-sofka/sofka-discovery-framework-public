# How to re-index the repo after a big change

**When you need this**: Large code or doc migration; `.discovery/repo-index.json` is stale; priming-rag references drift.

**Prerequisites**: Git working tree clean (or intentional).

**Time**: 1-3 min (index) + longer if RAG priming needed.

## Steps

1. Regenerate the repo index:

   ```bash
   bash sdf/scripts/index-repo.sh
   ```

2. Refresh session priming:

   ```
   /sdf:prime-repo --refresh
   ```

3. If priming-rag docs are stale (e.g. files they referenced moved), regenerate specific ones:

   ```
   /sdf:prime-repo --adjuntos <path-to-moved-file>
   ```

4. Run docs validators to catch cross-ref drift:

   ```bash
   bash sdf/scripts/validators/run-all.sh
   ```

## Verification

- `.discovery/repo-index.json` timestamp is recent.
- `cross-refs.py` reports 0 broken references.
- `ghost-menu.md` reflects current state.

## Common pitfalls

- Running during a long session may invalidate in-memory agent state. Start a new session if possible.
- Re-indexing doesn't purge `.discovery/`; delete stale `priming-rag-*` files manually if desired.

## See also

- `scripts/index-repo.sh`
- `references/ontology/session-automation.md`
