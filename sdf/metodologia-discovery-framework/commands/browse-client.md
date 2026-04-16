---
description: Auditoría visual de la aplicación del cliente via browser (MCP Playwright)
user-invocable: true
---

# /mao:browse-client

> Navega la aplicación del cliente, captura screenshots, audita UI/UX y accesibilidad.

## Uso

```
/mao:browse-client <URL> [modo]
```

- `URL` (requerido): URL de la aplicación del cliente
- `modo` (opcional): `quick` (homepage + 5 páginas) | `full` (flujos completos) | `accessibility` (auditoría WCAG)

## Proceso

1. **Navegar** — Abrir URL con MCP Playwright
2. **Screenshot** — Capturar estado visual de cada pantalla
3. **Console** — Revisar errores JavaScript, warnings
4. **Network** — Identificar APIs, tiempos de respuesta
5. **Accessibility** — Contraste, alt text, ARIA, keyboard nav
6. **Documentar** — Guardar evidencia en `discovery/assets/screenshots/`

## Requisitos

- MCP Playwright debe estar disponible en el entorno
- Si no disponible, el skill degrada a documentación manual de URLs

## Reglas

- NUNCA almacenar credenciales del cliente
- Screenshots pueden contener PII — NO commitear a repos públicos
- Etiquetar toda evidencia visual como [CÓDIGO]
