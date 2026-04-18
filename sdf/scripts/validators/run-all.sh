#!/usr/bin/env bash
# run-all — execute every docs-quality validator sequentially.
#
# Exit code: max severity across validators (any ERROR → 1, else 0).
# Same invocation used by CI and by developers locally.
set -u

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$HERE/../../.." && pwd)"

status=0
for v in count-parity cross-refs acronym-gate adr-integrity link-check diataxis-purity; do
  echo "=== $v ==="
  python3 "$HERE/$v.py" || status=1
  echo
done
echo "=== summary ==="
if [ $status -eq 0 ]; then
  echo "✓ all validators passed"
else
  echo "✗ one or more validators reported ERROR"
fi
exit $status
