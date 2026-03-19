# Asistente Scriba — Editorial Agentico K-12

> **14 agentes | 24 skills | 19 comandos | 5 quality gates** — Sistema de Orquestacion Agentica Prolipa (SOAP)

Plugin de Claude Code para produccion de textos escolares K-12 del sistema educativo ecuatoriano. Transforma el pipeline editorial de Editorial Prolipa (linea Sinapsis) de 180 a 45 dias mediante orquestacion agentica en 5 capas.

## Quick Start

```
/scriba:demo          # Demo express en 4 pasos — genera libro + DOCX + HTML
/scriba:init          # Inicializar proyecto (procesa adjuntos como RAG)
/scriba:book          # Crear libro completo express
/scriba:amplify       # Amplificar borrador humano a calidad Scriba
/scriba:publish       # Exportar libro a DOCX + HTML
/scriba:menu          # Ver todos los comandos
```

## Flujos Principales

### Flujo 1: Demo Express (4 pasos)
`/scriba:demo` → Elige tema ("Aprender a Aprender" o al vuelo) → Genera libro → Exporta DOCX + HTML

### Flujo 2: Libro Completo
`/scriba:init` → `/scriba:matrix` → `/scriba:book` → `/scriba:publish`

### Flujo 3: Amplificacion de Borradores
`/scriba:init` → `/scriba:amplify` (draft humano) → `/scriba:review` → `/scriba:publish`

### Flujo 4: Revision Editorial
`/scriba:init` → `/scriba:review` → `/scriba:evolve` → `/scriba:gate` → `/scriba:publish`

## Arquitectura SOAP — 5 Capas

| Capa | Funcion | Agentes |
|------|---------|---------|
| **Ingesta** | Curriculo MinEduc, auto-priming de documentos | curricular-analyst, auto-prime |
| **Generacion** | Contenido editorial, guias, recursos, libros express | author, pedagogue, digital-resource-creator, editorial-amplifier |
| **Validacion** | Calidad, comprensibilidad, estilo, consistencia | style-corrector, student-simulator, vigilance-auditor |
| **Diseno** | Layout, exportacion DOCX/HTML | visual-designer, format-specialist |
| **Vigilancia** | Monitoreo curricular, calibracion, onboarding | vigilance-auditor, onboarding-guide |

## Agentes — 3 Tiers (14 total)

### Tier 1: Triada Permanente (siempre activos)

| Agente | Rol | Skills |
|--------|-----|--------|
| **editorial-conductor** | Orquestador pipeline, gates | Todos (routing) |
| **quality-guardian** | Validador entregables | validate-*, verify-*, review-*, audit-* |
| **risk-controller** | Evidence tags, compliance | audit-consistency, verify-coverage |

### Tier 2: Equipo Core (por caso de uso)

| Agente | SOAP | Skills | Activacion |
|--------|------|--------|------------|
| **curricular-analyst** | AG-01 | generate-matrix, verify-coverage, repair-alignment | /scriba:matrix, CU-01, CU-06 |
| **author** | AG-02 | generate-unit, generate-rubric, evolve-unit | /scriba:unit, CU-02 |
| **style-corrector** | AG-03 | review-style, repair-style, fix-terminology | /scriba:review, CU-07 |
| **pedagogue** | AG-05 | generate-teacher-guide, adapt-dua, review-pedagogical, evolve-guide | /scriba:guide, CU-03 |
| **student-simulator** | SIM | validate-comprehensibility, improve-accessibility | /scriba:validate, CU-05 |
| **onboarding-guide** | Onboarding | auto-calibrate, auto-prime, generate-book-express | /scriba:demo |
| **editorial-amplifier** | Augmentation | amplify-draft, validate-comprehensibility, review-style | /scriba:amplify |

### Tier 3: Especialistas (bajo demanda)

| Agente | SOAP | Skills | Activacion |
|--------|------|--------|------------|
| **visual-designer** | AG-06 | (layout suggestions) | Post-Gate 2 |
| **digital-resource-creator** | AG-04 | generate-digital-resources | /scriba:create digital, CU-04 |
| **vigilance-auditor** | AG-07+08 | audit-consistency, repair-progression, fix-terminology | /scriba:audit, CU-08 |
| **format-specialist** | Export | export-docx, export-html-ebook | /scriba:docx, /scriba:html, /scriba:publish |

