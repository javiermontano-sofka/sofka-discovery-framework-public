# Why brand HTML rendering is deterministic (and offline-capable)

Every SDF deliverable can be rendered to branded HTML. The renderer is jinja2-based, offline-capable, and emits zero JavaScript. This essay explains why those constraints.

## The environment of reading

Enterprise buyers open HTML deliverables in adversarial conditions:

- Windows laptops with old Chrome/Edge versions.
- SharePoint inline previewers (not full browser rendering).
- Corporate proxies that strip external resources.
- Tablet screens during a meeting.
- Printers, when a deliverable becomes a PDF.

Anything dynamic — runtime fetches, third-party scripts, CDN dependencies — is a window for "broken render at the worst moment". The CTO scrolling to slide 14 of the pitch doesn't forgive a missing chart because "the CDN is blocked here".

## The design choices

**No JS.** Every byte of output is static HTML + embedded CSS. Interactivity that would require JS (sortable tables, collapse/expand) is either achieved via CSS `:target` tricks or omitted.

**Tokens baked in.** The Sofka Design System v5 palette (`--o #FF7E08` orange, `--bk #000` black, `--bg #EFEAE4` cream, `--pos #FFD700` gold) is embedded in the template's `:root`. No external CSS. Changing a token is a template commit — auditable in git.

**One external fetch.** Google Fonts Inter is linked, not embedded. This is the single deliberate external dependency. When offline, system fallback fonts render cleanly; the layout doesn't shift.

**jinja2 as the engine.** The template (`templates/brand-html-base.html`) is ~700 lines of CSS + structure. Content variables are injected server-side. Deterministic: same input → same output, byte-for-byte.

## Why no green — ever

Sofka's brand rejects green. `#00ff00`, `#2ecc71`, any variant — not allowed. This is a brand rule, not a technical one, but it's enforced mechanically: the template has no green tokens; using raw hex in content bypasses the template (and is caught in review).

Why this discipline matters: brand compliance is a negotiation with the brand owner. "We'll try to avoid green" is a concession that fails. "Green is technically impossible because it's not in the template" is a commitment.

## Why deterministic, not generative

An LLM-rendered HTML (agent writes markup on the fly) would be more flexible. Why we chose determinism:

- **Reproducibility.** A deliverable rendered today and rendered tomorrow must match. Clients notice otherwise.
- **Auditability.** Output = `template ∘ content`. A bug is localized: template or content, never "some LLM weirdness".
- **Brand invariants.** The template holds the brand contract. If the LLM writes the markup, the brand is subject to the LLM's variance.
- **Speed.** jinja2 renders in milliseconds; an LLM pass would add seconds and cost.

The LLM *writes the content* (markdown). The renderer *styles it*. Separation of concerns.

## Styles available

Six style variants share the same base template:

| Style | Use |
|-------|-----|
| `comite` | Committee deliberations |
| `reporte` | Metacognitive reports |
| `consultas` | Expert consultation responses |
| `specs` | Functional/technical specifications |
| `discovery` | Landscape assessments |
| `generic` | Fallback |

Differences are CSS class selectors, not separate templates. Adding a new style is a CSS rule + a template `if` branch, not a forked template.

## What we give up

- **Client-side interactivity.** Sortable tables would need JS. Accepted: readers sort in their head for tables that rarely exceed 20 rows; for larger, we render compact.
- **Dynamic data.** Charts that update from live data. Accepted: pre-sales artefacts are snapshots; live data happens post-sale.
- **Theming flexibility.** The template is opinionated; users don't override. Accepted: brand compliance is the point.

## Alternatives considered

- **Pandoc direct.** Dismissed: doesn't style evidence tags; doesn't enforce DS v5 tokens.
- **Jupyter / Quarto.** Dismissed: adds Python runtime dependencies; overkill for markdown → HTML.
- **React/Next.js client render.** Dismissed: violates every axiom above.

## Related

- [ADR-0010](../adr/0010-brand-html-deterministic.md)
- `templates/brand-html-base.html`
- `scripts/render_brand_html.py`
- `references/ontology/canonical-tokens.md`
- `sap-enterprise-plugin/skills/brand-html-render/SKILL.md` (sibling plugin uses same renderer)
