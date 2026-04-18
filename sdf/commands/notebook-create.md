---
description: "Crear notebook NotebookLM para proyecto SAP — base para deep research y knowledge base"
user-invocable: true
argument-hint: "<titulo> [--bootstrap-canonical]"
allowed-tools: ["mcp__notebooklm__notebook_create", "mcp__notebooklm__notebook_list", "Bash"]
---

# /sdf:notebook-create — Create NotebookLM Notebook

> Diseñado por **Javier Montaño**. Plugin: sdf v3.2+

## ROL

Master: `@discovery-conductor`
Consulta: `@research-scientist` (validar que el título tiene sentido para SAP research)

## OBJETIVO

Crear notebook NotebookLM (Google) vinculado al proyecto actual. Con flag `--bootstrap-canonical`, crea los 6 notebooks canónicos SAP en una sola operación.

## PROTOCOLO

### CP-0 · Pre-check
1. Ejecutar `scripts/notebook-auth-check.sh` para confirmar auth OAuth válida.
2. Si falla auth → instruir al usuario: `nlm login` en terminal.

### CP-1 · Crear notebook(s)

**Modo simple** (titulo individual):
```
mcp__notebooklm__notebook_create(title="$ARGUMENTS")
```

**Modo canonical** (`--bootstrap-canonical`):
```bash
bash ${CLAUDE_PLUGIN_ROOT}/scripts/notebook-bootstrap.sh <cliente>
```
Crea 6 notebooks: Clean Core, SAP Activate, BTP, Data Migration, Module Configuration, Integration Suite.

### CP-F · Registrar
- Guardar notebook_id en `.discovery/notebooks-registry.json`
- Reportar URL accesible del notebook

## MCP Tools Usados

- `mcp__notebooklm__notebook_create` — crear notebook
- `mcp__notebooklm__notebook_list` — verificar existencia

## RESTRICCIONES

- Títulos en español o inglés (NotebookLM soporta ambos)
- Validar que el título no duplique notebooks existentes
- Máximo ~100 notebooks por cuenta Google

---
*SAP Enterprise Plugin v3.2 — Diseñado por Javier Montaño.*
