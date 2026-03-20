# Body of Knowledge — Multidimensional Feasibility

> Fuentes canónicas, marcos teóricos y glosario que fundamentan la validación de factibilidad multidimensional mediante el protocolo Think Tank (Consejo de Siete Sabios).

**Autor:** Javier Montaño | **Fecha:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**

---

## Fuentes Primarias

### 1. Technology Readiness Levels (TRL 1-9) — NASA

- **Relevancia**: Escala estandarizada para evaluar la madurez de una tecnología desde el principio básico (TRL 1) hasta sistema probado en operación (TRL 9). Desarrollada por NASA en los años 70 y adoptada por DoD, ESA, Horizon Europe y la industria de software enterprise.
- **Aplicación en el skill**: Dimensión 1 (Investigación/TRL). Cada componente tecnológico del escenario se clasifica en la escala TRL. Un TRL < 6 para un componente crítico dispara automáticamente un spike de validación. El sabio de Investigación/TRL usa esta escala como columna vertebral de su análisis.
- **Conceptos clave**: TRL 1 (principios básicos observados), TRL 3 (prueba de concepto analítica), TRL 6 (demostración en entorno relevante), TRL 9 (sistema probado en operación). Valley of Death entre TRL 4-6.
- **Referencia**: Mankins, J.C. (1995). "Technology Readiness Levels." NASA White Paper. Actualizado: NASA Systems Engineering Handbook (2020), SP-2016-6105 Rev 2.

### 2. ISBSG Benchmarks for Software Effort Estimation

- **Relevancia**: La base de datos más grande del mundo en métricas de proyectos de software (~10,000 proyectos). Permite reference-class forecasting basado en datos empíricos reales por industria, tecnología, tamaño de equipo y metodología.
- **Aplicación en el skill**: Dimensión 2 (Cuantitativa). El sabio cuantitativo usa benchmarks ISBSG para calibrar estimaciones de esfuerzo contra la clase de referencia. Un desvío >40% del benchmark ISBSG sin justificación documentada invalida la claim de factibilidad cuantitativa.
- **Conceptos clave**: Productivity Delivery Rate (PDR = horas/FP), Project Delivery Rate por industria, distribuciones de esfuerzo por tamaño, factores de ajuste por metodología (ágil vs cascada).
- **Referencia**: ISBSG (2024). *ISBSG Software Development & Enhancement Repository Release 2024*. International Software Benchmarking Standards Group.

### 3. Gartner Hype Cycle Methodology

- **Relevancia**: Framework que mapea la madurez de adopción de tecnologías emergentes a través de 5 fases: Innovation Trigger, Peak of Inflated Expectations, Trough of Disillusionment, Slope of Enlightenment, Plateau of Productivity. Crítico para evaluar si una tecnología propuesta tiene la madurez real para producción enterprise.
- **Aplicación en el skill**: Dimensión 4 (Madurez Tecnológica). El sabio de Madurez Tecnológica posiciona cada tecnología del stack propuesto en el Hype Cycle. Tecnologías en Trough of Disillusionment requieren evidencia adicional de adopción exitosa en contextos similares. Tecnologías en Peak of Inflated Expectations disparan alerta de optimism bias.
- **Conceptos clave**: 5 fases del ciclo, Years to Mainstream Adoption, Benefit Rating (Transformational/High/Moderate/Low), Penetration Level.
- **Referencia**: Fenn, J. & Raskino, M. (2008). *Mastering the Hype Cycle*. Harvard Business Press. Gartner (2024). *Hype Cycle for Emerging Technologies*.

### 4. ThoughtWorks Technology Radar

- **Relevancia**: Publicación bianual que clasifica técnicas, herramientas, plataformas y lenguajes en 4 anillos: Adopt, Trial, Assess, Hold. Basada en la experiencia real de ThoughtWorks en proyectos enterprise globales — no en análisis de mercado, sino en uso real.
- **Aplicación en el skill**: Dimensión 4 (Madurez Tecnológica). Complementa el Hype Cycle con datos de adopción real. Una tecnología en "Hold" de ThoughtWorks combinada con TRL < 7 es señal de alto riesgo. Una tecnología en "Adopt" con TRL 8-9 es de bajo riesgo.
- **Conceptos clave**: 4 anillos (Adopt, Trial, Assess, Hold), 4 cuadrantes (Techniques, Tools, Platforms, Languages & Frameworks), blips de movimiento entre anillos.
- **Referencia**: ThoughtWorks (2025). *Technology Radar Vol. 32*. thoughtworks.com/radar

### 5. Conway's Law and its Implications

