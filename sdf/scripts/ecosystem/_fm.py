"""Shared frontmatter helpers for ecosystem-wide batch edits.

Keep this tiny — just enough to parse/update YAML-ish frontmatter without
bringing in pyyaml's serialization quirks. Frontmatter lines are kept
line-oriented (1 key per line, values are strings or inline arrays).
"""
from __future__ import annotations

import re
from dataclasses import dataclass
from pathlib import Path

FM_RE = re.compile(r"\A---\s*\n(.*?)\n---\s*\n", re.S)


@dataclass
class Frontmatter:
    raw: str  # the YAML body between --- markers (no fences)
    body: str  # everything after closing ---

    @classmethod
    def parse(cls, text: str) -> "Frontmatter | None":
        m = FM_RE.match(text)
        if not m:
            return None
        return cls(raw=m.group(1), body=text[m.end():])

    def serialize(self) -> str:
        return f"---\n{self.raw}\n---\n{self.body}"

    def has_key(self, key: str) -> bool:
        return re.search(rf"^{re.escape(key)}\s*:", self.raw, re.M) is not None

    def get(self, key: str) -> str | None:
        m = re.search(rf"^{re.escape(key)}\s*:\s*(.*)$", self.raw, re.M)
        if not m:
            return None
        return m.group(1).rstrip()

    def set(self, key: str, value: str) -> None:
        """Insert or update a key=value line in the frontmatter."""
        pat = re.compile(rf"^{re.escape(key)}\s*:.*$", re.M)
        if pat.search(self.raw):
            self.raw = pat.sub(f"{key}: {value}", self.raw, count=1)
        else:
            self.raw = self.raw.rstrip() + f"\n{key}: {value}"

    def delete(self, key: str) -> None:
        pat = re.compile(rf"^{re.escape(key)}\s*:.*(\n|$)", re.M)
        self.raw = pat.sub("", self.raw)


def iter_agent_files(plugin_root: Path) -> list[Path]:
    agents_dir = plugin_root / "agents"
    if not agents_dir.is_dir():
        return []
    return [p for p in sorted(agents_dir.rglob("*.md"))
            if not p.name.startswith("_") and p.is_file()]


def iter_skill_files(plugin_root: Path) -> list[Path]:
    skills_dir = plugin_root / "skills"
    if not skills_dir.is_dir():
        return []
    return sorted(skills_dir.glob("*/SKILL.md"))


ECOSYSTEM_ROOTS = {
    "sdf-core": Path("/Users/deonto/.claude/plugins/marketplaces/local-desktop-app-uploads/sdf"),
    "sofka-df": Path("/Users/deonto/.claude/plugins/marketplaces/local-desktop-app-uploads/sdf/sofka-discovery-framework"),
    "mao": Path("/Users/deonto/.claude/plugins/marketplaces/local-desktop-app-uploads/sdf/metodologia-discovery-framework"),
    "pm": Path("/Users/deonto/.claude/plugins/marketplaces/local-desktop-app-uploads/sdf/pm-project-framework"),
    "sa": Path("/Users/deonto/.claude/plugins/marketplaces/local-desktop-app-uploads/sdf/sovereign-architect"),
    "plugin-qa": Path("/Users/deonto/.claude/plugins/marketplaces/local-desktop-app-uploads/sdf/plugin-qa"),
}
