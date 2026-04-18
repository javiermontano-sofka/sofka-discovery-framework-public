#!/usr/bin/env python3
"""acronym-gate — every ALL-CAPS token in an elevated doc must have a
GLOSSARY entry or be whitelisted in `_manifest.yaml`.

Antifragile property: as new concepts are introduced (a new tag, a new
methodology), the first time they appear in a doc the validator fails,
forcing the author to add a glossary entry before merge.

Severity: WARN initially (advisory), to avoid CI blockage during B1 when
GLOSSARY.md doesn't exist yet. After B1 ships we'll flip to ERROR.
"""
from __future__ import annotations

import re
import sys
from pathlib import Path

from _lib import REPO_ROOT, Finding, elevated_docs, load_manifest, print_findings

ACRONYM_RE = re.compile(r"(?<![#$\w])\b[A-ZÁÉÍÓÚÑ][A-ZÁÉÍÓÚÑ0-9]{1,}(?:-[A-ZÁÉÍÓÚÑ0-9]+)?\b(?![\w`])")

# Trivial skip list — not acronyms; particles, code-block labels, headings, hex fragments.
TRIVIAL_SKIP = {
    # Spanish particles / common words
    "DE", "LA", "EL", "LOS", "LAS", "EN", "CON", "POR", "PARA", "A", "O", "Y",
    "DEL", "AL", "QUE", "ES", "SON", "UN", "UNA", "NO", "SI",
    # English particles / frequent words
    "OR", "NOT", "AND", "AS", "THE", "AT", "BY", "OF", "TO", "IS", "BE",
    "FOR", "ON", "IN", "IF", "IT", "AN", "WE", "US", "DO",
    # YAML / code block labels
    "YAML", "JSON", "TBD", "TODO", "FIXME", "NOTE", "XXX",
    # Section-header fragments common in Spanish
    "METADATA", "RAZONAMIENTO", "NAME", "TEXT", "TITLE", "STATUS", "BODY",
    "CONTEXT", "DECISION", "CONSEQUENCES", "FASE",
    # Hex colour numeric parts (#FF7E08 → FF7E08 if # stripped by word boundary)
    "FFD700", "FF7E08", "EFEAE4", "FF9E42",
    # Currency / metrics notations
    "FTE", "COP", "USD", "EUR", "GBP",
    # Brand / framework names already known
    "CLAUDE", "ANTHROPIC", "GITHUB", "SOFKA",
}


def glossary_terms() -> set[str]:
    terms: set[str] = set()
    for p in (REPO_ROOT / "GLOSSARY.md", REPO_ROOT / "sdf/GLOSSARY.md"):
        if p.is_file():
            for line in p.read_text(encoding="utf-8").splitlines():
                # match "- **TERM** — ..." or "## TERM"
                m = re.match(r"^[-*]?\s*\*\*?([A-ZÁÉÍÓÚÑ][A-ZÁÉÍÓÚÑ0-9/-]+)\*\*?", line)
                if m:
                    terms.add(m.group(1))
                m = re.match(r"^#+\s+([A-ZÁÉÍÓÚÑ][A-ZÁÉÍÓÚÑ0-9/-]+)\b", line)
                if m:
                    terms.add(m.group(1))
    return terms


def main() -> int:
    manifest = load_manifest()
    whitelist = set(manifest.get("acronym_whitelist", []))
    glossary = glossary_terms()
    known = whitelist | glossary
    findings: list[Finding] = []

    for doc in elevated_docs(manifest):
        text = doc.read_text(encoding="utf-8", errors="replace")
        # Skip code fences
        in_code = False
        seen_in_doc: set[str] = set()
        for i, line in enumerate(text.splitlines(), 1):
            if line.lstrip().startswith("```"):
                in_code = not in_code
                continue
            if in_code:
                continue
            for m in ACRONYM_RE.finditer(line):
                tok = m.group(0)
                if len(tok) < 2 or tok.isdigit():
                    continue
                if tok in known or tok in seen_in_doc or tok in TRIVIAL_SKIP:
                    continue
                # Skip numeric-suffixed tokens (M1, G1, V13, C4, etc.)
                if re.match(r"^[A-Z][0-9]+(\.[0-9]+)?$", tok):
                    continue
                seen_in_doc.add(tok)
                findings.append(Finding(
                    "WARN", "acronym-gate", str(doc), i,
                    f"acronym '{tok}' not in GLOSSARY or whitelist. Add to sdf/GLOSSARY.md or acronym_whitelist.",
                ))

    return print_findings(findings, "acronym-gate")


if __name__ == "__main__":
    sys.exit(main())
