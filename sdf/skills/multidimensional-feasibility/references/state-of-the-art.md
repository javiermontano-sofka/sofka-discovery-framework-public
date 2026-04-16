# State of the Art — Multidimensional Feasibility

> Tendencias 2024-2025 en validación de factibilidad, análisis de riesgos arquitectónicos y toma de decisiones basada en evidencia para proyectos de transformación enterprise.

**Autor:** Javier Montaño | **Fecha:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**

---

## TL;DR

- Los Architecture Decision Records (ADR) evolucionan de documentación pasiva a instrumento de validación activa de factibilidad.
- Las fitness functions permiten validar factibilidad arquitectónica de forma continua y automatizada — no solo en la fase de diseño.
- Chaos engineering extiende la validación sistémica de producción a la fase de pre-implementación como herramienta de factibilidad.
- FinOps madura como disciplina obligatoria: la factibilidad económica en cloud es tan crítica como la factibilidad técnica.
- Platform engineering redefine la factibilidad de infraestructura: la pregunta ya no es "¿podemos construirlo?" sino "¿la plataforma interna lo soporta?"
- Los LLM asisten en análisis de código y detección de patrones, pero el juicio experto sigue siendo irreemplazable para factibilidad sistémica.
- Team Topologies operacionaliza Conway's Law: la factibilidad organizacional tiene un framework concreto.
- Wardley Mapping posiciona tecnologías en su ciclo evolutivo, complementando TRL y Hype Cycle con contexto estratégico.

---

## 1. Architecture Decision Records (ADR) para Factibilidad

**Estado**: Práctica madura, evolución activa (2024-2025)

Los ADR han evolucionado más allá de documentar decisiones post-hoc. En el estado del arte actual, se usan como instrumento de validación de factibilidad pre-decisión: antes de tomar una decisión arquitectónica, se documenta el ADR con las alternativas y se ejecuta un proceso de validación multidimensional sobre cada alternativa.

**Evolución clave:**
- **ADR como hipótesis**: El ADR se redacta como hipótesis de factibilidad ("creemos que X es viable porque Y") y se valida contra evidencia antes de cambiar su status a "Accepted."
- **Lightweight Architecture Decision Records (LADR)**: Variante ligera que reduce la fricción de documentación sin sacrificar trazabilidad. Formato: título + contexto + decisión + consecuencias en un archivo markdown.
- **ADR linking**: Herramientas como adr-tools y Log4brains permiten vincular ADRs entre sí, creando grafos de dependencia entre decisiones — esencial para evaluar impacto cascada.
- **ADR fitness functions**: Cada ADR se acompaña de una fitness function que valida continuamente que la decisión sigue siendo válida (ver punto 2).

**Implicación para el skill:** El Think Tank produce ADRs como artefacto de salida. Cada claim de factibilidad se documenta como ADR con status (Proposed/Accepted/Deprecated/Superseded) y condiciones de invalidación.

**Fuentes:** Nygard, M. (2011). "Documenting Architecture Decisions." Keeling, M. & Runde, J. (2024). *Architecture Decision Records in Practice*. O'Reilly.

---

## 2. Fitness Functions para Arquitectura Evolutiva

**Estado**: Adopción creciente, tooling maduro (2024-2025)

Las fitness functions — concepto de *Building Evolutionary Architectures* (Ford, Parsons, Kua) — son funciones automatizadas que evalúan si una característica arquitectónica se mantiene dentro de parámetros aceptables. Aplicadas a factibilidad, permiten validar continuamente que las condiciones bajo las cuales un escenario es viable siguen cumpliéndose.

**Aplicaciones en factibilidad:**
- **Performance fitness**: latencia p99 < 200ms, throughput > 5K TPS — validan factibilidad de rendimiento.
- **Cost fitness**: gasto mensual cloud < threshold FinOps — validan factibilidad económica.
- **Coupling fitness**: métricas de acoplamiento entre servicios < threshold — validan factibilidad de integración.
- **Team cognitive load fitness**: complejidad por equipo < umbral — validan factibilidad organizacional (Conway).

**Tooling actual:**
- ArchUnit (Java), NetArchTest (.NET), Fitness Function Toolkit (polyglot).
- Integración con CI/CD: las fitness functions corren en cada build como "architectural unit tests."
- Observability-driven: métricas de producción alimentan fitness functions en tiempo real.

**Implicación para el skill:** El sabio de cada dimensión propone fitness functions como parte de su análisis. Las fitness functions son el mecanismo de validación continua post-Think Tank — el veredicto de factibilidad no es estático, se monitorea.

**Fuentes:** Ford, N., Parsons, R. & Kua, P. (2017, 2nd ed. 2023). *Building Evolutionary Architectures*. O'Reilly.

---

## 3. Chaos Engineering para Validación de Riesgo Sistémico

**Estado**: Expansión de producción a pre-producción (2024-2025)

