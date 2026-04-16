#!/bin/bash
# Generate MOAT directory structure for a skill
# Usage: ./generate-moat-dirs.sh <skill-name> [target-skills-dir]
#
# Creates: skills/{skill-name}/{references,examples,prompts,scripts,assets}
# Only creates subdirectories specified via flags or all by default.

set -euo pipefail

SKILL_NAME="${1:?Usage: $0 <skill-name> [target-skills-dir]}"
TARGET_DIR="${2:-skills}"

SKILL_DIR="${TARGET_DIR}/${SKILL_NAME}"

if [[ -d "${SKILL_DIR}" ]]; then
    echo "WARNING: Directory ${SKILL_DIR} already exists."
    echo "Existing contents:"
    ls -la "${SKILL_DIR}"
    echo ""
    echo "Proceeding will add missing subdirectories only."
fi

# Create skill root
mkdir -p "${SKILL_DIR}"

# Create MOAT subdirectories
for subdir in references examples prompts scripts assets; do
    if [[ ! -d "${SKILL_DIR}/${subdir}" ]]; then
        mkdir -p "${SKILL_DIR}/${subdir}"
        echo "Created: ${SKILL_DIR}/${subdir}/"
    else
        echo "Exists:  ${SKILL_DIR}/${subdir}/"
    fi
done

echo ""
echo "MOAT structure ready for: ${SKILL_NAME}"
echo "Next: write SKILL.md and populate subdirectories."
