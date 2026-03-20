# Data Storytelling — Body of Knowledge

> Transformar métricas en significado. Extracción de insights, conversión métrica-a-narrativa, enmarcado comparativo y comunicación de magnitudes.

---

## 1. Fundamentos Teóricos

### 1.1 Definición

Data storytelling es la disciplina de convertir datos cuantitativos en narrativas comprensibles que impulsen decisiones. No es visualización (eso es data-viz-storytelling) ni arco narrativo general (eso es storytelling). Data storytelling ocupa el espacio intermedio: **interpretar números y darles significado contextual**.

### 1.2 La Tríada del Dato Narrativo

Toda métrica presentada requiere tres componentes:

1. **Contexto** — ¿En qué situación se produce este número? ¿Qué estaba pasando?
2. **Comparación** — ¿Con respecto a qué? Baseline, benchmark, objetivo, periodo anterior.
3. **Consecuencia** — ¿Y qué? ¿Qué implica? ¿Qué acción se deriva?

Un número sin estos tres componentes es **ruido**, no información.

### 1.3 Principio de Números No Desnudos

Ningún dato cuantitativo debe aparecer sin interpretación. "92% de cobertura" no comunica nada. "92% de cobertura, 12 puntos por encima de la línea base del Q1, pero el 8% sin cobertura concentra los módulos de pago donde se acumula el 60% de los incidentes [CÓDIGO]" comunica un insight.

## 2. Patrones Fundamentales

### 2.1 Metrics-to-Meaning (M2M)

Pipeline de transformación en 6 pasos:

```
Raw metric → Context → Comparison → Insight → Implication → Action
```

| Paso | Pregunta clave | Ejemplo |
|------|---------------|---------|
| Raw | ¿Cuál es el número? | Deployment frequency: 1/mes |
| Context | ¿En qué situación? | Equipo de 8, monolito legacy, proceso manual |
| Comparison | ¿Vs. qué referente? | DORA elite: múltiples/día (brecha 30x) |
| Insight | ¿Qué revela? | Proceso manual bloquea velocity |
| Implication | ¿Qué consecuencia tiene? | Features esperan 15 días promedio en cola |
| Action | ¿Qué hacer? | CI/CD automatizado cierra brecha a 1/semana en 3 sprints |

### 2.2 Insight Extraction

Proceso de 5 pasos para extraer insights de conjuntos de datos:

1. **Observar** — Dato puntual sin interpretación
2. **Detectar patrón** — Regularidad o tendencia en múltiples datos
3. **Identificar anomalía** — Lo que rompe el patrón
4. **Interpretar significado** — Por qué la anomalía importa
5. **Recomendar** — Acción derivada del significado

### 2.3 Comparison Framing

Seis marcos de comparación, cada uno apropiado para contextos distintos:

| Marco | Cuándo usar | Estructura |
|-------|------------|-----------|
| Before/After | Proyección de mejora | "De X a Y" con delta explícito |
| Peer Benchmark | Comparación sectorial | "vs. mediana/percentil del sector" |
| Industry Standard | Frameworks reconocidos | "vs. DORA/OWASP/ISO referencia" |
| Internal Baseline | Evolución propia | "vs. Q anterior / línea base" |
| Target Gap | Distancia al objetivo | "A N puntos/% del objetivo" |
| Cost Equivalence | Hacer tangible FTE | "Equivalente a N personas × M meses" |

### 2.4 Magnitude Communication

Transformar abstracto en concreto:

- **FTE-meses → equipo-tiempo**: "40 FTE-meses = equipo de 8 personas durante 5 meses"
- **Porcentajes → horas reales**: "99.5% disponibilidad = 43 horas de downtime/año"
- **Ratios → impacto calendario**: "Lead time de 30 días = cada feature espera un mes"

**Regla absoluta:** NUNCA usar valores monetarios. Solo FTE-meses y magnitudes relativas.

## 3. Scoring Matrix Narratives

### 3.1 Sistema Semáforo

| Nivel | Criterio | Significado |
|-------|----------|------------|
| Verde | >80% | Cumple o supera expectativa |
| Amarillo | 50-80% | Funcional con mejoras necesarias |
| Rojo | <50% | Requiere intervención inmediata |

