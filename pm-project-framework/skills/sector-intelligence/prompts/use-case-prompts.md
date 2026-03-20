---
skill: sector-intelligence
title: Use-Case Prompts — Sector Intelligence
version: 1.0
author: Javier Montaño
copyright: © Comunidad MetodologIA
updated: 2026-03-13
---

# Use-Case Prompts: Sector Intelligence

Prompts listos para usar en escenarios reales de discovery y análisis sectorial. Cada prompt activa el lente de industria relevante para producir contexto específico, no genérico.

---

## Prompt 1: Context Brief Sectorial para Inicio de Engagement

**Nombre:** Briefing de industria para la primera reunión con el cliente

**Contexto de uso:** Antes de la primera sesión con un cliente, para llegar con contexto sectorial sólido que demuestre comprensión del negocio antes de hacer preguntas.

**Prompt:**
```
Genera un context brief sectorial para un engagement de discovery con el siguiente cliente:

Industria: [INDUSTRIA]
Sub-segmento: [ej: banca retail / manufactura automotriz / salud ambulatoria]
País/Región: [PAÍS O REGIÓN]
Tamaño de empresa: [FACTURACIÓN APROXIMADA O RANGO DE EMPLEADOS]
Proyecto en scope: [BREVE DESCRIPCIÓN DEL PROYECTO]

El brief debe incluir:
1. **Situación actual del sector** (2-3 párrafos): Drivers de transformación en 2024-2026, presiones competitivas y regulatorias, estado de madurez digital del segmento
2. **Los 3-5 riesgos sectoriales clave** que toda solución en este espacio debe considerar (no riesgos genéricos de TI)
3. **Benchmarks de referencia** (2-3 métricas relevantes con rangos típicos del sector)
4. **Restricciones regulatorias** que impactan decisiones técnicas o de proceso
5. **Movimientos de competidores** (cómo están resolviendo el problema similar empresas del mismo sector)
6. **"So What?" para el cliente:** Por qué este contexto importa para su iniciativa específica

Formato: Markdown estructurado, listo para usar en preparación de reunión. Máximo 2 páginas.
```

**Salida esperada:** Documento de 2 páginas con los 6 componentes del context brief, listo para usar como preparación antes de entrar al engagement.

---

## Prompt 2: Risk Overlay Sectorial para Análisis AS-IS

**Nombre:** Inyección de riesgos sectoriales al análisis de estado actual

**Contexto de uso:** Durante o después del análisis AS-IS, para enriquecer los hallazgos técnicos con los riesgos que solo son visibles con conocimiento de industria.

**Prompt:**
```
El análisis AS-IS del proyecto [NOMBRE DEL PROYECTO] en [EMPRESA] (industria: [INDUSTRIA]) identificó los siguientes hallazgos técnicos:

Hallazgos del AS-IS:
[LISTA DE HALLAZGOS TÉCNICOS — pueden ser sistemas legacy, brechas de integración, deuda técnica, etc.]

Con el lente de la industria [INDUSTRIA], genera un risk overlay sectorial:

1. **5 riesgos sectoriales** que los hallazgos técnicos activan en este contexto de industria (con impacto cuantificado si es posible)
2. **Riesgos regulatorios específicos** derivados de los hallazgos (qué incumplimientos potenciales se observan)
3. **Comparativa con peers:** Cómo se posicionan estos hallazgos respecto al estado típico de la industria (¿mejor, peor, o en línea?)
4. **Riesgos invisibles desde el análisis técnico puro:** Qué dinámicas de industria agravan los hallazgos (ej: un sistema legacy en banca no es solo deuda técnica — es un riesgo de compliance con BCBS 239)
5. **Urgencia calibrada por industria:** ¿Cuánto tiempo tiene el cliente antes de que estos riesgos se materialicen dado el ritmo de cambio del sector?

Presenta los riesgos en tabla con: Riesgo | Origen (hallazgo técnico) | Amplificador sectorial | Probabilidad | Impacto | Mitigación recomendada.
```

