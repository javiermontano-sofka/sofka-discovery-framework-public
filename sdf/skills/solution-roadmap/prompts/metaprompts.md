---
skill: solution-roadmap
title: "Metaprompts — Solution Roadmap"
author: Javier Montaño
copyright: "© Comunidad MetodologIA"
updated: 2026-03-13
---

# Metaprompts: Solution Roadmap

> Meta-prompts for generating customized prompts for the `solution-roadmap` skill, adapted to program size, sector, budget constraints, and client organizational maturity.

---

## Metaprompt 1: Roadmap Generator by Program Size and Complexity

**Purpose:** Create a roadmap prompt calibrated to the real program size: from small transformations (<$2M, <15 people) to enterprise programs (>$10M, >50 people) with multiple vendors and regions.

**Template:**
```
Eres un delivery manager senior de Comunidad MetodologIA especializado en transformaciones tecnológicas de [TAMAÑO_PROGRAMA].
Necesito generar un prompt personalizado para el skill `solution-roadmap` calibrado a este programa específico.

PARÁMETROS DEL PROGRAMA:
- Nombre del proyecto: [PROYECTO]
- Tamaño presupuestal: [RANGO] (under2m / 2m-5m / 5m-10m / over10m)
- Duración objetivo: [MESES] meses
- Peak team size: [NÚMERO] personas
- Número de vendors/socios: [NÚMERO]
- Regiones de despliegue: [LISTA_REGIONES] (1 región / multi-regional / global)
- Existencia de PMO: [Sí / No / Se creará en Phase 1]

COMPLEJIDAD ORGANIZACIONAL:
- Experiencia del cliente con transformaciones: [Baja / Media / Alta]
- Resistencia al cambio anticipada: [Baja / Media / Alta]
- Disponibilidad del patrocinador ejecutivo: [Dedicado / Parcial / Distante]
- Cultura de toma de decisiones: [Centralizada / Distribuida / Consenso]

Con estos parámetros, genera un prompt para el skill `solution-roadmap` que:
1. Escale la gobernanza al tamaño real (no sobrecargue un programa de $500K con gobernanza de $10M)
2. Ajuste la frecuencia de gates y steering committees a la cadencia del programa
3. Defina el nivel de formalidad apropiado para los kill criteria y change control
4. Calibre los rangos de estimación (Cone of Uncertainty) al momento del programa
5. Adapte el nivel de detalle del team ramp-up a la disponibilidad de información
```

**Usage guide:**
- Use before starting any roadmap engagement to calibrate the base prompt
- Budget size is the most important driver of governance and formality
- Review the metaprompt output with the assigned delivery manager before using it with the client

---

## Metaprompt 2: Estimation Pivot Point Generator by Technical Domain

**Purpose:** Create prompts that generate estimation pivot points specific to the technical domain of the transformation (cloud migration, core banking modernization, retail digitalization, etc.), with PoC validation criteria adapted to the stack.

**Template:**
```
Eres un arquitecto de soluciones de Comunidad MetodologIA especializado en [DOMINIO_TÉCNICO].
Necesito generar estimation pivot points específicos para el skill `solution-roadmap` en el contexto de [DOMINIO_TÉCNICO].

CONTEXTO DE LA TRANSFORMACIÓN:
- Dominio: [DOMINIO] (ejemplos: migración cloud, modernización core bancario, microservicios, data platform, AI/ML ops)
- Stack actual (AS-IS): [TECNOLOGÍAS_ACTUALES]
- Stack objetivo (TO-BE): [TECNOLOGÍAS_OBJETIVO]
- Tamaño del sistema: [LÍNEAS_DE_CÓDIGO / SERVICIOS / TABLAS] como proxy de complejidad
- Deuda técnica documentada: [DESCRIPCIÓN] (ejemplo: 40% de código sin tests, 0 documentación API)

SUPUESTOS CRÍTICOS CONOCIDOS:
- Supuesto técnico 1: [SUPUESTO_1] — riesgo de invalidación: [Alto/Medio/Bajo]
- Supuesto técnico 2: [SUPUESTO_2] — riesgo de invalidación: [Alto/Medio/Bajo]
- Supuesto de equipo: [SUPUESTO_EQUIPO] — riesgo: [Alto/Medio/Bajo]
- Supuesto de datos: [SUPUESTO_DATOS] — riesgo: [Alto/Medio/Bajo]

Genera el prompt para crear estimation pivot points que:
1. Identifiquen los 5+ supuestos más impactantes para ESTE dominio técnico específico
2. Definan criterios de validación PoC medibles con el stack objetivo (no genéricos)
3. Cuantifiquen el impacto en semanas y presupuesto si el supuesto falla
4. Provean 2-3 pivot options por supuesto, ordenadas por costo de pivote
5. Determinen el timing de validación (antes de qué gate y por qué)
6. Apliquen el Pivot Decision Framework con umbrales calibrados al programa
```

