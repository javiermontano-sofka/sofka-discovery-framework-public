# Metaprompts — Analytics Engineering

> Meta-level strategies to maximize the effectiveness of this skill.
> Metaprompts don't produce deliverables — they optimize HOW they are produced.

---

## 1. Layer-First Thinking

**Purpose:** Ensure that every analytics engineering design starts with the layer architecture (staging → intermediate → marts), not with individual models. Avoid the mistake of designing models without layer context.

```
Antes de diseñar CUALQUIER modelo individual, establece la arquitectura
de capas completa:

1. INVENTARIO DE FUENTES
   - ¿Cuantas fuentes existen? ¿Que tipo son? (DB, API, SaaS, files)
   - ¿Cada fuente tiene un staging model 1:1?
   - ¿Los staging models SOLO usan source(), nunca ref() de otros stages?
   - SI hay fuentes sin staging model → CORREGIR antes de avanzar.
     NUNCA referenciar raw tables desde marts.

2. DEFINICION DE CAPAS
   - ¿Cuantas capas necesita este proyecto?
     - Minimo: staging + marts (equipos pequeños, <20 modelos)
     - Standard: staging + intermediate + marts (default para la mayoria)
     - Completo: staging + intermediate + marts + metrics layer
   - ¿Cada capa tiene naming convention enforced? (stg_, int_, fct_, dim_)
   - ¿Cada capa tiene materialization default? (staging: view; intermediate:
     ephemeral/view; marts: table/incremental)

3. GRAIN EXPLICITO
   - Para CADA modelo mart: ¿cual es el grain? (que representa cada fila)
   - ¿El grain esta documentado en el YAML description?
   - ¿El grain es testeable? (unique test en las columnas que definen el grain)
   - SI el grain no es claro → NO avanzar con el modelo. El grain ambiguo es
     la causa #1 de errores en analytics.

4. DIRECCION DEL FLUJO
   - ¿El flujo de datos es unidireccional? (source → staging → intermediate → mart)
   - ¿Hay referencias circulares o "upstream" (mart referenciando staging)?
   - ¿Los intermediate models simplifican marts o duplican logica?
   - REGLA: Si un modelo intermedio se usa en solo 1 mart, probablemente
     no necesita existir. Extraer cuando se usa en 3+ marts.

5. VALIDACION
   - ¿Puedo trazar lineage de cada mart model hasta sus sources?
   - ¿El DAG es legible? (no mas de 4 niveles de profundidad para el caso comun)
   - ¿Los nombres de modelos revelan su proposito sin leer el SQL?
```

---

## 2. Test-Driven Modeling

**Purpose:** Invert the order: define tests BEFORE writing the model. The test defines the expectation; the model implements it. Avoid the "model first, tests later (or never)" pattern.

```
Para cada modelo nuevo, sigue este orden estricto:

PASO 1 — DEFINE EL CONTRATO (antes de escribir SQL)
- ¿Cual es el grain? → unique test
- ¿Que columnas nunca deben ser null? → not_null tests
- ¿Que columnas tienen valores aceptados? → accepted_values tests
- ¿Que columnas son foreign keys? → relationships tests
- ¿Hay reglas de negocio invariantes? → custom data tests

Escribe el schema.yml con tests ANTES de escribir el modelo SQL.

PASO 2 — ESCRIBE EL MODELO
- El SQL debe satisfacer los tests definidos en Paso 1
- Si no puedes satisfacer un test, cuestiona el test O el diseño del modelo
- NUNCA elimines un test para que el modelo "pase"

PASO 3 — EJECUTA Y VALIDA
- dbt build --select modelo+ (modelo y sus tests)
- TODOS los tests deben pasar antes de merge
- Si un test falla, es un BUG en el modelo, no en el test
  (a menos que el test este mal definido — revisar Paso 1)

PASO 4 — AGREGA TESTS DE NEGOCIO (post-modelo)
- Una vez que el modelo funciona, agrega custom tests para reglas no
  capturables con schema tests:
  - "El revenue total de ayer no deberia diferir >5% del dia anterior"
  - "No deberia haber order_amount negativo sin motivo de refund"
  - "El count de registros no deberia caer >20% vs el dia anterior"

PRINCIPIO: Un modelo sin tests es una opinion con formato de tabla.
No es un modelo analitico — es un query guardado.
```

---

## 3. Cost-Aware Development

**Purpose:** Integrate cost awareness from the start of development, not as a later optimization. Every materialization decision, incremental strategy, and warehouse sizing has direct cost impact.

