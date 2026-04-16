# Priming-RAG: Politica de Adjuntos
> MetodologIA Discovery Framework — Comportamiento automatico para nuevos adjuntos
> Procesado: 2026-03-14 | Version: v12.0.0
> Tipo: Documento de politica (policy)
> Valor: Comportamiento automatico ante adjuntos nuevos en sesiones de discovery

---

## Fuentes

Documento de politica interna. Define el comportamiento automatico del framework cuando se recibe un nuevo adjunto (archivo, documento, imagen, enlace, o cualquier input externo).

---

## Valor para discovery y RAG

Esta politica garantiza que todo nuevo input se procese, indexe e incorpore al conocimiento del discovery de forma sistematica. Elimina la posibilidad de que un adjunto se pierda o quede sin procesar, y mantiene la base de conocimiento RAG actualizada.

---

## Principio rector

> Todo adjunto recibido durante un discovery debe ser procesado, extractado, indexado e incorporado al rail de discovery activo. Ningun input puede quedar sin procesar.

---

## Flujo automatico de procesamiento

### Paso 1: Lectura e interpretacion

**Responsable:** discovery-conductor (delega a agente especializado segun tipo)

| Tipo de adjunto | Agente delegado | Accion |
|-----------------|-----------------|--------|
| Codigo fuente (.py, .js, .java, etc.) | technical-architect | Analisis de estructura, dependencias, patrones |
| Documentacion (.md, .docx, .pdf) | domain-analyst | Extraccion de requerimientos, reglas, contexto |
| Datos (.csv, .xlsx, .json) | data-strategist | Profiling, schema, calidad, volumen |
| Diagramas (.png, .svg, .drawio) | technical-architect | Interpretacion visual, extraccion de componentes |
| Configuracion (.yml, .env, .toml) | technical-architect | Inventario de servicios, variables, entornos |
| Presentaciones (.pptx) | domain-analyst | Extraccion de narrativa, objetivos, metricas |
| Contratos/legal | compliance-analyst | Clausulas relevantes, restricciones, SLAs |
| URLs/enlaces | research-scientist | Fetch, resumen, relevancia para el discovery |
| Imagenes/screenshots | ux-researcher | Interpretacion de UI, estado actual, patrones |
| Audio/transcripciones | domain-analyst | Extraccion de insights, decisiones, stakeholders |
| Spec tecnica | domain-analyst + technical-architect | Analisis funcional y tecnico |
| Org chart | business-analyst | Estructura organizacional, stakeholders |
| Presupuesto | economics-researcher | Restricciones financieras, sizing |
| Email/chat | domain-analyst | Contexto, decisiones, expectativas |

### Paso 2: Creacion de extracto Markdown

**Formato estandar del extracto:**

```markdown
# Extracto: {nombre_archivo}
> Fuente: {ruta_o_url} | Tipo: {formato} | Procesado: {fecha} | Clasificacion: {categoria}
> Agente procesador: {agente} | Confiabilidad: {alta|media|baja}

## Resumen ejecutivo
{3-5 oraciones con lo mas relevante}

## Transcripcion / Extracto
{Contenido fiel o extraccion estructurada}

## Contenido clave
{Puntos principales del adjunto}

## Relevancia para el discovery
{Como este adjunto impacta el discovery en curso}

## Vinculacion
Alimenta: {entregables destino}

## Tags de evidencia
{Tags aplicables: [CODIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO]}

## Key Takeaways
- {punto 1}
- {punto 2}
- {punto 3}

## Keywords
{keywords relevantes}

## Metadata
- Archivo original: {nombre}
- Tamano: {tamano}
- Fecha de procesamiento: {fecha}
- Agente procesador: {agente}
- Confiabilidad: {alta|media|baja}
```

**Ubicacion del extracto:** `output/extractos/{nombre_archivo}_extracto.md`
**Alternativa (sesion):** `discovery/rag-priming/priming-rag-adjunto-{nombre}.md`

### Paso 3: Clasificacion y vinculacion

**Tabla de clasificacion por tipo -> entregable destino:**

