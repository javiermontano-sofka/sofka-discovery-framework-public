#!/bin/bash
# MetodologIA Discovery Framework — Repository Indexer
# Creates discovery/repo-index.json with structured file inventory
# Used during CP-0 (Ingestion) for auto-detection and context loading

set -euo pipefail

TARGET_DIR="${1:-.}"
DISCOVERY_DIR="${TARGET_DIR}/discovery"
OUTPUT_FILE="${DISCOVERY_DIR}/repo-index.json"

# Create .discovery directory structure
mkdir -p "${DISCOVERY_DIR}/insights"
mkdir -p "${DISCOVERY_DIR}/transcripts"
mkdir -p "${DISCOVERY_DIR}/rag-priming"
mkdir -p "${DISCOVERY_DIR}/deliverables"

# Detect project name from manifests
PROJECT_NAME=""
PRIMARY_LANGUAGE=""
FRAMEWORK=""

if [[ -f "${TARGET_DIR}/package.json" ]]; then
  PROJECT_NAME=$(jq -r '.name // empty' "${TARGET_DIR}/package.json" 2>/dev/null || echo "")
  PRIMARY_LANGUAGE="JavaScript/TypeScript"
  FRAMEWORK=$(jq -r '.dependencies | keys[]' "${TARGET_DIR}/package.json" 2>/dev/null | head -3 | tr '\n' ', ' || echo "")
elif [[ -f "${TARGET_DIR}/pom.xml" ]]; then
  PROJECT_NAME=$(grep -oP '(?<=<artifactId>)[^<]+' "${TARGET_DIR}/pom.xml" 2>/dev/null | head -1 || echo "")
  PRIMARY_LANGUAGE="Java"
elif [[ -f "${TARGET_DIR}/build.gradle" ]] || [[ -f "${TARGET_DIR}/build.gradle.kts" ]]; then
  PRIMARY_LANGUAGE="Java/Kotlin"
elif [[ -f "${TARGET_DIR}/Cargo.toml" ]]; then
  PROJECT_NAME=$(grep -oP '(?<=name = ")[^"]+' "${TARGET_DIR}/Cargo.toml" 2>/dev/null | head -1 || echo "")
  PRIMARY_LANGUAGE="Rust"
elif [[ -f "${TARGET_DIR}/go.mod" ]]; then
  PROJECT_NAME=$(head -1 "${TARGET_DIR}/go.mod" 2>/dev/null | awk '{print $2}' || echo "")
  PRIMARY_LANGUAGE="Go"
elif [[ -f "${TARGET_DIR}/pyproject.toml" ]]; then
  PROJECT_NAME=$(grep -oP '(?<=name = ")[^"]+' "${TARGET_DIR}/pyproject.toml" 2>/dev/null | head -1 || echo "")
  PRIMARY_LANGUAGE="Python"
