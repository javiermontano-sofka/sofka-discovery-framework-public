---
skill: flow-mapping
title: Metaprompts — Flow Mapping
version: 1.0.0
author: Javier Montaño
copyright: © Comunidad MetodologIA
---

# Metaprompts: Flow Mapping

Meta-prompts para generar prompts personalizados para el skill `flow-mapping`. Cada metaprompt tiene un propósito específico, una plantilla con placeholders, y una guía de uso.

---

## Metaprompt 1: Generador de Prompts para Flujo E2E Específico

**Propósito:** Generar un prompt completo y preciso para documentar cualquier flujo E2E de negocio, adaptado al tipo de sistema, tecnología, y audiencia objetivo.

**Plantilla:**

```
Genera un prompt para el skill flow-mapping que documente el siguiente flujo de negocio:

FLUJO: {{NOMBRE_FLUJO}}
Ejemplo: "Proceso de originación de crédito", "Liquidación de póliza de seguro", "Checkout de e-commerce"

SISTEMA: {{NOMBRE_SISTEMA}}
Ejemplo: "CRM bancario", "Core de seguros", "Plataforma e-commerce"

TECNOLOGÍA PRINCIPAL: {{STACK_TECNOLOGICO}}
Ejemplo: "Java Spring Boot + Kafka + PostgreSQL", "Node.js + RabbitMQ + MongoDB", "Python Django + REST + MySQL"

TIPO DE FLUJO: {{TIPO_FLUJO}}
Opciones: sincrono-REST | asincrono-eventos | batch-ETL | hibrido | CQRS-EventSourcing

AUDIENCIA DEL DELIVERABLE: {{AUDIENCIA}}
Opciones: técnica-arquitectos | técnica-desarrolladores | ejecutiva-CTO | mixta

NIVEL DE DETALLE: {{NIVEL_DETALLE}}
Opciones: trama-completa | alto-nivel | ejecutivo

CONTEXTO ADICIONAL: {{CONTEXTO}}
Ejemplo: "El flujo involucra 3 sistemas externos con SLAs distintos", "Es el flujo de mayor ingreso del negocio", "Existe documentación previa desactualizada"

El prompt generado debe incluir: instrucción al skill, parámetros de trama específicos al tipo de flujo, criterios de validación, y formato de output esperado.
```

**Guía de uso:**
1. Reemplazar todos los `{{PLACEHOLDER}}` con información real del proyecto
2. El `TIPO_FLUJO` determina qué secciones de trama se enfatizan: sincrono = protocolo HTTP/gRPC; asincrono = contratos de mensaje y ordering; batch = pipeline y SLA de ventana
3. La `AUDIENCIA` determina el nivel de tecnicismo del diagrama de secuencia: ejecutiva elimina detalles de protocolo, técnica incluye todo
4. Usar el prompt generado directamente con `/mao:flows`

---

## Metaprompt 2: Generador de Prompts para Análisis de Dominio DDD

**Propósito:** Generar un prompt para identificar y clasificar bounded contexts en cualquier tipo de sistema, adaptado a las señales de dominio disponibles en el codebase.

**Plantilla:**

```
Genera un prompt para el skill flow-mapping enfocado en taxonomía de dominios DDD para:

SISTEMA: {{NOMBRE_SISTEMA}}

TIPO DE ARQUITECTURA: {{TIPO_ARQUITECTURA}}
Opciones: monolito | microservicios | modular-monolith | legado-COBOL | hibrido

SEÑALES DE DOMINIO DISPONIBLES: {{SEÑALES_DISPONIBLES}}
Seleccionar todas las que apliquen:
- [ ] Estructura de packages/namespaces clara
- [ ] Bases de datos separadas por dominio
- [ ] Equipos de desarrollo asignados por módulo
- [ ] Servicios desplegados independientemente
- [ ] Documentación de negocio existente
- [ ] Expertos de dominio disponibles para entrevistas

NÚMERO ESPERADO DE DOMINIOS: {{RANGO_DOMINIOS}}
Ejemplo: "4-6 dominios", "8-12 dominios", "no definido — descubrir"

CONTEXT MAPPING A ENFATIZAR: {{CONTEXT_MAPPING}}
Opciones: todos-los-patrones | solo-boundaries | anti-corruption-layers | shared-kernels

ENTREGABLE ESPERADO: {{ENTREGABLE}}
Opciones: domain-cards-grid | context-map-diagram | ambos

El prompt generado debe incluir heurísticos de clasificación Core/Supporting/Generic adaptados al tipo de negocio del sistema, y los pasos de validación cruzada entre señales de código y negocio.
```

