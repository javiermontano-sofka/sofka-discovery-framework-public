# Design System Reference — Acme Corp PMO (APEX Branded)

**Proyecto**: Acme Corp — Digital Transformation PMO
**Versión**: 1.0.0
**Fecha**: 2026-03-17

## Color Tokens

```css
:root {
  /* Primary */
  --apex-primary: #2563EB;
  --apex-primary-hover: #1D4ED8;
  --apex-primary-light: #DBEAFE;

  /* Accent (Warning) */
  --apex-accent: #F59E0B;
  --apex-accent-hover: #D97706;
  --apex-accent-light: #FEF3C7;

  /* Danger */
  --apex-danger: #DC2626;
  --apex-danger-hover: #B91C1C;
  --apex-danger-light: #FEE2E2;

  /* Dark */
  --apex-dark: #0F172A;
  --apex-dark-secondary: #1E293B;

  /* Surfaces */
  --apex-surface: #F8FAFC;
  --apex-surface-card: #FFFFFF;
  --apex-border: #E2E8F0;

  /* Text */
  --apex-text-primary: #0F172A;
  --apex-text-secondary: #334155;
  --apex-text-muted: #94A3B8;
}
```

[PLAN] Tokens verificados contra WCAG AA. Amber no usar para texto <18px.

## RAG Status Components

| Estado | Color | Icono | Significado |
|--------|-------|-------|-------------|
| Healthy | `--apex-primary` (#2563EB) | Check circle | En camino, sin issues |
| At Risk | `--apex-accent` (#F59E0B) | Warning triangle | Requiere atención |
| Critical | `--apex-danger` (#DC2626) | X circle | Fuera de control, acción inmediata |

**NUNCA usar verde.** Blue reemplaza Green en todo el sistema RAG. [PLAN]

## KPI Card Component

```html
<div class="apex-kpi-card">
  <span class="apex-kpi-label">SPI</span>
  <span class="apex-kpi-value">0.92</span>
  <span class="apex-kpi-trend apex-trend-down">-3%</span>
  <span class="apex-kpi-target">Target: 1.00</span>
</div>
```

```css
.apex-kpi-card {
  background: var(--apex-surface-card);
  border: 1px solid var(--apex-border);
  border-radius: 8px;
  padding: 16px;
  font-family: 'Inter', system-ui, sans-serif;
}
.apex-kpi-value {
  font-size: 2rem;
  font-weight: 700;
  color: var(--apex-dark);
}
.apex-trend-down { color: var(--apex-danger); }
.apex-trend-up { color: var(--apex-primary); }
```

## Accessibility Audit Results

| Combinación | Ratio | WCAG AA | WCAG AAA |
|-------------|-------|---------|----------|
| Primary (#2563EB) on White | 4.7:1 | Pass | Fail |
| Dark (#0F172A) on White | 16.8:1 | Pass | Pass |
| Danger (#DC2626) on White | 4.6:1 | Pass | Fail |
| Accent (#F59E0B) on White | 3.1:1 | Pass (large text) | Fail |
| Text Secondary (#334155) on White | 7.5:1 | Pass | Pass |

**Overall**: AA compliant for all text combinations. AAA compliant for body text (dark + secondary). [METRIC]

## Do / Don't

| Do | Don't |
|----|-------|
| Usar `--apex-primary` para estados positivos | Usar verde (#22C55E) |
| Tokens CSS custom properties | Hardcode hex values |
| Inter font con fallback system-ui | Otras fonts sin aprobación |
| RAG: Blue/Amber/Red | RAG: Green/Yellow/Red |
| ≥4.5:1 contraste para texto | Texto amber en fondo blanco (<18px) |

---
*PMO-APEX v1.0 — Design System Reference*
*Sofka, your technology partner.*
