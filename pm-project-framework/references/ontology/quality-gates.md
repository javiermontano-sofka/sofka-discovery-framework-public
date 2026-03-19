# Quality Gates

> PMO-APEX — Ontologia viva
> Referencia canonica de los 5 quality gates del pipeline de gestion de proyectos.

---

## Principio

Los quality gates son hard stops en el pipeline. Ningun entregable posterior puede generarse sin la aprobacion explicita del gate correspondiente. En modo `run-guided`, el pipeline pausa para solicitar aprobacion humana en cada gate.

---

## G0 — Security Gate (Pre-Pipeline)

### Momento de activacion
Al inicio de sesion, **antes** de cualquier otro gate. Se ejecuta automaticamente via hook `secrets-scan.sh` como primer paso de la secuencia SessionStart.

### Criterios de paso

- [ ] Escaneo de datos sensibles completado (`secrets-scan.sh` exit 0)
- [ ] Cero hallazgos de credenciales, tokens, o datos personales en artefactos
- [ ] `project/apex-secrets-audit.log` generado con status CLEAN
- [ ] Archivos con datos financieros revisados o enmascarados
- [ ] Datos de RRHH y compensaciones enmascarados

### Quien aprueba
- **Automatico:** `secrets-scan.sh` (exit code 0 = pasa)
- **Manual:** Usuario revisa audit log si hay hallazgos

### Que bloquea
- Datos personales sin enmascarar (nombres + salarios) → BLOQUEO ABSOLUTO
- Presupuestos confidenciales sin [REDACTADO] → Warning + recomendacion
- Credenciales de herramientas PM (Jira tokens, etc.) → BLOQUEO para `run-auto`

### Accion si no pasa
1. Presentar hallazgos al usuario (NUNCA mostrar valores sensibles, solo tipo + ubicacion)
2. Sugerir `/pm:scan-secrets` para revision detallada
3. Ofrecer enmascaramiento via `scripts/secrets-mask.sh`
4. En modo `run-guided`: continuar con warning. En `run-auto`/`run-deep`: ABORT.

---

## G1 — Post-Risk Register (Post-Baseline Triple)

### Momento de activacion
Despues de completar el entregable 06 (Risk Register) y 07 (Methodology Selection), antes de iniciar 05b (Steering Committee Review).

### Criterios de paso

- [ ] Triple baseline aprobada (scope + schedule + cost)
- [ ] Risk register completo con minimo 15 riesgos identificados
- [ ] Cada riesgo tiene probabilidad, impacto, respuesta y responsable
- [ ] Riesgos criticos (>=0.7 probabilidad x impacto) tienen plan de mitigacion detallado
- [ ] Metodologia propuesta con justificacion explicita
- [ ] Alineacion entre metodologia y contexto del proyecto verificada
- [ ] Reservas de contingencia y gestion definidas
- [ ] Cada entregable (00-07) tiene >=70% de tags de alta confianza

### Quien aprueba
- **Primario:** `project-conductor`
- **Validacion:** `quality-auditor` + `risk-manager`
- **En modo supervisado:** Usuario/sponsor

### Que bloquea
- Triple baseline incompleta (falta scope, schedule o cost)
- Risk register con menos de 10 riesgos
- Riesgos criticos sin plan de mitigacion
- >40% de afirmaciones en risk register marcadas como `[SUPUESTO]`
- Metodologia propuesta sin justificacion

### Accion si no pasa
Regresar a fase de Risk & Methodology. Completar risk register, refinar baseline, documentar justificacion de metodologia.

---

## G1.5 — Post-Steering Committee (7 Advisors)

### Momento de activacion
Despues de completar el entregable 05b (Steering Committee Review), antes de iniciar 08 (Methodology Playbook).

### Criterios de paso

- [ ] Los 7 Advisors han emitido veredicto individual (Go / No-Go / Condicional)
- [ ] Resultado: >=5/7 votos Go para avanzar
- [ ] Cada veredicto No-Go tiene justificacion documentada
- [ ] Condiciones de los votos "Condicional" estan listadas y son accionables
- [ ] Riesgos consolidados y priorizados
- [ ] Dimensiones evaluadas: schedule, budget, risk, resources, methodology, governance, stakeholder alignment

### Quien aprueba
- **Primario:** `project-conductor` (consolida veredictos)
- **Validacion:** Los 7 Advisors (veredicto individual)
- **En modo supervisado:** Sponsor valida decision Go/No-Go

### Que bloquea
- Menos de 5/7 votos Go → No-Go documentado
- Algun Advisor no emitio veredicto (evaluacion incompleta)
- Veredicto No-Go en dimension critica (budget o schedule) sin plan de remediacion
- Condiciones de votos "Condicional" no son accionables

### Accion si no pasa
- **No-Go:** Documentar razones, presentar al sponsor, evaluar re-planificacion o cancelacion
- **Condicional (<5 Go):** Resolver condiciones, re-evaluar con Advisors afectados

---

## G2 — Post-Methodology (Execution Framework Ready)

### Momento de activacion
Despues de completar el entregable 09 (Definition of Done), antes de iniciar 10 (Communication Plan).

### Criterios de paso

