# Protocolo Zero-Hallucination

> PMO-APEX — Ontologia viva
> Referencia canonica para el etiquetado de evidencia y control de alucinaciones en gestion de proyectos.

---

## Principio rector

Toda afirmacion incluida en un entregable de gestion de proyectos DEBE estar respaldada por una fuente de evidencia verificable y etiquetada explicitamente. Si la fuente no puede determinarse, la afirmacion se marca como supuesto y se somete a validacion. En contextos de PM, la trazabilidad de decisiones es critica para auditorias, steering committees y gobernanza de portfolio.

---

## Catalogo de tags de evidencia

| Tag | Significado | Nivel de confianza | Cuando usar |
|-----|-------------|-------------------|-------------|
| `[PLAN]` | Verificado en plan de proyecto, charter o WBS | **Alta** | Hallazgo confirmado en artefactos de planificacion aprobados |
| `[SCHEDULE]` | Verificado en cronograma, Gantt o linea base | **Alta** | Datos extraidos de MS Project, Jira, Azure DevOps u otra herramienta de scheduling |
| `[METRIC]` | Verificado en metricas cuantitativas o KPIs | **Alta** | Datos de EVM, burndown, velocity, SPI, CPI, throughput |
| `[STAKEHOLDER]` | Declarado por un interlocutor del proyecto | **Variable** | Informacion proporcionada verbalmente, por email o chat por un stakeholder |
| `[DECISION]` | Registrado en decision log o acta de comite | **Alta** | Decision formal documentada en governance records |
| `[INFERENCIA]` | Razonado desde patrones observados | **Media** | Conclusion derivada de evidencia parcial; logica explicita requerida |
| `[SUPUESTO]` | Asuncion no verificable — requiere validacion | **Baja** | Toda afirmacion sin evidencia directa; siempre incluir nota de validacion |
| `[HISTORICO]` | Basado en datos historicos de proyectos previos | **Media-Alta** | Benchmarks, lecciones aprendidas, retrospectivas de proyectos anteriores |
| `[CONFLICTO]` | Contradice informacion existente | **Requiere resolucion** | Datos que contradicen fuentes previas — requiere escalamiento |
| `[REDACTADO]` | Informacion sensible omitida | **N/A** | Presupuestos confidenciales, datos de RRHH, compensaciones — NUNCA incluir en entregables |

---

## Reglas de aplicacion

### Regla 1 — Etiquetado obligatorio
Toda afirmacion en un entregable debe llevar al menos un tag de evidencia. Si no puede etiquetarse, marcar obligatoriamente como `[SUPUESTO]`.

### Regla 2 — Banner de advertencia (umbral >30%)
Si mas del 30% de las afirmaciones de un entregable estan marcadas como `[SUPUESTO]`, se debe emitir un banner de advertencia visible al inicio del documento:

```markdown
> ADVERTENCIA: Este entregable contiene >30% de supuestos no validados.
> Se recomienda sesion de validacion con stakeholders antes de avanzar al siguiente gate.
> Convoque una reunion de validacion o use `/pm:validate-assumptions` para priorizar.
```

### Regla 3 — Flag de severidad critica
Si un hallazgo tiene `severity=CRITICO` y esta etiquetado como `[SUPUESTO]`, se activa un flag obligatorio:

```markdown
> VALIDACION REQUERIDA: Hallazgo critico basado en supuesto.
> Requiere confirmacion con: {stakeholder responsable}
> No proceder sin validacion explicita.
> Escalar a Steering Committee si afecta linea base de cronograma o presupuesto.
```

### Regla 4 — Prohibicion de falsa certeza
NUNCA presentar inferencias como hechos verificados. Una `[INFERENCIA]` debe incluir la cadena de razonamiento que la sustenta. En PM, inferencias sobre fechas de entrega o presupuesto sin datos de EVM son especialmente peligrosas.

### Regla 5 — Default a SUPUESTO
Ante cualquier duda sobre la fuente, siempre etiquetar como `[SUPUESTO]` con nota: _"requiere validacion con {stakeholder}"_.

