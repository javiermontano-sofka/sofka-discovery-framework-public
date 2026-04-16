---
description: "Diseña workflows de automatización con n8n, Make, Zapier o RPA — mapeo de procesos, integración de APIs, orquestación de tareas"
user-invocable: true
---

# /mao:automate — Diseño de Workflows de Automatización

Lanza el diseño de workflows automatizados usando plataformas de integración (n8n, Make, Zapier) o RPA.

## Proceso

1. **Mapear proceso actual** — AS-IS del flujo manual a automatizar
2. **Identificar triggers** — Eventos que inician el workflow
3. **Diseñar flujo** — Nodos, condiciones, transformaciones, destinos
4. **Seleccionar plataforma** — n8n (self-hosted) | Make (cloud) | Zapier (simple) | RPA (legacy UI)
5. **Definir integraciones** — APIs, webhooks, bases de datos, servicios
6. **Planificar errores** — Retry logic, dead letter queues, alertas
7. **Documentar** — Diagrama del workflow, runbook de operación

## Uso

```
/mao:automate "automatizar proceso de facturación"
/mao:automate                    # Modo entrevista
```

Parse `$1` como descripción del proceso. Si vacío, conducir entrevista.

**Agente**: `metodologia-automation-architect`
**Skills**: `metodologia-rpa-discovery`, `metodologia-flow-mapping`, `metodologia-integration-architecture`
