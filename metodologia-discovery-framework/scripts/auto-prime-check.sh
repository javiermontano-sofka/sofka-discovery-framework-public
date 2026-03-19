#!/bin/bash
# MAO Framework — Auto-Priming Check
# Hook: SessionStart (runs after session-context-gen)
# Detects priming state and generates lightweight repo fingerprint.
# If no priming-rag files exist, creates a marker requesting full priming.
# If priming exists, generates a calibration digest for the orchestrator.

set -euo pipefail

TARGET_DIR="${1:-.}"
DISCOVERY_DIR="${TARGET_DIR}/discovery"
RAG_DIR="${DISCOVERY_DIR}/rag-priming"
CALIBRATION_FILE="${DISCOVERY_DIR}/calibration-digest.md"
PRIME_MARKER="${DISCOVERY_DIR}/needs-priming"

mkdir -p "${DISCOVERY_DIR}"

# Skip if target is the plugin itself
BASENAME=$(basename "$(cd "$TARGET_DIR" && pwd)")
if [[ "$BASENAME" == "metodologia-discovery-framework" ]]; then
  echo "⏭️  Auto-prime: skipped (plugin directory)"
  exit 0
fi

# Count existing priming-rag files
RAG_COUNT=0
RAG_DOMAINS=""
if [[ -d "$RAG_DIR" ]]; then
  RAG_COUNT=$(find "$RAG_DIR" -name "priming-rag-*.md" -type f 2>/dev/null | wc -l | tr -d ' ')
  RAG_DOMAINS=$(find "$RAG_DIR" -name "priming-rag-*.md" -type f 2>/dev/null \
    | xargs -I{} basename {} .md \
    | sed 's/^priming-rag-//' \
    | sort \
    | tr '\n' ', ' \
    | sed 's/,$//')
fi

# Also check for priming files in project root and references/
ROOT_RAG=$(find "$TARGET_DIR" -maxdepth 1 -name "priming-rag-*.md" -type f 2>/dev/null | wc -l | tr -d ' ')
REFS_RAG=0
if [[ -d "${TARGET_DIR}/references" ]]; then
  REFS_RAG=$(find "${TARGET_DIR}/references" -maxdepth 1 -name "priming-rag-*.md" -type f 2>/dev/null | wc -l | tr -d ' ')
fi
TOTAL_RAG=$((RAG_COUNT + ROOT_RAG + REFS_RAG))

# Generate repo fingerprint (lightweight, no deep analysis)
HAS_GIT=false
[[ -d "${TARGET_DIR}/.git" ]] && HAS_GIT=true

FINGERPRINT=""
if $HAS_GIT; then
  COMMIT_COUNT=$(cd "$TARGET_DIR" && git rev-list --count HEAD 2>/dev/null || echo 0)
  LAST_COMMIT=$(cd "$TARGET_DIR" && git log -1 --format="%h %s" 2>/dev/null || echo "unknown")
  BRANCH=$(cd "$TARGET_DIR" && git branch --show-current 2>/dev/null || echo "unknown")
  FINGERPRINT="branch=${BRANCH}, commits=${COMMIT_COUNT}, last=${LAST_COMMIT}"
fi

# Detect key config files for domain hints
DOMAIN_HINTS=""
[[ -f "${TARGET_DIR}/package.json" ]] && DOMAIN_HINTS="${DOMAIN_HINTS}node,"
[[ -f "${TARGET_DIR}/pom.xml" || -f "${TARGET_DIR}/build.gradle" || -f "${TARGET_DIR}/build.gradle.kts" ]] && DOMAIN_HINTS="${DOMAIN_HINTS}jvm,"
[[ -f "${TARGET_DIR}/Cargo.toml" ]] && DOMAIN_HINTS="${DOMAIN_HINTS}rust,"
[[ -f "${TARGET_DIR}/go.mod" ]] && DOMAIN_HINTS="${DOMAIN_HINTS}go,"
[[ -f "${TARGET_DIR}/pyproject.toml" || -f "${TARGET_DIR}/requirements.txt" || -f "${TARGET_DIR}/setup.py" ]] && DOMAIN_HINTS="${DOMAIN_HINTS}python,"
[[ -f "${TARGET_DIR}/docker-compose.yml" || -f "${TARGET_DIR}/docker-compose.yaml" ]] && DOMAIN_HINTS="${DOMAIN_HINTS}docker,"
[[ -f "${TARGET_DIR}/terraform.tf" || -d "${TARGET_DIR}/terraform" ]] && DOMAIN_HINTS="${DOMAIN_HINTS}terraform,"
[[ -f "${TARGET_DIR}/.github/workflows/"*.yml ]] 2>/dev/null && DOMAIN_HINTS="${DOMAIN_HINTS}github-actions,"
[[ -d "${TARGET_DIR}/k8s" || -d "${TARGET_DIR}/kubernetes" ]] && DOMAIN_HINTS="${DOMAIN_HINTS}k8s,"
DOMAIN_HINTS=$(echo "$DOMAIN_HINTS" | sed 's/,$//')