**Guía de uso:**
1. Las `SEÑALES_DISPONIBLES` determinan la estrategia de extracción: con pocas señales el prompt generado incluirá más pasos de inferencia y documentación de supuestos
2. Para `monolito`, el prompt generará instrucciones adicionales para identificar "seams" potenciales de extracción futura
3. Para `microservicios`, el prompt verificará si los services actuales coinciden o divergen de los bounded contexts correctos
4. Combinar este prompt con el Metaprompt 1 para obtener primero dominios y luego los flujos que los cruzan

---

## Metaprompt 3: Generador de Prompts para Análisis de Riesgo de Integración

**Propósito:** Generar un prompt personalizado para analizar los puntos de falla y la resiliencia de las integraciones de un sistema específico, adaptado a su perfil de riesgo.

**Plantilla:**

```
Genera un prompt para el skill flow-mapping que analice el perfil de riesgo de integraciones de:

SISTEMA: {{NOMBRE_SISTEMA}}
INDUSTRIA / CONTEXTO REGULATORIO: {{INDUSTRIA}}
Ejemplo: "Banca (PCI-DSS, SOX)", "Seguros (Solvencia II)", "Salud (HIPAA)", "Retail", "Gobierno"

NÚMERO APROXIMADO DE INTEGRACIONES: {{NUM_INTEGRACIONES}}
Opciones: <10 | 10-20 | 20-50 | >50

PATRONES DE RESILIENCIA EXISTENTES: {{RESILIENCIA_ACTUAL}}
Seleccionar los que existen actualmente:
- [ ] Circuit breakers implementados
- [ ] Retry con backoff exponencial
- [ ] Dead letter queues
- [ ] Timeouts explícitos configurados
- [ ] Health checks / probes
- [ ] Ninguno de los anteriores

TIPO DE FALLO MÁS TEMIDO: {{TIPO_FALLO_CRITICO}}
Opciones: perdida-de-datos | indisponibilidad-prolongada | inconsistencia-eventual | degradacion-de-performance | violacion-regulatoria

NIVEL DE ANÁLISIS: {{NIVEL_ANALISIS}}
Opciones: top-10-fallos | analisis-exhaustivo | solo-integraciones-criticas

El prompt generado debe incluir la metodología FMEA adaptada al contexto regulatorio, criterios de scoring de probabilidad/impacto específicos a la industria, y recomendaciones de mejora priorizadas por ROI.
```

**Guía de uso:**
1. La `INDUSTRIA` es crítica: para banca el prompt incluirá validación de zero data loss; para retail el énfasis será en disponibilidad durante picos
2. Con `RESILIENCIA_ACTUAL` vacío, el prompt generado incluirá auditoría completa de ausencia de patrones de resiliencia
3. El `TIPO_FALLO_CRITICO` orienta el scoring de impacto: perdida-de-datos = impacto siempre Crítico; indisponibilidad = según SLA del negocio
4. Usar en conjunto con el análisis de AS-IS para alimentar con evidencia previa de incidentes

---

## Metaprompt 4: Generador de Prompts para Documentación de Flujos en Sistema Legacy

**Propósito:** Generar un prompt especializado para extraer y documentar flujos desde sistemas legacy (mainframe, COBOL, sistemas sin API, código spaghetti) donde la documentación es inexistente o engañosa.

**Plantilla:**

```
Genera un prompt para el skill flow-mapping adaptado a un sistema legacy con las siguientes características:

SISTEMA: {{NOMBRE_SISTEMA}}
TECNOLOGÍA LEGACY: {{TECNOLOGIA_LEGACY}}
Ejemplo: "COBOL/JCL en z/OS", "RPG AS/400", "PL/SQL Oracle con lógica de negocio en SP", "Java 6 con EJB 2.x", "PHP4 sin framework"

ESTADO DE DOCUMENTACIÓN: {{ESTADO_DOCS}}
Opciones: sin-documentacion | documentacion-desactualizada | documentacion-parcial | solo-comentarios-en-codigo

MECANISMOS DE EXTRACCIÓN DISPONIBLES: {{MECANISMOS_EXTRACCION}}
Seleccionar los que aplican:
- [ ] Acceso al código fuente completo
- [ ] Logs de producción / audit trail
- [ ] Expertos que conocen el sistema (brain-in-a-jar)
- [ ] Diagramas de JCL / batch scheduling
- [ ] Esquema de base de datos documentado
- [ ] Trazas de APM / debugger
- [ ] Ninguno — caja negra total

RIESGO DE INTERRUPCIÓN: {{RIESGO_INTERRUPCION}}
Opciones: critico-no-tocar | alto-precaucion | medio | bajo-puede-testear

OBJETIVO DEL MAPEO: {{OBJETIVO}}
Opciones: migracion-futura | coexistencia-con-nuevo-sistema | documentar-para-mantenimiento | analisis-pre-baja

El prompt generado debe incluir la estrategia de reverse engineering apropiada, protocolo de documentación de supuestos, niveles de confianza por evidencia, y recomendaciones de validación con stakeholders que conocen el sistema.
```

