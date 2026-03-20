---
skill: solution-roadmap
title: "Body of Knowledge — Solution Roadmap"
author: Javier Montaño
copyright: "© Comunidad MetodologIA"
updated: 2026-03-13
---

# Body of Knowledge: Solution Roadmap

> Fundamento teórico y corpus de conocimiento para la construcción de roadmaps de transformación tecnológica con horizonte de inversión, gestión de riesgos y gobernanza.

---

## 1. Fundamentos Conceptuales

### 1.1 ¿Qué es un Solution Roadmap?

Un Solution Roadmap es el blueprint completo de transformación tecnológica que traduce el escenario aprobado (qué se construirá) en un plan ejecutable con fases, gates, inversión, equipo y gobernanza. A diferencia de un cronograma de proyecto, el roadmap:

- Define **por qué** cada fase existe y qué valor independiente entrega
- Establece **condiciones de parada** explícitas (kill criteria), no solo fechas
- Incorpora **rangos probabilísticos** en lugar de estimaciones puntuales
- Vincula cada estimación a **supuestos validables** mediante PoC
- Prevé **puntos de pivote** cuando la realidad invalida los supuestos

### 1.2 Diferencia entre Roadmap y Cronograma

| Dimensión | Cronograma | Roadmap |
|-----------|-----------|---------|
| Propósito | Seguimiento de tareas | Toma de decisiones |
| Horizonte | Proyecto (meses) | Transformación (1-3 años) |
| Estimaciones | Puntuales | Rangos P50/P80/P95 |
| Cambio | Gestionado | Previsto y pivoteado |
| Kill criteria | Ausentes | Explícitos por fase |
| Valor intermedio | No garantizado | Cada fase es valiosa sola |

---

## 2. Gestión del Alcance y Fases de Transformación

### 2.1 El Modelo de 5 Fases

Basado en los principios de incremental value delivery del Scaled Agile Framework (SAFe) y los marcos de programa del PMI, la estructura de 5 fases garantiza que cada etapa entregue valor independiente:

| Fase | Nombre | Propósito Principal |
|------|--------|---------------------|
| 1 | Foundation | Validar supuestos críticos mediante PoC; infraestructura base |
| 2 | Build | Construir servicios core en producción |
| 3 | Integrate | Cutover completo, decommission del legado |
| 4 | Optimize | Alcanzar targets de costo y performance |
| 5 | Scale | Multi-región, innovación, velocidad sostenida |

### 2.2 Phase Gates y Kill Criteria

Los Phase Gates son puntos de decisión explícitos donde se evalúa si continuar, pausar, pivotar o detener la transformación. Esta práctica proviene de Stage-Gate Process de Robert G. Cooper (1990), adaptado a transformaciones tecnológicas.

**Kill criteria (paradas duras):**
- Fallo de PoC que invalida >2 supuestos críticos sin alternativa viable
- Pérdida de patrocinador ejecutivo sin reemplazo en 30 días
- Superación de presupuesto >30% sin aprobación de change request
- Fallo de seguridad o compliance en Phase Gate

---

## 3. Estimación y Gestión de la Incertidumbre

### 3.1 Cone of Uncertainty

El Cone of Uncertainty, introducido por Barry Boehm (1981) y popularizado por Steve McConnell (_Software Estimation_, 2006), describe cómo la incertidumbre de las estimaciones disminuye progresivamente a medida que avanza el proyecto:

| Momento | Varianza típica |
|---------|----------------|
| Concepto inicial | ±300% |
| Scoping completado | ±25% |
| PoC validado | ±15% |
| Build completado | ±10% |

En MetodologIA, los rangos declarados son: costo ±25%, timeline ±15%, team sizing ±20% — siempre vinculados al momento del roadmap.

### 3.2 Estimación por Rangos (P50/P80/P95)

Derivado del análisis probabilístico de riesgo y del framework de estimación del PMBOK Guide (PMI, 7th ed., 2021):