## Skills — 4 Movimientos (24 total)

### CREAR (7 skills)
| Skill | Proposito | Agente |
|-------|-----------|--------|
| generate-matrix | Matriz A&S desde curriculo MinEduc | curricular-analyst |
| generate-unit | Unidad editorial completa (4 secciones) | author |
| generate-teacher-guide | Guia docente + DUA + rubricas | pedagogue |
| generate-digital-resources | Minijuegos, bancos preguntas, QR | digital-resource-creator |
| generate-rubric | Rubricas 3+ niveles Bloom/Marzano | pedagogue |
| generate-book-express | Libro completo express (pipeline end-to-end) | editorial-conductor |
| amplify-draft | Amplificar borrador humano a calidad Scriba | editorial-amplifier |

### REVISAR (5 skills)
| Skill | Proposito | Agente |
|-------|-----------|--------|
| validate-comprehensibility | Student Simulator, 3 perfiles, >85% | student-simulator |
| verify-coverage | Cobertura 100%, cero huerfanas | curricular-analyst |
| review-pedagogical | Taxonomia, DUA, backward design | pedagogue |
| review-style | Manual de Voz, ortotipografia | style-corrector |
| audit-consistency | Progresion, terminologia cross-unidad | vigilance-auditor |

### EVOLUCIONAR (4 skills)
| Skill | Proposito | Agente |
|-------|-----------|--------|
| evolve-unit | Mejorar unidad con feedback | author |
| evolve-guide | Mejorar guia con feedback | pedagogue |
| adapt-dua | Agregar adaptaciones DUA | pedagogue |
| improve-accessibility | Reducir carga cognitiva, subir score | student-simulator |

### REPARAR (4 skills)
| Skill | Proposito | Agente |
|-------|-----------|--------|
| repair-alignment | Corregir gaps de cobertura curricular | curricular-analyst |
| repair-style | Corregir violaciones de estilo | style-corrector |
| repair-progression | Corregir saltos de complejidad | vigilance-auditor |
| fix-terminology | Resolver contradicciones terminologicas | vigilance-auditor |

### INFRAESTRUCTURA (4 skills)
| Skill | Proposito | Agente |
|-------|-----------|--------|
| auto-calibrate | Detectar entorno, calcular nivel priming | onboarding-guide |
| auto-prime | Generar RAG files desde documentos | onboarding-guide |
| export-docx | Exportar a Word (python-docx) | format-specialist |
| export-html-ebook | Exportar a HTML5 ebook interactivo | format-specialist |

## Referencia de Comandos (19 total)

### Pipeline Editorial
| Comando | Descripcion |
|---------|-------------|
| `/scriba:demo` | Demo express 4 pasos — "Aprender a Aprender" o tema al vuelo → DOCX + HTML |
| `/scriba:init` | Inicializar proyecto, procesar adjuntos como RAG, calibrar |
| `/scriba:book` | Crear libro express completo (matriz → unidades → guias → exports) |
| `/scriba:publish` | Exportar libro completo: DOCX + HTML + reporte |

### Creacion
| Comando | Descripcion |
|---------|-------------|
| `/scriba:create` | Router de creacion (matrix/unit/guide/digital) |
| `/scriba:matrix` | Generar Matriz de Alcance y Secuencia |
| `/scriba:unit` | Generar unidad modelo completa |
| `/scriba:guide` | Generar guia docente con DUA y rubricas |

### Revision y Mejora
| Comando | Descripcion |
|---------|-------------|
| `/scriba:review` | Revisar contenido (comprensibilidad/cobertura/estilo) |
| `/scriba:validate` | Validacion comprensibilidad + cobertura |
| `/scriba:gate` | Ejecutar quality gate (G0/G1/G1.5/G2/G3) |
| `/scriba:audit` | Auditoria completa cross-unidad |
| `/scriba:evolve` | Mejorar contenido con feedback |
| `/scriba:repair` | Reparar issues de revision |

