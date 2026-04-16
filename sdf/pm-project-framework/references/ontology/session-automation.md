# Automatizacion de Sesion

> PMO-APEX — Ontologia viva
> Referencia canonica del comportamiento automatico de sesion, ghost menu y estructura `project/`.

---

## Activacion del plugin

Al activar PMO-APEX en un repositorio de proyecto, los hooks ejecutan automaticamente la siguiente secuencia de inicializacion:

### Secuencia de activacion

| Orden | Hook | Accion | Archivo generado |
|-------|------|--------|-----------------|
| 0 | Secrets scan (G0) | Detectar datos sensibles en artefactos del proyecto | `apex-secrets-audit.log` |
| 1 | Deliverable scan | Escanear entregables existentes en el repo | (stdout) |
| 2 | Session context | Escanear repo, detectar metodologia, generar contexto | `SESSION-README.md`, `SESSION-CLAUDE.md` |
| 3 | Auto-prime check | Detectar estado de priming, generar calibracion | `calibration-digest.md` |
| 4 | Ghost menu | Inicializar navegacion contextual | `ghost-menu.md` |
| 5 | Changelog | Crear registro de continuidad | `session-changelog.md` |
| 6 | Decision log | Inicializar registro de decisiones | `decision-log.md` |
| 7 | Assumption log | Inicializar registro de supuestos | `assumption-log.md` |
| 8 | Session state | Inicializar estado de la sesion | `session-state.json` |
| 9 | Prompt injection | Inyectar estado APEX + instrucciones de priming | (en contexto) |

---

## Ghost menu

El ghost menu es un patron de navegacion secundaria operativa que aparece al final de cada artefacto importante.

### Formato

```
APEX | Fase: {fase} | {n}/16 entregables | Skill: {skill}
--- Estado: {verde/amarillo/rojo}
--- Siguiente: {proxima accion recomendada}
--- Pendiente: {entregables faltantes en ruta critica}
--- Metodologia: {tipo_proyecto activo}
--- Archivos: SESSION-README | changelog | decision-log | assumption-log
```

### Reglas de inclusion

| Contexto | Incluir ghost menu |
|----------|-------------------|
| Entregable del pipeline (00-14) | SI — obligatorio |
| Artefacto HTML generado | SI — obligatorio |
| Respuesta que modifica estado del proyecto | SI — obligatorio |
| Respuesta conversacional breve | NO |
| Respuesta a pregunta puntual | NO |

### Estados del semaforo

| Estado | Significado |
|--------|-------------|
| Verde | Pipeline en curso, sin bloqueos |
| Amarillo | Advertencias activas (>20% supuestos, gate pendiente, riesgo medio) |
| Rojo | Bloqueo activo (gate fallido, riesgo critico, evidencia insuficiente) |

---

## Session changelog

El changelog registra cada accion significativa de la sesion para garantizar continuidad ante crisis (timeout, perdida de contexto, nueva sesion).

### Formato de entrada

```markdown
## [{timestamp}] {accion}
- **Fase:** {fase actual}
- **Entregable:** {entregable afectado}
- **Resultado:** {descripcion breve}
- **Estado pipeline:** {n}/16
- **Metodologia:** {tipo_proyecto}
```

### Eventos que se registran

- Inicio de sesion / reanudacion
- Generacion de cada entregable
- Paso de quality gate (aprobado/rechazado)
- Procesamiento de adjunto
- Cambio de `{TIPO_PROYECTO}`
- Decision significativa del stakeholder
- Error o bloqueo
- Cambio en linea base (scope, schedule, cost)

---

## Decision log

Registro formal de todas las decisiones de proyecto tomadas durante la sesion.

### Formato

```markdown
### DEC-{seq} | {fecha} | {titulo}
- **Contexto:** {situacion que motivo la decision}
- **Opciones evaluadas:** {alternativas consideradas}
- **Decision:** {decision tomada}
- **Justificacion:** {por que se eligio esta opcion}
- **Decidido por:** {stakeholder / comite}
- **Impacto en:** {entregables afectados}
- **Tags:** {[DECISION] [PLAN|SCHEDULE|METRIC|STAKEHOLDER]}
```

---

## Assumption log

Registro formal de todos los supuestos del proyecto.

### Formato

```markdown
### ASM-{seq} | {fecha} | {titulo}
- **Supuesto:** {descripcion del supuesto}
- **Impacto si es falso:** {consecuencia}
- **Validacion requerida con:** {stakeholder}
- **Fecha limite de validacion:** {fecha}
- **Estado:** {Abierto | Validado | Invalidado}
- **Tags:** {[SUPUESTO]}
```

