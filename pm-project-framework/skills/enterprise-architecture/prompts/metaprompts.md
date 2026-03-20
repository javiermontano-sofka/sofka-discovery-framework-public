---
skill: enterprise-architecture
title: Metaprompts — Enterprise Architecture
version: 1.0.0
author: Javier Montaño
copyright: © Comunidad MetodologIA
---

# Metaprompts: Enterprise Architecture

Meta-prompts para generar prompts personalizados para el skill `enterprise-architecture`. Cada metaprompt tiene un proposito especifico, una plantilla con placeholders, y una guia de uso.

---

## Metaprompt 1: Generador de Prompts para Capability Mapping y Madurez

**Proposito:** Generar un prompt completo para mapear capacidades de negocio y evaluar madurez, calibrado al tipo de organizacion, industria, y nivel de informacion disponible.

**Plantilla:**

```
Genera un prompt para el skill enterprise-architecture que produzca un capability map con evaluacion de madurez para:

ORGANIZACION: {{NOMBRE_ORGANIZACION}}

TIPO DE ORGANIZACION: {{TIPO}}
Opciones: startup-en-crecimiento | scale-up | enterprise-tradicional | empresa-regulada | organizacion-publica | conglomerado-multi-unidad

INDUSTRIA: {{INDUSTRIA}}
Ejemplo: "Banca (regulacion SFC, PCI-DSS)", "Retail (omnichannel)", "Salud (HIPAA)", "Telecomunicaciones", "Gobierno", "Fintech"

ALCANCE: {{ALCANCE}}
Opciones: organizacion-completa | unidad-de-negocio:{{NOMBRE}} | linea-de-producto:{{NOMBRE}} | dominio-especifico:{{NOMBRE}}

INFORMACION DISPONIBLE: {{FUENTES}}
Opciones:
- documentacion-estrategica (plan estrategico, OKRs, KPIs)
- entrevistas-stakeholders (acceso a lideres de negocio y tecnologia)
- repositorios-codigo (acceso a codebase para inferir capacidades)
- inventario-aplicaciones (CMDB, catalogo de aplicaciones)
- ninguna (capability mapping desde cero por inferencia de industria)

NIVEL DE GRANULARIDAD: {{GRANULARIDAD}}
Opciones: level-1-solo (estrategico, 8-15 capacidades) | level-1-y-2 (gestion, 30-60 capacidades) | level-1-2-3 (operacional, 80-150 capacidades)

FOCO ESPECIFICO: {{FOCO}}
Opciones: identificar-gaps-inversion | detectar-redundancias | evaluar-preparacion-transformacion | benchmarking-industria | todos

El prompt generado debe incluir: instruccion al skill, criterios de madurez adaptados a la industria, mecanismo de validacion de completitud del mapa, y formato de output diferenciado para audiencia tecnica vs. ejecutiva.
```

**Guia de uso:**
1. `TIPO_ORGANIZACION` calibra la complejidad esperada del capability map: una startup tendra 20-30 capacidades; un conglomerado puede tener 150+. El prompt generado ajusta la granularidad y el formato
2. `INFORMACION_DISPONIBLE = ninguna` genera un capability map basado en frameworks de referencia de la industria (eTOM para telcos, BIAN para banca, APQC para general) como punto de partida para validar con stakeholders
3. `FOCO = identificar-gaps-inversion` genera un prompt que prioriza el analisis de brechas entre madurez actual y target, con cuantificacion de esfuerzo de cierre
4. Para organizaciones reguladas, el prompt generado incluye capacidades obligatorias de compliance como capacidades de primer nivel

---

## Metaprompt 2: Generador de Prompts para Technology Radar

**Proposito:** Generar un prompt para construir o actualizar el Technology Radar de una organizacion, adaptado a su madurez tecnologica, diversidad de stacks, y cultura de adopcion.

**Plantilla:**