```
En cada decision de diseño, evalua el impacto en costo ANTES de implementar:

1. MATERIALIZATION
   - view: costo = $0 (computo solo cuando se consulta)
   - table: costo = rebuild completo en cada run
   - incremental: costo = solo filas nuevas/modificadas
   - ephemeral: costo = $0 (inline CTE, no persiste)

   REGLA: Empieza con view. Cambia a table cuando el query es lento.
   Cambia a incremental cuando table es costoso y la tabla crece.
   NUNCA empieces con incremental "por si acaso".

2. QUERY TAGGING
   - ¿Cada modelo tiene query_tag en profiles.yml?
   - ¿Puedes atribuir costo a modelo individual?
   - SI NO puedes medir → NO puedes optimizar.
   - Implementar query tagging ANTES de optimizar.

3. WAREHOUSE SIZING
   - ¿Transformaciones pesadas en warehouse dedicado?
   - ¿Ad-hoc queries en warehouse separado con auto-suspend?
   - ¿Auto-scaling configurado con limites de costo?

   REGLA: Un warehouse XL corriendo 24/7 para dbt runs que duran 30
   minutos es desperdicio. Size down + auto-suspend agresivo.

4. INCREMENTAL VS FULL REFRESH (decision de costo)
   - Calcular: costo_full_refresh × runs_por_mes = costo_mensual_full
   - Calcular: costo_incremental × runs_por_mes = costo_mensual_incremental
   - SI costo_full < $50/mes → no justifica complejidad de incremental
   - SI costo_full > $500/mes → incremental probablemente justificado
   - ZONA GRIS ($50-$500): evaluar complejidad del equipo

5. CLUSTERING / PARTITIONING
   - ¿Las columnas de WHERE/JOIN mas frecuentes estan en cluster keys?
   - ¿Las tablas >1B filas tienen partitioning por fecha?
   - REGLA: Medir scan volume ANTES y DESPUES del clustering.
     Si no reduce >50%, el clustering no esta bien seleccionado.
```

---

## 4. Documentation as Delivery

**Purpose:** Treat documentation as an integral part of delivery, not as a separate task. A model without documentation is not finished.

```
Aplica esta regla en CADA modelo entregado:

DEFINITION OF DONE para un modelo analitico:
□ SQL escrito y funcional
□ Tests definidos y pasando (schema + custom si aplica)
□ Description del modelo en YAML (que hace, para quien, grain)
□ Columns clave documentadas (business meaning, no solo tipo SQL)
□ Owner asignado (equipo + contacto)
□ Exposures actualizadas (si alimenta un dashboard o ML pipeline)
□ Lineage verificada (source → staging → intermediate → mart trazable)
□ PR review completado

SI FALTA CUALQUIERA DE ESTOS → el modelo NO esta terminado.

ESTRATEGIA PARA DOCUMENTACION RETROACTIVA:
1. Priorizar mart models (son los que consumen los usuarios)
2. Para cada mart, documentar en este orden:
   a. Model description (1-2 oraciones: que es, grain, owner)
   b. Primary key columns (descripcion + tests)
   c. Measure columns (formula, unidad, reglas de negocio)
   d. Foreign key columns (a que dimension apuntan)
   e. El resto de columnas
3. Usar AI para generar drafts de documentacion de columnas
4. Revisar y refinar manualmente (AI accuracy ~80%)
5. Target: 100% de marts documentados en 4 sprints

ANTI-PATRON: "Lo documentamos despues"
- "Despues" nunca llega
- Los modelos sin docs se convierten en cajas negras
- Nuevos team members no pueden contribuir sin docs
- El bus factor es 1 (la persona que escribio el modelo)
```

---

## 5. Incremental Confidence

**Purpose:** Build confidence in incremental models through continuous validation. Incrementals are more efficient but more fragile — this strategy ensures they don't silently drift.

```
Para CADA modelo incremental en produccion, implementa este protocolo:

1. FULL REFRESH PERIODICO
   - Ejecutar full refresh del modelo mensualmente (o semanalmente para criticos)
   - Comparar output de full refresh vs estado incremental actual
   - SI hay diferencia >0.1% en row count o >1% en medidas agregadas
     → INVESTIGAR. El incremental esta derivando.

2. LATE-ARRIVING DATA STRATEGY
   - Definir lookback window explicito (e.g., 3 dias)
   - El incremental debe re-procesar la ventana, no solo filas nuevas
   - SI el patron de late-arriving data es impredecible (e.g., APIs
     que retroactivamente corrigen datos) → considerar full refresh
     o delete+insert por particion

3. DRIFT DETECTION AUTOMATIZADA
   - dbt test que compare row counts incrementales vs expected growth
   - Alerta si el crecimiento diario es <50% o >200% del promedio
   - Alerta si una metrica clave cambia >10% sin explicacion

4. SCHEMA CHANGE HANDLING
   - on_schema_change: 'append_new_columns' como default
   - SI una columna desaparece del source → el incremental no lo detecta
     automáticamente. Necesita test que valide schema del source.

5. DEBUGGABILITY
   - Todo modelo incremental debe tener una columna _loaded_at
     (timestamp de cuando la fila fue procesada por dbt)
   - Permite auditar: "esta fila fue cargada en el run de ayer o de hace 3 dias?"
   - Esencial para debugging de late-arriving data issues

REGLA: Si no puedes explicar EXACTAMENTE como tu modelo incremental
maneja late-arriving data y schema changes, NO esta listo para produccion.
```

---

**Autor:** Javier Montaño | **Última actualización:** 13 de marzo de 2026