- **P50 (mediana)**: 50% de probabilidad de completar en este plazo/costo. Es el escenario "likely".
- **P80**: 80% de probabilidad. Escenario conservador recomendable para compromisos con cliente.
- **P95**: 95% de probabilidad. Reserva máxima; solo para contratos de precio fijo.

### 3.3 Monte Carlo Simulation

Técnica cuantitativa de análisis de riesgo que ejecuta miles de iteraciones del modelo de estimación con variables aleatorias distribuidas según probabilidades históricas (David Vose, _Risk Analysis_, 2008). Produce una distribución de probabilidad de fechas/costos en lugar de un valor puntual.

**Aplicación en roadmaps**: cada milestone tiene intervalos de confianza derivados de Monte Carlo, lo que permite al steering committee tomar decisiones informadas sobre buffers y contingencias.

### 3.4 Estimation Pivot Points

Supuestos críticos que, si son invalidados por el PoC, requieren revisar las estimaciones del roadmap. Cada pivot point tiene:
- Impacto cuantificado en semanas y presupuesto
- Criterio de validación específico y medible
- Opciones de pivote si falla
- Timing de decisión (antes de qué gate)

---

## 4. Gestión de Inversión y ROI

### 4.1 Total Cost of Ownership (TCO)

El TCO a 3 años incluye todas las categorías de costo relevantes para la transformación:

| Categoría | Componentes Típicos |
|-----------|---------------------|
| Labor | FTE internos + contratistas + partners |
| Infraestructura | Cloud compute, storage, networking, licencias |
| Licencias de software | Plataformas SaaS, herramientas, seguridad |
| Entrenamiento | Bootcamps, certificaciones, coaching |
| Contingencia | 10-20% del total (ajustada por riesgo) |

### 4.2 Phased Funding Model

En transformaciones complejas, el financiamiento liberado por fases reduce el riesgo para el cliente y crea incentivos de calidad por entrega. Estructura típica:
- **Phase 1 gate**: liberar ~35% del TCO proyectado
- **Phase 2 gate**: liberar ~50%
- **Phase 3 gate**: liberar ~15% restante

### 4.3 ROI y Break-Even

El modelo de ROI considera: ahorros operativos post-transformación (menos incidentes, menor tiempo de despliegue, reducción de infraestructura legada), ingresos incrementales habilitados, y el costo de oportunidad del time-to-market acelerado. El break-even típico en modernizaciones enterprise oscila entre 18 y 36 meses post-lanzamiento.

---

## 5. Team Topologies y Ramp-Up

### 5.1 Team Topologies (Skelton & Pais, 2019)

Matthew Skelton y Manuel Pais proponen cuatro tipos de equipos y tres modos de interacción que optimizan el flujo de valor:

| Tipo de Equipo | Propósito |
|----------------|-----------|
| Stream-aligned | Entrega de valor de negocio (un equipo por dominio/flujo) |
| Enabling | Ayuda a stream-aligned a adoptar nuevas capacidades |
| Complicated Subsystem | Maneja subsistemas de alta complejidad cognitiva |
| Platform | Provee servicios reutilizables internos |

**Ley de Conway Inversa**: alinear la estructura del equipo con la arquitectura objetivo antes de construir acelera la convergencia hacia esa arquitectura.

### 5.2 Ramp-Up Curve y Skill Gap Analysis

El ramp-up no es lineal: los primeros meses tienen menor velocidad por curva de aprendizaje, setup de ambiente y alineación cultural. Un plan de ramp-up realista incluye:
- Inventario de skills actuales vs. skills requeridos
- Secuencia de introducción tecnológica (no todo en semana 1)
- Hitos de knowledge transfer (quién sabe qué y cuándo)
- Mentoring y pair programming como mecanismos de transferencia

---

## 6. Gestión de Riesgos en Transformaciones

### 6.1 Risk Taxonomy para Transformaciones Tecnológicas

