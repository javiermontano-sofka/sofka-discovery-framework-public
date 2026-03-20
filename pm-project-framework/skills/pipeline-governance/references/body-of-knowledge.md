---
skill: pipeline-governance
type: body-of-knowledge
version: 1.0
author: Javier Montaño
copyright: © Comunidad MetodologIA
updated: 2026-03-13
---

# Body of Knowledge — Pipeline Governance

## 1. Fundamentos Teóricos: Gobernanza como Disciplina

La gobernanza de programas tecnológicos tiene raíces en múltiples tradiciones: la **teoría de la agencia** (Jensen & Meckling, 1976), los **sistemas de control organizacional** (Anthony, 1965) y la **gestión de calidad total** (Deming, 1986). El principio unificador es que los sistemas complejos sin mecanismos de control explícitos degradan hacia el caos: el esfuerzo sin dirección genera outputs inconexos que nadie puede validar ni auditar.

En el contexto del discovery tecnológico, la gobernanza resuelve cuatro problemas estructurales:
1. **Desincronización entre fases**: outputs producidos sin validar que la fase siguiente los puede consumir
2. **Dilución de responsabilidades**: nadie sabe quién aprueba qué, en qué momento
3. **Propuestas no auditables**: el cliente no puede rastrear cómo llegaron a las conclusiones
4. **Scope creep silencioso**: el alcance crece sin que nadie mida el impacto en timeline y calidad

**Pipeline Governance como PMO especializada**: no es gestión de proyectos genérica (Gantt, burndown, sprints), sino gobernanza específica de un pipeline de discovery con sus artefactos, gates y contratos únicos. La distinción es importante: un PMO genérico aplicaría templates de proyecto; la gobernanza del pipeline aplica lógica de programa de consultoría.

## 2. Marcos de Referencia Clave

### 2.1 PMBOK — Project Management Body of Knowledge (PMI, 7ª edición, 2021)
El PMBOK 7 transiciona de procesos a principios, reconociendo que la gestión de proyectos es contextual. Los principios relevantes para pipeline governance: administración diligente, colaboración con stakeholders, navegación de complejidad, y optimización de respuestas a riesgos. El framework adopta el PMBOK como base teórica y lo especializa para el contexto de discovery.

### 2.2 Managing Successful Programmes — MSP (AXELOS, 5ª ed., 2020)
MSP distingue entre proyectos (outputs) y programas (outcomes, benefits). El discovery pipeline es un programa: su objetivo no es producir entregables (outputs) sino entregar una propuesta comercial viable que genere un compromiso de ejecución (outcome). MSP introduce el concepto de **Blueprint** (estado futuro deseado) y **Benefits Realization Plan** — análogos al roadmap y al pitch ejecutivo del discovery.

### 2.3 COBIT — Control Objectives for Information Technology (ISACA, 2019)
COBIT proporciona el marco de control de TI más adoptado globalmente. Sus principios de gobernanza (Evaluate, Direct, Monitor) mapean directamente a los roles del pipeline governance: evaluar cada fase contra criterios, dirigir hacia el siguiente gate, monitorear con el dashboard RAG. COBIT 2019 introduce el concepto de **Governance System** — un conjunto integrado de instrumentos de gobernanza, no controles aislados.

### 2.4 ISO/IEC 38500 — Corporate Governance of IT (2015)
El estándar internacional de gobernanza de TI define seis principios: Responsabilidad, Estrategia, Adquisición, Rendimiento, Conformidad, Comportamiento Humano. El Proposal QA del pipeline governance implementa los principios de Rendimiento (¿entregamos valor?) y Conformidad (¿seguimos el proceso acordado?) antes de que la propuesta llegue al cliente.

### 2.5 Proposal Management — Shipley Associates Methodology
El Shipley Proposal Guide es el estándar de facto para gestión de propuestas en empresas de servicios tecnológicos. Su proceso B&P (Bid and Proposal) incluye revisiones formales (Pink Team, Red Team, Gold Team) antes de la entrega al cliente. El S5 Proposal QA Validation del pipeline governance es la implementación del Red Team Review de Shipley: una validación adversarial de coherencia, completitud, viabilidad y alineación antes del envío.

### 2.6 Earned Value Management — EVM (PMI, ANSI/EIA-748)
EVM mide el rendimiento del proyecto comparando trabajo planificado, ejecutado y gastado. El dashboard RAG del pipeline governance implementa una versión cualitativa de EVM: el semáforo por fase (verde/amarillo/rojo) refleja la desviación entre plan y actual en términos de tiempo y calidad de entregables.

