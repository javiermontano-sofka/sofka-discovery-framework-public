# Priming-RAG: HTML Assets
> MetodologIA Discovery Framework — Inventario de assets HTML y Design System
> Procesado: 2026-03-14 | Version: v12.0.0
> Fuentes: `$SDF/landing.html`, `$SDF/prompt-library.html`

---

## Fuentes procesadas

| Archivo | Ruta | Tipo | Lineas |
|---------|------|------|--------|
| landing.html | `$SDF/landing.html` | Landing page del plugin MAO | ~800+ |
| prompt-library.html | `$SDF/prompt-library.html` | Biblioteca interactiva de prompts | ~600+ |

Versiones historicas en `$SDF/prompts/versions/v0/`.

---

## Valor para discovery y RAG

Los assets HTML definen la identidad visual de MAO. El Design System v5 establece los tokens de marca, los componentes reutilizables y las reglas de generacion. Cualquier output HTML del framework debe seguir estos patrones para mantener consistencia de marca MetodologIA.

---

## MetodologIA Design System v5 — Dark Authority

Filosofia de diseno: **Neo-Swiss + Minto Pyramid + Rule 3-3-3**
- 3 colores primarios: #6366F1, #22D3EE, #1A1A2E
- 3 pesos de fuente: Inter 300/400/700
- 3x negative space (espaciado generoso)

### Design Tokens (CSS Custom Properties)

| Token | Valor | Uso |
|-------|-------|-----|
| `--orange` | `#6366F1` | Color primario MetodologIA, CTAs, acentos |
| `--orange-glow` | `rgba(255, 126, 8, 0.15)` | Glow effect en hover |
| `--orange-bright` | `#818CF8` | Variante clara para gradientes |
| `--gold` | `#22D3EE` | Exito, completado, badges positivos |
| `--gold-dim` | `rgba(255, 215, 0, 0.12)` | Background sutil de exito |
| `--dark` | `#1A1A2E` | Background principal |
| `--dark-surface` | `#16213E` | Background de superficies elevadas |
| `--dark-card` | `#1C2541` | Background de tarjetas |
| `--dark-border` | `rgba(255, 255, 255, 0.06)` | Bordes sutiles, divisores |
| `--text-primary` | `#F0F0F0` | Texto principal sobre fondos oscuros |
| `--text-secondary` | `rgba(240, 240, 240, 0.6)` | Texto secundario |
| `--text-tertiary` | `rgba(240, 240, 240, 0.35)` | Texto terciario, placeholders |
| `--radius` | `16px` | Border radius estandar |
| `--radius-sm` | `8px` | Border radius pequeno |
| `--radius-xl` | `24px` | Border radius grande |

### Regla critica de branding

**NUNCA usar verde (`#00FF00`, `#28a745`, `green`, etc.) para estados de exito.**
El exito en MetodologIA se representa con **amarillo dorado (`#22D3EE`)**. Esta regla aplica a todos los outputs: HTML, Markdown, diagramas Mermaid, presentaciones, XLSX.

### Tipografia

| Uso | Font | Weight | Fallback |
|-----|------|--------|----------|
| Headings | Inter | 700-900 | system-ui, -apple-system, sans-serif |
| Body | Inter | 300-400 | system-ui, -apple-system, sans-serif |
| Labels/badges | Inter | 500-600 | system-ui, sans-serif |
| Code | (monospace del sistema) | 400 | monospace |

Cargada via Google Fonts: `fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900`

---

## Component Library

### 1. Navigation (nav)
- Fixed top, z-index 100
- Background: `rgba(26, 26, 46, 0.85)` con `backdrop-filter: blur(20px)`
- Border-bottom sutil con `--dark-border`
- Inner container: max-width 1200px, flex, height 64px
- Brand mark: cuadrado 32x32 naranja con iniciales "S"

### 2. Hero Section
- Padding-top generoso (7rem+ para compensar nav fija)
- Titulo: `clamp(2rem, 4vw, 3rem)`, weight 900, letter-spacing -0.03em
- Subtitulo con `--text-secondary`
- CTA buttons con background `--orange`, hover glow

### 3. Cards (.card)
- Background: `--dark-card`
- Border: 1px solid `--dark-border`
- Border-radius: `--radius` (16px)
- Hover: transform scale(1.02), box-shadow con orange glow
- Transition: 0.3s ease

### 4. Badges
- Inline-flex, padding 4px 12px
- Border-radius: `--radius-sm`
- Variantes: orange (primario), gold (exito), dim (neutral)
- Font-size: 0.75rem, weight 600, uppercase

### 5. Buttons
- Primary: background `--orange`, color `--dark`, weight 600
- Secondary: border 1px solid `--orange`, color `--orange`, background transparent
- Hover: glow effect con `--orange-glow`
- Border-radius: `--radius-sm`

### 6. Tables
- Width 100%, border-collapse
- Header: background `--dark-surface`, font-weight 600
- Rows: border-bottom 1px solid `--dark-border`
- Hover row: background sutil

### 7. Code Blocks
- Background: `--dark-surface`
- Border: 1px solid `--dark-border`
- Border-radius: `--radius-sm`
- Padding: 1rem
- Font-family: monospace
- Overflow-x: auto

### 8. Modals
- Overlay: rgba(0,0,0,0.7) con backdrop-filter blur
- Content: background `--dark-card`, border-radius `--radius-xl`
- Close button: top-right, hover naranja
- Max-width: 800px, max-height: 80vh, overflow-y auto

### 9. Stats Counters
- Display: flex, gap grande entre contadores
- Numero: font-size 3rem+, weight 900, color `--orange`
- Label: font-size 0.85rem, `--text-secondary`
- Animacion countUp al entrar en viewport

