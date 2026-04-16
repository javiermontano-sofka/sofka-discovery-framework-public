# MetodologIA Design System — Canonical Token Reference
> Fuente de verdad unica para tokens CSS en todos los entregables HTML de MetodologIA.
> Estetica: **Neo-Swiss Clean & Soft Explainer**
> Single Source of Truth: `references/brand-config-neoswiss.json`
> Version: v6.0 Neo-Swiss
> Actualizado: 2026-03-17

---

## IMPORTANT

The canonical source for ALL brand tokens is `references/brand-config-neoswiss.json`.
This file documents the CSS implementation. If conflict, JSON wins.

---

## Token `:root` canonico

Copiar este bloque exacto en todo HTML generado por el plugin:

```css
:root {
  /* ── Brand Core (Neo-Swiss) ── */
  --navy: #122562;
  --gold: #FFD700;
  --blue: #137DC5;
  --dark: #1F2833;
  --lavender: #BBA0CC;
  --gray: #808080;
  --white: #FFFFFF;
  --off-white: #F8F9FC;
  --light-gray: #E8EAF0;

  /* ── Semantic States ── */
  --positive: #137DC5;
  --warning: #D97706;
  --critical: #DC2626;

  /* ── Typography ── */
  --font-title: 'Poppins', 'Segoe UI', sans-serif;
  --font-body: 'Trebuchet MS', 'Lucida Sans', sans-serif;
  --font-note: 'Futura', 'Century Gothic', 'Trebuchet MS', sans-serif;

  /* ── Spacing (Swiss 8px Grid) ── */
  --sp-1: 8px;
  --sp-2: 16px;
  --sp-3: 24px;
  --sp-4: 32px;
  --sp-5: 40px;
  --sp-6: 48px;
  --sp-8: 64px;
  --sp-10: 80px;

  /* ── Shadows (navy-tinted, NOT black) ── */
  --shadow-sm: 0 1px 3px rgba(18,37,98,.06);
  --shadow-md: 0 4px 16px rgba(18,37,98,.08);
  --shadow-lg: 0 8px 32px rgba(18,37,98,.10);
  --shadow-card: 0 2px 8px rgba(18,37,98,.05), 0 8px 24px rgba(18,37,98,.06);

  /* ── Border Radius ── */
  --radius-sm: 8px;
  --radius-md: 12px;
  --radius-lg: 16px;
  --radius-xl: 24px;
}
```

---

## Reglas de uso

### Colores de status

| Status | Token | Color | Regla |
|--------|-------|-------|-------|
| Exito/positivo | `--positive` / `--blue` | #137DC5 (blue) | **NUNCA verde para exito** |
| Advertencia | `--warning` | #D97706 (amber) | — |
| Critico/error | `--critical` | #DC2626 (rojo) | — |
| Acento/CTA | `--gold` | #FFD700 (gold) | Hero highlights, emphasis, badges |

### Contraste

| Fondo | Color de texto requerido | Ratio |
|-------|-------------------------|-------|
| `--navy` (#122562) | `--white` (#FFFFFF) | 12.4:1 ✓ |
| `--navy` (#122562) | `--gold` (#FFD700) | 8.9:1 ✓ |
| `--off-white` (#F8F9FC) | `--dark` (#1F2833) | 11.2:1 ✓ |
| `--off-white` (#F8F9FC) | `--navy` (#122562) | 11.8:1 ✓ |
| `--white` (#FFFFFF) | `--dark` (#1F2833) | 12.5:1 ✓ |

### Tipografia

- **Titulos/headings:** Poppins (Google Fonts) — weights 400-800
- **Body:** Trebuchet MS — system font, no CDN needed
- **Notas/footnotes:** Futura / Century Gothic — system font fallback
- **Import:** `https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap`

### Layout

- `max-width: 1100px` para contenido principal
- `body { background: var(--off-white); }` — fondo off-white #F8F9FC
- Hero: `background: var(--navy); border-bottom: 6px solid var(--gold);`
- Footer: `background: var(--navy); border-top: 4px solid var(--gold);`
- Cards: `box-shadow: var(--shadow-card); border-radius: var(--radius-md);`
- Swiss 8px grid for all spacing

### Accesibilidad

- Skip link obligatorio: `<a href="#main" class="skip-link">Ir al contenido</a>`
- Preconnect a Google Fonts
- Contraste minimo WCAG AA (4.5:1 texto, 3:1 elementos grandes)
- `font-size` base: 16px (1rem)

---

## Migracion desde tokens legacy

| Token legacy | Token Neo-Swiss |
|-------------|-----------------|
| `--metodologia-orange` (#6366F1) | `--navy` (#122562) or `--gold` (#FFD700) |
| `--metodologia-positive` (#22D3EE) | `--positive` (#137DC5) |
| `--metodologia-black` (#000000) | `--navy` (#122562) |
| `--metodologia-light` (#0F172A) | `--off-white` (#F8F9FC) |
| `--font-display` (Clash Grotesk) | `--font-title` (Poppins) |
| `--font-body` (Inter) | `--font-body` (Trebuchet MS) |
| `rgba(0,0,0,...)` shadows | `rgba(18,37,98,...)` shadows |
| `#1A1A2E` body bg | `#F8F9FC` body bg |
| `#0A122A` deep navy | `#122562` navy |
| Montserrat body | Trebuchet MS body |

---

## Tokens BANNED (Legacy — NEVER Use)

| Token | Era | Replaced By |
|-------|-----|-------------|
| `#6366F1` | DS v4/v5 indigo primary | `#122562` navy |
| `#22D3EE` | DS v4/v5 cyan success | `#137DC5` blue |
| `#1A1A2E` | DS v4/v5 dark bg | `#F8F9FC` off-white / `#122562` navy |
| `#0F172A` | DS v4/v5 body bg | `#F8F9FC` off-white |
| `#0A122A` | DS brand v1 navy | `#122562` navy |
| Clash Grotesk | DS v4/v5 display | Poppins |
| Inter | DS v4/v5 body | Trebuchet MS |
| Montserrat | DS brand v1 body | Trebuchet MS |

---

## Keywords

`#tokens` `#design-system` `#css` `#brand` `#metodologia` `#canonical` `#neo-swiss` `#v6`
