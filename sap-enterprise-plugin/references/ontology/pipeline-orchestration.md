# Pipeline Orchestration — ToT + HITL + Gates

## Flujo principal

```
FASE 0: Ingesta de adjuntos (@attachment-processor) [nuevo v4.0]
        → priming-rag-*.md generados, tags [ADJUNTO] habilitados

FASE R: Research augmentation (@sap-docs-steward + NotebookLM MCP)
        → priming contextual + confianza hierárquica

FASE 1: Exploración (branching de razonamiento)
        → cada agente genera hipótesis tentativas

FASE 2: Evaluación (scoring contra evidencia)
        → votos + confidence per branch

FASE 3: Convergencia (mejor branch + alternativas descartadas)

FASE 4: Output (deliverable + meta-box)
        → Markdown + opcional HTML brand via /sap:render-html

FASE A: Audio briefing (opcional, NotebookLM audio_overview)
```

## HITL modes

| Flag | Comportamiento |
|------|----------------|
| `--auto` | pipeline corre end-to-end, sin intervención |
| `--hitos` | pausa en cada gate para confirmación humana |
| `--paso-a-paso` | pausa después de cada fase, muestra artifact intermedio |

## Gates (hard stops)

- **G1**: Fin de FASE 0 — ¿los adjuntos fueron ingestados correctamente? (`@qa-validator`)
- **G1.5**: Fin de FASE R — ¿hay suficiente evidencia para proseguir? (`@sap-docs-steward`)
- **G2**: Fin de FASE 2 — ¿el comité alcanzó consenso? (`@sap-orchestrator`)
- **G3**: Fin de FASE 4 — ¿el deliverable pasa criterios de calidad? (`@qa-validator`)

## Composición del comité

- Permanentes (4): `sap-docs-steward, functional-lead, abap-expert, qa-validator`
- Permanente-conditional (1): `attachment-processor` si hay adjuntos
- Flex (1-5): elegidos por `select-committee.sh` desde los especialistas temáticos/módulo
- Tamaño final: 5, 7 o 9 (siempre impar para desempate en votación)

## Command → pipeline map

| Comando | Modo default | Gates activos |
|---------|--------------|---------------|
| `/sap:consulta` | `--auto` | G3 |
| `/sap:comite` | `--hitos` | G1, G2, G3 |
| `/sap:investigar` | `--auto` | G1.5, G3 |
| `/sap:discovery` | `--hitos` | G1, G1.5, G2, G3 |
| `/sap:adopcion` | `--hitos` | G2, G3 |
