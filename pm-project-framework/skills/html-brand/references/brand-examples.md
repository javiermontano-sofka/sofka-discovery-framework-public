# Brand Examples — Pattern Catalog

Reference catalog of production-proven HTML patterns for the Sofka Design System v5.1. Each pattern is a complete, self-contained template that the `html-builder` agent can reproduce from scratch.

> **Principle:** Every pattern here has been shipped to a real client. If a new doc type doesn't match any pattern, compose from the shared component library below.

---

## Document Type Catalog

| Doc Type | Example File | Slides | Audience | Goal | Duration |
|----------|-------------|--------|----------|------|----------|
| **Executive** | `examples/sample-output.html` | N/A (scrollable) | C-level, sponsors | Decision support | 15 min read |
| **Carousel** | `examples/sample-carousel.html` | 8-10 | Client executives | Invite to action | 3 min browse |
| **Presentation** | `examples/sample-presentation-slides.html` | 20-25 | Mixed (live session) | Structured walkthrough | 45-60 min |

---

## Pattern 1: Executive Document (Scrollable)

**Visual identity:** Dark Authority hero → light content body → Dark Authority footer.

### Skeleton
```
hero (black bg, sofka_, badges, h1, KPIs)
  → sticky TOC (gray-50 bg, horizontal scroll)
  → main.container (white bg, max-width 1100px)
    → numbered sections h2 with border-top separators
    → cards (gray-50), tables (gray-900 header), blockquotes, score bars
  → footer (black bg, orange border-top, badges)
```

### Key CSS
- `body { background: #FFFFFF; color: var(--sofka-gray-900); }`
- `.hero { background: var(--sofka-black); border-bottom: 8px solid var(--sofka-orange); }`
- `.hero-logo { font-family: var(--font-display); font-size: 1.8rem; color: var(--sofka-orange); }`
- `nav.toc { background: var(--sofka-gray-50); position: sticky; top: 0; }`
- `.card { background: var(--sofka-gray-50); border-radius: var(--radius-lg); box-shadow: var(--shadow-card); }`
- `th { background: var(--sofka-gray-900); color: var(--sofka-white); }`
- `td { background: var(--sofka-gray-100); color: var(--sofka-gray-900); }`

### Font Loading
```html
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<link href="https://api.fontshare.com/v2/css?f[]=clash-grotesk@400,500,600,700&display=swap" rel="stylesheet">
```

---

## Pattern 2: Carousel (Horizontal Slides)

**Visual identity:** Hero slide = Dark Authority. Content slides = Light DS v5.1. CTA slide = Dark Authority.

### Architecture
- `translateX` on a flex track (NOT display:none toggle)
- Each slide is `min-width: 100vw; height: 100vh`
- Navigation: fixed bottom pill with dots + arrows + counter
- Progress bar: top gradient orange→gold

### Slide Theme Distribution
| Slide | Background | Text |
|-------|-----------|------|
| 1 Hero | Black (Dark Authority) | White, orange accents |
| 2-8 Content | White `#FFFFFF` | `--sofka-gray-900`, orange labels |
| 9 CTA | Black (Dark Authority) | Gold title, white text |

### Content Slide Components (on white bg)
- **Cards**: `background: var(--sofka-gray-50); border-radius: var(--radius-lg); box-shadow: var(--shadow-card);`
- **Tables**: Same as executive — gray-900 header, gray-100 cells, rounded with shadow-md
- **Labels**: Orange `var(--sofka-orange)` uppercase, 0.75rem
- **Stats**: Clash Grotesk, 2.8rem, orange for numbers

### Navigation Bar (works on both dark and light slides)
```css
.carousel-nav {
  position: fixed; bottom: 32px; left: 50%; transform: translateX(-50%);
  background: rgba(17,17,16,0.85); /* sofka-gray-900 with alpha */
  backdrop-filter: blur(12px);
  padding: 10px 20px; border-radius: 100px;
  border: 1px solid rgba(0,0,0,0.1);
}
```

### JS Features Required
- Arrow keys ← → Home End
- Touch swipe (50px threshold)
- Mouse wheel (debounced 800ms)
- Dot navigation (active dot extends to pill)
- Progress bar auto-update
- `goToSlide()` global for CTA button

### CTA Slide Must Include
```html
<a href="mailto:{EMAIL}?subject=Sesión de Socialización — {SYSTEM_NAME} — {CLIENT_NAME}"
   class="cta-button">📅 Agendar Sesión de Socialización</a>
```

---

## Pattern 3: Presentation Slides (Full-Screen Deck)

**Visual identity:** Hero/section slides = Dark Authority. Content slides = Light DS v5.1. Closing = Dark Authority.

### Architecture
- Absolute positioned slides with opacity/transform transitions
- Active slide: `opacity: 1; transform: translateX(0);`
- Exit: `opacity: 0; transform: translateX(-60px);`
- Speaker notes panel (bottom, slides up with N key)
- Fullscreen mode (F key)

### Slide Theme Distribution
| Slide Type | Background | When |
|-----------|-----------|------|
| Portada | Black (Dark Authority) | Slide 1 |
| Section divider | Black with big number | Every new section |
| Content | White `#FFFFFF` | All content slides |
| Cierre | Black (Dark Authority) | Last slide |