**Salida esperada:** Tabla de 5 riesgos sectoriales derivados de hallazgos técnicos específicos, con amplificadores de industria y mitigaciones.

---

## Prompt 3: Evaluación de Escenarios con Lente Sectorial

**Nombre:** Filtro de industria para escenarios de solución (Tree-of-Thought)

**Contexto de uso:** Durante la fase de definición de escenarios, para evaluar cada opción técnica a través del filtro de viabilidad de industria.

**Prompt:**
```
Los siguientes escenarios de solución han sido propuestos para el proyecto [NOMBRE DEL PROYECTO] en la industria [INDUSTRIA]:

Escenario A: [DESCRIPCIÓN]
Escenario B: [DESCRIPCIÓN]
Escenario C: [DESCRIPCIÓN]

Con el lente de la industria [INDUSTRIA], evalúa cada escenario en las siguientes dimensiones:

1. **Viabilidad regulatoria:** ¿El escenario es técnicamente viable pero regulatoriamente problemático en este sector?
2. **Fit con patrones de industria:** ¿El escenario usa patrones arquitectónicos probados en este sector? ¿O introduce patrones no validados en este contexto?
3. **Benchmarks de adopción:** ¿Cuántas empresas del sector han implementado este tipo de solución? ¿Con qué resultados?
4. **Riesgos específicos del sector:** ¿Qué riesgos sectoriales activa cada escenario que no serían visibles desde un análisis técnico puro?
5. **Velocidad de implementación por industria:** Dado el clock speed de [INDUSTRIA], ¿cuál escenario tiene la mejor relación velocidad/robustez?

Genera una tabla comparativa con puntuación por dimensión y recomendación del lente sectorial.
Incluye también: qué preguntas adicionales se deben hacer al cliente para validar la evaluación sectorial.

Formato: tabla de evaluación + recomendación + 5 preguntas de validación.
```

**Salida esperada:** Tabla comparativa de 3 escenarios por 5 dimensiones sectoriales, recomendación fundamentada en industria, y preguntas de validación.

---

## Prompt 4: Benchmarks Sectoriales para Pitch Ejecutivo

**Nombre:** Datos de industria para argumentar urgencia y relevancia en el C-Level

**Contexto de uso:** Al preparar el pitch ejecutivo, para respaldar la propuesta con benchmarks que pongan en perspectiva la situación del cliente frente a su industria.

**Prompt:**
```
Estamos preparando el pitch ejecutivo para [NOMBRE DE PROYECTO / INICIATIVA] en [EMPRESA].
Industria: [INDUSTRIA] | Región: [REGIÓN] | Segmento: [SUBSEGMENTO]

La propuesta aborda los siguientes problemas del cliente:
1. [PROBLEMA 1]
2. [PROBLEMA 2]
3. [PROBLEMA 3]

Genera los benchmarks sectoriales que respaldan la urgencia de actuar:

1. **Estado del mercado:** ¿Qué porcentaje de empresas del sector ya han abordado este tipo de problema? (early adopters vs. mayoría)
2. **Costo de la inacción:** Benchmarks de pérdidas o costos asociados con NO resolver este tipo de problema en la industria
3. **Impacto de quienes ya lo resolvieron:** Métricas de mejora reportadas por peers que implementaron soluciones similares
4. **Ventana de oportunidad:** ¿Cuánto tiempo tiene el cliente para actuar antes de quedar en desventaja competitiva o regulatoria?
5. **Comparativa específica del cliente:** Si tienes información del cliente, posiciónalo en el rango de la industria (percentil aproximado)

Para cada benchmark: fuente (o tipo de fuente), año del dato, y calificación de confiabilidad (Alta/Media/Estimada).
Incluye 3 opciones de cita ejecutiva que el presentador puede usar verbalmente.

Formato: tabla de benchmarks + 3 citas ejecutivas listas para usar.
```

