# NotebookLM Capabilities — CLI + MCP Unified

> SDF bundles the unified `notebooklm-mcp-cli` package (github.com/jacob-bd/notebooklm-mcp-cli) which ships **both** a command-line interface (`nlm`) and an MCP server (`notebooklm-mcp`) in a single install. The same tools are available in both surfaces.

## Installation

```bash
# uv (recommended)
uv tool install notebooklm-mcp-cli

# or via pip
pip install notebooklm-mcp-cli

# or via pipx
pipx install notebooklm-mcp-cli

# or via uvx (no install, run directly)
uvx --from notebooklm-mcp-cli nlm --help
```

After install, two binaries are on PATH:
- `nlm` — interactive/scriptable command-line
- `notebooklm-mcp` — stdio MCP server (bundled in `sdf/.mcp.json`)

## Authentication

Single-command auth via OAuth (browser-based):

```bash
nlm login                      # primary account
nlm login switch <profile>     # switch Google Account
nlm doctor                     # diagnose issues
```

Auth scripts bundled with SDF:

- `scripts/notebook-auth-check.sh` — exit 0 if authenticated
- `scripts/notebook-bootstrap.sh` — guided first-time setup

## Capability matrix (35 MCP tools · equivalent CLI commands)

| Capability | MCP Tool | CLI Command |
|------------|----------|-------------|
| List notebooks | `notebook_list` | `nlm notebook list` |
| Create notebook | `notebook_create` | `nlm notebook create` |
| Get notebook details | `notebook_get` | `nlm notebook describe` |
| Rename notebook | `notebook_rename` | `nlm notebook rename` |
| Delete notebook | `notebook_delete` | `nlm notebook delete` |
| Query notebook (persists) | `notebook_query` | `nlm notebook query` |
| Long query (async) | `notebook_query_start` + `notebook_query_status` | `nlm notebook query --async` |
| Cross-notebook query | `cross_notebook_query` | `nlm cross query` |
| Add source (URL/text/Drive/file) | `source_add` | `nlm source add` |
| List Drive-synced sources | `source_list_drive` | `nlm source list drive` |
| Sync Drive sources | `source_sync_drive` | `nlm source sync` |
| Rename source | `source_rename` | `nlm source rename` |
| Delete source | `source_delete` | `nlm source delete` |
| Describe source | `source_describe` | `nlm source describe` |
| Get source content | `source_get_content` | `nlm source get` |
| Create Studio content (audio/video/slides/infographic/mindmap/data-table/flashcards/quiz/report) | `studio_create` | `nlm studio create` |
| Revise slide deck | `studio_revise` | `nlm slides revise` |
| Studio status (poll for artifacts) | `studio_status` | `nlm studio status` |
| Delete Studio artifact | `studio_delete` | `nlm studio delete` |
| Download artifact (audio/video/slides/etc) | `download_artifact` | `nlm download <type>` |
| Export artifact | `export_artifact` | `nlm export <type>` |
| Research start (web/Drive) | `research_start` | `nlm research start` |
| Research status | `research_status` | `nlm research status` |
| Research import into notebook | `research_import` | `nlm research import` |
| Note management | `note` (create/list/update/delete) | `nlm note {create,list,update,delete}` |
| Batch operations | `batch` | `nlm batch query/create/delete` |
| Pipeline (multi-step workflows) | `pipeline` | `nlm pipeline run/list` |
| Tag + smart select | `tag` | `nlm tag add/list/select` |
| Share notebook publicly | `notebook_share_public` | `nlm share public` |
| Share notebook via invite | `notebook_share_invite` | `nlm share invite` |
| Share status | `notebook_share_status` | `nlm share status` |
| Batch share | `notebook_share_batch` | `nlm share batch` |
| Server info | `server_info` | `nlm server info` |
| Refresh auth tokens | `refresh_auth` | `nlm auth refresh` |
| Save auth tokens (fallback) | `save_auth_tokens` | `nlm auth save` |
| Configure AI tool integration | — | `nlm setup add {claude-code, gemini, cursor, cline, antigravity, json}` |
| Install skill package | — | `nlm skill install` / `nlm skill update` |
| Diagnose issues | — | `nlm doctor` |

## How SDF uses each surface

### MCP surface (`mcp__notebooklm__*` tools)

Automatic whenever the plugin is loaded. Agents list it in their `tools:` frontmatter:

```yaml
tools:
  - Read
  - Grep
  - mcp__notebooklm__notebook_query
  - mcp__notebooklm__notebook_list
  - mcp__notebooklm__research_start
```

Default for `@sofka-discovery-conductor`, `@sofka-research-scientist`, `@sofka-docs-steward`, and any skill that references `[NOTEBOOKLM]` evidence.

### CLI surface (`nlm`)

Available in every plugin command via Bash. Example usages:

```bash
# Ad-hoc research during a committee run
nlm notebook create "AcmeCorp discovery 2026"
nlm source add AcmeCorp --url https://acmecorp.com/tech-stack
nlm source add AcmeCorp --file ./contract.pdf
nlm notebook query AcmeCorp "¿Qué stack tiene AcmeCorp?"

# Generate an audio briefing for the committee's TL;DR
nlm studio create AcmeCorp --type audio --confirm
# → poll until ready
nlm studio status AcmeCorp --latest
# → download
nlm download audio AcmeCorp <artifact-id>

# Skill install (from upstream `nlm skill` catalog)
nlm skill install <skill-name>

# Diagnose auth/connection issues
nlm doctor
```

## Bundled `.mcp.json`

```json
{
  "mcpServers": {
    "notebooklm": {
      "type": "stdio",
      "command": "notebooklm-mcp",
      "args": ["--transport", "stdio", "--query-timeout", "180"],
      "env": { "NOTEBOOKLM_MCP_DEBUG": "false" }
    }
  }
}
```

The `notebooklm-mcp` binary auto-appears on PATH after `uv tool install notebooklm-mcp-cli` (or any of the pip/pipx alternatives).

## Evidence tag contract

Anything the committee derives from a notebook query MUST carry the `[NOTEBOOKLM]` tag with notebook ID + query. Example:

```markdown
El roadmap S/4HANA Cloud 2026 H1 prioriza Green Ledger y AI-first Fiori
[NOTEBOOKLM:nb-abc123:"roadmap S/4 2026 H1 priorities"].
```

`@sofka-quality-guardian` validates that every `[NOTEBOOKLM]` tag resolves to a real notebook query that the orchestrator executed in this session.

## Disclaimer (upstream)

The `notebooklm-mcp-cli` package uses NotebookLM's internal APIs:
- Undocumented and may change without notice
- Requires cookie-based auth extracted from the browser
- Tested with Pro/free tiers; enterprise untested

Use at your own risk for internal PreSales / consulting purposes.

## References

- Upstream: https://github.com/jacob-bd/notebooklm-mcp-cli
- PyPI: https://pypi.org/project/notebooklm-mcp-cli/
- CLI guide: https://github.com/jacob-bd/notebooklm-mcp-cli/blob/main/docs/CLI_GUIDE.md
- MCP guide: https://github.com/jacob-bd/notebooklm-mcp-cli/blob/main/docs/MCP_GUIDE.md

---

**Author**: Javier Montaño
**Contributors**: Jean Ruiz Granda (ad-hoc feedback & review) · Catherine Rodrigo
**Co-authored with**: Claude Code
**Upstream tool by**: Jacob BD (github.com/jacob-bd)
**Copyright**: © 2026 Sofka Technologies. All Rights Reserved (this doc only).
