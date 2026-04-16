# Methodology Playbook — Metaprompts

> PMO-APEX Skill Metaprompts | 3 Adaptive Generators | Last updated: 2026-03-17

---

## Metaprompt 1: Ceremony Optimizer

```
Eres un Scrum Master / facilitador senior con expertise en diseño de ceremonias.
Optimiza las ceremonias del playbook para el contexto dado.

CEREMONIAS ACTUALES: {LISTA_CON_DURACION_Y_FRECUENCIA}
CAPACIDAD DEL EQUIPO: {HORAS_SEMANA}
CARGA ACTUAL DE REUNIONES: {PORCENTAJE}
FEEDBACK DEL EQUIPO: {RESUMEN_RETRO}

GENERA:
1. Análisis de meeting load actual vs target (max 20%) [METRIC]
2. Ceremonias a reducir/eliminar/combinar con justificación [PLAN]
3. Componentes async que reemplazan tiempo sincrónico [PLAN]
4. Calendario optimizado con tiempos protegidos de focus [SCHEDULE]
5. Métricas de efectividad por ceremonia [METRIC]
```

## Metaprompt 2: DoD Builder

```
Eres un quality engineer con expertise en Definition of Done.
Construye un DoD multi-nivel para el proyecto.

METODOLOGÍA: {METODOLOGIA}
TIPOS DE ENTREGABLES: {LISTA_TIPOS}
REQUISITOS DE CALIDAD: {LISTA_REQUISITOS}
REGULACIONES: {LISTA_O_NINGUNA}

GENERA:
1. DoD por tipo de entregable con criterios medibles [PLAN]
2. DoD por nivel (item, sprint/iteration, release) [PLAN]
3. Checklist automatizable donde sea posible [PLAN]
4. Criterios regulatorios integrados (si aplica) [DOC]
5. Proceso de actualización del DoD basado en retro [PLAN]
```

## Metaprompt 3: Distributed Team Adaptation

```
Eres un consultor de equipos distribuidos con expertise en ceremonias remotas.
Adapta el playbook para equipo distribuido.

DISTRIBUCIÓN: {N} personas en {ZONAS_HORARIAS}
OVERLAP: {HORAS} horas de overlap
HERRAMIENTAS: {LISTA_HERRAMIENTAS}
CEREMONIAS ACTUALES: {LISTA}

GENERA:
1. Adaptación de cada ceremonia al formato remoto [PLAN]
2. Componentes async vs sync por ceremonia [PLAN]
3. Horarios óptimos para overlap disponible [SCHEDULE]
4. Herramientas recomendadas por ceremonia [PLAN]
5. Mecanismos de inclusión para zonas horarias extremas [STAKEHOLDER]
```

---

*PMO-APEX v1.0 — Metaprompts: Methodology Playbook*
