# Metaprompts — Cross-Project Dependency Mapping

## Metaprompt 1: Generador de Dependency Matrix

**Propósito**: Construir automáticamente la matriz de dependencias a partir de datos de proyecto.

```
Eres un analista de portfolio especializado en dependency management. Dados los siguientes proyectos y sus entregables {proyectos_y_entregables}:

1. Para cada par de proyectos, evalúa si existe dependencia
2. Clasifica cada dependencia encontrada: tipo (FS/SS/FF/SF), naturaleza (data/resource/tech/deliverable/decision)
3. Establece dirección: proveedor → consumidor
4. Evalúa riesgo: probabilidad de delay × impacto (escala 1-5)
5. Construye dependency matrix N×N con celdas: tipo-riesgo (ej: "FS-H" = Finish-to-Start, High risk)
6. Identifica clusters de alta interdependencia
7. Detecta dependencias circulares

Output: Tabla Markdown de matrix + lista de clusters + ciclos detectados.
Etiqueta: [PLAN] para dependencias confirmadas, [INFERENCIA] para dependencias inferidas, [SUPUESTO] para asumidas.
```

## Metaprompt 2: Analizador de Impacto en Cascada

**Propósito**: Dado un retraso en un proyecto, calcular impacto propagado en todo el portfolio.

```
Eres un analista de riesgo de portfolio. Dado el dependency graph del portfolio y un retraso de {duración} en {proyecto}:

1. Identifica todas las dependencias directas downstream (orden 1)
2. Para cada dependencia orden-1: calcula retraso propagado considerando buffers existentes
3. Identifica dependencias de orden-2 y orden-3 (cascading)
4. Para cada proyecto impactado: calcula nuevo deadline estimado
5. Identifica el impacto total en el portfolio (% proyectos afectados, retraso acumulado)
6. Clasifica proyectos por severidad de impacto: crítico, significativo, menor
7. Propón mitigaciones: buffer absorption, parallel work, scope trade-offs

Output: Impact tree diagram (Mermaid) + tabla de impactos por proyecto + mitigaciones priorizadas.
Etiqueta: [SCHEDULE] para fechas calculadas, [METRIC] para mediciones, [SUPUESTO] para estimaciones de buffer.
```

## Metaprompt 3: Monitor de Dependency Health

**Propósito**: Evaluar la salud general de las dependencias del portfolio periódicamente.

```
Eres un monitor de salud de portfolio. Evalúa el estado actual de las dependencias del portfolio {portfolio}:

1. Calcula Dependency Density (deps/proyecto) — target <3.0
2. Calcula Dependency Risk Index (promedio prob×impact) — target <0.4
3. Cuenta dependencias circulares — target = 0
4. Cuenta dependencias no gestionadas — target = 0
5. Identifica dependencias en estado "at risk" o "blocked"
6. Genera trend: comparar métricas actuales vs. último periodo
7. Recomienda top 3 acciones para mejorar dependency health

Output: Dashboard de dependency health con métricas, trends, y acciones.
Etiqueta: [METRIC] para todas las métricas calculadas, [PLAN] para acciones.
```
