# Registro de Lecciones Aprendidas — Acme Corp

> **Proyecto**: Acme Corp ERP Modernization | **Fecha**: 2026-03-17 | **Estado**: {WIP}
> **Fase**: Cierre de Fase 3 (Implementación) | **Lecciones capturadas**: 12

---

## TL;DR
Registro de 12 lecciones aprendidas capturadas durante la Fase 3 del proyecto de modernización ERP. 4 lecciones de éxito, 6 de mejora, 2 de fallo. Los patrones dominantes son: subestimación de integración con terceros (3 lecciones) y efectividad de pair programming cross-equipo (2 lecciones). [METRIC]

---

## Lecciones Registradas

### LL-001: Integración con API de pagos tomó 3x el tiempo estimado
| Campo | Valor |
|-------|-------|
| **Categoría** | Técnica / Estimación |
| **Tipo** | Fallo |
| **Contexto** | Sprint 4-7: Integración con pasarela de pagos del proveedor FinPay [PLAN] |
| **Lección** | La documentación del proveedor era incompleta; rate limits no documentados causaron rediseño de la arquitectura de retry [METRIC] |
| **Causa raíz** | No se realizó PoC técnico antes de comprometer cronograma de integración [PLAN] |
| **Recomendación** | Para toda integración con API de terceros, ejecutar PoC de 1 semana con datos de volumen producción antes de estimar [PLAN] |
| **Impacto** | 3 semanas de retraso; 12 FTE-días adicionales [METRIC] |
| **Aplicabilidad** | Todo proyecto con integración de APIs de terceros |
| **Prioridad** | Alta |

### LL-002: Pair programming cross-equipo aceleró transferencia de conocimiento
| Campo | Valor |
|-------|-------|
| **Categoría** | Personas / Técnica |
| **Tipo** | Éxito |
| **Contexto** | Sprint 5-6: Equipo Alpha necesitaba conocimiento del módulo de inventario del Equipo Beta [STAKEHOLDER] |
| **Lección** | 3 sesiones de pair programming (4h cada una) transfirieron conocimiento que hubiera tomado 2 semanas con documentación [METRIC] |
| **Causa raíz** | Conocimiento tácito se transfiere mejor en contexto de trabajo real [INFERENCIA] |
| **Recomendación** | Establecer sesiones semanales de pair programming cross-equipo para conocimiento compartido [PLAN] |
| **Impacto** | Ahorro estimado de 8 FTE-días vs. enfoque de documentación [METRIC] |
| **Aplicabilidad** | Proyectos multi-equipo con conocimiento de dominio concentrado |
| **Prioridad** | Alta |

### LL-003: Retrospectivas sin follow-up pierden credibilidad
| Campo | Valor |
|-------|-------|
| **Categoría** | Proceso |
| **Tipo** | Mejora |
| **Contexto** | Sprint 1-4: Equipo identificó 15 action items en retros; solo 3 se completaron [METRIC] |
| **Lección** | Action items de retrospectiva sin owner y fecha se pierden; el equipo dejó de proponer mejoras [STAKEHOLDER] |
| **Causa raíz** | No había mecanismo de tracking de action items de retro dentro del sprint backlog [PLAN] |
| **Recomendación** | Incluir action items de retro como PBIs del sprint siguiente con acceptance criteria verificable [PLAN] |
| **Impacto** | Moral del equipo afectada; pérdida de oportunidades de mejora [STAKEHOLDER] |
| **Aplicabilidad** | Todos los proyectos Agile con retrospectivas |
| **Prioridad** | Media |

---

## Patrones Organizacionales Identificados

| Patrón | Frecuencia | Lecciones Relacionadas | Recomendación Organizacional |
|--------|:---:|---|---|
| Subestimación de integración terceros | 3 de 12 | LL-001, LL-005, LL-009 | Política PMO: PoC obligatorio antes de estimación de integración [PLAN] |
| Pair programming como KT | 2 de 12 | LL-002, LL-008 | Práctica estándar para proyectos multi-equipo [PLAN] |
| Retro items sin seguimiento | 2 de 12 | LL-003, LL-011 | Template de retro con tracking automático en backlog [PLAN] |

---

## Distribución por Tipo

| Tipo | Cantidad | Porcentaje |
|------|:---:|:---:|
| Éxito | 4 | 33% [METRIC] |
| Mejora | 6 | 50% [METRIC] |
| Fallo | 2 | 17% [METRIC] |

---

*PMO-APEX v1.0 — Sample Output: Lessons Register*
*Sofka, your technology partner.*
