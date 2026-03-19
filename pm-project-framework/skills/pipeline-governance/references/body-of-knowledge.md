# Body of Knowledge — Pipeline Governance

> PMO-APEX Skill: `pipeline-governance` · Dominio: Quality Gates & Phase Transitions
> Última actualización: 2026-03-17

---

## 1. Fundamentos Teóricos

### 1.1 Quality Gates como Puntos de Decisión
Un quality gate es un punto de decisión formal donde se evalúa si el proyecto cumple criterios mínimos para avanzar a la siguiente fase. Los gates no son ceremonias — son controles de calidad con consecuencias reales [DOC].

### 1.2 Estructura de Gates APEX (G0-G3)
| Gate | Nombre | Propósito | Criterio Principal |
|------|--------|-----------|-------------------|
| G0 | Security Gate | Verificar que no hay credenciales expuestas | Zero secrets unmasked [PLAN] |
| G1 | Discovery Gate | Validar que el discovery está completo | Evidencia suficiente para planificar [PLAN] |
| G1.5 | Planning Gate | Verificar que la planificación es viable | Baselines aprobadas [PLAN] |
| G2 | Execution Gate | Confirmar readiness para ejecución | Recursos asignados, riesgos mitigados [PLAN] |
| G3 | Closure Gate | Verificar completitud de entregables | Acceptance criteria cumplidos [PLAN] |

### 1.3 Data Contracts entre Fases
Cada fase produce artefactos que son prerequisitos de la siguiente. Los data contracts definen qué artefactos debe producir cada fase y qué calidad mínima deben tener para que la siguiente fase pueda consumirlos [DOC].

## 2. Marcos de Referencia

### 2.1 Stage-Gate (Cooper)
El modelo Stage-Gate de Robert Cooper define gates como puntos de decisión GO/KILL/HOLD/RECYCLE. APEX adapta esto a GO/CONDITIONAL GO/NO-GO para mayor granularidad sin la complejidad de RECYCLE [DOC].

### 2.2 PRINCE2 Quality Review Technique
PRINCE2 define un proceso formal de quality review con roles (Chairman, Presenter, Reviewer). APEX simplifica esto manteniendo la separación entre quien produce y quien valida [DOC].

### 2.3 SAFe Inspect & Adapt
SAFe usa PI System Demo e Inspect & Adapt como gates implícitos al final de cada PI. APEX mapea estos a G1.5 (PI Planning) y G2 (PI Execution) [DOC].

## 3. Criterios de Gate

### 3.1 Criterios Mandatorios vs. Opcionales
- **Mandatorios**: Deben cumplirse para GO. Fallo = NO-GO automático.
- **Opcionales**: Mejoran la calidad pero no bloquean. Fallo = condición documentada.

### 3.2 Evidence Audit
Cada gate incluye un audit de evidence tags:
- Contar `[SUPUESTO]` vs. total de assertions
- Si `[SUPUESTO]` > 30% → warning banner obligatorio
- Si `severity=CRÍTICO` + `[SUPUESTO]` → flag para validación mandatoria

### 3.3 Umbrales por Gate
| Gate | Min Evidence Coverage | Max [SUPUESTO] | Min Deliverables |
|------|----------------------|----------------|------------------|
| G0 | N/A | N/A | Security scan pass |
| G1 | 70% | 40% | Discovery artifacts |
| G1.5 | 80% | 30% | Baselines approved |
| G2 | 90% | 20% | Execution readiness |
| G3 | 95% | 10% | All deliverables |

## 4. Decisiones de Gate

### 4.1 GO
Todos los criterios mandatorios cumplidos. Evidencia suficiente. Aprobación formal para avanzar.

### 4.2 CONDITIONAL GO
Criterios mandatorios cumplidos con condiciones. Se documentan acciones pendientes con owner, deadline, y método de verificación. La siguiente fase puede iniciar pero las condiciones deben resolverse antes del próximo gate.

### 4.3 NO-GO
Uno o más criterios mandatorios fallidos. Se documenta qué debe cambiar y el esfuerzo estimado para remediar. El proyecto permanece en la fase actual hasta que los criterios se cumplan.

## 5. Anti-patrones de Governance

| Anti-patrón | Consecuencia | Corrección |
|-------------|-------------|------------|
| Gate rubber-stamping | Falsa confianza, problemas ocultos | Evaluación criterio por criterio |
| Gate bypass sin waiver | Governance violada, precedente peligroso | Waiver formal documentado |
| Conditional sin follow-up | Condiciones nunca resueltas | Verificación mandatoria en siguiente gate |
| Gate uniformes | Overhead innecesario en proyectos simples | Rigor proporcional a riesgo |
| Gate como castigo | Equipos evitan transparency | Gates como ayuda, no auditoría |

## 6. Integración con Pipeline APEX

La pipeline governance se integra con:
- **Session automation**: Gate status tracked en `session-state.json`
- **Output engineering**: Gate reports producidos con Excellence Loop
- **Risk management**: Risk register reviewed en cada gate
- **Stakeholder management**: Gate decisions comunicadas según comms plan

## 7. Referencias Bibliográficas

- Cooper, R.G. (2017). *Winning at New Products* — Stage-Gate model.
- PMI (2021). *PMBOK Guide 7th Edition* — Delivery Performance Domain.
- Axelos (2017). *PRINCE2* — Quality review technique, stage boundaries.
- SAFe (2023). *PI Planning and Inspect & Adapt* — Agile gate equivalents.
- ISO 21500:2021 — Quality management in projects.