---

## Estructura `project/`

Cada repositorio de proyecto mantiene un directorio `project/` con el estado completo del proyecto:

```
project/
├── repo-index.json          # Inventario estructurado del repositorio
├── SESSION-README.md         # Contexto del proyecto (auto-generado)
├── SESSION-CLAUDE.md         # Instrucciones del orquestador (auto-generado)
├── ghost-menu.md             # Navegacion contextual actual
├── session-changelog.md      # Changelog para continuidad
├── decision-log.md           # Registro formal de decisiones
├── assumption-log.md         # Registro formal de supuestos
├── session-state.json        # Estado serializado de la sesion
├── insights/                 # Hallazgos descubiertos durante el proceso
├── rag-priming/              # Extractos de adjuntos procesados para RAG
└── deliverables/             # Entregables generados (00-14)
    ├── 00_Project_Charter.md
    ├── 01_Stakeholder_Map.md
    ├── 02_Scope_WBS.md
    ├── 03_Schedule_Baseline.md
    ├── ...
    └── 14_Lessons_Closure.md
```

### Archivos auto-generados vs manuales

| Archivo | Generacion | Actualizacion |
|---------|-----------|---------------|
| `repo-index.json` | Automatica (hook) | Automatica al detectar cambios |
| `SESSION-README.md` | Automatica (hook) | Manual si el usuario aporta contexto |
| `SESSION-CLAUDE.md` | Automatica (hook) | Automatica segun progreso |
| `calibration-digest.md` | Automatica (hook) | Automatica al crear/editar priming-rag |
| `ghost-menu.md` | Automatica | Automatica en cada entregable |
| `session-changelog.md` | Automatica | Automatica en cada accion |
| `decision-log.md` | Automatica + Manual | Automatica en gates, manual en sesiones |
| `assumption-log.md` | Automatica + Manual | Automatica al detectar [SUPUESTO] |
| `session-state.json` | Automatica | Automatica (serializacion de estado) |
| `rag-priming/*.md` | Por comando o automatica | Automatica al procesar adjuntos |
| `insights/*` | Manual (durante proyecto) | Manual |
| `deliverables/*` | Por comando | Manual (improve) |

---

## Progressive MOAT Loading

El sistema carga skills de forma progresiva segun el nivel de profundidad requerido:

| Nivel | Contenido | Tamano aprox. | Uso |
|-------|-----------|---------------|-----|
| **L1** (Metadata) | Solo frontmatter + TL;DR | ~20 lineas/skill | Routing y exploracion |
| **L2** (Core) | SKILL.md completo | ~200 lineas/skill | Operacion estandar |
| **L3** (Deep) | SKILL.md + references/ + examples/ | ~500+ lineas/skill | Analisis profundo o priming completo |

### Comando de carga

```bash
scripts/lazy-load-resolver.sh <fase> <tipo_proyecto> [PLUGIN_DIR] [L1|L2|L3]
```

---

## Auto-Priming y Calibracion

### Ciclo de priming

```
SessionStart
  → auto-prime-check.sh
    → Existen priming-rag-*.md?
      → NO: crear needs-priming marker + calibration-digest (NO PRIMED)
      → SI: generar calibration-digest con cobertura y dominios
  → prompt injection incluye instruccion de priming

PostToolUse (Write|Edit)
  → post-prime-calibrate.sh
    → Se modifico un priming-rag-*.md?
      → SI: regenerar calibration-digest
      → NO: no-op (rapido)
```

### Niveles de confianza segun priming

| Priming | Confianza base | Recomendacion |
|---------|---------------|---------------|
| 0 archivos | Baja | Ejecutar `/pm:prime-project` obligatorio antes de planificacion |
| 1-2 archivos | Media-baja | Pipeline express aceptable, profundo no recomendado |
| 3-5 archivos | Media | Pipeline completo viable |
| 6+ archivos | Alta | Profundidad optima para todos los modos |

---

## Reanudacion de sesion

Cuando una sesion se interrumpe y se reanuda (nuevo contexto):

1. Leer `session-state.json` para recuperar estado
2. Leer `session-changelog.md` para reconstruir historial
3. Leer `decision-log.md` para recuperar decisiones
4. Leer `assumption-log.md` para verificar supuestos pendientes
5. Verificar integridad de entregables en `deliverables/`
6. Detectar adjuntos sin procesar en `rag-priming/`
7. Restaurar ghost menu con estado correcto
8. Notificar al usuario del punto de reanudacion

---

*PMO-APEX — La excelencia en gestion de proyectos se construye con evidencia.*
