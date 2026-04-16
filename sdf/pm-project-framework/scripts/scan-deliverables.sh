#!/usr/bin/env bash
# scan-deliverables.sh — Detect PM deliverables in working directory
# PMO-APEX v1.0 — Agentic Project Management as Service
# © 2026 PMO-APEX. All Rights Reserved.
#
# SessionStart hook: scans working directory for existing PM deliverables.
# Reports project pipeline status with companion file detection.

set -euo pipefail

# Full PM deliverable manifest (15 deliverables)
declare -A DELIVERABLES=(
  ["00"]="Project_Charter"
  ["01"]="Stakeholder_Register"
  ["02"]="WBS"
  ["03"]="Schedule_Baseline"
  ["04"]="Budget_Baseline"
  ["05"]="Risk_Register"
  ["06"]="Quality_Plan"
  ["07"]="Communication_Plan"
  ["08"]="Resource_Plan"
  ["09"]="Procurement_Plan"
  ["10"]="Change_Log"
  ["11"]="Status_Report"
  ["12"]="Lessons_Learned"
  ["13"]="Transition_Plan"
  ["14"]="Closure_Report"
)

FOUND=()
MISSING=()

# Search directories: cwd, project/deliverables/, and common output locations
SEARCH_DIRS=(
  "."
  "./project/deliverables"
  "./project"
  "./output"
  "./outputs"
  "./deliverables"
)

# Also search one level of subdirectories
for subdir in ./outputs-*/; do
  [[ -d "$subdir" ]] && SEARCH_DIRS+=("$subdir")
  for vdir in "${subdir}"v*/; do
    [[ -d "$vdir" ]] && SEARCH_DIRS+=("$vdir")
  done
done 2>/dev/null

# Scan for deliverables
for num in $(echo "${!DELIVERABLES[@]}" | tr ' ' '\n' | sort); do
  name="${DELIVERABLES[$num]}"
  pattern="${num}_${name}*"
  found=false

  for dir in "${SEARCH_DIRS[@]}"; do
    if [[ -d "$dir" ]] && compgen -G "${dir}/${pattern}" > /dev/null 2>&1; then
      found=true
      break
    fi
  done

  if $found; then
    FOUND+=("$num")
  else
    MISSING+=("$num: $name")
  fi
done

# Check for companion files (project/ structure)
COMPANION_COUNT=0
if [[ -d "./project" ]]; then
  for subdir in insights transcripts rag-priming; do
    if [[ -d "./project/$subdir" ]]; then
      count=$(find "./project/$subdir" -name "*.md" 2>/dev/null | wc -l)
      COMPANION_COUNT=$((COMPANION_COUNT + count))
    fi
  done
fi

# Check for repo index
HAS_INDEX=false
[[ -f "./project/repo-index.json" ]] && HAS_INDEX=true

# Build status report
TOTAL=${#DELIVERABLES[@]}
FOUND_COUNT=${#FOUND[@]}

if [[ $FOUND_COUNT -eq 0 ]]; then
  echo "No PM deliverables found — fresh start"
elif [[ $FOUND_COUNT -eq $TOTAL ]]; then
  echo "All $TOTAL deliverables present — pipeline complete"
else
  echo "Project progress: $FOUND_COUNT/$TOTAL deliverables found"
  if [[ ${#FOUND[@]} -gt 0 ]]; then
    echo "  Found: ${FOUND[*]}"
  fi
  echo "  Pending: ${MISSING[*]}"
fi

# Report companion files and index
if [[ $COMPANION_COUNT -gt 0 ]] || $HAS_INDEX; then
  extras=""
  $HAS_INDEX && extras="repo-index"
  [[ $COMPANION_COUNT -gt 0 ]] && extras="${extras:+$extras, }${COMPANION_COUNT} companion files"
  echo "  project/: $extras"
fi

exit 0
