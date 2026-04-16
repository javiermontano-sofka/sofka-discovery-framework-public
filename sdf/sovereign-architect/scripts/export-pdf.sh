#!/usr/bin/env bash
# Sovereign Architect — PDF Exporter
# PDF generation with JM Labs branding (pandoc wrapper)
# © 2026 JM Labs · Javier Montaño
set -euo pipefail

INPUT="${1:-}"
OUTPUT="${2:-}"

if [[ -z "$INPUT" || ! -f "$INPUT" ]]; then
  echo "Usage: export-pdf.sh <input.md> [output.pdf]"
  exit 1
fi

# Default output
if [[ -z "$OUTPUT" ]]; then
  OUTPUT="${INPUT%.md}.pdf"
fi

# Check for pandoc
if ! command -v pandoc &>/dev/null; then
  echo "## PDF Export"
  echo ""
  echo "- **pandoc not found.** Install with:"
  echo "  \`brew install pandoc\` (macOS)"
  echo "  \`sudo apt install pandoc\` (Linux)"
  exit 1
fi

echo "## PDF Export — JM Labs"
echo ""
echo "- Source: $(basename "$INPUT")"
echo "- Target: $(basename "$OUTPUT")"

# JM Labs metadata
METADATA_ARGS=(
  --metadata "title=Sovereign Architect Report"
  --metadata "author=JM Labs — Javier Montaño"
  --metadata "date=$(date +%Y-%m-%d)"
)

# Pandoc conversion with styling
pandoc "$INPUT" \
  -o "$OUTPUT" \
  "${METADATA_ARGS[@]}" \
  --pdf-engine=xelatex \
  -V geometry:margin=1in \
  -V fontsize=11pt \
  -V colorlinks=true \
  -V linkcolor=blue \
  -V header-includes='\usepackage{fancyhdr}\pagestyle{fancy}\fancyfoot[C]{JM Labs — Sovereign Architect}' \
  --highlight-style=tango \
  2>/dev/null && {
  echo "- PDF exported: $OUTPUT"
  echo "> Export complete."
} || {
  echo "- **Export failed.** Ensure xelatex is installed."
  echo "  \`brew install --cask mactex-no-gui\` (macOS)"
  exit 1
}

exit 0
