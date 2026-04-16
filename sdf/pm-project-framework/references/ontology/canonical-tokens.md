# APEX Design System — Canonical Token Reference

> Fuente de verdad unica para tokens CSS en todos los entregables HTML de PMO-APEX.
> Patron visual: Blue Authority — precision, datos, decision.
> Version: v1 Unified

---

## Token `:root` canonico

Copiar este bloque exacto en todo HTML generado por el plugin:

```css
:root {
  /* -- Brand Core -- */
  --apex-primary: #2563EB;
  --apex-primary-light: #3B82F6;
  --apex-primary-dark: #1D4ED8;
  --apex-primary-dim: rgba(37,99,235,.10);

  /* -- Neutrals -- */
  --apex-black: #000000;
  --apex-white: #FFFFFF;
  --apex-light: #F1F5F9;         /* Body background — slate-100 */
  --apex-dark: #0F172A;          /* Headers, hero — slate-900 */

  /* -- Semantic: Positive/Success (NUNCA verde) -- */
  --apex-positive: #F59E0B;
  --apex-positive-dim: rgba(245,158,11,.12);
  --apex-positive-border: rgba(245,158,11,.45);
  --apex-positive-text: #92400E;

  /* -- Semantic: Warning -- */
  --apex-warning: #F97316;
  --apex-warning-dim: rgba(249,115,22,.08);
  --apex-warning-border: rgba(249,115,22,.3);

  /* -- Semantic: Critical -- */
  --apex-critical: #DC2626;
  --apex-critical-dim: rgba(220,38,38,.07);
  --apex-critical-border: rgba(220,38,38,.25);

  /* -- Semantic: Info -- */
  --apex-info: #06B6D4;
  --apex-info-dim: rgba(6,182,212,.07);
  --apex-info-border: rgba(6,182,212,.25);

  /* -- Semantic: Accent -- */
  --apex-accent: #8B5CF6;
  --apex-accent-dim: rgba(139,92,246,.08);
  --apex-accent-border: rgba(139,92,246,.3);

  /* -- Decorativos (SOLO para charts/diagramas, NUNCA para status) -- */
  --apex-chart-1: #2563EB;
  --apex-chart-2: #F59E0B;
  --apex-chart-3: #8B5CF6;
  --apex-chart-4: #06B6D4;
  --apex-chart-5: #F97316;
  --apex-chart-6: #EC4899;

  /* -- Grises (Slate scale) -- */
  --apex-gray-50: #F8FAFC;
  --apex-gray-100: #F1F5F9;
  --apex-gray-200: #E2E8F0;
  --apex-gray-300: #CBD5E1;
  --apex-gray-400: #94A3B8;
  --apex-gray-500: #64748B;
  --apex-gray-600: #475569;
  --apex-gray-700: #334155;
  --apex-gray-800: #1E293B;
  --apex-gray-900: #0F172A;

  /* -- Espaciado y sombras -- */
  --radius-sm: 6px;
  --radius-md: 10px;
  --radius-lg: 14px;
  --radius-xl: 20px;
  --shadow-sm: 0 1px 2px rgba(0,0,0,.05);
  --shadow-md: 0 4px 12px rgba(0,0,0,.08);
  --shadow-lg: 0 12px 40px rgba(0,0,0,0.12);
  --shadow-card: 0 1px 3px rgba(0,0,0,0.04), 0 6px 16px rgba(0,0,0,0.06);

  /* -- Tipografia -- */
  --font-body: 'Inter', system-ui, sans-serif;
  --font-code: 'JetBrains Mono', monospace;
  --font-metrics: 'Inter', system-ui, sans-serif;
}
```

---

## Reglas de uso

### Colores de status

| Status | Token | Color | Regla |
|--------|-------|-------|-------|
| Exito/positivo | `--apex-positive` | #F59E0B (ambar) | **NUNCA verde para exito** |
| Advertencia | `--apex-warning` | #F97316 (naranja) | — |
| Critico/error | `--apex-critical` | #DC2626 (rojo) | — |
| Informativo | `--apex-info` | #06B6D4 (cyan) | — |
| Acento | `--apex-accent` | #8B5CF6 (violeta) | Para highlights y elementos especiales |

### RAG Status (Project Health)

| RAG | Token | Color | Significado PM |
|-----|-------|-------|---------------|
| Green (on track) | `--apex-positive` | #F59E0B (ambar) | Proyecto en buen estado |
| Amber (at risk) | `--apex-warning` | #F97316 (naranja) | Proyecto en riesgo |
| Red (off track) | `--apex-critical` | #DC2626 (rojo) | Proyecto fuera de control |

