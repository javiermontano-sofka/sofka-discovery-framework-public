---
title: Body of Knowledge — Arquitectura Enterprise
skill: metodologia-enterprise-architecture
author: Javier Montaño
brand: Comunidad MetodologIA ©
updated: 2026-03-13
---

# Body of Knowledge: Arquitectura Enterprise

> Corpus de conocimiento estructurado para la práctica de Arquitectura Enterprise en Comunidad MetodologIA. Cubre fundamentos teóricos, marcos de referencia, obras seminales, metodologías, herramientas y conexiones con otras disciplinas.

---

## 1. Fundamentos Teóricos

### 1.1 Definición y Propósito

La Arquitectura Enterprise (EA) es la práctica de alinear la estrategia de negocio con la tecnología a través de un modelo coherente de capacidades, sistemas, datos, procesos y personas. Su propósito central es responder tres preguntas organizacionales:

- **¿Qué?** — Qué capacidades necesita la empresa para competir.
- **¿Cómo?** — Cómo la tecnología soporta esas capacidades.
- **¿Cuándo?** — En qué orden se invierte, con qué gobierno.

### 1.2 Principios Fundacionales

| Principio | Enunciado | Implicación Práctica |
|-----------|-----------|---------------------|
| Capacidades > Sistemas | Se invierte en lo que la empresa hace, no en tecnología per se | El mapa de capacidades precede al inventario tecnológico |
| Radar > Mandato | El technology radar guía; no obliga | Los equipos proponen, el ARB valida, el contexto decide |
| Gobierno Proporcional | Más governance donde el riesgo/costo es alto | Innovación con gobierno ligero; núcleo con gobierno fuerte |
| Ley de Conway | El software refleja la estructura comunicacional de quien lo crea | Diseñar org-structure y arquitectura de forma conjunta |
| Decisiones Traceable | Cada decisión tecnológica conecta a un objetivo de negocio | ADRs obligatorios para decisiones de alto impacto |

### 1.3 El Problema que Resuelve

Sin arquitectura enterprise, las organizaciones experimentan:
- **Fragmentación de capacidades**: cada equipo optimiza localmente, la empresa se degrada globalmente.
- **Shadow IT y duplicación**: múltiples sistemas haciendo lo mismo sin gobierno.
- **Inversión reactiva**: se gasta en urgencias, no en capacidades estratégicas.
- **Deuda técnica estructural**: acumulación silenciosa que bloquea la innovación.

---

## 2. Marcos de Referencia

### 2.1 TOGAF (The Open Group Architecture Framework)

El marco más adoptado mundialmente para EA. Organiza el trabajo en cuatro dominios arquitectónicos:

- **Business Architecture**: procesos, capacidades, estructura organizacional.
- **Data Architecture**: entidades de datos, flujos, gobierno.
- **Application Architecture**: sistemas, integraciones, inventario de aplicaciones.
- **Technology Architecture**: infraestructura, plataformas, nube.

El **ADM (Architecture Development Method)** es el ciclo iterativo de TOGAF: desde visión preliminar hasta gestión del cambio. Phases A–H + Requerimientos (Phase R).

**Aplicación en MetodologIA**: TOGAF se usa como vocabulario y estructura conceptual, no como proceso burocrático. Se extraen las herramientas relevantes (capability catalog, architecture roadmap, gap analysis) sin implementar todas las fases.

### 2.2 Marco Zachman

Ontología bidimensional para clasificar artefactos arquitectónicos según:
- **Filas (perspectivas)**: Ejecutivo, Gerente de Negocio, Arquitecto, Ingeniero, Técnico, Empresa.
- **Columnas (interrogantes)**: Qué, Cómo, Dónde, Quién, Cuándo, Por Qué.

Útil para catalogar qué artefactos existen y cuáles faltan en una organización.

### 2.3 FEAF (Federal Enterprise Architecture Framework)

Marco del gobierno federal estadounidense. Introduce los **Reference Models** (BRM, DRM, TRM, SRM) para estandarizar el lenguaje de capacidades entre agencias. Relevante para clientes del sector público o de salud.

### 2.4 SAFe (Scaled Agile Framework) — Perspectiva EA

