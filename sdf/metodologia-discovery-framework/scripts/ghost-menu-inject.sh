#!/bin/bash
# MAO Framework — Ghost Menu Injector
# Hook: PostToolUse / SessionStart
# Inyecta contexto de navegación en cada interacción del hilo.
# El ghost menu es un patrón de navegación secundaria que calibra
# las interacciones subsiguientes con contexto operativo.

set -euo pipefail

TARGET_DIR="${1:-.}"
DISCOVERY_DIR="${TARGET_DIR}/discovery"
GHOST_FILE="${DISCOVERY_DIR}/ghost-menu.md"

mkdir -p "${DISCOVERY_DIR}"

# Detect current state
DELIVERABLE_COUNT=0
PHASE="pre-discovery"
ACTIVE_SKILL=""
HAS_INDEX=false
HAS_CHANGELOG=false

# Count deliverables
for dir in "${TARGET_DIR}" "${DISCOVERY_DIR}/deliverables" "${TARGET_DIR}/output" "${TARGET_DIR}/outputs"; do
  if [[ -d "$dir" ]]; then
    count=$(find "$dir" -maxdepth 2 -name "*_*.md" -type f 2>/dev/null | grep -cE '^.*[0-9]{2}[b]?_' || echo 0)
    DELIVERABLE_COUNT=$((DELIVERABLE_COUNT + count))
  fi
done

# Detect phase from deliverables
if [[ $DELIVERABLE_COUNT -eq 0 ]]; then
  PHASE="00-plan"
elif [[ $DELIVERABLE_COUNT -le 4 ]]; then
  PHASE="01-04-diagnostico"
elif [[ $DELIVERABLE_COUNT -le 8 ]]; then
  PHASE="05-06-escenarios"
elif [[ $DELIVERABLE_COUNT -le 12 ]]; then
  PHASE="07-09-solucion"
else
  PHASE="10-14-cierre"
fi

# Check for repo index
[[ -f "${DISCOVERY_DIR}/repo-index.json" ]] && HAS_INDEX=true

# Check for changelog
[[ -f "${DISCOVERY_DIR}/session-changelog.md" ]] && HAS_CHANGELOG=true

# Detect active skill from recent git activity or session state
if [[ -f "${DISCOVERY_DIR}/session-state.json" ]]; then
  ACTIVE_SKILL=$(jq -r '.active_skill // "discovery-orchestrator"' "${DISCOVERY_DIR}/session-state.json" 2>/dev/null || echo "discovery-orchestrator")
fi

# Generate ghost menu
cat > "$GHOST_FILE" << GHOSTEOF
<!-- MAO Framework Ghost Menu — Auto-generated $(date -u +%Y-%m-%dT%H:%M:%SZ) -->
## 🗂️ MAO Ghost Menu

| Estado | Valor |
|--------|-------|
| Fase activa | \`${PHASE}\` |
| Entregables | ${DELIVERABLE_COUNT}/16 |
| Skill activo | \`${ACTIVE_SKILL:-discovery-orchestrator}\` |
| Repo indexado | $(${HAS_INDEX} && echo "✅" || echo "❌ → ejecutar /mao:index") |
| Changelog | $(${HAS_CHANGELOG} && echo "✅" || echo "⚠️ sin historial") |

### Navegación rápida
| Acción | Comando |
|--------|---------|
| Pipeline completo | \`/mao:run-auto\` |
| Express Go/No-Go | \`/mao:run-express\` |
| Auditar calidad | \`/mao:audit-quality\` |
| Rescatar discovery | \`/mao:rescue-stalled\` |
| Ver entregables | \`/mao:scan\` |
| Indexar repo | \`/mao:index\` |

### Contexto de sesión
$(${HAS_CHANGELOG} && echo "- [📋 Changelog](${DISCOVERY_DIR}/session-changelog.md)" || echo "- Sin changelog activo")
$(${HAS_INDEX} && echo "- [📁 Repo Index](${DISCOVERY_DIR}/repo-index.json)" || echo "- Repo no indexado")

---
*MAO Ghost Menu v12.0 — navegación secundaria, revisión y control.*
GHOSTEOF

# Output for hook injection
echo "🗂️ MAO | Fase: ${PHASE} | ${DELIVERABLE_COUNT}/16 entregables | Skill: ${ACTIVE_SKILL:-orchestrator}"
if ! ${HAS_INDEX}; then
  echo "  ⚠️ Repo no indexado — considerar ejecutar index-repo.sh primero"
fi
if ! ${HAS_CHANGELOG}; then
  echo "  📝 Sin changelog de sesión — se creará automáticamente"
fi

exit 0
