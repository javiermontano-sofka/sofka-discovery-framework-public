#!/bin/bash
# MAO Framework — Session Context Generator
# Hook: SessionStart
# Genera README.md y CLAUDE.md de sesión basados en el skill activo,
# para que el orquestador opere al máximo de capacidad con repos.

set -euo pipefail

TARGET_DIR="${1:-.}"
DISCOVERY_DIR="${TARGET_DIR}/discovery"
SESSION_README="${DISCOVERY_DIR}/SESSION-README.md"
SESSION_CLAUDE="${DISCOVERY_DIR}/SESSION-CLAUDE.md"

mkdir -p "${DISCOVERY_DIR}"

# Detect project context
PROJECT_NAME=$(basename "$(cd "$TARGET_DIR" && pwd)")
HAS_GIT=false
[[ -d "${TARGET_DIR}/.git" ]] && HAS_GIT=true

# Get repo stats
FILE_COUNT=0
SOURCE_COUNT=0
if ${HAS_GIT}; then
  FILE_COUNT=$(cd "$TARGET_DIR" && git ls-files 2>/dev/null | wc -l | tr -d ' ' || echo 0)
  SOURCE_COUNT=$(cd "$TARGET_DIR" && git ls-files 2>/dev/null | grep -cE '\.(ts|js|tsx|jsx|java|kt|py|go|rs|cs|rb|php|swift|dart)$' || echo 0)
fi

# Detect primary language
PRIMARY_LANG="desconocido"
if [[ -f "${TARGET_DIR}/package.json" ]]; then PRIMARY_LANG="JavaScript/TypeScript"
elif [[ -f "${TARGET_DIR}/pom.xml" ]] || [[ -f "${TARGET_DIR}/build.gradle" ]]; then PRIMARY_LANG="Java"
elif [[ -f "${TARGET_DIR}/Cargo.toml" ]]; then PRIMARY_LANG="Rust"
elif [[ -f "${TARGET_DIR}/go.mod" ]]; then PRIMARY_LANG="Go"
elif [[ -f "${TARGET_DIR}/pyproject.toml" ]] || [[ -f "${TARGET_DIR}/requirements.txt" ]]; then PRIMARY_LANG="Python"
elif compgen -G "${TARGET_DIR}/*.sln" > /dev/null 2>&1; then PRIMARY_LANG="C#/.NET"
fi

# Check for existing deliverables
DELIVERABLE_COUNT=0
DELIVERABLES_FOUND=""
for dir in "${TARGET_DIR}" "${DISCOVERY_DIR}/deliverables" "${TARGET_DIR}/output" "${TARGET_DIR}/outputs"; do
  if [[ -d "$dir" ]]; then
    while IFS= read -r f; do
      [[ -n "$f" ]] && DELIVERABLES_FOUND="${DELIVERABLES_FOUND}\n- $(basename "$f")"
      DELIVERABLE_COUNT=$((DELIVERABLE_COUNT + 1))
    done < <(find "$dir" -maxdepth 2 -name "*_*.md" -type f 2>/dev/null | grep -E '^.*[0-9]{2}[b]?_' || true)
  fi
done

# Check for priming-RAG files
RAG_COUNT=0
if [[ -d "${DISCOVERY_DIR}/rag-priming" ]]; then
  RAG_COUNT=$(find "${DISCOVERY_DIR}/rag-priming" -name "*.md" -type f 2>/dev/null | wc -l | tr -d ' ')
fi

# Generate SESSION-README.md
cat > "$SESSION_README" << READMEEOF
# ${PROJECT_NAME} — Sesión de Discovery MAO
> Auto-generado por MAO Framework v1.0 | $(date -u +%Y-%m-%dT%H:%M:%SZ)

