#!/usr/bin/env bash
# export-pdf.sh — Export deliverable markdown to branded PDF
# PMO-APEX v1.0 — Agentic Project Management as Service
# © 2026 PMO-APEX. All Rights Reserved.

set -euo pipefail

INPUT_FILE="${1:-}"
TARGET_DIR="${2:-.}"
OUTPUT_FILE="${3:-}"
ASSETS_DIR="$TARGET_DIR/project/assets"
TEMPLATE_DIR="$(dirname "$0")/../references/templates"

if [ -z "$INPUT_FILE" ] || [ ! -f "$INPUT_FILE" ]; then
  echo "Usage: export-pdf.sh <markdown-file> [target-dir] [output-file]"
  exit 1
fi

mkdir -p "$ASSETS_DIR"

# Determine output filename
if [ -z "$OUTPUT_FILE" ]; then
  BASENAME=$(basename "$INPUT_FILE" .md)
  OUTPUT_FILE="$ASSETS_DIR/${BASENAME}.pdf"
fi

# ─── Evidence badge preprocessing ───
# Replace PM evidence tags with styled HTML before conversion
preprocess_evidence_tags() {
  local file="$1"
  sed \
    -e 's/\[PLAN\]/<span class="evidence-tag evidence-plan">PLAN<\/span>/g' \
    -e 's/\[SCHEDULE\]/<span class="evidence-tag evidence-schedule">SCHEDULE<\/span>/g' \
    -e 's/\[METRIC\]/<span class="evidence-tag evidence-metric">METRIC<\/span>/g' \
    -e 's/\[DECISION\]/<span class="evidence-tag evidence-decision">DECISION<\/span>/g' \
    -e 's/\[RISK\]/<span class="evidence-tag evidence-risk">RISK<\/span>/g' \
    -e 's/\[STAKEHOLDER\]/<span class="evidence-tag evidence-stakeholder">STAKEHOLDER<\/span>/g' \
    -e 's/\[BASELINE\]/<span class="evidence-tag evidence-baseline">BASELINE<\/span>/g' \
    -e 's/\[ASSUMPTION\]/<span class="evidence-tag evidence-assumption">ASSUMPTION<\/span>/g' \
    "$file"
}

# ─── APEX CSS for PDF (Royal Blue #2563EB branding) ───
APEX_CSS=$(cat << 'CSSEOF'
<style>
  :root {
    --apex-primary: #2563EB;
    --apex-bg: #F0F4FF;
    --apex-accent: #1D4ED8;
    --apex-text: #1A1A1A;
    --apex-text-light: #4A4A4A;
  }
  body {
    font-family: 'Inter', -apple-system, sans-serif;
    font-size: 11pt;
    line-height: 1.6;
    color: var(--apex-text);
    background: white;
    max-width: 210mm;
    margin: 0 auto;
    padding: 20mm;
  }
  h1 { color: var(--apex-primary); font-weight: 700; font-size: 22pt; border-bottom: 3px solid var(--apex-primary); padding-bottom: 8px; }
  h2 { color: var(--apex-primary); font-weight: 600; font-size: 16pt; margin-top: 24px; }
  h3 { color: var(--apex-text); font-weight: 600; font-size: 13pt; }
  table { border-collapse: collapse; width: 100%; margin: 12px 0; }
  th { background: var(--apex-primary); color: white; font-weight: 600; padding: 8px 12px; text-align: left; }
  td { padding: 6px 12px; border-bottom: 1px solid #ddd; }
  tr:nth-child(even) { background: var(--apex-bg); }
  code { background: #f5f5f5; padding: 2px 6px; border-radius: 3px; font-size: 0.9em; }
  pre { background: #1A1A1A; color: #f5f5f5; padding: 16px; border-radius: 6px; overflow-x: auto; }
  blockquote { border-left: 4px solid var(--apex-primary); padding-left: 16px; color: var(--apex-text-light); font-style: italic; }
  .evidence-tag { display: inline-block; padding: 2px 8px; border-radius: 4px; font-size: 0.75rem; font-weight: 600; margin: 0 2px; }
  .evidence-plan { background: #DBEAFE; color: #1E40AF; }
  .evidence-schedule { background: #E0E7FF; color: #3730A3; }
  .evidence-metric { background: #D1FAE5; color: #065F46; }
  .evidence-decision { background: #FEF3C7; color: #92400E; }
  .evidence-risk { background: #FEE2E2; color: #991B1B; }
  .evidence-stakeholder { background: #FFF7ED; color: #9A3412; }
  .evidence-baseline { background: #F3E8FF; color: #6B21A8; }
  .evidence-assumption { background: #FFEDD5; color: #C2410C; }
  @media print {
    body { padding: 15mm; }
    h1 { page-break-before: auto; }
    table { page-break-inside: avoid; }
  }
</style>
CSSEOF
)

# ─── Try Pandoc first ───
if command -v pandoc >/dev/null 2>&1; then
  echo "Exporting with Pandoc..."

  # Preprocess evidence tags
  TEMP_MD=$(mktemp /tmp/apex-export-XXXXXX.md)
  preprocess_evidence_tags "$INPUT_FILE" > "$TEMP_MD"

  # Create standalone HTML with embedded CSS
  TEMP_HTML=$(mktemp /tmp/apex-export-XXXXXX.html)
  echo "$APEX_CSS" > "$TEMP_HTML"

  # Check if wkhtmltopdf is available for PDF
  if command -v wkhtmltopdf >/dev/null 2>&1; then
    pandoc "$TEMP_MD" -f markdown -t html5 --standalone \
      --metadata title="PMO-APEX Deliverable" \
      --css /dev/null \
      -H <(echo "$APEX_CSS") \
      -o "$TEMP_HTML" 2>/dev/null

    wkhtmltopdf --enable-local-file-access \
      --margin-top 20mm --margin-bottom 20mm \
      --margin-left 15mm --margin-right 15mm \
      "$TEMP_HTML" "$OUTPUT_FILE" 2>/dev/null

    echo "PDF exported: $OUTPUT_FILE"
  else
    # Export as HTML instead
    OUTPUT_HTML="${OUTPUT_FILE%.pdf}.html"
    pandoc "$TEMP_MD" -f markdown -t html5 --standalone \
      --metadata title="PMO-APEX Deliverable" \
      -H <(echo "$APEX_CSS") \
      -o "$OUTPUT_HTML" 2>/dev/null

    echo "HTML exported: $OUTPUT_HTML"
    echo "wkhtmltopdf not installed — exported as HTML instead."
    echo "   Install: brew install wkhtmltopdf (macOS) or apt install wkhtmltopdf (Linux)"
  fi

  rm -f "$TEMP_MD" "$TEMP_HTML"

elif command -v typst >/dev/null 2>&1; then
  echo "Exporting with Typst..."
  if [ -f "$TEMPLATE_DIR/apex-pdf-template.typ" ]; then
    typst compile "$INPUT_FILE" "$OUTPUT_FILE" --root "$TARGET_DIR" 2>/dev/null
    echo "PDF exported: $OUTPUT_FILE"
  else
    echo "Typst template not found at $TEMPLATE_DIR/apex-pdf-template.typ"
    exit 1
  fi

else
  echo "No PDF engine found. Install one of:"
  echo "   - pandoc + wkhtmltopdf: brew install pandoc wkhtmltopdf"
  echo "   - typst: brew install typst"
  exit 1
fi