- [ ] Methodology Playbook completo con ceremonies, artefactos, cadencias
- [ ] Definition of Done definido para todos los niveles (story, sprint, release)
- [ ] Definition of Ready definido
- [ ] Roles y responsabilidades claros segun la metodologia
- [ ] Herramientas configuradas (Jira, ADO, etc.)
- [ ] Ceremonies calendarizadas con participantes definidos
- [ ] Consistencia con metodologia aprobada en G1 y Steering (G1.5) verificada
- [ ] Metricas de seguimiento definidas (velocity, SPI, cycle time, etc.)

### Quien aprueba
- **Primario:** `project-conductor` + `delivery-lead`
- **Validacion:** `methodology-architect` + `quality-auditor`
- **En modo supervisado:** PM / Scrum Master

### Que bloquea
- Playbook incompleto (faltan ceremonies o artefactos)
- DoD no definido o ambiguo
- Herramientas no configuradas
- Playbook contradice metodologia aprobada
- Roles sin asignar

### Accion si no pasa
Regresar a Execution Framework. Completar playbook, definir DoD, configurar herramientas.

---

## G3 — Gate Final (Project Ready / Closure Ready)

### Momento de activacion
Despues de completar el entregable 12 (Kickoff Package), antes de generar reportes (13-14). Tambien se activa al final para cierre formal.

### Criterios de paso

- [ ] Consistencia cruzada verificada entre todos los entregables (00-12)
- [ ] Excellence loop pasado (10 criterios >=8/10 promedio)
- [ ] Ningun entregable con >20% de afirmaciones `[SUPUESTO]`
- [ ] Todos los hallazgos criticos tienen evidencia de alta confianza
- [ ] Kickoff package contiene toda la informacion para iniciar ejecucion
- [ ] Changelog de sesion completo y sin gaps
- [ ] Cross-references entre entregables verificadas
- [ ] Disclaimers de estimacion incluidos donde corresponde
- [ ] Decision log actualizado con todas las decisiones de gates
- [ ] Assumption log sin supuestos criticos abiertos

### Quien aprueba
- **Primario:** `project-conductor`
- **Validacion:** Triada completa (`delivery-lead` + `risk-manager`)
- **Revision editorial:** `editorial-director`
- **En modo supervisado:** Sponsor aprueba paquete final

### Que bloquea
- Inconsistencia entre entregables (datos contradictorios)
- Excellence loop con promedio <7/10
- Entregable con >30% `[SUPUESTO]` sin banner de advertencia
- Hallazgo `severity=CRITICO` sin validar
- Kickoff package incompleto
- Supuestos criticos sin validar en assumption-log

### Accion si no pasa
El `quality-auditor` emite lista de correcciones. El `editorial-director` coordina la revision. Se usa `/pm:improve-deliverables` para evolucionar los entregables afectados.

---

## Project Health Check (8 dimensiones RAG)

Evaluacion periodica de salud del proyecto, independiente de los gates. Se ejecuta con `/pm:track-team-health` o automaticamente al generar reportes de status.

| Dimension | Verde | Amarillo | Rojo |
|-----------|-------|----------|------|
| **Schedule** | SPI >= 0.95 | 0.85 <= SPI < 0.95 | SPI < 0.85 |
| **Budget** | CPI >= 0.95 | 0.85 <= CPI < 0.95 | CPI < 0.85 |
| **Scope** | < 5% change requests | 5-15% change requests | > 15% change requests |
| **Quality** | Defect rate within DoD | Defect rate 10-20% above DoD | Defect rate > 20% above DoD |
| **Risk** | No criticos abiertos | 1-2 criticos con mitigacion | 3+ criticos o sin mitigacion |
| **Team** | Turnover < 5%, morale high | Turnover 5-15%, morale medium | Turnover > 15%, morale low |
| **Stakeholder** | Engaged, no escalations | Minor concerns | Active escalations |
| **Methodology** | Ceremonies on track | Occasional skips | Systematic non-compliance |

### Semaforo general
- **Verde:** 6+ dimensiones verdes, 0 rojas
- **Amarillo:** 4-5 dimensiones verdes, <=1 roja
- **Rojo:** <4 dimensiones verdes o >=2 rojas

---

## Resumen de gates

| Gate | Fase | Criterio clave | Umbral critico |
|------|------|---------------|----------------|
| G0 | Pre-Pipeline | Security scan clean | Cero datos sensibles |
| G1 | Post-Risk Register | Triple baseline + risk register | <40% supuestos, >=15 riesgos |
| G1.5 | Post-Steering | Veredicto 7 Advisors | >=5/7 Go |
| G2 | Post-Methodology | Playbook + DoD completos | Framework listo para ejecucion |
| G3 | Final | Consistencia cruzada | Excellence loop >=8/10 |

---

## Modos de aprobacion

| Modo | Comportamiento en gates |
|------|------------------------|
| `run-guided` | Pausa para aprobacion humana |
| `run-auto` | Auto-aprobacion con log detallado |
| `run-express` | Solo G1 simplificado |
| `run-deep` | G1 + G2 con pausa |

---

*PMO-APEX — La excelencia en gestion de proyectos se construye con evidencia.*
