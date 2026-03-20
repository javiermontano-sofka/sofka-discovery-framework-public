# Use Case Prompts — Design System v4

Prompts listos para invocar el skill en escenarios concretos. Cada prompt incluye contexto, parámetros y resultado esperado.

---

## 1. Full Design System Audit

```
Ejecuta una auditoría completa del design system aplicado en los HTML de este directorio: {RUTA_DELIVERABLES}.

Para cada archivo:
1. Verifica que TODOS los colores usen CSS custom properties (cero hex literals fuera de :root)
2. Valida contrast ratios WCAG AA (4.5:1 body, 3:1 large text)
3. Confirma presencia de: skip link, focus states, ARIA labels en modales
4. Verifica que success/positive states usen yellow (#22D3EE), nunca green
5. Chequea responsive breakpoints (mobile <768px, tablet 768-1024px, desktop >1024px)
6. Valida hero y footer: fondo negro, borde 8px solid brand-primary

Genera un reporte consolidado con tabla de compliance por archivo (🟢/🟡/🔴) y lista priorizada de correcciones.

MODO=desatendido FORMATO=markdown VARIANTE=técnica
```

---

## 2. Component Library Assessment

```
Analiza el component library actual del design system v4 contra los deliverables generados en {RUTA_DELIVERABLES}.

Determina:
1. Component coverage: ¿qué componentes del catálogo se usan realmente? ¿cuáles nunca se usan?
2. Component consistency: ¿cada instancia de un componente respeta la especificación? (clases correctas, tokens correctos)
3. Missing components: ¿hay patrones visuales repetidos que no están catalogados como componentes?
4. Anti-patterns detectados: ¿componentes usados fuera de su propósito documentado?

Output: tabla de componentes con frecuencia de uso, compliance score, y recomendaciones de evolución.

MODO=desatendido FORMATO=markdown VARIANTE=técnica
```

---

## 3. Accessibility Audit

```
Realiza una auditoría de accesibilidad exhaustiva del archivo {ARCHIVO_HTML}.

Evalúa contra WCAG 2.1 nivel AA:
- Perceptible: contrast ratios, alt text, media alternatives, text resizing
- Operable: keyboard navigation, skip link, focus visible, no traps, timing
- Comprensible: language tag, labels, error identification, consistent navigation
- Robusto: valid HTML, ARIA usage, name/role/value

Para cada hallazgo indica: criterio WCAG violado, severidad (critical/major/minor), elemento afectado, y corrección propuesta con código.

MODO=desatendido FORMATO=markdown VARIANTE=técnica
```

---

## 4. Brand HTML Generation (MetodologIA)

```
Genera un deliverable HTML completo con marca MetodologIA para: {TITULO_DOCUMENTO}.

Usa el brand-config.json de MetodologIA:
- Primary: #6366F1 (naranja MetodologIA)
- Dark: #1A1A2E
- Success: #22D3EE (yellow, nunca green)
- Fonts: Clash Grotesk (display) + Inter (body)

El documento debe contener:
- Hero con logo metodologia_, 3-4 KPIs destacados, título con span naranja
- Nav sticky con secciones del documento
- {NUMERO_SECCIONES} secciones con contenido de: {FUENTE_CONTENIDO}
- Footer con confidencialidad y referencia documental
- Print stylesheet funcional

MODO_OPERACIONAL=brand-html MODO=piloto-auto FORMATO=html VARIANTE=ejecutiva
```

---

## 5. Design Token Migration

```
Migra los design tokens del archivo {ARCHIVO_LEGACY} al formato Design System v4.

Proceso:
1. Extrae todos los valores hardcoded de color, spacing, typography del CSS existente
2. Mapea cada valor a su token equivalente en el sistema v4 (brand tokens, semantic tokens, decorative tokens)
3. Reemplaza hex literals por var(--token-name) en todo el documento
4. Genera el bloque :root actualizado con todos los tokens
5. Verifica que ningún valor visual haya cambiado (mismos colores renderizados)
6. Documenta tokens sin mapeo (requieren decisión: nuevo token o eliminación)

Output: archivo HTML migrado + reporte de migración con tabla de mapeo old→new.

MODO=supervisado FORMATO=dual VARIANTE=técnica
```

---

## 6. Multi-Brand Strategy

```
Diseña una estrategia multi-brand para el design system v4 que soporte las siguientes marcas: {LISTA_MARCAS}.

Para cada marca genera:
1. brand-config.json con paleta completa (primary, light, dark, dim, black, white, background, muted)
2. Validación de contrast ratios WCAG AA para todas las combinaciones texto/fondo
3. Typography recommendation (display + body fonts con Google Fonts URL)
4. Preview HTML con hero, card grid, table, callout de cada tipo, y badge samples

Entrega final: directorio por marca con brand-config.json + preview.html + compliance-report.md.

MODO=piloto-auto FORMATO=html VARIANTE=técnica MODO_OPERACIONAL=sistema-completo
```

---

## 7. Storybook Documentation

```
Genera documentación tipo Storybook para el component library del design system v4.

Para cada componente del catálogo:
1. Nombre y descripción funcional
2. Variantes disponibles (default, accent, critical, warning, success, info, dark)
3. HTML snippet con código copiable
4. Tabla de CSS custom properties que consume
5. Do's and Don'ts con ejemplos visuales
6. Responsive behavior (cómo se adapta en mobile/tablet/desktop)
7. Accessibility notes (ARIA, keyboard, screen reader behavior)

Formato: un archivo HTML navegable con sidebar de componentes y área de preview.

MODO=desatendido FORMATO=html VARIANTE=técnica MODO_OPERACIONAL=componentes
```

---

## 8. Design System Governance

```
Establece un modelo de gobernanza para el design system v4 del framework de discovery MetodologIA.

Define:
1. Roles: quién puede agregar componentes, quién aprueba cambios, quién mantiene tokens
2. Proceso de contribución: propuesta → review → test → merge → document
3. Versionado semántico: cuándo bump major/minor/patch, changelog format
4. Métricas de salud: component coverage, token compliance, accessibility score, adoption rate
5. Deprecation policy: cómo retirar componentes sin romper deliverables existentes
6. Acceptance criteria checklist actualizada (extensión del operations-guide.md)
7. Cadencia de review: auditoría trimestral de tokens, componentes, y accesibilidad

Output: documento de gobernanza listo para integrar en el framework.

MODO=piloto-auto FORMATO=markdown VARIANTE=técnica
```
