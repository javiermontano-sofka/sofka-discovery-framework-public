#!/usr/bin/env bash
# Plugin QA — Ghost Menu Injector
# Generates contextual navigation menu in pqa/ghost-menu.md
# Hook: SessionStart
# (c) 2026 JM Labs - Javier Montano
set -euo pipefail

TARGET_DIR="${1:-$(pwd)}"
PQA_DIR="$TARGET_DIR/pqa"
GHOST_MENU="$PQA_DIR/ghost-menu.md"

mkdir -p "$PQA_DIR"

# Generate ghost menu
cat > "$GHOST_MENU" << 'MENU'
<!-- PQA Ghost Menu -->
---
<details><summary>PQA Quick Nav</summary>

| Action | Command | Alias |
|--------|---------|-------|
| Full QA audit | `/pqa:audit` | `/pqa:a` |
| Quick validate | `/pqa:validate` | `/pqa:v` |
| Create plugin | `/pqa:create` | `/pqa:c` |
| Full lifecycle | `/pqa:lifecycle` | `/pqa:l` |
| Auto-fix issues | `/pqa:fix` | `/pqa:f` |
| Show menu | `/pqa:menu` | |
| Ideate plugin | `/pqa:ideate` | `/pqa:i` |
| Plan architecture | `/pqa:plan` | `/pqa:p` |
| Design component | `/pqa:design` | `/pqa:d` |
| Generate specs | `/pqa:spec` | `/pqa:s` |
| Build scaffold | `/pqa:build` | `/pqa:b` |
| QA report | `/pqa:report` | `/pqa:r` |

</details>
<!-- /PQA Ghost Menu -->
MENU

echo "- Generated ghost-menu.md in pqa/"

exit 0
