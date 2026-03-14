---
name: rpa-discovery
description: >
  RPA and process automation discovery — process landscape assessment, automation opportunity scoring,
  bot design architecture, platform evaluation, process mining, ROI projection, and automation roadmap.
  Use when the user asks to "evaluate RPA readiness", "assess automation opportunities", "process automation discovery",
  "bot architecture design", "RPA platform comparison", "automation roadmap", "process mining analysis",
  "identify automation candidates", "RPA ROI analysis", or mentions "robotic process automation",
  "attended/unattended bots", "automation CoE", "process digitization".
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# RPA Discovery — Process Automation Assessment & Roadmap

Genera un assessment de 7 secciones para iniciativas de RPA y automatizacion de procesos: inventario de procesos (BPMN 2.0), scoring de oportunidades de automatizacion, arquitectura de bots, evaluacion de plataformas, resultados de process mining, proyeccion de ROI, y hoja de ruta de automatizacion. Fundamentado en estandares abiertos: Six Sigma DMAIC, BPMN 2.0, y principios de process mining (IEEE Task Force on Process Mining).

## Principio Rector

> *La automatizacion sin comprension del proceso es la forma mas rapida de escalar un problema. Primero se entiende, luego se optimiza, y solo entonces se automatiza.*

1. **Automatizar un proceso roto es amplificar el error.** Antes de considerar un bot, el proceso debe estar documentado, estabilizado y medido. La automatizacion es el ultimo paso, no el primero. El ciclo DMAIC (Define, Measure, Analyze, Improve, Control) de Six Sigma precede cualquier decision de automatizacion.
2. **El scoring objetivo reemplaza la intuicion.** Cada proceso candidato se evalua con criterios cuantificables (datos estructurados, reglas estables, volumen, repetitividad, propension a error). La priorizacion emerge de los datos, no de la presion politica.
3. **El ROI de RPA es un espejismo sin gobernanza.** Bots sin monitoreo, sin manejo de excepciones, sin actualizacion ante cambios del proceso subyacente generan deuda de automatizacion que erosiona el retorno inicial.

## Inputs

- `$1` — Path to process documentation or project workspace (default: current working directory)
- `$2` — Analysis depth: `full` (default), `executive` (S1, S2, S6, S7 only)

Parse from `$ARGUMENTS`.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
  - **piloto-auto**: Auto para inventario de procesos y scoring, HITL para decisiones de plataforma y arquitectura de bots.
  - **desatendido**: Cero interrupciones. Analisis completo automatizado. Supuestos documentados.
  - **supervisado**: Autonomo con reportes al completar cada seccion.
  - **paso-a-paso**: Confirma antes de cada seccion del analisis.
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40% — S1, S2, S6, S7 only) | `tecnica` (full, default)
- `{TIPO_SERVICIO}`: `RPA` (fixed for this skill)

If reference materials exist, load them:

```
Read ${CLAUDE_SKILL_DIR}/references/
```

## Input Requirements

**Mandatory:**
- Documentacion de procesos (BPMN, diagramas de flujo, o descripciones textuales)
- Metricas de volumen por proceso (transacciones/dia, frecuencia)
- Inventario de aplicaciones involucradas en los procesos

**Recommended:**
- Datos de process mining (event logs en formato XES o CSV)
- Inventario de bots existentes (si aplica)
- Metricas de error/rework por proceso
- Evaluaciones previas de automatizacion
- Stakeholder interviews o encuestas de process owners

## Assumptions & Limits

**Assumptions:**
- Los procesos candidatos tienen documentacion basica o process owners accesibles
- Las aplicaciones involucradas permiten interaccion via UI o API
- Existe voluntad organizacional para adoptar automatizacion
- No se asume una plataforma RPA predeterminada

**Cannot do:**
- Implementar bots o configurar plataformas RPA (requiere engagement de implementacion)
- Medir tiempos de proceso en produccion (requiere process mining en vivo)
- Evaluar licenciamiento especifico de plataformas (requiere cotizacion del vendor)
- Negociar con vendors de plataformas RPA

## Workarounds When Inputs Missing

| Missing Input | Impact | Workaround |
|---|---|---|
| No BPMN documentation | Cannot map process landscape | Entrevistas con process owners; documentacion narrativa; flag como [SUPUESTO] |
| No volume metrics | Cannot score automation priority | Estimaciones de process owners con rangos (bajo/medio/alto); flag como [SUPUESTO] |
| No process mining data | Cannot validate bottlenecks | Analisis basado en documentacion + entrevistas; recomendar process mining como fase previa |
| No existing bot inventory | Cannot assess current state | Asumir greenfield; flag como supuesto si hay indicios de automatizacion previa |
| No error metrics | Cannot quantify error-proneness | Evaluacion cualitativa con process owners; flag confianza reducida en scoring |

