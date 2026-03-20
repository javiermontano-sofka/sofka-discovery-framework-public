---
skill: solution-roadmap
title: "State of the Art — Solution Roadmap (2024-2026)"
author: Javier Montaño
copyright: "© Comunidad MetodologIA"
updated: 2026-03-13
---

# State of the Art: Solution Roadmap (2024–2026)

> Tendencias actuales en planificación de transformaciones tecnológicas, estimación probabilística y gobernanza de programas enterprise.

---

## Tendencia 1: Roadmaps Adaptables con Now/Next/Later (2024-2026)

**Descripción:** El framework "Now/Next/Later" (Janna Bastow, 2014, popularizado masivamente en 2023-2025) ha desplazado los roadmaps de Gantt rígidos en organizaciones product-led. En lugar de fechas fijas, define tres horizontes de certeza decreciente: Now (comprometido, 0-3 meses), Next (planificado, 3-6 meses), Later (dirección estratégica, 6+ meses). Herramientas como Productboard, Roadmunk y Linear adoptaron este modelo como default en 2024.

**Impacto en la práctica de discovery:** En transformaciones enterprise, la adaptación del modelo combina la estructura de fases (Foundation/Build/Integrate) con la filosofía Now/Next/Later: Phase 1 es "Now" con compromisos concretos, Phase 2-3 es "Next" con rangos, Phase 4-5 es "Later" con dirección. Los steering committees de 2025 esperan este nivel de honestidad sobre la incertidumbre, en lugar de cronogramas ficticios de 18 meses.

**Madurez:** Alto en producto digital. En adopción acelerada en transformaciones enterprise, especialmente en organizaciones con experiencia ágil previa.

---

## Tendencia 2: FinOps como Práctica Integrada en Roadmaps de Transformación (2024-2026)

**Descripción:** La FinOps Foundation (finops.org) publicó su framework v1.0 en 2023 y v1.1 en 2024, estableciendo FinOps (Cloud Financial Management) como práctica de ingeniería, no solo de finanzas. En 2025, el 65% de las organizaciones cloud-first integran FinOps desde el diseño de la arquitectura, no como optimización posterior. Herramientas como AWS Cost Explorer, GCP Cloud Billing + Looker, y Infracost (open source) permiten estimación de costo por PR antes de merge.

**Impacto en la práctica de discovery:** El TCO del roadmap ya no se construye solo en hojas de cálculo: se vincula a estimaciones de Infrastructure-as-Code (IaC) con Infracost, permitiendo actualización continua conforme el diseño evoluciona. Los pivot points del PoC incluyen validación de supuestos de costo de infraestructura. El ADR de deployment debe incluir análisis FinOps de costo/instancia/región.

**Madurez:** Alto en organizaciones cloud-native. En adopción en enterprises en transformación desde 2024.

---

## Tendencia 3: Value Stream Management como Marco de Seguimiento del Roadmap (2025-2026)

**Descripción:** Value Stream Management (VSM) extiende el concepto lean de value streams al flujo completo de entrega de software: desde la idea hasta el valor en producción. Herramientas como Planview, Tasktop (adquirido por Planview), y Broadcom Value Stream Management miden el flujo de trabajo a través de todas las herramientas del pipeline (Jira, GitHub, Jenkins, ServiceNow) y calculan métricas como Flow Efficiency, Flow Velocity y Flow Distribution. En 2025, Gartner colocó VSM en el pico del Hype Cycle para Agile and DevOps.

**Impacto en la práctica de discovery:** El governance del roadmap evoluciona de reuniones de status hacia dashboards de flujo continuo. La gobernanza del roadmap (Section 7 del skill) debe diseñar el sistema de métricas VSM desde Phase 1, no como instrumentación retroactiva. Los early warning indicators del risk management se complementan con métricas de flujo.

**Madurez:** Medio. Las herramientas están maduras pero la adopción organizacional requiere cambio cultural significativo.

---

## Tendencia 4: AI-Augmented Project Estimation (2025-2026)

**Descripción:** Modelos de IA entrenados en datos históricos de proyectos (velocidad de equipos, densidad de bugs, deuda técnica) comienzan a complementar las estimaciones humanas. Herramientas como Jellyfish, LinearB y Swarmia analizan patrones de entrega históricos para calibrar estimaciones. En 2025, GitHub Copilot Enterprise comenzó a ofrecer estimaciones de esfuerzo de PR basadas en el historial del repositorio. La práctica de "calibración histórica + IA" mejora significativamente la precisión de los rangos P50/P80/P95.

**Impacto en la práctica de discovery:** Los pivot points del roadmap se vuelven más robustos cuando los supuestos de velocidad de equipo están calibrados contra datos históricos reales, no solo intuición experta. Los estimation pivot points deben incluir la fuente de la calibración (histórico del equipo, benchmark de industria, o estimación experta) para dar al steering committee contexto de confianza.

**Madurez:** Temprano-Medio. Las métricas de ingeniería como fuente de calibración están maduras; la integración directa de IA en estimación de proyectos está emergiendo (2025).

---

## Tendencia 5: Outcome-Based Roadmaps y OKRs como Sustituto de Milestones de Output (2024-2026)

**Descripción:** Impulsado por la adopción masiva de OKRs (Objectives and Key Results) en enterprises desde 2020-2023, los roadmaps de transformación evolucionan de milestones de output ("completar Build phase") a milestones de outcome ("tiempo de despliegue <15 minutos", "tasa de incidentes en producción <0.5%"). John Doerr (_Measure What Matters_, 2018) y la práctica de DORA metrics (Accelerate, Forsgren et al., 2018) son la base teórica.

**Impacto en la práctica de discovery:** Los Phase Gates del roadmap se rediseñan con criterios de outcome medibles (métricas DORA, NPS, tiempo de respuesta, disponibilidad) en lugar de solo entregables (documentos, deployments). Esto cambia fundamentalmente cómo el steering committee evalúa el progreso: no "¿qué entregamos?" sino "¿qué mejoró en el negocio?". Los kill criteria también se vuelven más objetivos.

**Madurez:** Alto como filosofía (OKRs mainstream). En adopción como práctica de roadmapping de transformación (2024-2026).

---

## Tendencia 6: Complexity-Adjusted Estimation con Cynefin (2024-2026)

**Descripción:** El framework Cynefin (Dave Snowden, 1999, refinado 2020) categoriza los problemas en cuatro dominios (Obvio, Complicado, Complejo, Caótico) que requieren enfoques de gestión radicalmente diferentes. En 2024-2025, su aplicación en roadmaps de transformación tecnológica se ha formalizado: los componentes "Complicados" (predecibles con expertise) reciben estimaciones tradicionales con rangos; los componentes "Complejos" (emergentes, no predecibles) solo reciben time-boxes con checkpoints de aprendizaje.

**Impacto en la práctica de discovery:** Los estimation pivot points del roadmap deben clasificar cada supuesto en el dominio Cynefin correcto. Los supuestos en dominio "Complejo" no se estiman — se time-boxean con PoC. Esto evita el error de aplicar estimaciones de punto a problemas inherentemente emergentes, como la adopción de nueva tecnología por equipos sin experiencia previa.

**Madurez:** Medio como práctica de roadmapping. Cynefin como framework es reconocido y maduro; su aplicación sistemática en estimación de transformaciones está en adopción (2024+).

---

*© Comunidad MetodologIA — Autor: Javier Montaño — Actualizado: 13 de marzo de 2026*