SAFe incorpora Enterprise Architecture como función explícita dentro del nivel Portfolio. El **Enterprise Architect** en SAFe define guardrails tecnológicos y facilita la evolución de la arquitectura en múltiples Agile Release Trains (ARTs). Conecta la visión de portafolio con las decisiones técnicas de los equipos.

### 2.5 Team Topologies

Marco organizacional de Skelton & Pais (2019) que define cuatro tipos de equipos y tres modos de interacción. Esencial para diseñar el Target Operating Model y alinear estructura organizacional con arquitectura.

---

## 3. Obras Seminales

| Obra | Autor(es) | Año | Aporte Clave |
|------|-----------|-----|-------------|
| *Enterprise Architecture as Strategy* | Ross, Weill, Robertson | 2006 | Introduce el concepto de "Operating Model" y la base para la agilidad empresarial |
| *Team Topologies* | Skelton, Pais | 2019 | Tipología de equipos y modos de interacción; base del TOM moderno |
| *Domain-Driven Design* | Eric Evans | 2003 | Bounded contexts, lenguaje ubicuo, modelado estratégico |
| *Accelerate* | Forsgren, Humble, Kim | 2018 | Evidencia empírica de DORA metrics como predictores de desempeño |
| *The Phoenix Project* | Kim, Behr, Spafford | 2013 | Narrativa de transformación; introduce los "Four Types of Work" |
| *Technology Strategy Patterns* | Hewitt | 2018 | Patrones de estrategia tecnológica para arquitectos y CTOs |
| *Building Evolutionary Architectures* | Ford, Parsons, Kua | 2017 | Fitness functions, arquitectura como proceso continuo |
| *TOGAF® Standard, Version 9.2* | The Open Group | 2018 | Marco canónico de EA |

---

## 4. Metodologías Aplicadas

### 4.1 Capability Mapping

Técnica de identificación y clasificación de capacidades de negocio organizadas en tres niveles:
- **L1 (Estratégico)**: capacidades que definen la propuesta de valor.
- **L2 (Gerencial)**: capacidades de soporte y coordinación.
- **L3 (Operacional)**: actividades concretas y procesos.

**Proceso**: workshops de descubrimiento → clasificación Core/Supporting/Generic → evaluación de madurez (1-5) → heat map → gap analysis.

### 4.2 Domain-Driven Design (DDD) Estratégico

Aplicado a nivel enterprise (no solo software):
- **Identificación de bounded contexts**: límites semánticos del negocio.
- **Context mapping**: relaciones entre contextos (Shared Kernel, ACL, Customer/Supplier).
- **Clasificación de dominios**: Core (ventaja competitiva), Supporting (necesario), Generic (commoditizado).

### 4.3 Technology Radar (ThoughtWorks-style)

Proceso trimestral de evaluación de tecnologías en cuatro categorías: Adopt, Trial, Assess, Hold. El radar se construye con:
1. Nominaciones de equipos técnicos.
2. Evaluación por el ARB.
3. Publicación y comunicación activa.
4. Revisión quarterly.

### 4.4 Portfolio Prioritization

Técnica para alinear inversión con estrategia:
- **Análisis Pareto**: identificar el 20% de iniciativas que generan el 80% del valor.
- **Matriz Valor/Esfuerzo**: cuadrantes Quick Win, Strategic Bet, Fill-In, Avoid.
- **OKR Alignment**: mapear iniciativas a Objectives and Key Results empresariales.
- **Investment balance**: 60% estratégico, 20% operacional, 20% deuda técnica.

### 4.5 Architecture Decision Records (ADR)

Formato ligero para documentar decisiones arquitectónicas:
- **Contexto**: problema que motivó la decisión.
- **Decisión**: qué se decidió.
- **Consecuencias**: trade-offs aceptados.
- **Estado**: Proposed / Accepted / Deprecated / Superseded.

---

## 5. Herramientas y Tecnologías

### 5.1 Modelado y Documentación

