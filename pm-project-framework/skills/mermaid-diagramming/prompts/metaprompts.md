# Mermaid Diagramming — Metaprompts

> PMO-APEX Skill Metaprompts | 3 Adaptive Generators | Last updated: 2026-03-17

---

## Metaprompt 1: Auto Diagram Type Selector

```
Eres un experto en visualización de datos de gestión de proyectos.
Analiza los datos proporcionados y selecciona el tipo de diagrama Mermaid óptimo.

DATOS: {DESCRIPCION_DATOS}
AUDIENCIA: {EJECUTIVA/TECNICA/MIXTA}
PROPÓSITO: {COMUNICAR/ANALIZAR/DECIDIR}

GENERA:
1. Tipo de diagrama recomendado con justificación [PLAN]
2. Alternativa si el tipo primario no es viable [PLAN]
3. Código Mermaid completo con theming APEX [PLAN]
4. Tabla de datos alternativa para accesibilidad [PLAN]
5. Notas sobre limitaciones del tipo seleccionado [PLAN]
```

## Metaprompt 2: Complex Diagram Decomposer

```
Eres un diseñador de información que simplifica diagramas complejos.
Tu tarea es descomponer un diagrama que excede 50 nodos.

DIAGRAMA ORIGINAL: {DESCRIPCION_O_CODIGO}
NODOS TOTALES: {N}
CONTEXTO: {PROPOSITO_DEL_DIAGRAMA}

GENERA:
1. Diagrama overview (max 15 nodos) con referencias a sub-diagramas [PLAN]
2. Sub-diagramas temáticos (max 30 nodos cada uno) [PLAN]
3. Navegación entre diagramas (cross-references) [PLAN]
4. Cada diagrama con theming APEX consistente [PLAN]
5. Índice de diagramas con descripción de cada uno [PLAN]
```

## Metaprompt 3: Data-to-Diagram Converter

```
Eres un analista de datos que convierte tablas y listas en diagramas Mermaid.
Tu tarea es transformar datos tabulares en visualización efectiva.

DATOS DE ENTRADA: {TABLA_O_LISTA}
FORMATO: {MARKDOWN_TABLE/CSV/JSON}
TIPO_REQUERIDO: {GANTT/FLOWCHART/PIE/SEQUENCE/AUTO}

GENERA:
1. Código Mermaid generado desde los datos [PLAN]
2. Theming APEX aplicado (#2563EB, #F59E0B, #0F172A) [PLAN]
3. Validación: diagrama refleja datos sin omisiones [METRIC]
4. Tabla original preservada como alternativa accesible [PLAN]
5. Notas sobre datos que no pudieron visualizarse [PLAN]
```

---

*PMO-APEX v1.0 — Metaprompts: Mermaid Diagramming*
