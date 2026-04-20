# SDF Security (plugin-specific)

Monorepo-level policy: [`../SECURITY.md`](../SECURITY.md). This file covers **SDF-only** particulars.

## SDF attack surface (plugin-specific)

1. **Bundled `.mcp.json`** — loads `notebooklm-mcp` binary from PATH. Upstream repo: https://github.com/jacob-bd/notebooklm-mcp-cli. MITM via PATH hijack is the primary concern; `scripts/nlm-install.sh` prefers `uv tool install` to avoid PATH pollution.
2. **Hooks** (`hooks/hooks.json`) — SessionStart + PostToolUse. Content is hand-auditable (≤50 lines). Any change to hooks triggers PR review from Javier.
3. **Ecosystem batch scripts** (`scripts/ecosystem/*.py`) — mutate 100s of files per run. Always run with `--dry-run` first (where supported) and verify the log in `scripts/ecosystem/logs/`.
4. **Validators** (`scripts/validators/*.py`) — run untrusted repo content through regex. `_manifest.yaml:acronym_whitelist` is a trust boundary; adding an entry means trusting that token won't be a false-positive.
5. **NotebookLM OAuth tokens** — stored by `nlm login` in `~/.config/nlm/` (upstream). Never committed. `scripts/notebook-auth-check.sh` only checks existence, never logs token contents.

## SDF-specific mitigations

### `.discovery/` is always gitignored

`.gitignore` excludes `.discovery/`, `scripts/.venv/`, `evals-workspace/`, `scripts/ecosystem/logs/`. Accidental commits of priming-rag docs (which may contain redacted-but-recoverable secrets) cannot happen through normal `git add .`.

### Evidence protocol limits data exposure

`@quality-guardian` fails any deliverable that leaks `[REDACTED]` tokens, raw API keys, or unexpanded environment variables. Evidence tags are enforced at every gate — a malicious skill cannot fabricate a `[CÓDIGO]` citation without pointing to a real repo path.

### Sibling plugin isolation

`metodologia-discovery-framework/` (MAO, GPL-3.0), `pm-project-framework/`, `sovereign-architect/`, and `plugin-qa/` live inside `sdf/` but follow independent release cycles. A security fix to SDF core does NOT automatically apply to siblings. Report SDF-core fixes as SDF; report sibling issues separately with the sibling's release channel.

## Supply-chain posture

- **Python deps** pinned in `requirements.txt` with minimum versions (`>=`). Not lockfile-pinned — this is a trade-off: easier updates, more exposure to upstream regressions. Upgrade path: test locally, bump `requirements.txt`, confirm `pytest` green, commit.
- **NotebookLM MCP binary** — delivered via `notebooklm-mcp-cli` PyPI package. Signature verification is not currently part of install; consider pinning SHA in the install script if upstream publishes hashes.

## Non-goals

This plugin does not:
- Open network connections (besides NotebookLM MCP which the user explicitly authorizes via `nlm login`).
- Modify files outside the plugin tree (`.discovery/` is under the user's cwd, not inside the plugin).
- Exfiltrate data to external services.

---

**Author**: Javier Montaño · **Contributors**: Jean Ruiz Granda, Catherine Rodrigo · **Co-authored with**: Claude Code · **Copyright**: © 2026 Sofka Technologies. All Rights Reserved. Tecnología para sofkianos.  
**Tagline**: Tecnología para sofkianos.
