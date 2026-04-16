---
skill: software-architecture
title: State of the Art — Software Architecture (2024–2026)
version: 1.0.0
author: Javier Montaño
copyright: © Comunidad MetodologIA
---

# State of the Art: Software Architecture (2024–2026)

## Tendencia 1: Resurgimiento del Modular Monolith como Arquitectura de Referencia (2024–2025)

**Descripción:** Tras una década de adopción indiscriminada de microservicios, la industria experimenta una corrección significativa. Organizaciones como Shopify (2023–2024), Stack Overflow, y Prime Video de Amazon publicaron post-mortems detallados revertiendo parcialmente hacia monolitos modulares. El "modular monolith" emerge como la arquitectura de referencia para equipos medianos: organización interna rigurosa por módulos con fronteras DDD claras, desplegado como una unidad, con la opción de extracción de servicios cuando la necesidad de escala independiente se demuestra empíricamente.

**Impacto en la práctica de discovery:** El skill software-architecture ahora debe evaluar explícitamente si el cliente necesita microservicios o si un monolito modular correctamente estructurado es la solución más eficiente. La pregunta ya no es "¿microservicios o monolito?" sino "¿cuáles son los criterios medibles que justifican la complejidad de microservicios?". Los ADRs para esta decisión se vuelven obligatorios.

**Madurez:** Consenso creciente en la industria. Múltiples conferencias (QCon, GOTO) dedicaron tracks completos al tema en 2024-2025. Madurez: **Alta — práctica establecida y validada (2024–2025)**.

---

## Tendencia 2: Architecture as Code y Fitness Functions en CI/CD (2024–2026)

**Descripción:** La segunda edición de *Building Evolutionary Architectures* (Ford, Parsons & Kua, 2023) consolida el concepto de "architecture fitness functions" como mecanismo de validación continua. Herramientas como ArchUnit (Java), NetArchTest (.NET), y Dependency-Cruiser (JS/TS) permiten escribir reglas arquitectónicas (sin dependencias circulares, sin acceso directo a DB desde controllers, capas no pueden saltar layers) como tests ejecutados en CI/CD. Structurizr 2024 introduce "Architecture as Code" donde los diagramas C4 se generan desde el código mismo.

**Impacto en la práctica de discovery:** Los ADRs producidos por el skill ahora tienen un artefacto hermano natural: los tests de fitness function que validan que la decisión se cumple en producción. La deuda arquitectónica detectada en S6 se convierte en backlog de fitness functions a implementar. Esto transforma el deliverable de estático a living documentation.

**Madurez:** Herramientas maduras para Java y .NET; emergente para Python y Go. Adopción alta en organizaciones con cultura de engineering sólida. Madurez: **Alta en ecosistemas JVM/.NET; Creciente en otros (2024–2025)**.

---

## Tendencia 3: AI-Augmented Architecture — LLMs como Herramientas de Diseño y Análisis (2024–2026)

**Descripción:** Los modelos de lenguaje grande (GPT-4, Claude, Gemini) se integran en el ciclo de diseño arquitectónico de tres formas emergentes: (1) generación asistida de ADRs desde contexto de código y conversaciones de diseño; (2) análisis estático aumentado para detectar anti-patrones y debt en codebases grandes con cobertura que herramientas tradicionales no alcanzan; (3) síntesis de quality attribute scenarios desde requisitos de negocio en lenguaje natural. Herramientas como GitHub Copilot Workspace y Amazon Q Developer comienzan a proveer "architecture suggestions" basadas en patrones del codebase.

**Impacto en la práctica de discovery:** El arquitecto se convierte en "architecture reviewer" más que "architecture extractor". Los LLMs aceleran la generación de documentación inicial (module view, component cards, ADR drafts) que el arquitecto valida, enriquece, y aprueba. La calidad del análisis depende de la calidad del prompt y del contexto inyectado — competencia central del skill.

**Madurez:** Rápidamente emergente. Resultados variables según el nivel de deuda del codebase y la claridad del naming. Madurez: **Emergente → Early Majority (2025–2026)**.

---

## Tendencia 4: Vertical Slice Architecture como Alternativa al Layered Clásico (2024–2025)

**Descripción:** Popularizada por Jimmy Bogard (2018–2024), la Vertical Slice Architecture organiza el código no por capas horizontales sino por features/use cases completos. Cada "slice" contiene toda la lógica necesaria para una operación de negocio: desde el request HTTP hasta la respuesta, pasando por validación, lógica de dominio, y persistencia. Patrones como MediatR (CQRS simplificado) en .NET y similares en otros ecosistemas facilitan esta organización. El enfoque reduce el "overhead de abstracción" típico del layered mal implementado.

