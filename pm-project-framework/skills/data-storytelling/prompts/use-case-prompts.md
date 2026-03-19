# Use Case Prompts — Data Storytelling & Visualization

## Caso de Uso 1: Narrativa de Riesgo de Schedule para Sponsor

**Contexto**: El SPI ha caído a 0.85 y el PM necesita comunicar el riesgo de retraso al sponsor de forma convincente y con call-to-action claro.

**Prompt Template**:
```
Crea una data story sobre el riesgo de schedule del proyecto {proyecto} para el sponsor:
- Dato clave: SPI = 0.85 (tendencia decreciente últimos 3 sprints)
- Estructura: Context-Insight-Implication-Action
- Visualización: línea de tendencia SPI con proyección
- Tono: urgente pero constructivo, no alarmista
- Call to action: opciones de mitigación (scope reduction, timeline extension, resource addition)
- Formato: briefing de 1 página con 1 chart y 3 bullets de acción
```

**Output Esperado**: Documento de 1 página con narrativa CIAR, gráfico de tendencia SPI, y 3 opciones de acción con trade-offs.

## Caso de Uso 2: Portfolio Health Story para Board

**Contexto**: Revisión trimestral del board requiere presentar salud del portfolio de 12 proyectos activos de forma visual y ejecutiva.

**Prompt Template**:
```
Diseña una data story de salud del portfolio para presentación al board:
- Proyectos: {lista_12_proyectos} con RAG status, CPI, SPI, budget burn
- Estructura: overview → heat spot → deep dive on top 3 issues → recommendations
- Visualizaciones: heatmap de portfolio, scatter CPI vs SPI, budget burn bars
- Duración: 15 minutos de presentación (8 slides máximo)
- Evidence tags en cada afirmación
```

**Output Esperado**: Deck de 8 slides con heatmap, scatter plot, bar chart, y narrativa ejecutiva.

## Caso de Uso 3: Velocity Trend Story para Retrospectiva

**Contexto**: El equipo necesita entender por qué la velocity ha sido inconsistente y tomar acciones en la retrospectiva.

**Prompt Template**:
```
Construye una data story de velocity para la retrospectiva del equipo {equipo}:
- Datos: velocity de últimos 8 sprints con contexto (vacaciones, cambios de equipo, deuda técnica)
- Audiencia: equipo técnico (alta data literacy)
- Insight principal: identificar patrones y causas de variabilidad
- Visualización: bar chart de velocity con annotations de eventos
- Call to action: 2-3 mejoras específicas para estabilizar velocity
```

**Output Esperado**: Gráfico de barras anotado con eventos contextuales, análisis de patrones, y acciones concretas.

## Caso de Uso 4: Cost Overrun Story para Change Control

**Contexto**: El proyecto excede el presupuesto en 15% y necesita aprobación del CCB para fondos adicionales. La historia debe justificar la inversión adicional.

**Prompt Template**:
```
Crea la narrativa financiera para el Change Request de presupuesto adicional:
- Overrun actual: 15% sobre baseline ($1.2M → $1.38M)
- Causas: scope change aprobado (8%), underestimation (4%), inflation (3%)
- Visualización: waterfall chart mostrando contribución de cada causa
- Proyección: EAC con y sin fondos adicionales
- Call to action: aprobar $180K adicionales o reducir scope en features X, Y, Z
- Tono: factual, transparente, con opciones claras
```

**Output Esperado**: Documento con waterfall chart de causas, proyección EAC, y opciones de decisión con impacto cuantificado.
