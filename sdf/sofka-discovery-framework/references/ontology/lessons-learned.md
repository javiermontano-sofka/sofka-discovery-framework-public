# Lecciones Aprendidas

> Sofka SAGE — Ontología viva
> Documento vivo que se actualiza durante las sesiones de discovery con correcciones, patrones y decisiones.

---

## Correcciones recibidas

<!-- Registrar aquí correcciones explícitas del usuario sobre comportamiento, formato, contenido o proceso. Formato: fecha, corrección, acción tomada. -->

### [2026-03-27] PQA agents tenían `tools:` y `allowed-tools:` duplicados
- **Contexto:** QA backcasting de v13.0 consolidación. 4 agents PQA (plugin-architect, plugin-builder-agent, plugin-qa-engineer, plugin-spec-writer) tenían campo legacy `tools:` además de `allowed-tools:`.
- **Aprendizaje:** Al consolidar agents de otro plugin, verificar que el frontmatter siga la convención del plugin destino. `tools:` es formato legacy; `allowed-tools:` es el estándar Claude Code.
- **Acción:** Removido `tools:`, conservado solo `allowed-tools:`. Verificar en futuras consolidaciones.

### [2026-03-27] Cross-refs en skills usaban nombres inexistentes
- **Contexto:** 9 nombres de skills referenciados en Mermaid diagrams y "Related Skills" no existían (ux-research, scenario-evaluation, security-assessment, etc.).
- **Aprendizaje:** Al renombrar o consolidar skills, hacer grep global de cross-refs. Los diagramas Mermaid son una fuente frecuente de refs rotas.
- **Acción:** Mapeadas 9 refs a skills correctas. Corregidas 26 ocurrencias en 14 archivos.

### [2026-03-27] Recursive 13.0.0/ directory acumuló 2.4 GB
- **Contexto:** Directorio `13.0.0/` con 12+ niveles de anidamiento recursivo. Ya estaba en `.gitignore` pero consumía 2.4 GB en disco local.
- **Aprendizaje:** Nunca copiar el plugin dentro de sí mismo para versionado. Usar git tags/branches para versiones.
- **Acción:** Eliminado. Regla: versiones vía git, no directorios anidados.

---

## Patrones identificados

<!-- Registrar aquí patrones recurrentes observados en múltiples sesiones de discovery: preferencias del usuario, configuraciones frecuentes, flujos típicos, decisiones comunes. -->

### [2026-03-27] Convención `sofka-` prefix en commands vs skills
- **Contexto:** Commands referencian skills con prefix `sofka-` (ej: `sofka-software-architecture`) pero los directorios reales son sin prefix (`software-architecture`).
- **Patrón:** El prefix `sofka-` en commands es una convención narrativa y coincide con el namespace de agents en Claude Code (el plugin `sdf` genera agents `sofka-{name}`). NO es un path a directorio.
- **Regla:** No "corregir" el prefix en commands — es intencional. Pero en cross-refs de SKILL.md, usar el nombre de directorio sin prefix.

### [2026-03-27] Technology specialists tienen Constraints, strategic agents no
- **Contexto:** Los 18 agents *-specialist.md tienen Constraints section por diseño original. Los strategic agents (conductor, architect, guardian) no la tenían.
- **Patrón:** Los specialists necesitan boundaries de scope técnico. Los strategic agents necesitan boundaries de proceso y decisión.
- **Regla:** Todo agent con impacto cross-cutting debe tener Constraints.

---

## Anti-patrones a evitar

<!-- Registrar aquí comportamientos que generaron problemas o fueron explícitamente rechazados por el usuario. Incluir contexto para evitar repetición. -->

### [2026-03-27] No copiar plugin dentro de sí mismo para versionado
- **Contexto:** Directorio recursivo `13.0.0/13.0.0/...` detectado con 12+ niveles.
- **Anti-patrón:** Crear subdirectorio con nombre de versión dentro del propio plugin para "archivar" la versión.
- **Correcto:** Usar `git tag v13.0.0` y branches. Las versiones archivadas no viven en el working tree.

### [2026-03-27] No usar `#!/bin/bash` hardcoded en scripts
- **Contexto:** 8/19 scripts tenían `#!/bin/bash` en vez de `#!/usr/bin/env bash`.
- **Anti-patrón:** Hardcodear path de bash. Falla en sistemas donde bash no está en `/bin/`.
- **Correcto:** Usar `#!/usr/bin/env bash` para portabilidad (macOS, Linux, CI).

---

## Decisiones del usuario

<!-- Registrar aquí decisiones explícitas del usuario que establecen precedente para futuras sesiones: preferencias de formato, tipo de servicio predeterminado, nivel de detalle, exclusiones. -->

### [2026-03-27] Meta-cognition: FULL triad + LIGHT todos los demás
- **Decisión:** discovery-conductor, delivery-manager, risk-controller = FULL (3-pass reasoning con cross-validation). Todos los demás agents = LIGHT (2-pass reasoning).
- **Implementación:** Campo `meta-cognition: FULL|LIGHT` en frontmatter de cada agent. Definición canónica en `_defaults.md`.

### [2026-03-27] Constraints obligatorios para agents de alto impacto
- **Decisión:** Top-10 strategic agents deben tener sección `## Constraints` con boundaries de proceso y decisión.
- **Alcance:** Tríada + technical-architect + enterprise-architect + solutions-architect + security-architect + quality-guardian + research-scientist + transformation-architect.

---

## Instrucciones de uso

Este documento es un registro acumulativo. Las entradas se agregan al final de cada sección correspondiente con el siguiente formato:

```markdown
### [{fecha}] {título breve}
- **Contexto:** {situación que motivó el aprendizaje}
- **Aprendizaje:** {qué se aprendió o corrigió}
- **Acción:** {qué cambio se implementó o debe implementarse}
```

El `discovery-conductor` debe consultar este documento al inicio de cada sesión para evitar repetir errores y respetar decisiones previas del usuario.

---

*Sofka SAGE — La excelencia no se improvisa, se diseña.*
