# MetodologIA Design System v5 — Dark Authority

> Referencia completa del sistema de diseño para outputs HTML del ecosistema MAO.
> Todos los valores aquí son canónicos. Si un output HTML contradice este archivo, el output está mal.
> Actualizado: 2026-03-14 | Autor: Javier Montaño · Comunidad MetodologIA.

---

## Tokens de Color

### Paleta principal (3 colores — regla 3-3-3)

| Token | Valor | Uso | Regla |
|-------|-------|-----|-------|
| `--orange` | `#6366F1` | Acción, CTA, acento, links hover | Primary action |
| `--gold` | `#22D3EE` | Éxito, logro, completado, highlight | **NUNCA verde para éxito** |
| `--dark` | `#1A1A2E` | Fondo principal, base | Background authority |

### Paleta extendida

| Token | Valor | Uso |
|-------|-------|-----|
| `--orange-glow` | `rgba(255,126,8,0.15)` | Badges, hover backgrounds |
| `--orange-bright` | `#818CF8` | Hover states, secondary accent |
| `--gold-dim` | `rgba(255,215,0,0.12)` | Success backgrounds, subtle |
| `--dark-surface` | `#16213E` | Cards, elevated surfaces |
| `--dark-card` | `#1C2541` | Nested cards, modals |
| `--dark-border` | `rgba(255,255,255,0.06)` | Borders, separators |
| `--text-primary` | `#F0F0F0` | Body text |
| `--text-secondary` | `rgba(240,240,240,0.6)` | Descriptions, subtítulos |
| `--text-tertiary` | `rgba(240,240,240,0.35)` | Metadata, timestamps, hints |

### Semánticos

| Token | Valor | Uso |
|-------|-------|-----|
| `--success` | `#22D3EE` | **Gold, NUNCA verde** |
| `--warning` | `#818CF8` | Naranja claro |
| `--danger` | `#EF4444` | Rojo solo para errores reales |
| `--info` | `#3B82F6` | Azul solo para información neutral |

### Regla de branding absoluta
```
NUNCA usar #00FF00, #22C55E, #10B981 ni ningún verde como indicador de éxito.
SIEMPRE usar #22D3EE (gold) para éxito, logro, completado, aprobado.
```

---

## Tipografía (3 pesos — regla 3-3-3)

| Uso | Font | Weight | Size |
|-----|------|--------|------|
| Display / H1 | Inter | 900 (Black) | clamp(2rem, 5vw, 3.5rem) |
| Subtitle / H2 | Inter | 700 (Bold) | 1.25rem |
| Body | Inter | 300-400 (Light-Regular) | 0.85-0.95rem |
| Code / Mono | SF Mono / Fira Code | 400 | 0.75-0.82rem |
| Label / Badge | Inter | 600 (SemiBold) | 0.6-0.72rem |
| Category | Inter | 600 uppercase | 0.7rem, letter-spacing: 0.2em |

### Google Fonts import
```html
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
```

---

## Spacing (regla 3× negative space)

| Token | Valor | Uso |
|-------|-------|-----|
| `--space-xs` | `0.25rem` | Inline gaps |
| `--space-sm` | `0.5rem` | Chip padding, tight gaps |
| `--space-md` | `1rem` | Card padding internal |
| `--space-lg` | `1.75rem` | Card padding, section gaps |
| `--space-xl` | `3rem` | Section separators |
| `--space-2xl` | `5rem` | Hero padding, major breaks |

### Regla de negative space
El espacio vacío ES el diseño. Triplicar el espacio que parece "suficiente".
Más espacio = más autoridad visual.

---

## Border Radius

| Token | Valor | Uso |
|-------|-------|-----|
| `--radius-sm` | `8px` | Buttons, inputs, code blocks |
| `--radius` | `16px` | Cards, surfaces |
| `--radius-xl` | `24px` | Hero containers, feature blocks |
| `--radius-full` | `50%` | Avatars, indicators |

---

## Componentes

### 1. Navigation Bar
```css
nav {
  position: fixed; top: 0; left: 0; right: 0; z-index: 100;
  background: rgba(26,26,46,0.85);
  backdrop-filter: blur(20px);
  border-bottom: 1px solid var(--dark-border);
  padding: 0 2rem; height: 64px;
}
.logo-mark {
  width: 32px; height: 32px; background: var(--orange);
  border-radius: 8px; font-weight: 900; font-size: 0.85rem;
  color: var(--dark); /* letter inside */
}
```

### 2. Hero Section
```css
.hero {
  padding: 8rem 2rem 4rem; text-align: center;
  background: radial-gradient(ellipse at 50% 0%, rgba(255,126,8,0.06), transparent 70%);
}
.hero h1 { font-size: clamp(2.5rem, 5vw, 4rem); font-weight: 900; letter-spacing: -0.04em; }
.hero .accent { color: var(--orange); }
```

### 3. Cards
```css
.card {
  background: var(--dark-surface);
  border: 1px solid var(--dark-border);
  border-radius: var(--radius);
  padding: 1.75rem;
  transition: border-color 0.25s;
}
.card:hover { border-color: rgba(255,126,8,0.2); }
```

### 4. Badges
```css
.badge {
  font-size: 0.6rem; font-weight: 600;
  padding: 3px 8px; border-radius: 10px;
  background: var(--orange-glow); color: var(--orange);
}
.badge-gold {
  background: var(--gold-dim); color: var(--gold);
}
```