### Regla 6 — Datos historicos requieren contexto
Un tag `[HISTORICO]` debe incluir la fuente del proyecto de referencia (nombre, fecha, similitud con proyecto actual). Datos historicos de hace mas de 3 anos o de industrias diferentes requieren doble etiqueta: `[HISTORICO] [INFERENCIA]`.

### Regla 7 — Decisiones requieren trazabilidad
Un tag `[DECISION]` debe incluir: quien decidio, cuando, en que foro (steering, daily, retro). Decisiones sin acta formal se degradan a `[STAKEHOLDER]`.

### Regla 8 — Conflictos requieren resolucion activa
Un tag `[CONFLICTO]` activa escalamiento obligatorio. El `risk-manager` debe registrar el conflicto en el Risk Register y asignar responsable de resolucion con fecha limite.

---

## Ejemplos de etiquetado correcto

### Ejemplo 1 — Hallazgo de planificacion
```markdown
El proyecto tiene una duracion estimada de 8 meses segun el cronograma aprobado [SCHEDULE],
con un equipo base de 12 FTEs distribuidos en 3 squads [PLAN].
La velocidad del equipo podria ser inferior en los primeros 2 sprints
debido a la curva de aprendizaje [SUPUESTO — requiere validacion con Scrum Master].
```

### Ejemplo 2 — Hallazgo de riesgo
```markdown
El SPI actual del proyecto es 0.85, indicando un retraso del 15% respecto
a la linea base [METRIC]. El PMO Director indica que se asignaran
2 recursos adicionales en el Sprint 4 [STAKEHOLDER — PMO Director].
Basado en proyectos similares, esta intervencion podria recuperar el SPI
a 0.95 en 3 sprints [HISTORICO — Proyecto Alpha, 2025-Q3].
```

### Ejemplo 3 — Conflicto de informacion
```markdown
El charter aprobado establece un presupuesto de $1.2M [PLAN], pero el
ultimo reporte de EVM muestra un EAC de $1.5M [METRIC] [CONFLICTO].
Resolucion pendiente con el Sponsor en la proxima reunion de Steering Committee.
```

---

## Integracion con quality gates

| Gate | Validacion de evidencia |
|------|------------------------|
| G0 — Security | Cero credenciales o datos sensibles expuestos en artefactos |
| G1 — Post-Risk Register | Todos los riesgos criticos tienen evidencia >=70% alta confianza |
| G1.5 — Post-Steering | Los 7 Advisors validan la base de evidencia de cada dimension |
| G2 — Post-Methodology | Metodologia seleccionada con justificacion trazable |
| G3 — Final | Consistencia cruzada: ningun entregable con >20% `[SUPUESTO]` |

---

## Gobernanza

- El `risk-manager` audita el ratio de evidencia en cada entregable.
- El `quality-auditor` verifica cumplimiento del protocolo en cada gate.
- El `project-conductor` puede bloquear avance si el umbral de supuestos se excede.
- El `delivery-lead` valida que las metricas citadas (`[METRIC]`) sean actuales (no mas de 1 sprint de antiguedad).
- Ante `[CONFLICTO]`, el `risk-manager` tiene 48h para proponer resolucion o escalar.

---

## Reglas especiales para PM

| Contexto | Regla |
|----------|-------|
| Estimaciones de esfuerzo | NUNCA usar `[PLAN]` si la estimacion no esta en un baseline aprobado |
| Velocity / Throughput | Solo usar `[METRIC]` si los datos tienen >=3 sprints de historia |
| Benchmarks de industria | Etiquetar como `[HISTORICO]` + fuente (PMI, Gartner, etc.) |
| Decisiones verbales | Degradar a `[STAKEHOLDER]` hasta que se formalicen en acta |
| Datos de presupuesto | Si son confidenciales, usar `[REDACTADO]` y referir al documento fuente |
| Predicciones de fecha | Requieren `[METRIC]` (EVM) o `[HISTORICO]`; sin ellos, `[SUPUESTO]` obligatorio |

---

*PMO-APEX — La excelencia en gestion de proyectos se construye con evidencia.*
