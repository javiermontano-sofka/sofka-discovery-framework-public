# Body of Knowledge — AS-IS Technical Analysis

> Fuentes académicas, industriales y prácticas que fundamentan la metodología de análisis del estado actual.

---

## 1. Frameworks Fundacionales

### ISO/IEC 25010:2011 — Systems and Software Quality Models
- **Relevancia:** Define las 8 características de calidad que fundamentan la sección S6 (NFR Heatmap): functional suitability, performance efficiency, compatibility, usability, reliability, security, maintainability, portability.
- **Uso en el skill:** Adaptamos 7 de las 8 dimensiones como ejes del heatmap, reemplazando compatibility por interoperability (más accionable en contexto de discovery).
- **Fuente:** ISO/IEC 25010:2011, "Systems and software engineering — Systems and software Quality Requirements and Evaluation (SQuaRE)"

### C4 Model (Simon Brown)
- **Relevancia:** Framework de visualización arquitectónica en 4 niveles (Context, Container, Component, Code) que estructura la sección S3.
- **Uso en el skill:** Producimos L1 (Context) y L2 (Container) como estándar. L3 (Component) solo cuando la complejidad lo justifica.
- **Fuente:** Brown, S. (2018). *The C4 Model for Visualising Software Architecture*. c4model.com
- **Referencia complementaria:** Brown, S. (2023). *Software Architecture for Developers*. Leanpub.

### TOGAF ADM — Phase A (Architecture Vision)
- **Relevancia:** La fase de visión arquitectónica de TOGAF incluye el análisis del estado actual (baseline architecture) como prerequisito.
- **Uso en el skill:** El AS-IS analysis ES la baseline architecture que TOGAF Phase A requiere. Nuestro framework es más detallado que TOGAF's Phase A porque incluye code-level metrics.
- **Fuente:** The Open Group (2022). *TOGAF Standard, 10th Edition*. Chapter 17: Phase A.

### Technical Debt Metaphor (Ward Cunningham, 1992)
- **Relevancia:** Concepto fundacional de la sección S5. La deuda técnica como deuda financiera: tiene principal (el shortcut), interés (el costo de mantenerlo), y puede ser deliberada o inadvertida.
- **Uso en el skill:** Clasificamos deuda en 7 categorías (design, code, test, build, documentation, infrastructure, dependency) con scoring de impacto x costo-de-remediación.
- **Fuente:** Cunningham, W. (1992). "The WyCash Portfolio Management System". OOPSLA '92 Experience Report.
- **Extensión:** Fowler, M. (2009). "Technical Debt Quadrant" (deliberado/inadvertido × prudente/imprudente).

---

## 2. Métricas de Código y Calidad

### Cyclomatic Complexity (Thomas McCabe, 1976)
- **Relevancia:** Métrica fundamental en S4 (Code Quality). Mide la complejidad de decisión de una función.
- **Umbrales:** 1-10 (simple), 11-20 (moderado), 21-50 (complejo), >50 (inmantenible).
- **Fuente:** McCabe, T. (1976). "A Complexity Measure". IEEE Transactions on Software Engineering, SE-2(4).

### Coupling Metrics (Afferent/Efferent — Robert C. Martin)
- **Relevancia:** Fundamentan S2 (Code Organization). Coupling afferente (Ca) mide cuántos módulos dependen de este. Coupling eferente (Ce) mide de cuántos módulos depende.
- **Instability Index:** I = Ce / (Ca + Ce). I=0 (totalmente estable), I=1 (totalmente inestable).
- **Fuente:** Martin, R.C. (2003). *Agile Software Development: Principles, Patterns, and Practices*. Chapter 20.

### DORA Metrics (Forsgren, Humble, Kim)
- **Relevancia:** Fundamentan S8 (Operational Model). 4 métricas clave: deployment frequency, lead time for changes, change failure rate, time to restore service.
- **Uso en el skill:** Si hay datos operativos disponibles, clasificamos el equipo en Elite/High/Medium/Low performers según los benchmarks DORA.
- **Fuente:** Forsgren, N., Humble, J., & Kim, G. (2018). *Accelerate: The Science of Lean Software and DevOps*. IT Revolution Press.

### Code Smells (Martin Fowler & Kent Beck)
- **Relevancia:** Taxonomía de problemas de código que alimentan S4 y S5.
- **Catálogo:** Long method, large class, feature envy, data clumps, primitive obsession, switch statements, parallel inheritance, lazy class, speculative generality, temporary field, message chains, middle man, inappropriate intimacy, divergent change, shotgun surgery.
- **Fuente:** Fowler, M. (2018). *Refactoring: Improving the Design of Existing Code*, 2nd Ed. Addison-Wesley.

---

## 3. Seguridad

