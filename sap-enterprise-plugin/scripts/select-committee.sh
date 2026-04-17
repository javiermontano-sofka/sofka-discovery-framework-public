#!/usr/bin/env bash
# select-committee.sh
# Selects committee composition (5/7/9 members, odd) based on query analysis.
# Always includes 4 permanents + N flex (thematic/module balance).
# Author: Diseñado por Javier Montaño

set -o pipefail

QUERY="${1:-}"
COMPLEXITY="${2:-auto}"  # auto | baja | media | alta

if [ -z "$QUERY" ]; then
  echo '{"error":"Usage: select-committee.sh <query> [baja|media|alta]"}'
  exit 1
fi

# Lowercase query for matching
QL=$(echo "$QUERY" | tr '[:upper:]' '[:lower:]')

# =============================================================================
# COMPLEXITY DETECTION (if auto)
# =============================================================================
if [ "$COMPLEXITY" = "auto" ]; then
  # Count module keywords
  MOD_HITS=0
  for mod in "fi " "ar " "ap " "gl " "co " "sd " "mm " "pp " "ps " "pm " "qm " "wm " "ewm " "hcm " "successfactors" "ariba" "treasury" "trm"; do
    if echo "$QL" | grep -qE "(^| |/)$mod"; then
      MOD_HITS=$((MOD_HITS + 1))
    fi
  done

  # Check for architectural/design keywords
  ARCH_HITS=0
  for kw in "architect" "arquitectura" "design" "diseño" "adopci" "transformac" "roadmap" "strateg" "estrateg" "plan" "auditar" "audit"; do
    if echo "$QL" | grep -q "$kw"; then
      ARCH_HITS=$((ARCH_HITS + 1))
    fi
  done

  # Decide complexity
  if [ "$MOD_HITS" -ge 3 ] || [ "$ARCH_HITS" -ge 2 ]; then
    COMPLEXITY="alta"
  elif [ "$MOD_HITS" -ge 1 ] || [ "$ARCH_HITS" -ge 1 ]; then
    COMPLEXITY="media"
  else
    COMPLEXITY="baja"
  fi
fi

# =============================================================================
# COMMITTEE SIZE
# =============================================================================
case "$COMPLEXITY" in
  baja) SIZE=5 ;;
  media) SIZE=7 ;;
  alta) SIZE=9 ;;
  *) SIZE=7 ;;
esac

FLEX=$((SIZE - 4))  # 4 permanents always

# =============================================================================
# PERMANENT COMMITTEE
# =============================================================================
PERMANENT='["sap-docs-steward", "functional-lead", "abap-expert", "qa-validator"]'

# =============================================================================
# THEMATIC SELECTION (based on keywords)
# =============================================================================
THEMATIC=()

# Finance/tax
echo "$QL" | grep -qE "finan|fi |ifrs|gaap|revenue|accoun" && THEMATIC+=("finance-expert")
echo "$QL" | grep -qE "impuest|tax|vat|withhold|iva|fiscal" && THEMATIC+=("tax-expert")
echo "$QL" | grep -qE "compli|sox|gdpr|audit" && THEMATIC+=("compliance-regulatory-expert")

# Security/data
echo "$QL" | grep -qE "security|seguridad|authentic" && THEMATIC+=("security-expert")
echo "$QL" | grep -qE "sod|segreg|grc|authoriz" && THEMATIC+=("grc-authorizations-expert")
echo "$QL" | grep -qE "mdg|master data|governance" && THEMATIC+=("data-mdg-expert")
echo "$QL" | grep -qE "migrat|strangler|cockpit" && THEMATIC+=("data-migration-expert")

# Integration/cloud
echo "$QL" | grep -qE "integrat|integr|cpi|iflow|api|odata|event" && THEMATIC+=("integration-patterns-expert")
echo "$QL" | grep -qE "btp|cloud|hana cloud|cap application" && THEMATIC+=("cloud-btp-expert")

# Analytics/AI
echo "$QL" | grep -qE "analytic|bi |datasphere|sac |reporting" && THEMATIC+=("analytics-bi-expert")
echo "$QL" | grep -qE "ai |ml |joule|genai|prompt" && THEMATIC+=("ai-ml-expert")

