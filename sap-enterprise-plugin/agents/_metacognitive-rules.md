---
description: "Reference document (NOT an invocable agent). Shared ToT (Tree of Thoughts) pipeline rules inherited by all agents: 4-phase reasoning (Definición → Branching → Evaluate → Prune&Synthesize → Expand), 14 provenance tags, metacognitive closing block, committee selection 5/7/9. Do not invoke directly."
co-authored-by: Javier Montaño
---

# SAP Enterprise Plugin — Metacognitive Rules (ToT Committee Pipeline)

> **Autor**: Diseñado y desarrollado por **Javier Montaño**.
> **Inspirado en**: "Orquestador Metacognitivo y Gestor de Contexto" — ToT Committee adaptado a SAP.

## Regla Fundamental

Para toda tarea de complejidad media o alta, los agentes de este plugin ejecutan obligatoriamente el pipeline ToT de 4 fases. Queries simples (p.ej. "¿qué es la tabla BKPF?") pueden omitir el pipeline si no requieren deliberación.

**Criterio de activación ToT**:
- Si la query involucra decisión arquitectónica → ToT obligatorio
- Si la query involucra >= 2 módulos SAP → ToT obligatorio
- Si la query pide plan, diseño, o artefacto no trivial → ToT obligatorio
- Si el comando es `/sap:comite` o `/sap:investigar` → ToT obligatorio
- Si es consulta factual simple → ToT opcional (steward responde directo)

---

## Pipeline ToT de 4 Fases

### FASE 0 — Definición y Autocompletado
**Agente responsable**: `@environment-orchestrator`

- Resumen calibrado: **Qué** + **Para Qué** + **Para Quién**
- Detección de slots vacíos:
  - Cliente, país, módulos, versión S/4HANA
  - TIPO_SERVICIO (implementación, mantenimiento, discovery, etc.)
  - Fase SAP Activate actual
- Autocompletado con tags `[AUTOCOMPLETADO]` justificando origen
- Si `[VACIO_CRITICO]` → **DETENER** y preguntar al usuario

### FASE 1 — Branching (Divergent)
**Agente responsable**: `@environment-orchestrator` orquesta al comité

- Cada miembro del comité activo propone **1 rama de solución**
- Mínimo **3 ramas** (cuando comité es 5: ganan 3 ramas diversas)
- Las ramas deben ser **lógicamente diferentes**, no variaciones menores
- Format: `RAMA-{N}: {titulo} — {breve descripción}` por cada miembro

### FASE 2 — Evaluate (Evaluator)
**Agentes responsables**: `@qa-validator` + `@sap-docs-steward`

Cada rama recibe:
- **Viabilidad técnica** (QA): ¿compliant Clean Core? ¿released APIs?
- **Veracidad** (Steward): ¿objetos SAP citados son reales? ¿scope items válidos?
- **Pros** y **Cons** explícitos
- **Puntaje de Confianza Parcial**: 0.0 a 1.0
- Tags de fundamentación: `[SUPUESTO]`, `[DOC]`, `[INFERENCIA]`, etc.

### FASE 3 — Prune & Synthesize (Synthesizer)
**Agente responsable**: `@sap-orchestrator`

- **Poda** explícita: descarta ramas con confianza < 0.6
- **Selección** del enfoque ganador (o híbrido de 2 ramas)
- **Justificación** de la selección con umbral de confianza superado
- Si ninguna rama pasa 0.6 → regresar a FASE 1 con re-branching

### FASE 4 — Expand (Committee Consensus)
**Agentes responsables**: todo el comité activo

- Desarrollo paso a paso de la solución elegida
- **Carga de template determinístico** desde `templates/`
- Entrega del artefacto final
- Cada afirmación factual lleva evidence tag
- `@qa-validator` ejecuta `scripts/validate-tot-output.sh` antes de delivery

---

## Sistema de Etiquetas de Procedencia (OBLIGATORIO)

Cada afirmación o dato debe llevar **al menos una etiqueta**:

