# Estándares de Output

> MAO Framework — Ontología viva
> Referencia canónica para formato, branding y calidad de los entregables generados.

---

## Estándar Markdown-Excellence

Todo entregable generado por MAO Framework sigue el estándar Markdown-Excellence, que prioriza densidad informativa y navegabilidad.

### Estructura obligatoria

| Elemento | Regla | Ubicación |
|----------|-------|-----------|
| **TL;DR** | 3-5 bullets con los hallazgos principales | Inicio del documento |
| **Prosa densa** | Evitar redundancia, cada párrafo aporta valor nuevo | Cuerpo del entregable |
| **Tablas con semáforo** | Visual de estado (colores o iconos) en hallazgos tabulados | Secciones de diagnóstico |
| **Diagramas Mermaid** | Embebidos, no como imagen externa | Arquitectura, flujos, roadmap |
| **Callouts de contexto** | Bloques `>` para advertencias, notas, decisiones clave | Donde corresponda |
| **Cross-references** | Links entre entregables del pipeline | Secciones de vinculación |
| **Ghost menu** | Navegación contextual del pipeline | Final del documento |
| **Tags de evidencia** | Toda afirmación etiquetada con fuente | Protocolo zero-hallucination |

### Reglas de redacción

- **Idioma:** Español latinoamericano, registro empresarial
- **Tono:** Profesional, directo, sin ambigüedad
- **Artefactos:** Guardar como archivos (artifact-first), no inline
- **Formato default:** Markdown
- **Formatos opcionales:** HTML, DOCX, XLSX — solo bajo solicitud explícita
- **Longitud:** Variante ejecutiva (~40% del contenido) o técnica (contenido completo)

---

## Branding MetodologIA (Design System v5)

### Paleta de colores

| Token | Valor | Uso |
|-------|-------|-----|
| `--metodologia-primary` | `#6366F1` | Color principal (naranja MetodologIA) |
| `--metodologia-dark` | `#1A1A2E` | Fondos oscuros, headers |
| `--metodologia-success` | `#22D3EE` | Estados de éxito (dorado) |
| `--metodologia-danger` | `#FF4444` | Errores, bloqueos |
| `--metodologia-warning` | `#FFA500` | Advertencias |
| `--metodologia-info` | `#4A90D9` | Información, contexto |

> **REGLA CRÍTICA:** NUNCA usar verde para estados de éxito. El éxito en MetodologIA es dorado (`#22D3EE`).

### Tipografía

| Elemento | Fuente | Peso |
|----------|--------|------|
| Headings | Inter | Bold (700) |
| Body | Inter | Regular (400) |
| Code | JetBrains Mono | Regular (400) |

### Patrón visual

- **Dark Authority:** Fondos oscuros con acentos naranja para autoridad y confianza
- **Neo-Swiss:** Grids limpios, tipografía prominente, jerarquía visual clara

---

## Estándar HTML

Los outputs HTML utilizan el design system definido en:
`references/ontology/canonical-tokens.md`

### Reglas para HTML

| Regla | Detalle |
|-------|---------|
| Tokens de diseño | Usar variables CSS del design system, nunca colores hardcodeados |
| Responsivo | Mobile-first, breakpoints estándar |
| Accesibilidad | WCAG 2.1 AA mínimo |
| Ghost menu | Incluido como componente fijo al final |
| Branding | Header con logo MetodologIA, footer con disclaimer |
| Print | Estilos de impresión optimizados |

---

## Reglas de formato por tipo de entregable

| Entregable | Formato primario | Formato secundario | Variante |
|-----------|-----------------|-------------------|----------|
| 00-09 Pipeline | Markdown | HTML (bajo solicitud) | Técnica (default) |
| 08 Pitch | HTML | Markdown | Ejecutiva |
| 10 Deck | HTML | — | Ejecutiva |
| 11-12 Reportes | Markdown | HTML | Técnica |
| 13 Revisión Negocio | Markdown | — | INTERNA |
| 14 Oportunidades IA | Markdown | HTML | Técnica |
| Assessments | Markdown | HTML | Técnica |

---

## Excellence Loop (10 criterios)

Cada entregable se evalúa contra estos 10 criterios antes de considerarse completo:

| # | Criterio | Pregunta de validación |
|---|----------|----------------------|
| 1 | **Fundamento** | ¿Cada afirmación tiene evidencia trazable? |
| 2 | **Veracidad** | ¿Se respeta el protocolo zero-hallucination? |
| 3 | **Calidad** | ¿Cumple el estándar Markdown-Excellence? |
| 4 | **Densidad** | ¿Cada párrafo aporta información nueva? |
| 5 | **Simplicidad** | ¿Es comprensible sin conocimiento previo? |
| 6 | **Claridad** | ¿La estructura guía al lector? |
| 7 | **Precisión** | ¿Los datos y métricas son exactos? |
| 8 | **Profundidad** | ¿Cubre la dimensión al nivel requerido? |
| 9 | **Coherencia** | ¿Es consistente con otros entregables? |
| 10 | **Valor** | ¿El stakeholder obtiene insight accionable? |

---

## Naming y Slugging de Archivos

### Tags de estado obligatorios

Todo archivo generado debe incluir su estado en el nombre:

| Tag | Significado | Cuándo |
|-----|-------------|--------|
| `{WIP}` | Work in Progress | Al crear el archivo por primera vez |
| `{Aprobado}` | Versión aprobada/final | Cuando el stakeholder aprueba |

### Patrón de slugging

```
{fase}_{entregable}_{cliente}_{WIP|Aprobado}.{ext}
```

**Ejemplos:**
- `03_ASIS_Acme Corp_{WIP}.md`
- `08_Pitch_Ejecutivo_Acme Corp_{Aprobado}.html`
- `05b_Feasibility_ClienteXYZ_{WIP}.md`
- `00_Plan_Discovery_NombreCliente_{Aprobado}.md`

### Reglas de naming

1. Usar snake_case con guiones bajos
2. Fase siempre con dos dígitos: `00`, `01`, ..., `14`
3. Nombre del cliente sin espacios ni caracteres especiales
4. El tag de estado `{WIP}` o `{Aprobado}` va al final, antes de la extensión
5. Al aprobar un entregable: renombrar de `{WIP}` a `{Aprobado}`
6. Repos de discovery: usar el mismo patrón en los directorios `discovery/deliverables/`

---

## Disclaimers obligatorios

Todo entregable que incluya estimaciones de esfuerzo debe llevar:

```markdown
> **Disclaimer:** Las estimaciones de FTE-meses representan magnitudes indicativas
> basadas en el análisis del discovery. No constituyen una cotización formal.
> Los valores finales dependen de la validación detallada en fase de planificación.
```

**NUNCA incluir precios.** Solo magnitudes de esfuerzo (FTE-meses, story points, sprints).

---

*MAO Framework — La excelencia no se improvisa, se diseña.*
