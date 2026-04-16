#!/bin/bash
# Scaffold a minimal Claude Code plugin directory skeleton
# Usage: ./scaffold-plugin.sh <plugin-name> [target-parent-dir]
#
# Creates the standard plugin directory structure with placeholder files.

set -euo pipefail

PLUGIN_NAME="${1:?Usage: $0 <plugin-name> [target-parent-dir]}"
PARENT_DIR="${2:-.}"

# Validate plugin name is kebab-case (lowercase, hyphens, no path traversal)
if [[ ! "${PLUGIN_NAME}" =~ ^[a-z][a-z0-9]*(-[a-z0-9]+)*$ ]]; then
    echo "ERROR: Plugin name must be kebab-case (e.g., 'my-plugin')."
    echo "  Got: '${PLUGIN_NAME}'"
    echo "  Rules: lowercase letters/numbers, hyphens as separators, no dots/slashes/spaces."
    exit 1
fi

PLUGIN_DIR="${PARENT_DIR}/${PLUGIN_NAME}"

if [[ -d "${PLUGIN_DIR}" ]]; then
    echo "ERROR: Directory ${PLUGIN_DIR} already exists."
    echo "Remove it first or choose a different name."
    exit 1
fi

echo "Scaffolding plugin: ${PLUGIN_NAME}"
echo "Location: ${PLUGIN_DIR}"
echo ""

# Create directory structure
mkdir -p "${PLUGIN_DIR}/.claude-plugin"
mkdir -p "${PLUGIN_DIR}/skills"
mkdir -p "${PLUGIN_DIR}/commands"
mkdir -p "${PLUGIN_DIR}/agents"
mkdir -p "${PLUGIN_DIR}/hooks"

# Create plugin.json (quoted heredoc + jq for safe substitution)
cat > "${PLUGIN_DIR}/.claude-plugin/plugin.json" << 'EOF'
{
  "name": "PLUGIN_NAME_PLACEHOLDER",
  "version": "1.0.0",
  "description": "TODO: Add plugin description",
  "author": "TODO: Add author",
  "license": "MIT"
}
EOF
if command -v jq &> /dev/null; then
    jq --arg name "${PLUGIN_NAME}" '.name = $name' "${PLUGIN_DIR}/.claude-plugin/plugin.json" > "${PLUGIN_DIR}/.claude-plugin/plugin.json.tmp" \
        && mv "${PLUGIN_DIR}/.claude-plugin/plugin.json.tmp" "${PLUGIN_DIR}/.claude-plugin/plugin.json"
else
    sed -i.bak "s/PLUGIN_NAME_PLACEHOLDER/${PLUGIN_NAME//\//\\/}/g" "${PLUGIN_DIR}/.claude-plugin/plugin.json" \
        && rm -f "${PLUGIN_DIR}/.claude-plugin/plugin.json.bak"
fi

# Create settings.json
cat > "${PLUGIN_DIR}/settings.json" << 'EOF'
{
  "agent": "TODO-default-agent"
}
EOF

# Create hooks.json
cat > "${PLUGIN_DIR}/hooks/hooks.json" << 'EOF'
{
  "hooks": {}
}
EOF

# Create placeholder files
touch "${PLUGIN_DIR}/CLAUDE.md"
touch "${PLUGIN_DIR}/README.md"
touch "${PLUGIN_DIR}/LICENSE"

echo "Created directory structure:"
find "${PLUGIN_DIR}" -type f | sort | while read -r f; do
    echo "  ${f}"
done

echo ""
echo "Scaffold complete. Next steps:"
echo "  1. Edit .claude-plugin/plugin.json with real metadata"
echo "  2. Create agents in agents/"
echo "  3. Create skills in skills/"
echo "  4. Create commands in commands/"
echo "  5. Write CLAUDE.md and README.md"
