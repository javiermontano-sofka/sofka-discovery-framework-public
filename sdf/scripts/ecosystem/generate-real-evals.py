#!/usr/bin/env python3
"""L3: Generate skill-specific grader.md + evals.json for placeholder skills.

This script does the *deterministic* work — content extraction, IO, and YAML
update. The semantic content itself is produced by an LLM; we just provide a
per-skill prompt template and consume the model's structured output.

Workflow per skill:
  1. Read SKILL.md (extract name, description, body summary)
  2. Build a prompt that asks the model to produce
     (a) 5 domain-specific grader assertions (Critical/Quality/AntiPattern)
     (b) 3 realistic eval test cases (happy path, edge case, failure)
  3. The CALLER (a Claude subagent) reads this script's output and supplies
     the JSON for each skill. This script then writes the resulting files.

Operates in 2 modes:
  --list        Print up to N skill paths needing generation (for batch dispatch)
  --apply FILE  Read a JSON file with {skill_path: {grader: "...", evals: {...}}}
                and write the content out (idempotent, idempotency by status flag)
"""
from __future__ import annotations

import argparse
import json
import re
from datetime import datetime
from pathlib import Path

from _fm import ECOSYSTEM_ROOTS, iter_skill_files


def find_placeholder_skills() -> list[Path]:
    out = []
    for plugin_id, root in ECOSYSTEM_ROOTS.items():
        if not root.is_dir():
            continue
        for sk in iter_skill_files(root):
            grader = sk.parent / "agents" / "grader.md"
            evals = sk.parent / "evals" / "evals.json"
            grader_placeholder = grader.is_file() and "status: generated" in grader.read_text()[:400]
            evals_placeholder = False
            if evals.is_file():
                try:
                    d = json.loads(evals.read_text())
                    meta = d.get("_meta", {}) if isinstance(d, dict) else {}
                    evals_placeholder = meta.get("review_required") is True
                except Exception:
                    pass
            if grader_placeholder or evals_placeholder:
                out.append(sk.parent)
    return out


def build_prompt(skill_dir: Path) -> str:
    skill_md = (skill_dir / "SKILL.md").read_text(encoding="utf-8")
    return f"""You are improving the test artifacts (grader.md + evals.json) for a Claude Code skill.

The skill lives at: {skill_dir}

Its SKILL.md contains:
---BEGIN SKILL.md---
{skill_md[:6000]}
---END SKILL.md---

Produce JSON in this exact shape (no preamble, no fences):

{{
  "grader_assertions": {{
    "critical": ["assertion 1 specific to this skill", "assertion 2", "assertion 3"],
    "quality": ["assertion 4", "assertion 5"],
    "antipatterns": ["hard-fail behaviour 1", "hard-fail behaviour 2"]
  }},
  "evals": [
    {{
      "id": 1,
      "name": "happy-path-{{descriptive}}",
      "prompt": "Realistic user prompt that exercises this skill",
      "expected_output": "What good output looks like for this skill",
      "assertions": ["specific assertion 1", "specific assertion 2"]
    }},
    {{
      "id": 2,
      "name": "edge-case-{{descriptive}}",
      "prompt": "Realistic edge case prompt",
      "expected_output": "Expected behaviour at the edge",
      "assertions": ["edge assertion 1", "edge assertion 2"]
    }},
    {{
      "id": 3,
      "name": "failure-{{descriptive}}",
      "prompt": "Prompt that should fail or trigger validation",
      "expected_output": "Expected failure behaviour",
      "assertions": ["failure assertion 1"]
    }}
  ]
}}

Critical rules:
- Replace placeholder text. Be skill-specific, not generic.
- Reference actual concepts from the SKILL.md (modules, processes, file types, etc.).
- Assertions must be objectively verifiable (presence of section, format match, evidence tag pattern, etc.).
- No markdown fences in your output, just raw JSON.
"""


def apply_content(skill_dir: Path, content: dict) -> dict:
    """Write the grader.md + evals.json for a skill from generated JSON."""
    today = datetime.utcnow().strftime("%Y-%m-%d")
    actions = []

    # grader.md
    asserts = content.get("grader_assertions", {})
    grader_path = skill_dir / "agents" / "grader.md"
    grader_path.parent.mkdir(parents=True, exist_ok=True)
    body = f"""---
status: ai-generated
review_required: false
generated_at: {today}
generated_by: sdf-v13.3-semantic-lift
---
# Grader — {skill_dir.name}

> Skill-specific QA grader. Generated from SKILL.md context.

## Critical assertions

"""
    for a in asserts.get("critical", []):
        body += f"- [ ] {a}\n"
    body += "\n## Quality assertions\n\n"
    for a in asserts.get("quality", []):
        body += f"- [ ] {a}\n"
    body += "\n## Anti-patterns (hard fail)\n\n"
    for a in asserts.get("antipatterns", []):
        body += f"- {a}\n"
    body += "\n## Scoring\n\n- All critical pass → 🟢 PASS\n- Some quality miss → 🟡 PARTIAL\n- Any anti-pattern → 🔴 FAIL\n"
    grader_path.write_text(body, encoding="utf-8")
    actions.append("grader.md")

    # evals.json
    evals_payload = {
        "_meta": {
            "status": "ai-generated",
            "review_required": False,
            "generated_at": today,
            "generated_by": "sdf-v13.3-semantic-lift",
        },
        "skill_name": skill_dir.name,
        "description": f"Test cases for {skill_dir.name}.",
        "evals": content.get("evals", []),
    }
    evals_path = skill_dir / "evals" / "evals.json"
    evals_path.parent.mkdir(parents=True, exist_ok=True)
    evals_path.write_text(json.dumps(evals_payload, indent=2, ensure_ascii=False), encoding="utf-8")
    actions.append("evals.json")
    return {"skill": skill_dir.name, "actions": actions}


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--list", type=int, default=None,
                    help="Print up to N placeholder skill paths and exit")
    ap.add_argument("--list-from", type=int, default=0,
                    help="Skip first N when listing (pagination)")
    ap.add_argument("--apply", type=str, default=None,
                    help="JSON file mapping {skill_path: content_dict}")
    ap.add_argument("--prompt-for", type=str, default=None,
                    help="Print the LLM prompt for a single skill_path and exit")
    args = ap.parse_args()

    if args.prompt_for:
        skill_dir = Path(args.prompt_for)
        if not (skill_dir / "SKILL.md").is_file():
            print(f"ERROR: no SKILL.md at {skill_dir}", flush=True)
            return 1
        print(build_prompt(skill_dir))
        return 0

    if args.list is not None:
        skills = find_placeholder_skills()
        for sk in skills[args.list_from:args.list_from + args.list]:
            print(str(sk))
        return 0

    if args.apply:
        content_map = json.loads(Path(args.apply).read_text(encoding="utf-8"))
        log = []
        for skill_path, content in content_map.items():
            log.append(apply_content(Path(skill_path), content))
        log_dir = Path(__file__).parent / "logs"
        log_dir.mkdir(parents=True, exist_ok=True)
        log_file = log_dir / f"l3-applied-{datetime.utcnow().strftime('%H%M%S')}.log"
        log_file.write_text(json.dumps({"applied": log}, indent=2), encoding="utf-8")
        print(f"L3-apply: {len(log)} skills updated → {log_file}")
        return 0

    ap.print_help()
    return 1


if __name__ == "__main__":
    raise SystemExit(main())
