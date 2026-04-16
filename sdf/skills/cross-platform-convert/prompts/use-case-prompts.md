# Use Case Prompts — Cross-Platform Skill Conversion

## Caso de Uso 1: Conversión Batch a Cursor

**Contexto**: La organización adopta Cursor como IDE complementario y necesita portar las skills MOAT para que desarrolladores en Cursor tengan las mismas capacidades PM.

**Prompt Template**:
```
Convierte las siguientes skills MOAT de formato Claude Code (SKILL.md) a formato Cursor (.cursorrules):
- Skills: {lista_de_skills}
- Preserva: lógica de proceso, validation gates, evidence tags
- Adapta: frontmatter a formato Cursor rules, allowed-tools a instrucciones de comportamiento
- Documenta: secciones sin equivalente en Cursor
- Output: Un archivo .cursorrules por skill + compatibility report
```

**Output Esperado**: Archivos `.cursorrules` con reglas equivalentes, reporte de compatibilidad con fidelidad ≥90%.

## Caso de Uso 2: Generación de AGENTS.md para Codex

**Contexto**: El equipo usa GitHub Codex para revisiones de código y quiere que los agentes Codex apliquen las mismas prácticas PM en PRs y código.

**Prompt Template**:
```
Genera archivos AGENTS.md compatibles con GitHub Codex a partir de las skills MOAT:
- Skills: {lista_de_skills}
- Estructura: Un AGENTS.md por directorio de skill
- Incluye: directivas de agente, protocolos de proceso, quality gates
- Excluye: secciones incompatibles con formato Codex
- Output: AGENTS.md files + mapping document
```

**Output Esperado**: Archivos `AGENTS.md` con directivas de agente, documento de mapeo sección-por-sección.

## Caso de Uso 3: Matriz de Compatibilidad Multi-Plataforma

**Contexto**: Antes de iniciar conversiones masivas, el PMO necesita entender qué funcionalidad se preserva y qué se pierde en cada plataforma.

**Prompt Template**:
```
Genera una matriz de compatibilidad cross-platform para todas las skills MOAT:
- Plataformas: Cursor, Codex, Gemini, Copilot
- Dimensiones: secciones SKILL.md, features (frontmatter, allowed-tools, evidence tags, validation gates)
- Scoring: Full (100%), Partial (50%), None (0%) por sección por plataforma
- Output: Matriz en tabla Markdown + recomendaciones de priorización
```

**Output Esperado**: Tabla de compatibilidad con scoring por plataforma, priorización de conversión.

## Caso de Uso 4: Protocolo de Sincronización Post-Conversión

**Contexto**: Las skills MOAT evolucionan con cada versión de APEX. Se necesita un protocolo para propagar cambios a las versiones convertidas.

**Prompt Template**:
```
Diseña un protocolo de sincronización para skills MOAT convertidas a múltiples plataformas:
- Plataformas activas: {plataformas}
- Frecuencia de actualización: {cadencia}
- Automatización: scripts de detección de cambios + reconversión
- Validación: verificación post-sync en cada plataforma
- Output: Protocolo documentado + script de automatización
```

**Output Esperado**: Documento de protocolo con workflow de sincronización, script de detección de cambios.