Chaos engineering — originado en Netflix con Chaos Monkey — ha evolucionado de una práctica exclusiva de producción a una herramienta de validación de factibilidad sistémica en fase de diseño. La pregunta "¿qué pasa si este componente falla?" ya no se responde con análisis teórico sino con experimentación controlada.

**Evolución:**
- **Steady-State Hypothesis**: Definir qué significa "funcionamiento normal" antes de inyectar caos. Aplicable a factibilidad: ¿cuál es el steady-state mínimo aceptable?
- **Game Days pre-implementación**: Simulaciones de fallo en entornos de staging antes de ir a producción. Validan factibilidad sistémica con evidencia empírica.
- **Chaos as Code**: Herramientas como Litmus (Kubernetes-native), Gremlin, AWS Fault Injection Simulator permiten definir experimentos de caos como código versionable.
- **Sociotechnical chaos**: No solo inyectar fallos técnicos, sino simular ausencia de personas clave, pérdida de conocimiento, rotación de equipo — validación sistémica humana.

**Implicación para el skill:** El sabio sistémico diseña "experimentos de caos conceptuales" — escenarios de fallo que el Think Tank evalúa teóricamente y recomienda como spikes empíricos cuando la evidencia teórica es insuficiente.

**Fuentes:** Rosenthal, C., et al. (2020). *Chaos Engineering: System Resiliency in Practice*. O'Reilly. Basiri, A., et al. (2016). "Chaos Engineering." *IEEE Software*, 33(3).

---

## 4. FinOps Frameworks para Factibilidad Económica en Cloud

**Estado**: Disciplina consolidada, certificación profesional establecida (2024-2025)

FinOps (Cloud Financial Operations) ha madurado de práctica emergente a disciplina obligatoria. La FinOps Foundation (parte de Linux Foundation) establece el framework estándar: Inform → Optimize → Operate. Para factibilidad, la pregunta central es: "dado este diseño arquitectónico, ¿el costo cloud es sostenible a 3-5 años?"

**Capacidades relevantes para factibilidad:**
- **Unit Economics**: Costo por transacción, costo por usuario, costo por API call — métricas que validan si la economía del servicio es viable a escala.
- **Cost Anomaly Detection**: Identificación temprana de patrones de gasto que invalidan assumptions de factibilidad económica.
- **Commitment-Based Discounts**: Reserved Instances, Savings Plans, Committed Use Discounts — factores que impactan drásticamente el TCO pero requieren compromisos de 1-3 años.
- **FinOps Maturity Model**: Crawl → Walk → Run. La factibilidad económica depende del nivel de madurez FinOps del cliente.

**Implicación para el skill:** El sabio económico integra FinOps en su análisis. No basta con estimar el costo cloud — hay que evaluar si la organización tiene la madurez FinOps para controlar ese costo. Un diseño con costo cloud estimado "viable" pero sin práctica FinOps es una bomba de tiempo.

**Fuentes:** FinOps Foundation (2024). *FinOps Framework v2.0*. finops.org. Storment, J. & Fuller, M. (2023). *Cloud FinOps*. 2nd Ed. O'Reilly.

---

## 5. Platform Engineering Maturity Models

**Estado**: Hype maduro, frameworks emergentes (2024-2025)

Platform engineering redefine la pregunta de factibilidad de infraestructura. En lugar de "¿podemos aprovisionar la infraestructura?" la pregunta es "¿la Internal Developer Platform (IDP) del cliente soporta este diseño?" El Team Topologies model distingue entre stream-aligned teams (entregan valor) y platform teams (proveen capacidades).

**Modelos de madurez:**
- **CNCF Platform Engineering Maturity Model**: 5 niveles (Provisional → Operational → Scalable → Optimizing → Innovating). Un cliente en nivel Provisional no puede sostener una arquitectura cloud-native compleja.
- **Backstage + Kratix + Crossplane**: El stack de IDP dominante. La presencia o ausencia de IDP impacta directamente la factibilidad.
- **Golden Paths**: Caminos predefinidos y validados para desplegar servicios. Si el diseño propuesto requiere salir del golden path, la factibilidad de infraestructura se degrada.

**Implicación para el skill:** El sabio de Infraestructura evalúa el nivel de madurez de platform engineering del cliente. Un gap > 2 niveles entre el requerimiento del diseño y la madurez actual es señal de no factibilidad sin inversión previa en plataforma.

**Fuentes:** CNCF (2024). *Platform Engineering Maturity Model*. Humanitec (2024). *State of Platform Engineering Report*. Skelton, M. & Pais, M. (2019). *Team Topologies*. IT Revolution.

---

## 6. AI-Assisted Feasibility Analysis

**Estado**: Adopción temprana, alto potencial (2024-2025)

Los LLM y herramientas de AI code analysis están empezando a asistir en análisis de factibilidad, particularmente en la evaluación de código existente y detección de patrones de complejidad.

