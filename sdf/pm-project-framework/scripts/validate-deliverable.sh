#!/usr/bin/env bash
# validate-deliverable.sh — Deliverable Quality Validator
# PMO-APEX v1.0 — Agentic Project Management as Service
# © 2026 PMO-APEX. All Rights Reserved.
#
# PostToolUse hook: validates PM deliverables after Write|Edit.
# Also used by PreToolUse (Write matcher) for pre-write risk checks.
# Exit 0 = pass (stdout shown in transcript), non-zero = non-blocking warning.

set -euo pipefail

# Read hook input from stdin
INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // .tool_input.filePath // empty' 2>/dev/null || echo "")

# Only validate PM deliverables (00-14 series)
if [[ -z "$FILE_PATH" ]]; then
  exit 0
fi

BASENAME=$(basename "$FILE_PATH")

# Check if this is a PM deliverable
if ! echo "$BASENAME" | grep -qE '^(0[0-9]|1[0-4])_'; then
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
if ! echo "$CONTENT" | grep -qE '\[(PLAN|SCHEDULE|METRIC|DECISION|RISK|STAKEHOLDER|BASELINE|ASSUMPTION)\]'; then
  ISSUES+=("Missing evidence tags ([PLAN], [SCHEDULE], [METRIC], [DECISION])")
fi

# === TL;DR ===
if ! echo "$CONTENT" | grep -qiE '(TL;DR|TLDR|tl;dr|## Executive Summary|## Resumen Ejecutivo)'; then
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
  if ! echo "$CONTENT" | grep -qE '^\$[A-Z_]'; then
    ISSUES+=("CRITICAL: Price/currency detected — PM outputs use FTE-months ONLY, never prices")
  fi
fi

# === MERMAID DIAGRAMS ===
if ! echo "$CONTENT" | grep -qE '(```mermaid|<pre class="mermaid">)'; then
  WARNINGS+=("No Mermaid diagrams — PM deliverables should include Gantt, RACI, or flow diagrams")
fi

# === CROSS-REFERENCES ===
if ! echo "$CONTENT" | grep -qE '(-> See|-> Ver|Cross-ref|§|-> Ref)'; then
  WARNINGS+=("No cross-references — deliverables should reference related PM documents")
fi

# === RISK REGISTER CHECK (for document 05) ===
if echo "$BASENAME" | grep -qE '^05_'; then
  if ! echo "$CONTENT" | grep -qiE '(probability|probabilidad|impact|impacto|mitigation|mitigación)'; then
    ISSUES+=("Risk Register missing required columns: probability, impact, mitigation")
  fi
fi

# === CHARTER CHECK (for document 00) ===
if echo "$BASENAME" | grep -qE '^00_'; then
  if ! echo "$CONTENT" | grep -qiE '(objective|objetivo|scope|alcance|sponsor)'; then
    ISSUES+=("Project Charter missing required sections: objectives, scope, or sponsor")
  fi
fi

# === CLOSURE CHECK (for document 14) ===
if echo "$BASENAME" | grep -qE '^14_'; then
  if ! echo "$CONTENT" | grep -qiE '(acceptance|aceptación|sign-off|lessons|lecciones)'; then
    WARNINGS+=("Closure Report should include acceptance criteria, sign-off, and lessons learned")
  fi
fi

# === BASELINE CHECK (for documents 03, 04) ===
if echo "$BASENAME" | grep -qE '^0[34]_'; then
  if ! echo "$CONTENT" | grep -qiE '(baseline|línea base|approved|aprobado|version)'; then
    WARNINGS+=("Baseline deliverable should include version control and approval status")
  fi
fi

# Build output
if [[ ${#ISSUES[@]} -eq 0 && ${#WARNINGS[@]} -eq 0 ]]; then
  echo "'$BASENAME' passes all quality checks"
  exit 0
fi

OUTPUT=""
if [[ ${#ISSUES[@]} -gt 0 ]]; then
  OUTPUT+="Quality issues in '$BASENAME':\n"
  for issue in "${ISSUES[@]}"; do
    OUTPUT+="  ISSUE: $issue\n"
  done
fi

if [[ ${#WARNINGS[@]} -gt 0 ]]; then
  OUTPUT+="Suggestions for '$BASENAME':\n"
  for warning in "${WARNINGS[@]}"; do
    OUTPUT+="  NOTE: $warning\n"
  done
fi

echo -e "$OUTPUT"
exit 0
