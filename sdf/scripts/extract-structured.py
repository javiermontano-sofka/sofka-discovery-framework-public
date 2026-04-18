#!/usr/bin/env python3
"""JSON/YAML/XML → priming-rag. Schema sketch + sample."""
import json
from pathlib import Path
from _common import cli, file_meta, write_priming, truncate


def schema(obj, depth: int = 0, max_depth: int = 4) -> str:
    if depth >= max_depth:
        return "..."
    if isinstance(obj, dict):
        return "{" + ", ".join(f"{k}: {schema(v, depth + 1, max_depth)}" for k, v in list(obj.items())[:12]) + "}"
    if isinstance(obj, list):
        return f"[{schema(obj[0], depth + 1, max_depth) if obj else ''}]"
    return type(obj).__name__


def main() -> None:
    args = cli()
    path = Path(args.path)
    meta = file_meta(path)
    text = path.read_text(encoding="utf-8", errors="replace")
    ext = path.suffix.lower()

    parsed = None
    kind = ext
    if ext == ".json":
        try:
            parsed = json.loads(text)
        except Exception as e:
            parsed = {"_error": str(e)}
    elif ext in {".yaml", ".yml"}:
        try:
            import yaml
            parsed = yaml.safe_load(text)
        except Exception as e:
            parsed = {"_error": str(e)}
    elif ext == ".xml":
        from bs4 import BeautifulSoup
        soup = BeautifulSoup(text, "lxml-xml")
        kinds = {t.name for t in soup.find_all()}
        parsed = {"_xml_tags": sorted(kinds)[:40]}

    resumen = [
        f"{ext} estructurado",
        f"Top-level: {schema(parsed)}" if parsed is not None else "(sin parseo)",
    ]
    sample = json.dumps(parsed, indent=2, default=str)[:20_000] if parsed is not None else text[:20_000]
    contenido = f"### Schema\n```\n{schema(parsed)}\n```\n\n### Sample\n```{kind.lstrip('.')}\n{sample}\n```"
    evidencia = [f"[ADJUNTO:{path.name}:root]"]
    out = write_priming(Path(args.out) if args.out else None, meta, f"structured{ext}", resumen, truncate(contenido), evidencia)
    print(str(out))


if __name__ == "__main__":
    main()
