#!/usr/bin/env bash
# mao-init.sh — Interactive initialization wizard for MetodologIA MAO
# MetodologIA MAO v1.2 — Open Discovery Framework
# MIT License
#
# Sets up discovery/ structure, pre-populates session context,
# runs G0 security scan, and prepares the environment for Claude Code.

set -euo pipefail

PLUGIN_DIR="$(cd "$(dirname "$0")/.." && pwd)"
TARGET_DIR="${1:-$(pwd)}"

# ─── Banner ───
cat << 'BANNER'

  ╔══════════════════════════════════════════════════════╗
  ║                                                      ║
  ║   🟣  MetodologIA MAO v1.2                           ║
  ║   Open Discovery Framework                           ║
  ║                                                      ║
  ║   Interactive Initialization Wizard                  ║
  ║   MIT License                                        ║
  ║                                                      ║
  ╚══════════════════════════════════════════════════════╝

BANNER

echo "📁 Target directory: $TARGET_DIR"
echo ""

# ─── Step 1: Interactive questions ───
echo "━━━ Step 1/5: Client Information ━━━"
echo ""

read -rp "  Nombre del cliente: " CLIENT_NAME
CLIENT_NAME="${CLIENT_NAME:-ClienteDemo}"

echo ""
echo "  Tipos de servicio disponibles:"
echo "    1) SDA — Software Development & Architecture"
echo "    2) QA — Quality Assurance"
echo "    3) Management — Gestión & Governance"
echo "    4) RPA — Robotic Process Automation"
echo "    5) Data-AI — Data & Artificial Intelligence"
echo "    6) Cloud — Cloud & Platform"
echo "    7) SAS — Staff Augmentation Services"
echo "    8) UX-Design — UX & Design"
echo "    9) Digital-Transformation — Transformación Digital"
echo ""
read -rp "  Seleccione tipo de servicio [1-9, default 1]: " TIPO_NUM
case "${TIPO_NUM:-1}" in
  1) TIPO_SERVICIO="SDA" ;;
  2) TIPO_SERVICIO="QA" ;;
  3) TIPO_SERVICIO="Management" ;;
  4) TIPO_SERVICIO="RPA" ;;
  5) TIPO_SERVICIO="Data-AI" ;;
  6) TIPO_SERVICIO="Cloud" ;;
  7) TIPO_SERVICIO="SAS" ;;
  8) TIPO_SERVICIO="UX-Design" ;;
  9) TIPO_SERVICIO="Digital-Transformation" ;;
  *) TIPO_SERVICIO="SDA" ;;
esac

echo ""
read -rp "  Contacto principal del cliente: " CLIENT_CONTACT
CLIENT_CONTACT="${CLIENT_CONTACT:-N/A}"

echo ""
read -rp "  Sector/industria (banking, retail, health, SaaS, manufacturing, gov, energy): " INDUSTRY
INDUSTRY="${INDUSTRY:-N/A}"

# ─── Step 2: Create discovery/ structure ───
echo ""
echo "━━━ Step 2/5: Creating discovery/ structure ━━━"

DISCOVERY_DIR="$TARGET_DIR/discovery"
mkdir -p "$DISCOVERY_DIR"/{deliverables,insights,transcripts,rag-priming,assets,attachments}

# Create .gitignore for sensitive files
cat > "$DISCOVERY_DIR/.gitignore" << 'GIEOF'
# MAO session files (sensitive, ephemeral)
mao-secrets-audit.log
mao-secrets-map.json
session-state.json
GIEOF

echo "  ✅ discovery/ structure created (7 subdirs)"

# ─── Step 3: Pre-populate SESSION-README.md ───
echo ""
echo "━━━ Step 3/5: Generating session context ━━━"

cat > "$DISCOVERY_DIR/SESSION-README.md" << SEOF
# Session Context — ${CLIENT_NAME}

