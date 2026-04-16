# Use Case Prompts — Change Readiness Assessment

> 7 prompts listos para usar con la skill `change-readiness-assessment`. Copiar y adaptar según contexto del proyecto.

---

## Prompt 1: Pre-Transformation Readiness (Full Assessment)

```
Evalúa la readiness organizacional para el proyecto {PROYECTO}.

Contexto: {DESCRIPCIÓN DEL CAMBIO}
Stakeholders: {LISTA DE GRUPOS AFECTADOS}
Timeline: {FECHA OBJETIVO DE GO-LIVE}

Usa modo diagnóstico completo (7 secciones). Incluye ADKAR scoring por grupo,
resistance heat map, y plan de intervención priorizado.

Artifacts disponibles: {RUTA A DISCOVERY ARTIFACTS}
```

**Cuándo usar:** Antes de iniciar Phase 2 de un proyecto de transformación. Cuando se necesita una evaluación completa para decidir si la organización puede absorber el cambio propuesto.

---

## Prompt 2: Quick Pulse Check

```
Realiza un pulse check rápido de readiness para {PROYECTO}.

Modo: rapido
Enfoque: Solo S1 (Impact Profile), S2 (ADKAR simplificado), S3 (Resistance snapshot)

Grupos a evaluar: {LISTA DE GRUPOS}
Cambio evaluado: {DESCRIPCIÓN BREVE}

Resultado esperado: Semáforo por grupo (🟢🟡🔴) + top 3 acciones inmediatas.
```

**Cuándo usar:** Check-in quincenal durante transformaciones en curso. Cuando se necesita una lectura rápida sin assessment completo.

---

## Prompt 3: Post-Go-Live Readiness

```
Evalúa la readiness post-go-live para {PROYECTO}.

Han pasado {N} semanas desde el go-live.
Métricas actuales:
- Adopción: {%}
- Tickets de soporte: {NÚMERO/SEMANA}
- Satisfacción: {SCORE}

Evalúa: ¿La organización absorbió el cambio? ¿Qué intervenciones de
reinforcement se necesitan? ¿Hay resistencia residual?

Modo: continuo (delta vs. assessment pre-go-live)
```

**Cuándo usar:** 2, 4 y 8 semanas después del go-live. Para evaluar si el cambio se está sosteniendo y dónde reforzar.

---

## Prompt 4: M&A Integration Readiness

```
Evalúa la readiness para integración post-fusión/adquisición.

Empresa adquiriente: {EMPRESA A}
Empresa adquirida: {EMPRESA B}

Cambios a evaluar:
- Integración de sistemas (ERP, CRM, etc.)
- Unificación de procesos operativos
- Reestructuración organizacional
- Alineación cultural

Genera scorecards SEPARADOS por entidad + vista combinada.
Incluye dimensión de "culture clash" en el resistance heat map.
```

**Cuándo usar:** Post-cierre de M&A, antes de iniciar integración técnica. Requiere edge case de dual-org assessment.

---

## Prompt 5: Agile Transformation Readiness

```
Evalúa la readiness organizacional para adopción de prácticas ágiles.

Tipo de transformación: {SCRUM/SAFe/Kanban/Custom}
Alcance: {EQUIPOS/DEPARTAMENTOS AFECTADOS}
Estado actual: {WATERFALL/HÍBRIDO/PARCIALMENTE ÁGIL}

Enfoque especial en:
- Resistencia de middle management (pérdida de control percibida)
- Knowledge gap en prácticas ágiles
- Cultural readiness (jerarquía → autonomía)
- Capacity para ceremonia overhead (dailies, retros, etc.)
```

**Cuándo usar:** Antes de iniciar una transformación ágil. El barrier point típico es Desire en middle management y Knowledge en equipos.

---

## Prompt 6: Cloud Migration Readiness

```
Evalúa la readiness organizacional para migración a cloud.

Migración: {ON-PREM → AWS/Azure/GCP}
Workloads afectados: {NÚMERO Y TIPO}
Equipos afectados: {INFRA, DEVS, OPS, SEGURIDAD, FINANZAS}

Enfoque especial en:
- Readiness técnico vs. organizacional (no solo si PUEDEN, sino si QUIEREN)
- Impacto en roles de infraestructura (reskilling vs. redundancy)
- FinOps readiness (nuevo modelo de costos)
- Security team readiness (shared responsibility model)
```

**Cuándo usar:** Pre-migración cloud. Complementa el cloud readiness assessment técnico con la dimensión organizacional.

---

## Prompt 7: Leadership Alignment Assessment

```
Evalúa el nivel de alineación del equipo de liderazgo para {PROYECTO}.

Variante: ejecutiva
Stakeholders: Solo nivel C-Suite y VPs ({LISTA})

Enfoque:
- ¿Todos los líderes entienden y apoyan el cambio? (Awareness + Desire)
- ¿Hay mensajes contradictorios hacia la organización?
- ¿El sponsor tiene legitimidad y disponibilidad?
- ¿Middle management tiene mandato claro?

Output: Scorecard de alineación + recomendaciones para cerrar brechas
antes de comunicar al resto de la organización.
```

**Cuándo usar:** Antes de lanzar comunicación masiva sobre un cambio. Si el liderazgo no está alineado, cualquier comunicación será contradictoria.

---

## Notas de Uso

- Todos los prompts asumen modo `piloto-auto` y formato `markdown` salvo indicación contraria
- Reemplazar `{PLACEHOLDERS}` con datos específicos del proyecto
- Combinar prompts según necesidad: por ejemplo, Prompt 7 (Leadership) antes de Prompt 1 (Full Assessment)
- Los prompts 2 y 3 son ideales para el modo `continuo` de la skill

---

**Autor:** Javier Montaño | **Última actualización:** 13 de marzo de 2026