elif compgen -G "${TARGET_DIR}/*.sln" > /dev/null 2>&1; then
  PROJECT_NAME=$(basename "${TARGET_DIR}"/*.sln .sln 2>/dev/null | head -1 || echo "")
  PRIMARY_LANGUAGE="C#/.NET"
fi

# Fallback project name
[[ -z "$PROJECT_NAME" ]] && PROJECT_NAME=$(basename "$(cd "$TARGET_DIR" && pwd)")

# Count files by type (respect .gitignore if git repo)
if [[ -d "${TARGET_DIR}/.git" ]]; then
  FILE_LIST=$(cd "$TARGET_DIR" && git ls-files 2>/dev/null || find . -type f -not -path './.git/*' | head -500)
else
  FILE_LIST=$(find "$TARGET_DIR" -type f -not -path '*/.git/*' -not -path '*/node_modules/*' -not -path '*/discovery/*' 2>/dev/null | head -500)
fi

# Count by category
SOURCE_COUNT=$(echo "$FILE_LIST" | grep -cE '\.(ts|js|tsx|jsx|java|kt|py|go|rs|cs|rb|php|swift|dart)$' || echo 0)
TEST_COUNT=$(echo "$FILE_LIST" | grep -ciE '(test|spec|__test__)' || echo 0)
CONFIG_COUNT=$(echo "$FILE_LIST" | grep -cE '\.(json|yaml|yml|toml|xml|env|ini|conf)$' || echo 0)
DOC_COUNT=$(echo "$FILE_LIST" | grep -cE '\.(md|txt|pdf|docx|xlsx|pptx|rst)$' || echo 0)
TOTAL_COUNT=$(echo "$FILE_LIST" | wc -l | tr -d ' ')

# Detect CI/CD
CI_CD="none"
[[ -f "${TARGET_DIR}/.github/workflows/"*.yml ]] 2>/dev/null && CI_CD="GitHub Actions"
[[ -f "${TARGET_DIR}/.gitlab-ci.yml" ]] && CI_CD="GitLab CI"
[[ -f "${TARGET_DIR}/Jenkinsfile" ]] && CI_CD="Jenkins"
[[ -f "${TARGET_DIR}/azure-pipelines.yml" ]] && CI_CD="Azure DevOps"
[[ -f "${TARGET_DIR}/bitbucket-pipelines.yml" ]] && CI_CD="Bitbucket Pipelines"

# Detect containerization
CONTAINER="none"
[[ -f "${TARGET_DIR}/Dockerfile" ]] && CONTAINER="Docker"
[[ -f "${TARGET_DIR}/docker-compose.yml" ]] || [[ -f "${TARGET_DIR}/docker-compose.yaml" ]] && CONTAINER="Docker Compose"
[[ -d "${TARGET_DIR}/k8s" ]] || [[ -d "${TARGET_DIR}/kubernetes" ]] && CONTAINER="Kubernetes"

# Git stats
GIT_AUTHORS=0
GIT_LAST_COMMIT=""
if [[ -d "${TARGET_DIR}/.git" ]]; then
  GIT_AUTHORS=$(cd "$TARGET_DIR" && git log --format='%aN' 2>/dev/null | sort -u | wc -l | tr -d ' ' || echo 0)
  GIT_LAST_COMMIT=$(cd "$TARGET_DIR" && git log -1 --format='%ci' 2>/dev/null || echo "unknown")
fi

# List document files (for companion file generation)
DOC_FILES=$(echo "$FILE_LIST" | grep -E '\.(md|txt|pdf|docx|xlsx|pptx)$' | head -50 || echo "")

# Generate JSON output
cat > "$OUTPUT_FILE" << INDEXEOF
{
  "generated": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "framework": "MetodologIA Discovery Framework v9.0",
  "project": {
    "name": "$PROJECT_NAME",
    "language": "$PRIMARY_LANGUAGE",
    "framework": "${FRAMEWORK%,}",
    "root": "$(cd "$TARGET_DIR" && pwd)"
  },
  "counts": {
    "total": $TOTAL_COUNT,
    "source": $SOURCE_COUNT,
    "test": $TEST_COUNT,
    "config": $CONFIG_COUNT,
    "doc": $DOC_COUNT
  },
  "infrastructure": {
    "ci_cd": "$CI_CD",
    "container": "$CONTAINER"
  },
  "git": {
    "authors": $GIT_AUTHORS,
    "last_commit": "$GIT_LAST_COMMIT"
  },
  "documents_for_processing": [
$(echo "$DOC_FILES" | while IFS= read -r f; do
  [[ -z "$f" ]] && continue
  echo "    \"$f\","
done | sed '$ s/,$//')
  ]
}
INDEXEOF

echo "📁 Repo indexed: $PROJECT_NAME ($TOTAL_COUNT files, $SOURCE_COUNT source, $TEST_COUNT tests, $DOC_COUNT docs)"
echo "  📄 Index: $OUTPUT_FILE"
[[ -n "$DOC_FILES" ]] && echo "  📋 $(echo "$DOC_FILES" | wc -l | tr -d ' ') documents ready for companion file generation"

exit 0
