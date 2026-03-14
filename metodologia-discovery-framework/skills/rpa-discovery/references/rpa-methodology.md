# RPA Methodology — Open Standards Reference

> Licensed under GPL-3.0. Based on public standards and open frameworks.

## Foundations

La metodologia de RPA de este framework se fundamenta en la interseccion de cuatro marcos de trabajo publicos y complementarios:

### Six Sigma + Lean

- **DMAIC** (Define, Measure, Analyze, Improve, Control) como framework de mejora de procesos previo a la automatizacion
- **Value Stream Mapping** para identificar waste en procesos antes de automatizar
- **Principio clave:** No automatizar procesos con waste — primero eliminar, luego automatizar
- **Referencia:** ISO 13053:2011 (Six Sigma methodology)

### PDCA (Plan-Do-Check-Act)

- Ciclo de mejora continua aplicado a la gestion del programa de automatizacion (ISO 9001, Deming Cycle)
- **Plan:** Identificar y priorizar procesos candidatos
- **Do:** Implementar bots en ambientes controlados
- **Check:** Medir resultados vs proyecciones
- **Act:** Ajustar, escalar o retirar bots segun resultados

### BPMN 2.0 (Business Process Model and Notation)

- Notacion estandar ISO/IEC 19510:2013 para documentar procesos antes de automatizar
- Niveles de documentacion: descriptivo (L1), analitico (L2), ejecutable (L3)
- Todo proceso automatizado debe tener BPMN L2 como minimo

### IEEE Task Force on Process Mining

- Process Mining Manifesto (2012) como referencia para analisis basado en event logs
- Tres tipos de process mining: discovery, conformance, enhancement
- Herramientas open-source: ProM Framework, PM4Py, Apromore

## Platforms Overview

### UiPath
- **Fortalezas:** Ecosistema maduro, marketplace extenso, AI Center integrado, community edition gratuita
- **Modelo:** Studio (desarrollo), Orchestrator (gestion), Robots (ejecucion)
- **Best for:** Enterprise-scale automation, AI-augmented RPA

### Automation Anywhere (AA)
- **Fortalezas:** Cloud-native, IQ Bot (cognitive), Bot Insight (analytics)
- **Modelo:** A360 platform, cloud-first architecture
- **Best for:** Cloud-centric organizations, cognitive automation

### Power Automate (Microsoft)
- **Fortalezas:** Integracion nativa con ecosistema Microsoft, bajo costo de entrada, citizen developer friendly
- **Modelo:** Cloud flows + Desktop flows, Dataverse integration
- **Best for:** Organizaciones Microsoft-centric, automatizacion departamental

### Blue Prism
- **Fortalezas:** Governance-first, enterprise-grade security, regulatory compliance
- **Modelo:** Digital workforce, control room centralized
- **Best for:** Entornos altamente regulados (banca, seguros, gobierno)

### Open-Source Alternatives
- **Robot Framework:** Framework open-source de automatizacion de tests y RPA (Apache 2.0)
- **TagUI:** Herramienta open-source de RPA (Apache 2.0), soporta visual automation
- **Apache Airflow:** Orquestacion de workflows (no RPA puro, pero complementario para orquestacion)
- **n8n:** Workflow automation open-source, integraciones extensas

## Scoring Model

### Automation Opportunity Score (AOS)

| Criterio | Peso | Escala |
|---|---|---|
| Datos estructurados | 20% | 0-3 |
| Reglas estables | 20% | 0-3 |
| Alto volumen | 20% | 0-3 |
| Repetitividad | 20% | 0-3 |
| Propension a error | 20% | 0-3 |

**Total maximo:** 15 puntos
**Threshold de automatizacion:** >= 8 puntos

### Complexity Classification

| Nivel | Pasos | Aplicaciones | Decisiones | Esfuerzo estimado |
|---|---|---|---|---|
| Simple | 1-5 | 1 | 0-1 | 2-4 semanas |
| Medio | 5-15 | 2-3 | 2-5 | 4-8 semanas |
| Complejo | >15 | >3 | >5 | 8-16 semanas |

## CoE Evolution Model (Generic)

### Level 1 — Centralized (0-6 meses)
- Equipo central de 3-5 personas
- Gobernanza basica (naming conventions, deployment process)
- Primeros 5-10 bots en produccion
- Metricas: bots activos, transacciones procesadas, tasa de exito

### Level 2 — Federated (6-18 meses)
- Citizen developers en unidades de negocio
- Governance framework maduro (review board, change management)
- 20-50 bots en produccion
- Metricas: ROI por proceso, automation coverage, citizen developer adoption

### Level 3 — Autonomous (18+ meses)
- Automation-first culture
- AI-augmented automation (intelligent document processing, process mining continuo)
- >50 bots, hyperautomation iniciativas
- Metricas: automation index (% procesos automatizados), innovation pipeline

---
**Comunidad MetodologIA** | **Licencia:** GPL-3.0 | Basado en estandares publicos (ISO, IEEE, BPMN)
