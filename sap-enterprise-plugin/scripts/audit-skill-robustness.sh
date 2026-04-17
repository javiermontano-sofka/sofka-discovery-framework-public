#!/usr/bin/env bash
# audit-skill-robustness.sh
# Scores a skill against the 7-dimension robustness canonical standard.
# Exit codes: 0 = robusta (>=5/7), 1 = parcial (3-4/7), 2 = embryonic (<3/7)
# Usage: bash audit-skill-robustness.sh <skill-name> [<plugin-root>]
# Author: Diseñado por Javier Montaño

set -o pipefail

SKILL="${1:-}"
PLUGIN_ROOT="${2:-$(dirname "$(dirname "$(realpath "$0")")")}"
SKILL_DIR="$PLUGIN_ROOT/skills/$SKILL"

if [ -z "$SKILL" ]; then
  echo "Usage: $0 <skill-name> [<plugin-root>]"
  echo ""
  echo "Available skills:"
  ls -d "$PLUGIN_ROOT"/skills/*/ 2>/dev/null | xargs -I {} basename {} | sed 's/^/  /'
  exit 1
fi

if [ ! -d "$SKILL_DIR" ]; then
  echo "ERROR: Skill not found: $SKILL_DIR"
  exit 1
fi

echo "=== Robustness Audit: $SKILL ==="
echo "Dir: $SKILL_DIR"
echo ""

SCORE=0
TOTAL=7

# Dimension 1: SKILL.md exists and non-trivial
if [ -f "$SKILL_DIR/SKILL.md" ]; then
  LINES=$(wc -l < "$SKILL_DIR/SKILL.md" | tr -d ' ')
  if [ "$LINES" -ge 80 ]; then
    echo "  ✓ [1/7] SKILL.md ($LINES lines, substantial)"
    SCORE=$((SCORE + 1))
  else
    echo "  ⚠️ [1/7] SKILL.md exists but thin ($LINES lines)"
    SCORE=$((SCORE + 1))  # half-credit
  fi
else
  echo "  ✗ [1/7] SKILL.md MISSING"
fi

# Dimension 2: agents/ with content
if [ -d "$SKILL_DIR/agents" ]; then
  COUNT=$(find "$SKILL_DIR/agents" -name "*.md" -type f | wc -l | tr -d ' ')
  if [ "$COUNT" -ge 1 ]; then
    echo "  ✓ [2/7] agents/ ($COUNT files)"
    SCORE=$((SCORE + 1))
  else
    echo "  ✗ [2/7] agents/ exists but empty"
  fi
else
  echo "  ✗ [2/7] agents/ MISSING"
fi

# Dimension 3: assets/ with content
if [ -d "$SKILL_DIR/assets" ]; then
  COUNT=$(find "$SKILL_DIR/assets" -type f | wc -l | tr -d ' ')
  if [ "$COUNT" -ge 1 ]; then
    echo "  ✓ [3/7] assets/ ($COUNT files)"
    SCORE=$((SCORE + 1))
  else
    echo "  ✗ [3/7] assets/ empty"
  fi
else
  echo "  ✗ [3/7] assets/ MISSING"
fi

# Dimension 4: references/ with content
if [ -d "$SKILL_DIR/references" ]; then
  COUNT=$(find "$SKILL_DIR/references" -type f | wc -l | tr -d ' ')
  if [ "$COUNT" -ge 2 ]; then
    echo "  ✓ [4/7] references/ ($COUNT files)"
    SCORE=$((SCORE + 1))
  elif [ "$COUNT" -ge 1 ]; then
    echo "  ⚠️ [4/7] references/ only $COUNT file (target: 2+)"
  else
    echo "  ✗ [4/7] references/ empty"
  fi
else
  echo "  ✗ [4/7] references/ MISSING"
fi

# Dimension 5: scripts/ with content
if [ -d "$SKILL_DIR/scripts" ]; then
  COUNT=$(find "$SKILL_DIR/scripts" -name "*.sh" -o -name "*.py" | wc -l | tr -d ' ')
  if [ "$COUNT" -ge 1 ]; then
    echo "  ✓ [5/7] scripts/ ($COUNT executable files)"
    SCORE=$((SCORE + 1))
  else
    echo "  ✗ [5/7] scripts/ empty"
  fi
else
  echo "  ✗ [5/7] scripts/ MISSING"
fi

# Dimension 6: evals/ with content
if [ -d "$SKILL_DIR/evals" ]; then
  if [ -f "$SKILL_DIR/evals/evals.json" ]; then
    # Check evals has at least 2 entries
    EVAL_COUNT=$(python3 -c "import json; d=json.load(open('$SKILL_DIR/evals/evals.json')); print(len(d.get('evals',[])))" 2>/dev/null || echo "0")
    if [ "$EVAL_COUNT" -ge 2 ]; then
      echo "  ✓ [6/7] evals/evals.json ($EVAL_COUNT test cases)"
      SCORE=$((SCORE + 1))
    else
      echo "  ⚠️ [6/7] evals.json exists but <2 test cases"
    fi
  else
    echo "  ✗ [6/7] evals/ exists but no evals.json"
  fi
else
  echo "  ✗ [6/7] evals/ MISSING"
fi

# Dimension 7: examples/ with content
if [ -d "$SKILL_DIR/examples" ]; then
  COUNT=$(find "$SKILL_DIR/examples" -type f | wc -l | tr -d ' ')
  if [ "$COUNT" -ge 1 ]; then
    echo "  ✓ [7/7] examples/ ($COUNT files)"
    SCORE=$((SCORE + 1))
  else
    echo "  ✗ [7/7] examples/ empty"
  fi
else
  echo "  ✗ [7/7] examples/ MISSING"
fi

echo ""
echo "=== Score: ${SCORE}/${TOTAL} ==="

if [ "$SCORE" -ge 6 ]; then
  echo "🟢 ROBUSTA (insignia)"
  exit 0
elif [ "$SCORE" -ge 5 ]; then
  echo "🟢 ROBUSTA (mínimo viable)"
  exit 0
elif [ "$SCORE" -ge 3 ]; then
  echo "🟡 PARCIAL — gaps significativos"
  exit 1
else
  echo "🔴 EMBRIONARIA — requiere scaffolding completo"
  exit 2
fi
