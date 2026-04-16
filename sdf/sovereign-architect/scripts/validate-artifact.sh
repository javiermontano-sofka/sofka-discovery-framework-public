#!/usr/bin/env bash
# Sovereign Architect — Artifact Validator
# Checks artifact against 10-point excellence criteria
# © 2026 JM Labs · Javier Montaño
set -euo pipefail

TARGET="${1:-}"
SCORE=0
TOTAL=10

if [[ -z "$TARGET" || ! -f "$TARGET" ]]; then
  echo "Usage: validate-artifact.sh <path-to-artifact>"
  exit 1
fi

BASENAME=$(basename "$TARGET")
CONTENT=$(cat "$TARGET")
LINES=$(wc -l < "$TARGET")

echo "## Artifact Validation — $BASENAME"
echo ""

# 1. Non-empty and substantial (>10 lines)
if (( LINES > 10 )); then echo "- [x] Substantial content ($LINES lines)"; SCORE=$((SCORE+1))
else echo "- [ ] Too short ($LINES lines, need >10)"; fi

# 2. Has a title (# heading)
if echo "$CONTENT" | grep -qE "^#\s"; then echo "- [x] Title present"; SCORE=$((SCORE+1))
else echo "- [ ] Missing title (# heading)"; fi

# 3. Has TL;DR or summary section
if echo "$CONTENT" | grep -qiE "(TL;DR|Summary|Resumen)"; then echo "- [x] TL;DR/Summary present"; SCORE=$((SCORE+1))
else echo "- [ ] Missing TL;DR or Summary"; fi

# 4. Evidence tags present
if echo "$CONTENT" | grep -qE "\[(CÓDIGO|CONFIG|DOC|INFERENCIA|SUPUESTO)\]"; then echo "- [x] Evidence tags found"; SCORE=$((SCORE+1))
else echo "- [ ] No evidence tags"; fi

# 5. No TODO/FIXME left unresolved
if echo "$CONTENT" | grep -qiE "(TODO|FIXME|HACK|XXX)"; then echo "- [ ] Unresolved TODOs found"
else echo "- [x] No unresolved TODOs"; SCORE=$((SCORE+1)); fi

# 6. Has structured data (table or list)
if echo "$CONTENT" | grep -qE "^\|.*\|$|^-\s|^\*\s|^[0-9]+\."; then echo "- [x] Structured data (tables/lists)"; SCORE=$((SCORE+1))
else echo "- [ ] No structured data"; fi

# 7. Has next steps or recommendations
if echo "$CONTENT" | grep -qiE "(next step|recommendation|recomendaci|siguiente paso|action item)"; then echo "- [x] Next steps present"; SCORE=$((SCORE+1))
else echo "- [ ] Missing next steps"; fi

# 8. Ghost menu present
if echo "$CONTENT" | grep -q "Ghost Menu"; then echo "- [x] Ghost menu injected"; SCORE=$((SCORE+1))
else echo "- [ ] No ghost menu"; fi

# 9. Proper naming convention
if echo "$BASENAME" | grep -qE "\{(WIP|Aprobado)\}"; then echo "- [x] Naming convention followed"; SCORE=$((SCORE+1))
else echo "- [ ] Missing {WIP}/{Aprobado} tag"; fi

# 10. No secrets or sensitive data
if echo "$CONTENT" | grep -qEi "(password|secret|api.key|token).*=.*['\"]"; then echo "- [ ] Possible secrets in content"
else echo "- [x] No exposed secrets"; SCORE=$((SCORE+1)); fi

echo ""
echo "> **Score: $SCORE/$TOTAL**"
if (( SCORE >= 8 )); then echo "> Grade: **EXCELLENT**"
elif (( SCORE >= 6 )); then echo "> Grade: **GOOD** — address remaining items"
elif (( SCORE >= 4 )); then echo "> Grade: **NEEDS WORK** — significant gaps"
else echo "> Grade: **INSUFFICIENT** — major rework required"; fi

exit 0
