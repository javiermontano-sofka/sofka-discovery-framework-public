#!/usr/bin/env bash
# Sovereign Architect — Mermaid Renderer
# Renders Mermaid diagrams to SVG/PNG (mmdc wrapper)
# © 2026 JM Labs · Javier Montaño
set -euo pipefail

INPUT="${1:-}"
OUTPUT="${2:-}"
FORMAT="${3:-svg}"

if [[ -z "$INPUT" ]]; then
  echo "Usage: render-mermaid.sh <input.mmd> [output.svg|png] [svg|png]"
  exit 1
fi

if [[ ! -f "$INPUT" ]]; then
  echo "ERROR: Input file not found: $INPUT"
  exit 1
fi

# Default output name
if [[ -z "$OUTPUT" ]]; then
  OUTPUT="${INPUT%.*}.$FORMAT"
fi

# Check for mmdc (mermaid-cli)
if ! command -v mmdc &>/dev/null; then
  echo "## Mermaid Renderer"
  echo ""
  echo "- **mmdc not found.** Install with:"
  echo "  \`npm install -g @mermaid-js/mermaid-cli\`"
  echo ""
  echo "> Alternatively, paste diagram content into https://mermaid.live"
  exit 1
fi

# Render with JM Labs theme
THEME_CONFIG='{"theme":"default","themeVariables":{"primaryColor":"#4A90D9","primaryTextColor":"#1a1a1a","primaryBorderColor":"#333","lineColor":"#666","secondaryColor":"#f0f0f0","tertiaryColor":"#fff"}}'

echo "## Mermaid Renderer"
echo ""
echo "- Rendering: $(basename "$INPUT") → $(basename "$OUTPUT")"

mmdc -i "$INPUT" -o "$OUTPUT" -t default -C <(echo "$THEME_CONFIG") 2>/dev/null && {
  echo "- Output: $OUTPUT"
  echo "> Render complete."
} || {
  echo "- **Render failed.** Check syntax in $(basename "$INPUT")."
  exit 1
}

exit 0
