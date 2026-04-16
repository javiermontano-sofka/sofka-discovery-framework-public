# Automatización de Sesión

> MAO Framework — Ontología viva
> Referencia canónica del comportamiento automático de sesión, ghost menu y estructura `discovery/`.

---

## Activación del plugin

Al activar MAO Framework en un repositorio, los hooks ejecutan automáticamente la siguiente secuencia de inicialización:

### Secuencia de activación

| Orden | Hook | Acción | Archivo generado |
|-------|------|--------|-----------------|
| 1 | Deliverable scan | Escanear entregables existentes en el repo | (stdout) |
| 2 | Session context | Escanear repo, detectar stack, generar contexto | `SESSION-README.md`, `SESSION-CLAUDE.md` |
| 3 | Auto-prime check | Detectar estado de priming, generar calibración | `calibration-digest.md` |
| 4 | Ghost menu | Inicializar navegación contextual | `ghost-menu.md` |
| 5 | Changelog | Crear registro de continuidad | `session-changelog.md` |
| 6 | Session state | Inicializar estado de la sesión | `session-state.json` |
| 7 | Prompt injection | Inyectar estado MAO + instrucciones de priming | (en contexto) |

---

## Ghost menu

El ghost menu es un patrón de navegación secundaria operativa que aparece al final de cada artefacto importante.

### Formato

```
MAO | Fase: {fase} | {n}/16 entregables | Skill: {skill}
--- Estado: {verde/amarillo/rojo}
--- Siguiente: {próxima acción recomendada}
--- Pendiente: {entregables faltantes en ruta crítica}
--- Archivos: SESSION-README | changelog | repo-index
```

### Reglas de inclusión

| Contexto | Incluir ghost menu |
|----------|-------------------|
| Entregable del pipeline (00-14) | SI — obligatorio |
| Artefacto HTML generado | SI — obligatorio |
| Respuesta que modifica estado del discovery | SI — obligatorio |
| Respuesta conversacional breve | NO |
| Respuesta a pregunta puntual | NO |

### Estados del semáforo

| Estado | Significado |
|--------|-------------|
| Verde | Pipeline en curso, sin bloqueos |
| Amarillo | Advertencias activas (>20% supuestos, gate pendiente) |
| Rojo | Bloqueo activo (gate fallido, evidencia insuficiente) |

---

## Session changelog

El changelog registra cada acción significativa de la sesión para garantizar continuidad ante crisis (timeout, pérdida de contexto, nueva sesión).

### Formato de entrada

```markdown
## [{timestamp}] {acción}
- **Fase:** {fase actual}
- **Entregable:** {entregable afectado}
- **Resultado:** {descripción breve}
- **Estado pipeline:** {n}/16
```

### Eventos que se registran

- Inicio de sesión / reanudación
- Generación de cada entregable
- Paso de quality gate (aprobado/rechazado)
- Procesamiento de adjunto
- Cambio de `{TIPO_SERVICIO}`
- Decisión significativa del usuario
- Error o bloqueo

---

## Generación de contexto de sesión

### SESSION-README.md
Contiene el contexto del proyecto detectado automáticamente:
- Nombre del proyecto / repositorio
- Stack tecnológico identificado
- Estructura del codebase
- Entregables previos detectados
- Estado actual del pipeline

### SESSION-CLAUDE.md
Contiene instrucciones específicas del orquestador para esta sesión:
- Tipo de servicio detectado
- Agentes activos
- Skills cargados
- Parámetros de configuración
- Prioridades de la sesión

---

## Estructura `discovery/`

Cada repositorio de cliente mantiene un directorio `discovery/` con el estado completo del discovery:

