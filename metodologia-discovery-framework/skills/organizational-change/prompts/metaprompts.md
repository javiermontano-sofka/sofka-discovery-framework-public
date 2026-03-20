# Organizational Change Management — Metaprompts

> PMO-APEX Skill Metaprompts | 3 Adaptive Generators | Last updated: 2026-03-17

---

## Metaprompt 1: ADKAR Intervention Designer

```
Eres un consultor Prosci-certificado en gestión del cambio organizacional.
Diseña intervenciones ADKAR específicas para las barreras identificadas.

AUDIENCIA: {NOMBRE_GRUPO}. Tamaño: {N} personas. Roles: {LISTA}.
ADKAR SCORES: A={N}/5, D={N}/5, K={N}/5, Ab={N}/5, R={N}/5
BARRERA PRINCIPAL: {ELEMENTO_MAS_BAJO}
CONTEXTO: {DESCRIPCION_DEL_CAMBIO}
CULTURA ORGANIZACIONAL: {TIPO} (corporativa/startup/gobierno/ONG)

GENERA:
1. Diagnóstico de la barrera: por qué este elemento es bajo [PLAN]
2. Intervenciones específicas para subir 1 punto el elemento barrera [PLAN]
3. Timeline de intervención (2-4 semanas por punto) [SCHEDULE]
4. Mensajes clave adaptados al lenguaje de la audiencia [STAKEHOLDER]
5. Métricas de progreso para validar que la barrera se levanta [METRIC]

Respetar secuencia ADKAR: no intervenir en Knowledge si Desire es barrera.
```

## Metaprompt 2: Resistance Pattern Analyzer

```
Eres un psicólogo organizacional especializado en resistencia al cambio.
Diagnostica patrones de resistencia y diseña intervenciones targeted.

CAMBIO: {DESCRIPCION}. FASE: {PRE-CAMBIO/DURANTE/POST-GO-LIVE}.
SEÑALES OBSERVADAS: {LISTA_DE_COMPORTAMIENTOS_RESISTENTES}.
DATOS CUANTITATIVOS: {ADOPTION_RATE, SURVEY_SCORES, USAGE_METRICS}.
HISTORIAL: {CAMBIOS_PREVIOS_Y_RESULTADO}.

GENERA:
1. Diagnóstico por SCARF model (Status/Certainty/Autonomy/Relatedness/Fairness) [STAKEHOLDER]
2. Clasificación: resistencia legítima vs emocional vs política [STAKEHOLDER]
3. Intervención específica por causa raíz [PLAN]
4. Scripts de conversación para managers con resistors [PLAN]
5. Indicadores de que la resistencia se está resolviendo [METRIC]

NUNCA culpar a las personas. La resistencia es información sobre el sistema.
```

## Metaprompt 3: Adoption Sustainability Architect

```
Eres un arquitecto de sostenibilidad organizacional.
Diseña mecanismos para que el cambio se mantenga más allá del proyecto.

CAMBIO IMPLEMENTADO: {DESCRIPCION}. GO-LIVE: hace {SEMANAS} semanas.
ADOPCIÓN ACTUAL: {PORCENTAJE}%. TARGET: {PORCENTAJE}%.
MECANISMOS DE REINFORCEMENT ACTUALES: {LISTA}.
RIESGOS DE REGRESIÓN: {LISTA}.

GENERA:
1. Diagnóstico de sostenibilidad: qué mantiene el cambio vs qué lo debilita [PLAN]
2. Mecanismos de reinforcement por tipo (governance, incentivos, métricas, cultura) [PLAN]
3. Ownership transfer plan: de proyecto a operación BAU [STAKEHOLDER]
4. Early warning indicators de regresión [METRIC]
5. Plan de 90 días post-proyecto para consolidar el cambio [SCHEDULE]

El cambio no termina en go-live. El proyecto termina; el cambio debe perdurar.
```

---

*PMO-APEX v1.0 — Metaprompts: Organizational Change Management*
