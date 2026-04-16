# Body of Knowledge: cost-estimation

> Fuentes canónicas, marcos teóricos y glosario que fundamentan la estimación de esfuerzo, identificación de cost drivers, y modelado de magnitudes.

---

## Fuentes Primarias

### 1. PMI PMBOK 7th Edition — Cost Management

- **Relevancia**: Marco estándar para planificación, estimación, presupuesto y control de costos en proyectos.
- **Aplicación en el skill**: Estructura las secciones S1 (WBS), S5 (PERT, cronograma) y S7 (governance). Define el proceso de estimación como iterativo — no como evento único.
- **Conceptos clave**: Earned Value Management (EVM), Cost Performance Index (CPI), Estimate at Completion (EAC), Reserve Analysis.
- **Referencia**: Project Management Institute. (2021). *A Guide to the Project Management Body of Knowledge (PMBOK Guide)* — 7th Edition. PMI.

### 2. Barry Boehm — COCOMO II & Software Cost Estimation

- **Relevancia**: Modelo paramétrico que estima esfuerzo-persona (no costo) a partir de KSLOC o Function Points, ajustado por 17 cost drivers y 5 scale factors.
- **Aplicación en el skill**: Sección S2 (Sizing Methods). COCOMO II produce person-months, alineado con la filosofía de "magnitudes, no precios".
- **Conceptos clave**: Scale Factors (precedentedness, flexibility, risk resolution, team cohesion, process maturity), Effort Multipliers, Organic/Semi-detached/Embedded modes.
- **Referencia**: Boehm, B. W., et al. (2000). *Software Cost Estimation with COCOMO II*. Prentice Hall.

### 3. Capers Jones — Software Engineering Best Practices

- **Relevancia**: Base empírica más amplia del mundo en métricas de software. Jones ha catalogado datos de estimación de +20,000 proyectos.
- **Aplicación en el skill**: Calibración de reference-class forecasting (S2), benchmarks de productividad por lenguaje/industria, y identificación de factores que destruyen estimaciones (scope creep, requirements volatility).
- **Conceptos clave**: Software Productivity Research (SPR), Assignment Scope, Backfiring (LOC ↔ FP conversion), Defect Removal Efficiency.
- **Referencia**: Jones, C. (2010). *Software Engineering Best Practices*. McGraw-Hill.

### 4. Steve McConnell — Software Estimation: Demystifying the Black Art

- **Relevancia**: Guía práctica que desmitifica la estimación. Introduce el Cone of Uncertainty y la distinción entre estimación, target y compromiso.
- **Aplicación en el skill**: Filosofía central del skill. El Cone of Uncertainty fundamenta por qué producimos rangos y no puntos. La distinción estimate/target/commitment alinea con "costear ≠ cobrar".
- **Conceptos clave**: Cone of Uncertainty, Estimation by Analogy, Decomposition/Recomposition, Calibration, Estimation as Communication.
- **Referencia**: McConnell, S. (2006). *Software Estimation: Demystifying the Black Art*. Microsoft Press.

### 5. Daniel Kahneman & Amos Tversky — Planning Fallacy & Reference-Class Forecasting

- **Relevancia**: Fundamenta por qué los humanos somos sistemáticamente optimistas al estimar. La Planning Fallacy explica el sesgo; Reference-Class Forecasting lo mitiga.
- **Aplicación en el skill**: Sección S2 (Reference-Class Forecasting), S7 (cognitive bias mitigation). Todo estimador debe asumir que está siendo optimista — y corregir explícitamente.
- **Conceptos clave**: Planning Fallacy, Inside View vs Outside View, Anchoring Bias, Reference-Class Forecasting, Base Rate Neglect.
- **Referencia**: Kahneman, D. (2011). *Thinking, Fast and Slow*. Farrar, Straus and Giroux. Kahneman, D., & Tversky, A. (1979). "Prospect Theory: An Analysis of Decision under Risk." *Econometrica*, 47(2).

### 6. Monte Carlo Simulation for Project Estimation

- **Relevancia**: Técnica estadística que ejecuta miles de simulaciones sobre estimaciones de tres puntos para producir distribuciones de probabilidad (P50, P80, P95).
- **Aplicación en el skill**: Sección S5 (Risk-Adjusted Timeline Ranges). Transforma estimaciones puntuales en distribuciones de probabilidad comunicables a stakeholders.
- **Conceptos clave**: Three-point estimates como input, distribuciones triangulares/PERT-beta, percentiles como output, correlation between tasks, convergence.
- **Referencia**: Vose, D. (2008). *Risk Analysis: A Quantitative Guide*. 3rd Edition. Wiley.

