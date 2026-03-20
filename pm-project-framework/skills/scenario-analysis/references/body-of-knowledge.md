# Body of Knowledge — Strategic Scenario Analysis

> Fuentes academicas, industriales y practicas que fundamentan la metodologia de analisis de escenarios con Tree of Thought y scoring 6D.

---

## 1. Scenario Planning — Fundamentos

### Pierre Wack — Shell Scenario Planning (1985)
- **Relevancia:** Origeno del scenario planning corporativo moderno. Wack demostro en Royal Dutch Shell que los escenarios no predicen el futuro — preparan a la organizacion para multiples futuros plausibles.
- **Uso en el skill:** El principio rector "divergencia antes de convergencia" viene directamente de Wack: primero generar todos los escenarios viables, luego evaluar. Nunca al reves.
- **Fuente:** Wack, P. (1985). "Scenarios: Uncharted Waters Ahead." Harvard Business Review, Sept-Oct 1985.
- **Fuente complementaria:** Wack, P. (1985). "Scenarios: Shooting the Rapids." Harvard Business Review, Nov-Dec 1985.

### Kees van der Heijden — Scenarios: The Art of Strategic Conversation
- **Relevancia:** Extiende el trabajo de Wack con un framework estructurado para construir escenarios que son internamente consistentes, relevantes, y desafiantes.
- **Uso en el skill:** Los arquetipos de escenarios (Conservative, Moderate, Aggressive) siguen la taxonomia de Van der Heijden de "escenarios de continuacion" vs "escenarios de ruptura."
- **Fuente:** Van der Heijden, K. (2005). *Scenarios: The Art of Strategic Conversation*. 2nd Ed. Wiley.

### Peter Schwartz — The Art of the Long View
- **Relevancia:** Popularizo el scenario planning fuera del ambito petrolero. Introdujo el concepto de "remarkable people" como fuente de escenarios no obvios.
- **Uso en el skill:** La logica condicional de switching se inspira en los "early warning signals" de Schwartz — indicadores que senalan cual escenario se esta materializando.
- **Fuente:** Schwartz, P. (1996). *The Art of the Long View: Planning for the Future in an Uncertain World*. Currency Doubleday.

---

## 2. Tree-of-Thought — Razonamiento Estructurado

### Yao et al. — Tree of Thoughts: Deliberate Problem Solving with LLMs (2023)
- **Relevancia:** Fundamento metodologico del skill. Tree of Thought (ToT) extiende el Chain-of-Thought prompting al explorar multiples caminos de razonamiento en paralelo, evaluar cada uno, y seleccionar el mas prometedor con backtracking.
- **Uso en el skill:** Cada escenario es un "thought branch" que se desarrolla completamente (SWOT, scoring, risk register) antes de comparar. No se descarta ninguno prematuramente.
- **Fuente:** Yao, S., Yu, D., Zhao, J., et al. (2023). "Tree of Thoughts: Deliberate Problem Solving with Large Language Models." NeurIPS 2023.
- **URL:** https://arxiv.org/abs/2305.10601

### Long (2023) — Large Language Model Guided Tree-of-Thought
- **Relevancia:** Variante que usa el LLM como evaluador de cada rama, generando heuristicas de scoring automaticas.
- **Uso en el skill:** El scoring 6D actua como la heuristica de evaluacion — cada dimension es un criterio de poda del arbol de decisiones.
- **Fuente:** Long, J. (2023). "Large Language Model Guided Tree-of-Thought." arXiv:2305.08291.

---

## 3. Architecture Decision Records (ADRs)

### Michael Nygard — Documenting Architecture Decisions (2011)
- **Relevancia:** Formato estandar para documentar decisiones de arquitectura: Context, Decision, Status, Consequences. El output del scenario analysis ES un ADR expandido — el escenario recomendado es la "Decision", los otros son "Alternatives Considered."
- **Uso en el skill:** La seccion de recommendation sigue la estructura ADR. La logica condicional documenta bajo que condiciones la decision cambiaria (Nygard lo llama "superseded by").
- **Fuente:** Nygard, M. (2011). "Documenting Architecture Decisions." Cognitect Blog.
- **URL:** https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions

