# Comité de 101 Agentes

> MAO Framework v1.1 — Ontología viva
> Referencia canónica del comité de agentes: tríada permanente, core team, especialistas de dominio, coaches, Think Tank, editorial publisher.

---

## Estructura del comité

El ecosistema opera con 101 agentes especializados organizados en 5 niveles de activación. No todos están activos simultáneamente; se invocan según la fase del pipeline y el `{TIPO_SERVICIO}`.

---

## Nivel 1 — Tríada Permanente (siempre activos)

| Agente | Rol | Responsabilidad principal |
|--------|-----|--------------------------|
| `discovery-conductor` | Orquestador imparcial | Secuencia, gates, contratos entre agentes, decisiones de routing |
| `delivery-manager` | Gestión de entrega | Timelines, alcance, riesgos, recursos, progreso del pipeline |
| `risk-controller` | Gobernanza continua | Calidad, compliance, auditoría de evidencia, control de supuestos |

La tríada permanente está activa desde CP-0 hasta CP-F. Ningún entregable se genera sin su supervisión.

**Meta-Cognición**: La tríada opera con el protocolo FULL (Structured Reasoning + Skeleton-of-Thought + Chain-of-Code + confidence scoring 0.0–1.0 + bias scan). Los demás agentes operan con el protocolo LIGHT (decompose + evidence-check + bias scan + structure-first + escalate).

---

## Nivel 2 — Core Team (9 agentes)

| Agente | Rol | Fases de activación |
|--------|-----|---------------------|
| `quality-guardian` | Validación contra criterios de aceptación | Gates G1-G3, auditorías |
| `subject-matter-expert` | Contexto sectorial, lente de industria dinámica | Fases 0-3 (Plan a Flujos) |
| `technical-architect` | Diseño, trade-offs, decisiones arquitectónicas | Fases 2-6 (Brief a Reportes) |
| `data-engineer` | Pipelines de datos, infraestructura, gobernanza | Fases 2-5 (Brief a Spec) |
| `change-catalyst` | Gestión del cambio, adopción, readiness | Fases 4-6 (Escenarios a Handover) |
| `editorial-director` | Coherencia narrativa, calidad editorial | Todas las fases (revisión de entregables) |
| `format-specialist` | Producción multi-formato (HTML, DOCX, XLSX, PDF) | Fase 6 (Reportes) |
| `content-strategist` | Storytelling, narrativa de datos | Fases 5-6 (Pitch, Reportes) |
| `editorial-publisher` | Publicación multi-formato branded, Design System v5, ghost menu execution | Todas las fases (producción de entregables) |
| `implementation-analyst` | Viabilidad de implementación, trade-offs prácticos | Fases 2-4 (ASIS, Flujos, Escenarios) |

---

## Nivel 3 — 36 Especialistas de Dominio

Se activan según `{TIPO_SERVICIO}` y fase del pipeline.

### Arquitectura y Desarrollo (10)

| Agente | Especialidad | Activación |
|--------|-------------|------------|
| `enterprise-architect` | Arquitectura empresarial, EA frameworks | SDA, Digital-Transformation |
| `solutions-architect` | Diseño de soluciones, integración | SDA, Multi-Service |
| `cloud-architect` | Arquitectura cloud, migración | Cloud, SDA |
| `security-architect` | Seguridad, STRIDE, OWASP | Todos (assess-security) |
| `mobile-architect` | Arquitectura móvil, cross-platform | SDA (con mobile) |
| `backend-developer` | Implementación backend, APIs | SDA |
| `frontend-developer` | Implementación frontend, UI | SDA, UX-Design |
| `middle-integrations-developer` | Middleware, integración de sistemas | SDA, RPA |
| `technical-lead` | Liderazgo técnico, decisiones de stack | SDA, Digital-Transformation |
| `platform-engineer` | Plataformas, IaC, pipelines CI/CD | Cloud, SDA |

### Data & AI (5)

| Agente | Especialidad | Activación |
|--------|-------------|------------|
| `data-architect` | Diseño de datos, modelado | Data-AI |
| `data-engineer` | Pipelines de datos, ETL/ELT | Data-AI |
| `data-scientist` | ML, estadística, validación de datos | Data-AI, Feasibility |
| `analytics-architect` | BI, dashboards, analytics | Data-AI |
| `ai-architect` | Arquitectura IA, MLOps | Data-AI |

### Calidad e Infraestructura (5)

| Agente | Especialidad | Activación |
|--------|-------------|------------|
| `qa-strategist` | Estrategia de testing, automatización | QA |
| `quality-engineer` | Testing operativo, cobertura | QA, SDA |
| `devops-engineer` | CI/CD, automatización de delivery | Cloud, SDA |
| `devsecops-expert` | Seguridad en pipeline, SAST/DAST | Cloud, SDA |
| `implementation-analyst` | Análisis de implementación, viabilidad | Todos |