| Categoría | Ejemplos |
|-----------|----------|
| Riesgos técnicos | Complejidad no anticipada, deuda técnica oculta, performance |
| Riesgos de equipo | Rotación de personas clave, skill gaps, resistencia al cambio |
| Riesgos de negocio | Cambios de prioridad ejecutiva, fusiones/adquisiciones |
| Riesgos de terceros | Vendors, reguladores, dependencias externas |
| Riesgos de estimación | Supuestos inválidos, scope creep, cambios en requisitos |

### 6.2 Cascade Failure Analysis

En transformaciones con múltiples dependencias, un riesgo materializado puede encadenar fallos secundarios. El análisis de cadenas de fallo documenta: trigger → impacto directo → impactos secundarios → impactos terciarios → early warning indicators para detección temprana.

### 6.3 Early Warning System

Inspirado en el framework de gestión de señales débiles de Nassim Taleb (_Antifragile_, 2012), el sistema de alertas tempranas define métricas con umbrales que señalan degradación antes de que sea crisis:

| Semáforo | Condición | Acción |
|----------|-----------|--------|
| Verde | Dentro de rangos | Continuar |
| Amarillo | Desviación ±15% | Alertar, monitorear |
| Rojo | Desviación >25% | Escalar, replanning |

---

## 7. Gobernanza de Transformaciones

### 7.1 Estructura de Gobernanza

Una transformación enterprise requiere múltiples niveles de decisión con autoridades claras:

| Órgano | Frecuencia | Autoridad |
|--------|------------|-----------|
| Steering Committee | Mensual | Aprobar cambios de scope/budget >5% |
| Technical Architecture Forum | Bi-semanal | Decisiones de arquitectura y ADRs |
| Phase Gate Review Board | Por hito | Go/No-Go por fase |
| Risk Management Committee | Mensual | Monitoreo y respuesta a riesgos |

### 7.2 Change Control en 3 Niveles

| Nivel | Criterio | Proceso | Autoridad |
|-------|----------|---------|-----------|
| Menor | <2 semanas, <5% presupuesto | PM aprueba | PM |
| Significativo | 2-4 semanas, 5-15% presupuesto | Architecture Forum revisa | Patrocinador |
| Mayor | >4 semanas, >15% presupuesto | Steering Committee aprueba | Board |

### 7.3 Marcos de Referencia

| Marco | Fuente | Aplicación |
|-------|--------|------------|
| Stage-Gate Process | Robert G. Cooper (1990) | Phase gates y kill criteria |
| PMBOK Guide (7th ed.) | PMI (2021) | Estimación, gestión de riesgos |
| SAFe Program Increment | Scaled Agile, Inc. | Planificación por PI y PI Objectives |
| Cone of Uncertainty | Barry Boehm (1981) | Rangos de estimación por etapa |
| Team Topologies | Skelton & Pais (2019) | Diseño de equipos y Conway Inverso |
| Software Estimation | Steve McConnell (2006) | Técnicas de calibración de estimaciones |
| Risk Analysis | David Vose (2008) | Monte Carlo y análisis cuantitativo |

---

## 8. Cross-References con Otros Skills del Framework

| Skill | Relación con Solution Roadmap |
|-------|-----------------------------|
| `scenario-analysis` | El escenario aprobado es el input requerido del roadmap |
| `architecture-tobe` | El TO-BE arquitectónico alimenta la estructura de fases |
| `technical-feasibility` | Los pivot points del PoC validan los supuestos del roadmap |
| `stakeholder-mapping` | Los stakeholders del roadmap determinan la estructura de gobernanza |
| `change-readiness-assessment` | El nivel de preparación determina la velocidad de ramp-up |
| `functional-spec` | Las especificaciones funcionales definen los deliverables de Build phase |
| `pitch-ejecutivo` | El investment horizon y ROI del roadmap alimentan el pitch |

---

*© Comunidad MetodologIA — Autor: Javier Montaño — Actualizado: 13 de marzo de 2026*
