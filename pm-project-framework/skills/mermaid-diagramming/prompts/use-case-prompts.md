# Mermaid Diagramming — Use Case Prompts

> PMO-APEX Skill Prompts | 4 Contextualized Use Cases | Last updated: 2026-03-17

---

## Use Case 1: Project Schedule Gantt Chart

```
/pm:mermaid-diagramming $SOURCE_FILE --type=gantt --style=apex

Generar diagrama Gantt del cronograma de {NOMBRE_PROYECTO}.
Fases: {LISTA_FASES}. Duración total: {MESES} meses. Milestones: {LISTA_MILESTONES}.

Requiero:
1. Gantt chart con fases, actividades principales y milestones [SCHEDULE]
2. Ruta crítica resaltada en color primario APEX [PLAN]
3. Dependencias visibles entre actividades [PLAN]
4. Tabla de datos alternativa para accesibilidad [PLAN]
```

## Use Case 2: Process Flow Diagram

```
/pm:mermaid-diagramming $SOURCE_FILE --type=flowchart --style=apex

Crear flowchart del proceso de {NOMBRE_PROCESO}.
Pasos: {N_PASOS}. Decisiones: {N_DECISIONES}. Roles involucrados: {LISTA_ROLES}.

Requiero:
1. Flowchart con decision diamonds y swim lanes por rol [PLAN]
2. Colores APEX: primario para happy path, amber para excepciones [PLAN]
3. Máximo 30 nodos; dividir si excede [PLAN]
4. Leyenda con significado de colores y formas [PLAN]
```

## Use Case 3: Stakeholder Influence Map

```
/pm:mermaid-diagramming $SOURCE_FILE --type=quadrant --style=apex

Crear mapa de influencia/interés de stakeholders de {NOMBRE_PROYECTO}.
Stakeholders: {N_STAKEHOLDERS}. Categorías: {LISTA_CATEGORIAS}.

Requiero:
1. Quadrant chart: Influencia (Y) vs Interés (X) [STAKEHOLDER]
2. Cada stakeholder posicionado con nombre abreviado [STAKEHOLDER]
3. Cuadrantes etiquetados: Manage Closely, Keep Satisfied, Keep Informed, Monitor [PLAN]
4. Tabla complementaria con estrategia de engagement por cuadrante [STAKEHOLDER]
```

## Use Case 4: Risk Probability-Impact Matrix

```
/pm:mermaid-diagramming $SOURCE_FILE --type=quadrant --style=apex

Crear matriz de probabilidad-impacto de riesgos de {NOMBRE_PROYECTO}.
Riesgos: {N_RIESGOS}. Top risks: {LISTA_TOP_RISKS}.

Requiero:
1. Quadrant chart: Probabilidad (Y) vs Impacto (X) [PLAN]
2. Riesgos identificados por código (R01, R02...) [PLAN]
3. Zona roja (alto-alto) en color amber APEX [PLAN]
4. Tabla complementaria con descripción de cada riesgo [PLAN]
```

---

*PMO-APEX v1.0 — Use Case Prompts: Mermaid Diagramming*
