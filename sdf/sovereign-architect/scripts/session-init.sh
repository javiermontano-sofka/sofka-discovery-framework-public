#!/bin/bash
# Sovereign Architect — Session Initialization
# Hook: SessionStart
# Quick scan of the working directory to provide context signals.

set -euo pipefail

TARGET_DIR="${1:-$(pwd)}"

# Detect tech stack signals
echo "## SA Session Context"
echo ""

# Languages
if [[ -f "$TARGET_DIR/package.json" ]]; then
  echo "- **Node.js project detected** (package.json)"
  if grep -q '"typescript"' "$TARGET_DIR/package.json" 2>/dev/null; then
    echo "  - TypeScript enabled"
  fi
fi

if [[ -f "$TARGET_DIR/Cargo.toml" ]]; then
  echo "- **Rust project detected** (Cargo.toml)"
fi

if [[ -f "$TARGET_DIR/go.mod" ]]; then
  echo "- **Go project detected** (go.mod)"
fi

if [[ -f "$TARGET_DIR/requirements.txt" ]] || [[ -f "$TARGET_DIR/pyproject.toml" ]] || [[ -f "$TARGET_DIR/setup.py" ]]; then
  echo "- **Python project detected**"
fi

if [[ -f "$TARGET_DIR/pom.xml" ]] || [[ -f "$TARGET_DIR/build.gradle" ]]; then
  echo "- **Java/JVM project detected**"
fi

# CI/CD
for ci in ".github/workflows" ".gitlab-ci.yml" "Jenkinsfile" ".circleci"; do
  if [[ -e "$TARGET_DIR/$ci" ]]; then
    echo "- **CI/CD detected**: $ci"
    break
  fi
done

# Infrastructure
if [[ -f "$TARGET_DIR/Dockerfile" ]] || [[ -f "$TARGET_DIR/docker-compose.yml" ]]; then
  echo "- **Docker detected**"
fi

if find "$TARGET_DIR" -maxdepth 2 -name "*.tf" -type f 2>/dev/null | head -1 | grep -q .; then
  echo "- **Terraform detected**"
fi

# Git info
if [[ -d "$TARGET_DIR/.git" ]]; then
  BRANCH=$(git -C "$TARGET_DIR" branch --show-current 2>/dev/null || echo "unknown")
  LAST_COMMIT=$(git -C "$TARGET_DIR" log -1 --format="%h %s" 2>/dev/null || echo "unknown")
  echo "- **Git branch**: $BRANCH"
  echo "- **Last commit**: $LAST_COMMIT"
fi

echo ""
echo "> Sovereign Architect ready. Use \`/sa:menu\` for commands."

exit 0
