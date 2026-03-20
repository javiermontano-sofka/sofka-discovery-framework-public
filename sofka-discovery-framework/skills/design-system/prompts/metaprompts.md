# Metaprompts — Design System v4

Estrategias de razonamiento que el skill aplica internamente para resolver problemas complejos de design system. Cada metaprompt define un enfoque cognitivo reutilizable.

---

## 1. Accessibility-First Design

**Cuándo aplicar:** Al generar cualquier componente nuevo, migrar HTML legacy, o auditar deliverables existentes.

**Estrategia:**

```
Antes de considerar estética o funcionalidad, evalúa accesibilidad como constraint primario:

PASO 1 — Estructura semántica
¿El HTML usa los elementos correctos? (nav, main, article, section, aside, header, footer)
¿Hay un único h1? ¿La jerarquía de headings es secuencial sin saltos?
¿Existe skip link funcional hacia #main?

PASO 2 — Percepción
¿Todos los textos cumplen contrast ratio WCAG AA? (4.5:1 body, 3:1 large)
¿La información se transmite por más de un canal? (no solo color: también icono, texto, posición)
¿Las imágenes decorativas tienen alt="" y las informativas tienen alt descriptivo?

PASO 3 — Operabilidad
¿Todo es navegable por teclado? (Tab, Shift+Tab, Enter, Escape)
¿Los focus states son visibles? (outline 2px solid brand-primary)
¿Los modales atrapan el foco correctamente y se cierran con Escape?
¿No hay trampas de teclado?

PASO 4 — Comprensión
¿El lang="" del documento es correcto?
¿Los formularios tienen labels asociados?
¿Los errores se identifican programáticamente?

PASO 5 — Robustez
¿El HTML es válido? (sin tags sin cerrar, sin atributos duplicados)
¿Los ARIA roles/states/properties son correctos y necesarios? (no ARIA es mejor que ARIA mal usado)

Solo después de satisfacer estos 5 pasos, procede con diseño visual y funcionalidad avanzada.
```

---

## 2. Component Reuse Maximization

**Cuándo aplicar:** Al construir secciones de un deliverable, antes de crear cualquier HTML custom.

**Estrategia:**

```
Maximiza reutilización de componentes existentes antes de crear HTML nuevo:

PASO 1 — Inventario
Lee el catálogo completo de componentes en SKILL.md (Component Quick Reference).
Identifica los componentes disponibles: cards (6 variantes), badges (2), severities (4),
callouts (4), tables, diagrams, progress bars, timelines, score rings.

PASO 2 — Mapeo de necesidad → componente
Para cada bloque de contenido que necesitas representar, pregunta:
- ¿Existe un componente que resuelve esto directamente? → Úsalo.
- ¿Existe un componente que resuelve esto con mínima adaptación? → Úsalo con variante.
- ¿Ningún componente existente aplica? → Documenta la gap y procede a PASO 3.

PASO 3 — Creación justificada
Si necesitas un componente nuevo:
- ¿Se usará en más de un deliverable? → Candidato a catálogo (sigue extending-components protocol).
- ¿Es one-off? → Créalo inline pero usando tokens del sistema (nunca hex literals).
- ¿Duplica parcialmente un componente existente? → Extiende el existente con modifier class.

PASO 4 — Validación de consistencia
Verifica que el deliverable final usa componentes del catálogo en >80% de sus bloques visuales.
Si <80%, revisa PASO 2 — probablemente hay componentes subutilizados.

Principio: cada componente custom es deuda técnica del design system.
Cada componente reutilizado es inversión en consistencia.
```

---

## 3. Brand Consistency Enforcement

**Cuándo aplicar:** Al generar HTML de marca, al hacer batch upgrades, o al validar deliverables.

**Estrategia:**

```
Enforza consistencia de marca como un compilador enforza tipos — sin excepciones:

PASO 1 — Token Resolution
Todo valor visual DEBE resolverse a un token:
- Colores → var(--brand-*) o var(--semantic-*) o var(--chart-*)
- Tipografía → var(--font-display) o var(--font-body)
- Spacing → tokens de spacing definidos
- Shadows → var(--shadow-sm/md/lg/card)
- Radii → var(--radius-sm/md/lg/xl)

REGLA ABSOLUTA: Si encuentras un hex literal (#XXXXXX) fuera del bloque :root, es un BUG.
No hay excepciones. No hay "es solo un borde". Todo pasa por tokens.

PASO 2 — Semantic Color Audit
Los colores semánticos son UNIVERSALES y NUNCA cambian por marca:
- Positive/Success = #22D3EE (yellow). NUNCA green. NUNCA.
- Warning = #D97706 (amber)
- Critical/Error = #DC2626 (red)
- Info = #2563EB (blue)

Si un deliverable usa green para success, es una violación crítica.

PASO 3 — Structural Brand Elements
Verifica los elementos estructurales de marca:
- Hero: fondo var(--brand-black), border-bottom 8px solid var(--brand-primary)
- Footer: fondo var(--brand-black), border-top 8px solid var(--brand-primary)
- Section headers: número en caja negra con brand-primary
- Nav: sticky, uppercase, active state = brand-primary

PASO 4 — Typography Chain
- Display font cargada desde Google Fonts / Fontshare (verificar link en <head>)
- Body font cargada (verificar fallback stack: system-ui, sans-serif)
- Monospace para código: Menlo, Monaco, monospace

PASO 5 — Cross-Document Consistency
Si hay múltiples deliverables en el engagement:
- Todos usan el mismo brand-config.json
- Todos tienen el mismo hero/footer pattern
- Todos usan los mismos componentes con las mismas clases
- Un usuario debe percibir todos los documentos como "del mismo sistema"
```

---

## 4. Progressive Enhancement

**Cuándo aplicar:** Al diseñar componentes, templates, o funcionalidades del design system que involucran JavaScript o CSS avanzado.

**Estrategia:**

```
Construye desde lo funcional hacia lo visual, nunca al revés:

CAPA 1 — HTML Semántico (funciona sin CSS ni JS)
El documento debe ser legible y navegable con CSS desactivado:
- Headings crean outline comprensible
- Tables tienen headers asociados
- Links son descriptivos
- Contenido fluye en orden lógico de lectura
- Imágenes tienen alt text

CAPA 2 — CSS Base (funciona sin JS)
Aplica design tokens y layout:
- Custom properties en :root
- Typography scale
- Spacing y color
- Responsive breakpoints con media queries
- Print stylesheet
- NO depender de JS para layout crítico

CAPA 3 — CSS Enhancement (nice-to-have visual)
Mejoras visuales que no rompen nada si no se soportan:
- CSS animations y transitions
- backdrop-filter para blur effects
- CSS Grid avanzado con fallback flexbox
- @supports queries para features detection

CAPA 4 — JavaScript (progressive, nunca required)
Interactividad que mejora pero no es esencial:
- Smooth scroll (funciona sin JS via CSS scroll-behavior)
- Sticky nav highlighting (nav funciona sin highlighting)
- Modal open/close (contenido accesible sin modal)
- Mermaid diagram rendering (pre tag legible sin render)
- Intersection Observer para animaciones on-scroll

REGLA DE ORO: Si JavaScript falla (CDN caído, bloqueador, error),
el documento debe ser 100% legible y navegable.
El contenido es el producto. El styling es enhancement.
La interactividad es bonus.

VALIDACIÓN: Abre el HTML con JavaScript deshabilitado.
¿Se lee todo el contenido? ¿Se navega? ¿Se imprime?
Si la respuesta es sí a todo → progressive enhancement correcto.
```
