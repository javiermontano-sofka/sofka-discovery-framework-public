---
skill: enterprise-architecture
title: Use-Case Prompts — Enterprise Architecture
version: 1.0.0
author: Javier Montaño
copyright: © Comunidad MetodologIA
---

# Use-Case Prompts: Enterprise Architecture

Prompts listos para usar directamente con el skill `enterprise-architecture`. Cada prompt tiene contexto de activacion, texto del prompt, y formato de output esperado.

---

## Prompt 1: Mapa de Capacidades y Evaluacion de Madurez

**Contexto:** Se necesita construir el mapa de capacidades de negocio de una organizacion para identificar brechas de inversion, redundancias entre sistemas, y prioridades de mejora.

**Prompt:**
```
/mao:asis [NOMBRE_ORGANIZACION]

Construye el mapa de capacidades de negocio para [NOMBRE_ORGANIZACION].

Alcance: [UNIDADES_DE_NEGOCIO_EN_ALCANCE]
Fuentes de informacion: [DOCUMENTOS_ESTRATEGICOS / ENTREVISTAS / REPOS]

Entrega:
1. Capability Map jerarquico (Level 1 estrategico, Level 2 gestion, Level 3 operacional)
2. Evaluacion de madurez actual (1-5) por capacidad Level 2, con evidencia por cada calificacion
3. Madurez objetivo por capacidad, con justificacion de negocio para cada target
4. Heat map de gaps (madurez actual vs. objetivo) con indicacion de esfuerzo estimado para cerrar
5. Identificacion de capacidades soportadas por multiples sistemas redundantes
6. Top-10 capacidades con mayor brecha que requieren inversion prioritaria

Para cada capacidad Level 2: ownership (unidad de negocio), sistemas que la soportan, datos clave involucrados, y dependencias con otras capacidades.

{MODO}=piloto-auto {FORMATO}=markdown {MODO_OPERACIONAL}=capacidades
```

**Output esperado:** Diagrama Mermaid jerarquico del capability map, tabla de madurez con heat map, lista de redundancias, top-10 gaps priorizados por impacto de negocio.

---

## Prompt 2: Alineacion TOGAF — Architecture Vision y Principios

**Contexto:** La organizacion necesita establecer o formalizar su vision de arquitectura enterprise siguiendo el framework TOGAF, definiendo principios, governance, y la relacion entre arquitectura de negocio, datos, aplicaciones e infraestructura.

**Prompt:**
```
/mao:asis [NOMBRE_ORGANIZACION]

Define la Architecture Vision TOGAF para [NOMBRE_ORGANIZACION].

Contexto organizacional:
- Industria: [INDUSTRIA]
- Estrategia de negocio declarada: [RESUMEN_ESTRATEGIA]
- Madurez arquitectonica actual: [BAJA / MEDIA / ALTA]
- Regulaciones aplicables: [REGULACIONES]

Entrega:
1. Architecture Vision Statement alineada con la estrategia de negocio
2. Principios arquitectonicos (8-12) con nombre, declaracion, racional, e implicaciones
3. Mapeo de dominios TOGAF: Business Architecture, Data Architecture, Application Architecture, Technology Architecture
4. Stakeholder Map especifico para la iniciativa de arquitectura enterprise (quienes deben participar, quienes aprueban, quienes se impactan)
5. Governance framework inicial: quien decide que, con que frecuencia, que requiere aprobacion
6. Roadmap de madurez arquitectonica: de estado actual a estado objetivo en 12-18 meses

{MODO}=supervisado {FORMATO}=markdown
```

**Output esperado:** Documento de Architecture Vision con principios tabulados, diagrama Mermaid de dominios TOGAF y sus relaciones, stakeholder map, y roadmap de madurez con fases.

---

## Prompt 3: Racionalizacion de Portafolio de Aplicaciones

**Contexto:** La organizacion tiene un portafolio de aplicaciones que ha crecido organicamente y necesita racionalizar: identificar redundancias, evaluar el valor de cada aplicacion, y definir cuales mantener, migrar, reemplazar, o retirar.

