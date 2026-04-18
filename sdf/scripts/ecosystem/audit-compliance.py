#!/usr/bin/env python3
"""V1: Audit semantic compliance — count placeholders vs real content.

Distinguishes:
  - Stamped/placeholder grader.md  (status: generated, review_required)
  - AI-generated grader.md         (status: ai-generated)
  - Human-reviewed grader.md       (status: human-reviewed or no status frontmatter)
  - Same for evals/evals.json

Also surfaces:
  - Placeholder README.md count in references/examples/scripts/prompts
  - Extractor test coverage (any test_*.py for each extractor?)
  - Functional test count
"""
from __future__ import annotations

import json
import re
from pathlib import Path

from _fm import ECOSYSTEM_ROOTS, iter_skill_files


def grader_status(path: Path) -> str:
    if not path.is_file():
        return "missing"
    text = path.read_text(encoding="utf-8")
    head = text[:600]
    if "status: human-reviewed" in head:
        return "human-reviewed"
    if "status: ai-generated" in head:
        return "ai-generated"
    if "status: generated" in head and "review_required: true" in head:
        return "placeholder"
    return "real"  # has no status marker = pre-existing real content


def evals_status(path: Path) -> str:
    if not path.is_file():
        return "missing"
    try:
        data = json.loads(path.read_text(encoding="utf-8"))
    except Exception:
        return "invalid-json"
    meta = data.get("_meta", {}) if isinstance(data, dict) else {}
    if meta.get("review_required") is True and meta.get("status") == "generated":
        return "placeholder"
    if meta.get("status") == "ai-generated":
        return "ai-generated"
    if meta.get("status") == "human-reviewed":
        return "human-reviewed"
    return "real"


def readme_is_placeholder(path: Path) -> bool:
    if not path.is_file():
        return False
    head = path.read_text(encoding="utf-8")[:400]
    return ("generated_by: sdf-v13.1-quality-lift" in head
            or "generated_by: sdf-v13.2-quality-lift" in head)


def main() -> int:
    counts = {
        "skills_total": 0,
        "graders": {"placeholder": 0, "ai-generated": 0, "human-reviewed": 0, "real": 0, "missing": 0},
        "evals": {"placeholder": 0, "ai-generated": 0, "human-reviewed": 0, "real": 0, "missing": 0, "invalid-json": 0},
        "readmes_placeholder": {"references": 0, "examples": 0, "scripts": 0, "prompts": 0},
    }

    for plugin_id, root in ECOSYSTEM_ROOTS.items():
        if not root.is_dir():
            continue
        for sk in iter_skill_files(root):
            counts["skills_total"] += 1
            sk_dir = sk.parent
            counts["graders"][grader_status(sk_dir / "agents" / "grader.md")] += 1
            counts["evals"][evals_status(sk_dir / "evals" / "evals.json")] += 1
            for sub in ("references", "examples", "scripts", "prompts"):
                # check both README.md and placeholder.py
                for fname in ("README.md", "placeholder.py"):
                    if readme_is_placeholder(sk_dir / sub / fname):
                        counts["readmes_placeholder"][sub] += 1
                        break

    # Functional test count
    sdf_root = ECOSYSTEM_ROOTS["sdf-core"]
    test_files = list((sdf_root / "scripts" / "tests").rglob("test_*.py")) if (sdf_root / "scripts" / "tests").is_dir() else []
    counts["functional_tests"] = len(test_files)

    # Pretty print
    n = counts["skills_total"]
    print(f"=== SDF Ecosystem Compliance Audit ===")
    print(f"Total skills: {n}")
    print()
    print(f"GRADERS ({sum(counts['graders'].values())}):")
    for k, v in counts["graders"].items():
        print(f"  {k:18s} {v:5d}  ({100*v/n:5.1f}%)")
    print()
    print(f"EVALS ({sum(counts['evals'].values())}):")
    for k, v in counts["evals"].items():
        print(f"  {k:18s} {v:5d}  ({100*v/n:5.1f}%)")
    print()
    print(f"PLACEHOLDER README/scripts:")
    for k, v in counts["readmes_placeholder"].items():
        print(f"  {k:18s} {v:5d}  ({100*v/n:5.1f}%)")
    print()
    print(f"FUNCTIONAL TESTS: {counts['functional_tests']}")

    log_dir = Path(__file__).parent / "logs"
    log_dir.mkdir(parents=True, exist_ok=True)
    (log_dir / "audit-compliance.log").write_text(
        json.dumps(counts, indent=2), encoding="utf-8")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
