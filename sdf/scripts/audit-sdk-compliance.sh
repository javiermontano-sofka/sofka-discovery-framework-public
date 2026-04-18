#!/usr/bin/env bash
# Audit: Claude Agent SDK best-practice compliance for SDF agents and shared rules.
# Rules enforced:
#   R1: No subagent (file in agents/ except orchestrators) may have `Agent` tool
#   R2: Shared rules (files starting with `_`) must NOT have `name:` in frontmatter
#   R3: Every agent must have action-oriented description ("Use this ... when ...")
set -u
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
A="$ROOT/agents"

hard_fails=0
warns=0

echo "[audit-sdk] R1: Agent tool in subagents"
# Orchestrators may keep Agent; everyone else must not
while IFS= read -r f; do
  base=$(basename "$f")
  # Skip orchestrators and meta conductors
  case "$base" in
    sofka-discovery-conductor.md|discovery-conductor.md|environment-orchestrator.md|sap-orchestrator.md) continue ;;
  esac
  # Skip shared rules
  [[ "$base" == _* ]] && continue
  if awk '/^---$/{c++;next} c==1' "$f" | grep -qE '^\s*-\s*Agent\s*$|Agent\s*,|\[[^]]*Agent[^]]*\]'; then
    echo "  FAIL  $f (has Agent tool in frontmatter)"
    hard_fails=$((hard_fails+1))
  fi
done < <(find "$A" -name "*.md" -type f)

echo "[audit-sdk] R2: name: in shared rules (_*.md)"
while IFS= read -r f; do
  if awk '/^---$/{c++;next} c==1' "$f" | grep -q "^name:"; then
    echo "  FAIL  $f (shared rule must not have name: in frontmatter)"
    hard_fails=$((hard_fails+1))
  fi
done < <(find "$A" -maxdepth 2 -name "_*.md" -type f)

echo "[audit-sdk] R3: action-oriented descriptions"
while IFS= read -r f; do
  base=$(basename "$f")
  [[ "$base" == _* ]] && continue
  desc=$(awk '/^description:/{sub(/^description:\s*/,""); print; exit}' "$f")
  if [ -n "$desc" ] && ! echo "$desc" | grep -qE "^\"?(Use this|Impartial|Meta-|Pipeline|Validator|Auditor|Experto)" 2>/dev/null; then
    # soft check — don't hard-fail
    if echo "$desc" | grep -qE "^\"[A-Z]" && ! echo "$desc" | grep -qiE "use this|use when|trigger|when the user|para"; then
      # warn only
      echo "  WARN  $f (description may not be action-oriented)"
      warns=$((warns+1))
    fi
  fi
done < <(find "$A" -name "*.md" -type f)

echo "[audit-sdk] hard_fails=$hard_fails warns=$warns"
exit $hard_fails
