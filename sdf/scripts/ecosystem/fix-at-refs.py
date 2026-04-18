#!/usr/bin/env python3
"""A3: Fix broken `@name` cross-references in agent bodies + ontology.

Process per plugin tree:
  1. Build an index of valid agent stems (files in agents/)
  2. Scan agent bodies + references/ontology/ + commands/ for `@name` tokens
  3. For each @-ref that doesn't resolve, try stripping known prefixes
     (sofka-, mao-, metodologia-, apex-, pm-, sdf-) and see if a file exists
  4. If the stripped form resolves, replace. Otherwise log as "unresolved"
"""
from __future__ import annotations

import json
import re
from pathlib import Path

from _fm import ECOSYSTEM_ROOTS

STRIP_PREFIXES = ("sofka-", "mao-", "metodologia-", "apex-", "sdf-", "pm-", "scriba-", "playbook-")
AT_PATTERN = re.compile(r"@([a-z][a-z0-9_-]+)")


def scan_dirs(plugin_root: Path) -> list[Path]:
    out: list[Path] = []
    for sub in ("agents", "commands"):
        d = plugin_root / sub
        if d.is_dir():
            out.extend(d.rglob("*.md"))
    ontology = plugin_root / "references/ontology"
    if ontology.is_dir():
        out.extend(ontology.glob("*.md"))
    return out


def main() -> int:
    summary: dict[str, dict] = {}

    for plugin_id, root in ECOSYSTEM_ROOTS.items():
        if not root.is_dir():
            continue
        agents_dir = root / "agents"
        if not agents_dir.is_dir():
            continue
        valid = {p.stem for p in agents_dir.rglob("*.md") if not p.name.startswith("_")}

        fixed: list[dict] = []
        unresolved: list[dict] = []

        for p in scan_dirs(root):
            text = p.read_text(encoding="utf-8")
            new_text = text
            changed_in_file = False

            for m in AT_PATTERN.finditer(text):
                ref = m.group(1)
                if ref in valid:
                    continue
                # Try stripping prefixes
                replacement = None
                for pref in STRIP_PREFIXES:
                    if ref.startswith(pref):
                        stripped = ref[len(pref):]
                        if stripped in valid:
                            replacement = stripped
                            break
                if replacement is not None:
                    new_text = new_text.replace(f"@{ref}", f"@{replacement}")
                    fixed.append({
                        "file": str(p.relative_to(root)),
                        "from": f"@{ref}",
                        "to": f"@{replacement}",
                    })
                    changed_in_file = True
                else:
                    # Skip common non-agent @ patterns (email, @sap-docs-steward which exists, @attachment-processor which exists)
                    # Only log once per (file, ref)
                    key = (str(p.relative_to(root)), ref)
                    if not any(u.get("_key") == key for u in unresolved):
                        unresolved.append({"file": str(p.relative_to(root)), "ref": f"@{ref}", "_key": key})

            if changed_in_file:
                p.write_text(new_text, encoding="utf-8")

        summary[plugin_id] = {
            "fixed_count": len(fixed),
            "unresolved_count": len(unresolved),
            "fixed": fixed[:10],
            "unresolved_top": [{"file": u["file"], "ref": u["ref"]} for u in unresolved[:15]],
        }

    log_dir = Path(__file__).parent / "logs"
    log_dir.mkdir(parents=True, exist_ok=True)
    (log_dir / "a3-refs.log").write_text(
        json.dumps(summary, indent=2, ensure_ascii=False), encoding="utf-8",
    )

    total_fixed = sum(s["fixed_count"] for s in summary.values())
    total_unresolved = sum(s["unresolved_count"] for s in summary.values())
    print(f"A3: fixed={total_fixed} unresolved={total_unresolved}")
    for p, s in summary.items():
        print(f"  {p}: fixed={s['fixed_count']} unresolved={s['unresolved_count']}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
