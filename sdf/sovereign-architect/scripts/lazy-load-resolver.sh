#!/usr/bin/env bash
# Sovereign Architect — Lazy Load Resolver
# Progressive skill loading: L1=SKILL.md, L2=+references, L3=+prompts+examples
# © 2026 JM Labs · Javier Montaño
set -euo pipefail

SKILL_DIR="${1:-}"
LEVEL="${2:-L1}"

if [[ -z "$SKILL_DIR" || ! -d "$SKILL_DIR" ]]; then
  echo "Usage: lazy-load-resolver.sh <skill-directory> [L1|L2|L3]"
  exit 1
fi

SKILL_NAME=$(basename "$SKILL_DIR")
echo "## Lazy Load — $SKILL_NAME @ $LEVEL"
echo ""

# L1: Core skill definition only
if [[ -f "$SKILL_DIR/SKILL.md" ]]; then
  echo "- [L1] SKILL.md ($(wc -l < "$SKILL_DIR/SKILL.md") lines)"
  LOADED=("$SKILL_DIR/SKILL.md")
else
  echo "- ERROR: No SKILL.md found in $SKILL_DIR"
  exit 1
fi

# L2: Add references
if [[ "$LEVEL" == "L2" || "$LEVEL" == "L3" ]]; then
  if [[ -d "$SKILL_DIR/references" ]]; then
    for ref in "$SKILL_DIR/references"/*.md; do
      [[ -f "$ref" ]] || continue
      echo "- [L2] references/$(basename "$ref") ($(wc -l < "$ref") lines)"
      LOADED+=("$ref")
    done
  else
    echo "- [L2] No references/ directory"
  fi
fi

# L3: Add prompts and examples
if [[ "$LEVEL" == "L3" ]]; then
  for subdir in prompts examples; do
    if [[ -d "$SKILL_DIR/$subdir" ]]; then
      for f in "$SKILL_DIR/$subdir"/*; do
        [[ -f "$f" ]] || continue
        echo "- [L3] $subdir/$(basename "$f") ($(wc -l < "$f") lines)"
        LOADED+=("$f")
      done
    else
      echo "- [L3] No $subdir/ directory"
    fi
  done
fi

TOTAL=${#LOADED[@]}
echo ""
echo "> Loaded **$TOTAL** file(s) at level **$LEVEL** for skill **$SKILL_NAME**."

exit 0
