# Use Case Prompts — Data Visualization Storytelling

Ready-to-use prompts to invoke the skill in concrete scenarios. Each prompt includes context, parameters, and expected output.

---

## 1. Visual Narrative for AS-IS Analysis

```
Diseña la narrativa visual para el análisis AS-IS de {CLIENTE}.

Contexto: Se han identificado {N} hallazgos técnicos. Los datos disponibles son:
- Arquitectura actual: {DESCRIPCIÓN_BREVE}
- Métricas: {LISTA_METRICAS}
- Pain points principales: {LISTA_PAIN_POINTS}

Para cada hallazgo:
1. Selecciona el chart type óptimo según la Chart Selection Matrix
2. Define el mensaje principal (una oración)
3. Diseña el diagrama Mermaid con classDefs de marca (primary, risk, success, neutral)
4. Redacta la anotación narrativa (qué revela el diagrama, por qué importa)

Construye la secuencia: Headline → Context → Evidence → Action.
Respeta el diagram budget del deliverable 03 (min 2, max 4).

context=analysis FORMATO=markdown VARIANTE=técnica
```

---

## 2. Narrative Dashboard for Executive Presentation

```
Crea un dashboard narrativo de 4 visualizaciones para la presentación ejecutiva de {CLIENTE}.

Audiencia: C-level, tiempo de atención limitado, foco en impacto de negocio.
Datos disponibles: {RESUMEN_DATOS}

Secuencia obligatoria:
- Slide 1: Headline visual — el dato que captura atención
- Slide 2: Context visual — tendencia o timeline que explica el dato
- Slide 3: Evidence visual — comparación detallada o scoring
- Slide 4: Action visual — roadmap o decisión propuesta

Cada visual debe tener: título-mensaje (no título-descriptivo), max 20 nodos Mermaid, anotación de una línea debajo del diagrama.

context=presentation FORMATO=markdown VARIANTE=ejecutiva
```

---

## 3. C4 Storytelling for TO-BE Architecture

```
Diseña la narrativa visual C4 para la arquitectura TO-BE de {CLIENTE}.

Input: Documento de arquitectura TO-BE (adjunto o en {RUTA}).

Produce 3 diagramas C4 narrativos:
1. C4 Context — "El ecosistema propuesto" (flowchart TD, max 8 nodos)
2. C4 Container — "La estructura técnica" (flowchart TD, max 15 nodos)
3. Comparativo AS-IS vs TO-BE — "Lo que cambia" (flowchart LR, nodos risk=eliminados, success=nuevos, primary=modificados)

Cada diagrama incluye:
- Mensaje principal antes del diagrama
- Accessibility text
- Anotación narrativa después del diagrama
- classDefs de marca MetodologIA

context=comparison FORMATO=markdown VARIANTE=técnica
```

---

## 4. Chart Type Selection for Discovery Data

```
Tengo los siguientes datos del discovery de {CLIENTE}:

{PEGAR_DATOS_O_DESCRIBIR}

Para cada dataset:
1. Identifica el data pattern (comparación, tendencia, composición, relación, flujo, jerarquía)
2. Recomienda el chart type óptimo usando la Chart Selection Matrix
3. Si aplica Mermaid, genera el diagrama con las 4 classDefs de marca
4. Si NO aplica Mermaid (scatter, line, bar), describe la especificación del chart (ejes, escalas, annotations)
5. Define el mensaje principal que el chart debe comunicar

Genera un reporte de recomendación con tabla resumen: dataset → pattern → chart type → mensaje.

context=analysis FORMATO=markdown VARIANTE=técnica
```

---

## 5. Visual Audit of Existing Deliverables

```
Audita las visualizaciones de los deliverables en {RUTA_DELIVERABLES}.

Para cada diagrama Mermaid encontrado, evalúa:
1. ¿El chart type es correcto para el data pattern?
2. ¿Tiene un mensaje principal claro? (¿puedo decir el takeaway en 1 oración?)
3. ¿Las anotaciones son selectivas o excesivas?
4. ¿Respeta los Mermaid Standards? (<=20 nodos, IDs descriptivos, edges con labels)
5. ¿Tiene accessibility text antes del diagrama?
6. ¿Usa los colores de marca correctos? (#6366F1 primary, #22D3EE success, #DC3545 risk)
7. ¿La secuencia de visualizaciones en el documento construye un argumento?

Genera un scorecard por deliverable (7 criterios, escala 1-5) y una lista priorizada de mejoras.

context=analysis FORMATO=markdown VARIANTE=técnica MODO=desatendido
```

---

## 6. Narrative Flow Diagram for Process Mapping

```
Diseña la narrativa visual para el mapeo de flujos de {PROCESO} en {CLIENTE}.

Input: Descripción del flujo actual (adjunto o en {RUTA}).

Produce:
1. Flowchart LR del flujo principal (max 15 nodos, happy path)
   - Nodos primary: pasos core del proceso
   - Nodos risk: puntos de dolor o cuello de botella
   - Nodos success: puntos de optimización propuesta
   - Nodos neutral: pasos de soporte

2. State diagram de las transiciones del objeto principal
   - Estados relevantes del objeto de negocio (pedido, solicitud, ticket)
   - Transiciones con labels de acción y condición

3. Sequence diagram del flujo entre actores (max 5 participants)
   - Interacciones clave entre sistemas/personas
   - Notes para marcar latencias o problemas

Cada diagrama: mensaje principal + accessibility text + anotación narrativa.

context=flow FORMATO=markdown VARIANTE=técnica
```

---

## 7. Comparative Scoring Visualization for Scenarios

```
Diseña la visualización comparativa de {N} escenarios para {CLIENTE}.

Datos:
- Escenarios: {LISTA_ESCENARIOS}
- Dimensiones de scoring: {LISTA_DIMENSIONES}
- Scores: {TABLA_SCORES}

Produce:
1. Tabla de scoring con formato semántico (>=4: dorado, 2.5-3.9: naranja, <2.5: rojo)
2. QuadrantChart posicionando escenarios en las 2 dimensiones más discriminantes
3. Flowchart TD de árbol de decisión: "¿Cuál elegir?" con criterios en cada nodo de decisión

Mensaje principal de la narrativa: cuál escenario gana y por qué (en 1 oración).

context=comparison FORMATO=markdown VARIANTE=técnica
```

---

## 8. Visual Narrative for AI Opportunities

```
Diseña la narrativa visual para el análisis de oportunidades IA de {CLIENTE}.

Input: Lista de procesos candidatos a automatización/augmentation con IA.

Produce:
1. QuadrantChart: Esfuerzo de implementación vs. Impacto de negocio
   - Cada proceso como punto en el quadrant
   - Cuadrante superior-derecho = "Quick Wins IA"

2. Flowchart LR: Pipeline de adopción IA propuesto
   - Fases: Piloto → Validación → Escalamiento → Operación
   - Nodos primary: procesos seleccionados para cada fase

3. Pie chart: Distribución de oportunidades por tipo (automatización, augmentation, generación, análisis)

Secuencia narrativa: Oportunidad (quadrant) → Plan (flowchart) → Distribución (pie).

context=analysis FORMATO=markdown VARIANTE=técnica
```
