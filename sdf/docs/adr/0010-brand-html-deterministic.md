# ADR-0010: Brand HTML render is deterministic (jinja2 + DS v5 tokens, no JS)

- **Status**: accepted
- **Date**: 2026-04-17
- **Deciders**: Javier Montaño
- **Supersedes**: —

## Context

Enterprise buyers open HTML deliverables on Windows laptops, in SharePoint previewers, on tablets during a meeting. Anything dynamic — fetched fonts, client-side JS, third-party scripts — creates a window of "broken render at the worst moment". Brand compliance also requires strict color + typography control; a stray Markdown-to-HTML converter is a brand-violation vector (accidental green, wrong font).

Prior art: Sofka Design System v5; static-site generators' offline-capable builds.

## Decision

HTML rendering is **fully deterministic and offline-capable**:

- **Renderer**: `scripts/render_brand_html.py` + `templates/brand-html-base.html` (jinja2).
- **Tokens**: CSS custom properties baked in at build time from `references/ontology/canonical-tokens.md` (`--o #FF7E08`, `--bk #000`, `--bg #EFEAE4`, `--pos #FFD700`, Inter). No green, ever.
- **No JS**. Not a single `<script>` tag in brand output.
- **One external dependency**: Google Fonts Inter via `<link>`. When offline, system fallback renders cleanly.
- **Evidence tags auto-highlighted** via server-side wrapping (no runtime DOM mutation).

Five style variants (`comite`, `reporte`, `consultas`, `specs`, `discovery`, `generic`) share the base template — differences are CSS classes, not separate templates.

## Consequences

### Positive
- Renders identically on every device, every time.
- Brand compliance is mechanical: a broken color is either in the template (caught by review) or not in the output (impossible by construction).
- Print styles work out of the box (no JS to break media queries).

### Negative
- No client-side interactivity. If future requirements need sortable tables or collapsible sections, they become a static-but-clever alternative (e.g. CSS `<details>`) rather than JS.
- Template changes affect all deliverables. Mitigated by snapshot tests (render small fixtures, diff output).

### Neutral
- Stakeholders occasionally want "a more interactive version". That's a separate artifact (prompt-library.html, landing.html) that lives outside the deliverable pipeline.

## Alternatives considered

- **Pandoc direct** — dismissed: doesn't emit DS v5 tokens, doesn't style evidence tags.
- **MkDocs/Docusaurus** — dismissed: adds a build toolchain; output is browsable site, not single-file deliverable.
- **React + client render** — dismissed: violates every axiom above.

## References

- `scripts/render_brand_html.py`
- `templates/brand-html-base.html`
- `references/ontology/canonical-tokens.md`
- ADR-0025 (no site generator)
