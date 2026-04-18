#!/usr/bin/env python3
"""A1: Batch-inject `model:` and `tools:` into agent frontmatter.

Rules:
  - Skip files starting with `_` (shared rules, not invocable)
  - If neither `tools:` nor `allowed-tools:` present → insert `tools: [Read, Grep, Glob, Bash]`
  - If `model:` missing → insert `model: sonnet`
  - Orchestrators (file stem matches known list) stay with their own model if set;
    if missing, default to `opus`. Extended tools preserved via allowed-tools.

Idempotent. Emits logs/a1-frontmatter.log.
"""
from __future__ import annotations

import json
from pathlib import Path

from _fm import ECOSYSTEM_ROOTS, Frontmatter, iter_agent_files

ORCHESTRATOR_STEMS = {
    "discovery-conductor",
    "sap-orchestrator",
    "environment-orchestrator",
    "apex-project-conductor",
    "project-conductor",
    "forge-orchestrator",
    "editorial-conductor",
}

DEFAULT_TOOLS = "[Read, Grep, Glob, Bash]"
DEFAULT_MODEL = "sonnet"
ORCHESTRATOR_MODEL = "opus"


def main() -> int:
    changed: list[dict] = []
    skipped: list[dict] = []
    errors: list[dict] = []

    for plugin_id, root in ECOSYSTEM_ROOTS.items():
        if not root.is_dir():
            continue
        for p in iter_agent_files(root):
            try:
                t = p.read_text(encoding="utf-8")
                fm = Frontmatter.parse(t)
                if fm is None:
                    skipped.append({"file": str(p), "reason": "no frontmatter"})
                    continue
                actions: list[str] = []
                has_tools = fm.has_key("tools") or fm.has_key("allowed-tools")
                has_model = fm.has_key("model")
                is_orch = p.stem in ORCHESTRATOR_STEMS

                if not has_tools:
                    fm.set("tools", DEFAULT_TOOLS)
                    actions.append("add-tools")
                if not has_model:
                    fm.set("model", ORCHESTRATOR_MODEL if is_orch else DEFAULT_MODEL)
                    actions.append(f"add-model:{fm.get('model')}")

                if actions:
                    p.write_text(fm.serialize(), encoding="utf-8")
                    changed.append({"plugin": plugin_id, "file": str(p.relative_to(root)),
                                    "actions": actions})
            except Exception as e:
                errors.append({"file": str(p), "error": str(e)})

    log_dir = Path(__file__).parent / "logs"
    log_dir.mkdir(parents=True, exist_ok=True)
    (log_dir / "a1-frontmatter.log").write_text(
        json.dumps({"changed": changed, "skipped": skipped, "errors": errors},
                   indent=2, ensure_ascii=False),
        encoding="utf-8",
    )
    total = sum(1 for r in ECOSYSTEM_ROOTS.values() if r.is_dir()
                for _ in iter_agent_files(r))
    print(f"A1: processed={total} changed={len(changed)} skipped={len(skipped)} errors={len(errors)}")
    return 0 if not errors else 1


if __name__ == "__main__":
    raise SystemExit(main())
