#!/usr/bin/env bash
# Sovereign Architect — Ghost Menu Injector
# Injects contextual navigation menu into generated artifacts
# © 2026 JM Labs · Javier Montaño
set -euo pipefail

TARGET_FILE="${1:-}"
SA_DIR="${2:-$(pwd)}/sa"
GHOST_MENU="$SA_DIR/ghost-menu.md"

# Generate ghost menu if it doesn't exist
if [[ ! -f "$GHOST_MENU" ]]; then
  mkdir -p "$SA_DIR"
  cat > "$GHOST_MENU" << 'MENU'
<!-- SA Ghost Menu -->
---
<details><summary>🧭 Sovereign Architect — Quick Nav</summary>

| Action | Command |
|--------|---------|
| Full analysis | `/sa:analyze` |
| Diagnose only | `/sa:diagnose` |
| Design + plan | `/sa:plan` |
| Security audit | `/sa:audit-security` |
| Architecture map | `/sa:map-architecture` |
| Generate ADR | `/sa:generate-adr` |
| Review artifact | `/sa:review` |
| Next step | `/sa:a` |

</details>
<!-- /SA Ghost Menu -->
MENU
  echo "- Generated ghost-menu.md in sa/"
fi

# Inject into target file if provided and menu not already present
if [[ -n "$TARGET_FILE" && -f "$TARGET_FILE" ]]; then
  if ! grep -q "SA Ghost Menu" "$TARGET_FILE" 2>/dev/null; then
    echo "" >> "$TARGET_FILE"
    cat "$GHOST_MENU" >> "$TARGET_FILE"
    echo "- Injected ghost menu into $(basename "$TARGET_FILE")"
  fi
else
  echo "- Ghost menu ready at $GHOST_MENU"
fi

exit 0
