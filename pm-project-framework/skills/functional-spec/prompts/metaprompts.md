---
skill: functional-spec
title: Metaprompts — Especificación Funcional
framework: MetodologIA Discovery Framework
author: Javier Montaño
copyright: © Comunidad MetodologIA
updated: 2026-03-13
---

# Metaprompts: Especificación Funcional

Meta-prompts para generar prompts customizados para el skill `functional-spec`. Cada meta-prompt acepta parámetros de contexto y produce un prompt listo para usar, optimizado para el escenario específico.

---

## Metaprompt 1: Generador de Spec por Industria y Complejidad

**Propósito:** Generar un prompt de spec funcional calibrado para una industria específica, con los módulos, business rules típicas y restricciones regulatorias del sector.

**Template:**
```
Actúa como un expert en ingeniería de requisitos especializado en la industria de [INDUSTRIA].

Tu tarea es generar un prompt optimizado para crear una especificación funcional usando el skill functional-spec del MetodologIA Discovery Framework.

Parámetros del contexto:
- Industria: [INDUSTRIA — banca / salud / retail / logística / manufactura / gobierno / seguros]
- Tipo de sistema: [TIPO — CRM / ERP / plataforma digital / sistema transaccional / plataforma de datos / app móvil]
- Complejidad del proyecto: [BAJA / MEDIA / ALTA / CRÍTICA]
- Restricciones regulatorias conocidas: [LISTAR — PCI-DSS / HIPAA / GDPR / SOX / ISO 27001 / ninguna]
- Cantidad de usuarios concurrentes esperados: [NÚMERO O RANGO]
- Integraciones externas: [CANTIDAD Y TIPOS]

El prompt generado debe:
1. Solicitar la spec funcional completa con 8 secciones
2. Incluir en la sección de business rules los tipos de reglas típicos para [INDUSTRIA]
3. Calibrar los criterios de aceptación no funcionales para [COMPLEJIDAD] y [USUARIOS_CONCURRENTES]
4. Agregar secciones extendidas para los requisitos regulatorios de [RESTRICCIONES_REGULATORIAS]
5. Incluir los sistemas de integración típicos de [INDUSTRIA] en la sección de integration specs
6. Usar terminología del dominio de [INDUSTRIA] en los nombres de módulos y casos de uso

Genera el prompt completo, listo para usar, con todos los placeholders de industria ya completados.
```

**Guía de uso:**
- Reemplazar `[INDUSTRIA]` con el sector del cliente (ej: "banca retail")
- Reemplazar `[TIPO]` con el tipo de sistema (ej: "plataforma de originación de créditos")
- Usar `[COMPLEJIDAD=CRÍTICA]` para sistemas regulados o de alta disponibilidad
- El prompt generado incluirá terminología específica del sector y business rules típicas, reduciendo el tiempo de elicitación

---

## Metaprompt 2: Generador de Casos de Uso por Dominio DDD

**Propósito:** Generar un conjunto completo de prompts para documentar todos los casos de uso de un bounded context específico, usando el resultado del Mapeo de Flujos (Phase 2) como input.

**Template:**
```
Eres un arquitecto de dominio con expertise en Domain-Driven Design y especificación funcional.

Tengo el siguiente bounded context del proyecto:

Nombre del bounded context: [NOMBRE_BOUNDED_CONTEXT]
Aggregate raíz: [AGGREGATE_RAÍZ — ej: Pedido, Cliente, Cuenta, Contrato]
Comandos identificados (de Event Storming): [LISTAR_COMANDOS]
Domain events identificados: [LISTAR_EVENTOS]
Políticas de negocio: [LISTAR_POLÍTICAS]
Actores del dominio: [LISTAR_ACTORES]

Tu tarea:
1. Mapear cada comando a un caso de uso (formato Cockburn)
2. Mapear cada política de negocio a una business rule (con severidad inferida)
3. Identificar los flujos alternativos a partir de los domain events de error
4. Generar UN prompt por caso de uso (7-12 prompts, uno por comando)

Para cada prompt de caso de uso generado, incluir:
- El nombre del caso de uso (verbo + sustantivo, ej: "Confirmar Pedido")
- El actor primario del caso de uso
- Los pasos del flujo principal derivados del comando → aggregate → event
- Los flujos alternativos derivados de los eventos de error del Event Storming
- Las business rules referenciadas (IDs inferidos)
- Los datos del aggregate que el caso de uso crea/modifica/lee

Generar los prompts en formato listo para usar con el skill functional-spec.
```