# Change/testing/perf
echo "$QL" | grep -qE "change|adopcion|adkar|training|adoption" && THEMATIC+=("change-ocm-expert")
echo "$QL" | grep -qE "perfor|load|stress|tuning" && THEMATIC+=("performance-engineering-expert")
echo "$QL" | grep -qE "test|uat|regression" && THEMATIC+=("testing-strategy-expert")

# Strategy
echo "$QL" | grep -qE "clean core|extensib" && THEMATIC+=("clean-core-strategist")
echo "$QL" | grep -qE "activate|metodolog|phases|gates" && THEMATIC+=("sap-activate-methodologist")
echo "$QL" | grep -qE "cutover|rehearsal|go-live" && THEMATIC+=("cutover-management-expert")
echo "$QL" | grep -qE "hypercare|ams " && THEMATIC+=("hypercare-expert")
echo "$QL" | grep -qE "rap|cds|abap cloud" && THEMATIC+=("extensibility-expert")

# Arch/UX
echo "$QL" | grep -qE "architec|arquitec|enterprise|togaf|leanix" && THEMATIC+=("enterprise-architect")
echo "$QL" | grep -qE "solution design|blueprint|topology" && THEMATIC+=("solution-architect")
echo "$QL" | grep -qE "fiori|ux |ui ui5|mobile" && THEMATIC+=("ux-fiori-design-expert")

# PM/cost
echo "$QL" | grep -qE "pmbok|waterfall|gates|steering" && THEMATIC+=("pm-traditional-expert")
echo "$QL" | grep -qE "safe|scrum|agile|sprint" && THEMATIC+=("pm-agile-expert")
echo "$QL" | grep -qE "cost|costo|roi|tco|fte|esfuerzo|business case" && THEMATIC+=("cost-value-engineering-expert")
echo "$QL" | grep -qE "risk|riesgo|mitigation" && THEMATIC+=("risk-management-expert")

# Licensing/ops
echo "$QL" | grep -qE "licens|rise|grow|contract" && THEMATIC+=("licensing-commercial-expert")
echo "$QL" | grep -qE "devops|ci/cd|gcts|transport" && THEMATIC+=("devops-cicd-expert")
echo "$QL" | grep -qE "observab|cloud alm|focused run|alert" && THEMATIC+=("observability-expert")
echo "$QL" | grep -qE "finops|consumption|budget" && THEMATIC+=("finops-btp-expert")

# Industry
echo "$QL" | grep -qE "services|consulting|henka" && THEMATIC+=("industry-services-expert")
echo "$QL" | grep -qE "manufactur|discrete|process mfg|dmc|automotiv" && THEMATIC+=("industry-manufacturing-expert")
echo "$QL" | grep -qE "retail|commerce|omnichannel|fashion" && THEMATIC+=("industry-retail-expert")
echo "$QL" | grep -qE "banking|insurance|bfsi|financial services" && THEMATIC+=("industry-bfsi-expert")
echo "$QL" | grep -qE "public sector|government|healthcare|utilit" && THEMATIC+=("industry-public-sector-expert")

# Special
echo "$QL" | grep -qE "localiz|multi-country|latam|cfdi|fel" && THEMATIC+=("localization-expert")
echo "$QL" | grep -qE "sustainab|esg|green|carbon" && THEMATIC+=("esg-sustainability-expert")
echo "$QL" | grep -qE "workshop|facilit|design thinking" && THEMATIC+=("workshop-facilitator")
echo "$QL" | grep -qE "signavio|process mining|bpm" && THEMATIC+=("bpm-signavio-expert")
echo "$QL" | grep -qE "central finance|replicat" && THEMATIC+=("central-finance-specialist")

# =============================================================================
# MODULE SELECTION
# =============================================================================
MODULES=()

