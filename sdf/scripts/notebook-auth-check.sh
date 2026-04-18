#!/usr/bin/env bash
# notebook-auth-check.sh
# Verifies NotebookLM MCP server is installed and user is authenticated via OAuth.
# Exit codes: 0 = ready, 1 = not installed, 2 = not authenticated
# Author: Diseñado por Javier Montaño

set -o pipefail

echo "=== NotebookLM MCP Auth Check ==="

# 1. Check binary
NLM_BIN=""
for candidate in \
  "notebooklm-mcp" \
  "/Users/deonto/.local/share/uv/tools/notebooklm-mcp-server/bin/notebooklm-mcp" \
  "/usr/local/bin/notebooklm-mcp"; do
  if command -v "$candidate" >/dev/null 2>&1 || [ -x "$candidate" ]; then
    NLM_BIN=$(command -v "$candidate" 2>/dev/null || echo "$candidate")
    break
  fi
done

if [ -z "$NLM_BIN" ]; then
  echo "❌ notebooklm-mcp NOT installed"
  echo ""
  echo "Install with:"
  echo "  uv tool install notebooklm-mcp-server"
  echo "  # or"
  echo "  pipx install notebooklm-mcp-server"
  exit 1
fi
echo "✓ notebooklm-mcp found: $NLM_BIN"

# 2. Check nlm CLI (for auth)
NLM_CLI=$(command -v nlm 2>/dev/null || true)
if [ -z "$NLM_CLI" ]; then
  echo "⚠️  nlm CLI not found (optional for auth management)"
  echo "   Install: uv tool install notebooklm-mcp-cli"
else
  echo "✓ nlm CLI: $NLM_CLI"
fi

# 3. Check auth profile
PROFILE_DIR="$HOME/.notebooklm-mcp-cli/profiles"
if [ ! -d "$PROFILE_DIR" ]; then
  echo "❌ No auth profiles found at $PROFILE_DIR"
  echo ""
  echo "Authenticate with:"
  echo "  nlm login"
  exit 2
fi

ACTIVE_PROFILE="${NLM_PROFILE:-default}"
if [ ! -f "$PROFILE_DIR/$ACTIVE_PROFILE/credentials.json" ] && [ ! -f "$PROFILE_DIR/$ACTIVE_PROFILE/cookies.json" ]; then
  # Try listing files to see what auth format exists
  if [ -z "$(ls -A "$PROFILE_DIR/$ACTIVE_PROFILE" 2>/dev/null)" ]; then
    echo "❌ Profile '$ACTIVE_PROFILE' is empty at $PROFILE_DIR/$ACTIVE_PROFILE/"
    echo ""
    echo "Re-authenticate:"
    echo "  nlm login"
    exit 2
  fi
fi

echo "✓ Auth profile active: $ACTIVE_PROFILE"

# 4. Optional: ping a notebook list to confirm token validity
if [ -n "$NLM_CLI" ]; then
  if timeout 10 "$NLM_CLI" notebook list >/dev/null 2>&1; then
    echo "✓ Auth tokens validated (notebook list succeeded)"
  else
    echo "⚠️  Auth tokens may be expired"
    echo "   Refresh: nlm login"
  fi
fi

echo ""
echo "✅ NotebookLM MCP ready for use"
exit 0