**Guía de uso:**
- Ideal después de ejecutar el skill `flow-mapping` (Phase 2): tomar el output del Event Storming
- Los bounded contexts y comandos del Event Storming mapean 1:1 con módulos y casos de uso
- Si hay más de 12 comandos en un bounded context, dividir en sub-contextos antes de usar este metaprompt
- El output de este metaprompt se usa como input para la Section 2 de la spec funcional

---

## Metaprompt 3: Generador de Business Rules desde Documentos Regulatorios

**Propósito:** Extraer y formalizar business rules desde documentos regulatorios, circulares, o políticas internas, transformándolos en el formato estándar de la spec funcional.

**Template:**
```
Eres un analista de cumplimiento y requisitos con experiencia en [MARCO_REGULATORIO].

Tu tarea es extraer y formalizar las business rules contenidas en el siguiente documento regulatorio o política interna, convirtiéndolas al formato estándar del MetodologIA Discovery Framework para la spec funcional.

Documento fuente:
[PEGAR_TEXTO_DEL_DOCUMENTO_REGULATORIO_O_POLÍTICA_INTERNA]

Marco regulatorio de referencia: [NOMBRE — ej: Circular 022 SFC / GDPR Art. 5-7 / PCI-DSS v4.0 Req. 3-4]

Para cada regla extraída, generar:
- ID único (formato BR-REG-XXX para distinguirlas de reglas de negocio puras)
- Nombre descriptivo en español
- Descripción en lenguaje de negocio (sin jerga legal)
- Lógica de validación (condición formal o pseudocódigo)
- Severidad: siempre CRITICAL para reglas regulatorias con sanción / HIGH para recomendaciones
- Módulos potencialmente afectados (inferir del contexto)
- Referencia normativa exacta (artículo, sección, circular)
- Estado: UNVALIDATED — requiere validación con equipo de compliance antes de implementación
- Prueba automatizable: ¿puede verificarse en CI/CD? ¿Requiere auditoría manual?

Al final, generar:
- Lista de ambigüedades regulatorias que requieren interpretación de un abogado o compliance officer
- Mapa de qué módulos del MVP tienen mayor exposición regulatoria
- Recomendación de orden de validación (qué reglas validar primero con compliance)

Generar en formato tabla markdown lista para incluir en la Section 3 de la spec funcional.
```

**Guía de uso:**
- Pegar fragmentos de 500-2000 palabras por ejecución para mantener calidad de extracción
- Para normativas largas, ejecutar por capítulos/secciones y consolidar después
- Todas las reglas extraídas deben marcar `UNVALIDATED` hasta revisión del equipo legal/compliance
- El ID `BR-REG-XXX` facilita filtrar reglas regulatorias en la spec completa

---

## Metaprompt 4: Generador de Criterios de Aceptación desde User Story Map

**Propósito:** Transformar un User Story Map (o backlog de historias de usuario) en criterios de aceptación estructurados por módulo, compatibles con la Section 6 de la spec funcional y exportables a Gherkin.

**Template:**
```
Eres un QA architect con especialización en BDD y criterios de aceptación verificables.

Tengo el siguiente User Story Map para el proyecto [NOMBRE_PROYECTO]:

Épica 1 — [NOMBRE_ÉPICA_1]:
- Historia: Como [ROL], quiero [ACCIÓN], para [BENEFICIO]
  - Criterio 1 (borrador): [CRITERIO]
  - Criterio 2 (borrador): [CRITERIO]
[CONTINUAR_PARA_TODAS_LAS_ÉPICAS_E_HISTORIAS]

Módulos MVP del proyecto:
- [MÓDULO_1] agrupa las épicas: [LISTAR_ÉPICAS]
- [MÓDULO_2] agrupa las épicas: [LISTAR_ÉPICAS]

Para cada módulo, generar la Section 6 completa:

**Criterios funcionales:**
- Transformar cada historia de usuario en un criterio verificable (checkbox)
- Deducir criterios implícitos no escritos en las historias
- Identificar flujos de excepción que no tienen cobertura en las historias

**Criterios no funcionales (inferir del tipo de sistema):**
- Targets de performance calibrados para [TIPO_DE_SISTEMA]
- Targets de disponibilidad calibrados para [CRITICIDAD_DEL_NEGOCIO]
- Requisitos de audit trail para acciones reguladas

**Escenarios Gherkin (3-5 por módulo):**
- Escenario del happy path del módulo
- Escenario del flujo alternativo más frecuente
- Escenario de la business rule más crítica
- Escenario de degradación o error del sistema

**Sign-offs requeridos:**
- Roles que deben firmar el módulo antes de pasar a producción

Asegurar que los criterios sean:
- Medibles (con números, no con adjetivos)
- Automatizables (identificar cuáles requieren prueba manual)
- Trazables (cada criterio linked a al menos una historia de usuario o business rule)
```

