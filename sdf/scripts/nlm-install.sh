#!/usr/bin/env bash
# nlm-install.sh — Install or upgrade the notebooklm-mcp-cli package.
# Ships both `nlm` CLI and `notebooklm-mcp` server (stdio MCP).
#
# Idempotent: if already installed, performs upgrade.
#
# Author: Javier Montaño · Upstream tool: Jacob BD (github.com/jacob-bd/notebooklm-mcp-cli)

set -euo pipefail

PACKAGE="notebooklm-mcp-cli"

msg() { printf "[nlm-install] %s\n" "$*" >&2; }
have() { command -v "$1" >/dev/null 2>&1; }

install_via_uv() {
  if have nlm; then
    msg "nlm already installed — upgrading via uv"
    uv tool upgrade "$PACKAGE" || true
  else
    msg "installing $PACKAGE via uv"
    uv tool install "$PACKAGE"
  fi
}

install_via_pipx() {
  if have nlm; then
    msg "nlm already installed — upgrading via pipx"
    pipx upgrade "$PACKAGE" || true
  else
    msg "installing $PACKAGE via pipx"
    pipx install "$PACKAGE"
  fi
}

install_via_pip() {
  msg "installing $PACKAGE via pip (--user)"
  python3 -m pip install --user --upgrade "$PACKAGE"
}

# Choose best installer
if have uv; then
  install_via_uv
elif have pipx; then
  install_via_pipx
elif have python3; then
  install_via_pip
else
  msg "ERROR: no installer found (uv | pipx | python3)"
  exit 1
fi

# Verify
if ! have nlm; then
  msg "WARN: 'nlm' not on PATH after install. You may need to add the tool bin dir to PATH."
  msg "      uv tool: ~/.local/bin  (run: uv tool update-shell)"
  exit 2
fi
msg "OK — 'nlm' available: $(nlm --version 2>/dev/null || echo 'version unknown')"

# Check MCP server binary
if have notebooklm-mcp; then
  msg "OK — 'notebooklm-mcp' MCP server available"
else
  msg "WARN: 'notebooklm-mcp' not on PATH (CLI-only install?)"
fi

# Suggest next step
cat <<EOF

Next:
  1) Authenticate:       nlm login
  2) Verify:             nlm doctor
  3) Restart Claude Code so the bundled .mcp.json picks up the server

Detailed docs: sdf/references/ontology/notebooklm-capabilities.md
Upstream: https://github.com/jacob-bd/notebooklm-mcp-cli
EOF
