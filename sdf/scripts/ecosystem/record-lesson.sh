#!/usr/bin/env bash
# record-lesson.sh — template a new entry in lessons-learned.md for the
# antifragile corrections loop (ADR-0020).
#
# Usage: bash record-lesson.sh <topic-slug>
#
# Prints a markdown template to stdout. Redirect/append as needed:
#   bash scripts/ecosystem/record-lesson.sh count-drift >> references/ontology/lessons-learned.md

set -euo pipefail

TOPIC="${1:-}"
if [ -z "$TOPIC" ]; then
  echo "usage: $0 <topic-slug>" >&2
  echo "example: $0 count-drift" >&2
  exit 1
fi

DATE="$(date +%Y-%m-%d)"

cat <<EOF

---

## ${DATE} — ${TOPIC}

### Mistake
<What went wrong. One or two concrete sentences. Name the symptom, not the emotion.>

### Root cause
<Why it happened. Not "we forgot" — the system-level reason humans forget this.>

### Fix
<What was committed to resolve the immediate issue. Include commit hash if already landed.>

### Validator added
<Name the validator (file path) that would have caught this. If no validator was
feasible, explicitly state "no validator — review-only" and why.>

### Concept made explicit (optional)
<If the mistake revealed a missing decision or understanding:
 - new ADR number + slug, or
 - new explanation essay path
 — skip if not applicable.>

### Takeaway
<One-sentence guideline for the future.>
EOF