### ThoughtWorks Technology Radar — ADRs en "Adopt"
- **Relevancia:** Desde 2020, ThoughtWorks clasifica ADRs como "Adopt" — practica recomendada para todos los proyectos.
- **Fuente:** ThoughtWorks (2024). *Technology Radar Vol. 30*. thoughtworks.com/radar

---

## 4. Multi-Criteria Decision Analysis (MCDA)

### Belton & Stewart — Multiple Criteria Decision Analysis: An Integrated Approach
- **Relevancia:** Framework academico para decisiones con multiples criterios en conflicto. Fundamenta el scoring ponderado 6D del skill.
- **Uso en el skill:** Las 6 dimensiones son criterios MCDA. Los pesos reflejan preferencias del decisor (weight override). La matriz comparativa es una "value matrix" clasica.
- **Fuente:** Belton, V. & Stewart, T.J. (2002). *Multiple Criteria Decision Analysis: An Integrated Approach*. Springer.

### Saaty — The Analytic Hierarchy Process (AHP)
- **Relevancia:** Metodo sistematico para derivar pesos de criterios mediante comparaciones pareadas. Alternativa mas rigurosa al weight override manual.
- **Uso en el skill:** Cuando stakeholders no logran consenso en pesos, AHP ofrece un metodo estructurado para llegar a pesos consistentes.
- **Fuente:** Saaty, T.L. (1980). *The Analytic Hierarchy Process*. McGraw-Hill.

### TOPSIS (Hwang & Yoon, 1981)
- **Relevancia:** Technique for Order of Preference by Similarity to Ideal Solution. Complementa el scoring con un concepto de "escenario ideal" y "escenario anti-ideal."
- **Uso en el skill:** Los decision rules (diff > 1.0, 0.5-1.0, < 0.5) son una simplificacion practica del TOPSIS distance-to-ideal.
- **Fuente:** Hwang, C.L. & Yoon, K. (1981). *Multiple Attribute Decision Making*. Springer-Verlag.

---

## 5. Enterprise Architecture Frameworks

### TOGAF ADM — Phase E: Opportunities & Solutions
- **Relevancia:** La fase E de TOGAF es donde se generan y evaluan las opciones de implementacion de la target architecture. Es el equivalente empresarial del scenario analysis.
- **Uso en el skill:** Los 3 arquetipos (Conservative/Moderate/Aggressive) mapean a los "implementation options" de Phase E. Los "transition architectures" de TOGAF son nuestros escenarios.
- **Fuente:** The Open Group (2022). *TOGAF Standard, 10th Edition*. Chapter 21: Phase E.
- **URL:** https://pubs.opengroup.org/togaf-standard/

### ISO/IEC/IEEE 42010:2022 — Architecture Description
- **Relevancia:** Estandar para describir arquitecturas de sistemas. Define stakeholders, concerns, viewpoints, y views.
- **Uso en el skill:** Cada escenario es una "architecture view" diferente que responde a los mismos "stakeholder concerns." La matriz comparativa es un "correspondence" entre views.
- **Fuente:** ISO/IEC/IEEE 42010:2022. "Systems and software engineering — Architecture description."

### ATAM — Architecture Tradeoff Analysis Method (SEI/CMU)
- **Relevancia:** Metodo del Software Engineering Institute para evaluar trade-offs en arquitecturas de software. Usa "quality attribute scenarios" como unidad de evaluacion.
- **Uso en el skill:** El SWOT por escenario incorpora elementos de ATAM: los scenarios de quality attributes informan Strengths/Weaknesses, y los sensitivity/tradeoff points informan el scoring.
- **Fuente:** Kazman, R., Klein, M., & Clements, P. (2000). "ATAM: Method for Architecture Evaluation." SEI-CMU, CMU/SEI-2000-TR-004.
- **URL:** https://resources.sei.cmu.edu/library/asset-view.cfm?assetid=5177

---

## 6. Risk Management

