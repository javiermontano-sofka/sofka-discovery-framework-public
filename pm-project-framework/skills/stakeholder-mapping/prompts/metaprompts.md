---
skill: stakeholder-mapping
title: Metaprompts — Stakeholder Mapping
version: 1.0
author: Javier Montaño
copyright: © Comunidad MetodologIA
updated: 2026-03-13
---

# Metaprompts: Stakeholder Mapping

Metaprompts para generar prompts personalizados adaptados a contextos específicos de proyectos, industrias y fases del discovery. Cada metaprompt toma variables de entrada y produce un prompt listo para usar.

---

## Metaprompt 1: Generador de Prompts de Identificación de Stakeholders por Industria

**Propósito:** Crear prompts de identificación de stakeholders que incorporen los roles y dinámicas de poder típicos de una industria específica, en lugar de usar una plantilla genérica.

**Template:**
```
Necesito un prompt optimizado para identificar stakeholders en un proyecto de [TIPO_DE_PROYECTO] en la industria [INDUSTRIA] con las siguientes características:

- Alcance del proyecto: [ALCANCE — ej: transformación digital, implementación ERP, migración cloud]
- Contexto organizacional: [CONTEXTO — ej: empresa pública, multinacional, startup]
- Desafío particular: [DESAFÍO — ej: organización muy política, poca cultura de documentación, estructura matricial]
- Fase del engagement: [FASE — ej: preventa, inicio de discovery, revisión de proyecto en curso]

Genera un prompt completo que:
1. Pre-cargue los roles típicos de stakeholders en [INDUSTRIA] para este tipo de proyecto (ej: en banca: compliance officer, risk manager, CIO, gerente de operaciones)
2. Incluya las dinámicas de poder específicas del sector (ej: en salud, el director médico tiene veto informal en TI clínica)
3. Adapte las técnicas de detección de stakeholders ocultos al [CONTEXTO]
4. Genere preguntas de entrevista formuladas con vocabulario de [INDUSTRIA]
5. Defina el criterio de completitud del mapa para este tipo de proyecto

El prompt generado debe ser directamente usable en una sesión de discovery sin modificaciones.
```

**Guía de uso:**
- Reemplaza los valores en MAYÚSCULAS con los específicos del proyecto antes de ejecutar.
- TIPO_DE_PROYECTO puede ser tan específico como "migración de core banking" o tan general como "transformación digital".
- DESAFÍO es el campo más importante: adaptar al contexto político y estructural produce prompts significativamente más útiles.
- El prompt generado funcionará como un prompt de use-case personalizado para ese engagement específico.

---

## Metaprompt 2: Generador de Estrategias de Engagement para Stakeholders Difíciles

**Propósito:** Crear prompts específicos para diseñar estrategias de manejo de stakeholders con actitud negativa (-) o comportamientos resistentes, adaptados al arquetipo de resistencia y al contexto cultural.

**Template:**
```
Necesito un prompt para diseñar la estrategia de manejo de un stakeholder difícil con las siguientes características:

Perfil del stakeholder:
- Rol: [ROL Y NIVEL JERÁRQUICO]
- Arquetipo de resistencia identificado: [ESCÉPTICO / BLOQUEADOR / RESISTENTE PASIVO / SABOTEADOR / DOLIENTE]
- Comportamientos observados: [DESCRIPCIÓN CONCRETA DE COMPORTAMIENTOS — ej: "no responde correos en más de 5 días", "en reuniones dice sí pero luego no ejecuta"]
- Lo que probablemente está protegiendo: [CONTROL / ESTATUS / PRESUPUESTO / CERTEZA / IDENTIDAD / OTRO]
- Nivel de poder en la organización: [ALTO / MEDIO / BAJO]
- Relación con el sponsor ejecutivo: [DESCRIPCIÓN]

Contexto cultural y organizacional:
- Cultura de feedback: [DIRECTA / INDIRECTA]
- Tolerancia al conflicto: [ALTA / MEDIA / BAJA]
- Industria: [INDUSTRIA]

Genera un prompt que produzca:
1. Diagnosis confirmación del arquetipo con evidencia de los comportamientos descritos
2. La necesidad no satisfecha que subyace a la resistencia (en su perspectiva)
3. Una secuencia de 3-5 acciones de engagement específicas ordenadas por tiempo (esta semana, próximas 2 semanas, próximo mes)
4. Guión de conversación para la próxima interacción con este stakeholder
5. Señales de que la estrategia está funcionando (o fallando)
6. Punto de escalamiento y cómo involucrar al sponsor sin quemar la relación

El prompt debe ser empático pero pragmático — el objetivo es la alineación del proyecto, no la terapia.
```