**Guía de uso:**
- Pegar el User Story Map completo o por módulo
- Especificar el tipo de sistema para calibrar los NFRs automáticamente (ej: "sistema financiero transaccional de alta disponibilidad")
- El output se integra directamente en la Section 6 de la spec funcional
- Los escenarios Gherkin generados pueden ser el punto de partida para los feature files del equipo de QA

---

## Metaprompt 5: Generador de Spec Funcional desde Transcript de Entrevista

**Propósito:** Transformar el transcript de una entrevista de discovery con stakeholders en un borrador de spec funcional estructurada, identificando módulos, casos de uso y business rules implícitas en el lenguaje natural.

**Template:**
```
Eres un analista de negocios senior con expertise en ingeniería de requisitos y elicitación de requisitos implícitos.

Tu tarea es analizar el siguiente transcript de entrevista de discovery y generar un borrador de especificación funcional estructurada usando el formato del MetodologIA Discovery Framework.

Transcript de entrevista:
[PEGAR_TRANSCRIPT_COMPLETO_O_NOTAS_DE_ENTREVISTA]

Metadata de la entrevista:
- Entrevistado: [ROL] — [ÁREA]
- Fecha: [FECHA]
- Proyecto: [NOMBRE_PROYECTO]
- Contexto previo conocido: [RESUMEN_BREVE_DE_LO_QUE_YA_SE_SABE]

Tarea de análisis:

**Paso 1 — Extracción de funcionalidades:**
Identificar toda mención de:
- Procesos del negocio → candidatos a casos de uso
- Validaciones, condiciones, restricciones → candidatos a business rules
- Roles que interactúan con el sistema → actores
- Entidades del negocio → candidatos a entidades del modelo de datos
- Sistemas mencionados → candidatos a integraciones

**Paso 2 — Estructuración:**
Organizar los elementos extraídos en:
- Módulos candidatos (agrupar por área funcional del negocio)
- Casos de uso candidatos (nombre en verbo + sustantivo)
- Business rules candidatas (con lógica de validación inferida)
- Flujos de excepción identificados ("¿qué pasa cuando...?" en la entrevista)

**Paso 3 — Gap analysis del transcript:**
Identificar:
- Funcionalidades mencionadas pero no detalladas (requieren follow-up)
- Business rules con ambigüedad (requieren confirmación)
- Actores mencionados pero sin casos de uso asociados
- Sistemas mencionados sin contrato de integración definido

**Paso 4 — Borrador de spec:**
Generar el borrador de Sections 1, 2 y 3 de la spec funcional con los datos extraídos.
Marcar todos los elementos como UNVALIDATED.
Generar una lista de 5-10 preguntas de seguimiento para la próxima entrevista.

Output: Borrador de spec funcional (Sections 1-3) + gap analysis + preguntas de seguimiento.
```

**Guía de uso:**
- Funciona mejor con transcripts de 500-3000 palabras (entrevistas de 30-60 minutos)
- Para entrevistas más largas, dividir por bloques temáticos
- El borrador generado siempre estará UNVALIDATED — es un punto de partida, no la versión final
- Las "preguntas de seguimiento" generadas deben usarse en la próxima sesión con el stakeholder
- Combinar el output de múltiples entrevistas para construir la spec consolidada

---

**Autor:** Javier Montaño | **Framework:** MetodologIA Discovery Framework | **© Comunidad MetodologIA**
