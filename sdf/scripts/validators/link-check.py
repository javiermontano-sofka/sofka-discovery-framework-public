#!/usr/bin/env python3
"""link-check — every internal markdown link resolves.

Scans `[label](path)` markdown links across all docs. For links with a
leading `#`, checks anchor exists in target file. For relative paths,
checks file exists.

Ignores HTTP(S) URLs (handled by dead-link checkers like lychee in a
separate CI job if needed; keeping this validator offline-safe).
"""
from __future__ import annotations

import re
import sys
from pathlib import Path

from _lib import REPO_ROOT, Finding, all_doc_files, print_findings

LINK_RE = re.compile(r"\[(?P<label>[^\]]+)\]\((?P<target>[^)\s]+)\)")


def anchor_slug(heading: str) -> str:
    """GitHub-flavoured anchor slug for a heading."""
    s = heading.lower()
    s = re.sub(r"[^\w\s-]", "", s)
    s = re.sub(r"\s+", "-", s.strip())
    return s


def file_anchors(path: Path) -> set[str]:
    """Extract all heading anchors from a markdown file."""
    try:
        text = path.read_text(encoding="utf-8")
    except (OSError, UnicodeDecodeError):
        return set()
    anchors = set()
    in_code = False
    for line in text.splitlines():
        if line.lstrip().startswith("```"):
            in_code = not in_code
            continue
        if in_code:
            continue
        m = re.match(r"^#+\s+(.+?)\s*$", line)
        if m:
            anchors.add(anchor_slug(m.group(1)))
    return anchors


def check_doc(doc: Path) -> list[Finding]:
    findings: list[Finding] = []
    text = doc.read_text(encoding="utf-8", errors="replace")

    for i, line in enumerate(text.splitlines(), 1):
        for m in LINK_RE.finditer(line):
            target = m.group("target").strip()
            if not target or target.startswith(("http://", "https://", "mailto:", "ftp://")):
                continue
            # Split path#anchor
            if "#" in target:
                path_part, anchor = target.split("#", 1)
            else:
                path_part, anchor = target, None

            # Resolve file path
            if path_part:
                candidates = [
                    (doc.parent / path_part).resolve(),
                    (REPO_ROOT / path_part).resolve(),
                ]
                resolved = next((c for c in candidates if c.exists()), None)
                if resolved is None:
                    findings.append(Finding(
                        "ERROR", "link-check", str(doc), i,
                        f"broken link [{m.group('label')}]({target}) — target file not found",
                    ))
                    continue
                target_file = resolved
            else:
                # Same-doc anchor
                target_file = doc

            # Check anchor if present
            if anchor and anchor not in file_anchors(target_file):
                findings.append(Finding(
                    "WARN", "link-check", str(doc), i,
                    f"anchor #{anchor} not found in {target_file.name}",
                ))
    return findings


def main() -> int:
    findings: list[Finding] = []
    for doc in all_doc_files():
        findings.extend(check_doc(doc))
    return print_findings(findings, "link-check")


if __name__ == "__main__":
    sys.exit(main())
