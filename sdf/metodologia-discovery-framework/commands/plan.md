---
description: "Generate 00_Discovery_Plan — the governing document for the entire engagement"
user-invocable: true
---

# METODOLOGIA DISCOVERY · PLAN DE DISCOVERY · NL-HP v3.0

## ROL
Discovery Conductor — activa `discovery-orchestrator` como skill primario.
Skills de soporte: `project-program-management` (gobernanza), `risk-controlling-dynamics` (registro de riesgos inicial).

## OBJETIVO
Generar 00_Discovery_Plan.md para el proyecto actual partiendo del repositorio en el directorio de trabajo y cualquier adjunto o contexto provisto. Si el usuario proporciona "$ARGUMENTS", usarlos como nombre de proyecto y/o ruta.

## PROTOCOLO

### CP-0 · Ingesta
1. Escanea el repositorio completo: estructura de carpetas, README, docs/, wiki/, configs (package.json, pom.xml, docker-compose, .env.example), CODEOWNERS, CI/CD pipelines.
2. Clasifica adjuntos: documentación existente, diagramas, actas de reunión, contratos, SOWs.
3. Declara hallazgos y gaps (CRÍTICO / MODERADO / MENOR).
4. Si gaps CRÍTICOS → solicita resolución. No continúes.
5. Confirma entendimiento: presenta resumen de 5 líneas, espera "ok".

### CP-1 · Plan de Entregable
1. Propón composición: skills y agentes que activarás.
2. Declara secciones del entregable con cobertura esperada.
3. Selecciona variante de pipeline:
   - >200K LOC o >10 integraciones → Full Pipeline (Fases 0-6)
   - 50K-200K LOC → Minimal Pipeline (Fases 1,3,4,5b,6)
   - <50K LOC → Quick Reference (Fases 1,3,5b)

### CP-2 · Ejecución
Genera las siguientes secciones:

1. **Contexto del Engagement** — sistema, industria, variante seleccionada, duración estimada, justificación de variante. [CÓDIGO] [DOC]
2. **Comité de Expertos** — 7 expertos + conductor, roles adaptados al contexto. Cada uno con responsabilidad concreta. [INFERENCIA]
3. **Phase Schedule** — tabla: fase | lead expert | duración | inputs requeridos | status. Vinculada a variante seleccionada. [DOC]
4. **Input Registry** — tabla: input | fuente | status (recibido/pendiente/parcial) | owner | deadline. [DOC] [CÓDIGO]
5. **Assumptions Log** — supuestos iniciales con tag de origen y nivel de confianza (alta/media/baja). [INFERENCIA]
6. **Risk Register** — mínimo 5 riesgos clasificados con probabilidad × impacto, owner, mitigación. [DOC] [INFERENCIA]
7. **Deliverable Manifest** — documentos 00-09, archivo esperado, fase de producción, dependencias. [DOC]
8. **Gate Criteria Preview** — qué se evalúa en cada gate, criterios de paso, criterios de bloqueo.

### CP-3 · Validación
- [ ] Todas las categorías de stakeholder identificadas
- [ ] Input registry completo con fuente, status y owner
- [ ] Riesgos clasificados con probabilidad × impacto
- [ ] Variante de pipeline justificada con evidencia
- [ ] Gate criteria definidos para cada transición

Si falla → corrige (max 1 re-intento) → entrega con gaps documentados.

### CP-4 · Entrega
Output: 00_Discovery_Plan.md en Markdown estructurado.
Toda afirmación lleva tag de origen: [CÓDIGO], [CONFIG], [DOC], [INFERENCIA].
Este documento es de PLANIFICACIÓN y GOBIERNO. No contiene análisis técnico.

## RESTRICCIONES
- No procedes por intuición. Procedes por evidencia.
- No generes análisis técnico — este documento gobierna, no analiza.
- Estándar markdown-excellence: TL;DR, tablas 🟢/🟡/🔴, callouts, zero filler.
- Diagramas Mermaid: `flowchart TD` para phase dependencies.