### 3.2 Narrativa de Matrices

Las matrices de scoring no se presentan celda por celda. Se narran:

1. **Liderar con el patrón** — "De las 6 dimensiones, 2 están en rojo y comparten causa raíz"
2. **Destacar anomalías** — "Seguridad sorprende en verde sin rol dedicado"
3. **Conectar a acción** — "Los 2 rojos se resuelven con Escenario B, Fase 1"

### 3.3 Cross-dimensional Analysis

Buscar correlaciones entre dimensiones:
- Dimensiones en rojo que comparten causa raíz
- Dimensiones en verde que podrían degradarse sin atención
- Patrones que revelan problemas sistémicos vs. puntuales

## 4. Dashboard Narrative Sequences

Para presentaciones ejecutivas multi-chart:

| Secuencia | Función | Pregunta |
|-----------|---------|----------|
| Chart 1: Headline | Estado actual | ¿Dónde estamos? |
| Chart 2: Context | Tendencia histórica | ¿Cómo llegamos aquí? |
| Chart 3: Comparison | Benchmark gap | ¿Dónde deberíamos estar? |
| Chart 4: Path | Proyección roadmap | ¿Cómo cerramos la brecha? |

Cada chart construye sobre el anterior. No hay charts standalone.

## 5. Semantic Density

### 5.1 Evidence Tagging

Toda afirmación cuantitativa debe tener tag de evidencia:

| Tag | Significado |
|-----|------------|
| [CÓDIGO] | Verificado en código fuente |
| [CONFIG] | Verificado en configuración |
| [DOC] | Documentado formalmente |
| [INFERENCIA] | Derivado de datos parciales |
| [SUPUESTO] | Asumido sin verificación directa |
| [STAKEHOLDER] | Reportado por interlocutor |

### 5.2 Reglas de Densidad

- **Tablas**: Datos en celdas, metodología en footnotes
- **Semáforos**: Umbrales definidos explícitamente
- **Cross-references**: Vincular a sección de metodología
- **Source attribution**: Tag inline junto al dato

## 6. Edge Cases

| Caso | Tratamiento |
|------|------------|
| Sin benchmark disponible | Usar baseline interno + declarar: "Sin benchmark sectorial; línea base Q1 como referencia [SUPUESTO]" |
| Métricas contradictorias | Presentar contradicción como hallazgo: "Cobertura alta (92%) vs. incidentes frecuentes (8/mes) sugiere tests superficiales [INFERENCIA]" |
| Datos escasos | Declarar limitación: "Con N datos, tendencia indicativa, no concluyente" |
| Datos outlier | Separar outlier, analizar con y sin él, documentar decisión |
| Métricas vanidosas | Identificar y reemplazar con métricas accionables |

## 7. Anti-patterns

| Anti-pattern | Corrección |
|-------------|-----------|
| Número desnudo | Agregar contexto + comparación + consecuencia |
| Gráfico sin narrativa | Cada visualización necesita párrafo interpretativo |
| Promedio sin distribución | Mostrar distribución o al menos rangos |
| Correlación como causalidad | Etiquetar [INFERENCIA], plantear hipótesis alternativas |
| Precisión falsa | No "92.37%" cuando la medición tiene ±5% de error |
| Valores monetarios | Convertir a FTE-meses |

## 8. Frameworks de Referencia

- **DORA Metrics**: Deployment frequency, lead time, change failure rate, MTTR
- **Accelerate / State of DevOps**: Benchmarks anuales de rendimiento
- **OWASP Top 10**: Baseline de seguridad web
- **ISO/IEC 25010**: Modelo de calidad de producto software
- **CMMI**: Niveles de madurez de procesos
- **SRE Golden Signals**: Latencia, tráfico, errores, saturación

## 9. Bibliografía Esencial

- Knaflic, C.N. — *Storytelling with Data* (2015)
- Dykes, B. — *Effective Data Storytelling* (2020)
- Tufte, E. — *The Visual Display of Quantitative Information* (2001)
- Forsell, N. et al. — *DORA State of DevOps Reports* (2018-2024)
- Kahneman, D. — *Thinking, Fast and Slow* (2011) — sesgos en interpretación de datos
