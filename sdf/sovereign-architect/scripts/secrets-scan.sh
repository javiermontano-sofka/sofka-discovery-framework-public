#!/usr/bin/env bash
# Sovereign Architect — Secrets Scanner (G0 Gate)
# Scans for exposed secrets in the repository
# © 2026 JM Labs · Javier Montaño
set -euo pipefail

TARGET_DIR="${1:-$(pwd)}"
FAIL=0
FINDINGS=()

echo "## G0 Security Gate — Secrets Scan"
echo ""

# 1. Real .env files (not .env.example, .env.template, .env.sample)
while IFS= read -r f; do
  FINDINGS+=("CRITICAL: Exposed env file → $f")
  FAIL=1
done < <(find "$TARGET_DIR" -maxdepth 4 -name ".env" -o -name ".env.local" -o -name ".env.production" -o -name ".env.staging" 2>/dev/null | grep -v node_modules | grep -v .git)

# 2. Hardcoded API keys (common patterns)
PATTERNS=(
  'AKIA[0-9A-Z]{16}'                    # AWS Access Key
  'AIza[0-9A-Za-z_-]{35}'               # Google API Key
  'sk-[0-9a-zA-Z]{20,}'                 # OpenAI / Stripe secret key
  'ghp_[0-9a-zA-Z]{36}'                 # GitHub PAT
  'glpat-[0-9a-zA-Z_-]{20}'             # GitLab PAT
  'xox[bpors]-[0-9a-zA-Z-]+'            # Slack tokens
  'eyJ[A-Za-z0-9_-]*\.eyJ[A-Za-z0-9_-]*\.' # JWT tokens
)

for pattern in "${PATTERNS[@]}"; do
  while IFS= read -r match; do
    if [[ -n "$match" ]]; then
      FINDINGS+=("HIGH: Possible secret in → $match")
      FAIL=1
    fi
  done < <(grep -rln --include="*.{js,ts,py,java,go,rb,yaml,yml,json,toml,sh,env}" -E "$pattern" "$TARGET_DIR" 2>/dev/null | grep -v node_modules | grep -v .git | grep -v package-lock || true)
done

# 3. Private keys
while IFS= read -r f; do
  FINDINGS+=("CRITICAL: Private key file → $f")
  FAIL=1
done < <(find "$TARGET_DIR" -maxdepth 4 \( -name "*.pem" -o -name "*.key" -o -name "id_rsa" -o -name "id_ed25519" \) 2>/dev/null | grep -v node_modules | grep -v .git)

# 4. Report
if [[ ${#FINDINGS[@]} -eq 0 ]]; then
  echo "✅ **G0 PASS** — No exposed secrets detected."
else
  echo "❌ **G0 FAIL** — ${#FINDINGS[@]} finding(s):"
  echo ""
  for f in "${FINDINGS[@]}"; do
    echo "- $f"
  done
  echo ""
  echo "> Fix all findings before proceeding past G0."
fi

exit $FAIL