- **Relevancia**: "Las organizaciones que diseñan sistemas están constreñidas a producir diseños que son copias de las estructuras de comunicación de esas organizaciones" (Melvin Conway, 1968). Implicación directa: la factibilidad de una arquitectura depende de la estructura organizacional que la implementará. Una arquitectura de microservicios es inviable si la organización opera como un monolito humano.
- **Aplicación en el skill**: Dimensión 3 (Sistémica). El sabio sistémico evalúa el isomorfismo entre la arquitectura propuesta y la estructura organizacional del cliente. Desalineamiento Conway = riesgo sistémico de primer orden. No es un problema técnico — es un problema sociotécnico.
- **Conceptos clave**: Conway's Law original, Inverse Conway Maneuver (Skelton & Pais), Homomorphic Force, Team Cognitive Load, Communication Overhead.
- **Referencia**: Conway, M.E. (1968). "How Do Committees Invent?" *Datamation*, 14(4), 28-31. MacCormack, A., et al. (2012). "Exploring the Duality between Product and Organizational Architectures." *Research Policy*, 41(8).

### 6. Complex Adaptive Systems (CAS) Theory

- **Relevancia**: Marco teórico que describe sistemas compuestos por agentes interdependientes que se adaptan y co-evolucionan. Los proyectos de transformación enterprise SON sistemas adaptativos complejos — no son sistemas mecánicos predecibles. Las interacciones no lineales generan comportamientos emergentes no anticipables.
- **Aplicación en el skill**: Dimensión 3 (Sistémica). El sabio sistémico modela el proyecto como CAS, identificando feedback loops, puntos de bifurcación, atractores extraños y fenómenos de cascading failure. Un escenario es sistémicamente inviable si depende de comportamiento lineal en un sistema no lineal.
- **Conceptos clave**: Emergence, Self-organization, Edge of Chaos, Feedback Loops (reinforcing/balancing), Attractors, Phase Transitions, Butterfly Effect, Requisite Variety (Ashby).
- **Referencia**: Holland, J.H. (1995). *Hidden Order: How Adaptation Builds Complexity*. Basic Books. Stacey, R.D. (2011). *Strategic Management and Organisational Dynamics: The Challenge of Complexity*. 6th Ed. Pearson.

### 7. Monte Carlo Simulation for Cost and Schedule Estimation

- **Relevancia**: Técnica estadística que ejecuta miles de simulaciones sobre distribuciones de probabilidad para producir rangos de resultados con niveles de confianza (P50, P80, P95). Transforma la estimación puntual ("el proyecto dura 12 meses") en estimación probabilística ("hay un 80% de probabilidad de completar en 14 meses o menos").
- **Aplicación en el skill**: Dimensión 2 (Cuantitativa). El sabio cuantitativo ejecuta simulaciones Monte Carlo sobre las estimaciones de esfuerzo, costo y timeline para cada componente. Los resultados alimentan la evaluación de factibilidad económica (Dimensión 7) y la viabilidad de infraestructura (Dimensión 5).
- **Conceptos clave**: Distribuciones triangulares y PERT-beta como inputs, correlación entre variables, convergencia a N>10,000 iteraciones, percentiles como output, sensitivity analysis (tornado charts).
- **Referencia**: Vose, D. (2008). *Risk Analysis: A Quantitative Guide*. 3rd Edition. Wiley. Hubbard, D.W. (2014). *How to Measure Anything*. 3rd Edition. Wiley.

### 8. FMEA — Failure Mode and Effects Analysis

- **Relevancia**: Metodología sistemática para identificar modos de fallo potenciales, evaluar sus efectos y priorizar acciones preventivas. Calcula el Risk Priority Number (RPN = Severidad x Ocurrencia x Detección). Originada en ingeniería aeroespacial, ampliamente adoptada en manufactura, salud y software crítico.
- **Aplicación en el skill**: Transversal a todas las dimensiones. Cada claim de factibilidad se evalúa con una mini-FMEA: ¿qué pasa si esta claim es falsa? ¿Cuán severo es el impacto? ¿Cuán probable es el fallo? ¿Cuán detectable es antes de producción? Claims con RPN > 200 disparan spikes obligatorios.
- **Conceptos clave**: Severity (1-10), Occurrence (1-10), Detection (1-10), RPN = S x O x D, Action Priority basada en RPN, Process FMEA vs Design FMEA.
- **Referencia**: SAE International (2019). *SAE J1739 — Potential Failure Mode and Effects Analysis*. IEC 60812:2018 — *Failure modes and effects analysis (FMEA and FMECA)*.

### 9. Rogers' Diffusion of Innovation / Adoption Curve

