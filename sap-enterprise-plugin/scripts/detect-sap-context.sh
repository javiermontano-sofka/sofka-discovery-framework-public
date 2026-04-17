#!/usr/bin/env bash
# detect-sap-context.sh
# Auto-detects SAP keywords in cwd and sets TIPO_SERVICIO=SAP flag.
# Author: Diseñado por Javier Montaño
# Plugin: sap-enterprise-plugin v2.1

set -o pipefail

CWD="${1:-$PWD}"
SAP_FLAG_FILE="$CWD/.discovery/sap-context.flag"
SCORE=0

mkdir -p "$CWD/.discovery" 2>/dev/null || true

# Scan for SAP keywords in filenames
KEYWORDS="SAP|S/4HANA|S4HANA|ABAP|CATS|CPI|BTP|Fiori|Activate|Clean[_ ]Core|RISE"
FILE_MATCHES=$(find "$CWD" -maxdepth 3 -type f \( -name "*.md" -o -name "*.txt" -o -name "*.json" \) 2>/dev/null | head -50 | xargs grep -l -iE "$KEYWORDS" 2>/dev/null | wc -l | tr -d ' ')

if [ "$FILE_MATCHES" -ge 3 ]; then
  SCORE=$((SCORE + 3))
elif [ "$FILE_MATCHES" -ge 1 ]; then
  SCORE=$((SCORE + 1))
fi

# Scan for SAP-specific file extensions
ABAP_FILES=$(find "$CWD" -maxdepth 3 -type f \( -name "*.abap" -o -name "*.cds" -o -name "*.bdef" -o -name "*.srvd" \) 2>/dev/null | wc -l | tr -d ' ')
if [ "$ABAP_FILES" -gt 0 ]; then
  SCORE=$((SCORE + 5))
fi

# Scan for SAP directory names
if find "$CWD" -maxdepth 3 -type d \( -name "sap*" -o -name "s4hana*" -o -name "abap*" \) 2>/dev/null | head -1 | grep -q . ; then
  SCORE=$((SCORE + 2))
fi

# Write flag file if score >= 3
if [ "$SCORE" -ge 3 ]; then
  cat > "$SAP_FLAG_FILE" <<EOF
TIPO_SERVICIO=SAP
SCORE=$SCORE
DETECTED_AT=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
MATCHES_FILES=$FILE_MATCHES
ABAP_FILES=$ABAP_FILES
PLUGIN=sap-enterprise-plugin
EOF
  echo "✓ SAP context detected (score: $SCORE). Flag written: $SAP_FLAG_FILE"
  echo "  → Use /sap:discovery to start the pipeline"
else
  echo "ℹ No SAP context detected in $CWD (score: $SCORE)"
  echo "  → If this is a SAP engagement, invoke /sap:discovery manually"
fi

exit 0
