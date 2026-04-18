#!/usr/bin/env python3
"""adr-integrity — accepted ADRs are append-only.

Rules:
- Filenames follow `NNNN-slug.md` pattern (4 digits, kebab-case slug).
- Each ADR has required fields: Title, Status, Context, Decision, Consequences.
- Status is one of: Proposed, Accepted, Deprecated, Superseded.
- Once Status=Accepted, the file body MUST NOT be edited (only status can be
  changed to Deprecated or Superseded, with a `Superseded by: NNNN-...` line).
- No duplicate ADR numbers.

Antifragile property: decisions accumulate as first-class, immutable artifacts
with provenance. A superseded ADR remains visible — the history never loses
the original rationale.
"""
from __future__ import annotations

import re
import subprocess
import sys
from pathlib import Path

from _lib import REPO_ROOT, Finding, load_manifest, print_findings


FILENAME_RE = re.compile(r"^\d{4}-[a-z0-9-]+\.md$")


def scan_adrs() -> list[Finding]:
    manifest = load_manifest()
    adr_cfg = manifest.get("adr", {})
    adr_dir = REPO_ROOT / adr_cfg.get("path", "sdf/docs/adr")
    findings: list[Finding] = []

    if not adr_dir.is_dir():
        # Not yet created (B3 ships them). Advisory.
        findings.append(Finding(
            "INFO", "adr-integrity", str(adr_dir), None,
            "ADR directory not yet created (will be produced by B3).",
        ))
        return findings

    valid_statuses = set(adr_cfg.get("valid_statuses", []))
    required = set(adr_cfg.get("require_fields", []))
    seen_numbers: dict[str, Path] = {}

    for adr in sorted(adr_dir.glob("*.md")):
        if adr.name in ("README.md", "TEMPLATE.md"):
            continue
        # 1. Filename convention
        if not FILENAME_RE.match(adr.name):
            findings.append(Finding(
                "ERROR", "adr-integrity", str(adr), None,
                f"filename '{adr.name}' doesn't match NNNN-slug.md pattern",
            ))
            continue
        num = adr.name[:4]
        if num in seen_numbers:
            findings.append(Finding(
                "ERROR", "adr-integrity", str(adr), None,
                f"duplicate ADR number {num}; also in {seen_numbers[num].name}",
            ))
        seen_numbers[num] = adr

        # 2. Required fields. Accept any of these forms per field:
        #      "# Field ..."  (heading — used for Title as "# ADR-NNNN: ...")
        #      "**Field**: ..."
        #      "- **Field**: ..." (list-item with bold label, common in our ADRs)
        #      "Field: ..."
        text = adr.read_text(encoding="utf-8")
        def field_present(label: str) -> bool:
            # Title is satisfied by any h1 heading at the top of the file
            # (common ADR convention: `# ADR-0001: <title text>`).
            if label.lower() == "title":
                return bool(re.search(r"^#\s+\S", text, re.M))
            patterns = [
                rf"^#{{1,6}}\s+{re.escape(label)}\b",                  # heading: ## Context, ### Decision
                rf"^\s*[-*]?\s*\*\*{re.escape(label)}\*\*\s*:",        # (list-item) **Label**:
                rf"^\s*{re.escape(label)}\s*:",                         # bare Label:
            ]
            return any(re.search(p, text, re.M | re.I) for p in patterns)
        missing = [f for f in required if not field_present(f)]
        if missing:
            findings.append(Finding(
                "ERROR", "adr-integrity", str(adr), None,
                f"missing required fields: {', '.join(missing)}",
            ))

        # 3. Status value. Tolerate list-item prefix and case variants.
        m = (re.search(r"^\s*[-*]?\s*\*\*Status\*\*\s*:\s*([A-Za-z-]+)", text, re.M)
             or re.search(r"^\s*Status\s*:\s*([A-Za-z-]+)", text, re.M))
        if m:
            status_raw = m.group(1)
            # Normalize: "accepted" matches "Accepted" regardless of case;
            # "superseded-by" counts as "Superseded" family.
            status_norm = status_raw.lower().rstrip("-_")
            valid_norm = {v.lower() for v in valid_statuses}
            # Allow "superseded-by" prefix variant
            is_valid = status_norm in valid_norm or status_norm.startswith("superseded")
            if not is_valid:
                findings.append(Finding(
                    "ERROR", "adr-integrity", str(adr), None,
                    f"invalid status '{status_raw}'. Must be one of: {', '.join(sorted(valid_statuses))}",
                ))
            # 4. Immutability check (git log): accepted ADRs shouldn't be modified
            if status_norm == "accepted":
                # Count commits touching this file
                try:
                    res = subprocess.run(
                        ["git", "log", "--oneline", "--", str(adr.relative_to(REPO_ROOT))],
                        cwd=REPO_ROOT, capture_output=True, text=True, check=True,
                    )
                    commits = [l for l in res.stdout.splitlines() if l.strip()]
                    if len(commits) > 1:
                        findings.append(Finding(
                            "WARN", "adr-integrity", str(adr), None,
                            f"Accepted ADR has {len(commits)} commits; expected 1 (immutable). "
                            "If you really need to change an accepted ADR, supersede it with a new one.",
                        ))
                except subprocess.CalledProcessError:
                    pass  # new file, not yet in git
        else:
            findings.append(Finding(
                "ERROR", "adr-integrity", str(adr), None,
                "no Status: field found",
            ))

    return findings


def main() -> int:
    return print_findings(scan_adrs(), "adr-integrity")


if __name__ == "__main__":
    sys.exit(main())
