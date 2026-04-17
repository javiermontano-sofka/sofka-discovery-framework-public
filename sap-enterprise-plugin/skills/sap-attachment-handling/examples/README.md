# Examples — sap-attachment-handling

## Sample invocation

```bash
# One-time setup
bash scripts/setup-attachments.sh

# Ingest multiple attachments
bash scripts/ingest-attachments.sh \
  ./adjuntos/readiness-check.xlsx \
  ./adjuntos/contract.pdf \
  ./adjuntos/legacy-schema.sql \
  ./adjuntos/kickoff.pptx
```

Outputs land in `.discovery/priming-rag-*.md`.

## Sample priming doc (CSV)

```
---
source_path: /work/adjuntos/customers.csv
sha256: a3f2...
bytes: 42813
extractor: csv
captured_at: 2026-04-17T12:00:00+00:00
---

# Adjunto: customers.csv

## Resumen
- CSV con 8 columnas y ≥1200 filas (muestra 5k)
- Columnas: CustomerId, Country, CreatedAt, ...

## Contenido estructurado
### Schema
- `CustomerId` · int64 · nulls=0
- `Country` · object · nulls=3
...

### Head (20)
| CustomerId | Country | ... |

### Stats
| count | mean | std | ... |

## Evidencia utilizable
- `[ADJUNTO:customers.csv:col=CustomerId]`
- `[ADJUNTO:customers.csv:col=Country]`
```

## Cómo el comité usa los adjuntos

Una vez generados los priming docs, `@sap-orchestrator` los lee y prefija cada claim con el tag correspondiente. Por ejemplo:

> "El 23% de customers no tiene país asignado [ADJUNTO:customers.csv:col=Country]. Recomendamos data cleansing sprint antes de migration."

`@qa-validator` verifica que cada `[ADJUNTO:...]` tenga un priming doc que lo respalde.
