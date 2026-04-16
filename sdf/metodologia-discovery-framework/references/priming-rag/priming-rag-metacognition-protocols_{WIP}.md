# Priming-RAG: Meta-Cognition Protocols
> MetodologIA Discovery Framework — Protocolos de razonamiento y spawning de comites
> Generado: 2026-03-17 | Version: v1.4.0
> Fuente: `references/ontology/agent-committee.md`, `CLAUDE.md`, CHANGELOG v1.4.0

---

## Resumen ejecutivo

- Dos protocolos de meta-cognicion: FULL (triada) y LIGHT (demas agentes) [DOC]
- Committee spawning formalizado con reglas de composicion [DOC]
- Confidence scoring 0.0-1.0 en todas las decisiones criticas [DOC]
- Bias scan obligatorio para prevenir sesgos en analisis [DOC]
- Escalation protocol cuando confidence < 0.6 [INFERENCIA]

---

## Protocolo FULL (Triada Permanente)

Usado por: `discovery-conductor`, `delivery-manager`, `risk-controller` [DOC]

### Componentes

| Componente | Descripcion |
|-----------|-------------|
| **Structured Reasoning** | Razonamiento paso a paso con justificacion explicita |
| **Skeleton-of-Thought** | Esqueleto del argumento antes de desarrollo completo |
| **Chain-of-Code** | Cuando aplica, razonar sobre codigo como cadena logica |
| **Confidence Scoring** | Escala 0.0-1.0 en cada afirmacion critica |
| **Bias Scan** | Verificacion de sesgos cognitivos (confirmation, anchoring, availability) |

### Flujo de ejecucion

```
1. Descomponer problema (Skeleton-of-Thought)
2. Razonar cada componente (Structured Reasoning)
3. Si involucra codigo → Chain-of-Code
4. Asignar confidence score a conclusiones
5. Ejecutar bias scan
6. Si confidence < 0.6 → escalar a Think Tank
7. Documentar razonamiento con evidence tags
```

---

## Protocolo LIGHT (Agentes no-triada)

Usado por: los 98 agentes restantes [DOC]

### Componentes

| Componente | Descripcion |
|-----------|-------------|
| **Decompose** | Descomponer tarea en sub-tareas manejables |
| **Evidence-Check** | Verificar cada afirmacion contra fuentes |
| **Bias Scan** | Version simplificada del scan de sesgos |
| **Structure-First** | Organizar output antes de redactar |
| **Escalate** | Si incertidumbre alta → escalar a triada |

### Flujo de ejecucion

```
1. Decompose: dividir tarea
2. Evidence-Check: cada claim con tag
3. Bias Scan: revision rapida de sesgos
4. Structure-First: esqueleto del entregable
5. Si bloqueado → Escalate a triada
```

---

## Committee Spawning

### Reglas de composicion

El `discovery-conductor` compone el comite de expertos siguiendo estas reglas: [DOC]

1. **Triada siempre activa** — conductor + delivery-manager + risk-controller
2. **Core team por fase** — 10 agentes activados segun fase actual del pipeline
3. **Especialistas por servicio** — seleccionados de 36 especialistas segun `{TIPO_SERVICIO}`
4. **Think Tank en feasibility** — 7 Sabios para evaluacion multidimensional
5. **Comite editorial en output** — editorial-director + content-strategist + format-specialist + editorial-publisher
6. **Max 12 agentes simultaneos** — para mantener eficiencia de contexto [INFERENCIA]

### Configuracion por TIPO_SERVICIO

| Tipo | Especialistas activados |
|------|------------------------|
| SDA | solutions-architect, backend-developer, devops-engineer, technical-lead |
| QA | qa-strategist, quality-engineer, testing-strategist, chaos-engineer |
| Data-AI | data-architect, data-scientist, ai-architect, analytics-architect |
| Cloud | cloud-architect, platform-engineer, finops-specialist, devops-engineer |
| Management | agile-coach, implementation-analyst, enterprise-coach |
| RPA | process-automation-specialist, automation-architect, business-analyst |
| UX-Design | ux-researcher, ux-strategist, frontend-developer, accessibility-specialist |
| Digital-Transformation | transformation-architect, enterprise-coach, change-catalyst |

### Coaches (exclusivos MAO)

MAO extiende el modelo de 48 agentes SDF con 45 coaches y especialistas adicionales: [CÓDIGO]

- Activacion bajo demanda o en assessments especializados
- Incluyen coaching metodologico, liderazgo, productividad, design thinking
- No participan en pipeline estandar — son recursos de apoyo [INFERENCIA]

---

## Confidence Scoring

### Escala

| Rango | Significado | Accion |
|-------|-------------|--------|
| 0.9-1.0 | Alta confianza, evidencia solida | Proceder sin revision |
| 0.7-0.89 | Confianza moderada, evidencia parcial | Documentar gaps |
| 0.6-0.69 | Confianza baja, supuestos significativos | Buscar evidencia adicional |
| < 0.6 | Confianza insuficiente | Escalar a Think Tank o triada |

### Aplicacion

- Cada gate decision requiere confidence score [DOC]
- Feasibility dimensions se evaluan individualmente [DOC]
- Scores se documentan en entregables para trazabilidad [INFERENCIA]

---

## Bias Scan

### Sesgos verificados

| Sesgo | Descripcion | Mitigacion |
|-------|-------------|------------|
| **Confirmation** | Buscar solo evidencia que confirme | Buscar contra-evidencia activamente |
| **Anchoring** | Fijarse en primer dato recibido | Evaluar multiples fuentes |
| **Availability** | Sobreestimar lo reciente/memorable | Buscar datos historicos |
| **Sunk Cost** | Continuar por inversion previa | Evaluar desde cero |
| **Optimism** | Subestimar riesgos/esfuerzo | Aplicar factor de correccion |

---

## Think Tank de 7 Sabios

### Cuando se activa

- Phase 3: Feasibility multidimensional [DOC]
- Confidence < 0.6 en decision critica [INFERENCIA]
- Desacuerdo entre agentes del comite [INFERENCIA]
- Solicitud explicita del conductor [DOC]

### 7 Dimensiones de feasibility

| Dimension | Sabio responsable |
|-----------|-------------------|
| Tecnica | research-scientist |
| Economica | economics-researcher |
| Sistemica | systems-theorist |
| Tecnologica | technology-scout |
| Integracion | integration-researcher |
| Infraestructura | hardware-systems-engineer |
| Datos | data-scientist |

---

## Keywords y hashtags

`#metacognicion` `#FULL` `#LIGHT` `#confidence` `#bias-scan` `#committee` `#spawning` `#think-tank` `#7-sabios` `#escalation` `#triada`

---

## Query hooks

- "Que protocolo usa la triada?" -> FULL (Structured Reasoning + Skeleton + Chain-of-Code + confidence + bias)
- "Que protocolo usan los demas agentes?" -> LIGHT (decompose + evidence-check + bias + structure-first + escalate)
- "Cuando se activa el Think Tank?" -> Feasibility (Phase 3) o confidence < 0.6
- "Como se compone el comite?" -> Triada + core team (fase) + especialistas (servicio) + max 12 simultaneos
- "Que es el bias scan?" -> Verificacion de 5 sesgos cognitivos en cada analisis

---

## Cross-references

- Ver: `priming-rag-agents-roster.md` para roster completo de 101 agentes
- Ver: `priming-rag-methodology-overview_{WIP}.md` para pipeline y gates
- Ver: `priming-rag-mao-philosophy_{WIP}.md` para principios de MAO