### Section Divider Pattern
```html
<div class="deck-slide theme-section">
  <div class="slide-content" style="text-align:center;">
    <div class="section-number">01</div>  <!-- 8rem, rgba(255,126,8,0.08) -->
    <div class="section-title">Contexto</div>  <!-- 3.5rem, white -->
    <p class="s-subtitle">Subtítulo descriptivo</p>
  </div>
</div>
```

### Content Slide Pattern (on white bg)
```html
<div class="deck-slide theme-light" data-notes="Speaker notes here...">
  <div class="slide-content">
    <span class="s-label">Sección</span>  <!-- Orange, uppercase, badge-style -->
    <h2 class="s-title">Título del Slide</h2>
    <p class="s-subtitle">Descripción.</p>
    <!-- DS v5.1 components: cards, tables, grids, stats -->
  </div>
</div>
```

### Speaker Notes
- Panel: fixed bottom, dark bg with blur, slides up
- Toggle: N key or 📝 button in controls
- Content: `data-notes` attribute per slide
- Style: Write in first person plural, practical, with pause cues

### JS Features Required
- Arrow keys ← → Space PageUp PageDown Home End
- N key: toggle speaker notes
- F key: toggle fullscreen
- Touch swipe
- Progress bar + slide counter
- Fade/slide transitions

### Controls Bar (works on both dark and light slides)
```css
.deck-controls {
  position: fixed; bottom: 20px; left: 50%; transform: translateX(-50%);
  background: rgba(17,17,16,0.88);
  backdrop-filter: blur(12px);
  padding: 8px 18px; border-radius: 100px;
}
```

---

## Shared Component Library (Dark-Slide Components)

For hero, section dividers, and CTA slides (dark background):

```css
/* Stats */
.stat-n { font-family: var(--font-display); font-size: 2.8rem; font-weight: 700; color: var(--sofka-orange); }
.stat-u { font-size: .78rem; color: rgba(255,255,255,.6); }

/* Meta badges on hero */
.hero-meta-badge { background: rgba(255,255,255,.08); border: 1px solid rgba(255,255,255,.15); color: rgba(255,255,255,.85); padding: .35rem .9rem; border-radius: var(--radius-sm); font-size: .75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 1px; }
```

## Shared Component Library (Light-Slide Components)

For content slides (white background) — use DS v5.1 standard components:

```css
/* Cards */
.card { background: var(--sofka-gray-50); border-radius: var(--radius-lg); padding: 2rem; box-shadow: var(--shadow-card); }
.card:hover { box-shadow: var(--shadow-md); transform: translateY(-1px); }

/* Tables */
table { border-radius: var(--radius-md); overflow: hidden; box-shadow: var(--shadow-md); border: 1px solid var(--sofka-gray-300); }
th { background: var(--sofka-gray-900); color: var(--sofka-white); padding: 1rem 1.25rem; font-size: .8rem; text-transform: uppercase; }
td { background: var(--sofka-gray-100); color: var(--sofka-gray-900); padding: .875rem 1.25rem; border-bottom: 1px solid var(--sofka-gray-200); }

/* Blockquotes / Callouts */
blockquote { border-left: 4px solid var(--sofka-orange); background: rgba(255,126,8,.08); padding: 1.5rem; border-radius: var(--radius-md); }

/* Labels */
.s-label { display: inline-block; font-size: .72rem; font-weight: 700; text-transform: uppercase; letter-spacing: .12em; color: var(--sofka-orange); padding: .25rem .75rem; border: 1px solid rgba(255,126,8,.25); border-radius: var(--radius-sm); }

/* Grids */
.card-grid-2 { display: grid; grid-template-columns: repeat(2, 1fr); gap: 1.5rem; }
.card-grid-3 { display: grid; grid-template-columns: repeat(3, 1fr); gap: 1.5rem; }
```

---

## Content Rules (ALL Doc Types)

### Alcance / Investment Slides
Express magnitude in deliverables, NEVER in FTE-meses or cost:
- ✅ "52 pantallas, 8 RFs, 3 integraciones, 62 reglas de negocio"
- ✅ "Fase 1: RF01, RF02, RF08 → Modelo datos, RBAC, carga masiva"
- ❌ "8.8 FTE-meses"
- ❌ "$150,000 USD"

### Evidence Tags
Convert `[DOC]`, `[DATOS]`, `[INFERENCIA]`, `[SUPUESTO]` to colored badge spans.

### Success Color
Always gold `#FFD700`, NEVER green. Green only in charts.

### `sofka_` Brand Requirements
- Logotype: `font-family: var(--font-display); font-weight: 700; color: var(--sofka-orange); letter-spacing: -1px;`
- Size: 1.8rem in hero, 1.3rem in footer, 1.5rem in fixed watermark
- Always paired with meta-badges (framework version, req number, confidentiality, date)

### Footer Text
"Construido por profesionales, potenciado por la red agéntica de Sofka."

---

**Autor:** Javier Montaño | **Última actualización:** 16 de marzo de 2026
