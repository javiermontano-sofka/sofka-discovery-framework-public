# Politica RAG-Priming y Adjuntos

> PMO-APEX — Ontologia viva
> Referencia canonica del comportamiento RAG, priming automatico y procesamiento de adjuntos para gestion de proyectos.

---

## Comportamiento al iniciar sesion (automatico)

Cuando el plugin se activa en un repositorio de proyecto, se ejecuta la siguiente secuencia de priming:

| Paso | Accion | Resultado |
|------|--------|-----------|
| 1 | **Escanear entregables** | Detectar progreso del pipeline (0/16 a 16/16) |
| 2 | **Generar contexto** | Crear `SESSION-README.md` + `SESSION-CLAUDE.md` en `project/` |
| 3 | **Activar ghost menu** | Navegacion contextual persistente al final de cada artefacto |
| 4 | **Iniciar changelog** | Registro de acciones para continuidad ante crisis de sesion |
| 5 | **Cargar priming-RAG** | Archivos de conocimiento base desde `references/` |

El orquestador (`project-conductor`) verifica que los 5 pasos se completen antes de iniciar cualquier flujo de gestion.

---

## Documentos de priming-RAG disponibles

Los archivos en `references/` alimentan el contexto del ecosistema. Se organizan en las siguientes categorias:

### Metodologias y frameworks
- `priming-rag-agile-capabilities.md` — Scrum, Kanban, XP, Lean
- `priming-rag-safe-capabilities.md` — SAFe, ART, PI Planning
- `priming-rag-waterfall-capabilities.md` — Cascada, V-Model, PRINCE2
- `priming-rag-hybrid-capabilities.md` — Metodologias hibridas, tailoring
- `priming-rag-pmo-capabilities.md` — PMO, gobernanza, estandarizacion

### Herramientas y plataformas
- `priming-rag-jira-integration.md` — Jira workflows, boards, automation
- `priming-rag-azure-devops.md` — Azure DevOps, boards, pipelines, repos
- `priming-rag-ms-project.md` — MS Project, scheduling, resource leveling
- `priming-rag-monday-asana.md` — Monday.com, Asana, herramientas colaborativas

### Inteligencia sectorial
- `priming-rag-banking-pm.md` — Gestion de proyectos en sector financiero
- `priming-rag-tech-pm.md` — Gestion de proyectos en sector tecnologico
- `priming-rag-enterprise-pm.md` — Gestion de proyectos enterprise

### Modelos y marcos de referencia
- `priming-rag-pmbok-guide.md` — PMBOK 7th Edition, principios, dominios
- `priming-rag-prince2.md` — PRINCE2, temas, procesos
- `priming-rag-evm-guide.md` — Earned Value Management, formulas, interpretacion
- `priming-rag-risk-frameworks.md` — ISO 31000, COSO ERM, risk appetite

### Referencia operativa
- `priming-rag-estimation-models.md` — Modelos de estimacion, benchmarks
- `priming-rag-team-models.md` — Team Topologies, Tuckman, Belbin
- `priming-rag-maturity-models.md` — CMM, OPM3, P3M3, madurez PMO

---

## Procesamiento de adjuntos (flujo de 5 pasos)

Cuando un usuario comparte un archivo, URL, imagen u otro input externo durante una sesion de proyecto:

### Paso 1 — Lectura e interpretacion
El `project-conductor` clasifica el tipo de adjunto y delega al agente especializado:
- Project Plan / Schedule → `schedule-planner`
- Presupuesto / Financiero → `budget-controller`
- Risk Register → `risk-manager`
- Organizacional / RACI → `scope-analyst`
- Retrospectiva / Lessons → `lessons-learned-facilitator`
- Contratos / SLAs → `contract-manager`
- Metricas / KPIs → `evm-analyst`
- URLs → `methodology-architect`

### Paso 2 — Creacion de extracto Markdown
Se genera un extracto estructurado en `project/rag-priming/` con formato estandar: resumen ejecutivo, contenido clave, relevancia para el proyecto, vinculacion a entregables, tags de evidencia.

### Paso 3 — Clasificacion y vinculacion
El extracto se vincula al entregable destino segun su tipo:
- Project charter → 00 Charter
- Cronograma / Gantt → 03 Schedule & Baseline
- Presupuesto → 05 Budget Baseline
- Risk register → 06 Risk Register
- Org chart → 01 Stakeholder Map, 04 Resource Plan
- Metricas EVM → 13 Status & EVM Report

### Paso 4 — Indexacion
Se actualiza el session-state, el master-index y el changelog de la sesion.

### Paso 5 — Incorporacion al riel de proyecto
El conductor evalua el impacto en entregables ya generados y marca revisiones si es necesario.

---

## Creacion de nuevos documentos RAG

Si un adjunto no encaja en ningun documento RAG existente, se crea uno nuevo:

| Regla | Detalle |
|-------|---------|
| **Naming** | `priming-rag-{tema-descriptivo}.md` |
| **Ubicacion** | `references/` (persistente) o `project/rag-priming/` (sesion) |
| **Estructura** | Fuentes, valor para el proyecto, takeaways, keywords, query hooks |
| **Decision** | Solo el `project-conductor` autoriza la creacion |

### Convenciones de naming para extractos

| Patron | Ejemplo |
|--------|---------|
| `{nombre_original}_extracto.md` | `project_plan_extracto.md` |
| `{url_slug}_extracto.md` | `jira_board_config_extracto.md` |
| `{fecha}_{tipo}_{seq}_extracto.md` | `2026-03-16_cronograma_01_extracto.md` |
| `priming-rag-adjunto-{nombre}.md` | `priming-rag-adjunto-risk-register.md` |

---

## Triggers automaticos

| Evento | Accion |
|--------|--------|
| Usuario comparte archivo | Iniciar flujo de 5 pasos |
| Usuario pega URL | Fetch + flujo de 5 pasos |
| Usuario referencia documento | Buscar en `references/`, solicitar si no existe |
| Proyecto nuevo inicia | Escanear inputs disponibles, generar extractos |
| Sesion se reanuda | Verificar si hay adjuntos sin procesar |

---

## Tipos de adjuntos especiales para PM

| Tipo | Procesamiento especial |
|------|----------------------|
| `.mpp` (MS Project) | Extraer tareas, dependencias, ruta critica, recursos |
| `.xlsx` (Budget) | Extraer lineas de presupuesto, categorias, totales |
| `.xlsx` (Risk Register) | Extraer riesgos, probabilidad, impacto, respuestas |
| `.csv` (Jira Export) | Extraer stories, epics, velocity, cycle time |
| `.pdf` (Charter/Contract) | Extraer objetivos, alcance, restricciones, supuestos |
| `.pptx` (Steering Deck) | Extraer decisiones, action items, status |

---

## Referencia detallada

Para el protocolo completo de procesamiento de adjuntos, incluyendo manejo de archivos grandes, adjuntos simultaneos, conflictos e informacion confidencial, consultar:
`references/priming-rag-adjuntos-policy.md`

---

*PMO-APEX — La excelencia en gestion de proyectos se construye con evidencia.*