### ISO 31000:2018 — Risk Management Guidelines
- **Relevancia:** Estructura el risk register por escenario. Probabilidad x impacto con categorizacion y respuestas.
- **Uso en el skill:** Matriz 5x5, respuestas (avoid, mitigate, transfer, accept). El risk register del escenario recomendado sigue ISO 31000.
- **Fuente:** ISO 31000:2018. "Risk management — Guidelines."

### FAIR — Factor Analysis of Information Risk
- **Relevancia:** Modelo cuantitativo para analisis de riesgo, especialmente util para la dimension "Operational Risk" del scoring 6D.
- **Fuente:** Jones, J.A. (2005). "An Introduction to Factor Analysis of Information Risk (FAIR)." Risk Management Insight.

---

## 7. Bibliografia Practica

| Categoria | Libro/Recurso | Autor | Relevancia |
|---|---|---|---|
| Fundacional | *Software Architecture: The Hard Parts* | Ford, Richards, Sadalage, Dehghani (2021) | Trade-offs de descomposicion y migracion |
| Fundacional | *Building Evolutionary Architectures* | Ford, Parsons, Kua (2017) | Fitness functions como criterios de evaluacion |
| Estrategico | *Technology Strategy Patterns* | Eben Hewitt (2018) | Patrones de decision tecnologica a nivel enterprise |
| Estrategico | *Thinking in Bets* | Annie Duke (2018) | Toma de decisiones bajo incertidumbre — scoring como apuesta informada |
| Migracion | *Monolith to Microservices* | Sam Newman (2019) | Patrones de migracion que informan los arquetipos de escenarios |
| Migracion | *Cloud Strategy* | Gregor Hohpe (2020) | Framework para decisiones de migracion cloud |
| Riesgo | *Waltzing with Bears* | DeMarco & Lister (2003) | Gestion de riesgo en proyectos de software |
| Decision | *Thinking, Fast and Slow* | Daniel Kahneman (2011) | Sesgos cognitivos en la evaluacion de escenarios |

---

## 8. Glosario de Terminos

| Termino | Definicion |
|---|---|
| **Tree of Thought (ToT)** | Tecnica de razonamiento que explora multiples caminos de solucion en paralelo, evalua cada uno, y selecciona el mas prometedor |
| **6D Scoring** | Sistema de puntuacion en 6 dimensiones ponderadas: Cost, Time-to-Value, Operational Risk, Strategic Alignment, Regulatory Fit, PoC Speed |
| **Scenario Archetype** | Patron base de escenario (Conservative, Moderate, Aggressive) que se customiza al contexto del proyecto |
| **Strangler Facade** | Patron de migracion incremental donde un facade intercepta llamadas y las redirige gradualmente al nuevo sistema |
| **Anti-Corruption Layer** | Capa de traduccion entre bounded contexts que previene que el modelo de dominio de un contexto contamine al otro |
| **Weight Override** | Ajuste de los pesos dimensionales del scoring 6D para reflejar prioridades especificas del cliente |
| **Conditional Switching** | Logica documentada que indica bajo que circunstancias la recomendacion cambiaria a otro escenario |
| **Decision Rules** | Reglas basadas en la diferencia de score entre escenarios para categorizar la confianza de la recomendacion |
| **SWOT** | Strengths (fortalezas internas), Weaknesses (debilidades internas), Opportunities (oportunidades externas), Threats (amenazas externas) |
| **MCDA** | Multi-Criteria Decision Analysis — familia de metodos para decisiones con multiples criterios en conflicto |
| **ADR** | Architecture Decision Record — documento que captura una decision de arquitectura con contexto, alternativas, y consecuencias |
| **ATAM** | Architecture Tradeoff Analysis Method — metodo de evaluacion de trade-offs arquitectonicos del SEI |
| **TCO** | Total Cost of Ownership — costo total de propiedad incluyendo CAPEX, OPEX, y costos ocultos |
| **Parallel Run** | Periodo de operacion simultanea de sistema legacy y nuevo para validar equivalencia funcional |

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**
