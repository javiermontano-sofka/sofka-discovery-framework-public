#!/usr/bin/env python3
"""cross-refs — every file path cited in any doc must exist on disk.

Scans backtick-quoted paths and markdown links; if a path looks local
(no scheme, contains a `/` or known extension), asserts it resolves.

Antifragile property: renaming or deleting a file immediately surfaces
every document that still cites it.
"""
from __future__ import annotations

import re
import sys
from pathlib import Path

from _lib import REPO_ROOT, Finding, all_doc_files, print_findings

# Tokens that look like files
TOKEN_RE = re.compile(r"`([^`\n]+?)`")
# Markdown link: [label](path)
LINK_RE = re.compile(r"\[(?P<label>[^\]]+)\]\((?P<target>[^)\s#]+)(#[^)]*)?\)")
# Extensions we treat as local file references
FILE_EXTS = {
    ".md", ".sh", ".py", ".json", ".yaml", ".yml", ".html",
    ".txt", ".log", ".toml", ".csv", ".xlsx", ".docx", ".pdf",
    ".pptx", ".xml", ".mmd", ".tsx", ".ts", ".js", ".sql", ".abap",
}

# Paths allowed to not-exist (external examples, placeholders, runtime artifacts)
ALLOW_MISSING = {
    # Generic placeholders in command examples
    "file.ext", "file.xlsx", "file.pdf", "file.sql",
    "file1.xlsx", "file2.pdf", "file3.sql",
    "demo.md", "sample.md", "sample.csv", "sample.xlsx",
    "in.md", "out.html", ".env",
    ".claude.local.md",
    # Session-automation runtime artifacts created by hooks, not committed files
    "SESSION-README.md", "SESSION-CLAUDE.md", "calibration-digest.md",
    "ghost-menu.md", "session-changelog.md", "session-state.json", "repo-index.json",
    ".needs-priming",
    # Generator/render output placeholders in examples
    "path/to/in.md", "path/to/out.html", "path/to/fixture.csv",
    "<input.md>", "<output.html>", "<file.md>", "<name>",
    "entregable.md", "entregable.html",
    # Client-example deliverables
    "contract.pdf", "readiness-check.xlsx", "budget.xlsx", "customers.csv",
    "stakeholders.csv", "scope.pdf", "kickoff.pptx", "spec.docx",
    "landing.html",  # (exists in sdf/, might not in sap/ at same name)
    # Generic CLI example token that looks like a path
    "last.md", "last-md",
    # RETROSPECTIVA SAP fragments (decorative lists, not real paths)
    "sap-enterprise-sdk-app", "sdf-agent-sdk",
    # Upstream skill-creator plugin paths (not in this repo)
    "eval-viewer/generate_review.py",
}

# Extra search roots a bare filename could live under
SEARCH_ROOTS = [
    "",
    "sdf/",
    "sdf/scripts/",
    "sdf/scripts/ecosystem/",
    "sdf/scripts/tests/",
    "sdf/scripts/validators/",
    "sdf/commands/",
    "sdf/agents/",
    "sdf/references/",
    "sdf/references/ontology/",
    "sdf/templates/",
    "sdf/.claude-plugin/",
    "sdf/hooks/",
    "sdf/docs/",
    "sap-enterprise-plugin/",
    "sap-enterprise-plugin/scripts/",
    "sap-enterprise-plugin/references/ontology/",
    "sap-enterprise-plugin/.claude-plugin/",
    ".github/",
    ".github/workflows/",
]


def is_file_ref(token: str) -> bool:
    """Decide if a token looks like a real file path we should check.

    Conservative filter:
      * must end with a known file extension
      * must not contain whitespace (prose like `.py .ts .tsx`)
      * must not start with http/mailto/template placeholders
    Trade-off: lower recall, zero false positives on prose.
    """
    t = token.strip().rstrip(".,;:)")
    # Strip leading "./" but NOT leading "." (which would break .mcp.json)
    if t.startswith("./"):
        t = t[2:]
    if not t or t.startswith(("http://", "https://", "mailto:", "#", "${", "<", "$", "@")):
        return False
    if " " in t or "\t" in t or "," in t:
        return False  # prose with multiple tokens
    if t in ALLOW_MISSING:
        return False
    return any(t.lower().endswith(e) for e in FILE_EXTS)


def resolve(token: str, doc: Path) -> Path | None:
    """Try to resolve `token` as a real path.

    Strategy (in order): doc-relative → repo-root → common search roots.
    """
    t = token.strip().rstrip(".,;:)")
    if t.startswith("./"):
        t = t[2:]
    t = t.lstrip("*-").strip()
    if not t:
        return None

    c = (doc.parent / t).resolve()
    if c.exists():
        return c
    c = (REPO_ROOT / t).resolve()
    if c.exists():
        return c
    for root in SEARCH_ROOTS:
        c = (REPO_ROOT / root / t).resolve()
        if c.exists():
            return c
    return None


def scan_doc(doc: Path) -> list[Finding]:
    findings: list[Finding] = []
    text = doc.read_text(encoding="utf-8", errors="replace")

    for i, line in enumerate(text.splitlines(), 1):
        # backticked tokens
        for m in TOKEN_RE.finditer(line):
            token = m.group(1)
            # filter out regex-y tokens, wildcards, template placeholders
            if any(c in token for c in "*?{}$"):
                continue
            if not is_file_ref(token):
                continue
            if resolve(token, doc) is None:
                findings.append(Finding(
                    "ERROR", "cross-refs", str(doc), i,
                    f"broken reference `{token}` — not found relative to {doc.parent.name}/ or repo root",
                ))
        # markdown links
        for m in LINK_RE.finditer(line):
            target = m.group("target")
            if not is_file_ref(target):
                continue
            if resolve(target, doc) is None:
                findings.append(Finding(
                    "ERROR", "cross-refs", str(doc), i,
                    f"broken link [{m.group('label')}]({target})",
                ))
    return findings


def main() -> int:
    findings: list[Finding] = []
    for doc in all_doc_files():
        findings.extend(scan_doc(doc))
    return print_findings(findings, "cross-refs")


if __name__ == "__main__":
    sys.exit(main())
