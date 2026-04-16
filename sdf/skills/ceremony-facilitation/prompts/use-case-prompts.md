# Ceremony Facilitation — Use Case Prompts

## Caso de Uso 1: Guia de Facilitacion para Sprint Retrospective

**Contexto**: Equipo Scrum necesita una retrospectiva con formato fresco despues de 3 sprints con el mismo formato.

**Prompt Template**:
```
Genera una guia de facilitacion para la retrospectiva del Sprint {SPRINT_NUMBER}
del proyecto {PROJECT_NAME}.

Equipo: {TEAM_SIZE} personas, formato {FORMAT: virtual/presencial/hibrido}.
Problema de facilitacion: {CHALLENGE: baja participacion, formato repetitivo, conflicto latente}.
Duracion: {DURATION} minutos.

Incluye:
1. Check-in activity innovador (diferente a los ultimos 3 sprints)
2. Tecnica de engagement para {TEAM_SIZE} personas en formato {FORMAT}
3. Protocolo de conflicto si surgen temas sensibles
4. Closing con captura de action items y ceremonia NPS
5. Materiales necesarios y contingencia si herramientas fallan
```

**Output esperado**: Guia paso a paso con tiempos, materiales, facilitation notes por seccion, y 2 tecnicas alternativas. [PLAN]

## Caso de Uso 2: Facilitacion de PI Planning (50+ Personas)

**Contexto**: Primer PI Planning de un ART con multiples equipos en formato hibrido.

**Prompt Template**:
```
Disena la facilitacion para un PI Planning de {NUM_TEAMS} equipos
({TOTAL_PEOPLE} personas). Formato: {FORMAT}. Duracion: {DAYS} dias.

Consideraciones: {SPECIAL: primer PI, zonas horarias, equipos nuevos}.

Necesito:
1. Agenda facilitada con tiempos y responsables por bloque
2. Protocolo de breakout rooms (presenciales + virtuales)
3. Mecanismo de gestion de dependencias entre equipos
4. Confidence vote con protocolo de re-plan si promedio <3.0
5. Plan de contingencia para problemas tecnicos
```

**Output esperado**: Guia de facilitacion de 2 dias con agenda, roles, materiales, y contingencias. [PLAN]

## Caso de Uso 3: Tecnicas de Engagement para Equipo Desenganchado

**Contexto**: Equipo donde pocos dominan y muchos permanecen en silencio durante ceremonias.

**Prompt Template**:
```
Recomienda tecnicas de engagement para un equipo de {TEAM_SIZE} personas
donde {DOMINANT_COUNT} dominan y {SILENT_COUNT} no participan.

Ceremonia: {CEREMONY_TYPE}. Formato: {FORMAT}.
Cultura: {CULTURE_NOTES: introvertidos, multicultural, alta distancia al poder}.

Prioridades:
1. Equalizar voz sin avergonzar a los dominantes
2. Crear espacio seguro para los silenciosos
3. Mantener timebox
```

**Output esperado**: 3 tecnicas con instrucciones, variantes por formato, y metricas esperadas. [STAKEHOLDER]

## Caso de Uso 4: Catalogo de Anti-Patrones y Respuestas

**Contexto**: PM nuevo necesita reconocer y responder a anti-patrones durante ceremonias.

**Prompt Template**:
```
Genera catalogo de anti-patrones de facilitacion para {CEREMONY_TYPE}.
Nivel del facilitador: {LEVEL: novato/intermedio/avanzado}.

Para cada anti-patron:
1. Nombre y descripcion
2. Sintomas observables en la ceremonia
3. Respuesta inmediata del facilitador (script de que decir)
4. Prevencion para futuras ceremonias
5. Severidad: Critico / Alto / Medio / Bajo
```

**Output esperado**: 8-10 anti-patrones con tarjetas de respuesta rapida consultables durante la ceremonia. [PLAN]

*PMO-APEX v1.0 — Use Case Prompts - Ceremony Facilitation*