**Impacto en la práctica de discovery:** En análisis de codebases existentes, los arquitectos deben reconocer cuándo un cliente ha implementado implícitamente vertical slices sin nombrarlo. Para nuevos sistemas, el skill debe incluir en la evaluación de patrones arquitectónicos la dimensión "feature-based vs. layer-based organization", con ADRs que justifiquen la elección. La modifiability de agregar nuevas features se optimiza con vertical slices; la modifiability de cambiar infraestructura transversal se optimiza con layers.

**Madurez:** Madura en ecosistema .NET. Creciente en Java (con Spring y Hexagonal combinados). Emergente como terminología formal en otros ecosistemas. Madurez: **Alta en .NET; Creciente en JVM (2024–2025)**.

---

## Tendencia 5: Platform Engineering y Internal Developer Platforms (IDP) como Contexto Arquitectónico (2024–2026)

**Descripción:** El movimiento de Platform Engineering (Gartner Top Strategic Technology Trends 2024) redefine el contexto en el que se diseña la arquitectura de software. Las organizaciones maduran desde "cada equipo elige su stack" hacia plataformas internas con golden paths: patrones de servicio pre-aprobados, templates de microservicio, contratos de observabilidad, y fitness functions centralizadas. Backstage (CNCF) se convierte en el estándar de facto para IDP catalogs con más de 25.000 adopciones en 2024.

**Impacto en la práctica de discovery:** El skill software-architecture ahora debe considerar las restricciones y oportunidades del IDP existente del cliente como input al diseño. Los module views y component cards deben alinearse con los "golden paths" disponibles en la plataforma. Los ADRs deben documentar explícitamente cuando se decide desviar del golden path y por qué. La deuda técnica incluye "deuda de plataforma": servicios que no siguen los patrones del IDP.

**Madurez:** Alta en organizaciones con más de 50 desarrolladores y múltiples equipos. Emergente en organizaciones más pequeñas. Madurez: **Creciente — Early Majority en enterprises (2024–2026)**.

---

## Tendencia 6: Arquitectura para Sistemas Agenticos y AI-Native Applications (2025–2026)

**Descripción:** La proliferación de sistemas LLM-powered introduce nuevos patrones arquitectónicos sin equivalente previo: orquestación multi-agente, tool use, context management (RAG, memory), y flujos no deterministas. Patrones emergentes documentados en 2024-2025: ReAct (Reasoning + Acting), Chain-of-Thought como flujo de proceso, y arquitecturas de agentes con roles separados (planner, executor, critic). La latencia de llamadas a LLM (500ms-5s por llamada) introduce nuevos trade-offs de performance que los patrones tradicionales no contemplan. Google DeepMind y Anthropic publicaron guías de "agent architecture" en 2025.

**Impacto en la práctica de discovery:** El skill debe extender su catálogo de patrones arquitectónicos para incluir decisiones específicas de sistemas AI-native: ¿LLM orquestado vs. autónomo?, ¿síncron vs. asíncrono para cadenas de agentes?, ¿cómo modelar la testabilidad de flujos no deterministas?. Los quality attribute scenarios necesitan nuevas métricas: "accuracy" como atributo de calidad, latencia compuesta de cadenas de agentes, y costo por inferencia como constraint arquitectónico.

**Madurez:** Emergente pero de alto impacto. Patrones en consolidación, no hay consenso canónico aún. Madurez: **Emergente → Creciente (2025–2026)**.

---

## Tendencia 7: Software Supply Chain Security como Constraint Arquitectónico (2024–2026)

**Descripción:** Tras incidentes de alta visibilidad (Log4Shell 2021, XZ Utils 2024), la seguridad de la cadena de suministro de software (SLSA framework, SBOM — Software Bill of Materials) se convierte en requisito arquitectónico, no solo operacional. SLSA Level 3+ (2024) requiere que las decisiones arquitectónicas consideren la superficie de ataque de las dependencias. La composición de módulos y el manejo de dependencias transitivas se convierten en decisiones con implicaciones de seguridad documentadas en ADRs. OWASP Top 10 for Software Supply Chain Security (2024) formaliza este espacio.

**Impacto en la práctica de discovery:** Los módulos y sus dependencias externas documentados en el Module View ahora incluyen una dimensión de seguridad: supply chain risk por dependencia. Los ADRs de selección de frameworks y librerías incluyen explícitamente evaluación SLSA, licenciamiento, y historial de vulnerabilidades. La deuda técnica incluye "deuda de supply chain": dependencias sin SBOM, sin signature verification, o con historial de vulnerabilidades críticas.

**Madurez:** Alta como conciencia; variable en implementación. Regulaciones en Europa (Cyber Resilience Act 2024) y EE.UU. (SBOM mandates) aceleran adopción. Madurez: **Creciente obligatoria por regulación (2024–2026)**.

---
**Autor:** Javier Montaño | **© Comunidad MetodologIA** | **Versión:** 1.0.0 | **Fecha:** Marzo 2026
