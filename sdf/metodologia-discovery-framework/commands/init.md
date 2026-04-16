---
description: Inicializar el entorno MetodologIA para un nuevo engagement de discovery
user-invocable: true
---

# /mao:init

> Wizard de inicialización que configura `discovery/`, pre-puebla el contexto del cliente y ejecuta G0.

## Uso

```
/mao:init [ruta]
```

- `ruta` (opcional): Directorio del proyecto del cliente. Default: directorio actual.

## Proceso (dentro de Claude Code)

Como este comando se ejecuta dentro de Claude Code (no en terminal directa), el wizard funciona así:

1. **Preguntar datos del cliente** — Nombre, tipo de servicio, contacto principal, sector/industria
2. **Crear estructura** — Generar `discovery/` con subdirectorios y archivos base
3. **Pre-poblar contexto** — SESSION-README.md con datos del cliente, session-state.json con configuración
4. **Auto-discovery** — Ejecutar `index-repo.sh` para indexar el repositorio
5. **G0 Security Scan** — Ejecutar `secrets-scan.sh` para verificar secretos
6. **Presentar resumen** — Tabla de configuración + siguiente comando recomendado

## Output

SESSION-README.md + session-state.json + estructura de directorios + reporte de inicialización.

## Alternativa (terminal directa)

Para usar fuera de Claude Code como wizard interactivo:
```bash
bash scripts/mao-init.sh [ruta-del-repo]
```

## Reglas

- SIEMPRE ejecutar G0 durante la inicialización
- NUNCA sobrescribir un `discovery/` existente sin confirmación del usuario
- Si `session-state.json` ya tiene `initialized_by: "mao-init"`, avisar que ya fue inicializado
