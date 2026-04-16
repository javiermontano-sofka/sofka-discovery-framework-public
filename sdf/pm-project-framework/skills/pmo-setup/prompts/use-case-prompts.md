# Use Case Prompts — PMO Setup

> PMO-APEX Skill: `pmo-setup` · Prompts NL-HP para diseño e implementación de PMO
> Última actualización: 2026-03-17

---

## UC-01: Diseño de PMO Completo

```
Diseña un PMO completo para {nombre_organizacion}. La organización
tiene {numero_pms} PMs, {numero_proyectos} proyectos activos, y
madurez PM estimada en nivel {nivel}. Genera: selección de tipo de PMO
con justificación, charter, catálogo de servicios, staffing plan,
governance framework, y roadmap de implementación en fases.
```

## UC-02: PMO Charter Creation

```
Crea el charter del PMO para {nombre_organizacion}. Tipo de PMO:
{tipo_pmo}. Incluye: mission statement, scope (qué proyectos gobierna),
authority levels, service catalog overview, success metrics, y review
cadence. El charter debe ser aprobable por el executive sponsor en
una reunión de 30 minutos.
```

## UC-03: Service Catalog Design

```
Diseña el catálogo de servicios del PMO de {nombre_organizacion}.
Para cada servicio define: descripción, nivel de madurez target,
SLA (tiempo de respuesta), audiencia primaria, dependencias, y
métrica de éxito. Organiza los servicios en 3 capas: Foundation,
Development, y Strategic. Máximo 12 servicios en el catálogo inicial.
```

## UC-04: PMO Staffing Plan

```
Define el plan de staffing para el PMO de {nombre_organizacion}.
Portfolio size: {numero_proyectos} proyectos, {numero_pms} PMs.
Para cada rol: título, responsabilidades, FTE requerido, perfil
de competencias, y prioridad de contratación. Incluye plan de
ramp-up por fase de implementación. Estima costo total en FTE-meses.
```

## UC-05: PMO Governance Framework

```
Establece el framework de governance del PMO de {nombre_organizacion}.
Define: governance bodies (portfolio board, steering committee, PMO
review board), frecuencia de reuniones, participantes, decisiones
que toma cada body, reporting cadence, y templates de reporte.
Incluye diagrama de governance en Mermaid.
```

## UC-06: PMO Tool Selection

```
Evalúa y recomienda el stack de herramientas PM para el PMO de
{nombre_organizacion}. Categorías: project management, portfolio
management, reporting/dashboards, resource management, y collaboration.
Para cada categoría: 2-3 opciones evaluadas, criterios de selección,
recomendación con justificación. Formato: evaluation matrix.
```

## UC-07: PMO Implementation Roadmap

```
Diseña el roadmap de implementación del PMO de {nombre_organizacion}
en 4 fases: Pre-launch (1 mes), Quick Wins (1-3 meses), Foundation
(3-6 meses), Maturity (6-12 meses). Para cada fase: objetivos,
actividades clave, entregables, success metrics, y dependencias.
Incluye Gantt conceptual en Mermaid.
```

## UC-08: PMO Value Proposition

```
Genera la value proposition del PMO para presentar al C-level de
{nombre_organizacion}. Incluye: problema que resuelve el PMO,
beneficios esperados (cuantificados donde posible), inversión
requerida (FTE-meses), ROI estimado, y riesgos de no tener PMO.
Formato: executive brief de 1 página con datos, no narrativa.
```
