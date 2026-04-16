# Metaprompts — Data Visualization Storytelling

Reasoning strategies the skill applies internally to solve complex visual narrative problems. Each metaprompt defines a reusable cognitive approach.

---

## 1. Chart Selection by Data Pattern

**When:** When receiving raw data or findings and needing to decide how to visualize them.

**Strategy:**

```
Antes de abrir Mermaid o diseñar cualquier visual, clasifica el dato:

PASO 1 — Identificar el data pattern
¿Qué relación muestran los datos?
- Comparación: ¿estoy comparando magnitudes entre categorías? → bar chart
- Tendencia: ¿estoy mostrando cambio en el tiempo? → line chart
- Composición: ¿estoy mostrando partes de un todo? → pie / stacked bar
- Relación: ¿estoy correlacionando dos variables? → scatter
- Flujo: ¿estoy mostrando un proceso o secuencia? → Mermaid flowchart / sequence
- Jerarquía: ¿estoy mostrando estructura de niveles? → Mermaid flowchart TD
- Posición: ¿estoy posicionando elementos en 2 dimensiones? → quadrantChart

PASO 2 — Verificar viabilidad en Mermaid
¿El chart type seleccionado se puede expresar en Mermaid?
- SÍ → Producir diagrama Mermaid con classDefs de marca
- NO (scatter, line, bar detallado) → Describir especificación del chart (ejes, escalas, data points)
  y representar con tabla markdown + narrative text

PASO 3 — Definir el mensaje
¿Cuál es la oración que el lector debe recordar después de ver esta visualización?
Escríbela ANTES de diseñar el diagrama. Si no puedes escribirla, el dato no
está listo para visualizar — vuelve al análisis.

PASO 4 — Aplicar constraints
- <=20 nodos
- <=4 classDefs (primary, risk, success, neutral)
- IDs descriptivos (authService, no n1)
- Edge labels con verbos de acción
- Accessibility text ANTES del diagrama
```

---

## 2. Narrative Sequence Design

**When:** When designing a sequence of multiple visualizations for a deliverable or presentation.

**Strategy:**

```
Diseña la secuencia como un argumento, no como una colección:

PASO 1 — Definir la tesis
¿Cuál es el argumento central que las visualizaciones deben probar?
Escríbelo en una oración: "Estas visualizaciones demuestran que ___."

PASO 2 — Aplicar la estructura narrativa
- Headline: ¿cuál es el dato más impactante? → Primera visualización
- Context: ¿qué explica ese dato? → Segunda visualización (tendencia, timeline, proceso)
- Evidence: ¿qué detalles lo soportan? → Tercera visualización (comparativa, scoring, tabla)
- Action: ¿qué hacer al respecto? → Cuarta visualización (roadmap, decisión, next steps)

PASO 3 — Verificar cohesión
Lee la secuencia de títulos-mensaje en orden:
"[Headline] → [Context] → [Evidence] → [Action]"
¿Se lee como un argumento coherente? ¿Cada paso construye sobre el anterior?
Si algún paso es independiente (no conecta con el anterior), elimínalo o reordena.

PASO 4 — Calibrar density
Revisa el diagram budget del deliverable:
- ¿Tengo el mínimo de diagramas necesario?
- ¿Estoy dentro del máximo recomendado?
- ¿Cada diagrama agrega información nueva o repite lo que ya dije en texto?
Si un diagrama solo "decora" un párrafo, elimínalo. El texto ya cuenta la historia.
```

---

## 3. Annotation Selectivity

**When:** When deciding which data points to annotate within a visualization.

**Strategy:**

```
La regla de anotación: si todo está anotado, nada está anotado.

PASO 1 — Identificar el mensaje principal
¿Cuál es la oración-takeaway del diagrama?

PASO 2 — Identificar los data points que soportan ese mensaje
Solo anotar:
- El pico o valley que revela la anomalía
- El threshold que muestra el gap al objetivo
- El nodo que concentra el riesgo
- La tendencia que indica la dirección
→ Máximo 3 anotaciones por visualización

PASO 3 — Verificar contra la lista de "NO anotar"
Eliminar anotaciones que:
- Describen lo que ya es visible (labels de ejes, nombres de nodos)
- Marcan todos los data points (anular selectividad)
- Son decorativas (flechas, highlights sin información)
- Repiten el texto narrativo que acompaña al diagrama

PASO 4 — Elegir el mecanismo de anotación
En Mermaid:
- classDef risk → colorea el nodo como punto de atención
- Edge label → describe la relación crítica
- Note (en sequence) → marca el evento importante
- Subgraph title → agrupa y nombra un cluster relevante
Fuera de Mermaid:
- Texto bold antes del diagrama ("Mensaje principal: ...")
- Texto narrativo después del diagrama (anotación interpretativa)
```