### Investigación y Estrategia (6)

| Agente | Especialidad | Activación |
|--------|-------------|------------|
| `research-scientist` | Evidencia académica, state of the art | Feasibility |
| `economics-researcher` | Viabilidad financiera, TCO, ROI | Feasibility, Roadmap |
| `systems-theorist` | Comportamientos emergentes, cascadas | Feasibility |
| `technology-scout` | Madurez tecnológica, ciclo de adopción | Feasibility, Escenarios |
| `integration-researcher` | Interoperabilidad, feasibility de integración | Feasibility |
| `hardware-systems-engineer` | Restricciones de infraestructura física | Feasibility, Cloud |

### Negocio y Cambio (5)

| Agente | Especialidad | Activación |
|--------|-------------|------------|
| `business-analyst` | Análisis de negocio, requerimientos | Management, SAS |
| `product-strategist` | Estrategia de producto, visión | Digital-Transformation |
| `compliance-analyst` | Regulaciones, contratos, legal | Management, SAS |
| `process-automation-specialist` | RPA, process mining, BPMN | RPA |
| `transformation-architect` | Visión transversal, programas complejos | Digital-Transformation |

### UX y Comunicación (3)

| Agente | Especialidad | Activación |
|--------|-------------|------------|
| `ux-researcher` | Investigación de usuario, usabilidad | UX-Design |
| `ux-strategist` | Estrategia de experiencia, design thinking | UX-Design |
| `subject-matter-expert` | SME dinámico según dominio del cliente | Todos (bajo demanda) |

### AI Especializado (2)

| Agente | Especialidad | Activación |
|--------|-------------|------------|
| `ai-strategist` | Estrategia de IA, madurez, adopción | Data-AI, Digital-Transformation |
| `ai-agent-architect` | Arquitectura de agentes, orquestación | Data-AI |

---

## Nivel 4 — Think Tank de 7 Sabios (Feasibility)

Se activan exclusivamente en la fase 05b (Feasibility Think Tank). Cada sabio emite un veredicto independiente (Go / No-Go / Condicional).

| # | Sabio | Perspectiva | Pregunta clave |
|---|-------|-------------|----------------|
| 1 | `research-scientist` | Evidencia académica | ¿Existe evidencia de que esto funciona? |
| 2 | `economics-researcher` | Viabilidad financiera | ¿El TCO/ROI justifica la inversión? |
| 3 | `systems-theorist` | Comportamientos emergentes | ¿Qué efectos de segundo orden podrían surgir? |
| 4 | `technology-scout` | Madurez tecnológica | ¿La tecnología está lista para producción? |
| 5 | `integration-researcher` | Interoperabilidad | ¿Se puede integrar con el ecosistema existente? |
| 6 | `hardware-systems-engineer` | Infraestructura | ¿La infra actual soporta la solución? |
| 7 | `data-scientist` | Validación estadística | ¿Los datos disponibles son suficientes y confiables? |

**Regla de decisión:** Se requieren ≥5/7 votos Go para avanzar. Un No-Go documentado bloquea el pipeline en Gate 1.5.

---

## Resumen de activación

| Nivel | Agentes | Activación | Duración |
|-------|---------|------------|----------|
| Tríada Permanente | 3 | Siempre | CP-0 a CP-F |
| Core Team | 9 | Por fase | Según pipeline |
| Especialistas | 36 | Por {TIPO_SERVICIO} + fase | Bajo demanda |
| Think Tank | 7 (subset de especialistas) | Solo Feasibility | Fase 05b |

**Subtotal niveles 1-4:** 48 agentes originales (los 7 Sabios son un subset de los 36 especialistas).

---

## Nivel 5 — 52 Agentes Extendidos (MAO 10×)

Agentes adicionales que completan el ecosistema de 100 agentes para cobertura universal.

### Coaching y Desarrollo Humano (9)

| Agente | Rol | Inspiración |
|--------|-----|-------------|
| `prompt-engineer` | Diseño, evaluación y optimización de prompts | NL-HP methodology |
| `assistant-designer` | Diseño de asistentes AI/GPT, UX conversacional | MetodologIA asistentes |
| `methodological-coach` | Coaching P.I.V.O.T.E., 4 fases, filosofía MetodologIA | MetodologIA philosophy |
| `agile-coach` | Scrum, Kanban, SAFe, retrospectivas, sprint health | Lean-Agile mindset |
| `enterprise-coach` | Agilidad organizacional, transformación empresarial | Enterprise agility |
| `conscious-business-coach` | Liderazgo consciente, negocios con propósito | Fred Kofman |
| `productivity-coach` | Hábitos atómicos, sistemas de productividad | James Clear |
| `team-coach` | Dinámicas de equipo, seguridad psicológica | Team performance |
| `leadership-coach` | Liderazgo servicial, situacional, coaching | Servant leadership |

