#!/usr/bin/env python3
"""PDF → priming-rag. Text per page + tables via pdfplumber fallback."""
from pathlib import Path
from pypdf import PdfReader
from _common import cli, file_meta, write_priming, truncate


def main() -> None:
    args = cli()
    path = Path(args.path)
    meta = file_meta(path)
    reader = PdfReader(str(path))
    n = len(reader.pages)

    blocks: list[str] = []
    for i, page in enumerate(reader.pages[:100], 1):
        try:
            txt = (page.extract_text() or "").strip()
        except Exception as e:
            txt = f"_extract error: {e}_"
        if txt:
            blocks.append(f"### Page {i}\n\n{txt}")

    tables_info = ""
    try:
        import pdfplumber
        with pdfplumber.open(str(path)) as pl:
            tbls: list[str] = []
            for pi, pg in enumerate(pl.pages[:30], 1):
                for ti, t in enumerate(pg.extract_tables() or [], 1):
                    rows = "\n".join(" | ".join((c or "").strip() for c in row) for row in t[:30])
                    tbls.append(f"#### Page {pi} · Table {ti}\n{rows}")
            if tbls:
                tables_info = "\n\n## Tablas extraídas\n\n" + "\n\n".join(tbls)
    except Exception:
        pass

    resumen = [
        f"PDF con {n} páginas",
        f"Primer contenido: {blocks[0][:140] if blocks else '(vacío)'}",
    ]
    contenido = "\n\n".join(blocks) + tables_info
    evidencia = [f"[ADJUNTO:{path.name}:page={i}]" for i in range(1, min(n, 6) + 1)]
    out = write_priming(Path(args.out) if args.out else None, meta, "pdf", resumen, truncate(contenido), evidencia)
    print(str(out))


if __name__ == "__main__":
    main()
