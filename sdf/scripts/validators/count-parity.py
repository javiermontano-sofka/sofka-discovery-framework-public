#!/usr/bin/env python3
"""count-parity — every numeric claim in elevated docs must match filesystem.

Reads `_manifest.yaml` entries under `counts:`, greps each `patterns[]` in
every elevated doc, and asserts the matched number equals the measured or
expected value.

Antifragile property: when the filesystem changes (skill added, agent added),
this validator fails until the docs are updated. Drift cannot accumulate.
"""
from __future__ import annotations

import re
import sys

from _lib import Finding, elevated_docs, grep_pattern_in_file, load_manifest, print_findings, run_measure


def main() -> int:
    manifest = load_manifest()
    findings: list[Finding] = []

    for key, spec in (manifest.get("counts") or {}).items():
        # Determine expected value: measured or static
        if spec.get("static"):
            expected = int(spec["expected"])
        else:
            measured = run_measure(spec["measure"])
            expected = int(spec.get("expected", measured))
            if measured != expected:
                # Filesystem drift — the manifest itself is stale.
                findings.append(Finding(
                    "ERROR", "count-parity", str(manifest_path_str()),
                    None,
                    f"manifest.counts.{key}: expected={expected} but filesystem says {measured}. "
                    f"Update the manifest or reconcile the filesystem.",
                ))
                continue

        for pat in spec["patterns"]:
            rx = re.compile(pat)
            for doc in elevated_docs(manifest):
                hits = grep_pattern_in_file(doc, pat)
                for line_no, line in hits:
                    # Extract the number from the matched text
                    numbers = re.findall(r"\b\d+\b", rx.search(line).group(0))
                    if not numbers:
                        continue
                    cited = int(numbers[0])
                    if cited != expected:
                        findings.append(Finding(
                            "ERROR", "count-parity",
                            str(doc.relative_to(doc.anchor)) if False else str(doc),
                            line_no,
                            f"cites {cited} for {key} but filesystem says {expected}. "
                            f"Matched: {line.strip()[:100]}",
                        ))

    return print_findings(findings, "count-parity")


def manifest_path_str():
    from _lib import MANIFEST_PATH
    return MANIFEST_PATH.relative_to(MANIFEST_PATH.parents[3])


if __name__ == "__main__":
    sys.exit(main())
