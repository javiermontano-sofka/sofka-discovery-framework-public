#!/usr/bin/env bash
# Audit: every command in SDF must use /sdf: prefix internally.
# Fails if any command file references /sap: /mao: /pm: /aad: /jm: (other plugin prefixes).
set -u
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CMD="$ROOT/commands"

violations=0
echo "[audit-prefixes] scanning $CMD ..."
while IFS= read -r f; do
  bad=$(grep -nE "/(sap|mao|pm|aad|jm):" "$f" 2>/dev/null || true)
  if [ -n "$bad" ]; then
    echo "FAIL  $f"
    echo "$bad" | sed 's/^/      /'
    violations=$((violations+1))
  fi
done < <(find "$CMD" -maxdepth 1 -name "*.md")

# also check argument-hint and description style
missing_desc=0
while IFS= read -r f; do
  if ! head -10 "$f" | grep -q "^description:"; then
    echo "WARN  $f (missing 'description:' in frontmatter)"
    missing_desc=$((missing_desc+1))
  fi
done < <(find "$CMD" -maxdepth 1 -name "*.md")

echo "[audit-prefixes] violations=$violations missing_desc=$missing_desc"
exit $violations
