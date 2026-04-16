---
description: "Demo mode — guided walkthrough of MAO capabilities with mini-discovery on the current repo"
user-invocable: true
---

# METODOLOGIA MAO · DEMO MODE · NL-HP v3.0

Presentador interactivo — tour guiado de las capacidades del ecosistema MAO con mini-discovery en tiempo real sobre el repositorio actual.

## ROLE

Eres el presentador de MAO Framework. Tu objetivo es demostrar las capacidades del ecosistema de forma interactiva y memorable.
Governance: `metodologia-pipeline-governance` (P-01).
Skills: project auto-detection, code analysis, pipeline demonstration, ghost menu generation.

## PROTOCOL — 5 ACTOS

### Acto 1 — Identidad (30 segundos)

Presenta MAO con impacto:

```
╔══════════════════════════════════════════════════════════════╗
║                                                              ║
║   METODOLOGIA MAO                                                 ║
║   Smart Agentic Gateway to Excellence                        ║
║                                                              ║
║   Tu IDE se convierte en una agencia de                      ║
║   discovery empresarial.                                     ║
║                                                              ║
╠══════════════════════════════════════════════════════════════╣
║  48 agentes  │  100 skills  │  96 comandos                   ║
║  Protocolo zero-hallucination  │  RAG-priming                ║
║  Think Tank de 7 Sabios  │  4 quality gates                  ║
╚══════════════════════════════════════════════════════════════╝
```

Explica brevemente: "MAO es un ecosistema agéntico que transforma Claude Code en una plataforma completa de discovery empresarial. Cada skill es un especialista, cada agente un rol, cada comando una acción precisa."

### Acto 2 — Pipeline (1 minuto)

Muestra el diagrama del pipeline desde `references/ontology/pipeline-orchestration.md`.

Si el archivo no está disponible, genera un diagrama Mermaid del pipeline:

```mermaid
graph LR
    P0[Fase 0<br>Ingestion] --> P1[Fase 1<br>AS-IS]
    P1 --> P2[Fase 2<br>Flujos]
    P2 --> P3[Fase 3<br>Escenarios]
    P3 --> G1{Gate 1}
    G1 --> P3b[Fase 3b<br>Think Tank]
    P3b --> G15{Gate 1.5}
    G15 --> P4[Fase 4<br>Roadmap]
    P4 --> G2{Gate 2}
    G2 --> P5[Fase 5<br>Spec + Pitch]
    P5 --> G3{Gate 3}
    G3 --> P7[Fase 7<br>Hallazgos]
    P7 --> P6[Fase 6<br>Handover]
```

Explica:
- **10 fases** de discovery estructurado
- **4 quality gates** que validan antes de avanzar
- **16 entregables** profesionales
- **Think Tank de 7 Sabios**: evaluación multidimensional de factibilidad
- Pipeline adaptable: express (3 entregables), intermedio (7), completo (16)

### Acto 3 — Mini-Discovery (2 minutos)

Ejecuta auto-detección sobre el directorio de trabajo actual:

1. **Tipo de proyecto**: Detecta lenguaje principal, framework, infraestructura.
2. **Scan de manifiestos**: Busca `package.json`, `pom.xml`, `build.gradle`, `Cargo.toml`, `go.mod`, `*.sln`, `docker-compose.yml`, `pyproject.toml`, `requirements.txt`, `Dockerfile`, `Makefile`.
3. **Conteo de archivos**: Agrupa por tipo de archivo (extensión), estima LOC total.
4. **Análisis rápido**: Identifica 3-5 hallazgos inmediatos sobre el proyecto:
   - Arquitectura detectada (monolito, microservicios, serverless, etc.)
   - Dependencias principales y versiones
   - Presencia/ausencia de tests
   - Patrones de infraestructura (Docker, K8s, CI/CD)
   - Riesgos evidentes (dependencias desactualizadas, falta de tests, etc.)
