#!/usr/bin/env python3
"""A4: Cosmetic polish of agent descriptions after the prior normalization run.

Fixes awkward patterns like:
  "Use this subagent when the user needs a senior backend developer — server-side..."
→ "Use this subagent when the user needs a Senior Backend Developer — Server-side..."
→ Ensures em-dash spacing, capitalizes the first letter post-em-dash,
   capitalizes the role before the em-dash (title case).

Also fixes:
  "Use this subagent when: Auditor técnico v4.0. Ejecuta..."
→ "Use this subagent as Auditor Técnico v4.0 — Ejecuta..."

Run-once. Idempotent-ish (re-running on polished descriptions is a no-op).
"""
from __future__ import annotations

import json
import re
from pathlib import Path

from _fm import ECOSYSTEM_ROOTS, Frontmatter, iter_agent_files

# pattern 1: "needs a {lowercase role} — {lowercase rest}"
PAT1 = re.compile(r"(Use this subagent when the user needs a )([a-z][\w\s/&.+-]+?)(\s+—\s+)([a-z])")

# pattern 2: "Use this subagent when: {sentence}" → "Use this subagent as {sentence}"
PAT2 = re.compile(r"^(Use this subagent when:)\s+")


def titlecase_role(role: str) -> str:
    # Keep common particles lowercase
    small = {"de", "del", "la", "las", "el", "los", "y", "o", "en", "con", "for", "the", "of", "and", "or"}
    words = role.split()
    out = []
    for i, w in enumerate(words):
        if i > 0 and w.lower() in small:
            out.append(w.lower())
        else:
            out.append(w[:1].upper() + w[1:] if w else w)
    return " ".join(out)


def polish(desc: str) -> str:
    original = desc
    # Strip wrapping quotes if present
    wrap = ""
    if desc.startswith('"') and desc.endswith('"'):
        wrap = '"'
        desc = desc[1:-1]
    elif desc.startswith("'") and desc.endswith("'"):
        wrap = "'"
        desc = desc[1:-1]

    # Pattern 1: capitalize role + char post-em-dash
    def _fix1(m: re.Match) -> str:
        role = titlecase_role(m.group(2).strip())
        rest_first = m.group(4).upper()
        return f"{m.group(1)}{role}{m.group(3)}{rest_first}"
    desc = PAT1.sub(_fix1, desc)

    # Pattern 2: "Use this subagent when:" prefix → "Use this subagent as"
    desc = PAT2.sub("Use this subagent as ", desc)

    return wrap + desc + wrap if desc != original.strip('"\'') else original


def main() -> int:
    changed: list[dict] = []
    for plugin_id, root in ECOSYSTEM_ROOTS.items():
        if not root.is_dir():
            continue
        for p in iter_agent_files(root):
            t = p.read_text(encoding="utf-8")
            fm = Frontmatter.parse(t)
            if fm is None:
                continue
            desc = fm.get("description")
            if desc is None:
                continue
            new = polish(desc)
            if new != desc:
                fm.set("description", new)
                p.write_text(fm.serialize(), encoding="utf-8")
                changed.append({
                    "plugin": plugin_id,
                    "file": str(p.relative_to(root)),
                    "before": desc[:100],
                    "after": new[:100],
                })

    log_dir = Path(__file__).parent / "logs"
    log_dir.mkdir(parents=True, exist_ok=True)
    (log_dir / "a4-polish.log").write_text(
        json.dumps({"changed": changed}, indent=2, ensure_ascii=False), encoding="utf-8",
    )
    from collections import Counter
    print(f"A4: polished={len(changed)}")
    for p, n in Counter(x["plugin"] for x in changed).most_common():
        print(f"  {p}: {n}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
