#!/usr/bin/env python3
"""CSV → priming-rag. Schema + head + basic stats."""
from pathlib import Path
import pandas as pd
from _common import cli, file_meta, write_priming, truncate


def main() -> None:
    args = cli()
    path = Path(args.path)
    df = pd.read_csv(path, nrows=5000, on_bad_lines="skip")
    meta = file_meta(path)
    resumen = [
        f"CSV con {len(df.columns)} columnas y ≥{len(df)} filas (muestra 5k)",
        f"Columnas: {', '.join(df.columns[:12])}{'...' if len(df.columns) > 12 else ''}",
    ]
    schema = "\n".join(f"- `{c}` · {df[c].dtype} · nulls={df[c].isna().sum()}" for c in df.columns)
    head = df.head(20).to_markdown(index=False)
    numeric = df.select_dtypes("number")
    stats = numeric.describe().to_markdown() if not numeric.empty else "_sin columnas numéricas_"
    contenido = f"### Schema\n{schema}\n\n### Head (20)\n{head}\n\n### Stats\n{stats}"
    evidencia = [f"[ADJUNTO:{path.name}:col={c}]" for c in df.columns[:8]]
    out = write_priming(Path(args.out) if args.out else None, meta, "csv", resumen, truncate(contenido), evidencia)
    print(str(out))


if __name__ == "__main__":
    main()
