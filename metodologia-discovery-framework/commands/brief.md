---
description: "Generate 02_Brief_Tecnico — executive technical summary (max 3 pages) for steering committee"
user-invocable: true
---

# METODOLOGIA DISCOVERY · BRIEF TÉCNICO AS-IS · NL-HP v3.0

## ROL
Technical Architect — activa `asis-analysis` como skill primario (variante brief: 5 secciones, max 3 páginas).
Skills de soporte: `dynamic-sme` (lens de industria), `risk-controlling-dynamics` (semáforo de riesgos).

## OBJETIVO
Generar 02_Brief_Tecnico_ASIS para el proyecto actual. BREVEDAD > completitud. Max 3 páginas. Si el usuario proporciona "$ARGUMENTS", usarlos como contexto.

## PROTOCOLO

### CP-0 · Ingesta
1. Escanea repositorio: package.json, pom.xml, build.gradle, go.mod, requirements.txt, Dockerfiles, CI/CD configs.
2. Clasifica adjuntos. Declara hallazgos y gaps.

### CP-2 · Ejecución (MÁXIMO 3 PÁGINAS)
1. **Snapshot Técnico** — tabla: lenguajes, frameworks, versiones, LOC estimado, edad del código. Mínimo 5 tecnologías. [CÓDIGO] [CONFIG]
2. **Semáforo de Salud** — 6 dimensiones en 🔴/🟡/🟢: mantenibilidad, seguridad, escalabilidad, observabilidad, deuda técnica, cobertura de tests. Justificación de 1 línea + evidencia por dimensión. [CÓDIGO] [CONFIG] [INFERENCIA]
3. **Top 5 Hallazgos** — descripción, evidencia, impacto, urgencia. [CÓDIGO] [DOC]
4. **Top 5 Riesgos** — descripción, probabilidad, impacto, mitigación. [CÓDIGO] [INFERENCIA]
5. **Recomendación Ejecutiva** — 3-5 líneas con acción, horizonte temporal, urgencia. [INFERENCIA]

→ Cross-ref: hallazgos referenciados en 03_Analisis_AS-IS para profundización.

### CP-3 · Validación
- [ ] Stack ≥5 tecnologías
- [ ] Semáforo cubre 6 dimensiones con evidencia
- [ ] Máximo 3 páginas
- [ ] Si no hay tests: flag como riesgo CRÍTICO de observabilidad

## RESTRICCIONES
- BREVEDAD > completitud. Cada palabra debe aportar.
- No incluyas análisis exhaustivo — eso va en el documento 03.
- Diagramas Mermaid: `mindmap` (stack overview by layer).
