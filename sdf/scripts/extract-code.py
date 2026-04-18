#!/usr/bin/env python3
"""Code files (.py .ts .tsx .js .sql .abap) → priming-rag. Imports + signatures + AST-lite."""
import ast
import re
from pathlib import Path
from _common import cli, file_meta, write_priming, truncate

SIG_PATTERNS = {
    ".py": [],  # handled via ast
    ".ts": [re.compile(r"^\s*(export\s+)?(async\s+)?function\s+\w+\s*\(.*?\).*$", re.M),
            re.compile(r"^\s*(export\s+)?(abstract\s+)?class\s+\w+.*$", re.M),
            re.compile(r"^\s*(export\s+)?interface\s+\w+.*$", re.M)],
    ".tsx": None,  # reuse .ts
    ".js": None,
    ".sql": [re.compile(r"^\s*(CREATE|ALTER|DROP)\s+(TABLE|VIEW|PROCEDURE|FUNCTION|INDEX)\s+[\w.\"]+.*$", re.M | re.I)],
    ".abap": [re.compile(r"^\s*(CLASS|METHOD|FORM|FUNCTION|REPORT|INTERFACE)\s+\w+.*$", re.M | re.I)],
}


def py_signatures(src: str) -> list[str]:
    try:
        tree = ast.parse(src)
    except SyntaxError:
        return []
    sigs: list[str] = []
    for node in ast.walk(tree):
        if isinstance(node, (ast.FunctionDef, ast.AsyncFunctionDef)):
            args = ", ".join(a.arg for a in node.args.args)
            sigs.append(f"def {node.name}({args})")
        elif isinstance(node, ast.ClassDef):
            bases = ", ".join(ast.unparse(b) for b in node.bases) if node.bases else ""
            sigs.append(f"class {node.name}({bases})")
        elif isinstance(node, (ast.Import, ast.ImportFrom)):
            sigs.append(ast.unparse(node).strip())
    return sigs


def main() -> None:
    args = cli()
    path = Path(args.path)
    meta = file_meta(path)
    src = path.read_text(encoding="utf-8", errors="replace")
    ext = path.suffix.lower()

    sigs: list[str] = []
    if ext == ".py":
        sigs = py_signatures(src)
    else:
        pats = SIG_PATTERNS.get(ext) or SIG_PATTERNS.get(".ts", [])
        for pat in pats or []:
            sigs.extend(m.group(0).strip() for m in pat.finditer(src))

    imports = []
    if ext in {".ts", ".tsx", ".js"}:
        imports = re.findall(r"^\s*import\s+.+?from\s+['\"][^'\"]+['\"]", src, re.M)
    elif ext == ".sql":
        imports = re.findall(r"^\s*(USE|SET SEARCH_PATH TO)\s+.+$", src, re.M | re.I)

    resumen = [
        f"{ext} · {len(src.splitlines())} líneas",
        f"{len(sigs)} signatures, {len(imports)} imports/directivas",
    ]
    contenido = "### Imports/directivas\n" + "\n".join(f"- `{i}`" for i in imports[:30])
    contenido += "\n\n### Signatures\n" + "\n".join(f"- `{s}`" for s in sigs[:80])
    contenido += f"\n\n### Source (head 400 líneas)\n```{ext.lstrip('.')}\n" + "\n".join(src.splitlines()[:400]) + "\n```"
    evidencia = [f"[ADJUNTO:{path.name}:sig={s.split('(')[0].strip()}]" for s in sigs[:6]]
    out = write_priming(Path(args.out) if args.out else None, meta, f"code{ext}", resumen, truncate(contenido), evidencia)
    print(str(out))


if __name__ == "__main__":
    main()