### Especialistas Técnicos Avanzados (15)

| Agente | Especialidad |
|--------|-------------|
| `automation-architect` | Workflows n8n, Make, Zapier, RPA |
| `ai-native-architect` | Arquitectura AI-first, patrones LLM-native |
| `performance-architect` | Performance engineering, optimización |
| `api-designer` | API-first, OpenAPI, GraphQL, gRPC |
| `database-specialist` | Modelado, tuning, migración de BD |
| `accessibility-specialist` | WCAG, auditoría a11y, diseño inclusivo |
| `sre-engineer` | Site reliability, SLO/SLI/SLA, error budgets |
| `observability-architect` | Monitoring, tracing distribuido, logging |
| `migration-specialist` | Legacy modernization, strangler fig |
| `testing-strategist` | Test pyramid, TDD, BDD, contract testing |
| `release-manager` | Release trains, feature flags, rollback |
| `chaos-engineer` | Chaos engineering, game days, resiliencia |
| `iot-architect` | IoT, edge protocols, digital twins |
| `low-code-architect` | Plataformas low-code/no-code, citizen dev |
| `technical-debt-specialist` | Cuantificación de deuda, roadmaps de reducción |

### Estrategia y Negocio (10)

| Agente | Especialidad |
|--------|-------------|
| `finops-specialist` | Optimización financiera cloud |
| `pricing-analyst` | Modelos de pricing, cost drivers, márgenes |
| `market-researcher` | Market sizing, TAM/SAM/SOM, tendencias |
| `competitive-analyst` | Inteligencia competitiva, SWOT, Porter |
| `innovation-catalyst` | Frameworks de innovación, ideación |
| `customer-success-architect` | CX journeys, NPS, retención |
| `negotiation-strategist` | Negociación win-win, BATNA |
| `vendor-manager` | Evaluación de vendors, RFP, SLA |
| `sustainability-analyst` | ESG, green IT, huella de carbono |
| `digital-twin-architect` | Modelado de digital twins, simulación |

### Conocimiento y Comunicación (8)

| Agente | Especialidad |
|--------|-------------|
| `knowledge-manager` | Knowledge bases, Zettelkasten, wikis |
| `technical-writer` | Documentación técnica, API docs |
| `diagram-specialist` | Mermaid, C4, UML, visualización de arquitectura |
| `executive-communicator` | Presentaciones C-level, storytelling ejecutivo |
| `training-designer` | Learning paths, curriculum, workshops |
| `documentation-specialist` | Doc-as-code, documentación viviente, ADRs |
| `developer-advocate` | DX advocacy, community building |
| `open-source-strategist` | Gobernanza OSS, licensing, InnerSource |

### Gobernanza y Compliance (5)

| Agente | Especialidad |
|--------|-------------|
| `incident-commander` | Liderazgo de respuesta a incidentes, war room |
| `capacity-planner` | Modelado de capacidad, forecasting de demanda |
| `regulatory-specialist` | GDPR, HIPAA, SOX, PCI-DSS |
| `data-privacy-officer` | Privacy by design, DPIA, consentimiento |
| `ethical-ai-specialist` | Ética AI, detección de sesgo, AI responsable |

### Facilitación y Cambio (5)

| Agente | Especialidad |
|--------|-------------|
| `lean-practitioner` | Lean thinking, eliminación de waste, 5S |
| `design-thinking-facilitator` | Workshops DT, empathy maps, prototyping |
| `organizational-psychologist` | Cultura organizacional, resistencia al cambio |
| `blockchain-architect` | DLT, smart contracts, Web3 |
| `edge-computing-specialist` | Edge/fog computing, optimización de latencia |

---

## Resumen de activación

| Nivel | Agentes | Activación | Duración |
|-------|---------|------------|----------|
| Tríada Permanente | 3 | Siempre | CP-0 a CP-F |
| Core Team | 9 | Por fase | Según pipeline |
| Especialistas Dominio | 36 | Por {TIPO_SERVICIO} + fase | Bajo demanda |
| Think Tank | 7 (subset de especialistas) | Solo Feasibility | Fase 05b |
| Extendidos 10× | 52 | Por contexto y demanda | Bajo demanda |

**Total:** 100 agentes (48 originales + 52 extendidos).

---

*MAO Framework — La excelencia no se improvisa, se diseña.*