### 10. Ghost Menu Pattern
- Menu flotante semi-transparente, visible on scroll
- Background: rgba de `--dark` con blur
- Acciones rapidas: iconos + labels cortos
- Aparece/desaparece con IntersectionObserver
- Posicion: fixed bottom o lateral

### 11. Footer
- Background: `--dark-surface`
- Copyright, version, links
- Branding MetodologIA con logo mark

---

## landing.html — Estructura

| Seccion | Componentes | Contenido |
|---------|-------------|-----------|
| Nav | nav, nav-brand, logo-mark | MAO branding, links de seccion |
| Hero | hero, gradient-text, CTA | Titulo "Universal Discovery Framework", tagline |
| Stats bar | stat-counter x3+ | 48 Agents, 100 Skills, 84 Commands |
| Features | card grid (auto-fill) | Capacidades del framework |
| Pipeline | visual pipeline, badges | Representacion del pipeline 00-16 |
| Service types | card grid | 10 tipos de servicio con iconos |
| Ghost menu | ghost-menu | Navegacion flotante contextual |
| Footer | footer | Version v11.0.0, copyright MetodologIA |

---

## prompt-library.html — Estructura

| Seccion | Componentes | Contenido |
|---------|-------------|-----------|
| Nav | nav, nav-brand, nav-back | Link de retorno a landing |
| Hero compact | hero-compact | Titulo "Biblioteca de Prompts", descripcion |
| Filter bar | badges como filtros | Categorias: flujos, entregables, assessments, operaciones, metaprompts |
| Search | input search | Busqueda por texto libre |
| Prompt cards | card grid | Preview de cada prompt con titulo, categoria, descripcion |
| Detail modal | modal | Vista expandida con prompt completo + copy button |
| Footer | footer | Version, creditos |

### Funcionalidades interactivas
- Busqueda por texto libre (filter en tiempo real)
- Filtrado por categoria (badge toggle)
- Copy-to-clipboard en cada prompt
- Expandir/colapsar secciones del prompt
- Highlighting de parametros ({RUTA}, {TIPO_SERVICIO}) en naranja

---

## Layout Patterns

### Grid responsivo
```css
display: grid;
grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
gap: 1.5rem; /* --space-lg */
```

### Breakpoints
| Breakpoint | Comportamiento |
|------------|---------------|
| < 768px | 1 columna, padding reducido, nav hamburger |
| 768px - 1024px | 2 columnas, espaciado intermedio |
| > 1024px | 3+ columnas, max-width 1200px centrado |

### Dark theme (siempre default)
- Body background: `--dark` (#1A1A2E)
- Surface: `--dark-surface` (#16213E)
- Cards: `--dark-card` (#1C2541)
- Text: `--text-primary` (#F0F0F0)

### Gradiente de marca
```css
background: linear-gradient(135deg, #6366F1, #22D3EE);
-webkit-background-clip: text;
-webkit-text-fill-color: transparent;
```

### Animaciones
- Fade-in al scroll via IntersectionObserver
- Counter animation (incremento numerico)
- Hover scale en cards: `transform: scale(1.02)`
- Transitions: `0.2s-0.3s ease`

---

## Reglas de generacion HTML

1. **Siempre dark theme** como default, sin toggle de tema
2. **Colores MetodologIA exclusivamente** — no colores genericos de Bootstrap/Tailwind
3. **NUNCA verde** para estados de exito, completado, o positivo
4. **Inter** como font principal via Google Fonts
5. **Responsive mobile-first** con breakpoints en 768px y 1024px
6. **Accesibilidad** — contraste minimo WCAG AA, focus visible, aria labels
7. **Sin frameworks CSS externos** — CSS vanilla con custom properties
8. **JavaScript minimal** — Solo para interactividad esencial (search, filter, copy, scroll)
9. **Max-width 1200px** para contenido, centrado con margin auto
10. **Backdrop-filter blur** para elementos flotantes (nav, ghost-menu, modals)

---

## Key takeaways

1. Dos assets HTML: landing.html (vitrina del framework) y prompt-library.html (catalogo interactivo)
2. Design System v5 "Dark Authority" con 3 colores, 3 pesos, 3x negative space
3. Regla critica: gold (#22D3EE) para exito, NUNCA verde bajo ninguna circunstancia
4. 11 componentes reutilizables: nav, hero, cards, badges, buttons, tables, code, modals, stats, ghost-menu, footer
5. Ghost menu pattern para navegacion contextual flotante
6. CSS vanilla sin frameworks, responsive mobile-first, accesible WCAG AA

---

## Keywords y hashtags

`#html` `#css` `#design-system` `#branding` `#metodologia` `#landing` `#prompt-library` `#tokens` `#colores` `#dark-theme` `#responsive` `#ghost-menu` `#componentes` `#accesibilidad` `#dark-authority`

---

## Query hooks

- "Que colores usa MetodologIA?" -> Design System v5: #6366F1, #22D3EE, #1A1A2E
- "Como genero HTML para MetodologIA?" -> Reglas de generacion + tokens CSS custom properties
- "Que componentes hay?" -> 11: nav, hero, cards, badges, buttons, tables, code, modals, stats, ghost-menu, footer
- "Puedo usar verde para exito?" -> NO, usar #22D3EE (gold). Restriccion absoluta
- "Que font usa MetodologIA?" -> Inter (Google Fonts), weights 300-900
- "Que es el ghost menu?" -> Menu flotante semi-transparente, visible on scroll, con backdrop blur
- "Hay un landing page?" -> landing.html en la raiz del plugin
