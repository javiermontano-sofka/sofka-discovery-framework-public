---
description: Convertir skills MAO MOAT a formatos cross-platform (Cursor, Codex, Gemini, Aider, Windsurf)
user-invocable: true
---

# /mao:convert-skills

> Convierte skills MOAT de MAO a formatos compatibles con otras herramientas de AI coding.

## Uso

```
/mao:convert-skills [target] [skill_dir] [output_dir]
```

- `target` (opcional): `cursor` | `codex` | `gemini` | `aider` | `windsurf` | `all` (default: all)
- `skill_dir` (opcional): Directorio de skills. Default: `./skills/`
- `output_dir` (opcional): Directorio de salida. Default: `./converted/`

## Proceso

1. **Escanear** — Encontrar todos los SKILL.md en el directorio de skills
2. **Convertir** — Ejecutar `bash scripts/convert-skills.sh <target>`
3. **Verificar** — Contar archivos generados por plataforma
4. **Reportar** — Resumen de conversión con estadísticas

## Targets Soportados

| Target | Formato | Resultado |
|--------|---------|-----------|
| Cursor | `.cursor/rules/*.mdc` | Una rule por skill |
| Codex CLI | `AGENTS.md` | Archivo único con todas las skills |
| Gemini CLI | `.gemini/style.md` | Archivo único con todas las skills |
| Aider | `CONVENTIONS.md` | Archivo único con convenciones |
| Windsurf | `.windsurfrules` | Archivo único con reglas |

## Nota

Las skills convertidas pierden profundidad MOAT (sin references/, examples/). La experiencia completa L3 solo está disponible en Claude Code nativo.