## Contexto del Proyecto
| Atributo | Valor |
|----------|-------|
| Proyecto | \`${PROJECT_NAME}\` |
| Lenguaje | ${PRIMARY_LANG} |
| Archivos | ${FILE_COUNT} total, ${SOURCE_COUNT} fuente |
| Git | $(${HAS_GIT} && echo "✅ activo" || echo "❌ no detectado") |
| Entregables | ${DELIVERABLE_COUNT}/16 |
| RAG priming | ${RAG_COUNT} archivos |

## Estado del Pipeline
$(if [[ $DELIVERABLE_COUNT -eq 0 ]]; then
  echo "🆕 **Fresh start** — No hay entregables previos."
  echo ""
  echo "### Próximos pasos recomendados"
  echo "1. \`/mao:run-auto\` — Pipeline completo autónomo"
  echo "2. \`/mao:run-express\` — Go/No-Go rápido (3 entregables)"
  echo "3. \`/mao:run-guided\` — Pipeline guiado con facilitación"
elif [[ $DELIVERABLE_COUNT -lt 16 ]]; then
  echo "🔄 **En progreso** — ${DELIVERABLE_COUNT}/16 entregables completados."
  echo ""
  echo "### Entregables encontrados"
  echo -e "${DELIVERABLES_FOUND}"
  echo ""
  echo "### Próximos pasos recomendados"
  echo "1. \`/mao:rescue-stalled\` — Diagnosticar y completar"
  echo "2. \`/mao:audit-quality\` — Auditar lo existente"
  echo "3. \`/mao:improve-deliverables\` — Evolucionar entregables"
else
  echo "✅ **Pipeline completo** — 16/16 entregables."
  echo ""
  echo "### Próximos pasos recomendados"
  echo "1. \`/mao:audit-quality\` — Auditoría con scorecard"
  echo "2. \`/mao:improve-deliverables\` — Evolucionar entregables"
fi)

## Archivos de sesión
| Archivo | Ruta | Estado |
|---------|------|--------|
| Session README | \`discovery/SESSION-README.md\` | ✅ |
| Session CLAUDE | \`discovery/SESSION-CLAUDE.md\` | ✅ |
| Repo Index | \`discovery/repo-index.json\` | $([[ -f "${DISCOVERY_DIR}/repo-index.json" ]] && echo "✅" || echo "⚠️ pendiente") |
| Changelog | \`discovery/session-changelog.md\` | $([[ -f "${DISCOVERY_DIR}/session-changelog.md" ]] && echo "✅" || echo "⚠️ pendiente") |
| Ghost Menu | \`discovery/ghost-menu.md\` | $([[ -f "${DISCOVERY_DIR}/ghost-menu.md" ]] && echo "✅" || echo "⚠️ pendiente") |

---
*MAO Framework v1.0 — session context auto-generated.*
READMEEOF

# Generate SESSION-CLAUDE.md
cat > "$SESSION_CLAUDE" << CLAUDEEOF
# MAO Framework — Instrucciones de Sesión para el Orquestador

> Este archivo es generado automáticamente al inicio de cada sesión.
> Complementa el CLAUDE.md principal del plugin con contexto específico del repo.
> El discovery-conductor debe leer este archivo para operar al máximo de capacidad.

## Contexto del Repo Activo
- **Proyecto**: \`${PROJECT_NAME}\`
- **Lenguaje principal**: ${PRIMARY_LANG}
- **Archivos fuente**: ${SOURCE_COUNT}
- **Entregables existentes**: ${DELIVERABLE_COUNT}/16
- **RAG priming disponible**: ${RAG_COUNT} archivos

## Reglas de sesión

### Ghost Menu
El ghost menu está activo. Cada respuesta que produzca un artefacto importante
debe incluir un bloque de navegación contextual al final con:
- Estado de la fase actual
- Entregables completados vs pendientes
- Siguiente acción recomendada
- Links a archivos de sesión relevantes

### Changelog automático
Cada acción significativa se registra en \`discovery/session-changelog.md\`.
Si la sesión se interrumpe, usar el changelog para retomar.
Ante crisis de contexto: leer primero el changelog, luego el ghost menu.

### Preparación RAG
Cada adjunto nuevo debe procesarse automáticamente:
1. Leer/interpretar
2. Crear extracto Markdown en \`discovery/rag-priming/\`
3. Actualizar índice
4. Incorporar al riel de discovery

### Operación del Orquestador
El discovery-conductor opera como líder del comité permanente:
- Detecta tipo de servicio automáticamente
- Secuencia fases respetando dependencias
- Aplica quality gates (G1, G1.5, G2, G3)
- Gestiona consistencia cruzada
- Mantiene trazabilidad de evidencia

### Prioridades de esta sesión
$(if [[ $DELIVERABLE_COUNT -eq 0 ]]; then
  echo "1. Indexar el repo (CP-0)"
  echo "2. Detectar tipo de servicio"
  echo "3. Generar 00_Discovery_Plan"
  echo "4. Comenzar pipeline según modo seleccionado"
elif [[ $DELIVERABLE_COUNT -lt 16 ]]; then
  echo "1. Diagnosticar estado actual del pipeline"
  echo "2. Identificar entregables faltantes en ruta crítica"
  echo "3. Completar o rescatar pipeline"
  echo "4. Auditar consistencia cruzada"
else
  echo "1. Auditar calidad de entregables"
  echo "2. Aplicar excellence loop"
  echo "3. Mejorar profundidad y evidencia"
  echo "4. Generar outputs adicionales si se solicitan"
fi)

---
*Generado por session-context-gen.sh | MAO Framework v1.0 | $(date -u +%Y-%m-%dT%H:%M:%SZ)*
CLAUDEEOF

echo "📋 Session context generated:"
echo "  📄 ${SESSION_README}"
echo "  📄 ${SESSION_CLAUDE}"
echo "  📊 ${PROJECT_NAME} | ${PRIMARY_LANG} | ${FILE_COUNT} files | ${DELIVERABLE_COUNT}/16 deliverables"

exit 0