echo "$QL" | grep -qE "( fi |gl |ar |ap |parallel ledger|intercompany|asset account)" && MODULES+=("fi-specialist")
echo "$QL" | grep -qE "( co |cost center|profit center|activity type|co-pa)" && MODULES+=("co-specialist")
echo "$QL" | grep -qE "( sd |sales order|billing plan|pricing condit)" && MODULES+=("sd-specialist")
echo "$QL" | grep -qE "( mm |procurement|purchase order|invoice verif)" && MODULES+=("mm-specialist")
echo "$QL" | grep -qE "( pp |production plan|mrp |discrete|process mfg)" && MODULES+=("pp-specialist")
echo "$QL" | grep -qE "( ps |wbs|project system|cpm|network)" && MODULES+=("ps-specialist")
echo "$QL" | grep -qE "( pm |plant maintenance|work order|eam|equipment)" && MODULES+=("pm-eam-specialist")
echo "$QL" | grep -qE "( qm |quality|inspect)" && MODULES+=("qm-specialist")
echo "$QL" | grep -qE "( wm |ewm|warehouse|bin |wave)" && MODULES+=("wm-ewm-specialist")
echo "$QL" | grep -qE "(hcm |successfactors|employee central|payroll|cats)" && MODULES+=("hcm-sf-specialist")
echo "$QL" | grep -qE "(treasur|trm |fscm|cash mgmt)" && MODULES+=("treasury-specialist")
echo "$QL" | grep -qE "(ariba|sourcing|contingent|concur|fieldglass|business network)" && MODULES+=("ariba-successfactors-specialist")

# =============================================================================
# DEDUP + LIMIT to FLEX slots
# =============================================================================
# Remove duplicates (bash 3.x compatible — no associative arrays)
UNIQ_T=()
for t in "${THEMATIC[@]}"; do
  found=0
  for u in "${UNIQ_T[@]}"; do [ "$u" = "$t" ] && found=1 && break; done
  [ $found -eq 0 ] && UNIQ_T+=("$t")
done
UNIQ_M=()
for m in "${MODULES[@]}"; do
  found=0
  for u in "${UNIQ_M[@]}"; do [ "$u" = "$m" ] && found=1 && break; done
  [ $found -eq 0 ] && UNIQ_M+=("$m")
done

# Calculate how many thematic vs module based on flex slot count + 2:1 ratio preference
# 1 flex → 1 thematic (or 1 module)
# 3 flex → 2 thematic + 1 module
# 5 flex → 3 thematic + 2 module

case $FLEX in
  1) T_COUNT=1; M_COUNT=0 ;;
  3) T_COUNT=2; M_COUNT=1 ;;
  5) T_COUNT=3; M_COUNT=2 ;;
  *) T_COUNT=$((FLEX - 1)); M_COUNT=1 ;;
esac

# Fallback if no matches: select defaults
if [ ${#UNIQ_T[@]} -eq 0 ]; then
  UNIQ_T=("solution-architect" "sap-activate-methodologist" "enterprise-architect")
fi
if [ ${#UNIQ_M[@]} -eq 0 ]; then
  UNIQ_M=("fi-specialist" "co-specialist")
fi

# Slice to target count
SEL_T=("${UNIQ_T[@]:0:$T_COUNT}")
SEL_M=("${UNIQ_M[@]:0:$M_COUNT}")

# If slots not filled, backfill with other
while [ $(( ${#SEL_T[@]} + ${#SEL_M[@]} )) -lt "$FLEX" ]; do
  if [ ${#UNIQ_T[@]} -gt ${#SEL_T[@]} ]; then
    SEL_T+=("${UNIQ_T[${#SEL_T[@]}]}")
  elif [ ${#UNIQ_M[@]} -gt ${#SEL_M[@]} ]; then
    SEL_M+=("${UNIQ_M[${#SEL_M[@]}]}")
  else
    break
  fi
done

# =============================================================================
# JSON OUTPUT
# =============================================================================
thematic_json="["
for i in "${!SEL_T[@]}"; do
  [ $i -gt 0 ] && thematic_json+=", "
  thematic_json+="\"${SEL_T[$i]}\""
done
thematic_json+="]"

modules_json="["
for i in "${!SEL_M[@]}"; do
  [ $i -gt 0 ] && modules_json+=", "
  modules_json+="\"${SEL_M[$i]}\""
done
modules_json+="]"

cat <<EOF
{
  "complexity": "$COMPLEXITY",
  "size": $SIZE,
  "permanent": $PERMANENT,
  "thematic": $thematic_json,
  "modules": $modules_json,
  "flex_count": $FLEX,
  "rationale": "Auto-detected from query. MOD_HITS=$MOD_HITS, ARCH_HITS=$ARCH_HITS."
}
EOF
