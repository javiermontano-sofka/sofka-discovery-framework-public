#!/usr/bin/env python3
"""diataxis-purity — advisory check that each doc respects its quadrant.

Diátaxis quadrants have distinct *modes*:
  - tutorials/   : learning — step-by-step, narrative, fictional example
  - how-to/      : goal-oriented — recipe, real problem
  - reference/   : information — dry spec, tables, exhaustive
  - explanation/ : understanding — essay, conceptual, no imperatives

Mixing them weakens both audiences. This validator flags obvious
violations (e.g. reference doc with "In this tutorial you will learn…",
or tutorial with a large reference table).

Always WARN, never ERROR — style guidance, not hard enforcement.
"""
from __future__ import annotations

import re
import sys
from pathlib import Path

from _lib import REPO_ROOT, Finding, print_findings

# Anti-patterns per quadrant
ANTI_PATTERNS = {
    "tutorials": [
        (r"\bsee (?:also|the )?reference\b", "tutorials should teach, not send to reference"),
        (r"^\s*\|.*\|.*\|.*\|.*\|", "tutorials with 4+ column tables usually belong in reference"),
    ],
    "how-to": [
        (r"\blet[' ]?s (?:explore|understand|consider why)\b", "how-to is goal-oriented, not exploratory"),
    ],
    "reference": [
        (r"\bin this tutorial\b", "reference doesn't teach"),
        (r"\bfirst step\b|\blet[' ]?s (?:start|begin)\b", "reference is not a tutorial"),
        (r"\byou will learn\b", "learning outcomes belong in tutorials"),
    ],
    "explanation": [
        (r"\brun:\s*```", "explanation doesn't prescribe execution (that's how-to)"),
        (r"^\s*\d+\.\s+(?:run|execute|install|copy)\b", "imperative steps belong in how-to"),
    ],
}


def quadrant_of(path: Path) -> str | None:
    parts = path.parts
    for q in ("tutorials", "how-to", "reference", "explanation"):
        if f"docs/{q}" in "/".join(parts) or q in parts:
            return q
    return None


def check_file(path: Path) -> list[Finding]:
    findings: list[Finding] = []
    quad = quadrant_of(path)
    if not quad or quad not in ANTI_PATTERNS:
        return findings
    try:
        text = path.read_text(encoding="utf-8")
    except (OSError, UnicodeDecodeError):
        return findings
    in_code = False
    for i, line in enumerate(text.splitlines(), 1):
        if line.lstrip().startswith("```"):
            in_code = not in_code
            continue
        if in_code:
            continue
        for pat, reason in ANTI_PATTERNS[quad]:
            if re.search(pat, line, re.I):
                findings.append(Finding(
                    "WARN", "diataxis-purity", str(path), i,
                    f"[{quad}] {reason} — matched: {line.strip()[:100]}",
                ))
    return findings


def main() -> int:
    findings: list[Finding] = []
    docs_root = REPO_ROOT / "sdf/docs"
    if not docs_root.is_dir():
        print("[diataxis-purity] docs/ directory not yet created (B2 ships it). Skipping.")
        return 0
    for path in docs_root.rglob("*.md"):
        findings.extend(check_file(path))
    return print_findings(findings, "diataxis-purity")


if __name__ == "__main__":
    sys.exit(main())
