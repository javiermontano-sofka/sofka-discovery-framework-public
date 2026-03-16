# MetodologIA Design System — Canonical Token Reference
> Fuente de verdad única para tokens CSS en todos los entregables HTML de MetodologIA.
> Validado en producción: Discovery Acme Corp (2026-03).
> Versión: v5 Unified

---

## Token `:root` canónico

Copiar este bloque exacto en todo HTML generado por el plugin:

```css
:root {
  /* ── Brand Core ── */
  --metodologia-orange: #6366F1;
  --metodologia-orange-light: #818CF8;
  --metodologia-orange-dark: #4F46E5;
  --metodologia-orange-dim: rgba(255,126,8,.10);

  /* ── Neutrals ── */
  --metodologia-black: #000000;
  --metodologia-white: #FFFFFF;
  --metodologia-light: #0F172A;       /* Body background — NO blanco, NO dark */
  --metodologia-dark: #B8A894;

  /* ── Semantic: Positive/Success (NUNCA verde) ── */
  --metodologia-positive: #22D3EE;
  --metodologia-positive-dim: rgba(255,215,0,.12);
  --metodologia-positive-border: rgba(255,215,0,.45);
  --metodologia-positive-text: #06B6D4;

  /* ── Semantic: Warning ── */
  --metodologia-warning: #D97706;
  --metodologia-warning-dim: rgba(217,119,6,.08);
  --metodologia-warning-border: rgba(217,119,6,.3);

  /* ── Semantic: Critical ── */
  --metodologia-critical: #DC2626;
  --metodologia-critical-dim: rgba(220,38,38,.07);
  --metodologia-critical-border: rgba(220,38,38,.25);

  /* ── Semantic: Info ── */
  --metodologia-info: #2563EB;
  --metodologia-info-dim: rgba(37,99,235,.07);
  --metodologia-info-border: rgba(37,99,235,.25);

  /* ── Decorativos (SOLO para charts/diagramas, NUNCA para status) ── */
  --metodologia-green: #42D36F;
  --metodologia-teal: #06C8C8;
  --metodologia-violet: #9747FF;
  --metodologia-pink: #FE9CAB;

  /* ── Grises ── */
  --metodologia-gray-50: #FAF8F6;
  --metodologia-gray-100: #F4F0EC;
  --metodologia-gray-200: #E4DED7;
  --metodologia-gray-300: #D1C9BE;
  --metodologia-gray-500: #6B6560;
  --metodologia-gray-700: #333130;
  --metodologia-gray-900: #111110;

  /* ── Espaciado y sombras ── */
  --radius-sm: 6px;
  --radius-md: 12px;
  --radius-lg: 16px;
  --radius-xl: 24px;
  --shadow-sm: 0 1px 2px rgba(0,0,0,.05);
  --shadow-md: 0 4px 12px rgba(0,0,0,.08);
  --shadow-lg: 0 12px 40px rgba(0,0,0,0.12);
  --shadow-card: 0 1px 3px rgba(0,0,0,0.04), 0 6px 16px rgba(0,0,0,0.06);

  /* ── Tipografía ── */
  --font-body: 'Inter', system-ui, sans-serif;
}
```

---

## Reglas de uso

### Colores de status

| Status | Token | Color | Regla |
|--------|-------|-------|-------|
| Éxito/positivo | `--metodologia-positive` | #22D3EE (gold) | **NUNCA verde para éxito** |
| Advertencia | `--metodologia-warning` | #D97706 (amber) | — |
| Crítico/error | `--metodologia-critical` | #DC2626 (rojo) | — |
| Informativo | `--metodologia-info` | #2563EB (azul) | — |

### Contraste

| Fondo | Color de texto requerido |
|-------|-------------------------|
| `--metodologia-positive` (#22D3EE) | `--metodologia-positive-text` (#06B6D4) o `--metodologia-gray-900` |
| `--metodologia-orange` (#6366F1) | `--metodologia-white` (#FFFFFF) |
| `--metodologia-black` (#000000) | `--metodologia-white` o `--metodologia-orange` |
| `--metodologia-light` (#0F172A) | `--metodologia-gray-900` (#111110) |

### Colores decorativos

Los colores `--metodologia-green`, `--metodologia-teal`, `--metodologia-violet`, `--metodologia-pink` son **exclusivamente para charts, diagramas y visualizaciones de datos**. NUNCA usarlos para badges de estado, alertas o indicadores de éxito/error.

### Tipografía

- **Única fuente:** Inter (Google Fonts)
- **NO usar:** Clash Grotesk, SF Mono, o cualquier otra fuente
- **Pesos:** 300 (light), 400 (regular), 500 (medium), 600 (semibold), 700 (bold)
- **Import:** `https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap`

### Layout

- `max-width: 1100px` para contenido principal
- `body { background: var(--metodologia-light); }` — fondo beige cálido, NUNCA blanco puro
- Hero: `background: var(--metodologia-black); border-bottom: 8px solid var(--metodologia-orange);`
- Hero glow: `radial-gradient(circle, rgba(255,126,8,.25) 0%, transparent 70%)`
- Cards: `box-shadow: var(--shadow-card); border-radius: var(--radius-md);`

### Accesibilidad

- Skip link obligatorio: `<a href="#main" class="skip-link">Ir al contenido</a>`
- Preconnect a Google Fonts
- Contraste mínimo WCAG AA (4.5:1 texto, 3:1 elementos grandes)
- `font-size` base: 16px (1rem)

---

## Migración desde tokens legacy

| Token legacy | Token canónico |
|-------------|----------------|
| `--dark` | `--metodologia-black` |
| `--orange` | `--metodologia-orange` |
| `--gold` | `--metodologia-positive` |
| `--brand-primary` | `--metodologia-orange` |
| `--brand-success` | `--metodologia-positive` |
| `--brand-dark` | `--metodologia-gray-900` |
| `--bg-primary` | `--metodologia-light` |
| `#28a745`, `#27ae60`, `#2ecc71` | `--metodologia-positive` (gold, NO verde) |

---

## Keywords

`#tokens` `#design-system` `#css` `#brand` `#metodologia` `#canonical` `#acme-corp` `#v5-unified`