- **Relevancia**: Modelo que describe cómo las innovaciones se difunden a través de una población en 5 categorías de adoptantes: Innovators (2.5%), Early Adopters (13.5%), Early Majority (34%), Late Majority (34%), Laggards (16%). El "Chasm" (Moore) entre Early Adopters y Early Majority es donde mueren la mayoría de las tecnologías.
- **Aplicación en el skill**: Dimensión 4 (Madurez Tecnológica) y Dimensión 6 (Integración). El sabio de Madurez evalúa dónde se encuentra cada tecnología en la curva de adopción. El sabio de Integración evalúa si la organización del cliente es Early Adopter o Late Majority — porque la misma tecnología puede ser viable para un adoptante temprano e inviable para un adoptante tardío.
- **Conceptos clave**: 5 categorías de adoptantes, The Chasm (Geoffrey Moore), Technology Adoption Lifecycle, Whole Product Concept, Bowling Alley Strategy.
- **Referencia**: Rogers, E.M. (2003). *Diffusion of Innovations*. 5th Ed. Free Press. Moore, G.A. (2014). *Crossing the Chasm*. 3rd Ed. Harper Business.

### 10. Evidence-Based Software Engineering (EBSE)

- **Relevancia**: Metodología que aplica los principios de la medicina basada en evidencia al desarrollo de software. Exige que las decisiones técnicas se fundamenten en evidencia empírica (estudios, datos, experimentos) y no en opinión, moda o autoridad. Las revisiones sistemáticas de literatura (SLR) son el instrumento central.
- **Aplicación en el skill**: Transversal — fundamenta el Evidence Framework del Think Tank. Los 5 niveles de evidencia del skill (Código, Configuración, Documentación, Inferencia, Supuesto) son una adaptación pragmática de la jerarquía de evidencia EBSE. El principio rector es: "sin evidencia, no hay claim."
- **Conceptos clave**: Hierarchy of Evidence (SLR > RCT > Cohort > Case Study > Expert Opinion), Systematic Literature Review (SLR), Evidence Synthesis, Evidence Strength Assessment, Threats to Validity.
- **Referencia**: Kitchenham, B.A., et al. (2004). "Evidence-Based Software Engineering." *Proceedings of ICSE 2004*. Dyba, T., Kitchenham, B., & Jorgensen, M. (2005). "Evidence-Based Software Engineering for Practitioners." *IEEE Software*, 22(1).

---

## Glosario

| Término | Definición |
|---------|-----------|
| **Think Tank** | Consejo de Siete Sabios — 7 agentes de investigación postdoctoral que validan factibilidad de forma independiente y luego deliberan colectivamente. |
| **Sabio** | Agente especializado en una dimensión específica de factibilidad. Opera con autonomía investigativa y vota con independencia. |
| **Claim** | Afirmación de factibilidad o riesgo que requiere evidencia. Toda claim debe tener al menos un tag de evidencia y un nivel de confianza. |
| **Evidence Tag** | Clasificador del origen de la evidencia: [CÓDIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]. |
| **Nivel de Confianza** | Escala 1-5 que indica la solidez de la evidencia detrás de una claim. 5 = evidencia de código verificable. 1 = supuesto sin validar. |
| **Cross-Validation** | Proceso donde un sabio revisa las claims de otro sabio para detectar contradicciones, reforzar hallazgos o identificar gaps. |
| **Spike** | Experimento técnico acotado (timebox 1-5 días) diseñado para resolver una incertidumbre específica. Tiene criterio de éxito/fracaso definido a priori. |
| **Veredicto** | Decisión colectiva del Think Tank: VIABLE, VIABLE CON CONDICIONES, o NO VIABLE. Requiere mayoría calificada (5/7). |
| **RPN** | Risk Priority Number = Severidad x Ocurrencia x Detección. Herramienta FMEA para priorizar riesgos. RPN > 200 = spike obligatorio. |
| **TRL** | Technology Readiness Level. Escala NASA 1-9 para madurez tecnológica. TRL < 6 en componente crítico = spike obligatorio. |
| **Cascading Failure** | Fallo en un componente que propaga fallos a componentes dependientes. El sabio sistémico modela estas cadenas como grafo dirigido. |
| **Condición Suspensiva** | Requisito que debe cumplirse para que el veredicto de viabilidad se sostenga. Si la condición no se cumple, el veredicto se revierte. |
| **Confidence Score** | Puntuación 0-100 que acompaña el veredicto. Integra los niveles de evidencia de todas las claims ponderados por criticidad. |
| **Inverse Conway Maneuver** | Estrategia deliberada de reestructurar equipos para que su comunicación refleje la arquitectura deseada (Skelton & Pais). |