## Edge Cases

- **Proceso con >20 variantes:** Agrupar variantes por decision points principales. Analizar las 3 variantes de mayor volumen. Recomendar simplificacion antes de automatizacion.
- **Aplicaciones legacy sin API:** Evaluar viabilidad de automatizacion via UI. Flag riesgo de fragilidad. Considerar modernizacion previa.
- **Regulacion estricta (SOX, GDPR):** Elevar requisitos de audit trail y credential management. Evaluar compliance por proceso.
- **Multi-plataforma existente:** Mapear bots por plataforma. Evaluar consolidacion vs coexistencia. Analizar interoperabilidad.
- **Procesos cross-funcionales:** Mapear handoffs entre departamentos. Evaluar impacto organizacional. Considerar process orchestration vs task automation.
- **>100 procesos candidatos:** Screening rapido con criterios binarios (digital/no-digital, reglas claras/ambiguas). Scoring detallado solo para top-30.

## Trade-off Matrix

| Decision | Enables | Constrains | When to Use |
|---|---|---|---|
| **Full 7-section analysis** | Maximum depth, complete automation roadmap | 5-7 dias, alto consumo de tokens | Programas de automatizacion enterprise, >50 procesos |
| **Executive variant** (S1+S2+S6+S7) | Quick wins identification, decision-ready | No incluye arquitectura de bots ni evaluacion de plataforma | Business case inicial, executive sponsor alignment |
| **Platform-first** (S4 deep) | Rapid platform selection | Menor profundidad en proceso | Cuando la decision de plataforma es urgente |
| **Process-first** (S1+S2 deep) | Solid process foundation | No llega a solucion tecnica | Organizaciones sin documentacion de procesos |

## 7-Section Framework

### S1: Process Landscape Assessment

Inventario completo de procesos candidatos a automatizacion, fundamentado en BPMN 2.0.

**Metodologia:** Aplicar Value Stream Mapping (Lean) para identificar waste antes de evaluar automatizacion. Principio clave: no automatizar procesos con desperdicio — primero eliminar, luego automatizar.

**Entregables:**
- Inventario BPMN de procesos con clasificacion por area funcional
- Analisis de volumen/frecuencia por proceso (transacciones/dia, periodicidad)
- Clasificacion de complejidad: simple (1-5 pasos, 1 aplicacion), medio (5-15 pasos, 2-3 aplicaciones), complejo (>15 pasos, >3 aplicaciones, decisiones condicionales)
- Cuantificacion de esfuerzo manual por proceso (FTE-horas/mes)
- Mapeo de process owners y stakeholders por proceso
- Identificacion de waste (Lean): esperas, retrabajo, transporte de informacion, sobreproduccion

**Formato de inventario:**

| ID | Proceso | Area | Volumen/dia | Frecuencia | Complejidad | FTE-hrs/mes | Waste Identificado | Process Owner |
|---|---|---|---|---|---|---|---|---|
| P-001 | ... | ... | ... | ... | Simple/Medio/Complejo | ... | ... | ... |

**Niveles de documentacion BPMN requeridos:**
- L1 — Descriptivo: Flujo basico de actividades (minimo aceptable)
- L2 — Analitico: Decisiones, roles, excepciones, tiempos (recomendado para automatizacion)
- L3 — Ejecutable: Especificacion completa para implementacion directa

### S2: Automation Opportunity Scoring

Scoring cuantitativo por proceso para determinar prioridad de automatizacion (Automation Opportunity Score — AOS).

**Criterios de scoring (0-3 cada uno, total maximo 15):**

| Criterio | 0 | 1 | 2 | 3 |
|---|---|---|---|---|
| Datos estructurados | Datos no digitales | Semi-estructurados | Estructurados con excepciones | 100% estructurados y digitales |
| Reglas estables | Cambian semanalmente | Cambian mensualmente | Cambian trimestralmente | Estables >6 meses |
| Alto volumen | <10 tx/dia | 10-50 tx/dia | 50-200 tx/dia | >200 tx/dia |
| Repetitivo | Alta variabilidad | Variabilidad moderada | Mayormente repetitivo | 100% repetitivo, sin juicio |
| Propenso a error | <1% error rate | 1-3% error rate | 3-5% error rate | >5% error rate |

**Clasificacion por score:**
- 12-15: **Automatizacion inmediata** (quick win)
- 8-11: **Automatizacion con optimizacion previa** — aplicar DMAIC antes de automatizar
- 4-7: **Evaluar simplificacion antes de automatizar** — proceso requiere rediseno
- 0-3: **No automatizar** (proceso no apto para RPA)

