# Body of Knowledge — Technical Feasibility: Fact-Checking & 6D Analysis

> Fuentes académicas, industriales y prácticas que fundamentan la validación de claims técnicos y el análisis de viabilidad multidimensional.

---

## 1. Frameworks de Análisis de Viabilidad

### PMBOK — Feasibility Analysis (PMI)
- **Relevancia:** El PMBOK define el estudio de viabilidad como un entregable clave de la fase de iniciación del proyecto. Establece las dimensiones de evaluación: técnica, operacional, económica, y de cronograma.
- **Uso en el skill:** El framework 6D extiende las dimensiones del PMBOK agregando regulatoria (D5) y operacional detallada (D6). La estructura de claim inventory (S1) se inspira en el análisis de supuestos y restricciones del PMBOK.
- **Fuente:** Project Management Institute (2021). *A Guide to the Project Management Body of Knowledge (PMBOK Guide)*, 7th Edition. Chapter 2: Predictive Approaches.
- **Extensión:** PMI (2024). "Feasibility Study Best Practices". *PM Network*.

### ISO/IEC 25010:2011 — Software Quality Model
- **Relevancia:** Define las 8 características de calidad que fundamentan D1 (Technical Feasibility). La arquitectura propuesta se evalúa contra estas dimensiones: funcionalidad, rendimiento, compatibilidad, usabilidad, fiabilidad, seguridad, mantenibilidad, portabilidad.
- **Uso en el skill:** D1 verifica si la arquitectura propuesta puede cumplir los requisitos de calidad identificados en el AS-IS (S6 NFR Heatmap). Si el escenario propone microservicios pero el heatmap muestra requisitos estrictos de consistencia transaccional, es un AT RISK.
- **Fuente:** ISO/IEC 25010:2011, "Systems and software engineering — SQuaRE".

### IEEE 1471-2000 / ISO/IEC 42010:2011 — Architecture Description
- **Relevancia:** Estándar para describir y evaluar arquitecturas de software. Proporciona el vocabulario para evaluar si la arquitectura propuesta en el escenario está suficientemente definida para validar feasibility.
- **Uso en el skill:** D1 (Technical Feasibility) verifica que la arquitectura propuesta tiene vistas suficientes (funcional, de información, concurrencia, desarrollo, deployment) para que la evaluación sea rigurosa. Arquitectura sin vistas es un claim UNVALIDATED.
- **Fuente:** ISO/IEC 42010:2011, "Systems and software engineering — Architecture description".

---

## 2. Métodos de Evaluación Arquitectónica

### ATAM — Architecture Tradeoff Analysis Method (SEI/CMU)
- **Relevancia:** Método estructurado para evaluar arquitecturas de software contra atributos de calidad. Identifica trade-offs, sensitivities, y risks inherentes a las decisiones arquitectónicas.
- **Uso en el skill:** D1 (Technical Feasibility) aplica un ATAM simplificado. Para cada decisión arquitectónica del escenario, se identifican: quality attribute scenarios, architecture decisions, sensitivity points, trade-off points, y risks.
- **Fuente:** Kazman, R., Klein, M., & Clements, P. (2000). *ATAM: Method for Architecture Evaluation*. SEI Technical Report CMU/SEI-2000-TR-004.
- **Complemento:** Bass, L., Clements, P., & Kazman, R. (2021). *Software Architecture in Practice*, 4th Ed. Addison-Wesley. Chapters 21-22.

### CBAM — Cost Benefit Analysis Method (SEI/CMU)
- **Relevancia:** Extensión del ATAM que agrega análisis de costo-beneficio a las decisiones arquitectónicas. Conecta D1 (Technical) con D4 (Financial).
- **Uso en el skill:** Cuando un trade-off arquitectónico tiene implicaciones financieras significativas, se aplica CBAM para cuantificar el beneficio esperado contra el costo de implementación.
- **Fuente:** Kazman, R., Asundi, J., & Klein, M. (2001). "Quantifying the Costs and Benefits of Architectural Decisions". *ICSE 2001*.

