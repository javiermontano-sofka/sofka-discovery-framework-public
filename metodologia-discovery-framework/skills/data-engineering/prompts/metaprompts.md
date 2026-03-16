# Metaprompts — Data Engineering

> **Skill:** metodologia-data-engineering
> **Autor:** Javier Montaño | **Fecha:** 13 de marzo de 2026
> **Licencia:** (c) Comunidad MetodologIA — MIT

---

## Instrucciones de Uso

Los metaprompts son estrategias generativas de nivel superior. No producen entregables directamente — generan prompts adaptados al contexto específico del proyecto. Úsalos cuando el contexto es ambiguo, el alcance es amplio, o se necesita personalización antes de invocar un use-case prompt.

---

## Metaprompt 1: Diagnóstico de Madurez de Plataforma de Datos

**Propósito:** Evaluar el estado actual de la plataforma de datos del cliente y generar un plan de acción priorizado.

```
Actúa como un data platform consultant senior evaluando la madurez de la plataforma de datos de {NOMBRE_CLIENTE}.

Paso 1 — Recopila información sobre las siguientes dimensiones:
  a) Ingesta: ¿Cómo llegan los datos? ¿Batch, CDC, streaming, manual?
  b) Orchestration: ¿Hay orquestador? ¿Cron jobs, Airflow, custom scripts?
  c) Storage: ¿Data lake, warehouse, ambos? ¿Formato de archivos?
  d) Quality: ¿Existen validaciones? ¿Automatizadas o manuales?
  e) Observability: ¿Hay lineage? ¿Alertas de pipeline? ¿Métricas de freshness?
  f) Team: ¿Cuántos data engineers? ¿Qué skills tienen?

Paso 2 — Clasifica cada dimensión en nivel de madurez:
  - Nivel 1 (Ad-hoc): Sin procesos, manual, reactivo
  - Nivel 2 (Repetible): Algunos procesos, parcialmente automatizado
  - Nivel 3 (Definido): Procesos documentados, herramientas seleccionadas
  - Nivel 4 (Gestionado): Métricas, SLAs, observabilidad
  - Nivel 5 (Optimizado): Self-healing, AI-augmented, platform-as-a-product

Paso 3 — Genera un radar chart (Mermaid) con las 6 dimensiones.

Paso 4 — Produce 3 prompts específicos del catálogo de use-case-prompts.md, adaptados a las dimensiones con menor madurez, con los valores de contexto pre-llenados.

Formato de salida: Markdown con tabla de madurez, radar chart, y prompts generados listos para ejecutar.
```

---

## Metaprompt 2: Selección de Stack de Data Engineering

**Propósito:** Guiar la selección de herramientas para una plataforma de datos nueva o en migración, considerando constraints del cliente.

```
Actúa como un data engineering architect evaluando opciones de stack tecnológico para {NOMBRE_PROYECTO}.

Paso 1 — Identifica los constraints:
  a) Cloud provider: {AWS | GCP | Azure | multi-cloud | on-premise}
  b) Presupuesto: {bajo (<$5K/mes) | medio ($5-50K/mes) | alto (>$50K/mes)}
  c) Equipo: {tamaño y skills — ej: 3 data engineers con experiencia en Python/SQL}
  d) Volumen: {GB/día o TB total}
  e) Latencia: {batch-ok | near-real-time | real-time}
  f) Compliance: {ninguno | GDPR | HIPAA | PCI-DSS | SOC2}

Paso 2 — Evalúa opciones para cada componente:
  - Ingesta: {Fivetran vs Airbyte vs custom vs CDC tool}
  - Orchestration: {Airflow vs Dagster vs Prefect vs managed}
  - Transform: {dbt vs Spark vs SQL nativo}
  - Storage: {Iceberg vs Delta vs warehouse nativo}
  - Quality: {Great Expectations vs Soda vs Elementary vs Monte Carlo}
  - Observability: {OpenLineage+Marquez vs DataHub vs Atlan vs platform-native}

Paso 3 — Produce una tabla de decisión con scores (1-5) por criterio:
  - Fit con constraints del equipo
  - Costo total de ownership (magnitudes)
  - Curva de aprendizaje
  - Comunidad y soporte
  - Escalabilidad a 3 años

Paso 4 — Genera el stack recomendado con justificación y 2 alternativas.

Paso 5 — Produce el prompt de use-case correspondiente (del catálogo) con el stack seleccionado ya incorporado en el contexto.

Formato: Markdown con matrices de decisión, stack diagram (Mermaid), y prompt generado.
```

---

## Metaprompt 3: Descomposición de Proyecto de Data Engineering

**Propósito:** Tomar un requerimiento de alto nivel y descomponerlo en workstreams ejecutables con prompts específicos por fase.

