#!/usr/bin/env python3
"""A2: Reconcile frontmatter `name:` with the filename stem.

Strategy: strip known plugin prefixes from `name:` when the stripped form
matches the filename. Legitimate prefixes (where the filename ITSELF starts
with the prefix) stay untouched.

Prefix list is conservative to avoid mangling real compound names like
`apex-pmbok-specialist` when that IS the filename.
"""
from __future__ import annotations

import json
import re
from pathlib import Path

from _fm import ECOSYSTEM_ROOTS, Frontmatter, iter_agent_files

# Prefixes to try stripping when they cause name ≠ stem
STRIP_PREFIXES = ("sofka-", "mao-", "metodologia-", "apex-", "sdf-", "pm-", "scriba-", "playbook-")


def main() -> int:
    changed: list[dict] = []
    skipped: list[dict] = []

    for plugin_id, root in ECOSYSTEM_ROOTS.items():
        if not root.is_dir():
            continue
        for p in iter_agent_files(root):
            t = p.read_text(encoding="utf-8")
            fm = Frontmatter.parse(t)
            if fm is None:
                continue
            name = fm.get("name")
            if name is None:
                continue
            name = name.strip().strip('"').strip("'")
            stem = p.stem
            if name == stem:
                continue
            # Skip when filename itself starts with the prefix (legitimate)
            if any(stem.startswith(pref) for pref in STRIP_PREFIXES):
                skipped.append({"file": str(p), "name": name, "stem": stem, "reason": "filename has prefix"})
                continue
            # Try stripping each prefix
            fixed = False
            for pref in STRIP_PREFIXES:
                if name.startswith(pref) and name[len(pref):] == stem:
                    fm.set("name", stem)
                    p.write_text(fm.serialize(), encoding="utf-8")
                    changed.append({
                        "plugin": plugin_id,
                        "file": str(p.relative_to(root)),
                        "from": name,
                        "to": stem,
                        "stripped": pref,
                    })
                    fixed = True
                    break
            if not fixed:
                skipped.append({"file": str(p.relative_to(root)), "name": name, "stem": stem, "reason": "no prefix match"})

    log_dir = Path(__file__).parent / "logs"
    log_dir.mkdir(parents=True, exist_ok=True)
    (log_dir / "a2-names.log").write_text(
        json.dumps({"changed": changed, "skipped": skipped}, indent=2, ensure_ascii=False),
        encoding="utf-8",
    )
    print(f"A2: changed={len(changed)} skipped={len(skipped)}")
    # Per-plugin summary
    from collections import Counter
    c = Counter(x["plugin"] for x in changed)
    for p, n in c.most_common():
        print(f"  {p}: {n}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