**Usage guide:**
- Execute after having the TO-BE architecture but before closing the roadmap
- The most impactful assumptions should be discussed with the client in the scenarios workshop
- The Phase 1 PoC should be explicitly designed to validate the identified pivot points

---

## Metaprompt 3: Risk Management Generator by Sector and Industry

**Purpose:** Create prompts that generate risk analyses specific to the client's sector, including regulatory, market, and technology risks relevant to that industry in 2024-2026.

**Template:**
```
Eres un risk manager senior de Comunidad MetodologIA especializado en transformaciones en [SECTOR].
Necesito generar el análisis de riesgos para el skill `solution-roadmap` en el contexto de [SECTOR].

CONTEXTO DEL CLIENTE:
- Sector: [SECTOR] (ejemplos: banca, retail, salud, logística, manufactura, gobierno, telco)
- Regulaciones aplicables: [LISTA_REGULACIONES]
- Jurisdicción: [PAÍS/REGIÓN]
- Tipo de transformación: [TIPO] (migración cloud, modernización, digitalización, AI/ML)

FACTORES DE RIESGO CONOCIDOS:
- Riesgos técnicos identificados: [LISTA_RIESGOS_TÉCNICOS]
- Riesgos de negocio conocidos: [LISTA_RIESGOS_NEGOCIO]
- Key persons de riesgo: [ROLES_CRÍTICOS_EN_RIESGO]
- Deadlines regulatorios: [LISTA_DEADLINES]
- Dependencias de terceros: [LISTA_VENDORS_CRÍTICOS]

Genera el prompt para crear un risk management que:
1. Incluya los riesgos típicos de ese sector (ejemplo: banca → riesgo regulatorio CNBV/SFC, ventanas de mantenimiento reguladas)
2. Documente 3+ cadenas de cascade failure específicas al contexto (no genéricas)
3. Defina early warning indicators con métricas relevantes para el sector
4. Establezca kill criteria adaptados al impacto real de negocio en ese sector
5. Incluya el calendario de riesgos regulatorios como restricciones del timeline
6. Provea el risk mitigation investment vs. exposure analysis
```

**Usage guide:**
- Fundamental for regulated sectors (banking, health, government) where risks have a legal dimension
- Kill criteria must be reviewed with the client's legal/compliance area before inclusion
- Update risk management at each Phase Gate with materialized risks and newly identified ones

---

## Metaprompt 4: Team Topology Generator for Specific Transformation

**Purpose:** Create prompts that design the optimal team structure for the transformation, applying Team Topologies and Inverse Conway's Law principles to the specific client context.

