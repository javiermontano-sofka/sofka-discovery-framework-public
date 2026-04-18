# Format Matrix — Attachment Extractors

| Extensión | Extractor | Parser primario | Fallback | Locator en tag |
|-----------|-----------|-----------------|----------|----------------|
| .csv | `extract-csv.py` | pandas | — | `col=NAME` |
| .xlsx .xlsm .xls | `extract-xlsx.py` | openpyxl + pandas | — | `sheet=NAME` |
| .docx | `extract-docx.py` | python-docx | — | `heading=TEXT` |
| .pdf | `extract-pdf.py` | pypdf | pdfplumber tables | `page=N` |
| .pptx | `extract-pptx.py` | python-pptx | — | `slide=N` |
| .html .htm | `extract-html.py` | beautifulsoup + lxml | — | `h=TEXT` |
| .py | `extract-code.py` | ast | regex | `sig=NAME` |
| .ts .tsx .js | `extract-code.py` | regex | — | `sig=NAME` |
| .sql | `extract-code.py` | regex (DDL) | — | `sig=OBJECT` |
| .abap | `extract-code.py` | regex | — | `sig=NAME` |
| .json | `extract-structured.py` | stdlib | — | `root` |
| .yaml .yml | `extract-structured.py` | pyyaml | — | `root` |
| .xml | `extract-structured.py` | lxml-xml | — | `root` |
| .md .txt .log | passthrough | — | — | `raw` |
| otros | `extract-generic.sh` | file + strings | hexdump | `generic` |

## Consumer routing

| Tipo | Agente consumidor preferido |
|------|-----------------------------|
| Datos tabulares | `@functional-lead`, especialistas data-* |
| Especificaciones/docs | `@sap-docs-steward` |
| Presentaciones ejecutivas | `@sap-orchestrator` (TL;DR feed) |
| Código ABAP/SQL | `@abap-expert` |
| Código TS/Python | desarrollo especialistas + `@qa-validator` |
| Config/infra | `@security-architect`, `@integration-patterns-expert` |
| Binarios/desconocidos | `@qa-validator` (escalación) |

## Límites

- Máx 200 KB por priming doc (chunking aplicado automáticamente)
- Máx 100 páginas PDF leídas en primer pase
- Máx 20 hojas XLSX procesadas en primer pase
- Máx 400 líneas de source code en head (signatures sin límite)
