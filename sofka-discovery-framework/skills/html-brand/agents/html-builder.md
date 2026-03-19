# HTML Builder Agent

## Role

End-to-end HTML document builder for Sofka-branded deliverables. Orchestrates the full generation pipeline: content analysis → structure planning → CSS assembly → HTML composition → quality gate. Unlike the markdown-converter (batch pipeline) or batch-upgrader (legacy migration), this agent builds new HTML documents from scratch or from structured input, applying Design System v5 with full component selection.

## When to Use

- Building a **new** HTML deliverable from structured content (not converting existing .md)
- Creating **specialized** HTML formats: carousel decks, slide presentations, one-pagers, landing pages
- Composing HTML from **multiple sources** (RAG files, markdown fragments, data tables)
- Any HTML generation that requires **component selection decisions** beyond what the pipeline automates

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `CONTENT_SOURCE` | Yes | Path to content file(s), or inline structured content |
| `DOC_TYPE` | Yes | `executive` \| `technical` \| `transformation` \| `carousel` \| `slides` \| `one-pager` |
| `CLIENT_NAME` | Yes | Client name for hero and footer branding |
| `SYSTEM_NAME` | Yes | System/project name for hero h1 highlight |
| `OUTPUT_PATH` | Yes | Where to write the final .html file |
| `DESIGN_TOKENS_PATH` | No | Path to design-tokens.md (defaults to skill references/) |
| `VARIANT` | No | `light` (default, white body) \| `dark-authority` (full dark, landing pages only) |

## Process

### Phase 1 — Content Analysis

1. Read all source content. Identify: sections, key metrics, evidence tags, diagrams, tables, risk items, decisions.
2. Extract hero metadata: title, subtitle, 4 KPIs (select the 4 most impactful numbers).
3. Classify sections by density: metric-heavy → cards/score-bars; narrative → prose; comparative → scenario cards; sequential → timeline/steps.
4. Determine TOC entries (max 8 from top-level sections).

### Phase 2 — Structure Planning

Map content to DS v5 components using the decision matrix:

| Content Pattern | Component | Variant |
|----------------|-----------|---------|
| 3-4 comparable options | Scenario cards (.a/.b/.c) | With recommended badge |
| Pros vs cons | Pros/cons grid | Two-column |
| Numeric scores | Score bars | Orange/blue/red fills |
| Sequential steps | Timeline (.steps) | CSS counter |
| Risk + mitigation | Risk cards | With .mitigation block |
| Key decision | ADR cards | With modal detail |
| Constraint list | Constraint grid | Auto-fit columns |
| Status/health | Badges | Semantic colors |
| Summary/TL;DR | Callout-orange or .tldr | Border-left accent |
| Evidence-tagged claim | Inline badge | .badge-doc/.badge-inf/etc. |
| Mermaid diagram | pre.mermaid | Base theme, light fills |

### Phase 3 — CSS Assembly

