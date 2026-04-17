# Attachment Taxonomy — FASE 0 Ingestion

> Full spec en `skills/sap-attachment-handling/references/format-matrix.md`. Este archivo es el índice de alto nivel.

## Formatos soportados (nativo)

| Familia | Extensiones | Extractor | Locator en `[ADJUNTO]` |
|---------|-------------|-----------|------------------------|
| Tabular | `.csv` | `extract-csv.py` | `col=NAME` |
| Hoja de cálculo | `.xlsx .xlsm .xls` | `extract-xlsx.py` | `sheet=NAME` |
| Doc enriquecido | `.docx .doc` | `extract-docx.py` | `heading=TEXT` |
| PDF | `.pdf` | `extract-pdf.py` + pdfplumber | `page=N` |
| Presentación | `.pptx .ppt` | `extract-pptx.py` | `slide=N` |
| Web | `.html .htm` | `extract-html.py` | `h=TEXT` |
| Código | `.py .ts .tsx .js .sql .abap` | `extract-code.py` | `sig=NAME` |
| Estructurado | `.json .yaml .yml .xml` | `extract-structured.py` | `root` |
| Texto plano | `.md .txt .log` | passthrough | `raw` |
| Otros | cualquier | `extract-generic.sh` | `generic` |

## Flujo

```
user invokes /sap:<cmd> --adjuntos a.xlsx,b.pdf,c.sql
        │
        ▼
@attachment-processor (FASE 0)
        │
        ├─ dispatch via scripts/ingest-attachments.sh
        ├─ extract-xlsx.py a.xlsx → .discovery/priming-rag-a.md
        ├─ extract-pdf.py   b.pdf → .discovery/priming-rag-b.md
        └─ extract-code.py  c.sql → .discovery/priming-rag-c.md
        │
        ▼
Committee reads priming-rag-*.md as evidence source
        │
        ▼
Deliverable cites via [ADJUNTO:a.xlsx:sheet=FI-GL]
        │
        ▼
@qa-validator fails if tag has no matching priming doc
```

## Límites operativos

- Máx 200 KB por priming doc (auto-chunk si excede)
- Redacción automática de secretos (api keys, bearer tokens, sk-*, AKIA*)
- Binarios >5 MB → procesamiento head-only + warning
- PDFs escaneados (sin texto) → flag para OCR manual

## Nuevas reglas brand

- `[ADJUNTO]` se renderiza en HTML como `.tx` (naranja matte)
- Prioridad de evidencia: `[CÓDIGO] > [ADJUNTO] > [CONFIG] > [DOC] > [NOTEBOOKLM] > [STAKEHOLDER] > [INFERENCIA] > [SUPUESTO]`