```
Genera un prompt para el skill enterprise-architecture que produzca un Technology Radar para:

ORGANIZACION: {{NOMBRE_ORGANIZACION}}

MADUREZ TECNOLOGICA: {{MADUREZ}}
Opciones: temprana (pocas tecnologias, sin governance) | intermedia (stacks definidos, governance informal) | avanzada (radar existente, governance formal, proceso de adopcion)

DIVERSIDAD DE STACKS: {{DIVERSIDAD}}
Opciones: homogeneo (1-2 stacks) | moderado (3-5 stacks) | heterogeneo (>5 stacks, poliglota)

NUMERO DE EQUIPOS: {{N_EQUIPOS}}
Para calibrar la granularidad del radar y el proceso de governance

TRIGGER DEL RADAR: {{TRIGGER}}
Opciones:
- primer-radar (no existe, se crea desde cero)
- actualizacion-periodica (radar existente, ciclo de revision)
- post-evaluacion-tecnologica (se evaluo nueva tecnologia, se necesita posicionar)
- post-incidente (tecnologia causo incidente, se necesita reclasificar)
- pre-transformacion (radar actualizado antes de iniciativa grande)

DIMENSIONES PRIORITARIAS: {{DIMENSIONES}}
Seleccionar: platforms | languages-frameworks | data-analytics | architectural-patterns | tools-practices | security-compliance | todas

CULTURA DE ADOPCION: {{CULTURA}}
Opciones: conservadora (adopt solo tecnologias probadas 3+ anios) | equilibrada (trial con justificacion, assess con sponsor) | innovadora (assess agresivo, trial rapido, tolera fallo)

El prompt generado debe incluir: criterios de clasificacion Adopt/Trial/Assess/Hold calibrados a la cultura, proceso de governance del radar, template de propuesta para nuevas entradas, y metricas de efectividad del radar.
```

**Guia de uso:**
1. `TRIGGER` es el parametro mas determinante: `primer-radar` genera un prompt que incluye un workshop de descubrimiento tecnologico; `actualizacion-periodica` genera un prompt de revision delta
2. `CULTURA_DE_ADOPCION` ajusta los criterios de Adopt/Trial/Assess: una cultura conservadora requiere mas evidencia para mover a Adopt; una innovadora acepta Trial con menos validacion
3. `DIVERSIDAD = heterogeneo` genera un prompt que incluye analisis de costo de diversidad (operational burden, hiring, conocimiento fragmentado) y recomendaciones de consolidacion
4. Para `MADUREZ = temprana`, el prompt generado es mas prescriptivo y sugiere un radar inicial basado en best practices de la industria como punto de partida

---

## Metaprompt 3: Generador de Prompts para Initiative Portfolio y Priorizacion

**Proposito:** Generar un prompt para construir o repriorizar el portafolio de iniciativas estrategicas, calibrado al tamano del portafolio, restricciones presupuestales, y modelo de governance.

**Plantilla:**

```
Genera un prompt para el skill enterprise-architecture que produzca un Initiative Portfolio priorizado para:

ORGANIZACION: {{NOMBRE_ORGANIZACION}}

ESTADO DEL PORTAFOLIO: {{ESTADO}}
Opciones: no-existe (construir desde cero) | existe-no-priorizado (listado sin scoring) | existe-desactualizado (scoring anterior, contexto cambio) | existe-sobredimensionado (>30 iniciativas, necesita racionalizar)

FUENTE DE INICIATIVAS: {{FUENTE}}
Opciones:
- capability-gaps (derivadas del capability map)
- estrategia-negocio (OKRs, plan estrategico)
- deuda-tecnica (remediacion de problemas tecnicos)
- regulatorias (compliance mandatorio)
- mixta (multiples fuentes)

RESTRICCIONES DE CAPACIDAD: {{CAPACIDAD}}
Ejemplo: "15 equipos de desarrollo, 80% dedicados a operacion, 20% disponible para transformacion"
Ejemplo: "Presupuesto de transformacion: X FTE-meses anuales"

MODELO DE PRIORIZACION: {{MODELO}}
Opciones: valor-vs-esfuerzo (2x2 simple) | scoring-multidimensional (valor + riesgo + alineamiento + urgencia) | ice-score (impact-confidence-ease) | weighted-shortest-job-first (SAFe WSJF) | organizacion-define (el skill recomienda)

HORIZONTE DE PLANIFICACION: {{HORIZONTE}}
Opciones: trimestral | semestral | anual | multi-anual (2-3 anios)

BALANCE DESEADO: {{BALANCE}}
Opciones:
- transformacional-pesado (70% estrategico, 20% operacional, 10% deuda)
- equilibrado (50% estrategico, 30% operacional, 20% deuda)
- estabilizacion (30% estrategico, 30% operacional, 40% deuda)
- organizacion-define

El prompt generado debe incluir: modelo de scoring con pesos, analisis de capacidad vs. demanda, identificacion de dependencias criticas entre iniciativas, y recomendacion de portafolio maximo viable.
```