## 3. Obras Seminales

| Obra | Autor(es) | Año | Aporte al Pipeline Governance |
|------|-----------|-----|-------------------------------|
| *A Guide to the PMBOK* | Project Management Institute | 2021 | Principios de gestión de programas, gestión de stakeholders, control de riesgos |
| *Managing Successful Programmes* | AXELOS/OGC | 2020 | Gobernanza de programa, benefits realization, blueprint |
| *COBIT 2019 Framework* | ISACA | 2019 | Sistema integrado de gobernanza y control de TI |
| *The Governance of Enterprise IT* | De Haes & Van Grembergen | 2015 | Mecanismos de gobernanza de TI, estructuras, procesos, relacionamiento |
| *Proposal Management* | Shipley Associates | 2011 | Proceso B&P, revisiones de equipo, validación pre-envío |
| *Out of the Crisis* | W. Edwards Deming | 1986 | Calidad como sistema, control estadístico de procesos, mejora continua |
| *The Checklist Manifesto* | Atul Gawande | 2009 | Checklists como mecanismo de gobernanza para procesos de alto riesgo |
| *Accelerate* | Forsgren, Humble, Kim | 2018 | DORA metrics, delivery performance, gobernanza orientada a outcomes |

## 4. Metodologías de Gobernanza Aplicadas

### 4.1 Gate Review Process (Cooper Stage-Gate Adaptado)
Cada gate del pipeline (G1, G2, G3) implementa el formato Cooper adaptado para consultoría: criterios de entrada, verificación de entregables, cadena de evidencia, dependencias resueltas, riesgos transferidos, y veredicto formal (Pass / Conditional Pass / Fail). La clave de Cooper es que el gate no es una revisión de progreso sino una **decisión de inversión**: ¿tiene sentido continuar con el dinero ya comprometido?

### 4.2 Dependency Management — PERT/CPM
El control de dependencias cross-fase implementa los principios de PERT (Program Evaluation and Review Technique) y CPM (Critical Path Method): identificar las dependencias críticas cuya demora impacta directamente la fecha de entrega de la propuesta. La matriz de dependencias input/output es la representación visual de la red de precedencias.

### 4.3 Risk-Adjusted Governance
Los gates del pipeline incorporan evaluación de riesgo además de completitud técnica: un entregable puede estar técnicamente completo pero cargado de supuestos sin validar que hacen la propuesta riesgosa. La coordinación con `risk-controlling-dynamics` implementa una gobernanza ajustada por riesgo, no solo por checklist de entregables.

### 4.4 Proposal Red Team Review
Inspirado en el proceso militar de Red Team (equipo adversarial que intenta invalidar un plan), el S5 Proposal QA aplica cuatro lentes críticas: coherencia técnica, completitud, viabilidad de promesas, y alineación con hallazgos. Un Red Team efectivo no busca confirmar — busca invalidar. El threshold 3.5/5.0 con ninguna dimensión <3 implementa este principio: una propuesta excelente en tres dimensiones pero deficiente en una falla igualmente.

## 5. Principios de Diseño del Sistema de Gobernanza

### 5.1 Gobernanza Proporcional al Riesgo
No toda governance es igual para todos los contextos. La Trade-off Matrix del skill reconoce tres niveles: Full governance (7 secciones, alta confianza, alta fricción), Lite governance (S1+S2+S5, balance), QA-only (S5, enfocado en validación de propuesta). El principio: la gobernanza crea valor cuando el costo de los controles es menor que el costo de los errores que previene.

### 5.2 Trazabilidad como Responsabilidad
Cada fallo en el Proposal QA se traza a la fase origen. Coherencia falla → Phase 3b y 4. Completitud falla → fase productora del entregable faltante. Esta trazabilidad implementa el principio de **responsabilidad directa**: el equipo de cada fase es responsable de la calidad de sus outputs, no del equipo de governance.

### 5.3 Separación entre Tracking y Control
El pipeline governance **reporta y valida**, no **ejecuta**. No produce análisis técnicos ni toma decisiones de arquitectura. Su valor está en la meta-capa: asegurar que las fases se produzcan en orden, con calidad, con dependencias resueltas y con la propuesta auditada antes de llegar al cliente.

