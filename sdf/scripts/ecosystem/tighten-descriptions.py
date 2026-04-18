#!/usr/bin/env python3
"""B1: Tighten SKILL.md descriptions > 500 chars down to <= 450.

Handles BOTH inline (`description: "..."`) and YAML folded block
(`description: >` followed by indented continuation lines).

Strategy:
  1. Detect folded block first; collapse multi-line to single string.
  2. Else parse inline value (strip quotes).
  3. If full text > 500 chars → keep first sentence (or hard-truncate at <=450).
  4. Stash original in `<skill>/references/.description-original.txt`.
  5. Rewrite SKILL.md with the inline-quoted, tightened description.
"""
from __future__ import annotations

import json
import re
from pathlib import Path

from _fm import ECOSYSTEM_ROOTS, iter_skill_files

MAX_CHARS = 450
THRESHOLD = 500

FM_RE = re.compile(r"\A---\s*\n(.*?)\n---\s*\n", re.S)
DESC_FOLDED = re.compile(r"^(description:\s*(?:>|\|))\s*\n((?:[ \t]+.*\n)+)", re.M)
DESC_INLINE = re.compile(r"^description:\s*(.+)$", re.M)


def tighten_text(full: str) -> str:
    """Return tightened version (<= MAX_CHARS) of full description.
    Always converts internal double quotes to single quotes so YAML wrapping is safe."""
    full = full.strip()
    # Prefer first sentence if it fits
    sm = re.match(r"(.+?[.!?])\s+", full + " ")
    if sm and len(sm.group(1)) <= MAX_CHARS:
        new = sm.group(1).strip()
    elif len(full) <= MAX_CHARS:
        new = full
    else:
        new = full[:MAX_CHARS]
        sp = new.rfind(" ")
        if sp > 0:
            new = new[:sp].rstrip(",;:") + "…"
    # YAML safety: replace internal " with '
    return new.replace('"', "'")


def process_skill(sk: Path) -> dict | None:
    text = sk.read_text(encoding="utf-8")
    fm_match = FM_RE.match(text)
    if not fm_match:
        return None
    fm_raw = fm_match.group(1)
    body = text[fm_match.end():]

    # Try folded
    folded = DESC_FOLDED.search(fm_raw)
    if folded:
        block_body = folded.group(2)
        lines = [line.strip() for line in block_body.splitlines() if line.strip()]
        full = " ".join(lines)
        if len(full) <= THRESHOLD:
            return None
        new_desc = tighten_text(full)
        replacement = f'description: "{new_desc}"\n'
        new_fm = fm_raw[:folded.start()] + replacement + fm_raw[folded.end():]
        original = full
    else:
        inline = DESC_INLINE.search(fm_raw)
        if not inline:
            return None
        raw_val = inline.group(1).strip()
        full = raw_val.strip('"').strip("'")
        if len(full) <= THRESHOLD:
            return None
        new_desc = tighten_text(full)
        new_line = f'description: "{new_desc}"'
        new_fm = fm_raw[:inline.start()] + new_line + fm_raw[inline.end():]
        original = full

    # Stash original
    refs_dir = sk.parent / "references"
    refs_dir.mkdir(parents=True, exist_ok=True)
    (refs_dir / ".description-original.txt").write_text(original, encoding="utf-8")
    # Write back
    new_text = f"---\n{new_fm.rstrip()}\n---\n{body}"
    sk.write_text(new_text, encoding="utf-8")
    return {"file": str(sk), "before": len(original), "after": len(new_desc)}


def main() -> int:
    log: list[dict] = []
    for plugin_id, root in ECOSYSTEM_ROOTS.items():
        if not root.is_dir():
            continue
        for sk in iter_skill_files(root):
            res = process_skill(sk)
            if res:
                res["plugin"] = plugin_id
                res["file"] = str(sk.relative_to(root))
                log.append(res)
    log_dir = Path(__file__).parent / "logs"
    log_dir.mkdir(parents=True, exist_ok=True)
    (log_dir / "b1-tighten.log").write_text(
        json.dumps({"tightened": log}, indent=2, ensure_ascii=False), encoding="utf-8")
    from collections import Counter
    print(f"B1: tightened={len(log)}")
    for p, n in Counter(x["plugin"] for x in log).most_common():
        print(f"  {p}: {n}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
