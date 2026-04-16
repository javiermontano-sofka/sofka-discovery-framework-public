---
description: "Taller de prompt engineering — diseño, evaluación y optimización de prompts para LLMs usando metodología NL-HP"
user-invocable: true
---

# /mao:prompt-workshop — Taller de Prompt Engineering

Sesión guiada de diseño y optimización de prompts usando la metodología NL-HP (Natural Language High Performance).

## Proceso

1. **Definir objetivo** — ¿Qué debe lograr el prompt?
2. **Analizar contexto** — Modelo target, restricciones, audiencia
3. **Diseñar prompt** — Estructura, instrucciones, few-shot, chain-of-thought
4. **Evaluar** — Rubric de calidad (claridad, especificidad, robustez, eficiencia)
5. **Iterar** — A/B testing, refinamiento, edge cases
6. **Documentar** — Prompt card con metadata, versión, evaluación

## Uso

```
/mao:prompt-workshop "prompt para análisis de sentimiento"
/mao:prompt-workshop                    # Modo libre
```

Parse `$1` como objetivo del prompt. Si vacío, conducir entrevista.

**Agente**: `metodologia-prompt-engineer`
**Skills**: `metodologia-output-engineering`
