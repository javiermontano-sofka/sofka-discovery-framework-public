#!/usr/bin/env bash
# secrets-scan.sh — G0 Security Gate: Detect secrets before LLM context injection
# MetodologIA MAO v1.2 — Open Discovery Framework
# MIT License

set -euo pipefail

TARGET_DIR="${1:-.}"
DISCOVERY_DIR="$TARGET_DIR/discovery"
AUDIT_LOG="$DISCOVERY_DIR/mao-secrets-audit.log"

mkdir -p "$DISCOVERY_DIR"

# Ensure audit log is gitignored
GITIGNORE="$DISCOVERY_DIR/.gitignore"
if [ ! -f "$GITIGNORE" ]; then
  echo "mao-secrets-audit.log" > "$GITIGNORE"
  echo "mao-secrets-map.json" >> "$GITIGNORE"
elif ! grep -q 'mao-secrets-audit.log' "$GITIGNORE" 2>/dev/null; then
  echo "mao-secrets-audit.log" >> "$GITIGNORE"
  echo "mao-secrets-map.json" >> "$GITIGNORE"
fi

# Initialize audit log
echo "=== MAO G0 Security Scan ===" > "$AUDIT_LOG"
echo "Timestamp: $(date -u +%Y-%m-%dT%H:%M:%SZ)" >> "$AUDIT_LOG"
echo "Target: $TARGET_DIR" >> "$AUDIT_LOG"
echo "---" >> "$AUDIT_LOG"

FINDINGS=0

# Patterns to detect (POSIX ERE compatible)
# Each pattern: description|regex
PATTERNS=(
  "AWS Access Key|AKIA[0-9A-Z]{16}"
  "AWS Secret Key|(?i)aws[_-]?secret[_-]?access[_-]?key\s*[=:]\s*[A-Za-z0-9/+=]{20,}"
  "GitHub Token|gh[ps]_[A-Za-z0-9_]{36,}"
  "Generic API Key|(?i)(api[_-]?key|apikey)\s*[=:]\s*['\"]?[A-Za-z0-9_\-]{16,}['\"]?"
  "Generic Secret|(?i)(secret|password|passwd|pwd)\s*[=:]\s*['\"]?[^\s'\"]{8,}['\"]?"
  "Bearer Token|(?i)bearer\s+[A-Za-z0-9\-._~+/]+=*"
  "Connection String|(?i)(mongodb|postgres|mysql|redis|amqp)://[^\s'\"]{10,}"
  "Private Key Header|-----BEGIN (RSA |EC |DSA |OPENSSH )?PRIVATE KEY-----"
  "JWT Token|eyJ[A-Za-z0-9_-]{10,}\.[A-Za-z0-9_-]{10,}\.[A-Za-z0-9_-]{10,}"
  "Slack Token|xox[bpors]-[0-9]{10,}-[A-Za-z0-9]{10,}"
  "Azure Key|(?i)(azure|az)[_-]?(key|secret|token|password)\s*[=:]\s*['\"]?[^\s'\"]{8,}"
  "Anthropic Key|sk-ant-[A-Za-z0-9_-]{20,}"
  "OpenAI Key|sk-[A-Za-z0-9]{32,}"
  "Stripe Key|[sr]k_(live|test)_[A-Za-z0-9]{20,}"
)

# Files to skip (binary, lock files, node_modules, .git)
EXCLUDE_DIRS=".git|node_modules|.discovery|vendor|dist|build|__pycache__|.venv|venv"
EXCLUDE_EXTS="png|jpg|jpeg|gif|ico|svg|woff|woff2|ttf|eot|zip|tar|gz|jar|class|pyc|exe|dll|so|dylib|lock|pdf"

# Find text files respecting .gitignore
scan_files() {
  if command -v git >/dev/null 2>&1 && [ -d "$TARGET_DIR/.git" ]; then
    # Use git ls-files to respect .gitignore
    cd "$TARGET_DIR" && git ls-files --cached --others --exclude-standard 2>/dev/null | \
      grep -vE "\.($EXCLUDE_EXTS)$" || true
  else
    # Fallback: find with exclusions
    find "$TARGET_DIR" -type f \
      -not -path "*/.git/*" \
      -not -path "*/node_modules/*" \
      -not -path "*/discovery/*" \
      -not -path "*/vendor/*" \
      -not -path "*/__pycache__/*" \
      2>/dev/null | grep -vE "\.($EXCLUDE_EXTS)$" || true
  fi
}

# Scan each file for each pattern
while IFS= read -r file; do
  [ -z "$file" ] && continue

  filepath="$TARGET_DIR/$file"
  [ -f "$filepath" ] || filepath="$file"
  [ -f "$filepath" ] || continue

  # Skip files larger than 1MB (likely not config/source)
  file_size=$(wc -c < "$filepath" 2>/dev/null || echo 0)
  [ "$file_size" -gt 1048576 ] && continue

  for pattern_entry in "${PATTERNS[@]}"; do
    desc="${pattern_entry%%|*}"
    regex="${pattern_entry##*|}"

    # Use grep with PCRE if available, else ERE
    matches=""
    if command -v grep >/dev/null 2>&1; then
      matches=$(grep -nP "$regex" "$filepath" 2>/dev/null || true)
    fi

    if [ -n "$matches" ]; then
      while IFS= read -r match; do
        line_num="${match%%:*}"
        FINDINGS=$((FINDINGS + 1))
        echo "[$desc] $file:$line_num" >> "$AUDIT_LOG"
      done <<< "$matches"
    fi
  done
done < <(scan_files)

# Summary
echo "---" >> "$AUDIT_LOG"
echo "Total findings: $FINDINGS" >> "$AUDIT_LOG"

if [ "$FINDINGS" -gt 0 ]; then
  echo "Status: FINDINGS_DETECTED" >> "$AUDIT_LOG"
  echo "Action: Run /mao:scan-secrets to review and /mao:mask-secrets to remediate" >> "$AUDIT_LOG"
  # Output warning for prompt injection
  echo "⚠️  G0 SECURITY GATE: $FINDINGS potential secret(s) detected in the repository."
  echo "   Review: discovery/mao-secrets-audit.log"
  echo "   Remediate: /mao:scan-secrets"
  exit 1
else
  echo "Status: CLEAN" >> "$AUDIT_LOG"
  echo "✅ G0 Security Gate: PASSED — No secrets detected."
  exit 0
fi
