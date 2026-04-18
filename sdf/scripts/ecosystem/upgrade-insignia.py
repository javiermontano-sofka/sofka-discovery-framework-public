#!/usr/bin/env python3
"""B4: Batch-stamp evals/grader.md to upgrade ROBUSTA → INSIGNIA-structure.

Each skill needs 7 components for full INSIGNIA:
  1. SKILL.md             (mandatory; already present)
  2. agents/grader.md     (stampable)
  3. evals/evals.json     (stampable)
  4. references/          (already present in most)
  5. examples/            (skip — content-heavy, defer)
  6. scripts/             (skip — content-heavy, defer)
  7. prompts/             (skip — content-heavy, defer)

This script focuses on stamping #2 and #3 only (the scaffolding lift). Each
stamped file declares `status: generated, review_required: true` so reviewers
can find them later.
"""
from __future__ import annotations

import json
import re
from pathlib import Path
from datetime import datetime

from _fm import ECOSYSTEM_ROOTS, iter_skill_files

GRADER_TEMPLATE = """---
status: generated
review_required: true
generated_at: {date}
generated_by: sdf-v13.1-quality-lift
---
# Grader — {skill_name}

> Skill-internal QA grader. Generated scaffold; refine with skill-specific assertions.

## Role

Grade outputs of `{skill_name}` for compliance against acceptance criteria.

## Grading Protocol

1. Read the deliverable file(s) emitted by this skill.
2. Score each assertion below as `passed: true|false|partial`.
3. Provide evidence (line refs / quotes) per assertion.
4. Emit `grading.json` with the `expectations` array.

## Domain Assertions (placeholder — refine per skill)

### Critical

- [ ] Output file exists and is non-empty
- [ ] Frontmatter present with required metadata
- [ ] No hallucinated facts (every claim has evidence tag from {{[CÓDIGO], [ADJUNTO], [CONFIG], [DOC], [NOTEBOOKLM], [STAKEHOLDER], [INFERENCIA], [SUPUESTO]}})
- [ ] Format matches output template specified in SKILL.md
- [ ] Quality gate criteria met

### Quality

- [ ] Sections complete (TL;DR, body, evidence, ghost menu)
- [ ] Cross-references resolve to existing files / agents
- [ ] No prohibited content (e.g., final prices — only FTE-meses)
- [ ] Brand colors compliant (no green; use --pos #FFD700 for success)

### Anti-Patterns (hard fail)

- Inventing facts not in source data
- Skipping required validation gate
- Producing prices instead of FTE-meses
- Mixing brand contexts (Sofka / MetodologIA / JM Labs)

## Scoring

- 8/9 critical pass → 🟢 PASS
- 5-7 → 🟡 PARTIAL
- <5 or any hard fail → 🔴 FAIL

## Example grading.json

```json
{{
  "skill": "{skill_name}",
  "expectations": [
    {{ "text": "Output file exists", "passed": true, "evidence": "found at .discovery/output.md" }},
    {{ "text": "All claims tagged with evidence", "passed": false, "evidence": "Section 3 has 4 untagged claims (lines 42, 51, 67, 89)" }}
  ],
  "score": "PARTIAL",
  "blockers": ["Section 3 untagged claims must be resolved before Gate G2"]
}}
```

---
*Generated scaffold — refine assertions per skill domain. SDF v13.1 quality lift.*
"""

EVALS_TEMPLATE = """{{
  "_meta": {{
    "status": "generated",
    "review_required": true,
    "generated_at": "{date}",
    "generated_by": "sdf-v13.1-quality-lift",
    "note": "Auto-stamped scaffold. Replace placeholder eval cases with real prompts and assertions."
  }},
  "skill_name": "{skill_name}",
  "description": "Test cases for {skill_name}. Refine prompts + assertions per skill domain.",
  "evals": [
    {{
      "id": 1,
      "name": "happy-path",
      "prompt": "Standard invocation of {skill_name} with complete context. Replace with realistic user prompt.",
      "files": [],
      "expected_output": "Skill produces deliverable matching its output template, with evidence tags.",
      "assertions": [
        "Output file generated",
        "Evidence tags present in body",
        "No prohibited content (prices, green colors, brand mixing)",
        "Quality gate criteria met"
      ]
    }},
    {{
      "id": 2,
      "name": "incomplete-context",
      "prompt": "Invocation with missing critical context. Replace with realistic edge case.",
      "files": [],
      "expected_output": "Skill flags missing context with [VACIO_CRITICO] and asks clarifying questions before proceeding.",
      "assertions": [
        "Output uses [VACIO_CRITICO] tag",
        "Asks clarifying questions BEFORE proceeding",
        "Does NOT fabricate context"
      ]
    }},
    {{
      "id": 3,
      "name": "validation-failure",
      "prompt": "Invocation that should trigger a validation gate failure. Replace with realistic failure case.",
      "files": [],
      "expected_output": "Skill detects violation, escalates to risk register or quality guardian.",
      "assertions": [
        "Failure detected and reported",
        "Escalation path followed",
        "No silent failures"
      ]
    }}
  ]
}}
"""


def main() -> int:
    today = datetime.utcnow().strftime("%Y-%m-%d")
    stamped = []
    skipped = []

    for plugin_id, root in ECOSYSTEM_ROOTS.items():
        if not root.is_dir():
            continue
        for sk in iter_skill_files(root):
            skill_dir = sk.parent
            skill_name = skill_dir.name
            evals_path = skill_dir / "evals" / "evals.json"
            grader_path = skill_dir / "agents" / "grader.md"
            actions = []
            if not evals_path.exists():
                evals_path.parent.mkdir(parents=True, exist_ok=True)
                evals_path.write_text(
                    EVALS_TEMPLATE.format(date=today, skill_name=skill_name),
                    encoding="utf-8")
                actions.append("evals.json")
            if not grader_path.exists():
                grader_path.parent.mkdir(parents=True, exist_ok=True)
                grader_path.write_text(
                    GRADER_TEMPLATE.format(date=today, skill_name=skill_name),
                    encoding="utf-8")
                actions.append("grader.md")
            if actions:
                stamped.append({"plugin": plugin_id, "skill": skill_name, "added": actions})
            else:
                skipped.append({"plugin": plugin_id, "skill": skill_name})

    log_dir = Path(__file__).parent / "logs"
    log_dir.mkdir(parents=True, exist_ok=True)
    (log_dir / "b4-insignia.log").write_text(
        json.dumps({"stamped": stamped, "skipped": skipped}, indent=2, ensure_ascii=False),
        encoding="utf-8")
    from collections import Counter
    print(f"B4: stamped={len(stamped)} skipped={len(skipped)}")
    for p, n in Counter(x["plugin"] for x in stamped).most_common():
        print(f"  {p}: {n}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
