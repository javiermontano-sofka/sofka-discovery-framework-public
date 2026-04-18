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
    # Documentation examples — filename conventions shown as text, not real files
    "SKILL.md", "README.md", "TEMPLATE.md",
    "0017-diataxis-four-quadrants.md", "01-first-discovery.md",
    "9999-tutorial-spanish-register.md",  # tutorial-only throwaway
    "kebab-case.sh",
    # Evidence-tag examples — common filenames clients might have
    "pom.xml", "package.json", "settings.py", "application.properties",
    ".env.prod", "k8s/deploy.yaml", "k8s/payments.yaml",
    "src/auth/login.py", "src/core/pipeline.py", "src/core/retry.py",
    "src/core/throttle.py",
    "transactions.xlsx", "ztransactions.csv", "master-agreement.pdf",
    "arch-spec.pdf", "etl-spec.pdf", "contracts.pdf",
    "process-map.docx",
    # B11 generator (ships later in this cycle)
    "scripts/ecosystem/generate-reference-pages.py",
    # Deliverable naming examples in prose
    "03_ASIS_Bancoomeva_{WIP}.md", "06_Roadmap_Bancoomeva_{Aprobado}.md",
    "08_Pitch_Bancoomeva_{WIP}.pptx",
    # Eval harness runtime artefacts
    "grading.json", "timing.json", "benchmark.md", "benchmark.json",
    # Manifestly-gitignored runtime + antipattern examples
    ".discovery/repo-index.json", "sdf/.discovery/ghost-menu.md",
    ".discovery/ghost-menu.md",
    "misc.md",  # explicitly named as an anti-pattern in filesystem-as-architecture
    # Path patterns used as examples in essays (not real files)
    "docs/how-to/render-html.md",
    "sdf/skills/brand-html-render/SKILL.md",  # brand-html-render lives in sap-enterprise-plugin/
    # Hypothetical future ADR numbering in README supersede example
    "0026-xxx.md",
    # Site-generator example config (no site generator adopted)
    "mkdocs.yml",
    # SAP-specific files tracked as known-missing; SAP cycle is deferred (ADR-0024)
    "sap-enterprise-plugin/scripts/nlm-install.sh",
    "sap-enterprise-plugin/CONTRIBUTING.md",
    # Path patterns referring to "inside any skill" generically
    "grader.md", "agents/grader.md", "evals/evals.json",
    # Historical CHANGELOG entries for files that were later relocated
    "markdown-excellence.md", "template-catalog.md",
    "references/full-specification.md",
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
    "sdf/docs/adr/",
    "sdf/docs/explanation/",
    "sdf/docs/how-to/",
    "sdf/docs/reference/",
    "sdf/docs/tutorials/",
    "sdf/docs/diagrams/",
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
    if not t or t.startswith(("http://", "https://", "mailto:", "#", "${", "<", "$", "@", "~")):
        return False
    if " " in t or "\t" in t or "," in t:
        return False  # prose with multiple tokens
    if "<" in t or ">" in t:
        return False  # template placeholders like `skills/<name>/SKILL.md`
    # Placeholder patterns: NNNN (4 Ns), `<anything>`, path-templates with all-caps
    if re.search(r"\bNNNN\b|\bMMMM\b|<[^>]+>", t):
        return False
    # Extension-list prose: `.csv/.xlsx/.docx/...` — multiple leading-dot segments
    if re.match(r"^(\.[a-z0-9]+/){2,}", t.lower()):
        return False
    # Bare extension alone is not a real path reference
    if t in {".md", ".py", ".sh", ".json", ".yaml", ".yml", ".html",
             ".csv", ".xlsx", ".docx", ".pdf", ".pptx", ".xml", ".tsx",
             ".ts", ".js", ".sql", ".abap", ".txt", ".log"}:
        return False
    # Runtime priming-rag artefacts live in gitignored .discovery/
    if t.startswith("priming-rag-") or re.match(r".*priming-rag-[a-z0-9-]+\.md$", t.lower()):
        return False
    # RAG example output filenames (documented but not committed as real files)
    if "_extracto.md" in t:
        return False
    if t in ALLOW_MISSING:
        return False
    # If basename is a template like `NNNN-slug.md` (no dots in slug), skip
    base = t.split("/")[-1]
    if re.match(r"^[A-Z]{2,}", base.split(".")[0]) and "-" in base:
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
