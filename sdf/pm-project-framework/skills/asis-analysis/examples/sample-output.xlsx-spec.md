# XLSX Output Specification — AS-IS Technical Analysis

> Spec para generar la versión Excel del AS-IS (datos cuantitativos para análisis interactivo).

---

## Cuándo Producir XLSX

- Cuando `{FORMATO}=xlsx` o el usuario necesita datos manipulables
- Complementa el Markdown/HTML principal — no lo reemplaza
- Útil para: filtrar deuda técnica, priorizar riesgos, comparar sistemas

## Estructura de Hojas

### Hoja 1: Executive Dashboard
| Columna | Tipo | Descripción |
|---|---|---|
| Métrica | Text | Nombre de la métrica |
| Valor | Number | Valor actual |
| Benchmark | Number | Valor de referencia de industria |
| Delta | Formula | Valor - Benchmark |
| Semáforo | Conditional | 🟢 si Delta ≥ 0, 🟡 si Delta > -20%, 🔴 si Delta ≤ -20% |

### Hoja 2: Technology Inventory (S1)
| Columna | Tipo | Descripción |
|---|---|---|
| Component | Text | Nombre del componente/librería |
| Version | Text | Versión actual |
| Latest Version | Text | Última versión disponible |
| Version Currency | Formula | (Current - Latest) en major versions |
| EOL Status | Enum | Active / Maintenance / Deprecated / EOL |
| EOL Date | Date | Fecha de fin de vida (si conocida) |
| Layer | Enum | Backend / Frontend / Data / Infrastructure / Dev |
| License | Text | MIT, Apache, GPL, Commercial, etc. |
| Risk Level | Conditional | Basado en EOL Status + Version Currency |

### Hoja 3: Code Quality Metrics (S4)
| Columna | Tipo | Descripción |
|---|---|---|
| Module | Text | Nombre del módulo/paquete |
| LOC | Number | Líneas de código |
| Cyclomatic Complexity (avg) | Number | Promedio por módulo |
| Cyclomatic Complexity (p95) | Number | Percentil 95 |
| Duplication % | Percentage | Porcentaje de código duplicado |
| Test Coverage % | Percentage | Cobertura de tests |
| Afferent Coupling (Ca) | Number | Dependientes entrantes |
| Efferent Coupling (Ce) | Number | Dependencias salientes |
| Instability Index | Formula | Ce / (Ca + Ce) |
| Code Smells | Number | Cantidad de code smells detectados |
| Risk Level | Conditional | Basado en CC + Coverage + Instability |

### Hoja 4: Technical Debt Inventory (S5)
| Columna | Tipo | Descripción |
|---|---|---|
| ID | Auto | TD-001, TD-002... |
| Description | Text | Descripción del item de deuda |
| Category | Enum | Design / Code / Test / Build / Doc / Infra / Dependency |
| Fowler Quadrant | Enum | Deliberate-Prudent / Deliberate-Reckless / Inadvertent-Prudent / Inadvertent-Reckless |
| Technical Impact | Enum (1-5) | 1=Minimal, 5=Critical |
| Business Impact | Enum (1-5) | 1=Minimal, 5=Critical |
| Remediation Effort | Number | Engineering-days estimados |
| Priority Score | Formula | (Tech Impact × Business Impact) / Remediation Effort |
| Status | Enum | Identified / Acknowledged / In Progress / Resolved |
| Location | Text | File/module reference |
| Evidence Tag | Enum | [CÓDIGO] / [CONFIG] / [DOC] / [INFERENCIA] |

Filtros sugeridos: por Category, por Priority Score (desc), por Business Impact.

### Hoja 5: NFR Heatmap (S6)
| Columna | Tipo | Descripción |
|---|---|---|
| NFR Dimension | Text | Performance, Security, Maintainability, etc. |
| Current Score (1-10) | Number | Evaluación actual |
| Target Score (1-10) | Number | Objetivo |
| Gap | Formula | Target - Current |
| Evidence | Text | Resumen de evidencia |
| Priority | Conditional | Basado en Gap × Business Criticality |

### Hoja 6: Security Findings (S7)
| Columna | Tipo | Descripción |
|---|---|---|
| ID | Auto | SEC-001, SEC-002... |
| Finding | Text | Descripción de la vulnerabilidad |
| OWASP Category | Enum | A01-A10 |
| CVSS Score | Number | 0.0-10.0 |
| Severity | Conditional | Critical / High / Medium / Low (basado en CVSS) |
| Affected Component | Text | Componente afectado |
| Remediation | Text | Recomendación de remediación |
| Effort | Number | Engineering-days |
| SLA | Conditional | 48h / 7d / 30d / 90d (basado en severity) |

### Hoja 7: Risk Register (S9)
| Columna | Tipo | Descripción |
|---|---|---|
| ID | Auto | RISK-001, RISK-002... |
| Risk | Text | Descripción del riesgo |
| Category | Enum | Technical / Operational / Security / Organizational / External |
| Probability (1-5) | Number | 1=Rare, 5=Almost certain |
| Impact (1-5) | Number | 1=Insignificant, 5=Catastrophic |
| Risk Score | Formula | Probability × Impact |
| Current Mitigations | Text | Mitigaciones existentes |
| Recommended Improvements | Text | Mejoras propuestas |
| Owner | Text | Responsable |
| Status | Enum | Open / Mitigated / Accepted / Closed |
| Trend | Enum | ↑ Growing / → Stable / ↓ Shrinking |

### Hoja 8: Recommendations (S10)
| Columna | Tipo | Descripción |
|---|---|---|
| ID | Auto | REC-001, REC-002... |
| Recommendation | Text | Descripción |
| Type | Enum | Quick Win / Short-term / Medium-term / Long-term |
| Effort | Number | Engineering-days |
| Impact | Enum (1-5) | 1=Low, 5=Transformational |
| Evidence Source | Text | Secciones S0-S9 que lo sustentan |
| Dependencies | Text | Otras recomendaciones que deben completarse antes |
| Priority | Formula | Impact / Effort (higher = better ROI) |

## Reglas de Formato

| Elemento | Especificación |
|---|---|
| **Header row** | Background #1A1A2E, font white, bold |
| **Conditional formatting** | 🔴 Critical/High, 🟡 Medium, 🟢 Low (usar #22D3EE para success, NO verde) |
| **Freeze panes** | Row 1 (headers) + Column A (IDs) frozen |
| **Auto-filter** | Enabled on all columns |
| **Column width** | Auto-fit with max 50 chars |
| **Number format** | 1 decimal for scores, 0 decimals for counts |

## Producción

Como Claude Code no genera .xlsx directamente, el output es:
1. Tablas markdown con los datos de cada hoja
2. Esta spec para que el equipo de delivery use una plantilla Excel de MetodologIA
3. Opcionalmente: CSV por hoja para importación directa

---

**Autor:** Javier Montaño | **Última actualización:** 12 de marzo de 2026
