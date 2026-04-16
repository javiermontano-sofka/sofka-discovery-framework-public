# Metaprompts — Technical Writing: Documentation Precision & Progressive Disclosure

> Estrategias de meta-nivel para maximizar la efectividad de esta skill.
> Los metaprompts no producen entregables — optimizan CÓMO se producen.

---

## 1. Filler Detection Protocol (Protocolo de Detección de Filler)

**Propósito:** Sistematizar la eliminación de filler phrases, redundancias, y frases que no aportan información nueva. Aplicar DESPUÉS de producir cada sección.

```
Después de redactar cada sección, aplica este protocolo de detección de filler:

CAPA 1 — FILLER PHRASES (eliminación automática):
Buscar y eliminar estas frases y sus variantes:
- "Cabe señalar que..." → eliminar, ir directo al punto
- "Es importante destacar..." → eliminar, el contenido habla por sí mismo
- "Como se puede observar..." → eliminar, el lector ya está observando
- "En este sentido..." → eliminar, la conexión es implícita
- "Con respecto a lo anterior..." → eliminar o reemplazar con referencia específica
- "Es necesario mencionar que..." → eliminar, si fuera necesario ya estaría
- "Como se mencionó anteriormente..." → reemplazar con "→ See [Sección X]"
- "A continuación se presenta..." → eliminar, el contenido sigue inmediatamente

CAPA 2 — REDUNDANCIA:
- ¿Alguna frase repite información ya presentada?
  → Eliminar o consolidar con cross-reference
- ¿Algún párrafo dice lo mismo que la tabla que lo sigue?
  → Eliminar el párrafo o la tabla, no ambos
- ¿El TL;DR repite las mismas frases del body?
  → Reescribir TL;DR como resumen ejecutivo, no como copy-paste

CAPA 3 — DENSIDAD INFORMATIVA:
Para cada frase, preguntar: "¿Qué información nueva aporta esta frase?"
- Si la respuesta es "ninguna" → eliminar
- Si la respuesta es "contexto" → ¿es contexto que el lector necesita aquí?
- Si la respuesta es "transición" → ¿se puede lograr con un heading o bullet?

MÉTRICA: Contar frases antes y después del protocolo.
Reducción esperada: 15-25% del texto original.
Si la reducción es < 10%, la escritura original ya era densa — bien.
Si la reducción es > 30%, la escritura original tenía exceso de filler — revisar proceso.
```

---

## 2. Terminology Consistency Audit (Auditoría de Consistencia Terminológica)

**Propósito:** Garantizar que cada término técnico tiene un significado único y consistente a lo largo de todo el discovery. Aplicar al finalizar cada entregable y antes de cross-check entre entregables.

```
Al finalizar un entregable, ejecuta esta auditoría de terminología:

PASO 1 — EXTRACCIÓN DE TÉRMINOS:
Listar todos los términos técnicos, acrónimos, y nombres de componentes usados:
- Nombres de sistemas: ¿"OMS", "el monolito", "el sistema"?
- Nombres de módulos: ¿"módulo de facturación", "billing", "facturación"?
- Nombres técnicos: ¿"stored procedure", "procedimiento almacenado", "SP"?
- Acrónimos: ¿definidos en primer uso? ¿usados consistentemente después?

PASO 2 — VERIFICACIÓN DE UNICIDAD:
Para cada concepto, verificar que se usa UN solo término:
✅ "El monolito" (definido como "aplicación principal desplegada como una unidad")
❌ "El monolito" en sección 1, "la aplicación legacy" en sección 3, "el sistema principal" en sección 5

PASO 3 — CROSS-ENTREGABLE:
Si el término aparece en otro entregable del discovery:
- ¿Tiene el mismo significado?
- ¿Si evolucionó (AS-IS → TO-BE), se nota explícitamente la transición?

PASO 4 — GLOSARIO IMPLÍCITO:
Construir tabla de términos usados:
| Término | Definición | Primera aparición | Variantes encontradas |
|---|---|---|---|
| {término} | {definición} | Sección {N} | {variantes, si las hay — corregir} |

REGLA: Si se encuentran variantes, elegir UN término y reemplazar todos los demás.
Excepción: si el sinónimo está entre comillas como parte de un quote del stakeholder.
```

---

## 3. Evidence Coverage Check (Verificación de Cobertura de Evidencia)

**Propósito:** Asegurar que ningún claim cuantitativo o afirmación causal quede sin evidence tag. Aplicar como paso final antes de entregar.

