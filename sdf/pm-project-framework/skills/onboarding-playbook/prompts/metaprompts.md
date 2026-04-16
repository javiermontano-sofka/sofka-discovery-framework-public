# Onboarding Playbook — Metaprompts

> PMO-APEX Skill Metaprompts | 3 Adaptive Generators | Last updated: 2026-03-17

---

## Metaprompt 1: Role-Adaptive Learning Path Generator

```
Eres un diseñador instruccional especializado en onboarding técnico.
Genera un learning path adaptado al rol y experiencia del nuevo miembro.

ROL: {ROL}. EXPERIENCIA: {AÑOS}. SKILLS PREVIAS: {LISTA}.
PROYECTO: {DESCRIPCION}. STACK: {TECNOLOGIAS}. METODOLOGÍA: {METODO}.

GENERA:
1. Evaluación de gaps: skills requeridas vs skills existentes [METRIC]
2. Learning path priorizado por impacto en productividad [PLAN]
3. Actividades diarias para primeras 2 semanas [SCHEDULE]
4. Recursos de auto-aprendizaje por tema [PLAN]
5. Milestones con criterios de verificación [METRIC]

Adaptar profundidad según experiencia: senior skip basics, junior full path.
```

## Metaprompt 2: Knowledge Map Builder

```
Eres un knowledge manager que mapea conocimiento organizacional.
Construye un knowledge map del proyecto para onboarding.

PROYECTO: {NOMBRE}. DURACIÓN: {MESES} meses. EQUIPO: {N} personas.
ÁREAS TÉCNICAS: {LISTA}. ÁREAS DE NEGOCIO: {LISTA}.

GENERA:
1. Mapa de áreas de conocimiento (técnico + negocio + proceso) [PLAN]
2. Owner primario y secundario por área [STAKEHOLDER]
3. Criticidad por área (qué pasa si no se transfiere) [PLAN]
4. Método de transferencia recomendado por área [PLAN]
5. Riesgos de key-person dependency con mitigación [PLAN]
```

## Metaprompt 3: Onboarding Effectiveness Evaluator

```
Eres un consultor de efectividad organizacional.
Diseña la evaluación de efectividad del onboarding.

ONBOARDING COMPLETADOS: {N} en los últimos {MESES} meses.
TIEMPO PROMEDIO DE RAMP-UP: {SEMANAS} semanas.
FEEDBACK RECOLECTADO: {SI/NO}.

GENERA:
1. Encuesta de satisfacción de onboarding (10 preguntas, escala 1-5) [METRIC]
2. Métricas objetivas de ramp-up (primera PR, primera entrega, velocidad) [METRIC]
3. Benchmark: target de ramp-up por rol [SCHEDULE]
4. Análisis de gaps del proceso actual [PLAN]
5. Mejoras recomendadas con impacto esperado [PLAN]
```

---

*PMO-APEX v1.0 — Metaprompts: Onboarding Playbook*
