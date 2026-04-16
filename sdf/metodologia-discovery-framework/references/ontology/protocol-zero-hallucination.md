# Protocolo Zero-Hallucination

> MAO Framework — Ontología viva
> Referencia canónica para el etiquetado de evidencia y control de alucinaciones.

---

## Principio rector

Toda afirmación incluida en un entregable de discovery DEBE estar respaldada por una fuente de evidencia verificable y etiquetada explícitamente. Si la fuente no puede determinarse, la afirmación se marca como supuesto y se somete a validación.

---

## Catálogo de tags de evidencia

| Tag | Significado | Nivel de confianza | Cuándo usar |
|-----|-------------|-------------------|-------------|
| `[CÓDIGO]` | Verificado directamente en código fuente | **Alta** | Hallazgo confirmado en archivos del codebase (.py, .java, .ts, etc.) |
| `[CONFIG]` | Verificado en archivos de configuración | **Alta** | Hallazgo en .yml, .env, .toml, .json, docker-compose, terraform, etc. |
| `[DOC]` | Documentado en fuentes del proyecto | **Alta** | Información extraída de specs, contratos, wikis, READMEs oficiales |
| `[INFERENCIA]` | Razonado desde patrones observados | **Media** | Conclusión derivada de evidencia parcial; lógica explícita requerida |
| `[SUPUESTO]` | Asunción no verificable — requiere validación | **Baja** | Toda afirmación sin evidencia directa; siempre incluir nota de validación |
| `[STAKEHOLDER]` | Declarado por un interlocutor del proyecto | **Variable** | Información proporcionada verbalmente, por email o chat por un stakeholder |

### Tags extendidos (RAG-Priming)

| Tag | Significado | Contexto |
|-----|-------------|----------|
| `[CONFLICTO]` | Contradice información existente | Datos que contradicen fuentes previas — requiere resolución |
| `[REDACTADO]` | Información sensible omitida | Credenciales, tokens, datos personales — NUNCA incluir en entregables |

---

## Reglas de aplicación

### Regla 1 — Etiquetado obligatorio
Toda afirmación en un entregable debe llevar al menos un tag de evidencia. Si no puede etiquetarse, marcar obligatoriamente como `[SUPUESTO]`.

### Regla 2 — Banner de advertencia (umbral >30%)
Si más del 30% de las afirmaciones de un entregable están marcadas como `[SUPUESTO]`, se debe emitir un banner de advertencia visible al inicio del documento:

```markdown
> ⚠️ ADVERTENCIA: Este entregable contiene >30% de supuestos no validados.
> Se recomienda sesión de validación con stakeholders antes de avanzar al siguiente gate.
```

### Regla 3 — Flag de severidad crítica
Si un hallazgo tiene `severity=CRÍTICO` y está etiquetado como `[SUPUESTO]`, se activa un flag obligatorio:

```markdown
> 🚨 VALIDACIÓN REQUERIDA: Hallazgo crítico basado en supuesto.
> Requiere confirmación con: {stakeholder responsable}
> No proceder sin validación explícita.
```

### Regla 4 — Prohibición de falsa certeza
NUNCA presentar inferencias como hechos verificados. Una `[INFERENCIA]` debe incluir la cadena de razonamiento que la sustenta.

### Regla 5 — Default a SUPUESTO
Ante cualquier duda sobre la fuente, siempre etiquetar como `[SUPUESTO]` con nota: _"requiere validación con {stakeholder}"_.

---

## Ejemplos de etiquetado correcto

### Ejemplo 1 — Hallazgo técnico
```markdown
El sistema utiliza PostgreSQL 14.2 como base de datos principal [CÓDIGO],
con un esquema de 47 tablas distribuidas en 3 schemas [CONFIG].
La latencia promedio de queries podría estar por encima de 200ms
bajo carga sostenida [SUPUESTO — requiere validación con equipo de DBA].
```

### Ejemplo 2 — Hallazgo funcional
```markdown
El proceso de onboarding de clientes involucra 12 pasos según la
documentación interna [DOC]. El equipo de operaciones indica que
en la práctica se omiten los pasos 8 y 9 [STAKEHOLDER — Gerente Ops].
Esto sugiere una deuda de proceso no documentada [INFERENCIA].
```

### Ejemplo 3 — Hallazgo con conflicto
```markdown
La spec técnica indica uso de microservicios [DOC], pero el codebase
muestra un monolito con módulos acoplados [CÓDIGO] [CONFLICTO].
Resolución pendiente con el Technical Lead.
```

---

## Integración con quality gates

| Gate | Validación de evidencia |
|------|------------------------|
| G1 — Post-Escenarios | Todos los escenarios deben tener ≥70% de tags de alta confianza |
| G1.5 — Post-Feasibility | Los 7 Sabios validan la base de evidencia de cada dimensión |
| G2 — Post-Roadmap | FTE-meses con fuente explícita; Monte Carlo documentado |
| G3 — Final | Consistencia cruzada: ningún entregable con >20% `[SUPUESTO]` |

---

## Gobernanza

- El `risk-controller` audita el ratio de evidencia en cada entregable.
- El `quality-guardian` verifica cumplimiento del protocolo en cada gate.
- El `discovery-conductor` puede bloquear avance si el umbral de supuestos se excede.

---

*MAO Framework — La excelencia no se improvisa, se diseña.*
