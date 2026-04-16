# Use Case Prompts — Cross-Project Dependency Mapping

## Caso de Uso 1: Mapeo de Portfolio Completo

**Contexto**: PMO necesita visibilidad total de dependencias entre 10 proyectos activos para la revisión trimestral de portfolio.

**Prompt Template**:
```
Mapea todas las dependencias entre los proyectos activos del portfolio {portfolio}:
- Proyectos: {lista_10_proyectos}
- Clasificar por tipo: data, resource, technology, deliverable, decision, external
- Establecer dirección: provider → consumer para cada dependencia
- Identificar cadenas críticas: dependencias en critical path del portfolio
- Detectar dependencias circulares
- Output: Dependency matrix + network diagram (Mermaid) + risk assessment
```

**Output Esperado**: Matriz N×N, diagrama Mermaid con color-coding de riesgo, y reporte de evaluación de riesgo.

## Caso de Uso 2: Detección de Dependencias Circulares

**Contexto**: Tres proyectos parecen bloquearse mutuamente. Se necesita confirmar si hay ciclos y planificar resolución.

**Prompt Template**:
```
Analiza dependencias entre {proyecto_A}, {proyecto_B}, y {proyecto_C} para detectar ciclos:
- Input: lista de dependencias conocidas entre los 3 proyectos
- Ejecutar: detección de ciclos usando análisis de grafo dirigido
- Para cada ciclo encontrado: documentar el path completo
- Proponer: ≥2 opciones de resolución por ciclo (intermediate deliverable, parallel streams, scope restructure)
- Evaluar: costo y riesgo de cada opción
- Output: Reporte de ciclos + opciones de resolución con trade-offs
```

**Output Esperado**: Diagrama de ciclos detectados, tabla de opciones de resolución con análisis de trade-offs.

## Caso de Uso 3: Análisis de Impacto de Retraso

**Contexto**: Un proyecto clave del portfolio confirma retraso de 3 semanas. Necesitamos entender el impacto downstream.

**Prompt Template**:
```
Ejecuta análisis de impacto por retraso del proyecto {proyecto_retrasado} en el portfolio:
- Retraso: {duración} semanas
- Dependencias downstream: identificar todos los proyectos consumidores
- Para cada proyecto impactado: calcular retraso propagado
- Cascading: analizar impactos de segundo y tercer orden
- Mitigación: opciones para absorber el retraso sin propagación
- Output: Impact tree diagram + tabla de impactos + mitigation plan
```

**Output Esperado**: Diagrama de árbol de impacto, tabla con retrasos propagados, y plan de mitigación.

## Caso de Uso 4: Dependency Board para PI Planning

**Contexto**: Preparación de PI Planning en contexto SAFe. Necesitamos el dependency board inicial para facilitación.

**Prompt Template**:
```
Prepara dependency board para PI Planning del ART {art_name}:
- Equipos: {lista_equipos}
- Features planificadas: {lista_features}
- Identificar: dependencias entre equipos por feature
- Clasificar: type, direction, sprint de necesidad, sprint de entrega
- Visualizar: board format (equipo × sprint con dependency ribbons)
- Flag: dependencias de riesgo (cross-ART, external, late-sprint)
- Output: Dependency board template + risk flags + facilitation guide
```

**Output Esperado**: Board template con dependencias pre-pobladas, flags de riesgo, y guía de facilitación.