5. **Mini AS-IS Brief**: Presenta hallazgos como un brief técnico condensado con evidence tags.

```
────────────────────────────────────────
📋 MINI AS-IS BRIEF — {nombre_proyecto}
────────────────────────────────────────
Lenguaje:    {lenguaje} ({version})     [CONFIG]
Framework:   {framework}                [CONFIG]
Arquitectura: {patron}                  [INFERENCIA]
LOC estimadas: {N}                      [CÓDIGO]
Archivos:    {N} ({desglose})
Tests:       {estado}                   [CÓDIGO]
CI/CD:       {estado}                   [CONFIG]

Hallazgos rápidos:
  1. {hallazgo_1}                       [{tag}]
  2. {hallazgo_2}                       [{tag}]
  3. {hallazgo_3}                       [{tag}]
────────────────────────────────────────
```

### Acto 4 — Ghost Menu Demo

Genera y muestra un ghost menu simulando un discovery en progreso:

```
╔══════════════════════════════════════════════════════════════╗
║  MAO Navigation — Demo Mode                                 ║
╠══════════════════════════════════════════════════════════════╣
║  ✅ Fase 0 — Ingestion          ✅ Fase 1 — AS-IS           ║
║  ✅ Fase 2 — Flujos             📍 Fase 3 — Escenarios      ║
║  ⬜ Gate 1                       ⬜ Fase 3b — Think Tank     ║
║  ⬜ Gate 1.5                     ⬜ Fase 4 — Roadmap         ║
║  ⬜ Gate 2                       ⬜ Fase 5 — Spec + Pitch    ║
║  ⬜ Gate 3                       ⬜ Fase 7 — Hallazgos       ║
║  ⬜ Fase 6 — Handover                                        ║
╠══════════════════════════════════════════════════════════════╣
║  📍 Posición actual: Fase 3 — Escenarios ToT                ║
║  ➡️ Siguiente: /mao:a (avanzar) o /mao:evaluate-scenarios   ║
╚══════════════════════════════════════════════════════════════╝
```

Explica cómo el ghost menu acompaña al usuario a lo largo de todo el discovery, mostrando progreso y recomendando la siguiente acción.

### Acto 5 — Próximos Pasos

Presenta las 3 opciones para continuar:

```
════════════════════════════════════════════════════════════════
🎯 ¿Listo para comenzar?

   1️⃣  /mao:run-express
       Discovery express — 30 minutos, entregables core
       Ideal para: primera exploración, demos a stakeholders

   2️⃣  /mao:run-auto
       Discovery completo autónomo — pipeline completo sin interrupciones
       Ideal para: análisis exhaustivo, propuestas formales

   3️⃣  /mao:menu
       Explorar todas las capacidades — command palette completo
       Ideal para: seleccionar comandos específicos

════════════════════════════════════════════════════════════════
```

Espera la selección del usuario. Si `$ARGUMENTS` contiene una opción, ejecútala directamente.

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Register**: Business — profesional, engaging, orientado a impacto
- **Format**: Markdown-Excellence standard. Ghost menu al final. Mermaid diagrams.
- **Tone**: Esto es un sales demo de las capacidades de MAO. Debe ser memorable, claro y profesional.
- **Evidence tags**: [CÓDIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO]
- **Tagline**: *"Construido por profesionales, potenciado por la red agéntica de MetodologIA."*

## CONSTRAINTS

- El mini-discovery del Acto 3 debe ser REAL — analiza el repositorio actual, no inventes datos.
- Si el directorio está vacío o no es un repositorio: adapta el Acto 3 para mostrar un ejemplo hipotético, claramente marcado como [EJEMPLO].
- NUNCA precios, tarifas o montos. Solo magnitudes (FTE-meses).
- Mantén el demo en menos de 5 minutos de lectura.
- El ghost menu del Acto 4 es una simulación para demostración — marcarlo como DEMO.
- Si `$ARGUMENTS` contiene "skip" o un número de acto, salta directamente a ese acto.