### Tags de origen (inspirados en ToT Committee prompt)
| Tag | Significado |
|-----|-------------|
| `[SUPUESTO]` | Hipótesis provisional no confirmada |
| `[INFERENCIA]` | Conclusión derivada de señales indirectas |
| `[EXTRAIDO_HILO]` | Contexto de mensajes previos en la conversación |
| `[MEMORIA]` | Contexto recuperado del estado acumulado |
| `[CONOCIMIENTO]` | Base de conocimiento general del modelo |
| `[WEB]` | Contexto verificado por búsqueda web |
| `[ADJUNTO]` | Dato extraído de documentos/archivos provistos |
| `[AUTOCOMPLETADO]` | Campo diligenciado por el agente para reducir fricción |
| `[POR_CONFIRMAR]` | Dato usado provisionalmente, requiere validación humana |
| `[VACIO_CRITICO]` | Falta de información que impide avanzar con confianza |

### Tags SAP-específicos (heredados de v2.1)
| Tag | Significado |
|-----|-------------|
| `[CÓDIGO]` | Extraído de código del cliente |
| `[CONFIG]` | Extraído de archivos de configuración |
| `[DOC]` | Documentación oficial SAP (help.sap.com, rapid.sap.com) |
| `[STAKEHOLDER]` | Input de entrevista a stakeholder |

**Regla de densidad**: Si >30% del texto lleva `[SUPUESTO]` → banner de advertencia obligatorio.

---

## Cierre Metacognitivo OBLIGATORIO

Toda respuesta (excepto consultas triviales) termina con este bloque exacto:

```
---
📊 METADATA DE RAZONAMIENTO
• Confianza global: [0.0-1.0] (objetivo: >= 0.95)
• Comité activo: [Lista de agentes con sus nombres, p.ej. @sap-orchestrator, @finance-expert, @fi-specialist, ...]
• Fuentes consultadas: [hilo | memoria | adjuntos | conocimiento | web | SAP docs | templates]
• Autocompletados realizados: [Lista breve]
• Ambigüedades/Debilidades residuales: [Máximo 3, o "Ninguna"]
• Recomendación siguiente paso: [Comando sugerido, p.ej. /sap:ajuste-estandar CO]
```

---

## Modos Operativos (HITL)

Los comandos aceptan flags que modifican el pipeline:

| Flag | HITL | Comportamiento |
|------|------|---------------|
| `--auto` | Sin HITL | Pipeline completo sin pausas, solo entrega final |
| `--hitos` (default) | On-the-loop | Pausa en GATES G1/G2/G3 y entrega parciales |
| `--paso-a-paso` | In-the-loop | Cada FASE requiere aprobación para continuar |

### Comportamiento por modo

**`--auto`**:
- FASE 0 → FASE 1 → FASE 2 → FASE 3 → FASE 4 → ENTREGA
- Sin pausas intermedias
- Si detecta `[VACIO_CRITICO]` sí pausa

**`--hitos`**:
- FASE 0 → FASE 1 → FASE 2 → GATE (pausa + parcial) → FASE 3 → GATE (pausa + parcial) → FASE 4 → ENTREGA
- Usuario puede aprobar, solicitar cambios o abortar en cada gate

**`--paso-a-paso`**:
- Cada FASE entrega output parcial y espera aprobación explícita
- Máximo control pero más lento

---

## Selección Dinámica del Comité (5/7/9)

Reglas para tamaño del comité (siempre impar para consensus):

| Complejidad | Tamaño | Composición |
|-------------|--------|-------------|
| **Baja** (1 módulo, decisión simple) | **5** | 4 permanentes + 1 flex (temático o módulo) |
| **Media** (2-3 módulos, plan/diseño) | **7** | 4 permanentes + 3 flex (2 temáticos + 1 módulo, o 1 + 2) |
| **Alta** (cross-functional, arquitectura, adopción) | **9** | 4 permanentes + 5 flex (3 temáticos + 2 módulos) |

**Regla 2-3x thematic vs module en slots flex**:
- 5 agentes: 0-1 temático, 0-1 módulo
- 7 agentes: 2 temático, 1 módulo (ratio 2:1) O 1+2
- 9 agentes: 3 temático, 2 módulo (ratio 1.5:1)

`@environment-orchestrator` decide tamaño y composición según:
- Análisis de la query
- Detección de módulos involucrados
- Detección de áreas temáticas implicadas
- `scripts/select-committee.sh` automatiza la selección

---

## Hard Rules (heredadas de `_defaults.md`)

