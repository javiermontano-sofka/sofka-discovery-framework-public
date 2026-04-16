# Use Case Prompts — Definition of Done / Definition of Ready

## Caso de Uso 1: DoD para Equipo Scrum Nuevo

**Contexto**: Equipo recién formado necesita su primer DoD. No tienen experiencia previa con DoD formal.

**Prompt Template**:
```
Diseña un Definition of Done inicial para un equipo Scrum nuevo en el proyecto {proyecto}:
- Equipo: {tamaño} personas, experiencia {nivel}
- Stack: {tecnologías}
- Sprint length: {duración}
- Incluir: DoD Story-level, DoD Feature-level, DoR
- Nivel de exigencia: L1 (básico, alcanzable desde sprint 1)
- Formato: checklist por nivel con ≤8 criterios por nivel
- Plan de evolución: cuándo escalar a L2 (automatizado)
```

**Output Esperado**: Checklist de DoD en 2 niveles + DoR, marcado como L1 con roadmap de evolución.

## Caso de Uso 2: Auditoría de Compliance de DoD

**Contexto**: Después de 6 sprints, el PM sospecha que el equipo no está cumpliendo todos los criterios de DoD consistentemente.

**Prompt Template**:
```
Ejecuta auditoría de compliance del DoD para el proyecto {proyecto}:
- Sprint range: últimos 6 sprints
- Datos: {número_items} items marcados como "Done"
- Para cada criterio del DoD, verificar: ¿se cumplió en cada item?
- Calcular: DoD Compliance Rate, Exception Rate, criterios más incumplidos
- Visualizar: heatmap de compliance por criterio por sprint
- Recomendaciones: top 3 acciones para mejorar compliance
```

**Output Esperado**: Reporte de auditoría con compliance rate, heatmap, y plan de mejora.

## Caso de Uso 3: DoD Layered para Programa SAFe

**Contexto**: Programa SAFe con 4 equipos necesita DoD harmonizado a nivel de equipo, ART, y solución.

**Prompt Template**:
```
Diseña DoD layered para programa SAFe {programa}:
- Equipos: {lista_4_equipos} con diferentes stacks
- Niveles: Team DoD, ART DoD, Solution DoD
- Team DoD: base común + extensiones por equipo
- ART DoD: integración, system demo, documentation
- Solution DoD: deployment, compliance, stakeholder acceptance
- DoR por nivel: PI readiness, feature readiness, story readiness
```

**Output Esperado**: Documento con 3 niveles de DoD + 3 niveles de DoR, base común y extensiones.

## Caso de Uso 4: Proceso de Excepción al DoD

**Contexto**: El equipo necesita un proceso formal para manejar excepciones al DoD sin crear deuda técnica oculta.

**Prompt Template**:
```
Diseña el proceso de excepción al DoD para el proyecto {proyecto}:
- Cuándo se permite excepción: {criterios}
- Quién aprueba: {roles}
- Documentación requerida: razón, impacto, plan de payback
- Tracking: cómo se rastrea la deuda creada
- Payback SLA: máximo {n} sprints para remediar
- Métricas: exception rate, debt acumulada, payback rate
- Escalation: qué pasa si debt excede umbral
```

**Output Esperado**: Proceso documentado con template de excepción, tracking board, y reglas de escalamiento.