**Prompt:**
```
/mao:asis [NOMBRE_ORGANIZACION]

Ejecuta la racionalizacion del portafolio de aplicaciones de [NOMBRE_ORGANIZACION].

Inventario de aplicaciones: [FUENTE_DEL_INVENTARIO]
Numero estimado de aplicaciones en scope: [N_APLICACIONES]

Analisis requerido por cada aplicacion:
1. Valor de negocio (alto/medio/bajo): contribucion a capacidades core
2. Estado tecnico (bueno/aceptable/deficiente/critico): deuda, mantenibilidad, riesgo
3. Costo de operacion: FTE de soporte, licencias, infraestructura
4. Redundancia: otras aplicaciones que cubren la misma capacidad
5. Riesgo de continuidad: single-vendor, tecnologia obsoleta, conocimiento concentrado

Clasificacion TIME (Tolerate/Invest/Migrate/Eliminate):
- Tolerate: bajo valor pero bajo costo, sin alternativa inmediata
- Invest: alto valor, buen estado tecnico, invertir en evolucion
- Migrate: alto valor pero mal estado tecnico, migrar a plataforma moderna
- Eliminate: bajo valor, alto costo o riesgo, eliminar con plan de transicion

Entrega:
1. Matriz de portafolio (valor de negocio vs. estado tecnico) con clasificacion TIME
2. Mapa de redundancias: capacidades cubiertas por >1 aplicacion
3. Quick wins: aplicaciones para eliminar/consolidar inmediatamente
4. Plan de racionalizacion por fases (6-18 meses)
5. Ahorro estimado en FTE-meses y reduccion de riesgo operacional

{MODO}=piloto-auto {FORMATO}=markdown {MODO_OPERACIONAL}=capacidades
```

**Output esperado:** Matriz de portafolio con clasificacion TIME, tabla de redundancias, lista de quick wins, roadmap de racionalizacion con estimados de ahorro.

---

## Prompt 4: Diseno del Technology Radar Organizacional

**Contexto:** La organizacion necesita un Technology Radar (estilo ThoughtWorks) para guiar decisiones tecnologicas de manera consistente, evitando proliferacion descontrolada y alineando las elecciones con la estrategia.

**Prompt:**
```
/mao:asis [NOMBRE_ORGANIZACION]

Disena el Technology Radar para [NOMBRE_ORGANIZACION].

Contexto tecnologico:
- Stack principal actual: [STACK_PRINCIPAL]
- Numero de equipos de desarrollo: [N_EQUIPOS]
- Cloud provider(s) en uso: [CLOUD_PROVIDERS]
- Pain points de diversidad tecnologica: [PAIN_POINTS]

Dimensiones del radar:
- Platforms & Infrastructure
- Languages & Frameworks
- Data & Analytics
- Architectural Patterns
- Tools & Practices
- Security & Compliance

Por cada entrada del radar:
1. Nombre de la tecnologia/practica
2. Clasificacion: Adopt / Trial / Assess / Hold
3. Racional de la clasificacion (evidencia, no opinion)
4. Alternativas evaluadas
5. Owner (equipo o persona que lidera la evaluacion)
6. Para "Hold": plan de migracion recomendado y timeline

Entrega adicional:
1. Proceso de gobernanza del radar: quien propone, quien evalua, frecuencia de actualizacion
2. Criterios formales para mover una tecnologia entre cuadrantes
3. Template para que los equipos propongan nuevas entradas

{MODO}=supervisado {FORMATO}=markdown {MODO_OPERACIONAL}=gobernanza
```

**Output esperado:** Diagrama de radar con 4 cuadrantes y 6 dimensiones, tabla detallada de entradas con clasificacion y racional, proceso de gobernanza del radar, template de propuesta.

---

## Prompt 5: Diseno de Target State y Roadmap de Transformacion

**Contexto:** Se conoce el estado actual (AS-IS) de la arquitectura enterprise y se necesita disenar el estado objetivo (TO-BE) con un roadmap de transformacion que conecte ambos estados de manera realista.

**Prompt:**
```
/mao:asis [NOMBRE_ORGANIZACION]

Disena el Target State y Roadmap de Transformacion para [NOMBRE_ORGANIZACION].

Estado actual documentado en: [RUTA_DOCUMENTO_ASIS]
Horizonte de transformacion: [12 / 18 / 24 / 36] meses
Capacidad de inversion: [DESCRIPCION_RESTRICCION_PRESUPUESTAL]
Restricciones de continuidad operacional: [RESTRICCIONES]

Target State requerido:
1. Capability Map objetivo con madurez target por capacidad
2. Domain Model TO-BE con bounded contexts y ownership
3. Technology Radar objetivo (que adoptar, que retirar)
4. Modelo operativo objetivo (team topologies, governance, metricas)

Roadmap de transformacion:
1. Fases con criterios de entrada y salida medibles
2. Iniciativas por fase con dependencias explicitas
3. Quick wins (primeros 90 dias) que demuestran valor temprano
4. Riesgos de transicion por fase y estrategias de mitigacion
5. Metricas de exito por fase (DORA, capability maturity, business KPIs)
6. Parallel running strategy para cambios de alto impacto

Principios del roadmap:
- Nunca detener la entrega de valor mientras se transforma
- Cada fase entrega valor medible, no solo "preparacion"
- Reversibilidad: cada fase tiene plan de rollback

{MODO}=supervisado {FORMATO}=markdown
```

