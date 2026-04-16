# Sofka Design System — Canonical Token Reference
> Fuente de verdad única para tokens CSS en todos los entregables HTML de Sofka.
> Validado en producción: Discovery Bancoomeva (2026-03).
> Versión: v5 Unified

---

## Token `:root` canónico

Copiar este bloque exacto en todo HTML generado por el plugin:

```css
:root {
  /* ── Brand Core ── */
  --sofka-orange: #FF7E08;
  --sofka-orange-light: #FF9E42;
  --sofka-orange-dark: #CC6506;
  --sofka-orange-dim: rgba(255,126,8,.10);

  /* ── Neutrals ── */
  --sofka-black: #000000;
  --sofka-white: #FFFFFF;
  --sofka-light: #EFEAE4;       /* Body background — NO blanco, NO dark */
  --sofka-dark: #B8A894;

  /* ── Semantic: Positive/Success (NUNCA verde) ── */
  --sofka-positive: #FFD700;
  --sofka-positive-dim: rgba(255,215,0,.12);
  --sofka-positive-border: rgba(255,215,0,.45);
  --sofka-positive-text: #B8860B;

  /* ── Semantic: Warning ── */
  --sofka-warning: #D97706;
  --sofka-warning-dim: rgba(217,119,6,.08);
  --sofka-warning-border: rgba(217,119,6,.3);

  /* ── Semantic: Critical ── */
  --sofka-critical: #DC2626;
  --sofka-critical-dim: rgba(220,38,38,.07);
  --sofka-critical-border: rgba(220,38,38,.25);

  /* ── Semantic: Info ── */
  --sofka-info: #2563EB;
  --sofka-info-dim: rgba(37,99,235,.07);
  --sofka-info-border: rgba(37,99,235,.25);

  /* ── Decorativos (SOLO para charts/diagramas, NUNCA para status) ── */
  --sofka-green: #42D36F;
  --sofka-teal: #06C8C8;
  --sofka-violet: #9747FF;
  --sofka-pink: #FE9CAB;

  /* ── Grises ── */
  --sofka-gray-50: #FAF8F6;
  --sofka-gray-100: #F4F0EC;
  --sofka-gray-200: #E4DED7;
  --sofka-gray-300: #D1C9BE;
  --sofka-gray-500: #6B6560;
  --sofka-gray-700: #333130;
  --sofka-gray-900: #111110;

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
| Éxito/positivo | `--sofka-positive` | #FFD700 (gold) | **NUNCA verde para éxito** |
| Advertencia | `--sofka-warning` | #D97706 (amber) | — |
| Crítico/error | `--sofka-critical` | #DC2626 (rojo) | — |
| Informativo | `--sofka-info` | #2563EB (azul) | — |

### Contraste

| Fondo | Color de texto requerido |
|-------|-------------------------|
| `--sofka-positive` (#FFD700) | `--sofka-positive-text` (#B8860B) o `--sofka-gray-900` |
| `--sofka-orange` (#FF7E08) | `--sofka-white` (#FFFFFF) |
| `--sofka-black` (#000000) | `--sofka-white` o `--sofka-orange` |
| `--sofka-light` (#EFEAE4) | `--sofka-gray-900` (#111110) |

### Colores decorativos

Los colores `--sofka-green`, `--sofka-teal`, `--sofka-violet`, `--sofka-pink` son **exclusivamente para charts, diagramas y visualizaciones de datos**. NUNCA usarlos para badges de estado, alertas o indicadores de éxito/error.

### Tipografía

- **Única fuente:** Inter (Google Fonts)
- **NO usar:** Clash Grotesk, SF Mono, o cualquier otra fuente
- **Pesos:** 300 (light), 400 (regular), 500 (medium), 600 (semibold), 700 (bold)
- **Import:** `https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap`

### Layout

- `max-width: 1100px` para contenido principal
- `body { background: var(--sofka-light); }` — fondo beige cálido, NUNCA blanco puro
- Hero: `background: var(--sofka-black); border-bottom: 8px solid var(--sofka-orange);`
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
| `--dark` | `--sofka-black` |
| `--orange` | `--sofka-orange` |
| `--gold` | `--sofka-positive` |
| `--brand-primary` | `--sofka-orange` |
| `--brand-success` | `--sofka-positive` |
| `--brand-dark` | `--sofka-gray-900` |
| `--bg-primary` | `--sofka-light` |
| `#28a745`, `#27ae60`, `#2ecc71` | `--sofka-positive` (gold, NO verde) |

---

## Keywords

`#tokens` `#design-system` `#css` `#brand` `#sofka` `#canonical` `#bancoomeva` `#v5-unified`
