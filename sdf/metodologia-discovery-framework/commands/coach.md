---
description: "Meta-comando de coaching: enruta a la especialidad de coaching adecuada según contexto (metodológico, agile, enterprise, negocios conscientes, productividad, liderazgo, equipos)"
user-invocable: true
---

# /mao:coach — Meta-Comando de Coaching

Routing inteligente a la especialidad de coaching más adecuada según el contexto del usuario.

## Detección de Contexto

| Señal | Coach Asignado |
|-------|---------------|
| "metodología", "PIVOTE", "4 fases", "fundamentar" | `metodologia-methodological-coach` |
| "scrum", "kanban", "sprint", "retrospectiva", "agile" | `metodologia-agile-coach` |
| "enterprise", "scaling", "SAFe", "portfolio" | `metodologia-enterprise-coach` |
| "liderazgo consciente", "Fred Kofman", "valores", "propósito" | `metodologia-conscious-business-coach` |
| "hábitos", "productividad", "GTD", "atomic habits" | `metodologia-productivity-coach` |
| "equipo", "dinámicas", "seguridad psicológica" | `metodologia-team-coach` |
| "liderazgo", "servant leader", "situacional" | `metodologia-leadership-coach` |
| Ambiguo | Preguntar: "¿Qué tipo de coaching necesitas?" |

## Uso

```
/mao:coach              # Detecta contexto y enruta
/mao:coach agile        # Directo a agile coaching
/mao:coach productividad # Directo a productivity coaching
```

Parse `$1` como especialidad. Si vacío, analizar contexto de conversación y enrutar.