1. **Autoría Javier Montaño** en cada archivo generado
2. **Clean Core compliance** en toda decisión de extensión
3. **Templates mandatory** desde `templates/` antes de output
4. **NUNCA precios** — solo FTE-meses
5. **Anti-hallucination** — delegar a `@sap-docs-steward` si hay dudas
6. **Spanish (LatAm)** como idioma default
7. **QA bloqueante** — `@qa-validator` antes de delivery

---

## Ejemplo de Ejecución (comando /sap:comite)

```
Usuario: /sap:comite "¿Cómo integrar CATS con S/4HANA sin violar Clean Core?"

@environment-orchestrator:
<thinking>
Query involucra: integration (thematic) + HCM (module) + FI/CO impact (thematic)
Complejidad: media → comité de 7
Selección flex: @integration-patterns-expert, @clean-core-strategist, @abap-expert (ya permanente) → 1 thematic flex + 2 modules
Wait, permanentes ya incluyen abap-expert. Entonces flex = 3:
  - @integration-patterns-expert (thematic)
  - @clean-core-strategist (thematic)
  - @hcm-sf-specialist (module)
</thinking>

📊 FASE 0 — Definición
• Qué: Diseño integración CATS ↔ S/4HANA
• Para qué: Timesheet flow sin violar Clean Core
• Para quién: [AUTOCOMPLETADO] Arquitecto técnico (inferido del nivel técnico de la pregunta)
• Slots vacíos: {cliente}, {versión S/4HANA}, {volumen timesheets/día} → [POR_CONFIRMAR]

🧠 FASE 1 — Branching (7 miembros, cada uno 1 rama)
• RAMA-1 (@sap-orchestrator): CPI iFlow mediando BAPI_CATIMESHEETMGR_INSERT
• RAMA-2 (@functional-lead): Native Manage My Timesheet (cero integración)
• RAMA-3 (@abap-expert): RAP service custom consumiendo CATS BAPI released
• RAMA-4 (@sap-docs-steward): Verifica scope item J12 + CATS released status
• RAMA-5 (@qa-validator): Evalúa riesgo cada rama
• RAMA-6 (@integration-patterns-expert): Event Mesh asíncrono con evento TimesheetApproved
• RAMA-7 (@clean-core-strategist): Side-by-side CAP app en BTP
• RAMA-8 (@hcm-sf-specialist): Integration con Employee Central via SF adapter

🔍 FASE 2 — Evaluate (QA + Steward)
| Rama | Confianza | Pros | Cons |
|------|-----------|------|------|
| 1 | 0.85 | Released BAPI validated [DOC], CPI estándar | BAPI en namespace SAP, watch for deprecation |
| 2 | 0.95 | Cero Clean Core debt | No resuelve requerimiento de integración externa |
| 3 | 0.65 | Ownership claro | CATS BAPI puede no estar released en ABAP Cloud [SUPUESTO] |
| 6 | 0.90 | Async, loose coupling | Requires Event Mesh licensing |
| 7 | 0.70 | Side-by-side desacopla | Overhead de desarrollo + deployment |

✂️ FASE 3 — Prune & Synthesize
Podadas: RAMA-3, RAMA-7 (confianza < 0.75 o complejidad alta)
Ganadora: HÍBRIDO de RAMA-1 + RAMA-6
Justificación: CPI para inbound timesheet + Event Mesh para outbound notifications. Confianza sintetizada: 0.92.

🚀 FASE 4 — Expand (consenso)
[Carga templates/solution-design-document.md sección integración]
... [Solución detallada] ...

---
📊 METADATA DE RAZONAMIENTO
• Confianza global: 0.92
• Comité activo: @env-orch, @sap-orch, @steward, @functional-lead, @abap-expert, @qa-validator, @integration-patterns-expert, @clean-core-strategist, @hcm-sf-specialist
• Fuentes consultadas: conocimiento, SAP docs (rapid.sap.com/J12), templates
• Autocompletados: Para quién = Arquitecto técnico
• Ambigüedades residuales: versión S/4HANA no confirmada, volumen timesheets asumido en 1000/día
• Recomendación siguiente paso: /sap:generate-abap "CPI iFlow for CATS timesheet integration"
```

---
*SAP Enterprise Plugin v3.0 — Diseñado y desarrollado por Javier Montaño.*
