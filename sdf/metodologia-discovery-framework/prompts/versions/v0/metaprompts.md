# Metaprompts — MetodologIA Discovery Framework

> Generadores de prompts personalizados. Usar cuando los prompts estándar no cubren el caso de uso exacto.
> Cada metaprompt produce un prompt ejecutable — no un entregable directo.
> El output siempre sigue el formato spec: comando + descripción + criterios + params + inputs.

---

## 1. Generador de Prompt por Engagement

**Propósito:** Crear un prompt de discovery personalizado para un engagement específico. Considera industria, tipo de servicio, objetivo comercial y restricciones del cliente.

**Cuándo:** El engagement no encaja limpiamente en ningún flujo predefinido — necesita configuración custom del pipeline, comité de expertos y priming de dominio.
**Caso borde:** Si el engagement es multi-servicio, el prompt generado debe incluir TIPO_SERVICIO=Multi-Service y explicitar la interacción entre dominios.

```
Necesito un prompt de discovery optimizado para un engagement específico.

Cliente: {CLIENTE} — nombre o pseudónimo del cliente
Industria: {INDUSTRIA} — sector (banking, retail, health, SaaS, manufacturing, gov, energy, telecom)
Tipo de servicio: {TIPO_SERVICIO} — SDA|QA|RPA|Data-AI|Cloud|SAS|Management|UX-Design|Digital-Transformation
Objetivo del engagement: {OBJETIVO} — qué se busca lograr (modernización, migración, assessment, etc.)

Generar un prompt ejecutable que:
1. Active el pipeline adecuado (completo/intermedio/express) según complejidad del objetivo
2. Configure el comité de expertos con especialistas relevantes para {INDUSTRIA}
3. Ajuste params (MODO, FORMATO, VARIANTE, PROFUNDIDAD) para máxima relevancia
4. Incluya context priming específico del sector (regulaciones, métricas clave, vocabulario)
5. Defina criterios de aceptación alineados al {OBJETIVO}

Formato del output: prompt compacto tipo spec, <15 líneas, params al final.
```

---

## 2. Generador de Prompt por Entregable Custom

**Propósito:** Crear un prompt para un entregable que no existe en el pipeline estándar (00–14). Reutiliza skills del SDF pero con estructura de output personalizada.

**Cuándo:** El cliente necesita un deliverable específico: comparative analysis, vendor assessment, migration playbook, training plan, etc. — algo fuera del catálogo estándar.
**Límite:** El entregable custom debe poder generarse con los skills existentes del SDF. Si requiere capacidades fuera del framework, el metaprompt debe señalarlo.

```
Necesito un prompt para generar un entregable custom fuera del pipeline estándar.

Entregable: {NOMBRE_ENTREGABLE} — nombre descriptivo del deliverable
Audiencia: {AUDIENCIA} — quién lo consume (C-level, dev team, PMs, external stakeholders)
Secciones requeridas: {SECCIONES} — lista de secciones esperadas en el output
Inputs disponibles: {INPUTS} — qué información/entregables previos están disponibles
Restricciones: {RESTRICCIONES} — formato, longitud, idioma, confidencialidad, deadlines

Generar un prompt ejecutable que:
1. Active los skills del SDF necesarios para producir {NOMBRE_ENTREGABLE}
2. Adapte el lenguaje y profundidad a {AUDIENCIA}
3. Estructure el output según {SECCIONES}
4. Consuma {INPUTS} como fuente de evidencia
5. Respete {RESTRICCIONES} como hard constraints
6. Incluya criterios de aceptación verificables

Formato del output: prompt compacto tipo spec, <15 líneas, params al final.
```

---

## 3. Generador de Prompt de Recovery

**Propósito:** Crear un prompt para rescatar o pivotar un discovery en curso que se desvió del plan original — por cambio de alcance, pérdida de contexto, o fallo técnico.

**Cuándo:** rescue-stalled no es suficiente porque el problema no es de ejecución sino de dirección — el discovery necesita un pivot estratégico, no una reparación.
**Caso borde:** Si los entregables completados tienen calidad aceptable pero el objetivo cambió, el prompt de recovery debe preservarlos y redirigir los faltantes al nuevo objetivo.