**Salida esperada:** 5 benchmarks sectoriales con fuentes, tabla de comparativa y 3 frases ejecutivas listas para usar en presentación verbal.

---

## Prompt 5: Análisis Regulatorio para Arquitectura Técnica

**Nombre:** Filtro regulatorio de sector para decisiones de arquitectura

**Contexto de uso:** Cuando se están evaluando decisiones de arquitectura técnica que podrían verse restringidas o amplificadas por el marco regulatorio de la industria.

**Prompt:**
```
El equipo técnico está evaluando las siguientes decisiones de arquitectura para el proyecto [NOMBRE DEL PROYECTO] en la industria [INDUSTRIA] de [PAÍS/REGIÓN]:

Decisiones de arquitectura bajo evaluación:
1. [DECISIÓN 1 — ej: almacenar datos de clientes en nube pública multi-región]
2. [DECISIÓN 2 — ej: usar un modelo de IA para scoring de crédito]
3. [DECISIÓN 3 — ej: API-first architecture con terceros sin contrato formal]

Con el lente regulatorio de la industria [INDUSTRIA] en [PAÍS/REGIÓN], analiza cada decisión:

1. **Flag regulatorio:** ¿Esta decisión es compatible con el marco regulatorio del sector? (Sí / Condicionada / Prohibida / Zona gris)
2. **Normativa aplicable:** Qué regulaciones específicas gobiernan esta decisión
3. **Restricciones técnicas derivadas:** Qué restricciones de implementación impone la regulación (ej: datos deben residir en [PAÍS], auditoría obligatoria, explainability de modelos AI)
4. **Opciones conformes:** Para cada decisión problemática, 2 alternativas técnicas que cumplen la regulación
5. **Costo de cumplimiento:** Magnitud del esfuerzo adicional requerido para hacer la decisión conforme

Incluye un semáforo regulatorio (Verde / Amarillo / Rojo) por decisión.

Formato: tabla con semáforo + análisis + alternativas conformes.
```

**Salida esperada:** Tabla semáforo para cada decisión técnica, regulación aplicable, restricciones concretas, y alternativas conformes para las decisiones problemáticas.

---

## Prompt 6: Competitive Landscape para Contexto de Industria

**Nombre:** Análisis del paisaje competitivo sectorial para el cliente

**Contexto de uso:** Cuando el cliente necesita entender cómo sus competidores están resolviendo el mismo problema, para calibrar la ambición y urgencia de su iniciativa.

**Prompt:**
```
Realiza un análisis del competitive landscape para [EMPRESA/CLIENTE] en el contexto de [NOMBRE DEL PROYECTO].

Industria: [INDUSTRIA]
Problema que aborda el proyecto: [DESCRIPCIÓN DEL PROBLEMA]
Competidores relevantes del cliente: [LISTA SI DISPONIBLE, O "empresas típicas de [SUBSEGMENTO]"]

Genera:
1. **Estado del mercado en este problema:** ¿Es un early-adopter problem (pocos lo han resuelto) o un hygiene problem (todos deberían tenerlo)?
2. **Cómo lo están resolviendo los líderes del sector:** Patrones tecnológicos y de proceso predominantes en los top performers
3. **Cómo lo están resolviendo los peers del cliente:** Estado típico en el segmento del cliente (no solo los líderes)
4. **Diferenciadores que han generado ventaja:** ¿Qué innovaciones específicas han generado ventaja competitiva medible?
5. **Errores comunes en implementaciones del sector:** Qué han hecho mal otros para que el cliente no repita los errores
6. **Velocidad de movimiento del mercado:** ¿Cuánto tiempo falta para que esta capacidad pase de diferenciadora a tabla stakes?

Incluye el "So What?": por qué esta perspectiva competitiva debe cambiar las decisiones del cliente en ESTE proyecto.

Formato: análisis narrativo + tabla de posicionamiento del cliente + "So What?" ejecutivo.
```

