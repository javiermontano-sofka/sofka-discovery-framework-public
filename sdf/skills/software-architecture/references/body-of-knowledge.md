---
skill: software-architecture
title: Body of Knowledge — Software Architecture
version: 1.0.0
author: Javier Montaño
copyright: © Comunidad MetodologIA
---

# Body of Knowledge: Software Architecture

## 1. Fundamentos Teóricos

La arquitectura de software es la disciplina que define la estructura interna de un sistema: cómo se organiza el código en módulos, cómo fluyen las dependencias, qué patrones estructurales gobiernan el diseño, y por qué cada decisión significativa fue tomada. Su naturaleza es fundamentalmente decisional — no descriptiva.

**Pilares epistemológicos:**
- **Decidibilidad explícita:** Toda decisión arquitectónica que no fue documentada es, por definición, una casualidad con deuda potencial. (Evans, 2003; Richards & Ford, 2020)
- **Quality Attributes como fuerza conductora:** Los patrones sirven a los atributos de calidad, no al revés. CQRS sin necesidad de escalabilidad separada es complejidad gratuita. (Bass, Clements & Kazman, *Software Architecture in Practice*, 4th ed. 2022)
- **Deuda técnica como decisión consciente:** La deuda no se acumula por negligencia — se acumula por decisiones implícitas. Se documenta, se prioriza, se paga estratégicamente. (Ward Cunningham, 1992; Martin Fowler, *Refactoring*, 2018)

**Definición canónica (IEEE 42010:2011):** "La arquitectura de software de un sistema es la organización fundamental del sistema encarnada en sus componentes, sus relaciones entre sí y con el entorno, y los principios que gobiernan su diseño y evolución."

## 2. Patrones Arquitectónicos Principales

### Layered Architecture (N-Tier)
**Origen:** Structured Design (Yourdon & Constantine, 1979). Patrón predominante en sistemas enterprise desde los años 90. **Estructura:** Capas horizontales con dependencias estrictamente hacia abajo (presentation → business → persistence → infrastructure). **Ventajas:** clara separación de responsabilidades, fácil escalado de equipos. **Limitaciones:** cambios cross-layer costosos, testabilidad reducida por dependencias concretas.

### Hexagonal Architecture (Ports & Adapters)
**Autor:** Alistair Cockburn (2005, artículo seminal; formalizado en 2023 con la actualización del patrón). **Principio:** el núcleo de dominio no conoce la infraestructura. Los puertos definen contratos; los adaptadores implementan los detalles técnicos. **Ventajas:** testabilidad máxima del dominio sin infraestructura, intercambiabilidad de adaptadores (DB, UI, mensajería). **Cuándo usar:** sistemas con múltiples integraciones externas o con lógica de dominio compleja que debe sobrevivir cambios tecnológicos.