```
Discovery en curso necesita intervención estratégica (no solo reparación).

Estado actual: {ESTADO} — descripción del estado (estancado, desviado, pivoteando)
Entregables completados: {ENTREGABLES_OK} — lista de entregables con calidad aceptable
Entregables faltantes: {ENTREGABLES_FALTANTES} — lo que aún no se ha generado
Problema: {PROBLEMA} — qué falló o cambió (alcance, requisitos, stakeholders, prioridades)
Restricción de tiempo: {DEADLINE} — fecha límite o sesiones disponibles

Generar un prompt de recovery que:
1. Diagnostique si los entregables existentes son reutilizables bajo el nuevo contexto
2. Triage prioridades: qué es crítico vs nice-to-have dado {DEADLINE}
3. Proponga ruta crítica para completar con mínimo esfuerzo y máximo valor
4. Mantenga consistencia cruzada con entregables existentes (no contradecirlos)
5. Documente el pivot: qué cambió, por qué, y qué impacto tiene en el discovery

Formato del output: prompt compacto tipo spec, <15 líneas, params al final.
```

---

## 4. Generador de Prompt Multi-Discovery

**Propósito:** Coordinar múltiples discoveries en paralelo para un portafolio de proyectos. Identifica sinergias y produce una vista consolidada.

**Cuándo:** El cliente tiene múltiples sistemas/proyectos que necesitan discovery simultáneo — la ventaja es descubrir patrones cruzados, reutilización y dependencias ocultas.
**Límite:** Cada discovery individual sigue el pipeline estándar; este metaprompt agrega la capa de coordinación, no reemplaza la ejecución individual.
**Trade-off:** Más contexto compartido = mejores sinergias, pero mayor complejidad de orquestación y riesgo de contaminación cruzada entre hallazgos.

```
Necesito coordinar discoveries paralelos para un portafolio de proyectos.

Proyectos: {LISTA_PROYECTOS} — nombre + breve descripción de cada proyecto
Tipo de servicio dominante: {TIPO_SERVICIO} — SDA|QA|RPA|Data-AI|Cloud|Multi-Service
Recursos compartidos: {RECURSOS} — qué se comparte entre proyectos (infra, datos, equipos, vendors)
Timeline: {TIMELINE} — ventana de tiempo para completar todos los discoveries

Generar un prompt que:
1. Ejecute discoveries individuales en paralelo (un sub-pipeline por proyecto)
2. Identifique sinergias cross-proyecto (componentes reutilizables, patrones comunes)
3. Detecte dependencias ocultas entre proyectos (datos, APIs, equipos, infraestructura)
4. Consolide hallazgos en un portfolio view (executive summary + heat map)
5. Optimice asignación de expertos del comité entre los discoveries
6. Proponga secuenciación de ejecución post-discovery (qué proyecto primero y por qué)

Formato del output: prompt compacto tipo spec, <15 líneas, params al final.
```

---

## 5. Generador de Prompt por Service Type

**Propósito:** Crear un prompt de discovery optimizado para un tipo de servicio específico de MetodologIA — con priming de dominio, métricas especializadas y comité ajustado.

**Cuándo:** Sabes el tipo de servicio pero necesitas un prompt más específico que el flujo genérico "por tipo de servicio" (flujo 8). Este metaprompt genera prompts con priming más profundo del dominio.
**Caso borde:** Si el tipo de servicio es nuevo o no está en la lista estándar, el metaprompt debe pedir al usuario que describa las características del servicio para inferir la configuración.

```
Necesito un prompt de discovery especializado para el servicio {TIPO_SERVICIO}.

Contexto del cliente: {CONTEXTO} — industria, tamaño, madurez tecnológica, dolor principal
Assessment requerido: {ASSESSMENT} — qué se necesita evaluar (arquitectura, datos, cloud, seguridad, UX)
Entregables esperados: {ENTREGABLES} — cuáles entregables son prioritarios para este engagement

Generar un prompt ejecutable que:
1. Active el service discovery con priming-RAG especializado para {TIPO_SERVICIO}
2. Configure el comité de expertos con los roles más relevantes al dominio
3. Ajuste métricas de evaluación a las específicas del servicio
   (ej: DORA para Cloud, OWASP para Security, Core Web Vitals para UX)
4. Priorice los {ENTREGABLES} solicitados en el pipeline
5. Incluya vocabulario y marcos de referencia del dominio
6. Defina criterios de aceptación específicos al tipo de servicio

Formato del output: prompt compacto tipo spec, <15 líneas, params al final.
```
