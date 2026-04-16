# Política RAG-Priming y Adjuntos

> MAO Framework — Ontología viva
> Referencia canónica del comportamiento RAG, priming automático y procesamiento de adjuntos.

---

## Comportamiento al iniciar sesión (automático)

Cuando el plugin se activa en un repositorio, se ejecuta la siguiente secuencia de priming:

| Paso | Acción | Resultado |
|------|--------|-----------|
| 1 | **Escanear entregables** | Detectar progreso del pipeline (0/16 a 16/16) |
| 2 | **Generar contexto** | Crear `SESSION-README.md` + `SESSION-CLAUDE.md` en `discovery/` |
| 3 | **Activar ghost menu** | Navegación contextual persistente al final de cada artefacto |
| 4 | **Iniciar changelog** | Registro de acciones para continuidad ante crisis de sesión |
| 5 | **Cargar priming-RAG** | 20+ archivos de conocimiento base desde `references/` |

El orquestador (`discovery-conductor`) verifica que los 5 pasos se completen antes de iniciar cualquier flujo de discovery.

---

## Documentos de priming-RAG disponibles

Los archivos en `references/` alimentan el contexto del ecosistema. Se organizan en las siguientes categorías:

### Capacidades por línea de servicio
- `priming-rag-sda-capabilities.md` — Software Development & Architecture
- `priming-rag-qa-capabilities.md` — Quality Assurance
- `priming-rag-rpa-capabilities.md` — Robotic Process Automation
- `priming-rag-data-ai-capabilities.md` — Data & AI
- `priming-rag-cloud-capabilities.md` — Cloud & Platform
- `priming-rag-sas-capabilities.md` — Staff Augmentation Services
- `priming-rag-management-capabilities.md` — Management & Governance

### Inteligencia sectorial
- `priming-rag-banking-industry.md` — Sector financiero y bancario
- `priming-rag-retail-industry.md` — Sector retail y comercio

### Modelos y marcos
- `priming-rag-service-models.md` — Modelos de servicio (T&M, fixed price, outcome-based)
- `priming-rag-contractual-models.md` — Modelos contractuales y legales
- `priming-rag-certifications.md` — Certificaciones y compliance
- `priming-rag-impact-metrics.md` — Métricas de impacto empresarial
- `priming-rag-ai-scale.md` — AI SCALE framework
- `priming-rag-coe-management.md` — Centro de Excelencia Management

### Referencia operativa
- `service-type-matrix.md` — Routing por tipo de servicio (canónica)
- `priming-rag-adjuntos-policy.md` — Política de procesamiento de adjuntos
- `canonical-tokens.md` — Tokens de diseño para branding

---

## Procesamiento de adjuntos (flujo de 5 pasos)

Cuando un usuario comparte un archivo, URL, imagen u otro input externo durante una sesión de discovery:

### Paso 1 — Lectura e interpretación
El `discovery-conductor` clasifica el tipo de adjunto y delega al agente especializado:
- Código fuente → `technical-architect`
- Documentación → `domain-analyst`
- Datos → `data-strategist`
- Diagramas → `technical-architect`
- Configuración → `technical-architect`
- Contratos/legal → `compliance-analyst`
- URLs → `research-scientist`

### Paso 2 — Creación de extracto Markdown
Se genera un extracto estructurado en `discovery/rag-priming/` con formato estándar: resumen ejecutivo, contenido clave, relevancia para discovery, vinculación a entregables, tags de evidencia.

### Paso 3 — Clasificación y vinculación
El extracto se vincula al entregable destino según su tipo:
- Spec técnica → 03 AS-IS, 04 Flujos, 07 Spec
- Org chart → 01 Stakeholder Map
- Presupuesto → 06 Roadmap, 08 Pitch
- Arquitectura → 03 AS-IS, 11 Hallazgos Técnicos

### Paso 4 — Indexación
Se actualiza el session-state, el master-index y el changelog de la sesión.

### Paso 5 — Incorporación al riel de discovery
El conductor evalúa el impacto en entregables ya generados y marca revisiones si es necesario.

---

## Creación de nuevos documentos RAG

Si un adjunto no encaja en ningún documento RAG existente, se crea uno nuevo:

| Regla | Detalle |
|-------|---------|
| **Naming** | `priming-rag-{tema-descriptivo}.md` |
| **Ubicación** | `references/` (persistente) o `discovery/rag-priming/` (sesión) |
| **Estructura** | Fuentes, valor para discovery, takeaways, keywords, query hooks |
| **Decisión** | Solo el `discovery-conductor` autoriza la creación |

### Convenciones de naming para extractos

| Patrón | Ejemplo |
|--------|---------|
| `{nombre_original}_extracto.md` | `architecture_overview_extracto.md` |
| `{url_slug}_extracto.md` | `github_com_repo_extracto.md` |
| `{fecha}_{tipo}_{seq}_extracto.md` | `2026-03-14_presentacion_01_extracto.md` |
| `priming-rag-adjunto-{nombre}.md` | `priming-rag-adjunto-contrato-sas.md` |

---

## Triggers automáticos

| Evento | Acción |
|--------|--------|
| Usuario comparte archivo | Iniciar flujo de 5 pasos |
| Usuario pega URL | Fetch + flujo de 5 pasos |
| Usuario referencia documento | Buscar en `references/`, solicitar si no existe |
| Discovery nuevo inicia | Escanear inputs disponibles, generar extractos |
| Discovery se reanuda | Verificar si hay adjuntos sin procesar |

---

## Referencia detallada

Para el protocolo completo de procesamiento de adjuntos, incluyendo manejo de archivos grandes, adjuntos simultáneos, conflictos e información confidencial, consultar:
`references/priming-rag-adjuntos-policy.md`

---

*MAO Framework — La excelencia no se improvisa, se diseña.*
