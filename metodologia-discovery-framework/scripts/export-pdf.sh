#!/usr/bin/env bash
# export-pdf.sh — Export deliverable markdown to branded PDF
# MetodologIA MAO v1.2 — Open Discovery Framework
# MIT License

set -euo pipefail

INPUT_FILE="${1:-}"
TARGET_DIR="${2:-.}"
OUTPUT_FILE="${3:-}"
ASSETS_DIR="$TARGET_DIR/discovery/assets"
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
# Replace evidence tags with styled HTML before conversion
preprocess_evidence_tags() {
  local file="$1"
  sed \
    -e 's/\[CÓDIGO\]/<span class="evidence-tag evidence-codigo">CÓDIGO<\/span>/g' \
    -e 's/\[CONFIG\]/<span class="evidence-tag evidence-config">CONFIG<\/span>/g' \
    -e 's/\[DOC\]/<span class="evidence-tag evidence-doc">DOC<\/span>/g' \
    -e 's/\[INFERENCIA\]/<span class="evidence-tag evidence-inferencia">INFERENCIA<\/span>/g' \
    -e 's/\[SUPUESTO\]/<span class="evidence-tag evidence-supuesto">SUPUESTO<\/span>/g' \
    -e 's/\[STAKEHOLDER\]/<span class="evidence-tag evidence-stakeholder">STAKEHOLDER<\/span>/g' \
    -e 's/\[SECURITY\]/<span class="evidence-tag evidence-security">SECURITY<\/span>/g' \
    "$file"
}

# ─── MetodologIA CSS for PDF ───
MAO_CSS=$(cat << 'CSSEOF'
<style>
  :root {
    --mao-primary: #6366F1;
    --mao-bg: #0F172A;
    --mao-success: #FFD700;
    --mao-text: #F1F5F9;
    --mao-text-light: #94A3B8;
  }
  body {
    font-family: 'Poppins', 'Montserrat', -apple-system, sans-serif;
    font-size: 11pt;
    line-height: 1.6;
    color: var(--mao-text);
    background: var(--mao-bg);
    max-width: 210mm;
    margin: 0 auto;
    padding: 20mm;
  }
  h1 { color: var(--mao-primary); font-family: 'Montserrat', 'Poppins', sans-serif; font-weight: 700; font-size: 22pt; border-bottom: 3px solid var(--mao-primary); padding-bottom: 8px; }
  h2 { color: var(--mao-primary); font-family: 'Montserrat', 'Poppins', sans-serif; font-weight: 600; font-size: 16pt; margin-top: 24px; }
  h3 { color: var(--mao-text); font-weight: 600; font-size: 13pt; }
  table { border-collapse: collapse; width: 100%; margin: 12px 0; }
  th { background: var(--mao-primary); color: white; font-weight: 600; padding: 8px 12px; text-align: left; }
  td { padding: 6px 12px; border-bottom: 1px solid #334155; color: var(--mao-text); }
  tr:nth-child(even) { background: #1E293B; }
  code { background: #1E293B; color: #E2E8F0; padding: 2px 6px; border-radius: 3px; font-size: 0.9em; }
  pre { background: #020617; color: #E2E8F0; padding: 16px; border-radius: 6px; overflow-x: auto; }
  blockquote { border-left: 4px solid var(--mao-primary); padding-left: 16px; color: var(--mao-text-light); font-style: italic; }
  .evidence-tag { display: inline-block; padding: 2px 8px; border-radius: 4px; font-size: 0.75rem; font-weight: 600; margin: 0 2px; }
  .evidence-codigo { background: #E8F5E9; color: #2E7D32; }
  .evidence-config { background: #E3F2FD; color: #1565C0; }
  .evidence-doc { background: #FFF3E0; color: #E65100; }
  .evidence-inferencia { background: #F3E5F5; color: #7B1FA2; }
  .evidence-supuesto { background: #FFEBEE; color: #C62828; }
  .evidence-stakeholder { background: #FFF8E1; color: #F57F17; }
  .evidence-security { background: #FCE4EC; color: #AD1457; }
  /* Gold for success indicators */
  .success, .ok, .pass { color: #B8860B !important; background: #FFF8E1 !important; }
  @media print {
    body { padding: 15mm; background: white; color: #1A1A1A; }
    h1, h2 { color: #6366F1; }
    td { color: #1A1A1A; border-bottom: 1px solid #ddd; }
    tr:nth-child(even) { background: #F1F5F9; }
    table { page-break-inside: avoid; }
  }
</style>
CSSEOF
)

# ─── Try Pandoc first ───
if command -v pandoc >/dev/null 2>&1; then
  echo "📄 Exporting with Pandoc..."

  # Preprocess evidence tags
  TEMP_MD=$(mktemp /tmp/mao-export-XXXXXX.md)
  preprocess_evidence_tags "$INPUT_FILE" > "$TEMP_MD"

  # Create standalone HTML with embedded CSS
  TEMP_HTML=$(mktemp /tmp/mao-export-XXXXXX.html)
  echo "$MAO_CSS" > "$TEMP_HTML"

  # Check if wkhtmltopdf is available for PDF
  if command -v wkhtmltopdf >/dev/null 2>&1; then
    pandoc "$TEMP_MD" -f markdown -t html5 --standalone \
      --metadata title="MetodologIA MAO Deliverable" \
      --css /dev/null \
      -H <(echo "$MAO_CSS") \
      -o "$TEMP_HTML" 2>/dev/null

    wkhtmltopdf --enable-local-file-access \
      --margin-top 20mm --margin-bottom 20mm \
      --margin-left 15mm --margin-right 15mm \
      "$TEMP_HTML" "$OUTPUT_FILE" 2>/dev/null

    echo "✅ PDF exported: $OUTPUT_FILE"
  else
    # Export as HTML instead
    OUTPUT_HTML="${OUTPUT_FILE%.pdf}.html"
    pandoc "$TEMP_MD" -f markdown -t html5 --standalone \
      --metadata title="MetodologIA MAO Deliverable" \
      -H <(echo "$MAO_CSS") \
      -o "$OUTPUT_HTML" 2>/dev/null

    echo "✅ HTML exported: $OUTPUT_HTML"
    echo "⚠️  wkhtmltopdf not installed — exported as HTML instead."
    echo "   Install: brew install wkhtmltopdf (macOS) or apt install wkhtmltopdf (Linux)"
  fi

  rm -f "$TEMP_MD" "$TEMP_HTML"

elif command -v typst >/dev/null 2>&1; then
  echo "📄 Exporting with Typst..."
  # Typst path (if template exists)
  if [ -f "$TEMPLATE_DIR/mao-pdf-template.typ" ]; then
    typst compile "$INPUT_FILE" "$OUTPUT_FILE" --root "$TARGET_DIR" 2>/dev/null
    echo "✅ PDF exported: $OUTPUT_FILE"
  else
    echo "❌ Typst template not found at $TEMPLATE_DIR/mao-pdf-template.typ"
    exit 1
  fi

else
  echo "❌ No PDF engine found. Install one of:"
  echo "   - pandoc + wkhtmltopdf: brew install pandoc wkhtmltopdf"
  echo "   - typst: brew install typst"
  exit 1
fi