> **Nota:** En APEX el "verde" de RAG se representa con ambar. Esto es intencional para mantener consistencia con la regla de "nunca verde para exito".

### Contraste

| Fondo | Color de texto requerido |
|-------|-------------------------|
| `--apex-positive` (#F59E0B) | `--apex-positive-text` (#92400E) o `--apex-gray-900` |
| `--apex-primary` (#2563EB) | `--apex-white` (#FFFFFF) |
| `--apex-dark` (#0F172A) | `--apex-white` o `--apex-primary-light` |
| `--apex-light` (#F1F5F9) | `--apex-gray-900` (#0F172A) |
| `--apex-white` | `--apex-gray-900` (#0F172A) |

### Colores decorativos

Los colores `--apex-chart-*` son **exclusivamente para charts, diagramas, graficas EVM y visualizaciones de datos**. NUNCA usarlos para badges de estado, alertas o indicadores de exito/error.

### Tipografia

- **Fuente principal:** Inter (Google Fonts)
- **Fuente de codigo:** JetBrains Mono
- **NO usar:** Clash Grotesk, SF Mono, o cualquier otra fuente
- **Pesos:** 300 (light), 400 (regular), 500 (medium), 600 (semibold), 700 (bold)
- **Import:** `https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap`
- **Metricas grandes:** font-size 2rem+, font-weight 700, color `--apex-primary`

### Layout

- `max-width: 1100px` para contenido principal
- `body { background: var(--apex-light); }` — fondo slate claro, NUNCA blanco puro
- Hero: `background: var(--apex-dark); border-bottom: 4px solid var(--apex-primary);`
- Hero glow: `radial-gradient(circle, rgba(37,99,235,.20) 0%, transparent 70%)`
- Cards: `box-shadow: var(--shadow-card); border-radius: var(--radius-md); background: var(--apex-white);`
- KPI cards: `border-left: 4px solid var(--apex-primary);`
- Dashboard panels: `background: var(--apex-white); border: 1px solid var(--apex-gray-200);`

### Accesibilidad

- Skip link obligatorio: `<a href="#main" class="skip-link">Ir al contenido</a>`
- Preconnect a Google Fonts
- Contraste minimo WCAG AA (4.5:1 texto, 3:1 elementos grandes)
- `font-size` base: 16px (1rem)
- Focus visible en todos los elementos interactivos
- Alt text en todas las imagenes y graficas
- Roles ARIA en componentes de dashboard

---

## Componentes especificos de PM

### KPI Card

```css
.kpi-card {
  background: var(--apex-white);
  border-left: 4px solid var(--apex-primary);
  border-radius: var(--radius-md);
  box-shadow: var(--shadow-card);
  padding: 1.5rem;
}
.kpi-value {
  font-size: 2.5rem;
  font-weight: 700;
  color: var(--apex-primary);
  font-family: var(--font-metrics);
}
.kpi-label {
  font-size: 0.875rem;
  color: var(--apex-gray-500);
  text-transform: uppercase;
  letter-spacing: 0.05em;
}
```

### EVM Chart Colors

```css
.evm-pv { color: var(--apex-chart-1); } /* Planned Value — blue */
.evm-ev { color: var(--apex-chart-2); } /* Earned Value — amber */
.evm-ac { color: var(--apex-chart-3); } /* Actual Cost — violet */
.evm-bac { color: var(--apex-chart-4); } /* Budget at Completion — cyan */
.evm-eac { color: var(--apex-chart-5); } /* Estimate at Completion — orange */
```

### RAG Badge

```css
.rag-on-track {
  background: var(--apex-positive-dim);
  color: var(--apex-positive-text);
  border: 1px solid var(--apex-positive-border);
}
.rag-at-risk {
  background: var(--apex-warning-dim);
  color: #9A3412;
  border: 1px solid var(--apex-warning-border);
}
.rag-off-track {
  background: var(--apex-critical-dim);
  color: #991B1B;
  border: 1px solid var(--apex-critical-border);
}
```

---

## Migracion desde tokens de otras marcas

| Token Sofka | Token APEX |
|-------------|------------|
| `--sofka-orange` | `--apex-primary` (NO usar naranja en APEX) |
| `--sofka-positive` (#FFD700) | `--apex-positive` (#F59E0B) |
| `--sofka-dark` | `--apex-dark` |
| `--sofka-light` (#EFEAE4) | `--apex-light` (#F1F5F9) |
| `--brand-primary` | `--apex-primary` |
| `--brand-success` | `--apex-positive` |

---

## Keywords

`#tokens` `#design-system` `#css` `#brand` `#apex` `#canonical` `#blue-authority` `#v1-unified`
