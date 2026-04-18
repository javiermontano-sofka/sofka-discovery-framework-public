# Sequence 05 — Brand HTML render (markdown → DS v5 HTML)

Deterministic pipeline: markdown source → jinja2 template → branded HTML with evidence tags highlighted.

## Diagram

```mermaid
sequenceDiagram
    autonumber
    actor U as User
    participant CMD as /sdf:render-html
    participant Sh as scripts/render-brand-html.sh
    participant Py as render_brand_html.py
    participant MD as python-markdown
    participant J2 as jinja2 template<br/>(brand-html-base.html)
    participant Tokens as canonical-tokens.md
    participant Out as output.html

    U->>CMD: /sdf:render-html input.md --style discovery
    CMD->>Sh: spawn with args
    Sh->>Py: python render_brand_html.py ...
    Py->>MD: parse(markdown, extensions=[tables, fenced_code, toc])
    MD-->>Py: HTML body
    Py->>Py: wrap <table> in .tw
    Py->>Py: detect + wrap evidence tags<br/>[TAG] → <span class="t td|ta|...">
    Py->>Tokens: read DS v5 variables
    Py->>J2: render(title, lead, body, style, tokens)
    J2-->>Py: full HTML
    Py->>Out: write output.html
    Py-->>Sh: OK
    Sh-->>CMD: path
    CMD-->>U: open output.html
```

## Key moments

- **Step 4-5** — markdown parsing is deterministic; the extension set is fixed.
- **Step 6** — tables get a `.tw` wrapper for horizontal scroll on narrow screens.
- **Step 7** — evidence tag detection is regex-based: `\[TAG(:locator)?\]` → `<span>`.
- **Step 8-9** — tokens (colors, font) are baked in at render time; no runtime CSS fetch.
- **Step 10** — jinja2 produces the full HTML including the `<head>`, `<style>`, hero, nav, body, footer.

## Offline guarantee

The only external fetch in the output HTML is the Google Fonts Inter `<link>`. When offline, system fallback fonts render cleanly (the CSS stack is intentional).

## Determinism guarantee

Same input + same template + same tokens = byte-identical output. This is testable via snapshot; any drift fails the render test.

## Related

- [ADR-0010](../../adr/0010-brand-html-deterministic.md)
- [`../../explanation/why-brand-html-is-deterministic.md`](../../explanation/why-brand-html-is-deterministic.md)
- `sdf/scripts/render_brand_html.py`
- `sdf/templates/brand-html-base.html`