**Clasificacion de complejidad de implementacion:**

| Nivel | Pasos | Aplicaciones | Decisiones | Esfuerzo estimado |
|---|---|---|---|---|
| Simple | 1-5 | 1 | 0-1 | 2-4 semanas |
| Medio | 5-15 | 2-3 | 2-5 | 4-8 semanas |
| Complejo | >15 | >3 | >5 | 8-16 semanas |

Ranking Pareto: top 20% de procesos que generan 80% del beneficio.

### S3: Bot Design Architecture

Arquitectura de automatizacion para los procesos priorizados.

**Entregables:**
- Clasificacion attended vs unattended por proceso automatizado
- Modelo de orquestacion (centralizado, distribuido, hibrido)
- Mapeo bot-to-process (1:1, 1:N, N:1)
- Estrategia de manejo de excepciones (retry, escalation, human-in-the-loop)
- Modelo de gestion de credenciales (vault integration, rotation policy)
- Diseno de audit trail (logging, compliance, trazabilidad)

**Diagrama de arquitectura (Mermaid):**
- Orquestador central, bots, aplicaciones target, exception handler, credential vault, monitoring

**Patrones de automatizacion:**
- **Task automation:** Un bot ejecuta una tarea discreta (data entry, report generation)
- **Process automation:** Multiples bots coordinados ejecutan un proceso end-to-end
- **Process orchestration:** Un orquestador coordina bots, APIs, y humanos en flujos complejos

### S4: Platform Assessment

Evaluacion comparativa de plataformas RPA usando criterios estandar de la industria.

**Matriz de comparacion:**

| Criterio | UiPath | Automation Anywhere | Power Automate | Blue Prism | Open-source (Robot Framework, TagUI) |
|---|---|---|---|---|---|
| Escalabilidad | ... | ... | ... | ... | ... |
| Gobernanza | ... | ... | ... | ... | ... |
| Cost Drivers | ... | ... | ... | ... | ... |
| Ecosistema | ... | ... | ... | ... | ... |
| Curva de aprendizaje | ... | ... | ... | ... | ... |
| Enterprise Features | ... | ... | ... | ... | ... |
| Community & Open-source | ... | ... | ... | ... | ... |

**Escala de evaluacion:**
- **SUBSTANCIA**: Capacidad demostrada con evidencia en produccion y referencias verificables
- **PROMESA**: Capacidad anunciada con roadmap creible pero sin validacion enterprise amplia
- **RIESGO**: Capacidad parcial con limitaciones conocidas y workarounds requeridos
- **HUMO**: Marketing sin evidencia tecnica sustancial

Recomendacion fundamentada con trade-offs explicitos. Incluir opciones open-source (Robot Framework, TagUI, Apache Airflow para orquestacion) cuando aplique.

### S5: Process Mining Results

Resultados de process mining cuando datos disponibles. Basado en principios del IEEE Task Force on Process Mining.

**Si hay datos de process mining disponibles (event logs):**
- Identificacion de bottlenecks (cuellos de botella con metricas de tiempo)
- Analisis de variantes (happy path vs variantes, frecuencia por variante)
- Conformance checking (adherencia al proceso documentado vs proceso real)
- Validacion de oportunidades de automatizacion (confirmar/ajustar scoring de S2)

**Herramientas de referencia (open-source y comerciales):**
- **ProM Framework** — Open-source, academico, extensible via plugins
- **PM4Py** — Libreria Python open-source para process mining
- **Celonis** — Comercial, enterprise-grade, process intelligence
- **Disco (Fluxicon)** — Comercial, visualizacion intuitiva
- **Apromore** — Open-source, cloud-native

**Si no hay datos de process mining:**
- Flag como recomendacion: "Se recomienda implementar process mining como fase previa para validar oportunidades de automatizacion con datos reales."
- Documentar el gap y su impacto en la confianza del scoring
- Proponer herramientas y esfuerzo estimado para obtener event logs

### S6: ROI Projection Model

Proyeccion de retorno basada en magnitudes, NO en precios.

**Modelo de calculo:**
```
Beneficio = Tiempo ahorrado x Volumen de proceso x Reduccion de errores
```

**Componentes del modelo:**
- **Tiempo ahorrado por transaccion:** minutos manuales vs minutos automatizados
- **Volumen mensual:** transacciones procesadas
- **Reduccion de errores:** tasa actual vs tasa proyectada con automatizacion
- **FTE equivalentes liberados:** horas recuperadas convertidas a FTE