### OWASP Top 10 (2021)
- **Relevancia:** Fundamenta S7 (Security Assessment). Las 10 categorías de riesgo más críticas en aplicaciones web.
- **Uso en el skill:** Mapeamos hallazgos de seguridad contra las categorías OWASP para estandarizar severidad.
- **Fuente:** OWASP Foundation (2021). *OWASP Top 10:2021*.

### CWE/SANS Top 25 Most Dangerous Software Weaknesses
- **Relevancia:** Complementa OWASP con un enfoque en weaknesses de código (no solo web).
- **Fuente:** MITRE (2023). *CWE Top 25*. cwe.mitre.org

### CVSS v3.1 — Common Vulnerability Scoring System
- **Relevancia:** Sistema de scoring para vulnerabilidades detectadas en S7.
- **Escala:** 0.0 (none) → 3.9 (low) → 6.9 (medium) → 8.9 (high) → 10.0 (critical).
- **Fuente:** FIRST.org (2019). *CVSS v3.1 Specification Document*.

---

## 4. Arquitectura de Software

### Architectural Fitness Functions (Neal Ford & Rebecca Parsons)
- **Relevancia:** Concepto de S3. Tests automatizados que verifican que la arquitectura cumple sus objetivos.
- **Ejemplos:** "¿El servicio X puede desplegarse sin redesplegar Y?", "¿El path crítico está bajo N ms?"
- **Fuente:** Ford, N., Parsons, R., & Kua, P. (2017). *Building Evolutionary Architectures*. O'Reilly.

### Architecture Anti-Patterns
- **Relevancia:** Lista de anti-patrones que el skill detecta automáticamente en S3.
- **Catálogo:** Distributed monolith, shared database, god service, chatty integration, missing circuit breakers, configuration drift.
- **Fuentes:**
  - Richards, M. & Ford, N. (2020). *Fundamentals of Software Architecture*. O'Reilly. Chapter 17.
  - Newman, S. (2021). *Building Microservices*, 2nd Ed. O'Reilly. Chapter 3 (distributed monolith).

---

## 5. Gestión de Riesgos

### Risk Management Framework (ISO 31000:2018)
- **Relevancia:** Estructura el S9 (Risk Register). Probabilidad × impacto con categorización.
- **Uso en el skill:** Matriz 5×5, categorías (technical, operational, security, organizational, external), respuestas (avoid, mitigate, transfer, accept).
- **Fuente:** ISO 31000:2018, "Risk management — Guidelines".

### Failure Mode and Effects Analysis (FMEA)
- **Relevancia:** Técnica complementaria para S9 cuando se necesita análisis más profundo de modos de fallo.
- **Fuente:** IEC 60812:2018, "Failure mode and effects analysis (FMEA and FMECA)".

---

## 6. Bibliografía Práctica

| Categoría | Libro/Recurso | Autor | Relevancia |
|---|---|---|---|
| Fundacional | *Clean Architecture* | Robert C. Martin (2017) | Principios SOLID, dependency rule |
| Fundacional | *Domain-Driven Design* | Eric Evans (2003) | Bounded contexts para S2 |
| Avanzado | *Software Architecture: The Hard Parts* | Ford, Richards, Sadalage, Dehghani (2021) | Trade-offs de descomposición |
| Avanzado | *Designing Data-Intensive Applications* | Martin Kleppmann (2017) | Data layer assessment |
| Práctico | *Working Effectively with Legacy Code* | Michael Feathers (2004) | Técnicas para código sin tests |
| Práctico | *Staff Engineer* | Will Larson (2022) | Contexto organizacional de deuda técnica |
| Métricas | *Software Engineering at Google* | Winters, Manshreck, Wright (2020) | Escala, testing, code review |

---

## 7. Glosario de Términos

| Término | Definición |
|---|---|
| **Afferent Coupling (Ca)** | Número de módulos que dependen del módulo analizado |
| **Efferent Coupling (Ce)** | Número de módulos de los que depende el módulo analizado |
| **Cyclomatic Complexity** | Número de caminos linealmente independientes a través del código fuente |
| **Technical Debt** | Costo implícito de retrabajo causado por elegir una solución rápida en lugar de un enfoque mejor |
| **C4 Model** | Framework de visualización en 4 niveles: Context, Container, Component, Code |
| **NFR** | Non-Functional Requirement — requisito de calidad (performance, security, etc.) |
| **SBOM** | Software Bill of Materials — inventario de componentes de software |
| **DORA Metrics** | 4 métricas de rendimiento de entrega de software (deployment frequency, lead time, change failure rate, MTTR) |
| **Fitness Function** | Test automatizado que verifica una propiedad arquitectónica |
| **Code Smell** | Indicador superficial de un problema más profundo en el código |

---

**Autor:** Javier Montaño | **Última actualización:** 12 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**