```
Antes de finalizar un entregable, ejecuta esta verificación de cobertura:

PASO 1 — IDENTIFICAR CLAIMS:
Buscar todas las afirmaciones que necesitan evidencia:
- Números: "12,000 pedidos/día", "847 tablas", "4.2s p95"
- Causales: "X causa Y", "debido a X", "como resultado de"
- Comparativas: "más rápido que", "peor que el benchmark"
- Temporales: "desde 2019", "en los últimos 12 meses"
- Atributivas: "el equipo tiene X experiencia", "el sistema fue construido por"

PASO 2 — VERIFICAR TAGS:
Para cada claim identificado:
- ¿Tiene al menos un evidence tag?
  → Si NO: agregar tag o marcar como [SUPUESTO] con path de validación
- ¿El tag es correcto?
  → [CÓDIGO] solo si se verificó en código fuente
  → [CONFIG] solo si se verificó en archivos de configuración
  → [DOC] solo si proviene de documentación existente
  → [STAKEHOLDER] solo si lo reportó una persona identificable
  → [INFERENCIA] solo si se dedujo de patrones observados
  → [BENCHMARK] solo si compara con estándar de industria documentado

PASO 3 — VERIFICAR CONFIANZA:
- Claims de alta confianza ([CÓDIGO], [CONFIG]): ¿el dato es reproducible?
- Claims de media confianza ([DOC], [STAKEHOLDER]): ¿se cross-validó?
- Claims de baja confianza ([INFERENCIA], [SUPUESTO]): ¿se declara la incertidumbre?

PASO 4 — TABLA DE COBERTURA:
| Sección | Claims totales | Con tag | Sin tag | Cobertura |
|---|---|---|---|---|
| Sección 1 | {n} | {n} | {n} | {%} |
| ... | ... | ... | ... | ... |

OBJETIVO: 100% de claims cuantitativos y causales con tag.
ACEPTABLE: 95%+ (los restantes se marcan [SUPUESTO] con path de validación).
```

---

## 4. Progressive Disclosure Validator (Validador de Progressive Disclosure)

**Propósito:** Verificar que el documento funciona a los 4 niveles de lectura y que cada nivel es autocontenido.

```
Verificar que el entregable funciona en los 4 niveles de progressive disclosure:

NIVEL 0 — TEST DEL EJECUTIVO (2 minutos):
Leer SOLO el TL;DR global.
- ¿Se entiende el mensaje principal sin leer nada más?
- ¿Los 3-5 bullets cubren los hallazgos más importantes?
- ¿Hay acción implícita? (el ejecutivo sabe qué decidir)
Si NO → reescribir TL;DR.

NIVEL 1 — TEST DEL GERENTE (10 minutos):
Leer SOLO el TL;DR global + los TL;DR de cada sección.
- ¿Se entiende la estructura completa del análisis?
- ¿Cada TL;DR de sección agrega información no presente en el TL;DR global?
- ¿Se puede armar una presentación de 5 slides solo con los TL;DRs?
Si NO → reescribir TL;DRs de sección.

NIVEL 2 — TEST DEL ARQUITECTO (30 minutos):
Leer las secciones completas con tablas y callouts.
- ¿Las tablas Finding → Evidence → Impact son completas?
- ¿Los callouts (Insight, Risk, Trade-off) agregan interpretación no obvia?
- ¿Las cross-references permiten navegar a detalle sin perderse?
Si NO → enriquecer tablas y callouts.

NIVEL 3 — TEST DEL IMPLEMENTADOR (60+ minutos):
Leer todo incluyendo detalle técnico, diagramas, y apéndice.
- ¿Los diagramas Mermaid son correctos y renderizables?
- ¿El detalle técnico es suficiente para actuar sin preguntar al autor?
- ¿El glosario cubre todos los términos técnicos usados?
Si NO → agregar detalle técnico.

REGLA CRÍTICA: Cada nivel debe ser AUTOCONTENIDO.
El ejecutivo NUNCA debería necesitar leer el Level 2 para entender el TL;DR.
El arquitecto NUNCA debería necesitar leer el apéndice para entender las secciones.
```

---

## 5. Anti-Pattern Sweep (Barrido de Anti-Patrones)

**Propósito:** Detección sistemática de los anti-patrones definidos en el skill. Ejecutar como checklist final.