**Drivers de costo (magnitudes, NUNCA precios):**
- Licenciamiento de plataforma (numero de bots, tipo de licencia)
- Infraestructura (VMs, cloud resources por bot)
- Desarrollo e implementacion (FTE-meses por complejidad de proceso)
- Mantenimiento continuo (% del costo de desarrollo anual, tipicamente 15-25%)
- Capacitacion y change management

**Proyeccion de automation debt:**
- Costo de mantenimiento acumulado si no se invierte en gobernanza
- Impacto de cambios en aplicaciones target sobre bots existentes
- Degradacion de ROI sin monitoreo activo

> **Disclaimer obligatorio:** Las magnitudes presentadas son estimaciones basadas en drivers identificados. Los valores finales dependen de negociacion comercial, condiciones de mercado y contexto especifico de la organizacion. Se recomienda validar con multiples proveedores antes de decisiones de inversion.

### S7: Automation Roadmap

Hoja de ruta de automatizacion en 3 horizontes, gestionada con ciclo PDCA (Plan-Do-Check-Act).

**Horizonte 1 — Quick Wins (0-3 meses):**
- Procesos con score 12-15, complejidad simple
- Bots unattended de alto volumen
- Resultados visibles para generar momentum
- PDCA: Plan (seleccionar top-5), Do (implementar), Check (medir vs proyeccion), Act (ajustar)

**Horizonte 2 — Medium-term (3-9 meses):**
- Procesos con score 8-11, complejidad media
- Bots attended para procesos que requieren juicio parcial
- Integracion con sistemas core
- Optimizacion de procesos (DMAIC) previo a automatizacion

**Horizonte 3 — Strategic (9-18 meses):**
- Automatizaciones transformacionales (cross-funcionales, AI-augmented)
- Orquestacion avanzada (process orchestration, intelligent automation)
- Hyperautomation: RPA + AI/ML + process mining + low-code

**Evolucion del CoE (Center of Excellence) — Modelo generico:**
- Fase 1 (Centralizado, 0-6 meses): Equipo central de 3-5 personas, gobernanza basica, primeros 5-10 bots. Metricas: bots activos, transacciones procesadas, tasa de exito.
- Fase 2 (Federado, 6-18 meses): Citizen developers en unidades de negocio, governance framework maduro. Metricas: ROI por proceso, automation coverage, citizen developer adoption.
- Fase 3 (Autonomo, 18+ meses): Automation-first culture, AI-augmented automation. Metricas: automation index, innovation pipeline.

**Dependencias entre fases:**
- Diagrama de dependencias (Mermaid gantt o flowchart)
- Prerequisitos tecnicos y organizacionales por fase
- Criterios de avance (exit criteria por horizonte)

## Escalation to Human Architect

- Procesos con regulacion especifica no documentada (SOX, GDPR, sector salud)
- Aplicaciones legacy sin documentacion tecnica accesible
- Conflictos entre process owners sobre priorizacion
- Infraestructura de seguridad que limita interaccion de bots
- Integraciones con sistemas de terceros sin API documentada
- Decisiones de licenciamiento que requieren negociacion con vendors

## Validation Gate

- [ ] Inventario de procesos completo con metricas de volumen, complejidad, y waste identificado
- [ ] Scoring de automatizacion (AOS) aplicado a todos los procesos con criterios cuantificables
- [ ] Arquitectura de bots definida (attended/unattended, orquestacion, excepciones)
- [ ] Evaluacion de plataforma con escala SUBSTANCIA/PROMESA/RIESGO/HUMO (incluye open-source)
- [ ] Process mining resultados integrados o gap documentado con recomendacion de herramientas
- [ ] ROI proyectado en magnitudes (NUNCA precios) con disclaimer obligatorio
- [ ] Roadmap en 3 horizontes con dependencias y criterios de avance (ciclo PDCA)
- [ ] Evolucion del CoE documentada con fases y governance (modelo generico)
- [ ] Evidencia tagueada con [CODIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO]
- [ ] Cross-references entre secciones (scoring S2 alimenta roadmap S7)

## Output Artifact

**Primary:** `RPA_Discovery_{project}.md` — Assessment completo de 7 secciones con inventario de procesos, scoring de automatizacion, arquitectura de bots, evaluacion de plataforma, resultados de process mining, proyeccion de ROI, y roadmap de automatizacion.

**Diagramas incluidos:**
- Mapa de procesos candidatos (mindmap o flowchart)
- Arquitectura de bots y orquestacion
- Matriz de scoring (quadrant chart)
- Roadmap de automatizacion (gantt)

---
**Comunidad MetodologIA** | **Licencia:** GPL-3.0 | **Ultima actualizacion:** 14 de marzo de 2026
