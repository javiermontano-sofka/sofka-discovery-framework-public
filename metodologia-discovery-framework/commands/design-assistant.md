---
description: "Diseña asistentes AI, GPTs personalizados y agentes conversacionales — arquitectura, personalidad, prompts, flujos de interacción"
user-invocable: true
---

# /mao:design-assistant — Diseño de Asistentes AI

Lanza el workflow de diseño de asistentes AI/GPTs personalizados.

## Proceso

1. **Definir propósito** — ¿Qué problema resuelve el asistente?
2. **Diseñar personalidad** — Tono, registro, restricciones, identidad
3. **Arquitectar prompts** — System prompt, few-shot examples, guardrails
4. **Mapear flujos** — Conversational flows, edge cases, escalation
5. **Definir herramientas** — APIs, knowledge bases, acciones disponibles
6. **Evaluar** — Test scenarios, rubric de calidad, user testing

## Uso

```
/mao:design-assistant "asistente de onboarding para nuevos empleados"
/mao:design-assistant                    # Modo entrevista
```

Parse `$1` como descripción del asistente. Si vacío, conducir entrevista de 4 preguntas.

**Agente**: `metodologia-assistant-designer`
**Skills**: `metodologia-prompt-engineering`, `metodologia-ux-design-discovery`, `metodologia-product-strategy`