---

## 3. Modelos de Riesgo y Validación

### Boehm Spiral Risk Model
- **Relevancia:** Modelo de desarrollo iterativo orientado a riesgo. Define que las actividades de mayor riesgo se abordan primero con prototipos y spikes de validación.
- **Uso en el skill:** S3 (Spike & PoC Recommendations) aplica el principio de Boehm: los claims con mayor riesgo se validan primero. La clasificación MUST-DO/SHOULD-DO/COULD-DO refleja la priorización por riesgo del modelo espiral.
- **Fuente:** Boehm, B. (1988). "A Spiral Model of Software Development and Enhancement". *IEEE Computer*, 21(5).
- **Extensión:** Boehm, B. & Turner, R. (2004). *Balancing Agility and Discipline*. Addison-Wesley.

### Risk-Driven Architecture (George Fairbanks)
- **Relevancia:** Framework que prioriza el esfuerzo arquitectónico según el riesgo. "Just enough architecture" — ni más ni menos del análisis necesario para mitigar los riesgos identificados.
- **Uso en el skill:** La profundidad del análisis 6D se calibra según el riesgo de cada dimensión. D1 (Technical) puede ser exhaustiva mientras D5 (Regulatory) es superficial si no hay regulación aplicable.
- **Fuente:** Fairbanks, G. (2010). *Just Enough Software Architecture: A Risk-Driven Approach*. Marshall & Brainerd.

### Conway's Law y su Inverso
- **Relevancia:** "Las organizaciones que diseñan sistemas están limitadas a producir diseños que copian la estructura de comunicación de la organización." Fundamental para D2 (Organizational Feasibility).
- **Uso en el skill:** D2 valida si la estructura organizacional del cliente es compatible con la arquitectura propuesta. Si el escenario propone microservicios pero la organización es un equipo monolítico de 5 personas, es un AT RISK organizacional.
- **Fuentes:**
  - Conway, M. (1968). "How Do Committees Invent?" *Datamation*.
  - Skelton, M. & Pais, M. (2019). *Team Topologies*. IT Revolution Press. (Inverse Conway Maneuver)

---

## 4. Análisis Organizacional y de Cambio

### Kotter's 8-Step Change Model
- **Relevancia:** Framework de gestión del cambio que informa D2 (Organizational Feasibility). Evalúa si la organización tiene los pre-requisitos para absorber el cambio propuesto.
- **Uso en el skill:** D2 verifica: ¿hay sentido de urgencia? ¿hay coalición directiva? ¿hay visión compartida? Sin estos pre-requisitos, la feasibility organizacional es baja independientemente de la calidad técnica.
- **Fuente:** Kotter, J. (2012). *Leading Change*, 2nd Ed. Harvard Business Review Press.

### ADKAR Model (Prosci)
- **Relevancia:** Modelo de cambio individual (Awareness, Desire, Knowledge, Ability, Reinforcement) que complementa a Kotter a nivel de equipo.
- **Uso en el skill:** D2 evalúa en qué fase ADKAR está el equipo respecto a la transformación propuesta. Un equipo sin Awareness ni Desire requiere trabajo de change management antes de comprometer recursos técnicos.
- **Fuente:** Hiatt, J. (2006). *ADKAR: A Model for Change in Business, Government, and Our Community*. Prosci Inc.

---

## 5. Estimación y Cronograma

### Monte Carlo Simulation for Project Estimation
- **Relevancia:** Técnica estadística para generar rangos de estimación probabilísticos. Supera las limitaciones de estimaciones puntuales (single-point estimates).
- **Uso en el skill:** D3 (Timeline Feasibility) usa simulación Monte Carlo cuando hay suficientes datos históricos para generar distribuciones de probabilidad por componente. Produce rangos P10/P50/P90 en lugar de estimaciones determinísticas.
- **Fuente:** Hubbard, D. (2014). *How to Measure Anything*, 3rd Ed. Wiley. Chapter 9.
- **Complemento:** Vose, D. (2008). *Risk Analysis: A Quantitative Guide*, 3rd Ed. Wiley.