### Clean Architecture
**Autor:** Robert C. Martin (*Clean Architecture: A Craftsman's Guide*, 2017). **Estructura:** círculos concéntricos con la regla de dependencia hacia adentro: Entities → Use Cases → Interface Adapters → Frameworks & Drivers. **Relación con Hexagonal:** arquitecturalmente equivalente en el principio de inversión de dependencias; Clean Architecture es más prescriptiva en la nomenclatura de capas. **Cuándo usar:** sistemas donde la independencia del framework es prioritaria.

### CQRS (Command Query Responsibility Segregation)
**Autor:** Greg Young (2010, formalización); concepto derivado del CQS de Bertrand Meyer (1988). **Principio:** separar el modelo de escritura (commands) del modelo de lectura (queries). **Ventajas:** optimización independiente de read/write paths, escalado diferencial, modelos de query flexibles. **Riesgo:** consistencia eventual introduce complejidad; CQRS sin Event Sourcing puede ser sobrediseño.

### Event Sourcing
**Autor:** Greg Young (2010); popularizado por Martin Fowler (*Event Sourcing*, 2005). **Principio:** el estado del sistema no se almacena como estado actual sino como secuencia de eventos inmutables. **Ventajas:** audit trail completo, capacidad de replay, temporal queries. **Riesgo:** event schema evolution compleja, no hay updates in-place, snapshots necesarios para performance. **Cuándo usar obligatoriamente:** sistemas financieros con requisito de audit trail, sistemas con compliance de immutability.

### Microkernel (Plugin Architecture)
**Estructura:** núcleo mínimo estable + plugins que extienden funcionalidad. **Casos de uso:** IDEs, sistemas de reglas de negocio variables por cliente, plataformas extensibles. **Riesgo:** la API del core debe ser estable desde el inicio — cambiarla rompe todos los plugins.

## 3. Patrones de Diseño Fundamentales

**Catálogo canónico:** Gang of Four — Gamma, Helm, Johnson & Vlissides, *Design Patterns* (1994). 23 patrones clasificados en creacionales, estructurales y de comportamiento. Los más relevantes en arquitectura enterprise:

| Patrón | Categoría | Uso Arquitectónico Principal |
|--------|-----------|------------------------------|
| **Repository** | Estructural | Desacoplar dominio de la persistencia. Contrato de acceso a datos sin exponer ORM. |
| **Factory / Abstract Factory** | Creacional | Crear objetos sin exponer lógica de construcción; útil para adaptadores intercambiables. |
| **Observer / Event Bus** | Comportamiento | Desacoplamiento entre productores y consumidores de eventos de dominio. |
| **Strategy** | Comportamiento | Algoritmos intercambiables en runtime; ideal para reglas de negocio variables. |
| **Facade** | Estructural | Simplificar interfaz de subsistemas complejos; punto de integración estable. |
| **Adapter** | Estructural | Traducir interfaces incompatibles; esencial en Anti-Corruption Layers. |
| **Decorator** | Estructural | Agregar comportamiento sin modificar la clase original (cross-cutting concerns). |
| **Specification** | Dominio | Encapsular reglas de negocio complejas como objetos combinables (Evans, 2003). |

## 4. Architecture Decision Records (ADRs)

**Origen:** Michael Nygard (2011, artículo "Documenting Architecture Decisions"). Adoptado por la comunidad con múltiples plantillas: MADR (Markdown Architectural Decision Records), Y-Statements, RFC format.

**Estructura canónica de un ADR:**
- **Título:** Decisión en forma de proposición afirmativa
- **Estado:** Proposed / Accepted / Deprecated / Superseded (con referencia al ADR que lo reemplaza)
- **Contexto:** Fuerzas, restricciones, y problema que motiva la decisión
- **Decisión:** Qué se eligió y por qué — la justificación es el elemento de mayor valor
- **Consecuencias:** Positivas (qué habilita), negativas (qué restringe), neutras (efectos secundarios)
- **Alternativas consideradas:** Qué se evaluó y por qué fue rechazado

**Principio de scope:** Solo son ADRs las decisiones que afectan múltiples componentes, que costarían significativamente cambiar después, o que implican trade-offs entre quality attributes. Selección de librerías locales, convenciones de naming, o decisiones de implementación específica no son ADRs.

## 5. Quality Attributes y ATAM

**ATAM (Architecture Tradeoff Analysis Method)** — Software Engineering Institute (CMU), Kazman et al. (1998, revisado 2013). Método estructurado para evaluar arquitecturas contra quality attributes mediante escenarios de calidad.

**Quality Attribute Scenarios (formato ATAM):** Estímulo → Fuente → Entorno → Artefacto → Respuesta → Medida de Respuesta.

**ISO/IEC 25010 (SQuaRE)** — estándar internacional de características de calidad de producto software (2011, revisado 2023). Ocho características: funcional suitability, performance efficiency, compatibility, usability, reliability, security, maintainability, portability. El skill opera principalmente sobre maintainability (modifiability, testability), performance efficiency, reliability (availability, fault tolerance), y security.

**Principio de trade-off:** Ningún atributo de calidad es gratuito. Performance vs. security (cifrado agrega latencia), availability vs. consistency (CAP theorem, Brewer 2000), modifiability vs. performance (abstracciones añaden overhead). El arquitecto documenta los trade-offs, no los oculta.

## 6. Deuda Técnica y Evolución Arquitectónica

**Ward Cunningham** (1992, primer uso del término "deuda técnica") — la metáfora financiera: código subóptimo es como tomar deuda financiera; los intereses son el costo adicional de trabajar con código no refactorizado.

**Taxonomía de deuda técnica** (Alves et al., 2014):
- **Deuda de código:** Código que funciona pero viola principios de diseño (God Objects, métodos largos, magic numbers)
- **Deuda arquitectónica:** Decisiones estructurales que generan fricción sistémica (coupling entre capas, ausencia de interfaces, violación de inversión de dependencias)
- **Deuda de testing:** Cobertura insuficiente que incrementa el riesgo de regresiones
- **Deuda de documentación:** Ausencia de ADRs, README obsoletos, arquitectura implícita

**Evolutionary Architecture** (Ford, Parsons & Kua, *Building Evolutionary Architectures*, 2nd ed. 2023): la arquitectura debe diseñarse para cambiar guiada por fitness functions automatizadas. El concepto de "fitness function" como mecanismo de validación continua de propiedades arquitectónicas en CI/CD es el estado del arte en gestión de deuda proactiva.

**Strangler Fig Pattern** (Martin Fowler, 2004) — estrategia canónica para migración incremental: el sistema nuevo crece alrededor del legacy, redirigiendo tráfico progresivamente hasta que el legacy puede ser eliminado. Aplica directamente a la estrategia de evolución del skill.

## 7. Herramientas y Tecnologías

**Modelado y documentación:**
- **C4 Model** (Simon Brown, 2018): 4 niveles de abstracción — Context, Container, Component, Code. El skill opera en los niveles Component y Code principalmente.
- **arc42** (Gernot Starke, 2005; actualizado continuamente): plantilla de documentación arquitectónica con 12 secciones. Usado como base para documentar grandes sistemas enterprise en Europa.
- **Structurizr** (Simon Brown): tooling oficial del C4 Model — Architecture as Code.
- **Mermaid.js / PlantUML**: diagramas como código integrados en repositorios.

**Análisis estático y detección de deuda:**
- **SonarQube / SonarCloud**: detección de code smells, technical debt index, cyclomatic complexity
- **ArchUnit** (Java) / **NetArchTest** (.NET): fitness functions para validar reglas de dependencia en CI
- **Dependency-Cruiser** (JS/TS): análisis de dependencias de módulos, detección de ciclos
- **NDepend** (.NET): análisis profundo de métricas arquitectónicas

**Testing de arquitectura:**
- **Pact**: contract testing consumer-driven para REST y mensajería
- **Spring Cloud Contract**: contracts para sistemas Spring
- **ArchUnit + JUnit**: reglas de arquitectura ejecutadas como unit tests

## 8. Referencias Cruzadas a Otros Skills

| Skill | Relación |
|-------|----------|
| **flow-mapping** | El análisis de flujos E2E revela acoplamiento entre módulos no visible desde el código estático. Los bounded contexts de DDD informan directamente la modularización en software-architecture. |
| **asis-analysis** | El análisis AS-IS (S3 Architecture) es el input primario para identificar la arquitectura actual antes de diseñar la objetivo. La deuda identificada alimenta directamente S6 del skill. |
| **solutions-architecture** | Software-architecture define la estructura interna; solutions-architecture ensambla múltiples sistemas internos con integraciones externas. El skill es el input de la vista de container/component del C4. |
| **infrastructure-architecture** | Los quality attributes de performance y availability producidos por este skill se traducen en requisitos de compute, red, y almacenamiento para infrastructure-architecture. |
| **devsecops-architecture** | Las decisiones de modularidad y las fitness functions del evolution plan se implementan como controles en el pipeline CI/CD diseñado por devsecops-architecture. |
| **functional-spec** | Los use cases de la especificación funcional son los estímulos de los escenarios ATAM. Los component contracts del software-architecture formalizan los contratos de las APIs funcionales. |
| **scenarios** | Los trade-offs arquitectónicos documentados en ADRs alimentan el análisis de escenarios Tree-of-Thought. Las quality attributes scores informan la evaluación de escenarios en la dimensión técnica. |

---
**Autor:** Javier Montaño | **© Comunidad MetodologIA** | **Versión:** 1.0.0 | **Fecha:** Marzo 2026
