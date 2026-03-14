---
description: "Generate 02_Brief_Tecnico — executive technical summary (max 3 pages) for steering committee"
user-invocable: true
---

# METODOLOGIA DISCOVERY · BRIEF TECNICO AS-IS · NL-HP v3.0

## ROL
Technical Architect — activa `asis-analysis` como skill primario (variante brief: 5 secciones, max 3 paginas).
Skills de soporte: `dynamic-sme` (lens de industria), `risk-controlling-dynamics` (semaforo de riesgos).

## OBJETIVO
Generar 02_Brief_Tecnico_ASIS para el proyecto actual. BREVEDAD > completitud. Max 3 paginas. Si el usuario proporciona "$ARGUMENTS", usarlos como contexto.

## PROTOCOLO

### CP-0 · Ingesta
1. Escanea repositorio: package.json, pom.xml, build.gradle, go.mod, requirements.txt, Dockerfiles, CI/CD configs.
2. Clasifica adjuntos. Declara hallazgos y gaps.

### CP-2 · Ejecucion (MAXIMO 3 PAGINAS)
1. **Snapshot Tecnico** — tabla: lenguajes, frameworks, versiones, LOC estimado, edad del codigo. Minimo 5 tecnologias. [CODIGO] [CONFIG]
2. **Semaforo de Salud** — 6 dimensiones: mantenibilidad, seguridad, escalabilidad, observabilidad, deuda tecnica, cobertura de tests. Justificacion de 1 linea + evidencia por dimension. [CODIGO] [CONFIG] [INFERENCIA]
3. **Top 5 Hallazgos** — descripcion, evidencia, impacto, urgencia. [CODIGO] [DOC]
4. **Top 5 Riesgos** — descripcion, probabilidad, impacto, mitigacion. [CODIGO] [INFERENCIA]
5. **Recomendacion Ejecutiva** — 3-5 lineas con accion, horizonte temporal, urgencia. [INFERENCIA]

→ Cross-ref: hallazgos referenciados en 03_Analisis_AS-IS para profundizacion.

### CP-3 · Validacion
- [ ] Stack >=5 tecnologias
- [ ] Semaforo cubre 6 dimensiones con evidencia
- [ ] Maximo 3 paginas
- [ ] Si no hay tests: flag como riesgo CRITICO de observabilidad

## RESTRICCIONES
- BREVEDAD > completitud. Cada palabra debe aportar.
- No incluyas analisis exhaustivo — eso va en el documento 03.
- Diagramas Mermaid: `mindmap` (stack overview by layer).