**Guía de uso:**
1. `TECNOLOGIA_LEGACY` determina los comandos de extracción sugeridos: COBOL → JCL parsing + COPY books; PL/SQL → stored procedures + triggers + DB links
2. Con `MECANISMOS_EXTRACCION` mayoritariamente vacíos, el prompt generado incluirá un plan de sesiones con expertos y protocolo de validación extendido
3. `RIESGO_DE_INTERRUPCION = critico-no-tocar` genera restricciones explícitas de solo lectura y prohibición de ejecución de código en el sistema
4. Para `OBJETIVO = migracion-futura`, el prompt incluirá identificación de "seams" de extracción y dependencias que bloquean la migración

---

## Metaprompt 5: Generador de Prompts para Revisión y Actualización de Flujos Existentes

**Propósito:** Generar un prompt para auditar flujos documentados previamente y actualizarlos con los cambios ocurridos en el sistema, manteniendo trazabilidad de los deltas.

**Plantilla:**

```
Genera un prompt para el skill flow-mapping que revise y actualice documentación de flujos existente.

CONTEXTO:
- Sistema: {{NOMBRE_SISTEMA}}
- Documentación existente: {{RUTA_O_DESCRIPCION_DOCS}}
  Ejemplo: "Confluence pages con swimlanes de 2023", "04_Mapeo_Flujos_v1.md del discovery anterior"
- Codebase actual: {{RUTA_CODEBASE}}
- Cambios conocidos desde la documentación anterior: {{CAMBIOS_CONOCIDOS}}
  Ejemplo: "Migramos de RabbitMQ a Kafka en Q3 2024", "Añadimos el módulo de pagos internacionales", "Refactorizamos el módulo de autenticación a OAuth 2.0"

ALCANCE DE LA REVISIÓN: {{ALCANCE_REVISION}}
Opciones: todos-los-flujos | solo-flujos-afectados-por-cambios | flujos-criticos-core-domain | flujo-especifico:[NOMBRE]

PROFUNDIDAD DE COMPARACIÓN: {{PROFUNDIDAD_COMPARACION}}
Opciones: diferencias-criticas-solo | diferencias-completas | re-documentar-desde-cero-con-referencia

FORMATO DE OUTPUT DE DELTA: {{FORMATO_DELTA}}
Opciones: documento-de-gaps | flujos-actualizados-con-cambios-marcados | ambos

VALIDACIÓN REQUERIDA: {{VALIDACION}}
Opciones: solo-codigo | codigo-mas-stakeholders | codigo-mas-tests-de-integracion

El prompt generado debe incluir la metodología de comparación (doc-to-code diff), el protocolo de clasificación de divergencias (Crítica/Importante/Menor), y el formato de delta documentation con trazabilidad de cambios.
```

**Guía de uso:**
1. `CAMBIOS_CONOCIDOS` es el input más valioso: permite al skill enfocar el análisis en los puntos de mayor probabilidad de divergencia
2. `ALCANCE_REVISION = flujos-criticos-core-domain` es el modo más eficiente cuando el tiempo es limitado — se enfoca en lo que más importa
3. `FORMATO_DELTA = ambos` produce el máximo valor: el documento de gaps identifica qué cambió, los flujos actualizados son el nuevo punto de partida
4. Para revisiones periódicas (ej. post-sprint o post-release), usar este metaprompt para crear un "prompt de mantenimiento" estándar del equipo que se ejecuta después de cada cambio significativo al sistema

---
**Autor:** Javier Montaño | **© Comunidad MetodologIA** | **Versión:** 1.0.0 | **Fecha:** Marzo 2026