> Generado por \`mao-init.sh\` — $(date -u +%Y-%m-%dT%H:%M:%SZ)

## Client Information

| Campo | Valor |
|-------|-------|
| **Cliente** | ${CLIENT_NAME} |
| **Tipo de Servicio** | ${TIPO_SERVICIO} |
| **Contacto Principal** | ${CLIENT_CONTACT} |
| **Sector/Industria** | ${INDUSTRY} |
| **Directorio de Trabajo** | ${TARGET_DIR} |
| **Inicializado por** | mao-init.sh v1.2 |

## Discovery Status

- **Fase actual**: Pre-discovery (pendiente \`/mao:run-auto\` o \`/mao:run-guided\`)
- **Entregables**: 0/16
- **Gates pasados**: 0/4

## Quick Start

\`\`\`bash
/mao:run-auto          # Pipeline autónomo completo
/mao:run-guided        # Pipeline guiado con facilitación humana
/mao:run-express       # Go/No-Go en 1 sesión
/mao:run-deep          # Dirección arquitectónica
\`\`\`
SEOF

echo "  ✅ SESSION-README.md generated"

# Generate session-state.json
cat > "$DISCOVERY_DIR/session-state.json" << STEOF
{
  "session_start": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "plugin_version": "1.2.0",
  "initialized_by": "mao-init",
  "client_name": "${CLIENT_NAME}",
  "tipo_servicio": "${TIPO_SERVICIO}",
  "industry": "${INDUSTRY}",
  "working_directory": "${TARGET_DIR}",
  "phase": "pre-discovery",
  "deliverables_count": 0,
  "gates_passed": 0,
  "g0_status": "pending"
}
STEOF

echo "  ✅ session-state.json generated"

# ─── Step 4: Auto-discovery ───
echo ""
echo "━━━ Step 4/5: Auto-discovery ━━━"

# Run repo indexer if available
if [ -f "$PLUGIN_DIR/scripts/index-repo.sh" ]; then
  echo "  🔍 Indexing repository..."
  bash "$PLUGIN_DIR/scripts/index-repo.sh" "$TARGET_DIR" 2>/dev/null || echo "  ⚠️  Repo indexing skipped (not a git repo or no files)"
else
  echo "  ⚠️  index-repo.sh not found, skipping auto-discovery"
fi

# Run G0 security scan
echo "  🔒 Running G0 security scan..."
G0_STATUS="CLEAN"
if bash "$PLUGIN_DIR/scripts/secrets-scan.sh" "$TARGET_DIR" 2>/dev/null; then
  echo "  ✅ G0 Security Gate: PASSED"
else
  G0_STATUS="FINDINGS"
  echo "  ⚠️  G0 Security Gate: FINDINGS DETECTED"
  echo "     Review: discovery/mao-secrets-audit.log"
fi

# Update session state with G0 result
if command -v jq &>/dev/null && [ -f "$DISCOVERY_DIR/session-state.json" ]; then
  TMP=$(mktemp)
  jq --arg status "$G0_STATUS" '.g0_status = $status' "$DISCOVERY_DIR/session-state.json" > "$TMP" && mv "$TMP" "$DISCOVERY_DIR/session-state.json"
fi

# ─── Step 5: Summary ───
echo ""
echo "━━━ Step 5/5: Summary ━━━"
echo ""
echo "  🟣 MAO initialized for ${CLIENT_NAME}"
echo ""
echo "  📋 Configuration:"
echo "     Cliente:     ${CLIENT_NAME}"
echo "     Servicio:    ${TIPO_SERVICIO}"
echo "     Industria:   ${INDUSTRY}"
echo "     G0 Security: ${G0_STATUS}"
echo ""
echo "  📁 discovery/ structure:"

# Print tree if available
if command -v tree >/dev/null 2>&1; then
  tree -L 1 "$DISCOVERY_DIR" 2>/dev/null || ls "$DISCOVERY_DIR"
else
  ls "$DISCOVERY_DIR"
fi

echo ""
echo "  🚀 Next steps:"
if [ "$G0_STATUS" = "FINDINGS" ]; then
  echo "     1. Review secrets: /mao:scan-secrets"
  echo "     2. Then start discovery: /mao:run-auto or /mao:run-guided"
else
  echo "     Start discovery: /mao:run-auto or /mao:run-guided"
fi
echo ""
echo "  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

exit 0