**Output esperado:** Diagrama Mermaid del target state, roadmap Gantt por fases, tabla de iniciativas con dependencias, metricas de exito, plan de quick wins para primeros 90 dias.

---

## Prompt 6: Establecimiento del ARB y Governance Framework

**Contexto:** La organizacion no tiene gobierno arquitectonico formal o el existente no funciona. Se necesita disenar el Architecture Review Board, el proceso de aprobacion, y los mecanismos de compliance.

**Prompt:**
```
/mao:asis [NOMBRE_ORGANIZACION]

Disena el Architecture Review Board y Governance Framework para [NOMBRE_ORGANIZACION].

Contexto organizacional:
- Numero de equipos de desarrollo: [N_EQUIPOS]
- Existe ARB actual: [SI_DISFUNCIONAL / SI_INFORMAL / NO]
- Nivel de autonomia de los equipos: [ALTO / MEDIO / BAJO]
- Cultura organizacional: [STARTUP_AGIL / ENTERPRISE_FORMAL / HIBRIDA]
- Frecuencia de decisiones arquitectonicas significativas: [SEMANAL / MENSUAL / TRIMESTRAL]

Entrega:
1. Composicion del ARB: roles, responsabilidades, criterios de seleccion de miembros
2. Proceso de revision: que requiere revision (umbrales), formato de propuesta (ADR), timeline de revision, escalamiento
3. Principios arquitectonicos (8-12) que el ARB hace cumplir
4. Estandares y patrones recomendados: API design, logging, deployment, database selection
5. Proceso de excepcion: path rapido para decisiones urgentes
6. Compliance y auditoria: tracking de drift tecnologico, auditorias periodicas, mapeo de controles regulatorios
7. Metricas de efectividad del ARB: tiempo de revision, satisfaccion de equipos, drift rate

El governance debe habilitar velocidad, no frenarla. Governance proporcional al riesgo.

{MODO}=supervisado {FORMATO}=markdown {MODO_OPERACIONAL}=gobernanza
```

**Output esperado:** Documento de governance con composicion del ARB, diagrama Mermaid del proceso de revision, tabla de principios, umbrales de revision, proceso de excepcion, y metricas de efectividad.

---

## Prompt 7: Variante Ejecutiva — Enterprise Architecture para C-Level

**Contexto:** El CTO, CEO, o board necesita entender la postura arquitectonica de la empresa, las brechas de capacidad, y las inversiones requeridas en una presentacion de alto nivel sin detalle tecnico.

**Prompt:**
```
/mao:asis [NOMBRE_ORGANIZACION]

Produce la variante ejecutiva de Enterprise Architecture para [NOMBRE_ORGANIZACION].

Audiencia: C-Level / Board / VP Engineering
Tiempo de lectura objetivo: 15-20 minutos

Entrega unicamente:
1. Capability Map simplificado (Level 1 + Level 2 criticos): heat map visual de madurez con colores claros
2. Top-5 brechas de capacidad: que capacidades necesitan inversion inmediata y por que (impacto en ingresos, riesgo, competitividad)
3. Technology Radar resumen: 5-8 decisiones tecnologicas clave con clasificacion y racional de negocio
4. Portfolio de iniciativas: top-10 iniciativas priorizadas por valor de negocio, con esfuerzo en t-shirt sizing y timeline
5. Modelo operativo: 1 pagina sobre como se organiza la entrega (team topologies simplificado, DORA metrics actuales vs. objetivo)
6. Pedir de inversion: que se necesita (FTE, herramientas, capacitacion) para cerrar las brechas criticas

Lenguaje: impacto en negocio, no jerga tecnica. Trade-offs expresados en riesgo, costo, y velocidad de entrega.

{MODO}=desatendido {VARIANTE}=ejecutiva {FORMATO}=markdown
```

**Output esperado:** Documento ejecutivo de 10-15 paginas con heat map de capacidades, tabla de brechas con impacto de negocio, radar simplificado, portfolio priorizado, y pedir de inversion claro.

---
**Autor:** Javier Montano | **© Comunidad MetodologIA** | **Version:** 1.0.0 | **Fecha:** 13 de marzo de 2026