### Critical Chain Project Management (Goldratt)
- **Relevancia:** Método de planificación que identifica la cadena crítica (considerando dependencias de recursos, no solo tareas) y gestiona buffers.
- **Uso en el skill:** D3 evalúa si el timeline propuesto ha considerado la cadena crítica real. Schedules basados solo en dependencias de tareas (ignorando contention de recursos) son claims UNVALIDATED.
- **Fuente:** Goldratt, E. (1997). *Critical Chain*. North River Press.

---

## 6. Compliance y Regulación

### Regulatory Feasibility Frameworks
- **Relevancia:** D5 (Regulatory Feasibility) requiere frameworks específicos por industria para evaluar compliance.
- **Fuentes por industria:**
  - **Finanzas:** PCI-DSS v4.0 (2024), SOX, Basel III/IV, MiFID II
  - **Salud:** HIPAA (US), GDPR (EU) para datos de salud
  - **General:** GDPR (EU), CCPA (California), LGPD (Brasil)
  - **IA:** EU AI Act (2024), NIST AI RMF (2023)
  - **Cloud:** ISO 27017, ISO 27018, SOC 2 Type II
- **Uso en el skill:** D5 mapea requisitos regulatorios contra la arquitectura propuesta. Un gap regulatorio es un blocker de tipo MUST-DO.

---

## 7. Bibliografía Práctica

| Categoría | Libro/Recurso | Autor | Relevancia |
|---|---|---|---|
| Fundacional | *Software Architecture in Practice* | Bass, Clements, Kazman (2021, 4th Ed) | ATAM, quality attributes, architecture evaluation |
| Fundacional | *Just Enough Software Architecture* | George Fairbanks (2010) | Risk-driven architecture, análisis proporcional al riesgo |
| Organizacional | *Team Topologies* | Skelton & Pais (2019) | Conway's Law inverso, stream-aligned teams |
| Riesgo | *Waltzing with Bears* | DeMarco & Lister (2003) | Risk management en proyectos de software |
| Estimación | *Software Estimation: Demystifying the Black Art* | Steve McConnell (2006) | Estimación basada en evidencia, cone of uncertainty |
| Migración | *Monolith to Microservices* | Sam Newman (2019) | Patrones de migración, feasibility patterns |
| Práctico | *Fundamentals of Software Architecture* | Richards & Ford (2020) | Trade-offs, fitness functions, architecture characteristics |

---

## 8. Glosario de Términos

| Término | Definición |
|---|---|
| **Claim** | Afirmación técnica del escenario que requiere validación contra evidencia |
| **ATAM** | Architecture Tradeoff Analysis Method — método de evaluación de trade-offs arquitectónicos |
| **Sensitivity Point** | Propiedad de un componente que afecta un atributo de calidad |
| **Trade-off Point** | Propiedad que afecta más de un atributo de calidad de maneras opuestas |
| **Spike** | Investigación time-boxed para reducir incertidumbre técnica |
| **PoC** | Proof of Concept — prototipo para validar viabilidad con datos reales |
| **Kill Criteria** | Condición que, si no se cumple, descarta la opción evaluada |
| **Conway's Law** | Las estructuras de comunicación de la organización se reflejan en la arquitectura |
| **Critical Chain** | Secuencia de tareas más larga considerando dependencias de recursos |
| **Composite Score** | Promedio ponderado de las 6 dimensiones de feasibility (1-5) |
| **Blocker** | Condición que impide avanzar a Phase 4 si no se resuelve |
| **Evidence Tag** | Etiqueta que identifica el origen de la evidencia: [CÓDIGO], [CONFIG], [DOC], [BENCHMARK], [VENDOR-DOC], [INFERENCIA], [SUPUESTO] |

---

**Autor:** Javier Montaño | **Última actualización:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**
