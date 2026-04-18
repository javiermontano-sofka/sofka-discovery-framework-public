"""Shared helpers for the docs-quality validators.

Antifragile design: each validator is tiny (< 150 lines), composable, and
uses this library rather than duplicating utility code. Adding a new
validator means adding one file here + one entry in `_manifest.yaml`.
"""
from __future__ import annotations

import re
import subprocess
from dataclasses import dataclass
from pathlib import Path

import yaml

REPO_ROOT = Path(__file__).resolve().parents[3]  # sap-discovery-plugin-WIP/
SDF_ROOT = REPO_ROOT / "sdf"
MANIFEST_PATH = SDF_ROOT / "scripts/validators/_manifest.yaml"


@dataclass
class Finding:
    severity: str           # "ERROR" | "WARN" | "INFO"
    validator: str
    file: str
    line: int | None
    message: str

    def format(self) -> str:
        loc = f"{self.file}:{self.line}" if self.line else self.file
        return f"[{self.severity}] {self.validator}: {loc}: {self.message}"


def load_manifest() -> dict:
    return yaml.safe_load(MANIFEST_PATH.read_text(encoding="utf-8"))


def elevated_docs(manifest: dict | None = None) -> list[Path]:
    m = manifest or load_manifest()
    return [REPO_ROOT / p for p in m.get("elevated_docs", []) if (REPO_ROOT / p).is_file()]


def all_doc_files() -> list[Path]:
    """Curated set of documentation files the validators enforce on.

    Does NOT include every SKILL.md, every agent .md, every command .md —
    those are plugin internals with their own audits. These validators
    focus on the *documentation layer*: elevated docs, the `docs/` tree,
    governance files, CHANGELOG, ontology, and LICENSE notices.

    Rationale: cross-ref / link-check on 1,100 SKILL.md files produces
    thousands of false positives (generic template placeholders like
    `assets/output-template.md` or `path/to/fixture.csv`). Those files
    are covered by `validate_yaml.py` and `audit-compliance.py` already.
    """
    paths: list[Path] = []

    for name in ("README.md", "CLAUDE.md", "CONTRIBUTING.md", "SECURITY.md", "GLOSSARY.md"):
        p = REPO_ROOT / name
        if p.is_file():
            paths.append(p)

    for plugin in ("sdf", "sap-enterprise-plugin"):
        for name in ("README.md", "CLAUDE.md", "CONTRIBUTING.md", "SECURITY.md", "GLOSSARY.md", "CHANGELOG.md"):
            p = REPO_ROOT / plugin / name
            if p.is_file():
                paths.append(p)
        docs = REPO_ROOT / plugin / "docs"
        if docs.is_dir():
            paths.extend(docs.rglob("*.md"))
        ontology = REPO_ROOT / plugin / "references" / "ontology"
        if ontology.is_dir():
            paths.extend(ontology.glob("*.md"))

    for p in REPO_ROOT.glob("RETROSPECTIVA-*.md"):
        paths.append(p)

    # Deduplicate (preserve order)
    seen = set()
    deduped = []
    for p in paths:
        if p not in seen:
            seen.add(p)
            deduped.append(p)
    return deduped


def run_measure(cmd: str) -> int:
    """Run a shell measurement command and return the integer output."""
    res = subprocess.run(["bash", "-c", cmd], cwd=REPO_ROOT, capture_output=True, text=True, check=False)
    try:
        return int(res.stdout.strip().split()[0])
    except (ValueError, IndexError):
        return -1


def grep_pattern_in_file(path: Path, pattern: str) -> list[tuple[int, str]]:
    """Return [(line_number, line)] for each line matching the regex pattern."""
    try:
        text = path.read_text(encoding="utf-8")
    except (OSError, UnicodeDecodeError):
        return []
    out = []
    rx = re.compile(pattern)
    for i, line in enumerate(text.splitlines(), 1):
        if rx.search(line):
            out.append((i, line))
    return out


def print_findings(findings: list[Finding], tag: str) -> int:
    """Print findings, return exit code (0 if no ERROR)."""
    errors = [f for f in findings if f.severity == "ERROR"]
    warns = [f for f in findings if f.severity == "WARN"]
    for f in findings:
        print(f.format())
    print(f"\n[{tag}] errors={len(errors)} warns={len(warns)} info={len(findings) - len(errors) - len(warns)}")
    return 0 if not errors else 1
