#!/bin/bash
# MetodologIA Discovery Framework — Deliverable Scanner
# SessionStart hook: scans working directory for existing deliverables
# Also scans discovery/ directory and common output subdirectories
# Reports discovery pipeline status with companion file detection

set -euo pipefail

# Full discovery deliverable manifest (16 deliverables)
declare -A DELIVERABLES=(
  ["00"]="Discovery_Plan"
  ["01"]="Stakeholder_Map"
  ["02"]="Brief_Tecnico"
  ["03"]="Analisis_AS-IS"
  ["04"]="Mapeo_Flujos"
  ["05"]="Escenarios"
  ["05b"]="Feasibility_ThinkTank"
  ["06"]="Solution_Roadmap"
  ["07"]="Especificacion_Funcional"
  ["08"]="Pitch_Ejecutivo"
  ["09"]="Handover"
  ["10"]="Presentacion_Hallazgos"
  ["11"]="Hallazgos_Tecnicos"
  ["12"]="Hallazgos_Funcionales"
  ["13"]="Revision_Negocio"
  ["14"]="Oportunidades_IA"
)

FOUND=()
MISSING=()

# Search directories: cwd, discovery/deliverables/, and common output locations
SEARCH_DIRS=(
  "."
  "./discovery/deliverables"
  "./discovery"
  "./output"
  "./outputs"
  "./deliverables"
)

# Also search one level of subdirectories (e.g., outputs-discovery-*/v*/)
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

# Check for companion files (discovery/ structure)
COMPANION_COUNT=0
if [[ -d "./discovery" ]]; then
  for subdir in insights transcripts rag-priming; do
    if [[ -d "./discovery/$subdir" ]]; then
      count=$(find "./discovery/$subdir" -name "*.md" 2>/dev/null | wc -l)
      COMPANION_COUNT=$((COMPANION_COUNT + count))
    fi
  done
fi

# Check for repo index
HAS_INDEX=false
[[ -f "./discovery/repo-index.json" ]] && HAS_INDEX=true

# Build status report
TOTAL=${#DELIVERABLES[@]}
FOUND_COUNT=${#FOUND[@]}

if [[ $FOUND_COUNT -eq 0 ]]; then
  echo "📋 No discovery deliverables found — fresh start"
elif [[ $FOUND_COUNT -eq $TOTAL ]]; then
  echo "✅ All $TOTAL deliverables present — pipeline complete"
else
  echo "📊 Discovery progress: $FOUND_COUNT/$TOTAL deliverables found"
  if [[ ${#FOUND[@]} -gt 0 ]]; then
    echo "  ✅ Found: ${FOUND[*]}"
  fi
  echo "  📝 Pending: ${MISSING[*]}"
fi

# Report companion files and index
if [[ $COMPANION_COUNT -gt 0 ]] || $HAS_INDEX; then
  extras=""
  $HAS_INDEX && extras="repo-index"
  [[ $COMPANION_COUNT -gt 0 ]] && extras="${extras:+$extras, }${COMPANION_COUNT} companion files"
  echo "  📁 discovery/: $extras"
fi

exit 0
