---
description: Escanear el repositorio del cliente para detectar secretos y credenciales expuestas (Gate G0)
user-invocable: true
---

# /sdf:scan-secrets

> Ejecuta el motor de sanitización G0 para detectar API keys, tokens, passwords, connection strings y private keys en el repositorio actual.

## Uso

```
/sdf:scan-secrets [ruta]
```

- `ruta` (opcional): Directorio a escanear. Default: directorio actual.

## Proceso

1. **Escanear** — Ejecutar `scripts/secrets-scan.sh` sobre el directorio objetivo
2. **Reportar** — Presentar tabla de hallazgos con tipo, archivo, línea y severidad
3. **Clasificar** — Agrupar por severidad: CRÍTICO (private keys, prod passwords), ALTO (API keys, tokens), MEDIO (connection strings genéricos)
4. **Recomendar** — Si hay hallazgos, sugerir ejecutar `/sdf:mask-secrets` para enmascarar
5. **Auditar** — Confirmar que `discovery/sage-secrets-audit.log` fue generado y está gitignored

## Output

Tabla markdown con hallazgos + ghost menu con siguiente acción recomendada.

## Gate G0

Si se ejecuta como parte de `/sdf:run-auto` o `/sdf:run-deep` y hay hallazgos:
- **ABORT** del pipeline con mensaje claro
- Sugerir remediar con `/sdf:scan-secrets` + revisión manual antes de continuar

## Reglas

- NUNCA incluir valores de secretos en el output — solo tipo + ubicación
- Auditoría local únicamente — no enviar hallazgos a servicios externos
- `sage-secrets-audit.log` siempre gitignored
