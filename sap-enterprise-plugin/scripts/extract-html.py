#!/usr/bin/env python3
"""HTML → priming-rag. Clean text + tables + links."""
from pathlib import Path
from bs4 import BeautifulSoup
from _common import cli, file_meta, write_priming, truncate


def main() -> None:
    args = cli()
    path = Path(args.path)
    meta = file_meta(path)
    html = path.read_text(encoding="utf-8", errors="replace")
    soup = BeautifulSoup(html, "lxml")

    for tag in soup(["script", "style", "noscript"]):
        tag.decompose()

    title = (soup.title.string if soup.title else "") or ""
    headings = [h.get_text(strip=True) for h in soup.find_all(["h1", "h2", "h3"])][:20]
    links = [(a.get_text(strip=True), a.get("href", "")) for a in soup.find_all("a", href=True)][:30]

    tables: list[str] = []
    for i, t in enumerate(soup.find_all("table")[:10], 1):
        rows = []
        for tr in t.find_all("tr")[:50]:
            cells = [c.get_text(strip=True) for c in tr.find_all(["td", "th"])]
            rows.append(" | ".join(cells))
        tables.append(f"### Tabla {i}\n" + "\n".join(rows))

    text = soup.get_text("\n", strip=True)

    resumen = [
        f"HTML · title: {title[:80]}",
        f"Headings: {', '.join(headings[:6])}",
        f"{len(soup.find_all('table'))} tablas, {len(links)} links",
    ]
    contenido = f"## Text\n{text}\n\n## Tablas\n" + "\n\n".join(tables)
    if links:
        contenido += "\n\n## Links\n" + "\n".join(f"- [{t or u}]({u})" for t, u in links)
    evidencia = [f"[ADJUNTO:{path.name}:h={h}]" for h in headings[:6]]
    out = write_priming(Path(args.out) if args.out else None, meta, "html", resumen, truncate(contenido), evidencia)
    print(str(out))


if __name__ == "__main__":
    main()
