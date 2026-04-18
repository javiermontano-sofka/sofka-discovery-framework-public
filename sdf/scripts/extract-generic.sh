#!/usr/bin/env bash
# Generic fallback extractor: file-type + strings head + hexdump head.
set -euo pipefail

PATH_IN="${1:?usage: extract-generic.sh <file> [out.md]}"
OUT="${2:-}"
NAME="$(basename "$PATH_IN")"
STEM="${NAME%.*}"
if [ -z "$OUT" ]; then
  mkdir -p .discovery
  OUT=".discovery/priming-rag-${STEM}.md"
fi

SHA="$(shasum -a 256 "$PATH_IN" | awk '{print $1}')"
SIZE="$(wc -c <"$PATH_IN" | tr -d ' ')"
KIND="$(file -b "$PATH_IN" 2>/dev/null || echo unknown)"

{
  echo "---"
  echo "source_path: $(cd "$(dirname "$PATH_IN")" && pwd)/$NAME"
  echo "sha256: $SHA"
  echo "bytes: $SIZE"
  echo "extractor: generic"
  echo "captured_at: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
  echo "---"
  echo
  echo "# Adjunto: $NAME"
  echo
  echo "## Resumen"
  echo "- Tipo detectado: $KIND"
  echo "- Tamaño: $SIZE bytes"
  echo
  echo "## Contenido estructurado"
  echo
  echo '### Strings (head 4000)'
  echo '```'
  strings "$PATH_IN" 2>/dev/null | head -200 || true
  echo '```'
  echo
  echo '### Hexdump (head 32 líneas)'
  echo '```'
  hexdump -C "$PATH_IN" 2>/dev/null | head -32 || true
  echo '```'
  echo
  echo "## Evidencia utilizable"
  echo "- \`[ADJUNTO:$NAME:generic]\`"
} >"$OUT"

echo "$OUT"
