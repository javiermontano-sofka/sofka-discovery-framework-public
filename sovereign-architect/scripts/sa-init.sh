#!/usr/bin/env bash
# Sovereign Architect — Engagement Initializer
# Creates sa/ directory structure for a new engagement
# © 2026 JM Labs · Javier Montaño
set -euo pipefail

TARGET_DIR="${1:-$(pwd)}"
SA_DIR="$TARGET_DIR/sa"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

echo "## Sovereign Architect — New Engagement"
echo ""

if [[ -d "$SA_DIR" ]]; then
  echo "- sa/ directory already exists at $TARGET_DIR"
  echo "> Use existing engagement or delete sa/ to start fresh."
  exit 0
fi

# Create directory structure
mkdir -p "$SA_DIR"/{artifacts,reports,adrs,diagrams}

# SESSION-README
cat > "$SA_DIR/SESSION-README.md" << EOF
# Sovereign Architect Session
> Initialized: $TIMESTAMP

## Project
- **Path**: $TARGET_DIR
- **Engagement**: TBD

## Status
- [ ] Priming complete
- [ ] G0 security gate passed
- [ ] Initial analysis done

## Commands
| Action | Command |
|--------|---------|
| Full analysis | \`/sa:analyze\` |
| Prime repo | \`/sa:prime\` |
| Menu | \`/sa:menu\` |
EOF

# Session state
cat > "$SA_DIR/session-state.json" << EOF
{
  "initialized": "$TIMESTAMP",
  "phase": "pre-analysis",
  "gate": "G0",
  "primed": false,
  "artifacts": []
}
EOF

# Empty changelog
cat > "$SA_DIR/session-changelog.md" << 'EOF'
# Session Changelog
> Sovereign Architect — auto-generated action log

| Timestamp | Action | File |
|-----------|--------|------|
EOF

echo "- Created sa/ with subdirectories: artifacts/, reports/, adrs/, diagrams/"
echo "- Generated: SESSION-README.md, session-state.json, session-changelog.md"
echo ""
echo "> Engagement initialized. Run \`/sa:prime\` to load context."

exit 0