**Capacidades actuales:**
- **Code complexity analysis**: LLMs analizan codebases existentes para estimar complejidad ciclomática, deuda técnica, y acoplamiento — inputs para factibilidad cuantitativa.
- **Pattern detection**: Identificación de anti-patterns, code smells, y architectural violations que impactan factibilidad de integración y migración.
- **Documentation synthesis**: LLMs sintetizan documentación dispersa en análisis coherentes — acelerando la fase de ingesta del Think Tank.
- **Scenario simulation**: LLMs simulan escenarios "what-if" sobre arquitecturas propuestas — complementando (no reemplazando) el análisis experto.

**Limitaciones críticas:**
- Los LLM NO pueden evaluar factibilidad sistémica (Conway's Law, dinámica organizacional) con la profundidad de un experto humano.
- Los LLM sufren de "confident incorrectness" — pueden producir análisis de factibilidad convincentes pero erróneos, especialmente en dominios técnicos de nicho.
- La factibilidad es fundamentalmente un juicio experto contextual — el LLM asiste, no decide.

**Implicación para el skill:** Los sabios del Think Tank usan LLM como herramienta de investigación (buscar benchmarks, analizar código, sintetizar documentación) pero NUNCA delegan el juicio de factibilidad al LLM. El veredicto es humano-in-the-loop (o experto-simulado-in-the-loop en el contexto del skill).

**Fuentes:** GitHub (2024). *The Impact of AI on Developer Productivity*. Chen, M., et al. (2024). "Large Language Models for Software Architecture Analysis." *IEEE TSE*.

---

## 7. Team Topologies como Operacionalización de Conway's Law

**Estado**: Práctica consolidada, adopción enterprise acelerada (2024-2025)

Team Topologies (Skelton & Pais, 2019) transformó Conway's Law de observación teórica a framework operativo. Define 4 tipos de equipo (Stream-aligned, Platform, Enabling, Complicated Subsystem) y 3 modos de interacción (Collaboration, X-as-a-Service, Facilitating). Para factibilidad, proporciona un lenguaje concreto para evaluar si la estructura organizacional del cliente puede implementar la arquitectura propuesta.

**Aplicación a factibilidad:**
- **Team Cognitive Load Assessment**: ¿Los equipos del cliente tienen la capacidad cognitiva para absorber la complejidad del diseño propuesto? Si la cognitive load excede la capacidad del equipo, el diseño es organizacionalmente inviable.
- **Interaction Mode Mismatch**: Si el diseño requiere X-as-a-Service pero los equipos operan en modo Collaboration perpetuo, hay un mismatch organizacional.
- **Fast Flow Metrics**: Time to first deploy, lead time for changes, deployment frequency — métricas que validan si la organización puede entregar a la velocidad que el diseño requiere.
- **Team API**: Cada equipo tiene un API implícito (qué provee, qué consume, cómo se comunica). El sabio sistémico evalúa si los Team APIs del cliente son compatibles con la arquitectura propuesta.

**Implicación para el skill:** El sabio sistémico usa Team Topologies como framework de evaluación de la dimensión organizacional. El Inverse Conway Maneuver se propone como mitigación cuando se detecta desalineamiento entre arquitectura y organización.

**Fuentes:** Skelton, M. & Pais, M. (2019). *Team Topologies: Organizing Business and Technology Teams for Fast Flow*. IT Revolution. Skelton, M. & Pais, M. (2023). *Remote Team Interactions Workbook*. IT Revolution.

---

## 8. Wardley Mapping para Posicionamiento Tecnológico

**Estado**: Adopción creciente en consultoría y estrategia tecnológica (2024-2025)

Wardley Mapping — creado por Simon Wardley — posiciona componentes tecnológicos en un mapa bidimensional: eje Y = cadena de valor (de usuario a infraestructura), eje X = evolución (Genesis → Custom → Product → Commodity). Complementa TRL y Hype Cycle al agregar contexto estratégico: no solo "cuán madura es esta tecnología" sino "dónde debería estar en la cadena de valor."

**Aplicación a factibilidad:**
- **Build vs Buy vs Outsource**: La posición en el mapa determina la estrategia óptima. Componentes en Genesis = build (alto riesgo, alta diferenciación). Componentes en Commodity = buy/outsource (bajo riesgo, sin diferenciación).
- **Evolution mismatch**: Usar una tecnología Genesis donde se necesita Commodity (o viceversa) es una señal de inviabilidad estratégica.
- **Ecosystem play**: Los mapas Wardley revelan dependencias de ecosistema (proveedores, competidores, reguladores) que afectan factibilidad.
- **Doctrine assessment**: Wardley define 40+ principios de doctrine que evalúan la madurez estratégica de la organización.

**Implicación para el skill:** El sabio de Madurez Tecnológica complementa su análisis TRL/Hype Cycle con posicionamiento Wardley. Las claims sobre "build vs buy" requieren justificación basada en posición evolutiva, no en preferencia tecnológica.

**Fuentes:** Wardley, S. (2020). *Wardley Maps: The Art of Strategy*. Creative Commons. wardleymaps.com. Burja, S. (2024). "Wardley Mapping for Technology Decision-Making." InfoQ.