**Guía de uso:**
- Es crítico ser preciso en "Lo que probablemente está protegiendo" — este campo determina el tipo de intervención.
- La sección de contexto cultural es especialmente importante en LATAM donde el feedback directo puede ser culturalmente problemático.
- El guión de conversación generado debe revisarse con el discovery conductor antes de usarse — es una herramienta de preparación, no un script rígido.

---

## Metaprompt 3: Generador de Matrices RACI para Proyectos No Estándar

**Propósito:** Crear prompts RACI adaptados a estructuras organizacionales o de proyecto atípicas (matriciales, multi-vendor, reguladas, ágiles) que no encajan en los templates estándar.

**Template:**
```
Necesito un prompt para construir una matriz RACI adaptada a la siguiente estructura de proyecto no estándar:

Estructura del proyecto:
- Tipo de estructura: [MATRICIAL / MULTI-VENDOR / REGULADA / ÁGIL / PRODUCTO / CONSORCIO / OTRO]
- Descripción del desafío estructural: [DESCRIPCIÓN — ej: "tres empresas participan como co-ejecutores y el cliente tiene dos BU separadas con P&L independientes"]
- Número de stakeholders en scope: [NÚMERO APROXIMADO]
- Entregables del proyecto: [LISTA O DESCRIPCIÓN]
- Restricciones de accountability: [ej: "el proveedor X no puede ser Accountable de nada según el contrato", "solo el Director de TI puede ser A en decisiones de arquitectura"]

Genera un prompt que produzca:
1. Estructura RACI adaptada al tipo de organización descrita (puede incluir variantes como RACI-VS para multi-vendor, DACI para organizaciones ágiles, etc.)
2. Reglas de asignación específicas para este contexto (ej: cómo manejar cuando hay dos candidatos a Accountable por razones contractuales)
3. Mecanismo de resolución de conflictos entre partes (cliente + MetodologIA + otros proveedores)
4. Protocolo de escalamiento que respete la jerarquía formal Y la informal en esta estructura
5. Plan de actualización del RACI cuando cambien los roles durante el proyecto

Incluye una nota sobre los riesgos más comunes de RACI en este tipo de estructura y cómo mitigarlos.
```

**Guía de uso:**
- Usar cuando la estructura del proyecto no encaja en el RACI estándar de discovery.
- El campo de "Restricciones de accountability" es frecuentemente ignorado y es la fuente de la mayoría de los conflictos de RACI en proyectos multi-proveedor.
- El prompt generado puede requerir una reunión de validación con todas las partes antes de ser oficialmente adoptado.

---

## Metaprompt 4: Generador de Planes de Comunicación para Audiencias Técnicas vs. Ejecutivas

**Propósito:** Crear prompts de plan de comunicación que resuelvan la tensión entre comunicar con suficiente profundidad técnica para los implementadores y con suficiente claridad estratégica para los sponsors ejecutivos en el mismo proyecto.

**Template:**
```
Necesito un prompt para diseñar un plan de comunicación que gestione simultáneamente audiencias con expectativas radicalmente distintas en el proyecto [NOMBRE_DEL_PROYECTO]:

Audiencia ejecutiva:
- Roles: [LISTA DE ROLES EJECUTIVOS]
- Preocupación principal: [ej: ROI, tiempo al mercado, riesgo regulatorio]
- Tolerancia a detalle técnico: [BAJA / MEDIA]
- Disponibilidad: [ej: "reunión mensual máximo 30 min", "solo por email"]
- Riesgo de sobrecargarlos: [ALTO / MEDIO — indican si está ocurriendo]

Audiencia técnica:
- Roles: [LISTA DE ROLES TÉCNICOS]
- Preocupación principal: [ej: viabilidad técnica, deuda, plazos de implementación]
- Expectativa de detalle: [ALTA]
- Canal preferido: [ej: Jira, Confluence, Slack, reuniones semanales]

Tensión identificada:
- [DESCRIPCIÓN DE LA TENSIÓN ACTUAL — ej: "el CTO quiere detalles técnicos en las reuniones ejecutivas y el CEO se pierde; si damos solo resumen ejecutivo, el CTO no está satisfecho"]

Genera un prompt que produzca:
1. Arquitectura de comunicación separada por audiencia (cadencia, canal, formato y profundidad para cada grupo)
2. Mecanismo de síntesis: cómo traducir updates técnicos en lenguaje ejecutivo y viceversa
3. El formato de "comunicación bifurcada": un mismo evento con un artefacto para cada audiencia
4. Protocolo para cuando la audiencia ejecutiva quiera más detalle (o la técnica quiera menos proceso)
5. Indicadores de que el plan de comunicación está funcionando para ambas audiencias

El prompt debe reconocer que optimizar para una audiencia sin considerar la otra es una fuente frecuente de fricción en proyectos de transformación.
```

