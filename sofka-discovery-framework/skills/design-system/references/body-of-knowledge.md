# Body of Knowledge — Design System v4

Fuentes fundacionales, estándares de referencia y glosario para el skill de Design System con generación de HTML de marca.

---

## Fuentes Primarias

### 1. Brad Frost — Atomic Design (2016)

- **Relevancia:** Modelo de composición de interfaces en cinco niveles (atoms, molecules, organisms, templates, pages). Fundamento para la jerarquía de componentes del skill.
- **Aporte clave:** La abstracción en niveles permite reutilización máxima y consistencia visual transversal.
- **Referencia:** Frost, B. (2016). *Atomic Design*. https://atomicdesign.bradfrost.com/

### 2. Nathan Curtis — Modular Web Design (2010)

- **Relevancia:** Metodología para construir sistemas de componentes web modulares con contratos claros entre piezas.
- **Aporte clave:** Principios de naming conventions, documentación de componentes, y gobernanza de bibliotecas.
- **Referencia:** Curtis, N. (2010). *Modular Web Design*. New Riders.

### 3. WCAG 2.1 — Web Content Accessibility Guidelines (W3C, 2018)

- **Relevancia:** Estándar mandatorio para accesibilidad. El skill implementa nivel AA: contrast ratios 4.5:1 (body) y 3:1 (large text), skip links, focus states.
- **Aporte clave:** Criterios de éxito medibles para percepción, operabilidad, comprensión y robustez.
- **Referencia:** W3C. (2018). *Web Content Accessibility Guidelines (WCAG) 2.1*. https://www.w3.org/TR/WCAG21/

### 4. WAI-ARIA Practices (W3C)

- **Relevancia:** Patrones de implementación para widgets accesibles — modales, tabs, menus, live regions.
- **Aporte clave:** Roles, states y properties ARIA para componentes interactivos del design system (modales, nav sticky, badges).
- **Referencia:** W3C. *WAI-ARIA Authoring Practices*. https://www.w3.org/WAI/ARIA/apg/

### 5. Material Design System (Google, 2014–presente)

- **Relevancia:** Sistema de diseño maduro con tokens, motion, theming dinámico. Referencia para patrones de componentes (cards, badges, callouts).
- **Aporte clave:** Material Design 3 introduce design tokens como primera clase y theming dinámico basado en color source.
- **Referencia:** Google. *Material Design*. https://m3.material.io/

### 6. Carbon Design System (IBM, 2017–presente)

- **Relevancia:** Sistema enterprise-grade con fuerte énfasis en tokens, temas, y accesibilidad. Modelo para la arquitectura de tokens del skill.
- **Aporte clave:** Estructura de tokens en tres capas (global → alias → component), theme switching, y grid system.
- **Referencia:** IBM. *Carbon Design System*. https://carbondesignsystem.com/

### 7. Storybook — Documentation Patterns

- **Relevancia:** Herramienta de referencia para documentación interactiva de componentes. Informa el formato de documentación del skill (component tables, usage examples, anti-patterns).
- **Aporte clave:** Modelo de stories, args/controls, y docs page como estándar de documentación de component libraries.
- **Referencia:** Storybook. *Component-Driven Development*. https://storybook.js.org/docs

### 8. Design Tokens W3C Community Group Spec (2019–presente)

- **Relevancia:** Especificación emergente para formato interoperable de design tokens (DTCG). El skill usa CSS custom properties como target, alineado con la dirección del estándar.
- **Aporte clave:** Formato JSON canónico para tokens con $value, $type, $description. Resolución de alias tokens.
- **Referencia:** W3C DTCG. *Design Tokens Format Module*. https://tr.designtokens.org/format/

### 9. Inclusive Design Principles (Microsoft, 2016)

- **Relevancia:** Marco para diseño inclusivo que trasciende compliance técnico. Informa la filosofía accessibility-first del skill.
- **Aporte clave:** Reconocer exclusión, resolver para uno / extender a muchos, y aprender de la diversidad. Persona spectrum (permanente, temporal, situacional).
- **Referencia:** Microsoft. *Inclusive Design Toolkit*. https://inclusive.microsoft.design/

---

## Fuentes Complementarias

| Fuente | Aporte | URL |
|--------|--------|-----|
| Tailwind CSS | Utility-first token naming conventions, responsive breakpoint patterns | https://tailwindcss.com/docs |
| Open Props | Modern CSS custom property library, animation tokens | https://open-props.style/ |
| Figma Variables | Design-to-code token sync, multi-mode variables | https://help.figma.com/hc/en-us/articles/15339657135383 |
| axe-core | Automated accessibility testing rules, color contrast algorithms | https://github.com/dequelabs/axe-core |
| MetodologIA Brand Manual (interno) | Paleta oficial (#6366F1, #1A1A2E, #22D3EE), tipografía, uso de logo | Documentación interna Comunidad MetodologIA |

---

## Glosario

| Término | Definición |
|---------|-----------|
| **Design Token** | Valor atómico de diseño (color, spacing, typography) almacenado como variable CSS custom property y definido en `brand-config.json`. Unidad mínima del sistema. |
| **Brand Config** | Archivo JSON (`brand-config.json`) que contiene todos los valores de identidad visual de una marca. Cambiar este archivo reconfigura todo el design system sin tocar CSS. |
| **Semantic Color** | Color con significado funcional independiente de la marca: positive (yellow #22D3EE), warning (amber), critical (red), info (blue). Nunca cambian por brand. |
| **Component Library** | Catálogo de elementos HTML reutilizables (cards, badges, callouts, tables, timelines) con clases CSS estandarizadas y documentación de uso. |
| **Atomic Design** | Metodología de Brad Frost que organiza UI en cinco niveles: atoms → molecules → organisms → templates → pages. |
| **WCAG AA** | Nivel de conformidad de accesibilidad que requiere contrast ratio mínimo 4.5:1 para texto normal y 3:1 para texto grande. Estándar del skill. |
| **Skip Link** | Enlace oculto visualmente (`#main`) que permite a usuarios de teclado/screen reader saltar la navegación directamente al contenido principal. |
| **CSS Custom Property** | Variable CSS nativa (`--brand-primary`) que permite theming dinámico sin preprocesadores. Base técnica del token system. |
| **Token Alias** | Token que referencia otro token (e.g., `--card-border` → `var(--brand-primary)`). Permite cambios en cascada desde un único punto. |
| **Hero Section** | Sección prominente al inicio del documento con fondo oscuro, borde brand-primary, logo, KPIs y título destacado. Componente de máximo impacto visual. |
| **Responsive Breakpoint** | Punto de quiebre CSS donde el layout se adapta: mobile (<768px), tablet (768-1024px), desktop (>1024px). |
| **Design System as Product** | Enfoque donde el design system se gestiona como un producto interno con roadmap, versionado, consumers, y governance propia. |
| **White-Label System** | Arquitectura de design system que soporta múltiples marcas cambiando únicamente el `brand-config.json`, sin modificar componentes ni templates. |
| **Focus State** | Indicador visual (outline 2px solid brand-primary) que muestra qué elemento tiene foco de teclado. Requerimiento de accesibilidad. |
| **Print Stylesheet** | Reglas CSS `@media print` que optimizan el documento para impresión: ocultan nav, ajustan márgenes, fuerzan colores legibles en papel. |