### 7. Function Point Analysis — IFPUG

- **Relevancia**: Método de sizing independiente de tecnología que mide funcionalidad entregada al usuario. Estandarizado por IFPUG.
- **Aplicación en el skill**: Sección S2 como método de triangulación. Los Function Points se convierten a esfuerzo-persona via tablas de productividad por lenguaje — nunca directamente a precio.
- **Conceptos clave**: External Inputs (EI), External Outputs (EO), External Inquiries (EQ), Internal Logical Files (ILF), External Interface Files (EIF), Value Adjustment Factor (VAF).
- **Referencia**: IFPUG. (2010). *Function Point Counting Practices Manual* (CPM 4.3.1). International Function Point Users Group.

### 8. Mike Cohn — Agile Estimating and Planning

- **Relevancia**: Adapta la estimación a contextos ágiles. Story points, velocity, y release planning como alternativa a estimación waterfall.
- **Aplicación en el skill**: Calibración de story points a throughput (no a tarifa), velocity como dato histórico, y planning poker como técnica de consenso para estimación grupal.
- **Conceptos clave**: Story Points, Velocity, Ideal Days, Planning Poker, Release Burndown, Estimation by Analogy in Agile.
- **Referencia**: Cohn, M. (2005). *Agile Estimating and Planning*. Prentice Hall.

---

## Glosario

| Término | Definición |
|---------|-----------|
| **FTE-mes** | Full-Time Equivalent por mes. Unidad base de magnitud de esfuerzo. Un FTE-mes = una persona a tiempo completo durante un mes. |
| **Cost Driver** | Factor que induce o amplifica el esfuerzo requerido. No es un precio — es un inductor. Ejemplo: "integración con 7 sistemas legacy". |
| **Magnitud** | Orden de tamaño del esfuerzo expresado en FTE-meses o clasificación T-shirt (S/M/L/XL). NUNCA expresado en dinero. |
| **Cone of Uncertainty** | Modelo que muestra cómo el rango de variación de una estimación se reduce conforme avanza el proyecto. En concepto: 0.25x-4x. Post-diseño: 0.8x-1.25x. |
| **Reference-Class Forecasting** | Técnica que estima un proyecto comparándolo con una clase de proyectos similares completados, mitigando la Planning Fallacy. |
| **Planning Fallacy** | Sesgo cognitivo donde los estimadores subestiman sistemáticamente el tiempo, costo y riesgos de tareas futuras. |
| **PERT Estimation** | Program Evaluation and Review Technique. Fórmula: (Optimista + 4 × Más Probable + Pesimista) / 6. Produce expected duration. |
| **Monte Carlo Simulation** | Técnica que ejecuta N simulaciones aleatorias sobre estimaciones de tres puntos para producir distribuciones de probabilidad (P50, P80, P95). |
| **TCO (Total Cost of Ownership)** | Análisis integral de todos los drivers de costo a lo largo del ciclo de vida: adquisición, operación, mantenimiento, decommissioning. Expresado en categorías de drivers, no en precio final. |
| **WBS (Work Breakdown Structure)** | Descomposición jerárquica del alcance en entregables progresivamente más pequeños y manejables. Base para toda estimación bottom-up. |
| **Triangulación** | Práctica de usar al menos 3 métodos de estimación independientes y comparar resultados. Divergencia >30% requiere investigación. |
| **Margen de Innovación** | 5% adicional al esfuerzo estimado, reservado explícitamente para inversión en calidad, experiencia de usuario e innovación. Separado de contingencia de riesgo. |
| **COCOMO II** | Constructive Cost Model II. Modelo paramétrico que estima esfuerzo-persona a partir de tamaño (KSLOC/FP) ajustado por scale factors y effort multipliers. |
| **Velocity** | Métrica ágil que mide el throughput del equipo en story points por sprint. Es dato histórico del equipo — no es transferible entre equipos. |
| **Effort Multiplier** | Factor de ajuste en COCOMO II que amplifica o reduce el esfuerzo base según características del proyecto (complejidad, fiabilidad, experiencia del equipo). |

---

**Autor:** Javier Montaño | **Ultima actualizacion:** 13 de marzo de 2026