**Guía de uso:**
- Especialmente útil en proyectos de transformación tecnológica donde el sponsor es C-Level y el equipo de implementación es altamente técnico.
- La "Tensión identificada" es el campo más valioso — si ya se sabe cuál es el problema, el prompt generado puede ser muy específico.
- El prompt generado producirá estrategias distintas según si la tensión principal es "demasiado detalle para ejecutivos" vs. "insuficiente profundidad para técnicos".

---

## Metaprompt 5: Generador de Assessment de Change Readiness por Iniciativa de Transformación

**Propósito:** Crear prompts de evaluación de readiness de cambio calibrados al tipo específico de transformación (digital, cultural, regulatoria, estructural), ya que cada tipo activa diferentes arquetipos de resistencia y requiere intervenciones distintas.

**Template:**
```
Necesito un prompt para evaluar el change readiness para una transformación de tipo [TIPO_DE_TRANSFORMACIÓN] en la organización [DESCRIPCIÓN_DE_ORGANIZACIÓN].

Tipo de transformación: [DIGITAL / CULTURAL / REGULATORIA / ESTRUCTURAL / TECNOLÓGICA / PROCESO / COMBINADA]
Descripción específica: [ej: "implementación de SAP S/4HANA que elimina 3 sistemas legacy y cambia flujos de trabajo de 400 personas"]
Velocidad de implementación: [RÁPIDA < 6 meses / MODERADA 6-18 meses / LARGA > 18 meses]

Historial de cambio en la organización:
- Transformaciones exitosas recientes: [DESCRIPCIÓN O "ninguna"]
- Transformaciones fallidas recientes: [DESCRIPCIÓN O "ninguna"]
- Cultura de la organización frente al cambio: [INNOVADORA / CONSERVADORA / MIXTA]
- Nivel de fatiga de cambio actual: [ALTO / MEDIO / BAJO]

Grupos más impactados:
- [GRUPO 1]: [DESCRIPCIÓN DEL IMPACTO]
- [GRUPO 2]: [DESCRIPCIÓN DEL IMPACTO]

Genera un prompt que produzca:
1. Modelo de evaluación de readiness calibrado al tipo de transformación (las preguntas de un assessment para cambio regulatorio son distintas a las de un cambio tecnológico)
2. Arquetipos de resistencia más probables dado el historial y tipo de cambio
3. Mapa de intervenciones diferenciadas por grupo impactado
4. Evaluación de capacidad de absorción organizacional (cuánto puede absorber vs. cuánto se está demandando)
5. Semáforo de riesgo de adopción por grupo con umbrales de escalamiento
6. Plan de activación de champions adaptado a la velocidad de implementación

Incluye: la distinción entre cambio (externo, estructural) y transición (interno, psicológico) en el diseño de intervenciones, siguiendo el modelo de Bridges (2009).
```

**Guía de uso:**
- El tipo de transformación determina el marco de evaluación: los cambios regulatorios generan más resistencia del tipo "Escéptico" (necesitan datos); los cambios estructurales generan más "Dolientes" (pierden algo concreto).
- El historial de cambio es el predictor más fuerte de resistencia futura — nunca omitir este campo.
- "Velocidad de implementación" determina la intensidad de las intervenciones: transformaciones rápidas necesitan champions activados desde el día 1; transformaciones largas tienen riesgo de fatiga de cambio que requiere estrategias de sostenimiento.

---
*© Comunidad MetodologIA. Autor: Javier Montaño. Uso interno y para clientes MetodologIA.*
