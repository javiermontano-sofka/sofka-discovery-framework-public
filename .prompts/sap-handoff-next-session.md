# Prompt de handoff · Retomar SAP plugin en conversación nueva

**Uso**: copiar el bloque siguiente como primer mensaje en una conversación nueva de Claude Code cuando quieras retomar trabajo en el plugin SAP (ya no vive en el monorepo público SDF; está en su propio repo privado).

---

## Contexto que debe recibir Claude al inicio

```
Soy Javier Montaño (PreSales Architect @ Sofka Technologies, GitHub: javiermontano-sofka).
Retomo trabajo sobre el plugin SAP Enterprise. Contexto pre-cargado:

### Repositorios
- **SAP plugin (privado, este)**: https://github.com/javiermontano-sofka/sap-enterprise-plugin
  - Rama principal: main
  - Contenido: 62 agentes invocables · 104 skills (INSIGNIA 7/7) · 29 comandos /sap:*
  - Clone local esperado: ~/workspace/sap-enterprise-plugin (o wherever lo clones)
- **SDF público (hermano, referencia)**: https://github.com/javiermontano-sofka/sofka-discovery-framework-public
  - SDF es el framework de discovery general (SDA/QA/RPA/Data-AI/Cloud/SAS).
  - SAP reutiliza patrones SDF pero vive separado porque contiene IP de procesos SAP que no va a público.

### Linaje de atribución (crítico — validar en cada commit)
- **Autor único en SAP**: Javier Montaño <javier.montano@sofka.com.co> (cuenta GitHub javiermontano-sofka).
- **NO usar**: cuenta JaviMontano, Co-Authored-By Claude trailers, "🤖 Generated with [Claude Code]" footers.
  Todos fueron eliminados en la limpieza v13.4.2 de 2026-04-18.
- **Jean Ruiz Granda y Catherine Rodrigo contribuyeron a SDF, NO a SAP**. Nunca añadir esos nombres a artefactos SAP.
- Git config local antes de commit:
    git config user.name "javiermontano-sofka"
    git config user.email "javier.montano@sofka.com.co"

### Marca y copyright (aplicar siempre)
- **Copyright**: © 2026 Sofka Technologies. All Rights Reserved.
- **Tagline**: "Tecnología para sofkianos." (colaboradores Sofka = sofkianos).
- **Design System v5.1** (tokens canónicos en sdf.references.ontology.canonical-tokens.md del repo SDF):
  - --sofka-orange #FF7E08 · --sofka-orange-dark #CC6506
  - --sofka-black #000 · --sofka-light #EFEAE4 · --sofka-positive #FFD700 (gold)
  - --sofka-critical #DC2626 · --sofka-info #2563EB · --sofka-warning #D97706
  - Fonts: Clash Grotesk (display) + Inter (body). Bilingual toggle es/en donde aplique.
  - **JAMÁS verde**. Validator CI rechaza #00ff00 / #2ecc71 / ": green".

### Protocolo zero-hallucination (obligatorio en deliverables)
Cada claim factual lleva uno de 8 evidence tags, en prioridad:
    [CÓDIGO] > [ADJUNTO] > [CONFIG] > [DOC] > [NOTEBOOKLM] > [STAKEHOLDER] > [INFERENCIA] > [SUPUESTO]
Sin tag → [SUPUESTO]. Densidad >30% [SUPUESTO] → banner. [SUPUESTO:severity=CRÍTICO] → bloquea gate.

### Quality gates (pipeline SAP hereda estructura SDF)
- G0 Security + attachment sanity (inicio de sesión)
- G1 Discovery completeness (tras P0-P4)
- G1.5 Feasibility — 7 Sabios (antes de costos)
- G2 Budget + timeline (tras P5-P6, solo FTE-meses — NUNCA precios en USD/COP/EUR)
- G3 Final deliverable review (tras P7-P9)

### Modos HITL
--auto (gates advisory) · --hitos (pausa en gates, default) · --paso-a-paso (pausa tras cada P stage).

### Idioma
Output por defecto = español LatAm enterprise register. Nombres técnicos en inglés cuando son estándar industria (CI/CD, DevOps, etc.).

### Arquitectura SAP plugin
- agents/ → 62 .md (6 permanent + 40 thematic + 12 module specialists + 2 orchestrators + 2 shared rules)
- skills/ → 104 skills INSIGNIA 7/7 (SKILL.md + agents/grader.md + evals/evals.json + references/ + examples/ + scripts/ + prompts/)
- commands/ → 29 /sap:* slash commands
- templates/ → jinja2 brand HTML templates + markdown deliverable templates
- .mcp.json → NotebookLM MCP stdio config
- scripts/ → extractores FASE 0, audits, renderers
- hooks/ → SessionStart + PostToolUse
- references/ontology/ → spec operacional agentic (cada agente la consulta)

### Tarea que quiero hacer ahora
<REEMPLAZAR: describe qué funcionalidad quieres añadir al plugin SAP>

Ejemplos de funcionalidades frecuentes:
- "Agregar un nuevo agente temático para compliance SOX"
- "Nueva skill para BPMN de procesos SD→MM"
- "Comando /sap:migration-wave para secuenciar waves S/4HANA"
- "Integrar nueva ontología módulo PM"
- "Skill que genere decision tables DMN para approval workflows"

### Discipline de trabajo
- Antes de código: leer archivos existentes (el proyecto usa ontology-first).
- Commits conventional: feat(sap-X): · fix(sap-X): · docs(sap-X):
- Una skill/agente/comando por archivo; no mezclar.
- PR por cambio coherente. Rama: feat/sap-<slug> desde main.
- Validar con scripts/audit-sdk-compliance.sh antes de commit.

### Contexto adicional
- Plan activo v13.4.2 BPMN/DMN para monorepo: ~/.claude/plans/crystalline-herding-pebble.md
- PR abierto en SDF público: https://github.com/javiermontano-sofka/sofka-discovery-framework-public/pull/7 (ADRs 0026-0031 sobre degradation chain, plugin-agent-sdk-mirror, etc.) — relevante porque SAP seguirá los mismos patrones una vez mergeen.
- SAP recibió sus propios ADRs SAP-0001…SAP-0004 (en sap-enterprise-plugin/docs/adr/) cuando se cree el docs tree — todavía pendiente.

Empieza con /sdf:prime-repo (adaptado a SAP) o un ls rápido de agents/skills/commands para orientarte. Pregunta aclaraciones si la funcionalidad propuesta impacta el contrato INSIGNIA 7/7 o cruza gates.
```

---

## Cómo usarlo

1. **Clonar el repo privado** antes de abrir Claude Code:
   ```bash
   gh repo clone javiermontano-sofka/sap-enterprise-plugin
   cd sap-enterprise-plugin
   ```
2. **Abrir Claude Code** en ese directorio.
3. **Pegar** el bloque entre triple-backticks arriba como primer mensaje, reemplazando `<REEMPLAZAR>` con la funcionalidad concreta que quieres añadir.
4. Claude recibe el contexto completo (atribución, marca, gates, arquitectura) en un solo turno y arranca la planificación.

## Actualización de este prompt

Cuando el plugin SAP evolucione (nuevas versiones, nuevos agentes, cambios de estructura), actualizar:
- Counts (agents / skills / commands) en la sección "Arquitectura SAP plugin".
- Version tag en cabecera si corresponde.
- Lista de ejemplos "Tarea que quiero hacer ahora" con patrones recientes.

---

**Autor**: Javier Montaño
**Copyright**: © 2026 Sofka Technologies. All Rights Reserved.
**Tagline**: Tecnología para sofkianos.
