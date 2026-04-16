# Use Case Prompts — Dynamic Methodology SME

## Caso de Uso 1: Resolución de Debate sobre Sprint Length

**Contexto**: Equipo Scrum debate entre sprints de 1 semana vs. 2 semanas. El PO quiere 1 semana para feedback más rápido; el equipo quiere 2 semanas para completar historias complejas.

**Prompt Template**:
```
Resuelve el debate sobre sprint length para el proyecto {proyecto}:
- Metodología: Scrum
- Contexto: {tamaño_equipo} personas, historias de {complejidad} complejidad
- Posición A: 1 semana (PO wants faster feedback)
- Posición B: 2 semanas (team needs time for complex stories)
- Analiza: trade-offs de cada posición desde principios Scrum
- Recomienda: con evidencia de cuándo cada opción funciona mejor
- Incluye: monitoring criteria para validar la decisión en 3 sprints
```

**Output Esperado**: Análisis de trade-offs, recomendación con principio Scrum que la soporta, y plan de validación.

## Caso de Uso 2: Anti-Pattern Scan de Prácticas Actuales

**Contexto**: PM sospecha que el equipo tiene anti-patrones pero no puede articularlos. Solicita diagnóstico.

**Prompt Template**:
```
Ejecuta anti-pattern scan para el equipo {equipo} del proyecto {proyecto}:
- Metodología declarada: {metodología}
- Prácticas actuales: {descripción_prácticas}
- Para cada práctica: ¿es consistente con {metodología}? ¿es un anti-patrón conocido?
- Si anti-patrón detectado: nombre, consecuencia, práctica correcta alternativa
- Priorizar: por impacto en delivery
- Output: Reporte de anti-patrones + remediación plan
```

**Output Esperado**: Lista de anti-patrones detectados con nombre, impacto, y práctica correcta sugerida.

## Caso de Uso 3: Guidance para Metodología Híbrida

**Contexto**: Proyecto necesita combinar sprints para desarrollo con phase-gates para compliance regulatorio. El PM no sabe cómo estructurarlo.

**Prompt Template**:
```
Diseña framework híbrido para el proyecto {proyecto}:
- Necesidad iterativa: desarrollo de software con feedback loops
- Necesidad predictiva: compliance regulatorio con evidencia por fase
- Restricciones: auditoría externa requiere fase-gate con documentación formal
- Diseña: qué es iterativo, qué es secuencial, y cómo se integran
- Incluye: ceremonia calendar, artefactos por stream, y puntos de convergencia
- Evidence: principios de cada framework que soportan el diseño
```

**Output Esperado**: Framework híbrido con streams definidos, ceremonias integradas, y justificación por principios.

## Caso de Uso 4: Evaluación de Methodology Fit Post-3-Sprints

**Contexto**: Después de 3 sprints con Scrum, el PM quiere evaluar si la metodología es la correcta o necesita ajuste.

**Prompt Template**:
```
Evalúa methodology fit después de 3 sprints de {metodología} en el proyecto {proyecto}:
- Métricas: velocity trend, sprint completion rate, stakeholder satisfaction
- Señales: {señales_observadas} (ej: sprints no se cierran, retros no producen mejoras)
- Evalúa: ¿los principios de {metodología} están siendo aplicados?
- Diagnostica: ¿el problema es la metodología o la implementación?
- Recomienda: continuar, ajustar prácticas, o cambiar metodología
- Incluye: evidence tags en cada recomendación
```

**Output Esperado**: Assessment de fit con diagnóstico diferencial (metodología vs. implementación) y recomendación con evidencia.