| Tipo de adjunto | Clasificacion | Entregable destino |
|-----------------|---------------|-------------------|
| Spec tecnica | funcional | 03 AS-IS, 04 Flujos, 07 Spec |
| Org chart | stakeholders | 01 Stakeholder Map |
| Presupuesto | roadmap | 06 Roadmap, 08 Pitch |
| Contrato | restricciones | 00 Plan, 13 Revision Negocio |
| Arquitectura | arquitectura | 03 AS-IS, 11 Hallazgos Tecnicos |
| Datos/DB | datos | Data Landscape assessment |
| Meeting notes | contexto | 00 Plan, 02 Brief |
| Email/chat | contexto | 00 Plan, 01 Stakeholders |
| Codigo fuente | codigo | 03 AS-IS, 04 Flujos |
| Imagen/diagrama | visual | Transcribir y clasificar |

**Reglas de asignacion a RAG docs:**

| Tipo de adjunto | RAG Doc destino | Accion |
|-----------------|-----------------|--------|
| Informacion corporativa MetodologIA | priming-rag-metodologia-corporate.md | Actualizar |
| Capacidades de servicio | priming-rag-{servicio}-capabilities.md | Actualizar o crear |
| Informacion de industria | priming-rag-{industria}-industry.md | Actualizar o crear |
| Documentacion tecnica del cliente | priming-rag-client-context.md | Crear por discovery |
| Metodologias/frameworks | priming-rag-{framework}.md | Crear |
| Metricas/KPIs | priming-rag-impact-metrics.md | Actualizar |
| Modelos contractuales | priming-rag-contractual-models.md | Actualizar |

**Si no existe un RAG doc adecuado**, crear uno nuevo siguiendo la convencion:
- Nombre: `priming-rag-{tema-descriptivo}.md`
- Ubicacion: `$SDF/references/priming-rag/`
- Estructura: fuentes, valor, takeaways, keywords, query hooks

### Paso 4: Indexacion

**Actualizar:**
1. El session-state con la nueva entrada
2. El master-index.md (seccion References) si el RAG doc es persistente
3. Vincular con fuente original
4. Registrar en changelog de la sesion
5. Mantener conteos totales actualizados

### Paso 5: Incorporacion al rail de discovery

**El conductor debe:**
1. Evaluar si el adjunto impacta entregables ya generados
2. Si impacta: marcar entregables afectados para revision
3. Incorporar la nueva informacion en el proximo entregable del pipeline
4. Actualizar el grafo de evidencia con las nuevas fuentes
5. Si el adjunto introduce un nuevo stakeholder: actualizar el stakeholder map
6. Los agentes consultan el extracto como RAG-priming con cross-reference en entregables

---

## Gobernanza y orquestacion

### discovery-conductor como lider del comite permanente

El discovery-conductor es el unico agente autorizado para:
1. **Detectar** adjuntos nuevos al inicio de cada interaccion
2. **Clasificar** el tipo y delegar al agente especializado
3. **Verificar** la calidad del extracto (formato, completitud)
4. **Decidir** el RAG doc destino
5. **Ordenar** la indexacion y vinculacion
6. **Evaluar** el impacto en el pipeline
7. **Notificar** si un adjunto contradice informacion previa
8. **Mantener** consistencia de formato en todos los extractos

### Protocolo de delegacion

```
ADJUNTO RECIBIDO
  |
  v
[conductor] --> Clasifica tipo y formato
  |
  v
[conductor] --> Delega a agente especializado
  |
  v
[agente] --> Procesa y genera extracto (Paso 2)
  |
  v
[conductor] --> Revisa extracto, calidad OK?
  |               |
  | NO            | SI
  v               v
[agente]      [conductor] --> Clasifica y vincula (Paso 3)
(rehacer)         |
                  v
              [conductor] --> Indexa (Paso 4)
                  |
                  v
              [conductor] --> Incorpora al pipeline (Paso 5)
```

---

## Evidence tagging

| Tag | Significado | Cuando usar |
|-----|-------------|-------------|
| [DOC] | Fuente formal (spec, contrato, org chart) | Documento oficial del cliente |
| [CODIGO] | Evidencia del codebase | Archivos de codigo, config, deps |
| [CONFIG] | Archivos de configuracion | .yml, .env, .toml, .json config |
| [STAKEHOLDER] | Comunicacion de stakeholder | Emails, meeting notes, chats |
| [INFERENCIA] | Extracto requiere interpretacion | Conclusion derivada de evidencia |
| [SUPUESTO] | Adjunto incompleto o ambiguo | Suposicion no verificada |
| [CONFLICTO] | Contradice informacion existente | Datos que contradicen fuentes previas |
| [REDACTADO] | Informacion sensible omitida | Credenciales, tokens, datos personales |