```
Actúa como un delivery manager de data engineering descomponiendo el proyecto {NOMBRE_PROYECTO}.

Paso 1 — Analiza el requerimiento de alto nivel:
  "{REQUERIMIENTO}" (ej: "Necesitamos consolidar datos de 5 sistemas en un data warehouse para analytics")

Paso 2 — Identifica los workstreams necesarios:
  - ¿Se necesita diseño de ingesta? → Prompt 1 o 2
  - ¿Se necesita diseño de storage? → Prompt 3
  - ¿Se necesita optimización de pipelines existentes? → Prompt 4
  - ¿Se necesita migración de legacy? → Prompt 5
  - ¿Se necesita framework de calidad? → Prompt 6
  - ¿Se necesita observabilidad? → Prompt 7

Paso 3 — Ordena los workstreams por dependencia:
  Fase 1: {workstreams sin dependencias — pueden ejecutarse en paralelo}
  Fase 2: {workstreams que dependen de Fase 1}
  Fase 3: {workstreams de optimización y madurez}

Paso 4 — Para cada workstream, genera el prompt del catálogo con:
  - Contexto pre-llenado basado en el requerimiento
  - {MODO_OPERACIONAL} apropiado
  - Dependencias explícitas con otros workstreams

Paso 5 — Produce un Gantt chart (Mermaid) con el roadmap de ejecución.

Formato: Markdown con workstream table, prompts secuenciados, y diagrama Gantt.
```

---

## Metaprompt 4: Auditoría de Pipeline Existente

**Propósito:** Analizar un pipeline de datos existente para identificar riesgos, deuda técnica y oportunidades de mejora.

```
Actúa como un data engineering auditor revisando los pipelines de {NOMBRE_SISTEMA}.

Paso 1 — Escanea el código fuente del proyecto:
  !find . -name "*.py" -o -name "*.sql" -o -name "*.yaml" -o -name "*.yml" | head -50
  Identifica: orquestador, lenguajes, frameworks, configuraciones.

Paso 2 — Evalúa cada dimensión contra las best practices del skill:
  a) Idempotencia: ¿Los pipelines son re-ejecutables sin duplicar datos?
  b) Schema evolution: ¿Hay schema registry o validación de schemas?
  c) Data contracts: ¿Existen contratos entre productores y consumidores?
  d) Error handling: ¿Hay retry policies, DLQ, alerting?
  e) Quality checks: ¿Validaciones en pipeline o solo post-hoc?
  f) Lineage: ¿Se puede trazar un dato desde fuente hasta consumidor?
  g) Cost efficiency: ¿Compute apropiado para la carga? ¿Spot instances?

Paso 3 — Clasifica hallazgos:
  - Riesgo Crítico: puede causar pérdida de datos o incumplimiento de SLA
  - Deuda Técnica: funciona pero es frágil o costoso
  - Oportunidad: mejora que aporta valor sin urgencia

Paso 4 — Genera prompts de remediación del catálogo, priorizados por riesgo.

Formato: Tabla de hallazgos con severidad, prompts de remediación, y estimación de esfuerzo (magnitudes en FTE-semanas).
```

---

## Metaprompt 5: Diseño de Data Platform Self-Service

**Propósito:** Diseñar una plataforma de datos que permita a equipos de dominio construir y operar sus propios pipelines con guardrails centralizados.

```
Actúa como un platform engineer diseñando la capa de self-service para la plataforma de datos de {NOMBRE_ORGANIZACION}.

Paso 1 — Identifica los perfiles de usuario:
  a) Data engineers: construyen pipelines complejos, necesitan acceso a compute y storage
  b) Analytics engineers: usan dbt, necesitan acceso a datos curados y warehouse
  c) Data scientists: necesitan feature stores, notebooks, acceso a datos raw
  d) Business analysts: necesitan acceso a marts y herramientas BI

Paso 2 — Diseña las capas de la plataforma:
  - Infrastructure layer: compute, storage, networking (gestionado por platform team)
  - Data platform layer: ingesta, orchestration, quality, catalog (templates + guardrails)
  - Self-service layer: interfaces, templates, documentación, onboarding

Paso 3 — Define los guardrails:
  - Naming conventions obligatorias
  - Quality checks mínimos por zona
  - Cost limits por equipo/proyecto
  - Access control (RBAC + row-level security)
  - Schema registry enforcement

Paso 4 — Genera prompts del catálogo para cada capa, con contexto de self-service.

Formato: Arquitectura de plataforma (Mermaid), tabla de guardrails, y prompts de implementación.
```

---

**Autor:** Javier Montaño | **Fecha:** 13 de marzo de 2026
**(c) Comunidad MetodologIA — MIT**