```
Ejecutar barrido de anti-patrones en el entregable:

ANTI-PATRÓN 1: FILLER PHRASES
Buscar:
- "cabe señalar", "es importante", "como se puede observar"
- "en este sentido", "con respecto a", "es necesario mencionar"
- Frases que empiezan con "Es" + adjetivo + "que" ("Es relevante que...")
Acción: BLOCK — eliminar cada instancia encontrada.

ANTI-PATRÓN 2: VOZ PASIVA SIN AGENTE
Buscar:
- "fue implementado", "se configuró", "se decidió", "fue diseñado"
- Cualquier pasiva donde el lector no sepa QUIÉN hizo la acción
Acción: WARN — reescribir identificando el agente.
Ejemplo: "Se implementó un cache" → "El equipo de backend implementó un cache Redis"

ANTI-PATRÓN 3: SCORES SIN JUSTIFICACIÓN
Buscar:
- Semáforos sin texto de justificación en la misma fila/párrafo
- "Impacto: Alto" sin evidencia cuantitativa
Acción: BLOCK — agregar justificación basada en evidencia.

ANTI-PATRÓN 4: HEADINGS QUE SALTAN NIVEL
Buscar:
- h1 seguido de h3 (sin h2 intermedio)
- h2 seguido de h4
Acción: BLOCK — corregir jerarquía.

ANTI-PATRÓN 5: ACRÓNIMOS SIN DEFINICIÓN
Buscar:
- Cualquier acrónimo (2+ letras mayúsculas consecutivas) sin definición previa
- Excepción: acrónimos universales (HTTP, SQL, API, CSS) no necesitan definición
Acción: BLOCK — definir en primer uso: "OMS (Order Management System)"

ANTI-PATRÓN 6: SECCIONES HUÉRFANAS
Buscar:
- Secciones con < 2 frases de contenido
- Headings seguidos inmediatamente de otro heading sin contenido
Acción: WARN — expandir o fusionar con sección padre.

ANTI-PATRÓN 7: TABLAS SIN HEADERS
Buscar:
- Tablas sin fila de encabezado
- Tablas con headers genéricos ("Columna 1", "Columna 2")
Acción: BLOCK — agregar headers descriptivos.

RESULTADO:
| Anti-Patrón | Instancias | Severidad | Estado |
|---|---|---|---|
| Filler | {n} | BLOCK | {corregido/pendiente} |
| Pasiva sin agente | {n} | WARN | {corregido/pendiente} |
| Scores sin justificación | {n} | BLOCK | {corregido/pendiente} |
| Heading skip | {n} | BLOCK | {corregido/pendiente} |
| Acrónimo sin definición | {n} | BLOCK | {corregido/pendiente} |
| Sección huérfana | {n} | WARN | {corregido/pendiente} |
| Tabla sin header | {n} | BLOCK | {corregido/pendiente} |

GATE: 0 instancias BLOCK para aprobar. WARNs documentados y aceptados.
```

---

## 6. Cross-Deliverable Consistency Check (Verificación de Consistencia Inter-Entregables)

**Propósito:** Verificar que la información es consistente entre entregables del discovery. Los números, términos, y conclusiones deben coincidir.

```
Al producir un entregable que referencia datos de otro entregable, verificar consistencia:

PASO 1 — DATOS NUMÉRICOS:
- Si el AS-IS dice "12,000 pedidos/día" y el Brief dice "~10,000 pedidos/día" → INCONSISTENCIA
- Si el Roadmap estima "3 FTE-meses" y el Handover dice "2 FTE-meses" → INCONSISTENCIA
Acción: Usar el dato de la fuente primaria (donde se calculó por primera vez).

PASO 2 — TERMINOLOGÍA:
- Si el AS-IS define "monolito" y el Brief usa "aplicación legacy" → INCONSISTENCIA
- Si el Spec usa "pedido" donde el AS-IS usa "orden" → INCONSISTENCIA
Acción: Usar el término definido en el primer entregable donde apareció.

PASO 3 — CONCLUSIONES:
- Si el AS-IS concluye "riesgo alto en seguridad" y el Brief dice "seguridad adecuada" → CONTRADICCIÓN
- Si los Scenarios recomiendan opción B y el Roadmap planifica opción A → CONTRADICCIÓN
Acción: Resolver con evidence — el dato con mayor confianza gana.

PASO 4 — CROSS-REFERENCES:
- Verificar que cada "→ See [XX_Entregable § Sección]" apunta a una sección que existe
- Verificar que la sección referenciada contiene lo que se promete
Acción: Actualizar o eliminar cross-references rotas.

OUTPUT:
| Tipo | Entregable A | Entregable B | Dato A | Dato B | Acción |
|---|---|---|---|---|---|
| Numérico | 03_AS-IS | 02_Brief | 12,000/día | ~10,000/día | Corregir Brief |
| ... | ... | ... | ... | ... | ... |
```

---

**Autor:** Javier Montaño | **Última actualización:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**
