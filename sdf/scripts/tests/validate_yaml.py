#!/usr/bin/env python3
"""CI-friendly YAML validator: every SKILL.md and agent .md must parse."""
from __future__ import annotations

import re
import sys
from pathlib import Path

import yaml

ROOT = Path(__file__).resolve().parent.parent.parent  # plugin root
FM_RE = re.compile(r"\A---\s*\n(.*?)\n---\s*\n", re.S)


def validate_file(path: Path) -> tuple[bool, str]:
    text = path.read_text(encoding="utf-8", errors="replace")
    m = FM_RE.match(text)
    if not m:
        return True, ""  # no frontmatter, skip
    try:
        yaml.safe_load(m.group(1))
        return True, ""
    except Exception as e:
        return False, str(e)[:200]


def main() -> int:
    bad = 0
    total = 0
    for sk in ROOT.rglob("SKILL.md"):
        if "/scripts/.venv/" in str(sk) or "/__pycache__/" in str(sk):
            continue
        total += 1
        ok, err = validate_file(sk)
        if not ok:
            bad += 1
            print(f"BAD: {sk.relative_to(ROOT)}: {err}", file=sys.stderr)
    for ag in ROOT.rglob("agents/*.md"):
        if "/scripts/.venv/" in str(ag) or ag.name.startswith("_"):
            continue
        total += 1
        ok, err = validate_file(ag)
        if not ok:
            bad += 1
            print(f"BAD: {ag.relative_to(ROOT)}: {err}", file=sys.stderr)
    print(f"YAML validation: {total - bad}/{total} OK ({bad} failures)")
    return 1 if bad else 0


if __name__ == "__main__":
    raise SystemExit(main())