**Salida esperada:** Análisis competitivo con tabla de posicionamiento, identificación de diferenciadores de líderes, errores comunes a evitar, y "So What?" ejecutivo.

---

## Prompt 7: Composite Lens para Cliente Multi-Industria

**Nombre:** Análisis sectorial compuesto para organizaciones diversificadas

**Contexto de uso:** Cuando el cliente opera en múltiples industrias reguladas y las recomendaciones deben considerar las intersecciones y conflictos entre diferentes marcos sectoriales.

**Prompt:**
```
El cliente [NOMBRE] opera en múltiples industrias:
- Industria primaria: [INDUSTRIA 1] (aproximadamente [%] de ingresos)
- Industria secundaria: [INDUSTRIA 2] (aproximadamente [%] de ingresos)
- Industria terciaria (si aplica): [INDUSTRIA 3]

El proyecto [NOMBRE DEL PROYECTO] impacta todas las unidades de negocio.

Genera un análisis sectorial compuesto (composite lens):

1. **Lente primario:** Context brief completo de la industria dominante
2. **Overlays secundarios:** Cómo los marcos de las industrias secundarias modifican o restringen las recomendaciones del lente primario
3. **Conflictos regulatorios identificados:** Zonas donde las regulaciones de dos industrias colisionan o generan requisitos contradictorios
4. **Decisiones diferenciadas por unidad:** Para las recomendaciones donde el lente cambia el resultado según la unidad de negocio, presenta las opciones por separado
5. **Recomendación de arquitectura compartida:** Qué elementos de la solución deben ser comunes y cuáles deben ser específicos por unidad para respetar los marcos regulatorios divergentes

Incluye: tabla de conflictos regulatorios + mapa de decisiones diferenciadas + recomendación de estrategia de arquitectura composita.

Formato: análisis estructurado con secciones explícitas por industria + resolución de conflictos.
```

**Salida esperada:** Análisis compuesto por industria, tabla de conflictos regulatorios, decisiones diferenciadas por unidad, y recomendación de arquitectura que respeta múltiples marcos.

---

## Prompt 8: Sector Intelligence para Handover a Implementación

**Nombre:** Transferencia de contexto sectorial al equipo de entrega

**Contexto de uso:** Al cerrar el discovery y hacer handover al equipo de implementación, para asegurar que el contexto sectorial crítico no se pierda en la transición.

**Prompt:**
```
El discovery de [NOMBRE DEL PROYECTO] está cerrando. El equipo de implementación necesita recibir el contexto sectorial crítico que debe guiar la entrega.

Industria: [INDUSTRIA] | Subsegmento: [SUBSEGMENTO] | Región: [REGIÓN]

Síntesis de decisiones de discovery relevantes al lente sectorial:
[LISTA DE DECISIONES CLAVE TOMADAS EN DISCOVERY]

Genera el Sector Intelligence Handover Package:

1. **Restricciones no negociables de industria:** Decisiones que el equipo de entrega NO puede cambiar sin re-validar con el cliente (por razones regulatorias o de industria)
2. **Supuestos sectoriales declarados:** Qué asumimos sobre la industria del cliente que el equipo de entrega debe validar continuamente durante la implementación
3. **Riesgos sectoriales latentes:** Riesgos que no se materializaron durante el discovery pero pueden emerger en implementación según patrones de la industria
4. **Puntos de control de compliance:** Fechas o hitos en los que se debe re-verificar cumplimiento regulatorio (ej: si hay cambios normativos esperados durante el proyecto)
5. **Referencia de benchmarks:** Métricas de industria que el equipo debe usar para evaluar el éxito de la solución en producción

Formato: documento de handover conciso, máximo 1 página, diseñado para briefing oral de 15 minutos.
```

**Salida esperada:** Documento de handover de 1 página con restricciones no negociables, supuestos declarados, riesgos latentes y puntos de control de compliance.

---
*© Comunidad MetodologIA. Autor: Javier Montaño. Uso interno y para clientes MetodologIA.*