1. Load `:root` tokens from design-tokens.md
2. Add global contrast fix block (body #FFFFFF, cards gray-50, TOC gray-50)
3. Add component CSS for all components used in Phase 2
4. Add bridge CSS if any markdown-converted content is included
5. Add evidence badge CSS if evidence tags present
6. Add Mermaid container CSS if diagrams present
7. Add responsive breakpoints + print + reduced-motion

### Phase 4 — HTML Composition

Assemble in this exact order:
```
<!DOCTYPE html><html lang="es">
<head>
  charset + viewport + title + OG tags
  Font preconnects + Google Fonts Inter + Fontshare Clash Grotesk
  [If Mermaid needed] Mermaid CDN + initialize with base theme
  <style> [assembled CSS from Phase 3] </style>
</head>
<body>
  <a class="skip-link" href="#main">Ir al contenido principal</a>
  [If INTERNAL] <div class="internal-banner">...</div>
  <header class="hero">...</header>
  <nav class="toc" aria-label="Navegación del documento">...</nav>
  <main class="container" id="main">
    [Sections with numbered headers OR specialized layout]
  </main>
  <footer class="site-footer">...</footer>
  <script>[TOC tracking + any modals]</script>
</body>
</html>
```

### Phase 5 — Quality Gate

Run the 19-point validation checklist from SKILL.md. Additionally verify:
- [ ] Every section has at least one visual element (card, table, badge, diagram, or score bar)
- [ ] No two adjacent sections use the same component pattern
- [ ] KPI values in hero are accurate against source content
- [ ] All Mermaid diagrams render (no syntax errors in mermaid blocks)
- [ ] File size < 500KB
- [ ] Responsive check: hero KPIs stack 2x2 at 768px

## Specialized Layouts

> **Reference implementations:** See `examples/sample-carousel.html` and `examples/sample-presentation-slides.html` for production-quality output. Read them BEFORE building to calibrate quality expectations.

### Carousel / Slide Deck (`DOC_TYPE=carousel`)

Horizontal-scrolling slide deck for client-facing proposals. Goal: invite to action in 3 minutes. 8-10 slides, visual-first, CTA final.

**Architecture:** `translateX` on a flex track (NOT display:none toggle). This enables smooth CSS transitions and future swipe animations.

**Document Shell:**
```html
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{SYSTEM_NAME} — {CLIENT_NAME}</title>
  <style>/* DS v5.1 Carousel CSS — see below */</style>
</head>
<body>
  <!-- Progress bar: gradient orange→gold -->
  <div class="progress-bar" id="progressBar"></div>

  <!-- Brand: sofka_ logotype top-left -->
  <div class="sofka-brand"><div class="sofka-logo">sofka_</div></div>

  <!-- Carousel track -->
  <div class="carousel" id="carousel">
    <div class="carousel-track" id="carouselTrack">
      <div class="slide slide--hero">...</div>
      <div class="slide slide--problem">...</div>
      <!-- ... 8-10 slides total -->
      <div class="slide slide--cta">...</div>
    </div>
  </div>

  <!-- Navigation: arrows + dots + counter -->
  <nav class="carousel-nav" id="carouselNav">
    <button class="carousel-arrow" id="prevBtn" disabled>←</button>
    <span class="slide-counter" id="slideCounter">1 / N</span>
    <div id="dotsContainer"></div>
    <button class="carousel-arrow" id="nextBtn">→</button>
  </nav>

  <script>/* Carousel Engine — see below */</script>
</body>
</html>
```

**Required CSS (production):**
```css
/* Body: dark immersive, full viewport */
body { background: var(--sofka-dark); color: var(--sofka-white); overflow: hidden; height: 100vh; }

/* Track: flex row, translate for navigation */
.carousel { position: relative; width: 100vw; height: 100vh; overflow: hidden; }
.carousel-track { display: flex; height: 100%; transition: transform 600ms cubic-bezier(0.25, 0.46, 0.45, 0.94); will-change: transform; }
.slide { min-width: 100vw; height: 100vh; display: flex; align-items: center; justify-content: center; padding: 60px 80px; position: relative; }
.slide-inner { max-width: 1100px; width: 100%; z-index: 2; }

/* Slide theme backgrounds — use gradients, not flat colors */
.slide--hero { background: linear-gradient(135deg, var(--sofka-dark) 0%, #2A1A0E 50%, var(--sofka-dark) 100%); }
.slide--problem { background: linear-gradient(180deg, #1A0A0A 0%, var(--sofka-dark) 100%); }
.slide--cta { background: linear-gradient(135deg, #2A1A0E 0%, var(--sofka-dark) 40%, #0E1A2E 100%); }

/* Hero radial glow effect */
.slide--hero::before { content: ''; position: absolute; top: -50%; right: -30%; width: 80vw; height: 80vw; border-radius: 50%; background: radial-gradient(circle, rgba(255,126,8,0.08) 0%, transparent 70%); z-index: 1; }

/* Brand: sofka_ logotype */
.sofka-brand { position: fixed; top: 20px; left: 28px; z-index: 100; }
.sofka-logo { font-family: var(--font-display); font-size: 1.5rem; font-weight: 700; color: var(--sofka-orange); letter-spacing: -1px; }

/* Meta badges on hero */
.meta-badges { display: flex; gap: 10px; flex-wrap: wrap; }
.meta-badge { background: rgba(255,126,8,.12); color: var(--sofka-orange); padding: 4px 12px; border-radius: 4px; font-size: .72rem; font-weight: 600; }
.meta-badge--neutral { background: rgba(255,255,255,.06); color: var(--sofka-gray-400); }

/* Progress bar: top, gradient */
.progress-bar { position: fixed; top: 0; left: 0; height: 3px; background: linear-gradient(90deg, var(--sofka-orange), var(--sofka-gold)); z-index: 200; transition: width 600ms ease; box-shadow: 0 0 8px rgba(255,126,8,0.4); }

/* Navigation: pill-shaped, frosted glass */
.carousel-nav { position: fixed; bottom: 32px; left: 50%; transform: translateX(-50%); display: flex; align-items: center; gap: 10px; z-index: 100; background: rgba(26,26,46,0.85); backdrop-filter: blur(12px); padding: 10px 20px; border-radius: 100px; border: 1px solid rgba(255,255,255,0.08); }
.carousel-arrow { width: 36px; height: 36px; border-radius: 50%; border: 1px solid rgba(255,255,255,0.15); background: rgba(255,255,255,0.05); color: var(--sofka-gray-300); cursor: pointer; display: flex; align-items: center; justify-content: center; }
.carousel-arrow:hover { border-color: var(--sofka-orange); color: var(--sofka-orange); }
.carousel-arrow:disabled { opacity: 0.3; cursor: not-allowed; }

/* Dots: active extends to pill */
.carousel-dot { width: 10px; height: 10px; border-radius: 50%; background: var(--sofka-gray-600); border: none; cursor: pointer; transition: var(--transition-base); }
.carousel-dot.active { background: var(--sofka-orange); width: 28px; border-radius: 5px; box-shadow: 0 0 8px rgba(255,126,8,0.4); }
```

**Required JS (production):**
```javascript
(function() {
  'use strict';
  const track = document.getElementById('carouselTrack');
  const slides = track.querySelectorAll('.slide');
  const total = slides.length;
  let current = 0;
  let touchStartX = 0;

  // Create dots dynamically
  const dotsContainer = document.getElementById('dotsContainer');
  slides.forEach((_, i) => {
    const dot = document.createElement('button');
    dot.className = 'carousel-dot' + (i === 0 ? ' active' : '');
    dot.addEventListener('click', () => goToSlide(i));
    dotsContainer.appendChild(dot);
  });

  function goToSlide(index) {
    if (index < 0 || index >= total) return;
    current = index;
    track.style.transform = `translateX(-${current * 100}vw)`;
    dotsContainer.querySelectorAll('.carousel-dot').forEach((d, i) => d.classList.toggle('active', i === current));
    document.getElementById('slideCounter').textContent = `${current + 1} / ${total}`;
    document.getElementById('prevBtn').disabled = current === 0;
    document.getElementById('nextBtn').disabled = current === total - 1;
    document.getElementById('progressBar').style.width = `${((current + 1) / total) * 100}%`;
  }
  window.goToSlide = goToSlide; // For CTA buttons

  document.getElementById('prevBtn').addEventListener('click', () => goToSlide(current - 1));
  document.getElementById('nextBtn').addEventListener('click', () => goToSlide(current + 1));

  // Keyboard: ← → Home End
  document.addEventListener('keydown', (e) => {
    if (e.key === 'ArrowRight' || e.key === 'ArrowDown') { e.preventDefault(); goToSlide(current + 1); }
    else if (e.key === 'ArrowLeft' || e.key === 'ArrowUp') { e.preventDefault(); goToSlide(current - 1); }
    else if (e.key === 'Home') { e.preventDefault(); goToSlide(0); }
    else if (e.key === 'End') { e.preventDefault(); goToSlide(total - 1); }
  });

  // Touch swipe (50px threshold)
  track.addEventListener('touchstart', (e) => { touchStartX = e.changedTouches[0].screenX; }, { passive: true });
  track.addEventListener('touchend', (e) => {
    const diff = touchStartX - e.changedTouches[0].screenX;
    if (Math.abs(diff) > 50) { diff > 0 ? goToSlide(current + 1) : goToSlide(current - 1); }
  }, { passive: true });

  // Mouse wheel (debounced 800ms)
  let wheelTimeout;
  document.addEventListener('wheel', (e) => {
    if (wheelTimeout) return;
    wheelTimeout = setTimeout(() => { wheelTimeout = null; }, 800);
    if (e.deltaY > 30 || e.deltaX > 30) goToSlide(current + 1);
    else if (e.deltaY < -30 || e.deltaX < -30) goToSlide(current - 1);
  }, { passive: true });

  goToSlide(0);
})();
```

**Slide content patterns (8-10 slides):**

| # | Slide | Theme | Content |
|---|-------|-------|---------|
| 1 | Hero / Portada | `slide--hero` | `sofka_` + title + subtitle + 4 stat numbers + meta badges |
| 2 | El Problema | `slide--problem` | Pain list (icon + title + desc), 4-5 items max |
| 3 | La Oportunidad | `slide--opportunity` | 6 cards grid showing what already exists |
| 4 | La Solución | `slide--solution` | Architecture overview + 4 component cards |
| 5 | Propuesta de Valor | `slide--value` | Before/after comparison table |
| 6 | Roadmap | `slide--roadmap` | Timeline with phases + prerequisite callout |
| 7 | Alcance | `slide--scope` | What gets built: RFs, screens, APIs, integrations, BRs |
| 8 | Riesgos | `slide--risks` | 4 risk cards with mitigation |
| 9 | CTA | `slide--cta` | Stats + action button (mailto) + "Volver al inicio" |

**CTA Button:**
```html
<a href="mailto:{EMAIL}?subject=Sesión de Socialización — {SYSTEM_NAME} — {CLIENT_NAME}" class="cta-button">
  📅 Agendar Sesión de Socialización
</a>
```

---

### Presentation Slides (`DOC_TYPE=slides`)

Full-screen presentation for live socialization sessions. Goal: structured walkthrough in 45-60 minutes. 20-25 slides with speaker notes, fullscreen mode.

**Architecture:** `position: absolute` slides with opacity/transform transitions (NOT display:none). Active slide gets `.active` class; exiting slide gets `.exit-left`.

**Document Shell:**
```html
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Socialización — {SYSTEM_NAME} | {CLIENT_NAME}</title>
  <style>/* DS v5.1 Presentation CSS — see below */</style>
</head>
<body>
  <div class="deck-progress" id="deckProgress"></div>
  <div class="sofka-brand"><div class="sofka-logo">sofka_</div></div>

  <div class="deck" id="deck">
    <div class="deck-slide theme-hero active" data-notes="Speaker notes here...">
      <div class="slide-content">...</div>
    </div>
    <!-- Section dividers use theme-section -->
    <div class="deck-slide theme-section" data-notes="...">
      <div class="slide-content">
        <div class="section-number">01</div>
        <div class="section-title">Contexto</div>
        <p class="s-subtitle">...</p>
      </div>
    </div>
    <!-- Content slides use theme-dark-warm, theme-dark-cool, etc. -->
    <div class="deck-slide theme-dark-warm" data-notes="...">
      <div class="slide-content">...</div>
    </div>
    <!-- ... 20-25 slides total -->
  </div>

  <!-- Speaker Notes Panel -->
  <div class="speaker-notes" id="speakerNotes">
    <div class="speaker-notes-label">Notas del Presentador</div>
    <div id="notesContent"></div>
  </div>

  <!-- Controls -->
  <nav class="deck-controls" id="deckControls">
    <button class="deck-arrow" id="deckPrev" disabled>←</button>
    <span class="deck-counter" id="deckCounter">1 / N</span>
    <button class="deck-arrow" id="deckNext">→</button>
    <button class="deck-notes-toggle" id="notesToggle" title="Notas (N)">📝</button>
  </nav>

  <script>/* Deck Engine — see below */</script>
</body>
</html>
```

**Required CSS (production):**
```css
body { background: var(--sofka-dark); color: var(--sofka-white); overflow: hidden; height: 100vh; }

/* Slides: absolute positioned, fade+slide transitions */
.deck { position: relative; width: 100vw; height: 100vh; overflow: hidden; }
.deck-slide { position: absolute; top: 0; left: 0; width: 100vw; height: 100vh; display: flex; align-items: center; justify-content: center; padding: 60px 80px; opacity: 0; transform: translateX(60px); transition: opacity 400ms ease, transform 400ms ease; pointer-events: none; overflow-y: auto; }
.deck-slide.active { opacity: 1; transform: translateX(0); pointer-events: auto; z-index: 10; }
.deck-slide.exit-left { opacity: 0; transform: translateX(-60px); }
.slide-content { max-width: 1100px; width: 100%; z-index: 2; }

/* Slide themes — dark gradients with warm/cool/red accents */
.theme-dark { background: var(--sofka-dark); }
.theme-dark-warm { background: linear-gradient(135deg, var(--sofka-dark) 0%, #2A1A0E 100%); }
.theme-dark-cool { background: linear-gradient(180deg, var(--sofka-dark) 0%, #0E1A2E 100%); }
.theme-dark-red { background: linear-gradient(180deg, #1A0A0A 0%, var(--sofka-dark) 100%); }
.theme-dark-green { background: linear-gradient(135deg, var(--sofka-dark) 0%, #0E1A15 100%); }
.theme-hero { background: linear-gradient(135deg, var(--sofka-dark) 0%, #2A1A0E 50%, var(--sofka-dark) 100%); }
.theme-cta { background: linear-gradient(135deg, #2A1A0E 0%, var(--sofka-dark) 40%, #0E1A2E 100%); }
.theme-section { background: var(--sofka-dark); }
.theme-section .slide-content { text-align: center; }

/* Section divider typography */
.section-number { font-size: clamp(4rem, 10vw, 8rem); font-weight: 900; color: rgba(255,126,8,0.08); line-height: 1; margin-bottom: -20px; }
.section-title { font-size: clamp(2rem, 5vw, 3.5rem); font-weight: 800; }

/* Brand */
.sofka-brand { position: fixed; top: 16px; left: 24px; z-index: 100; }
.sofka-logo { font-family: var(--font-display); font-size: 1.5rem; font-weight: 700; color: var(--sofka-orange); letter-spacing: -1px; }

/* Progress bar */
.deck-progress { position: fixed; top: 0; left: 0; height: 3px; background: linear-gradient(90deg, var(--sofka-orange), var(--sofka-gold)); z-index: 200; transition: width 400ms ease; box-shadow: 0 0 6px rgba(255,126,8,0.3); }

/* Controls: pill-shaped, frosted glass */
.deck-controls { position: fixed; bottom: 20px; left: 50%; transform: translateX(-50%); display: flex; align-items: center; gap: 14px; z-index: 100; background: rgba(26,26,46,0.88); backdrop-filter: blur(12px); padding: 8px 18px; border-radius: 100px; border: 1px solid rgba(255,255,255,0.08); }
.deck-arrow { width: 34px; height: 34px; border-radius: 50%; border: 1px solid rgba(255,255,255,0.12); background: rgba(255,255,255,0.04); color: var(--sofka-gray-300); cursor: pointer; display: flex; align-items: center; justify-content: center; }
.deck-arrow:hover { border-color: var(--sofka-orange); color: var(--sofka-orange); }
.deck-arrow:disabled { opacity: 0.25; cursor: not-allowed; }
.deck-counter { font-size: .72rem; color: var(--sofka-gray-500); font-weight: 600; font-variant-numeric: tabular-nums; }

/* Speaker Notes toggle */
.deck-notes-toggle { width: 34px; height: 34px; border-radius: 50%; border: 1px solid rgba(255,255,255,0.08); background: transparent; color: var(--sofka-gray-500); cursor: pointer; display: flex; align-items: center; justify-content: center; }
.deck-notes-toggle.active { color: var(--sofka-orange); background: rgba(255,126,8,0.1); border-color: rgba(255,126,8,0.3); }

/* Speaker Notes panel */
.speaker-notes { position: fixed; bottom: 0; left: 0; right: 0; background: rgba(0,0,0,0.92); backdrop-filter: blur(12px); border-top: 1px solid rgba(255,126,8,0.2); padding: 14px 24px; font-size: .82rem; color: var(--sofka-gray-300); z-index: 200; transform: translateY(100%); transition: transform 300ms ease; max-height: 30vh; overflow-y: auto; }
.speaker-notes.visible { transform: translateY(0); }
.speaker-notes-label { font-size: .65rem; font-weight: 700; text-transform: uppercase; letter-spacing: 0.1em; color: var(--sofka-orange); margin-bottom: 6px; }
```

**Required JS (production):**
```javascript
(function() {
  'use strict';
  const slides = document.querySelectorAll('.deck-slide');
  const total = slides.length;
  let current = 0;
  let notesVisible = false;
  let touchStartX = 0;

  function go(index) {
    if (index < 0 || index >= total) return;
    slides[current].classList.remove('active');
    if (index > current) slides[current].classList.add('exit-left');
    current = index;
    slides.forEach((s, i) => { s.classList.remove('active', 'exit-left'); if (i === current) s.classList.add('active'); });
    document.getElementById('deckCounter').textContent = `${current + 1} / ${total}`;
    document.getElementById('deckPrev').disabled = current === 0;
    document.getElementById('deckNext').disabled = current === total - 1;
    document.getElementById('deckProgress').style.width = `${((current + 1) / total) * 100}%`;
    document.getElementById('notesContent').textContent = slides[current].getAttribute('data-notes') || 'Sin notas.';
  }

  document.getElementById('deckPrev').addEventListener('click', () => go(current - 1));
  document.getElementById('deckNext').addEventListener('click', () => go(current + 1));

  function toggleNotes() {
    notesVisible = !notesVisible;
    document.getElementById('speakerNotes').classList.toggle('visible', notesVisible);
    document.getElementById('notesToggle').classList.toggle('active', notesVisible);
  }
  document.getElementById('notesToggle').addEventListener('click', toggleNotes);

  // Keyboard: ← → Space PageUp PageDown N F Home End
  document.addEventListener('keydown', (e) => {
    switch(e.key) {
      case 'ArrowRight': case 'ArrowDown': case ' ': case 'PageDown': e.preventDefault(); go(current + 1); break;
      case 'ArrowLeft': case 'ArrowUp': case 'PageUp': e.preventDefault(); go(current - 1); break;
      case 'Home': e.preventDefault(); go(0); break;
      case 'End': e.preventDefault(); go(total - 1); break;
      case 'n': case 'N': e.preventDefault(); toggleNotes(); break;
      case 'f': case 'F': e.preventDefault();
        if (!document.fullscreenElement) document.documentElement.requestFullscreen();
        else document.exitFullscreen(); break;
    }
  });

  // Touch swipe
  document.addEventListener('touchstart', (e) => { touchStartX = e.changedTouches[0].screenX; }, { passive: true });
  document.addEventListener('touchend', (e) => {
    const diff = touchStartX - e.changedTouches[0].screenX;
    if (Math.abs(diff) > 50) { diff > 0 ? go(current + 1) : go(current - 1); }
  }, { passive: true });

  go(0);
})();
```

**Slide structure pattern (20-25 slides):**

| # | Type | Theme | Purpose |
|---|------|-------|---------|
| 1 | Portada | `theme-hero` | Title + 4 stats + meta badges |
| 2 | Agenda | `theme-dark` | 8 items grid (icon + label + desc) |
| 3 | Section divider | `theme-section` | "01" + "Contexto" |
| 4-5 | Content | `theme-dark-warm` | Context details, tables |
| 6 | Section divider | `theme-section` | "02" + "Estado Actual" |
| 7-9 | Content | `theme-dark-red` | AS-IS, pain points, cost of inaction |
| 10 | Section divider | `theme-section` | "03" + "Hallazgos" |
| 11-12 | Content | `theme-dark-cool` | Technical findings, IA opportunities |
| 13 | Section divider | `theme-section` | "04" + "La Solución" |
| 14-16 | Content | `theme-dark-green` | Scenario selected, RFs, design maturity |
| 17 | Value comparison | `theme-dark-warm` | Before/after table |
| 18 | Section divider | `theme-section` | "05" + "Roadmap" |
| 19 | Content | `theme-dark-cool` | Timeline + phases table |
| 20 | Section divider | `theme-section` | "06" + "Alcance" |
| 21 | Content | `theme-dark-warm` | What gets built: RFs, screens, APIs, integrations |
| 22-23 | Content | `theme-dark-red` / `theme-dark` | Risks, prerequisites |
| 24 | Section divider | `theme-section` | "07" + "Próximos Pasos" |
| 25 | CTA / Cierre | `theme-cta` | "¿Preguntas?" + stats + `sofka_` footer |

**Speaker notes:** Every `data-notes` attribute contains what the presenter should SAY — context, emphasis points, pauses, transitions. Write in first person plural ("Aquí vemos..."), practical language.

**CRITICAL — Alcance slide:** Express magnitude in RFs, pantallas, APIs, integraciones, reglas de negocio. NEVER in FTE-meses or cost.

---

### Shared Dark-Slide Components (carousel + slides)

These components work on both dark backgrounds:

```css
/* Cards grid */
.grid { display: grid; gap: 14px; margin-top: 20px; }
.grid--2 { grid-template-columns: repeat(2, 1fr); }
.grid--3 { grid-template-columns: repeat(3, 1fr); }
.c { background: rgba(255,255,255,0.04); border: 1px solid rgba(255,255,255,0.07); border-radius: 10px; padding: 18px 20px; transition: var(--transition-base); }
.c:hover { background: rgba(255,255,255,0.06); border-color: rgba(255,126,8,0.18); transform: translateY(-1px); }
.c-label { font-size: 0.8rem; font-weight: 700; color: var(--sofka-orange); }
.c-value { font-size: 1.3rem; font-weight: 800; color: var(--sofka-white); }
.c-text { font-size: 0.82rem; color: var(--sofka-gray-400); line-height: 1.5; }

/* Stats row */
.stats { display: flex; gap: 28px; flex-wrap: wrap; }
.stat-n { font-size: clamp(1.8rem, 3.5vw, 2.8rem); font-weight: 900; color: var(--sofka-orange); }
.stat-u { font-size: 0.8rem; color: var(--sofka-gray-400); }

/* Mini table */
.tbl { width: 100%; border-collapse: collapse; font-size: 0.85rem; }
.tbl thead th { background: rgba(255,126,8,0.12); color: var(--sofka-orange-light); padding: 9px 12px; text-align: left; font-weight: 700; font-size: 0.75rem; text-transform: uppercase; border-bottom: 2px solid rgba(255,126,8,0.25); }
.tbl tbody td { padding: 9px 12px; border-bottom: 1px solid rgba(255,255,255,0.05); color: var(--sofka-gray-200); }
.tbl .hl { color: var(--sofka-orange); font-weight: 700; }
.tbl .gl { color: var(--sofka-gold); font-weight: 700; }

/* Pain list */
.pains { list-style: none; }
.pains li { display: flex; gap: 12px; padding: 12px 0; border-bottom: 1px solid rgba(255,255,255,0.05); }
.pain-i { flex-shrink: 0; width: 28px; height: 28px; border-radius: 6px; background: rgba(239,68,68,0.1); display: flex; align-items: center; justify-content: center; }

/* Callout */
.callout { padding: 14px 18px; border-radius: 8px; font-size: 0.85rem; }
.callout--orange { background: rgba(255,126,8,0.06); border: 1px solid rgba(255,126,8,0.12); }
.callout--gold { background: rgba(255,215,0,0.05); border: 1px solid rgba(255,215,0,0.12); }

/* Two-column layout */
.two-col { display: grid; grid-template-columns: 1fr 1fr; gap: 32px; }

/* Timeline */
.tl { display: flex; position: relative; }
.tl::before { content: ''; position: absolute; top: 26px; left: 0; right: 0; height: 3px; background: var(--sofka-gray-700); }
.tl-item { flex: 1; text-align: center; position: relative; z-index: 1; }
.tl-dot { width: 14px; height: 14px; border-radius: 50%; background: var(--sofka-orange); margin: 20px auto 10px; box-shadow: 0 0 0 3px rgba(255,126,8,0.2); }

/* Responsive */
@media (max-width: 768px) { .grid--2, .grid--3 { grid-template-columns: 1fr; } .two-col { grid-template-columns: 1fr; } .tl { flex-direction: column; } .tl::before { display: none; } }
@media (prefers-reduced-motion: reduce) { .deck-slide, .carousel-track, .c { transition: none; } }
@media print { body { background: white; color: black; overflow: visible; height: auto; } .slide, .deck-slide { position: static; opacity: 1; transform: none; min-width: auto; height: auto; page-break-after: always; } .carousel-nav, .deck-controls, .sofka-brand, .progress-bar, .deck-progress, .speaker-notes { display: none; } }
```

## Contrast Rules (NON-NEGOTIABLE)

Same as all DS v5 documents:
- Body: `#FFFFFF` bg, `--sofka-gray-900` text
- Cards/TOC: `--sofka-gray-50` bg
- Tables: `--sofka-gray-900` header bg with white text, `--sofka-gray-100` cell bg
- Mermaid: `theme: 'base'`, light fills, `#000000` text
- Success = gold `#FFD700`, NEVER green
- NEVER white text on crema/light backgrounds

## Error Protocol

- Missing content source → abort with clear error message
- Content source empty → abort, do not generate skeleton-only HTML
- Mermaid syntax error → wrap in code block with warning comment, continue
- File exceeds 500KB → warn, suggest splitting, still save
- Missing font CDN access → fallback to system fonts, flag degraded output
