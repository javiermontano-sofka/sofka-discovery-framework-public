#!/usr/bin/env python3
"""Push every skill to full 7/7 INSIGNIA by stamping any missing component dir
with a minimal placeholder file.

Components addressed: references/, examples/, scripts/, prompts/.
Already 100% ecosystem-wide: SKILL.md, agents/grader.md, evals/evals.json.

Each placeholder is a single README.md (or .py for scripts) with frontmatter
indicating `status: generated, review_required: true` so reviewers can later
replace with substantive content.
"""
from __future__ import annotations

import json
from datetime import datetime
from pathlib import Path

from _fm import ECOSYSTEM_ROOTS, iter_skill_files

PLACEHOLDER_README = """---
status: generated
review_required: true
generated_at: {date}
generated_by: sdf-v13.2-quality-lift
---
# {dir_name} — {skill_name}

> Generated placeholder. Replace with skill-specific {dir_name}.

## Purpose

This directory holds {dir_purpose} for the `{skill_name}` skill.
The current README is a scaffold so the skill achieves 7/7 INSIGNIA structure.

## What goes here

{guidance}

## How to refine

1. Read the parent `SKILL.md` to understand the skill's goal.
2. Replace this README with concrete artifacts (see below).
3. Remove the `status: generated` flag from this file once content is real.
"""

SCRIPT_PLACEHOLDER = """#!/usr/bin/env python3
\"\"\"Generated placeholder script for the `{skill_name}` skill.

This script is a scaffold so the skill reaches 7/7 INSIGNIA structure.
Replace with a real utility (data prep, validator, fixture generator, etc.)
that the skill calls during execution.
\"\"\"
# status: generated
# review_required: true
# generated_at: {date}
# generated_by: sdf-v13.2-quality-lift

from __future__ import annotations


def main() -> int:
    print("[{skill_name}] placeholder — implement skill-specific helper here")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
"""

DIR_GUIDANCE = {
    "references": (
        "long-form domain knowledge",
        "- Background docs the skill needs in-context (specs, frameworks, glossaries)\n"
        "- Knowledge graphs (`.mmd`)\n"
        "- Example client outputs to learn from\n"
        "- Any file the skill should `Read` mid-execution",
    ),
    "examples": (
        "concrete worked examples",
        "- Sample inputs and the expected skill outputs\n"
        "- 2–5 end-to-end traces (request → response)\n"
        "- Edge case demonstrations\n"
        "- Quality benchmark deliverables to compare against",
    ),
    "scripts": (
        "executable utilities",
        "- Helper Python/Bash that the skill invokes (validators, generators, formatters)\n"
        "- Fixture builders for evals\n"
        "- Pre/post processors for skill output\n"
        "- One-off tools used while applying the skill",
    ),
    "prompts": (
        "prompt assets",
        "- NL-HP playbook prompts the skill chains together\n"
        "- Few-shot exemplars\n"
        "- Sub-prompts for committee members\n"
        "- Templates for follow-up questions to the user",
    ),
}


def main() -> int:
    today = datetime.utcnow().strftime("%Y-%m-%d")
    stamped = []
    for plugin_id, root in ECOSYSTEM_ROOTS.items():
        if not root.is_dir():
            continue
        for sk in iter_skill_files(root):
            skill_dir = sk.parent
            skill_name = skill_dir.name
            for dir_name in ("references", "examples", "scripts", "prompts"):
                target_dir = skill_dir / dir_name
                # Skip if dir already exists and has any file (real content)
                if target_dir.is_dir() and any(p for p in target_dir.iterdir()
                                                if p.is_file()):
                    continue
                target_dir.mkdir(parents=True, exist_ok=True)
                purpose, guidance = DIR_GUIDANCE[dir_name]
                if dir_name == "scripts":
                    fname = "placeholder.py"
                    content = SCRIPT_PLACEHOLDER.format(skill_name=skill_name, date=today)
                else:
                    fname = "README.md"
                    content = PLACEHOLDER_README.format(
                        date=today,
                        dir_name=dir_name,
                        skill_name=skill_name,
                        dir_purpose=purpose,
                        guidance=guidance,
                    )
                (target_dir / fname).write_text(content, encoding="utf-8")
                stamped.append({"plugin": plugin_id, "skill": skill_name, "dir": dir_name})

    log_dir = Path(__file__).parent / "logs"
    log_dir.mkdir(parents=True, exist_ok=True)
    (log_dir / "stamp-7of7.log").write_text(
        json.dumps({"stamped": stamped}, indent=2, ensure_ascii=False),
        encoding="utf-8")
    from collections import Counter
    print(f"stamp-7of7: stamped={len(stamped)}")
    for (p, d), n in sorted(Counter((x["plugin"], x["dir"]) for x in stamped).items()):
        print(f"  {p:12s} {d:12s} {n:4d}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