| Herramienta | Uso Principal | Contexto |
|-------------|--------------|----------|
| Structurizr | Diagramas C4 como código | Arquitectura de sistemas, integración con repos |
| Archi | Modelado TOGAF/ArchiMate | Documentación formal de EA |
| LeanIX | Inventario de aplicaciones y capacidades | Enterprise-grade, grandes corporaciones |
| Ardoq | Mapa de capacidades y portafolio | Análisis de impacto, transformación digital |
| Mermaid / PlantUML | Diagramas en código | Uso en MetodologIA; integración en markdown |

### 5.2 Gestión de Portafolio

| Herramienta | Uso Principal |
|-------------|--------------|
| Jira Advanced Roadmaps | Portafolio de iniciativas Agile |
| Aha! | Estrategia y roadmap de producto |
| Productboard | Priorización de iniciativas |
| Monday.com | Seguimiento ejecutivo de portafolio |

### 5.3 Technology Radar

| Herramienta | Uso Principal |
|-------------|--------------|
| ThoughtWorks Radar Bespoke | Construir y publicar tech radar interactivo |
| Zalando Tech Radar | Template open-source de radar |
| AOE Tech Radar | Herramienta self-hosted para radar |

### 5.4 Métricas DORA

| Herramienta | Uso Principal |
|-------------|--------------|
| DORA DevOps Quick Check | Evaluación de capacidades DORA |
| Sleuth | Tracking DORA metrics en tiempo real |
| LinearB | Engineering metrics y DORA |
| Faros AI | Plataforma de ingeniería de datos para DORA |

---

## 6. Modelos de Madurez

### 6.1 Escala de Madurez de Capacidades (1-5)

| Nivel | Nombre | Características |
|-------|--------|----------------|
| 1 | Ad-hoc | Inconsistente, no documentado, dependiente de individuos |
| 2 | Definido | Documentado pero ejecución inconsistente |
| 3 | Gestionado | Estandarizado, medido, controlado |
| 4 | Optimizado | Mejora continua, automatizado, datos en tiempo real |
| 5 | Estratégico | Ventaja competitiva diferenciadora |

### 6.2 DORA Performance Tiers

| Tier | Deployment Frequency | Lead Time | Change Failure Rate | MTTR |
|------|---------------------|-----------|--------------------|----|
| Elite | On-demand (múltiples/día) | <1 hora | <5% | <1 hora |
| High | 1x/día – 1x/semana | <1 día | 5-10% | <1 día |
| Medium | 1x/semana – 1x/mes | 1 semana – 1 mes | 10-15% | 1 día – 1 semana |
| Low | <1x/mes | >6 meses | >15% | >6 meses |

---

## 7. Patrones Arquitectónicos Clave

| Patrón | Problema que Resuelve | Cuando Aplicar |
|--------|----------------------|---------------|
| Strangler Fig | Migración incremental de sistemas legacy | Modernización sin big-bang |
| Anti-Corruption Layer (ACL) | Aislamiento semántico entre bounded contexts | Integración con legacy o terceros |
| Platform as a Product | Friction en equipos de producto para usar infra | Escalar equipos con autonomía |
| Fitness Functions | Validar decisiones arquitectónicas continuamente | CI/CD para arquitectura |
| Conway's Law Inverse | Diseñar org para obtener arquitectura deseada | Reorganizaciones, new products |

---

## 8. Referencias Cruzadas con Otras Disciplinas

| Disciplina | Conexión | Dirección |
|-----------|----------|-----------|
| **metodologia-solutions-architecture** | Recibe capability map y domain model; diseña soluciones dentro de los bounded contexts | EA → SA |
| **metodologia-software-architecture** | Recibe estándares tecnológicos del radar y patrones del ARB | EA → SwA |
| **metodologia-infrastructure-architecture** | Implementa recomendaciones del operating model y radar para plataformas | EA → IA |
| **metodologia-devsecops-architecture** | Aplica controles de cumplimiento y estándares de gobierno en pipelines | EA → DevSecOps |
| **metodologia-data-governance** | La arquitectura de datos enterprise emana del domain model DDD | EA → DG |
| **Flow Mapping (04)** | Los flujos de proceso validan los bounded contexts definidos en EA | Bidireccional |
| **Scenarios (05)** | Los escenarios de solución deben caber dentro del technology radar y las capacidades mapeadas | SA/SA → EA |

---

*© Comunidad MetodologIA — Autor: Javier Montaño — Uso interno y con clientes*