### Colaboracion Humana
| Comando | Descripcion |
|---------|-------------|
| `/scriba:amplify` | Amplificar borrador humano preservando 100% contenido |

### Exportacion
| Comando | Descripcion |
|---------|-------------|
| `/scriba:docx` | Exportar a Word para maquetacion |
| `/scriba:html` | Exportar a HTML ebook interactivo |

### Sistema
| Comando | Descripcion |
|---------|-------------|
| `/scriba:menu` | Paleta interactiva de comandos |
| `/scriba:status` | Dashboard de estado del pipeline |

## Auto-Calibracion (COLD → WARM → HOT → DEEP)

| Nivel | Priming Files | Capacidad |
|-------|---------------|-----------|
| COLD | 0 | Solo demo basica. Sugerir /scriba:init |
| WARM | 1-2 | Express mode viable, sin discovery profundo |
| HOT | 3-5 | Pipeline completo viable |
| DEEP | 6+ con docs cliente | Optimo para todos los modos |

El init procesa automaticamente todos los documentos accesibles (PDFs, HTMLs, Word) y genera RAG priming files por dominio.

## Pipeline de Produccion

```
MinEduc Curriculo + Documentos Cliente
  |
  v
AUTO-CALIBRATE → Nivel COLD/WARM/HOT/DEEP
AUTO-PRIME → RAG files por documento
  |
  v
AG-01 (curricular-analyst) → Matriz A&S validada
  |
  +--→ [PARALELO] AG-02 (author) → Unidades editoriales
  +--→ [PARALELO] AG-05 (pedagogue) → Guias + DUA + Rubricas
  +--→ [PARALELO] AG-04 (digital-resource-creator) → Recursos
  |
  v
AG-03 (style-corrector) → Texto corregido
SIM (student-simulator) → Comprensibilidad >85%
AG-08 (vigilance-auditor) → Coherencia cross-unidad
  |
  v
GATES: G0 → G1 → G1.5 → G2 → G3
  |
  v
FORMAT-SPECIALIST → DOCX (maquetacion) + HTML (ebook)
```

## Quality Gates

| Gate | Nombre | Criterios | Paso |
|------|--------|-----------|------|
| **G0** | Seguridad | No PII, evidence tags | Automatico |
| **G1** | Pedagogico | 100% cobertura, taxonomia | Comite unanime |
| **G1.5** | Neurocientifico | Comprensibilidad >85%, DUA 2+ | Simulators + Psicologia |
| **G2** | Editorial | Manual de Voz, tono, trazabilidad | Editor >80% |
| **G3** | Completitud | Secciones, cross-refs, dashboard verde | Gerencia |

## Evidence Tags (obligatorios)

- `[METODOLOGIA]` — Del repositorio o Manual de Voz
- `[NEUROCIENCIA]` — Investigacion neurocientifica
- `[PEDAGOGIA]` — Teoria pedagogica (Bloom, Marzano, DUA)
- `[INFERENCIA]` — Deduccion logica
- `[SUPUESTO]` — Hipotesis no verificada

> Si >30% es [SUPUESTO]: "ALTO CONTENIDO INFERIDO — Requiere validacion."

## Brand

- **JM Labs**: #6366F1 (indigo), #22D3EE (cyan), #EFEAE4 (fondo)
- **Idioma**: Espanol — registro academico-profesional latinoamericano
- **Config**: `references/brand-config.json`
- **Nunca**: precios (solo FTE-meses), contenido sin evidence tags

## Archivos de Referencia

- `references/ontology/` — Modelo entidades, schemas, quality gates (4 archivos)
- `references/priming-rag/` — Knowledge primers por dominio (7+ archivos, crece con auto-prime)
- `references/brand-config.json` — Tokens de marca JM Labs
- `references/voice-manual-rules.md` — Manual de Voz Sinapsis
- `references/taxonomy-mapping.md` — Bloom + Marzano
- `references/agent-activation-matrix.md` — Agentes x CU