---

## 4. C4 Storytelling Pattern

**When:** When designing architecture diagrams (AS-IS or TO-BE) that must communicate more than "boxes and arrows."

**Strategy:**

```
Un diagrama C4 sin storytelling es un inventario. Con storytelling, es un argumento.

PASO 1 — Definir el pain point o la propuesta
Antes de dibujar: ¿qué problema revela esta arquitectura? ¿O qué solución propone?
Escríbelo como título del diagrama: "Pain point: 3 servicios comparten 1 BD"
(no: "Diagrama de arquitectura actual")

PASO 2 — Asignar roles semánticos con classDef
- primary (#6366F1) → componentes clave bajo análisis
- risk (#DC3545) → componentes problemáticos, puntos de fallo, deuda técnica
- success (#22D3EE) → componentes bien diseñados, fortalezas, mejoras propuestas
- neutral (#F8F9FA) → componentes de soporte, contexto

PASO 3 — Diseñar edges como narrativa
Cada edge label debe ser un verbo de acción que cuenta la historia:
- "comparte datos con" → revela acoplamiento
- "depende de" → revela fragilidad
- "emite evento a" → revela desacoplamiento
Los edges SIN label son edges sin historia — elimínalos o agrega el verbo.

PASO 4 — Escribir la anotación post-diagrama
La anotación responde: "¿Y entonces qué?"
No repetir lo que el diagrama muestra — interpretar lo que el diagrama implica:
- "Este acoplamiento significa que un deploy de catálogo puede tumbar pedidos"
- "La ausencia de event bus obliga a comunicación síncrona punto-a-punto"
```

---

## 5. Visual Integrity Check

**When:** As the final gate before delivering any visualization.

**Strategy:**

```
Revisa cada visualización contra 7 criterios antes de incluirla en el deliverable:

1. CHART TYPE correcto → ¿El data pattern coincide con el chart type? (Tufte/Few)
2. UN MENSAJE → ¿Puedo decir el takeaway en una oración? (Knaflic)
3. ANOTACIÓN SELECTIVA → ¿Solo los data points críticos están anotados? (max 3)
4. MERMAID STANDARDS → ¿<=20 nodos, IDs descriptivos, edges con labels, <=4 classDefs?
5. ACCESIBILIDAD → ¿Tiene alt-text antes del diagrama? ¿La información no depende solo del color?
6. BRAND COMPLIANCE → ¿Orange #6366F1, gold #22D3EE, red #DC3545? ¿CERO verde?
7. SECUENCIA → ¿Este diagrama construye sobre el anterior y prepara el siguiente?

Si algún criterio falla, corregir ANTES de incluir en el deliverable.
Si 3+ criterios fallan, rediseñar la visualización desde el PASO 1 de Chart Selection.
```

---

## 6. Data-to-Diagram Pipeline

**When:** When receiving raw data (tables, lists, metrics) and needing to transform them into a complete visual narrative.

**Strategy:**

```
Pipeline de transformación: Dato crudo → Insight → Mensaje → Diagrama → Narrativa

PASO 1 — Inspeccionar los datos
¿Qué tipo de datos tengo? (cuantitativo, cualitativo, estructural, temporal)
¿Cuántos data points? (si >20, agregar antes de visualizar)
¿Hay outliers, clusters, o tendencias visibles?

PASO 2 — Extraer el insight
¿Qué historia cuentan los datos?
- "El componente X concentra el 73% de los incidentes"
- "La tendencia es ascendente: +15% trimestral"
- "Hay un cluster de servicios con score <2 que dependen del mismo recurso"

PASO 3 — Formular el mensaje
Convertir el insight en una oración accionable:
"La base de datos compartida es el punto único de fallo que causa el 73% de incidentes"

PASO 4 — Seleccionar chart type y diseñar
Aplicar metaprompt #1 (Chart Selection por Data Pattern)

PASO 5 — Envolver en narrativa
- Texto ANTES: contexto y mensaje principal
- Diagrama: la visualización
- Texto DESPUÉS: interpretación y "so what"

Nunca entregar un diagrama sin su envoltorio narrativo.
```
