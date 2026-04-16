#!/bin/bash
# Sofka Discovery Framework — Deliverable Quality Validator
# PostToolUse hook: validates discovery deliverables after Write|Edit
# Also used by PreToolUse (Write matcher) for pre-write risk checks
# Exit 0 = pass (stdout shown in transcript), non-zero = non-blocking warning

set -euo pipefail

# Read hook input from stdin
INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // .tool_input.filePath // empty' 2>/dev/null || echo "")

# Only validate discovery deliverables (00-14 series or named assessment outputs)
if [[ -z "$FILE_PATH" ]]; then
  exit 0
fi

BASENAME=$(basename "$FILE_PATH")

# Check if this is a discovery deliverable
if ! echo "$BASENAME" | grep -qE '^(0[0-9]|0[0-9]b|1[0-4])_|^(Architecture_|Data_|Cloud_|Security_|Change_)'; then
  exit 0
fi

# Validate the file exists and is readable
if [[ ! -f "$FILE_PATH" ]]; then
  exit 0
fi

CONTENT=$(cat "$FILE_PATH")
ISSUES=()
WARNINGS=()

# === EVIDENCE TAGS ===
if ! echo "$CONTENT" | grep -qE '\[(CÓDIGO|CODIGO|CONFIG|DOC|INFERENCIA|SUPUESTO|STAKEHOLDER|ACADEMIC|BENCHMARK|VENDOR-DOC)\]'; then
  ISSUES+=("Missing evidence tags ([CÓDIGO], [CONFIG], [DOC], [INFERENCIA])")
fi

# === TL;DR ===
if ! echo "$CONTENT" | grep -qiE '(TL;DR|TLDR|tl;dr|## Resumen Ejecutivo|Executive Summary)'; then
  ISSUES+=("Missing TL;DR or executive summary section")
fi

# === ANTI-PATTERNS (markdown-excellence) ===
ANTI_PATTERNS=(
  "cabe señalar"
  "es importante notar"
  "es importante mencionar"
  "cabe destacar"
  "vale la pena"
  "no está de más"
  "como se puede observar"
  "en este sentido"
  "dicho lo anterior"
  "en resumen"
  "sin lugar a dudas"
  "it is worth noting"
  "it should be noted"
  "needless to say"
)

for pattern in "${ANTI_PATTERNS[@]}"; do
  if echo "$CONTENT" | grep -qi "$pattern"; then
    WARNINGS+=("Anti-pattern: '$pattern' — replace with dense, direct prose")
  fi
done

# === PRICE/CURRENCY CHECK (CRITICAL) ===
if echo "$CONTENT" | grep -qE '(\$[0-9]|USD [0-9]|EUR [0-9]|COP [0-9]|£[0-9]|€[0-9]|precio final|tarifa|rate/hora|hourly rate|costo unitario|unit cost)'; then
  # Exclude known safe patterns: $ARGUMENTS, $1, $CLAUDE_PLUGIN_ROOT (shell variables)
  if ! echo "$CONTENT" | grep -qE '^\$[A-Z_]'; then
    ISSUES+=("CRITICAL: Price/currency detected — discovery outputs use FTE-months ONLY, never prices")
  fi
fi

# === JAVIER MONTAÑO CHECK ===
if echo "$CONTENT" | grep -qiE '(Javier Montan|J\. Montano|Montaño)'; then
  ISSUES+=("CRITICAL: Personal name 'Javier Montaño' detected — use 'Equipo PreSales Sofka' instead")
fi

# === DYNAMICS 365 / BUSINESS CENTRAL CHECK ===
# Historical error: OurSofka uses SAP S/4HANA, NOT Dynamics 365 Business Central
if echo "$CONTENT" | grep -qiE '(Dynamics 365|Business Central)'; then
  # Only flag if not in a "correction" or "historical" context
  if ! echo "$CONTENT" | grep -qiE '(corrección|correction|historical|descartado|discarded|OUT-)'; then
    WARNINGS+=("'Dynamics 365' or 'Business Central' detected — verify this is correct (OurSofka uses SAP S/4HANA)")
  fi
fi

# === MERMAID DIAGRAMS ===
if ! echo "$CONTENT" | grep -qE '(```mermaid|<pre class="mermaid">)'; then
  WARNINGS+=("No Mermaid diagrams — technical deliverables should include 1-4 diagrams")
fi

# === CROSS-REFERENCES ===
if ! echo "$CONTENT" | grep -qE '(→ See|→ Ver|Cross-ref|§|→ Ref)'; then
  WARNINGS+=("No cross-references — deliverables should reference related documents")
fi

# === SEMAPHORE TABLES ===
if ! echo "$CONTENT" | grep -qE '(🟢|🟡|🔴)'; then
  WARNINGS+=("No status indicators (🟢/🟡/🔴) — tables should use semaphore convention")
fi

# === AGENTIC TAGLINE ===
if ! echo "$CONTENT" | grep -qiE '(red agéntica|red agentica|inteligencia agéntica|inteligencia agentica)'; then
  WARNINGS+=("Missing agentic tagline in footer")
fi

# === DISCLAIMER CHECK (for roadmap and pitch) ===
if echo "$BASENAME" | grep -qE '^(06_|08_)'; then
  if ! echo "$CONTENT" | grep -qiE '(disclaimer|descargo|nota legal|estimación indicativa|indicative estimate)'; then
    ISSUES+=("Missing mandatory disclaimer in roadmap/pitch deliverable")
  fi
fi

# === INTERNAL MARKER (for document 13) ===
if echo "$BASENAME" | grep -qE '^13_'; then
  if ! echo "$CONTENT" | grep -qiE '(INTERNO|INTERNAL|confidencial|confidential)'; then
    WARNINGS+=("Document 13 should be marked as INTERNAL/INTERNO")
  fi
fi

# Build output
if [[ ${#ISSUES[@]} -eq 0 && ${#WARNINGS[@]} -eq 0 ]]; then
  echo "✅ '$BASENAME' passes all quality checks"
  exit 0
fi

OUTPUT=""
if [[ ${#ISSUES[@]} -gt 0 ]]; then
  OUTPUT+="⚠️ Quality issues in '$BASENAME':\n"
  for issue in "${ISSUES[@]}"; do
    OUTPUT+="  ❌ $issue\n"
  done
fi

if [[ ${#WARNINGS[@]} -gt 0 ]]; then
  OUTPUT+="💡 Suggestions for '$BASENAME':\n"
  for warning in "${WARNINGS[@]}"; do
    OUTPUT+="  ⚡ $warning\n"
  done
fi

echo -e "$OUTPUT"
exit 0
