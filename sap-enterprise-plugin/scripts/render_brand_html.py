#!/usr/bin/env python3
"""Render a markdown deliverable to Sofka DS v5 brand HTML via jinja2.

Usage:
    python scripts/render_brand_html.py input.md --out output.html \
        --style comite|reporte|consultas|specs|discovery \
        --title "Comité de Expertos SAP" \
        [--meta key=val ...]
"""
from __future__ import annotations

import argparse
import re
from pathlib import Path

import markdown
from jinja2 import Environment, FileSystemLoader, select_autoescape

STYLES = {
    "comite": {"pill": "pf", "pill_text": "Comité Dinámico"},
    "reporte": {"pill": "pp", "pill_text": "Reporte Metacognitivo"},
    "consultas": {"pill": "pt", "pill_text": "Consulta Experta"},
    "specs": {"pill": "pf", "pill_text": "Especificaciones"},
    "discovery": {"pill": "pp", "pill_text": "Discovery"},
    "generic": {"pill": "pf", "pill_text": "SAP"},
}

EVIDENCE_TAG = re.compile(r"\[(CÓDIGO|CODIGO|CONFIG|DOC|INFERENCIA|SUPUESTO|STAKEHOLDER|NOTEBOOKLM|ADJUNTO)(:[^\]]+)?\]")


def highlight_evidence(html: str) -> str:
    def repl(m: re.Match) -> str:
        kind = m.group(1).upper().replace("CODIGO", "CÓDIGO")
        cls = {
            "CÓDIGO": "td",
            "CONFIG": "td",
            "DOC": "td",
            "STAKEHOLDER": "ta",
            "NOTEBOOKLM": "ta",
            "ADJUNTO": "tx",
            "INFERENCIA": "ti",
            "SUPUESTO": "ts",
        }.get(kind, "td")
        return f'<span class="t {cls}">{m.group(0)[1:-1]}</span>'
    return EVIDENCE_TAG.sub(repl, html)


def md_to_html(md_text: str) -> str:
    body = markdown.markdown(
        md_text,
        extensions=["tables", "fenced_code", "toc", "sane_lists"],
    )
    body = body.replace("<table>", '<div class="tw"><table>').replace("</table>", "</table></div>")
    body = highlight_evidence(body)
    return body


def parse_meta(items: list[str]) -> dict[str, str]:
    out: dict[str, str] = {}
    for it in items:
        if "=" in it:
            k, v = it.split("=", 1)
            out[k.strip()] = v.strip()
    return out


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("input", help="markdown path")
    ap.add_argument("--out", required=True)
    ap.add_argument("--style", default="generic", choices=list(STYLES.keys()))
    ap.add_argument("--title", default=None)
    ap.add_argument("--lead", default=None)
    ap.add_argument("--meta", action="append", default=[])
    ap.add_argument("--template", default=None)
    args = ap.parse_args()

    inp = Path(args.input)
    md_text = inp.read_text(encoding="utf-8")

    # Extract first H1 as title if not provided
    title = args.title
    lead = args.lead
    if not title:
        m = re.search(r"^#\s+(.+?)\s*$", md_text, re.M)
        if m:
            title = m.group(1)
            md_text = md_text.replace(m.group(0), "", 1)
    title = title or "SAP Deliverable"

    if not lead:
        m = re.search(r"^>\s+(.+?)\s*$", md_text, re.M)
        if m:
            lead = m.group(1)

    style = STYLES[args.style]
    body_html = md_to_html(md_text)

    root = Path(__file__).resolve().parent.parent
    tpl_dir = root / "templates"
    env = Environment(
        loader=FileSystemLoader(str(tpl_dir)),
        autoescape=select_autoescape(["html"]),
    )
    tpl = env.get_template(args.template or "brand-html-base.html")

    html = tpl.render(
        title=title,
        title_html=title,
        lead=lead,
        pills=[{"cls": style["pill"], "text": style["pill_text"]}, {"cls": "pg", "text": "Sofka DS v5"}],
        nav=[],
        stats=[],
        body_html=body_html,
        meta=parse_meta(args.meta),
        footer_title="SAP Enterprise Plugin v4.0",
        footer_author="Diseñado por Javier Montaño",
        footer_tagline="Sofka, your technology partner.",
    )
    out = Path(args.out)
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text(html, encoding="utf-8")
    print(str(out))


if __name__ == "__main__":
    main()
