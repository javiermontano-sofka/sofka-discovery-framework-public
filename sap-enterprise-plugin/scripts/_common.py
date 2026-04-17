"""Common helpers for attachment extractors."""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import sys
from datetime import datetime, timezone
from pathlib import Path

SECRET_PATTERNS = [
    re.compile(r"(?i)(api[_-]?key|password|passwd|secret|bearer)\s*[:=]\s*\S+"),
    re.compile(r"sk-[A-Za-z0-9]{20,}"),
    re.compile(r"ghp_[A-Za-z0-9]{20,}"),
    re.compile(r"AKIA[0-9A-Z]{16}"),
]


def redact(text: str) -> str:
    out = text
    for pat in SECRET_PATTERNS:
        out = pat.sub("[REDACTED]", out)
    return out


def cli() -> argparse.Namespace:
    p = argparse.ArgumentParser()
    p.add_argument("path", help="input file")
    p.add_argument("--out", help="priming-rag output .md path", default=None)
    p.add_argument("--max-bytes", type=int, default=200_000)
    return p.parse_args()


def file_meta(path: Path) -> dict:
    b = path.read_bytes()
    return {
        "source_path": str(path.resolve()),
        "sha256": hashlib.sha256(b).hexdigest(),
        "bytes": len(b),
        "captured_at": datetime.now(timezone.utc).isoformat(timespec="seconds"),
    }


def write_priming(out: Path | None, meta: dict, extractor: str, resumen: list[str],
                  contenido: str, evidencia: list[str]) -> Path:
    if out is None:
        src = Path(meta["source_path"])
        out = Path.cwd() / ".discovery" / f"priming-rag-{src.stem}.md"
    out.parent.mkdir(parents=True, exist_ok=True)
    fm = {"extractor": extractor, **meta}
    lines = ["---"]
    for k, v in fm.items():
        lines.append(f"{k}: {json.dumps(v) if not isinstance(v, str) else v}")
    lines.append("---\n")
    lines.append(f"# Adjunto: {Path(meta['source_path']).name}\n")
    lines.append("## Resumen")
    for b in resumen:
        lines.append(f"- {b}")
    lines.append("\n## Contenido estructurado\n")
    lines.append(redact(contenido))
    lines.append("\n## Evidencia utilizable")
    for ev in evidencia:
        lines.append(f"- `{ev}`")
    out.write_text("\n".join(lines), encoding="utf-8")
    return out


def truncate(s: str, max_chars: int = 180_000) -> str:
    if len(s) <= max_chars:
        return s
    return s[:max_chars] + f"\n\n[...truncado, {len(s) - max_chars} chars omitidos...]"