### 5. Buttons
```css
.btn-primary {
  background: var(--orange); color: var(--dark);
  font-weight: 700; padding: 12px 28px;
  border-radius: var(--radius-sm); border: none;
  cursor: pointer; transition: all 0.2s;
}
.btn-primary:hover { background: var(--orange-bright); transform: translateY(-1px); }

.btn-ghost {
  background: transparent; color: var(--text-secondary);
  border: 1px solid var(--dark-border);
  padding: 10px 22px; border-radius: var(--radius-sm);
}
.btn-ghost:hover { border-color: var(--orange); color: var(--orange); }
```

### 6. Tables
```css
table { width: 100%; border-collapse: collapse; }
th {
  font-size: 0.65rem; font-weight: 600; letter-spacing: 0.15em;
  text-transform: uppercase; color: var(--text-tertiary);
  padding: 0.75rem 1rem; text-align: left;
  border-bottom: 1px solid var(--dark-border);
}
td {
  padding: 0.75rem 1rem; font-size: 0.82rem;
  border-bottom: 1px solid var(--dark-border);
}
```

### 7. Code Blocks
```css
.code-block {
  background: rgba(0,0,0,0.3);
  border: 1px solid var(--dark-border);
  border-radius: var(--radius-sm);
  padding: 1rem;
  font-family: 'SF Mono','Fira Code',monospace;
  font-size: 0.75rem; color: var(--orange);
  line-height: 1.6; white-space: pre-wrap;
}
```

### 8. Modals
```css
.modal-overlay {
  position: fixed; inset: 0; z-index: 1000;
  background: rgba(0,0,0,0.7);
  backdrop-filter: blur(8px);
  display: flex; align-items: center; justify-content: center;
}
.modal-content {
  background: var(--dark-surface);
  border: 1px solid var(--dark-border);
  border-radius: var(--radius-xl);
  max-width: 900px; width: 90%; max-height: 85vh;
  overflow-y: auto; padding: 2.5rem;
}
```

### 9. Stats / Metrics
```css
.stat-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(140px, 1fr)); gap: 1rem; }
.stat-card {
  text-align: center; padding: 1.5rem;
  background: var(--dark-surface);
  border: 1px solid var(--dark-border);
  border-radius: var(--radius);
}
.stat-number { font-size: 2.5rem; font-weight: 900; color: var(--orange); }
.stat-label { font-size: 0.72rem; color: var(--text-tertiary); text-transform: uppercase; letter-spacing: 0.1em; }
```

### 10. Ghost Menu (footer de artefacto)
```css
.ghost-menu {
  margin-top: 3rem; padding: 1.5rem;
  background: rgba(0,0,0,0.2);
  border: 1px solid var(--dark-border);
  border-radius: var(--radius);
  font-size: 0.72rem; color: var(--text-tertiary);
}
.ghost-menu strong { color: var(--text-secondary); }
.ghost-menu a { color: var(--orange); text-decoration: none; }
```

---

## Layouts

### Grid principal
```css
.container { max-width: 1200px; margin: 0 auto; padding: 0 2rem; }
.grid-2 { display: grid; grid-template-columns: repeat(auto-fit, minmax(360px, 1fr)); gap: 1.25rem; }
.grid-3 { display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 1.25rem; }
```

### Responsive
```css
@media (max-width: 768px) {
  .grid-2, .grid-3 { grid-template-columns: 1fr; }
  .hero h1 { font-size: 2rem; }
  nav { padding: 0 1rem; }
}
```

---

## Secciones de contenido

### Section Header (categoría)
```css
.section-title {
  font-size: 0.7rem; font-weight: 600;
  letter-spacing: 0.2em; text-transform: uppercase;
  color: var(--gold);
  margin-bottom: 1.25rem; padding-bottom: 0.5rem;
  border-bottom: 1px solid var(--dark-border);
}
```

### Footer
```css
footer {
  border-top: 1px solid var(--dark-border);
  padding: 3rem 2rem; text-align: center;
}
.footer-tagline {
  font-size: 1.1rem; font-weight: 300; font-style: italic;
  color: var(--text-secondary);
}
.footer-tagline .highlight { color: var(--gold); font-weight: 600; font-style: normal; }
.footer-meta { font-size: 0.75rem; color: var(--text-tertiary); }
.footer-meta a { color: var(--orange); text-decoration: none; }
```

---

## Patrones de composición

### Landing page
1. Nav fija con logo + links
2. Hero con gradiente radial naranja sutil
3. Stats grid (4 métricas clave)
4. Secciones de features con cards
5. Tabla de referencia rápida
6. CTA section
7. Footer con tagline + copyright

### One-pager / Brief
1. Header con badge de estado + fecha
2. TL;DR box con 3-5 bullets
3. Semáforo visual (tabla)
4. Hallazgos clave (cards)
5. Recomendación + CTA
6. Ghost menu

### Entregable técnico
1. Header con metadata + badge de fase
2. Table of contents (sticky sidebar o inline)
3. Secciones con código, diagramas Mermaid, tablas
4. Evidence tags visibles
5. Cross-references
6. Ghost menu

---

## Prohibiciones

1. **NUNCA** verde como indicador de éxito → usar gold (#22D3EE)
2. **NUNCA** mezclar branding MetodologIA con MetodologIA
3. **NUNCA** usar imágenes base64 inline (bloat)
4. **NUNCA** dependencias externas excepto Google Fonts
5. **NUNCA** componentes sin hover state
6. **NUNCA** texto sin contraste WCAG AA (4.5:1 mínimo)
7. **NUNCA** layouts que no sean responsive

---

*Design System v5 — Dark Authority. Neo-Swiss + Minto Pyramid + Rule 3-3-3.*
*© 2026 MetodologIA · Javier Montaño. MIT.*