**Template:**
```
Eres un consultor de organización de equipos de Comunidad MetodologIA especializado en Team Topologies.
Necesito generar el diseño del equipo de transformación para el skill `solution-roadmap`.

ARQUITECTURA OBJETIVO (TO-BE):
- Servicios/dominios a construir: [LISTA_SERVICIOS_DOMINIOS]
- Plataformas compartidas: [PLATAFORMAS] (ejemplo: API Gateway, Event Platform, Data Platform)
- Complejidad técnica especial: [SUBSISTEMAS_COMPLEJOS]

EQUIPO ACTUAL DEL CLIENTE:
- Composición actual: [INVENTARIO_EQUIPO] (roles, cantidad, seniority, localización)
- Skills disponibles: [SKILLS_DISPONIBLES]
- Skills faltantes: [SKILLS_FALTANTES]
- Cultura de trabajo: [REMOTO / HÍBRIDO / PRESENCIAL]

RESTRICCIONES:
- Política de contratación: [RESTRICCIONES_CONTRATACIÓN]
- Budget de nómina para roles nuevos: [RANGO]
- Relación interna/externa: [%_INTERNOS vs %_EXTERNOS]
- Timeline de ramp-up: [MESES]

Genera el prompt para diseñar el team roadmap que:
1. Aplique Team Topologies: identifique qué equipos serán stream-aligned, enabling, platform y complicated subsystem
2. Use la Ley de Conway Inversa para alinear la estructura del equipo con la arquitectura objetivo desde Phase 1
3. Construya el headcount mes a mes con la secuencia correcta de incorporación (enablers antes que builders)
4. Analice el skill gap con score cuantitativo (skills actuales vs. requeridos, gap por rol)
5. Diseñe la secuencia de introducción tecnológica para evitar overwhelm en la curva de aprendizaje
6. Defina knowledge transfer milestones concretos para reducir el riesgo de key person dependency
```

**Usage guide:**
- Execute after having the TO-BE architecture defined (team structure follows architecture)
- The resulting skill gap analysis feeds the training plan and hiring decisions
- Review with the client's HR to validate internal policy constraints before publishing the ramp-up

---

## Metaprompt 5: Governance Framework Generator by Organizational Maturity

**Purpose:** Create prompts that generate governance frameworks calibrated to the client's organizational maturity: from minimum viable governance for startups and SMEs to full enterprise governance for corporates and regulated entities.

**Template:**
```
Eres un governance architect de Comunidad MetodologIA especializado en diseño de marcos de gobernanza para programas de transformación.
Necesito generar el governance framework para el skill `solution-roadmap` calibrado a la madurez del cliente.

PERFIL DEL CLIENTE:
- Tipo de organización: [Startup / Pyme / Enterprise / Corporativo Regulado / Gobierno]
- Tamaño del programa: [RANGO_PRESUPUESTO]
- Madurez en gestión de proyectos: [Baja (sin PMO) / Media (PM informal) / Alta (PMO establecido)]
- Experiencia con transformaciones tecnológicas: [Primera transformación / 2-3 previas / Programa maduro]
- Tolerancia a burocracia: [Baja (agilidad máxima) / Media (balanceada) / Alta (proceso riguroso)]

RESTRICCIONES DE GOBERNANZA:
- Partes interesadas principales: [LISTA_STAKEHOLDERS]
- Frecuencia de reporte disponible para ejecutivos: [DISPONIBILIDAD]
- Herramientas de gestión actuales: [JIRA / Azure DevOps / Monday / Smartsheet / ninguna]
- Requisitos de auditoría externa: [LISTA_AUDITORÍAS]

Genera el prompt para crear un governance plan que:
1. Escale la formalidad al nivel de madurez real (no imponer PMO completo a una organización sin experiencia)
2. Defina el steering committee con la composición mínima necesaria para la toma de decisiones efectiva
3. Diseñe el change control en el nivel de complejidad apropiado (3 niveles para enterprise, 2 para pymes)
4. Establezca el reporting dashboard con las métricas que ESTE cliente puede realmente monitorear
5. Defina los phase gates con el nivel de rigor apropiado (documentación ligera para programas ágiles, exhaustiva para regulados)
6. Incorpore las herramientas de gestión existentes del cliente en lugar de proponer herramientas nuevas adicionales
```

**Usage guide:**
- The most common error in program governance is designing for the ideal program, not the real client
- Prioritize agility in low-maturity organizations: minimum governance that works over complete governance nobody follows
- Review the governance framework with the executive sponsor before publishing — if the sponsor doesn't understand it, it's too complex

---

*© Comunidad MetodologIA — Author: Javier Montaño — Updated: March 13, 2026*
