#!/usr/bin/env bash
# notebook-bootstrap.sh
# Creates the 6 canonical SAP NotebookLM notebooks for a new project/client.
# Idempotent: skips notebooks that already exist.
# Author: Diseñado por Javier Montaño

set -o pipefail

CLIENT="${1:-SAP}"

NLM=$(command -v nlm 2>/dev/null || true)
if [ -z "$NLM" ]; then
  echo "ERROR: nlm CLI not found. Install: uv tool install notebooklm-mcp-cli"
  exit 1
fi

# Existing notebook titles (lowercased for comparison)
EXISTING=$("$NLM" notebook list 2>/dev/null | python3 -c "
import json, sys
try:
    data = json.load(sys.stdin)
    for n in data:
        print(n.get('title','').lower())
except Exception:
    pass
" 2>/dev/null || echo "")

CANONICAL_NOTEBOOKS=(
  "SAP Clean Core & S/4HANA Cloud — ${CLIENT}"
  "SAP Activate Methodology — ${CLIENT}"
  "SAP BTP Architecture — ${CLIENT}"
  "SAP Data Migration & Cockpit — ${CLIENT}"
  "SAP Module Configuration — ${CLIENT}"
  "SAP Integration Suite & Event Mesh — ${CLIENT}"
)

echo "=== Bootstrapping SAP NotebookLM canonical notebooks ==="
echo "Client: $CLIENT"
echo ""

CREATED=0
SKIPPED=0

for title in "${CANONICAL_NOTEBOOKS[@]}"; do
  title_lower=$(echo "$title" | tr '[:upper:]' '[:lower:]')
  if echo "$EXISTING" | grep -qF "$title_lower"; then
    echo "⏭  SKIP (exists): $title"
    SKIPPED=$((SKIPPED + 1))
  else
    echo "+ Creating: $title"
    if "$NLM" notebook create "$title" >/dev/null 2>&1; then
      CREATED=$((CREATED + 1))
    else
      echo "  ⚠️ Failed to create"
    fi
  fi
done

echo ""
echo "=== Summary ==="
echo "Created: $CREATED"
echo "Skipped: $SKIPPED"
echo ""
echo "Next: use /sap:notebook-research <topic> to populate with deep research"
