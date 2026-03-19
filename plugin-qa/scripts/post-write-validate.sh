#!/usr/bin/env bash
# Plugin QA — Post-Write Validator (Autoridad Moral)
# After Write/Edit on .md files, validates frontmatter integrity
# Hook: PostToolUse (Write|Edit)
# (c) 2026 JM Labs - Javier Montano
set -euo pipefail

TARGET_DIR="${1:-$(pwd)}"

# Only validate if we're inside a plugin directory
PLUGIN_FOUND=false
for manifest in "$TARGET_DIR/.claude-plugin/plugin.json" "$TARGET_DIR/plugin.json"; do
  if [[ -f "$manifest" ]]; then
    PLUGIN_FOUND=true
    break
  fi
done

[[ "$PLUGIN_FOUND" == false ]] && exit 0

ERRORS=0

# Validate skill files: must have --- frontmatter block
for skill in "$TARGET_DIR"/skills/*/SKILL.md; do
  [[ -f "$skill" ]] || continue
  if ! head -1 "$skill" | grep -q '^---'; then
    echo "- WARNING: Missing frontmatter in $(basename "$(dirname "$skill")")/SKILL.md"
    ERRORS=$((ERRORS + 1))
  fi
done

# Validate agent files: must have name and description
for agent in "$TARGET_DIR"/agents/*.md; do
  [[ -f "$agent" ]] || continue
  BASENAME=$(basename "$agent")
  if ! head -20 "$agent" | grep -q 'name:'; then
    echo "- WARNING: Missing 'name:' in agent $BASENAME"
    ERRORS=$((ERRORS + 1))
  fi
  if ! head -20 "$agent" | grep -q 'description:'; then
    echo "- WARNING: Missing 'description:' in agent $BASENAME"
    ERRORS=$((ERRORS + 1))
  fi
done

# Validate command files: must have description and user-invocable
for cmd in "$TARGET_DIR"/commands/*.md; do
  [[ -f "$cmd" ]] || continue
  BASENAME=$(basename "$cmd")
  if ! head -10 "$cmd" | grep -q 'description:'; then
    echo "- WARNING: Missing 'description:' in command $BASENAME"
    ERRORS=$((ERRORS + 1))
  fi
  if ! head -10 "$cmd" | grep -q 'user-invocable:'; then
    echo "- WARNING: Missing 'user-invocable:' in command $BASENAME"
    ERRORS=$((ERRORS + 1))
  fi
done

if (( ERRORS > 0 )); then
  echo "- Post-write validation: $ERRORS issue(s) found"
else
  # Silent success — no noise on clean writes
  :
fi

exit 0