```
discovery/
├── repo-index.json          # Inventario estructurado del repositorio
├── SESSION-README.md         # Contexto del proyecto (auto-generado)
├── SESSION-CLAUDE.md         # Instrucciones del orquestador (auto-generado)
├── ghost-menu.md             # Navegación contextual actual
├── session-changelog.md      # Changelog para continuidad
├── session-state.json        # Estado serializado de la sesión
├── insights/                 # Hallazgos descubiertos durante el proceso
├── transcripts/              # Transcripciones de entrevistas/reuniones
├── rag-priming/              # Extractos de adjuntos procesados para RAG
└── deliverables/             # Entregables generados (00-14)
    ├── 00_Discovery_Plan.md
    ├── 01_Stakeholder_Map.md
    ├── ...
    └── 14_AI_Opportunities.md
```

### Archivos auto-generados vs manuales

| Archivo | Generación | Actualización |
|---------|-----------|---------------|
| `repo-index.json` | Automática (hook) | Automática al detectar cambios |
| `SESSION-README.md` | Automática (hook) | Manual si el usuario aporta contexto |
| `SESSION-CLAUDE.md` | Automática (hook) | Automática según progreso |
| `calibration-digest.md` | Automática (hook) | Automática al crear/editar priming-rag |
| `ghost-menu.md` | Automática | Automática en cada entregable |
| `session-changelog.md` | Automática | Automática en cada acción |
| `session-state.json` | Automática | Automática (serialización de estado) |
| `rag-priming/*.md` | Por comando o automática | Automática al procesar adjuntos |
| `needs-priming` | Automática (marker) | Eliminado al completar priming |
| `insights/*` | Manual (durante discovery) | Manual |
| `deliverables/*` | Por comando | Manual (improve) |

---

## Auto-Priming y Calibración

El sistema de auto-priming detecta y gestiona el estado de conocimiento previo (RAG priming) del repositorio.

### Ciclo de priming

```
SessionStart
  → auto-prime-check.sh
    → ¿Existen priming-rag-*.md?
      → NO: crear needs-priming marker + calibration-digest (NO PRIMED)
      → SI: generar calibration-digest con cobertura y dominios
  → prompt injection incluye instrucción de priming

PostToolUse (Write|Edit)
  → post-prime-calibrate.sh
    → ¿Se modificó un priming-rag-*.md?
      → SI: regenerar calibration-digest
      → NO: no-op (rápido)
```

### Calibración

El archivo `calibration-digest.md` contiene:
- Estado de priming (PRIMED / NO PRIMED)
- Número de archivos RAG y líneas de contexto
- Dominios cubiertos y keywords extraídos
- Cobertura (baja / media / alta)
- Adjuntos sin priming pendientes
- Instrucciones para el orquestador

### Protocolo de adjuntos

Cada adjunto o referencia web investigada durante el discovery genera automáticamente un archivo de priming:

1. **Archivo recibido** → leer/interpretar → `priming-rag-{nombre}.md` en `discovery/rag-priming/`
2. **URL investigada** → fetch + extract → `priming-rag-{dominio-tema}.md`
3. **Después de crear** → `post-prime-calibrate.sh` actualiza `calibration-digest.md`
4. **El orquestador** → lee calibración actualizada → ajusta profundidad de análisis

### Niveles de confianza según priming

| Priming | Confianza base | Recomendación |
|---------|---------------|---------------|
| 0 archivos | Baja | Ejecutar `/mao:prime-repo` obligatorio antes de discovery |
| 1-2 archivos | Media-baja | Discovery express aceptable, profundo no recomendado |
| 3-5 archivos | Media | Discovery completo viable |
| 6+ archivos | Alta | Profundidad óptima para todos los modos |

---

## Reanudación de sesión

Cuando una sesión se interrumpe y se reanuda (nuevo contexto):

1. Leer `session-state.json` para recuperar estado
2. Leer `session-changelog.md` para reconstruir historial
3. Verificar integridad de entregables en `deliverables/`
4. Detectar adjuntos sin procesar en `rag-priming/`
5. Restaurar ghost menu con estado correcto
6. Notificar al usuario del punto de reanudación

---

*MAO Framework — La excelencia no se improvisa, se diseña.*