### 5.4 Decision Log como Memoria Organizacional
El Decision Log de cada gate — qué se decidió, con qué evidencia, con quién presente — es la memoria del programa. En discoveries con múltiples semanas de duración, los participantes olvidan. El Decision Log permite reconstruir la cadena lógica que llevó a la propuesta final, critica para gestionar objeciones del cliente y para el proceso de lessons learned.

## 6. Herramientas y Artefactos Clave

### 6.1 Gantt de Programa con Gates como Milestones
El Gantt del pipeline governance no es un Gantt de proyecto tradicional (tareas con horas estimadas) sino un **Gantt de hitos de gobernanza**: los gates son los milestones, y las barras representan las fases entre gates. El estado RAG por fase actualiza el Gantt en tiempo real.

### 6.2 Proposal QA Scorecard
El scorecard compuesto (4 dimensiones × 5 puntos) con threshold 3.5/5.0 y ninguna dimensión <3 implementa el principio de **calidad balanceada**: no se puede compensar una dimensión débil con una excelente. Una propuesta coherente y completa pero inviable comercialmente no pasa QA.

### 6.3 RAG Dashboard
El semáforo verde/amarillo/rojo por fase implementa el principio de **gestión por excepción**: el Dashboard solo requiere atención cuando hay elementos amarillos o rojos. Verde = sin intervención. Amarillo = monitorear. Rojo = escalar.

### 6.4 Scope Change Log
Todo cambio de alcance durante el engagement — por descubrimiento de complejidad oculta, cambio de requerimientos del cliente, o hallazgos inesperados — queda registrado con: descripción del cambio, impacto estimado (tiempo, calidad, cobertura), decisión tomada, y rationale. Sin este registro, el alcance final de la propuesta no se puede comparar con el alcance original.

## 7. Relaciones con Otros Skills del Framework

| Skill | Tipo de Relación | Descripción |
|-------|-----------------|-------------|
| **discovery-orchestrator** | Padre jerárquico | El orchestrator activa pipeline-governance en todas las fases; recibe sus gates y QA como inputs de control |
| **risk-controlling-dynamics** | Socio permanente | Siempre activo junto a pipeline-governance; riesgo y gobernanza son inseparables en el pipeline |
| **executive-pitch** | Cliente del S5 | El pitch es el artefacto principal que pasa por Proposal QA antes de envío al cliente |
| **functional-spec** | Cliente del S5 | La spec funcional es validada en S5 para asegurar que el pitch no promete lo que la spec no cubre |
| **solution-roadmap** | Cliente del G2 | Gate 2 evalúa roadmap + cost drivers; pipeline-governance emite el veredicto |
| **scenario-analysis** | Cliente del G1 | Gate 1 evalúa el escenario aprobado; pipeline-governance valida los criterios formales |
| **discovery-handover** | Cliente del G3 | Gate 3 es prerequisito del handover; pipeline-governance cierra el programa formalmente |
| **stakeholder-mapping** | Alimenta S3 | El RACI del stakeholder mapping es el input del Resource Orchestration del S3 |

## 8. Anti-Patrones de Gobernanza

| Anti-Patrón | Descripción | Impacto | Mitigación |
|-------------|-------------|---------|------------|
| **Gate Theatre** | Aprobar gates sin verificar criterios reales | Propuestas con huecos que el cliente detecta | Criterios explícitos + evidencia requerida para cada criterio |
| **Governance Overhead** | Aplicar full governance a discoveries de 2 fases | Parálisis, tiempo perdido | Trade-off Matrix: lite governance o QA-only para scope reducido |
| **QA como Formalidad** | Ejecutar Proposal QA sin perspectiva adversarial | Propuesta enviada con inconsistencias | Threshold mínimo 3.5/5.0; ninguna dimensión <3 es un hard block |
| **Scope Creep Silencioso** | Cambios de alcance sin registro formal | Propuesta no refleja el trabajo real | Scope Change Log obligatorio + impact assessment en cada cambio |
| **Dependency Blindness** | No rastrear qué fase necesita qué input | Fases que empiezan sin los datos de la anterior | Dependency Matrix actualizada en cada transición de fase |
| **Dashboard Estático** | Actualizar el RAG dashboard solo al inicio | Decisiones basadas en información desactualizada | Dashboard actualizado después de cada phase completion |

---
**Autor:** Javier Montaño | **© Comunidad MetodologIA** | **Actualización:** 13 de marzo de 2026
