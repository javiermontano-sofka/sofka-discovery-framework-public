# Estandares de Output

> PMO-APEX — Ontologia viva
> Referencia canonica para formato, branding y calidad de los entregables generados.

---

## Estandar Markdown-Excellence

Todo entregable generado por PMO-APEX sigue el estandar Markdown-Excellence, que prioriza densidad informativa y navegabilidad.

### Estructura obligatoria

| Elemento | Regla | Ubicacion |
|----------|-------|-----------|
| **TL;DR** | 3-5 bullets con los hallazgos principales | Inicio del documento |
| **Prosa densa** | Evitar redundancia, cada parrafo aporta valor nuevo | Cuerpo del entregable |
| **Tablas con semaforo** | Visual de estado (RAG) en hallazgos tabulados | Secciones de diagnostico |
| **Diagramas Mermaid** | Embebidos, no como imagen externa | Gantt, flowchart, org charts |
| **Callouts de contexto** | Bloques `>` para advertencias, decisiones, gates | Donde corresponda |
| **Cross-references** | Links entre entregables del pipeline | Secciones de vinculacion |
| **Ghost menu** | Navegacion contextual del pipeline | Final del documento |
| **Tags de evidencia** | Toda afirmacion etiquetada con fuente | Protocolo zero-hallucination |

### Reglas de redaccion

- **Idioma:** Espanol latinoamericano, registro empresarial
- **Tono:** Profesional, directo, orientado a accion y decision
- **Artefactos:** Guardar como archivos (artifact-first), no inline
- **Formato default:** Markdown
- **Formatos opcionales:** HTML, DOCX, XLSX — solo bajo solicitud explicita
- **Longitud:** Variante ejecutiva (~40% del contenido) o tecnica (contenido completo)

---

## Branding APEX (Design System v1)

### Paleta de colores

| Token | Valor | Uso |
|-------|-------|-----|
| `--apex-primary` | `#2563EB` | Color principal (royal blue APEX) |
| `--apex-dark` | `#0F172A` | Fondos oscuros, headers |
| `--apex-success` | `#F59E0B` | Estados de exito (ambar) |
| `--apex-danger` | `#DC2626` | Errores, bloqueos, riesgos criticos |
| `--apex-warning` | `#F97316` | Advertencias, riesgos medios |
| `--apex-info` | `#06B6D4` | Informacion, contexto |
| `--apex-accent` | `#8B5CF6` | Acentos, elementos destacados |

> **REGLA CRITICA:** NUNCA usar verde para estados de exito. El exito en APEX es ambar (`#F59E0B`).

### Tipografia

| Elemento | Fuente | Peso |
|----------|--------|------|
| Headings | Inter | Bold (700) |
| Body | Inter | Regular (400) |
| Code | JetBrains Mono | Regular (400) |
| Metricas | Inter | SemiBold (600) |

### Patron visual

- **Blue Authority:** Fondos oscuros con acentos azul royal para autoridad y precision
- **Data-Driven:** Metricas prominentes, KPIs visibles, dashboards integrados
- **Decision-Ready:** Cada entregable lleva a una decision clara

---

## Estandar HTML

Los outputs HTML utilizan el design system definido en:
`references/ontology/canonical-tokens.md`

### Reglas para HTML

| Regla | Detalle |
|-------|---------|
| Tokens de diseno | Usar variables CSS del design system, nunca colores hardcodeados |
| Responsivo | Mobile-first, breakpoints estandar |
| Accesibilidad | WCAG 2.1 AA minimo |
| Ghost menu | Incluido como componente fijo al final |
| Branding | Header con logo APEX, footer con disclaimer |
| Print | Estilos de impresion optimizados |
| Graficas | EVM charts, burndown, S-curves con tokens APEX |

---

## Reglas de formato por tipo de entregable

| Entregable | Formato primario | Formato secundario | Variante |
|-----------|-----------------|-------------------|----------|
| 00-09 Pipeline | Markdown | HTML (bajo solicitud) | Tecnica (default) |
| 11 Dashboard | HTML | Markdown | Ejecutiva |
| 12 Kickoff | HTML | Markdown | Ejecutiva |
| 13 Status & EVM | HTML + Markdown | XLSX | Tecnica |
| 14 Lessons & Closure | Markdown | HTML | Tecnica |
| Assessments | Markdown | HTML | Tecnica |

---

## Excellence Loop (10 criterios)

Cada entregable se evalua contra estos 10 criterios antes de considerarse completo:

| # | Criterio | Pregunta de validacion |
|---|----------|----------------------|
| 1 | **Evidence** | Cada afirmacion tiene evidencia trazable? |
| 2 | **Accuracy** | Se respeta el protocolo zero-hallucination? |
| 3 | **Completeness** | Cubre todas las dimensiones requeridas? |
| 4 | **Consistency** | Es consistente con otros entregables del pipeline? |
| 5 | **Actionability** | El lector sabe que hacer despues de leer? |
| 6 | **Clarity** | La estructura guia al lector? |
| 7 | **Traceability** | Hay trazabilidad desde requisito hasta entrega? |
| 8 | **Risk Awareness** | Los riesgos estan identificados y visibles? |
| 9 | **Stakeholder Value** | El stakeholder obtiene insight accionable? |
| 10 | **Methodology Alignment** | Se alinea con la metodologia seleccionada? |

---

## Naming y Slugging de Archivos

### Tags de estado obligatorios

Todo archivo generado debe incluir su estado en el nombre:

| Tag | Significado | Cuando |
|-----|-------------|--------|
| `{WIP}` | Work in Progress | Al crear el archivo por primera vez |
| `{Aprobado}` | Version aprobada/final | Cuando el stakeholder aprueba |

### Patron de slugging

```
{fase}_{entregable}_{proyecto}_{WIP|Aprobado}.{ext}
```

**Ejemplos:**
- `00_Charter_ProyectoAlpha_{WIP}.md`
- `03_Schedule_Baseline_ProyectoAlpha_{Aprobado}.md`
- `05b_Steering_Review_ProyectoAlpha_{WIP}.md`
- `13_Status_EVM_ProyectoAlpha_{Aprobado}.html`

### Reglas de naming

1. Usar snake_case con guiones bajos
2. Fase siempre con dos digitos: `00`, `01`, ..., `14`
3. Nombre del proyecto sin espacios ni caracteres especiales
4. El tag de estado `{WIP}` o `{Aprobado}` va al final, antes de la extension
5. Al aprobar un entregable: renombrar de `{WIP}` a `{Aprobado}`
6. Repos de proyecto: usar el mismo patron en los directorios `project/deliverables/`

---

## Disclaimers obligatorios

Todo entregable que incluya estimaciones de esfuerzo debe llevar:

```markdown
> **Disclaimer:** Las estimaciones de esfuerzo representan magnitudes indicativas
> basadas en el analisis de planificacion. No constituyen un compromiso contractual.
> Los valores finales dependen de la validacion detallada con el equipo de ejecucion.
```

**NUNCA incluir tarifas o costos unitarios.** Solo magnitudes de esfuerzo (FTE-meses, story points, sprints, horas-hombre).

---

*PMO-APEX — La excelencia en gestion de proyectos se construye con evidencia.*
