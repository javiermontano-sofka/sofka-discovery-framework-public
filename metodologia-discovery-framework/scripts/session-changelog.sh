#!/bin/bash
# MAO Framework — Session Changelog Generator
# Hook: PostToolUse (on file write/edit events)
# Mantiene un changelog de sesión para retomar ante crisis de contexto.
# Cada entrada registra: timestamp, acción, archivo, delta, contexto.

set -euo pipefail

TARGET_DIR="${1:-.}"
DISCOVERY_DIR="${TARGET_DIR}/discovery"
CHANGELOG="${DISCOVERY_DIR}/session-changelog.md"
STATE_FILE="${DISCOVERY_DIR}/session-state.json"

mkdir -p "${DISCOVERY_DIR}"

# Initialize changelog if it doesn't exist
if [[ ! -f "$CHANGELOG" ]]; then
  cat > "$CHANGELOG" << INITEOF
# Session Changelog — MAO Framework
> Auto-generado para continuidad de sesión ante crisis de contexto.
> Cada entrada permite retomar el discovery desde el último punto conocido.
> Generado: $(date -u +%Y-%m-%dT%H:%M:%SZ)

---

## Resumen de sesión
- **Inicio**: $(date -u +%Y-%m-%dT%H:%M:%SZ)
- **Plugin**: MAO Framework v1.0
- **Directorio**: ${TARGET_DIR}
- **Estado**: En progreso

---

## Entradas del changelog

INITEOF
fi

# Initialize session state if it doesn't exist
if [[ ! -f "$STATE_FILE" ]]; then
  cat > "$STATE_FILE" << STATEEOF
{
  "session_start": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "plugin_version": "12.0.0",
  "working_directory": "${TARGET_DIR}",
  "active_skill": "discovery-orchestrator",
  "phase": "pre-discovery",
  "deliverables_count": 0,
  "last_action": null,
  "changelog_entries": 0
}
STATEEOF
fi

# Detect recent changes via git
RECENT_CHANGES=""
if [[ -d "${TARGET_DIR}/.git" ]]; then
  # Get files modified in the last 5 minutes
  RECENT_CHANGES=$(cd "$TARGET_DIR" && git diff --name-only HEAD 2>/dev/null | head -20 || echo "")
  if [[ -z "$RECENT_CHANGES" ]]; then
    RECENT_CHANGES=$(cd "$TARGET_DIR" && git diff --name-only --cached 2>/dev/null | head -20 || echo "")
  fi
fi

# Also check for recently modified files in discovery/
RECENT_DISCOVERY=""
if [[ -d "$DISCOVERY_DIR" ]]; then
  RECENT_DISCOVERY=$(find "$DISCOVERY_DIR" -name "*.md" -newer "$CHANGELOG" -type f 2>/dev/null | head -10 || echo "")
fi

# Append changelog entry
TIMESTAMP=$(date -u +%Y-%m-%dT%H:%M:%SZ)
ENTRY_COUNT=$(grep -c "^### " "$CHANGELOG" 2>/dev/null || echo 0)
ENTRY_NUM=$((ENTRY_COUNT + 1))

cat >> "$CHANGELOG" << ENTRYEOF

### ${ENTRY_NUM}. $(date +"%H:%M:%S") — Checkpoint automático
- **Timestamp**: ${TIMESTAMP}
$(if [[ -n "$RECENT_CHANGES" ]]; then
  echo "- **Archivos modificados (git)**:"
  echo "$RECENT_CHANGES" | while read -r f; do echo "  - \`$f\`"; done
fi)
$(if [[ -n "$RECENT_DISCOVERY" ]]; then
  echo "- **Archivos discovery actualizados**:"
  echo "$RECENT_DISCOVERY" | while read -r f; do echo "  - \`$(basename "$f")\`"; done
fi)

ENTRYEOF

# Update session state
if command -v jq &>/dev/null && [[ -f "$STATE_FILE" ]]; then
  TMP=$(mktemp)
  jq --arg ts "$TIMESTAMP" --arg cnt "$ENTRY_NUM" \
    '.last_action = $ts | .changelog_entries = ($cnt | tonumber)' \
    "$STATE_FILE" > "$TMP" && mv "$TMP" "$STATE_FILE"
fi

echo "📝 Changelog: entrada #${ENTRY_NUM} registrada (${TIMESTAMP})"

exit 0