# Count attachments in discovery/attachments/
ATTACHMENT_COUNT=0
UNPRIMED_ATTACHMENTS=""
if [[ -d "${DISCOVERY_DIR}/attachments" ]]; then
  ATTACHMENT_COUNT=$(find "${DISCOVERY_DIR}/attachments" -type f 2>/dev/null | wc -l | tr -d ' ')
  # Check which attachments lack corresponding priming-rag files
  while IFS= read -r att; do
    att_name=$(basename "$att" | sed 's/\.[^.]*$//')
    if ! find "$RAG_DIR" -name "priming-rag-*${att_name}*" -type f 2>/dev/null | grep -q .; then
      UNPRIMED_ATTACHMENTS="${UNPRIMED_ATTACHMENTS}\n  - $(basename "$att")"
    fi
  done < <(find "${DISCOVERY_DIR}/attachments" -type f 2>/dev/null)
fi

if [[ $TOTAL_RAG -eq 0 ]]; then
  # No priming exists — create marker
  touch "$PRIME_MARKER"
  cat > "$CALIBRATION_FILE" << CALEOF
# Calibration Digest — MAO Framework
> Auto-generado: $(date -u +%Y-%m-%dT%H:%M:%SZ)
> Estado: **NO PRIMED** — se requiere /mao:prime-repo

## Estado de Priming
- **Archivos RAG**: 0
- **Calibración**: ❌ No disponible
- **Acción requerida**: Ejecutar \`/mao:prime-repo\` antes de iniciar discovery

## Fingerprint del Repo
- **Git**: ${FINGERPRINT:-no detectado}
- **Domain hints**: ${DOMAIN_HINTS:-ninguno detectado}
$(if [[ $ATTACHMENT_COUNT -gt 0 ]]; then
  echo ""
  echo "## Adjuntos sin priming (${ATTACHMENT_COUNT})"
  echo -e "${UNPRIMED_ATTACHMENTS}"
fi)

---
*Calibración pendiente. El discovery sin priming tiene menor profundidad y confianza.*
CALEOF

  echo "⚠️  Auto-prime: repo NO primed (0 archivos RAG)"
  echo "  → Ejecutar /mao:prime-repo para máxima profundidad"
  [[ -n "$DOMAIN_HINTS" ]] && echo "  🔍 Domain hints: ${DOMAIN_HINTS}"

else
  # Priming exists — generate calibration digest
  rm -f "$PRIME_MARKER" 2>/dev/null

  # Extract key stats from priming files
  TOTAL_LINES=0
  KEYWORDS=""
  for f in $(find "$RAG_DIR" "${TARGET_DIR}" "${TARGET_DIR}/references" -maxdepth 1 -name "priming-rag-*.md" -type f 2>/dev/null); do
    lines=$(wc -l < "$f" | tr -d ' ')
    TOTAL_LINES=$((TOTAL_LINES + lines))
    # Extract keywords from last section (if present)
    kw=$(grep -oP '`#\K[^`]+' "$f" 2>/dev/null | head -5 | tr '\n' ', ' | sed 's/,$//')
    [[ -n "$kw" ]] && KEYWORDS="${KEYWORDS}${kw}, "
  done
  KEYWORDS=$(echo "$KEYWORDS" | sed 's/, $//')

  cat > "$CALIBRATION_FILE" << CALEOF
# Calibration Digest — MAO Framework
> Auto-generado: $(date -u +%Y-%m-%dT%H:%M:%SZ)
> Estado: **PRIMED** ✅

## Estado de Priming
- **Archivos RAG**: ${TOTAL_RAG}
- **Dominios cubiertos**: ${RAG_DOMAINS:-no clasificados}
- **Líneas de contexto**: ~${TOTAL_LINES}
- **Keywords**: ${KEYWORDS:-no extraídos}

## Fingerprint del Repo
- **Git**: ${FINGERPRINT:-no detectado}
- **Domain hints**: ${DOMAIN_HINTS:-ninguno detectado}

## Cobertura
$(if [[ $TOTAL_RAG -lt 3 ]]; then
  echo "- ⚠️ Cobertura baja (${TOTAL_RAG} archivos). Considerar ejecutar \`/mao:prime-repo\` para ampliar."
elif [[ $TOTAL_RAG -lt 6 ]]; then
  echo "- 🟡 Cobertura media (${TOTAL_RAG} archivos). Profundidad aceptable para discovery express."
else
  echo "- ✅ Cobertura alta (${TOTAL_RAG} archivos). Profundidad óptima para discovery completo."
fi)
$(if [[ -n "$UNPRIMED_ATTACHMENTS" ]]; then
  echo ""
  echo "## Adjuntos sin priming"
  echo -e "${UNPRIMED_ATTACHMENTS}"
  echo ""
  echo "→ Procesar con \`/mao:prime-repo\` fase 3 (attachment processing)"
fi)

## Instrucciones para el Orquestador
1. Leer archivos priming-rag-*.md al inicio de cada fase relevante
2. Usar datos de priming como evidencia [DOC] en entregables
3. Cruzar hallazgos de priming con análisis directo del código
4. Si un dominio no tiene priming, marcar hallazgos como [INFERENCIA]

---
*Calibración completa. Discovery puede operar a máxima profundidad.*
CALEOF

  echo "✅ Auto-prime: ${TOTAL_RAG} archivos RAG, ~${TOTAL_LINES} líneas de contexto"
  [[ -n "$RAG_DOMAINS" ]] && echo "  📚 Dominios: ${RAG_DOMAINS}"
  [[ -n "$UNPRIMED_ATTACHMENTS" ]] && echo "  ⚠️  Adjuntos sin priming detectados"
fi

exit 0
