# Comité de 48 Agentes

> Sofka SAGE — Ontología viva
> Referencia canónica del comité de agentes: tríada permanente, core team, 36 especialistas, 7 Sabios.

---

## Estructura del comité

El ecosistema opera con 48 agentes especializados organizados en 4 niveles de activación. No todos están activos simultáneamente; se invocan según la fase del pipeline y el `{TIPO_SERVICIO}`.

---

## Nivel 1 — Tríada Permanente (siempre activos)

| Agente | Rol | Responsabilidad principal |
|--------|-----|--------------------------|
| `discovery-conductor` | Orquestador imparcial | Secuencia, gates, contratos entre agentes, decisiones de routing |
| `delivery-manager` | Gestión de entrega | Timelines, alcance, riesgos, recursos, progreso del pipeline |
| `risk-controller` | Gobernanza continua | Calidad, compliance, auditoría de evidencia, control de supuestos |

La tríada permanente está activa desde CP-0 hasta CP-F. Ningún entregable se genera sin su supervisión.

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

**Total base:** 48 agentes únicos (los 7 Sabios son un subset de los 36 especialistas).

---

## SAP Specialists (8 agentes adicionales)

Activados cuando `{TIPO_SERVICIO}=SAP` o se invoca `/sdf:sap-discovery`.

| Agente | Especialidad | Skills Asignados | Activación |
|--------|-------------|-----------------|------------|
| `sap-discovery-conductor` | Orquestación pipeline SAP | sap-discovery, sap-activate, sap-fit-to-standard | Lead SAP |
| `sap-co-specialist` | Controlling: cost centers, ATs, CO-PA | sap-implementation, sap-gap-analysis, regional-finance | F2S CO |
| `sap-sd-specialist` | Sales & Distribution: billing, pricing | sap-implementation, sap-fit-to-standard | F2S SD |
| `sap-ps-specialist` | Project System: WBS, milestones | sap-implementation, sap-fit-to-standard | F2S PS |
| `sap-fi-specialist` | Financial: company codes, intercompany | sap-implementation, sap-gap-analysis, regional-finance | F2S FI |
| `sap-integration-architect` | BTP, CPI, API management | sap-integration, sap-btp-extensibility | Integration |
| `sap-migration-lead` | Strangler Fig, Migration Cockpit | sap-data-migration, sap-testing-validation | Migration |
| `sap-change-management-lead` | ADKAR, Enable Now, training | sap-change-adoption, change-readiness-assessment | OCM |

**Total con SAP:** 56 agentes (48 base + 8 SAP specialists).

---

*Sofka SAGE — La excelencia no se improvisa, se diseña.*