---

## Reglas de calidad del extracto

1. **Resumen ejecutivo** obligatorio (3-5 oraciones)
2. **Tags de evidencia** obligatorios en cada afirmacion
3. **Relevancia para el discovery** obligatoria (sin este campo, el extracto es invalido)
4. **Vinculacion** a entregables destino obligatoria
5. **Confiabilidad** evaluada: alta (fuente primaria), media (fuente secundaria), baja (no verificada)
6. **Fecha de procesamiento** siempre incluida
7. **Tamano maximo** del extracto: 500 lineas. Si el adjunto es mas largo, dividir en multiples extractos

---

## Manejo de tipos especiales

### Archivos grandes (>1MB de texto)
- Dividir en secciones logicas
- Generar un extracto maestro + extractos por seccion
- El extracto maestro referencia los parciales

### Adjuntos multiples simultaneos
- Procesar en paralelo cuando los adjuntos son independientes
- Procesar secuencialmente cuando hay dependencias entre adjuntos
- El conductor decide el orden basado en relevancia

### Adjuntos que contradicen informacion existente
- Marcar la contradiccion explicitamente en el extracto
- Tag: [CONFLICTO] con referencia a la fuente que contradice
- El conductor decide cual fuente prevalece y documenta la decision

### Adjuntos confidenciales
- NUNCA incluir credenciales, tokens, o secretos en extractos
- Redactar (***) datos sensibles
- Tag: [REDACTADO] donde se omite informacion sensible

---

## Triggers automaticos

| Evento | Accion automatica |
|--------|-------------------|
| Usuario comparte archivo | Iniciar flujo de 5 pasos |
| Usuario pega URL | Fetch + flujo de 5 pasos |
| Usuario referencia documento | Buscar en references/, si no existe solicitar |
| Discovery nuevo inicia | Escanear inputs disponibles, generar extractos |
| Discovery se reanuda | Verificar si hay nuevos adjuntos sin procesar |

---

## Convencion de naming

| Patron | Ejemplo |
|--------|---------|
| `{nombre_original}_extracto.md` | `architecture_overview_extracto.md` |
| `{url_slug}_extracto.md` | `github_com_repo_extracto.md` |
| `{fecha}_{tipo}_{seq}_extracto.md` | `2026-03-14_presentacion_01_extracto.md` |
| `priming-rag-adjunto-{nombre}.md` | `priming-rag-adjunto-contrato-sas.md` |

---

## Key takeaways

1. Todo adjunto se procesa automaticamente en 5 pasos: leer, extractar, clasificar, indexar, incorporar
2. El discovery-conductor es el unico responsable de orquestacion
3. Cada tipo de adjunto tiene un agente especializado asignado
4. Los extractos siguen un formato estandar con metadata obligatoria
5. Los conflictos entre fuentes se documentan con tag [CONFLICTO]
6. La informacion sensible se redacta con tag [REDACTADO], nunca se incluye
7. La vinculacion a entregables destino es obligatoria

---

## Keywords y hashtags

`#adjuntos` `#politica` `#procesamiento` `#extractos` `#indexacion` `#rag` `#conductor` `#delegacion` `#evidencia` `#confidencialidad` `#conflictos` `#trazabilidad` `#gobernanza` `#comite-permanente`

---

## Query hooks

- "Como se procesa un adjunto nuevo?" -> Flujo automatico de 5 pasos
- "Quien decide donde va el extracto?" -> discovery-conductor
- "Que pasa si hay informacion contradictoria?" -> Tag [CONFLICTO], conductor decide
- "Donde se guardan los extractos?" -> output/extractos/ o discovery/rag-priming/
- "Que formato tiene un extracto?" -> Formato estandar con 8 secciones
- "Puedo incluir credenciales en extractos?" -> NUNCA, usar [REDACTADO]
- "Que tags de evidencia hay?" -> [DOC] [CODIGO] [CONFIG] [STAKEHOLDER] [INFERENCIA] [SUPUESTO] [CONFLICTO] [REDACTADO]
