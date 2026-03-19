#!/usr/bin/env bash
# render-mermaid.sh — Render Mermaid code blocks to PNG images
# PMO-APEX v1.0 — Agentic Project Management as Service
# © 2026 PMO-APEX. All Rights Reserved.

set -euo pipefail

INPUT_FILE="${1:-}"
TARGET_DIR="${2:-.}"
ASSETS_DIR="$TARGET_DIR/project/assets"

if [ -z "$INPUT_FILE" ] || [ ! -f "$INPUT_FILE" ]; then
  echo "Usage: render-mermaid.sh <markdown-file> [target-dir]"
  exit 1
fi

# Check for Mermaid CLI
if ! command -v mmdc >/dev/null 2>&1; then
  echo "Mermaid CLI (mmdc) not installed. Diagrams will not be rendered to PNG."
  echo "   Install: npm install -g @mermaid-js/mermaid-cli"
  echo "   Mermaid blocks remain in markdown as code — no data loss."
  exit 0
fi

mkdir -p "$ASSETS_DIR"

# Mermaid config for APEX branding (Royal Blue #2563EB)
MERMAID_CONFIG=$(mktemp /tmp/mermaid-config-XXXXXX.json)
cat > "$MERMAID_CONFIG" << 'CFGEOF'
{
  "theme": "base",
  "themeVariables": {
    "primaryColor": "#2563EB",
    "primaryBorderColor": "#1D4ED8",
    "primaryTextColor": "#1A1A1A",
    "secondaryColor": "#F0F4FF",
    "tertiaryColor": "#DBEAFE",
    "lineColor": "#2563EB",
    "textColor": "#1A1A1A",
    "mainBkg": "#F0F4FF",
    "nodeBorder": "#2563EB",
    "clusterBkg": "#EFF6FF",
    "titleColor": "#2563EB",
    "edgeLabelBackground": "#F0F4FF"
  }
}
CFGEOF

# Extract and render Mermaid blocks
BLOCK_NUM=0
RENDERED=0
IN_MERMAID=false
TEMP_MMD=$(mktemp /tmp/mermaid-block-XXXXXX.mmd)

while IFS= read -r line; do
  if [[ "$line" =~ ^\`\`\`mermaid ]]; then
    IN_MERMAID=true
    BLOCK_NUM=$((BLOCK_NUM + 1))
    > "$TEMP_MMD"
    continue
  fi

  if [[ "$line" =~ ^\`\`\` ]] && [ "$IN_MERMAID" = true ]; then
    IN_MERMAID=false

    # Generate deterministic filename from content hash
    HASH=$(shasum -a 256 "$TEMP_MMD" | cut -c1-8)
    OUTPUT_PNG="$ASSETS_DIR/mermaid-${HASH}.png"

    if [ -f "$OUTPUT_PNG" ]; then
      echo "  mermaid-${HASH}.png already exists, skipping"
    else
      if mmdc -i "$TEMP_MMD" -o "$OUTPUT_PNG" -c "$MERMAID_CONFIG" -b "#F0F4FF" -w 1200 2>/dev/null; then
        RENDERED=$((RENDERED + 1))
        echo "  Block $BLOCK_NUM -> mermaid-${HASH}.png"
      else
        echo "  Block $BLOCK_NUM failed to render"
      fi
    fi
    continue
  fi

  if [ "$IN_MERMAID" = true ]; then
    echo "$line" >> "$TEMP_MMD"
  fi
done < "$INPUT_FILE"

# Cleanup
rm -f "$TEMP_MMD" "$MERMAID_CONFIG"

if [ "$BLOCK_NUM" -eq 0 ]; then
  echo "No Mermaid blocks found in $(basename "$INPUT_FILE")"
else
  echo ""
  echo "Rendered $RENDERED/$BLOCK_NUM Mermaid diagrams -> project/assets/"
fi

exit 0
