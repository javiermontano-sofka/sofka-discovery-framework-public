# Security

How to report vulnerabilities, what SAGE considers in-scope, and what safeguards are already in the pipeline.

## Reporting

Email **javier.montano@sofka.com.co** with subject `[SECURITY] <short>`. Expect acknowledgement within 72 hours, remediation or status update within 7 days for confirmed issues. For anything in the plugin's execution path (hooks, MCP, attachment extractors, render) we prefer private disclosure before public issue.

If the finding involves the upstream `notebooklm-mcp-cli` package (bundled as `.mcp.json`), please also notify upstream: https://github.com/jacob-bd/notebooklm-mcp-cli.

## In scope

Within the plugin's execution surface:

- **FASE 0 attachment extractors** (`sdf/scripts/extract-*.py`, `extract-generic.sh`) — they parse user-supplied files; input validation bugs or path traversal would matter.
- **Brand HTML render** (`sdf/scripts/render_brand_html.py`, `templates/brand-html-base.html`) — injection of user-controlled content into HTML output.
- **Hooks** (`sdf/hooks/hooks.json`) — run on every session start; any injection into hook commands is elevated risk.
- **MCP server wiring** (`.mcp.json`) — if a malicious plugin impersonates `notebooklm-mcp` on PATH, what happens?
- **Validators** (`sdf/scripts/validators/*.py`) — they run untrusted repo content; regex DoS or path traversal is in scope.
- **Ecosystem scripts** (`sdf/scripts/ecosystem/*.py`) — mutate many files at once; bugs can corrupt the repo.

Out of scope: anything running inside Claude Code beyond the plugin's files (Claude Code itself, operating system, user's network, third-party MCP servers the user installs separately).

## G0 — Security Gate (what the pipeline already enforces)

The pipeline has a G0 (security) quality gate that runs before committee branching. Current mechanisms:

### Secret redaction in FASE 0

`sdf/scripts/_common.py:redact()` scrubs patterns before writing priming-rag docs:

- `api[_-]?key` = value
- `password` = value, `passwd` = value, `secret` = value, `bearer` = value
- `sk-[A-Za-z0-9]{20,}` (Anthropic/OpenAI-style keys)
- `ghp_[A-Za-z0-9]{20,}` (GitHub PATs)
- `AKIA[0-9A-Z]{16}` (AWS access keys)

Findings become `[REDACTED]` in the emitted priming doc. Limitations: patterns are lexical; structured secrets inside JSON without obvious key names can slip through. **Recommendation**: run `gitleaks` or equivalent before committing sensitive attachments.

### Path traversal protection

Extractors read paths passed as CLI args. They do NOT recursively follow symlinks by default and treat `..` as literal. Output is always written to `.discovery/priming-rag-<stem>.md` — no user-controlled write paths.

### Render output safety

`render_brand_html.py` uses `markdown` + `jinja2` with `autoescape=True` on HTML. User-supplied markdown is escaped into the HTML output; evidence tags are wrapped in safe `<span>` elements. No arbitrary HTML from the markdown source reaches the output unescaped.

### MCP server trust boundary

`.mcp.json` references `notebooklm-mcp` by binary name. Claude Code resolves via PATH. If an attacker controls PATH ahead of the legitimate install, they can MITM the MCP channel. **Mitigation**: `scripts/nlm-install.sh` uses `uv tool install` which installs to `~/.local/share/uv/tools/` — prefer that over user-controlled PATH entries. Production deployments should pin the binary path in `.mcp.json`.

### Evidence protocol as a security control

The zero-hallucination protocol doubles as a security measure: facts without provenance are rejected. If a malicious attachment attempts to inject claims via `[ADJUNTO:file:locator]` but no matching priming-rag doc exists, `@quality-guardian` fails the deliverable. Cannot fabricate evidence chains.

## Known residual risks

These are documented, not remediated — contributions welcome.

| Risk | Likelihood | Impact | Current mitigation |
|------|-----------|--------|-------------------|
| PDF with embedded JavaScript / malformed stream crashes `pypdf` | M | L (process crash, no data loss) | Try/except in extractor; writes `[VACIO_CRITICO]` and escalates |
| DOCX / PPTX parsing triggers Python stdlib XML bug (billion laughs etc.) | L | M | No XXE-style protection in `lxml`; if exploited, OOM crash |
| User attaches a 10 GB CSV | M | M (disk + slow) | Extractor processes head only beyond 200 KB; flags truncation |
| Malicious hook script placed in plugin tree | L | H | Review hooks on plugin install; `hooks.json` content is hand-auditable (~40 lines) |
| Credentials leaked in `priming-rag-*.md` despite redaction | L | H | Redaction is best-effort, not cryptographic; don't commit `.discovery/` (already in `.gitignore`) |
| Generator `heuristic-evals.py` writes files outside intended tree | L | M | Test suite covers the happy path; adversarial path injection not explicitly tested |

## Dependencies with security implications

- **`pypdf`** — parses user-supplied PDFs. Track CVEs; upgrade on advisory.
- **`openpyxl`, `python-docx`, `python-pptx`** — same for their formats.
- **`lxml`** — underlying XML parser; known for occasional CVEs (billion laughs, XXE).
- **`jinja2`** — template engine. `autoescape=True` is our posture; templates are authored by us, not user-supplied.
- **`beautifulsoup4`** — HTML parser.
- **`notebooklm-mcp-cli`** — upstream-maintained; their disclosure policy applies.

## Safe-harbour

Good-faith security research that respects user privacy, minimises data access, and coordinates disclosure is welcome. We will not pursue legal action for report-first behaviour.

---

**Author**: Javier Montaño · **Contributors**: Jean Ruiz Granda, Catherine Rodrigo · **Co-authored with**: Claude Code · **Copyright**: © 2026 Sofka Technologies. All Rights Reserved. Tecnología para sofkianos.  
**Tagline**: Tecnología para sofkianos.