**Guia de uso:**
1. `ESTADO = existe-sobredimensionado` genera un prompt que comienza con racionalizacion: agrupar iniciativas similares, eliminar las de bajo valor, y reducir a <20 iniciativas enfocadas
2. `MODELO = organizacion-define` genera un prompt donde el skill evalua las caracteristicas del portafolio y recomienda el modelo de priorizacion mas adecuado antes de aplicarlo
3. `BALANCE` es critico: si la organizacion tiene mucha deuda tecnica pero elige `transformacional-pesado`, el prompt generado incluira una advertencia de riesgo y sugerira ajustar
4. El prompt siempre incluye analisis de capacidad vs. demanda: si el portafolio priorizado excede la capacidad disponible, se fuerza una segunda ronda de priorizacion

---

## Metaprompt 4: Generador de Prompts para Target Operating Model

**Proposito:** Generar un prompt para disenar el modelo operativo objetivo de la organizacion tecnologica, incluyendo team topologies, decision rights, metricas, y modelo de funding.

**Plantilla:**

```
Genera un prompt para el skill enterprise-architecture que produzca un Target Operating Model para:

ORGANIZACION: {{NOMBRE_ORGANIZACION}}

MODELO ACTUAL: {{MODELO_ACTUAL}}
Opciones: funcional-silos (equipos por tecnologia) | proyecto-temporal (equipos se arman por proyecto) | producto-incipiente (equipos de producto pero sin autonomia real) | producto-maduro (equipos autonomos end-to-end) | plataforma-emergente (se esta construyendo platform team)

TAMANO DE INGENIERIA: {{TAMANO}}
Opciones: pequeno (<20 ingenieros) | mediano (20-80) | grande (80-200) | enterprise (>200)

OBJETIVOS DEL CAMBIO: {{OBJETIVOS}}
Seleccionar los prioritarios:
- [ ] Reducir lead time de entrega (actualmente {{LEAD_TIME_ACTUAL}})
- [ ] Aumentar frecuencia de deployment (actualmente {{FREQ_ACTUAL}})
- [ ] Reducir change failure rate (actualmente {{CFR_ACTUAL}})
- [ ] Mejorar MTTR (actualmente {{MTTR_ACTUAL}})
- [ ] Alinear equipos con dominios de negocio (Conway's Law)
- [ ] Establecer platform team para reducir carga cognitiva
- [ ] Implementar governance sin burocracia

RESTRICCIONES ORGANIZACIONALES: {{RESTRICCIONES}}
Ejemplo: "No se puede reorganizar completamente (cambio incremental)", "Sindicato limita restructuracion", "Contractualmente equipos externos no se pueden reorganizar"

CULTURA OBJETIVO: {{CULTURA}}
Opciones: ingenieria-autonoma (equipos deciden, governance ligero) | alineada-con-guardrails (autonomia con estandares) | centralizada-con-delegacion (decisiones centrales, ejecucion local)

El prompt generado debe incluir: team topologies recomendado, modelo de funding (proyecto vs. producto), decision rights (RACI para decisiones arquitectonicas), metricas DORA con targets, y plan de transicion del modelo actual al objetivo.
```

