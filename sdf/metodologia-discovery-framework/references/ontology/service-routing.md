# Service Routing

> MAO Framework — Ontología viva
> Puntero a la referencia canónica de enrutamiento por tipo de servicio.

---

## Referencia canónica

La definición completa de routing por tipo de servicio, incluyendo reglas de auto-detección, skill routing matrix, composición de comité experto, inputs requeridos y convenciones de naming, se encuentra en:

**`references/service-type-matrix.md`**

Este archivo es la fuente de verdad para toda decisión de routing.

---

## Resumen de los 10 tipos de servicio

| Tipo de servicio | Descripción | Señales de auto-detección |
|-----------------|-------------|--------------------------|
| **SDA** | Software Development & Architecture — diseño, desarrollo y arquitectura de software | Codebase path proporcionado, sin tipo explícito (default) |
| **QA** | Quality Assurance — estrategia de testing, automatización, calidad de software | "testing", "QA", "ISTQB", "test factory", "automatización de pruebas" |
| **Management** | Gestión y gobernanza — PMO, metodologías, delivery management | "PMO", "agile coach", "delivery manager", "SAFe", "gobernanza" |
| **RPA** | Robotic Process Automation — automatización de procesos, bots, process mining | "automation", "bots", "UiPath", "RPA", "BPMN", "process mining" |
| **Data-AI** | Data & Artificial Intelligence — gobernanza de datos, BI, analytics, ML, GenAI | "data governance", "BI", "AI", "ML", "data science", "LLM", "GenAI" |
| **Cloud** | Cloud & Platform — migración, DevOps, SRE, infraestructura cloud | "cloud", "DevOps", "SRE", "Kubernetes", "AWS", "Azure", "GCP", "Terraform" |
| **SAS** | Staff Augmentation Services — escalamiento de equipos, talento, perfiles | "staff augmentation", "talent", "hiring", "team scaling", "perfiles" |
| **UX-Design** | UX & Design — investigación de usuario, design systems, usabilidad | "design system", "UX research", "usability", "wireframes", "prototypes" |
| **Digital-Transformation** | Transformación Digital — programas multi-workstream de modernización | "digital transformation", "modernization program", "multi-workstream" |
| **Multi-Service** | Servicio combinado — cuando se detectan 2+ tipos simultáneamente | Múltiples reglas coincidentes (2+ tipos detectados) |

---

## Mecánica de routing

1. El `discovery-conductor` evalúa el contexto al inicio de la sesión
2. Las reglas de auto-detección se ejecutan en orden de prioridad (1-10)
3. La primera coincidencia determina el tipo detectado
4. Si 2+ reglas coinciden → se aplica Multi-Service
5. Se solicita confirmación al usuario: _"Tipo de servicio detectado: {X}. ¿Confirma o desea ajustar?"_
6. El tipo confirmado activa el subset correspondiente de skills, agentes y secciones de entregables

---

## Impacto del routing

| Dimensión | Efecto del routing |
|-----------|-------------------|
| **Skills activados** | Subset específico por tipo de servicio |
| **Variante AS-IS** | Secciones y profundidad ajustadas al servicio |
| **Método de sizing** | FTE-meses, story points, bot hours, etc. según tipo |
| **Comité experto** | Composición ajustada (ver `agent-committee.md`) |
| **Sufijo de naming** | `_SDA`, `_QA`, `_Cloud`, etc. en nombres de entregables |

---

*MAO Framework — La excelencia no se improvisa, se diseña.*