**Guia de uso:**
1. `MODELO_ACTUAL` determina el punto de partida y la magnitud del cambio: de `funcional-silos` a `producto-maduro` es una transformacion de 12-24 meses; de `producto-incipiente` a `producto-maduro` puede ser 6-12 meses
2. `OBJETIVOS_DEL_CAMBIO` con metricas actuales permite que el prompt genere targets realistas (mejoras de 2-3x son ambiciosas pero posibles; mejoras de 10x son irrealistas en 12 meses)
3. `RESTRICCIONES_ORGANIZACIONALES` es el parametro mas importante para evitar planes inaplicables: sin restricciones el plan puede ser tecnicamenete perfecto pero organizacionalmente imposible
4. Para `TAMANO = enterprise`, el prompt generado incluye la capa de "domains of domains" y la gobernanza multi-nivel necesaria para coordinar >200 ingenieros

---

## Metaprompt 5: Generador de Prompts para Enterprise Architecture Post-M&A

**Proposito:** Generar un prompt especializado para el analisis y plan de integracion de arquitectura enterprise en contextos de fusion, adquisicion, o absorcion de unidades de negocio.

**Plantilla:**

```
Genera un prompt para el skill enterprise-architecture que produzca el plan de integracion arquitectonica post-M&A para:

ORGANIZACION ADQUIRENTE: {{ORG_ADQUIRENTE}}
ORGANIZACION ADQUIRIDA / FUSIONADA: {{ORG_ADQUIRIDA}}

TIPO DE OPERACION: {{TIPO}}
Opciones: adquisicion-absorcion (la adquirida se integra) | fusion-iguales (se crea nueva estructura) | adquisicion-autonoma (la adquirida opera independiente con sinergias puntuales)

INFORMACION DISPONIBLE: {{INFO}}
Opciones:
- due-diligence-completo (inventarios, capability maps, stacks documentados de ambas)
- due-diligence-parcial (inventario de la adquirida incompleto, inferir gaps)
- post-cierre-sin-due-diligence-tecnico (se cerro sin analisis tecnico, ahora hay que mapear)

SINERGIAS BUSCADAS: {{SINERGIAS}}
Ejemplo: "Unificar plataforma de pagos", "Consolidar infraestructura cloud", "Compartir capability de identidad", "Racionalizar portafolio de aplicaciones"

TIMELINE DE INTEGRACION: {{TIMELINE}}
Opciones: agresivo (6 meses) | normal (12 meses) | gradual (18-24 meses)

RIESGOS CONOCIDOS: {{RIESGOS}}
Ejemplo: "Stacks tecnologicos incompatibles", "Culturas de ingenieria muy distintas", "Regulaciones diferentes por geografia", "Contratos de licencia no transferibles"

El prompt generado debe incluir: analisis comparativo de capability maps, identificacion de sinergias y conflictos, estrategia de integracion por dominio (merge, adopt-one, coexist), roadmap de integracion por fases, y plan de mitigacion de riesgos de la transicion.
```

**Guia de uso:**
1. `TIPO_OPERACION` cambia drasticamente el output: `adquisicion-absorcion` prioriza adoptar la arquitectura del adquirente; `fusion-iguales` requiere evaluar best-of-both; `adquisicion-autonoma` se enfoca en puntos de integracion minimos
2. `INFO = post-cierre-sin-due-diligence-tecnico` es el escenario mas comun y mas riesgoso: el prompt generado incluye una fase de discovery tecnico acelerado antes de disenar la integracion
3. El prompt siempre genera tres estrategias por dominio/capacidad: merge (unificar), adopt-one (elegir el mejor), coexist (mantener ambos con integracion) — con criterios para elegir entre las tres
4. `TIMELINE = agresivo` genera alertas de riesgo explicitas: integraciones aceleradas tienen alta tasa de fallo. El prompt incluira prioridades de "que integrar primero" basadas en sinergias de mayor impacto

---
**Autor:** Javier Montano | **© Comunidad MetodologIA** | **Version:** 1.0.0 | **Fecha:** 13 de marzo de 2026
