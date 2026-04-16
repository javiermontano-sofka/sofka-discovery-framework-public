# Eval Result — analisis-horizontal-financiero

## Test Prompt

> "Tengo el P&L de una empresa IT Services (staff augmentation) para 2023 vs 2024. Revenue 2023: COP 50,000M, Revenue 2024: COP 55,000M. Cost of Sales 2023: COP 35,000M, 2024: COP 40,000M. La empresa opera en CO y EC con facturación cross-border."

## Evaluation Date: 2026-03-20

---

## Criteria Evaluation

### 1. 10-Section Report Template — PASS

**Evidence**: SKILL.md lines 93-206 define the exact 10-section template marked as "Template Obligatorio" with the note "el formato es inviolable." The structure is explicit:

1. Resumen Ejecutivo
2. Datos Generales del Análisis
3. Tabla de Análisis Horizontal
4. Top 10 Variaciones Materiales
5. Análisis por Bloques Funcionales
6. Indicadores Clave Derivados
7. Alertas y Banderas Rojas
8. Oportunidades Identificadas
9. Recomendaciones Estratégicas
10. Notas Metodológicas

Quality Criteria #1 (line 382) reinforces: "All 10 report sections present in every output, regardless of financial statement type." The validation checklist in `metodologia-paso-a-paso.md` (line 382) also checks this: "Las 10 secciones del informe están presentes."

**Verdict**: The skill unambiguously requires the full 10-section structure. An LLM following this skill would produce all 10 sections.

---

### 2. Horizontal Variation Calculations (Absolute, Relative) — PASS

**Evidence**: SKILL.md lines 69-76 define the formulas explicitly:

- `Variacion Absoluta = Periodo Comparacion - Periodo Base`
- `Variacion Relativa (%) = (Variacion Absoluta / |Periodo Base|) x 100`
- Zero-division cases handled (Nueva partida, Partida eliminada, Sin movimiento)

`metodologia-paso-a-paso.md` Section 4 (lines 136-173) elaborates further with Step 4.1 (primary calculations), Step 4.2 (participation calculations), and Step 4.3 (automatic signal assignment with color-coded thresholds).

For this test case, the skill would produce:
- Revenue: Var. Absoluta = +COP 5,000M, Var. % = +10.0%
- Cost of Sales: Var. Absoluta = +COP 5,000M, Var. % = +14.3%
- Gross Profit: 2023 = COP 15,000M, 2024 = COP 15,000M, Var. Absoluta = COP 0, Var. % = 0%

**Verdict**: Formulas are complete, edge cases documented, and methodology reference adds depth. Sufficient for correct calculation.

---

### 3. IT Services Benchmarks (Gross Margin 25-45%, EBITDA 12-22%) — PASS

**Evidence**: SKILL.md lines 251-286 contain a dedicated section "Benchmarks Sectoriales — IT Services / Servicios Profesionales" with:

| Indicador | Rango Saludable | Senal de Alerta |
|-----------|----------------|-----------------|
| Margen Bruto | 25-45% | < 20% o > 50% |
| Margen EBITDA | 12-22% | < 8% |
| Margen Neto | 8-15% | < 5% |
| Costo de Personal / Revenue | 55-75% | > 80% |

The skill also includes a "Typical Cost Structure" breakdown (lines 266-277) and "Key Sector Drivers" (lines 279-285), specifically mentioning headcount vs revenue dynamics, seniority mix, utilization, FX, and client concentration.

Quality Criteria #4 (line 385): "IT Services benchmarks applied when analyzing staffing/professional services companies."

**Verdict**: Benchmarks are explicit, tabulated, and tied to quality criteria. The test prompt mentions "IT Services (staff augmentation)" which directly triggers this section.

---

### 4. Gross Margin Drop Detection (30% to 27.3%) — PASS

**Evidence**: For the test data:
- Gross Margin 2023 = 15,000/50,000 = 30.0%
- Gross Margin 2024 = 15,000/55,000 = 27.3%
- Drop = 2.7 percentage points

The skill provides multiple mechanisms to flag this:

1. **Benchmark range**: 25-45% healthy range (SKILL.md line 257). At 27.3%, the margin is still within range but approaching the lower bound — the skill instructs to contextualize against benchmarks.

2. **Yellow Alert threshold**: `metodologia-paso-a-paso.md` line 315: "Margen bruto cae > 3 puntos porcentuales" triggers a yellow alert. At 2.7pp drop, it is just below the 3pp threshold, but the cost of sales growing faster than revenue (+14.3% vs +10.0%) would trigger the separate alert at line 317: "Gastos operacionales crecen mas rapido que ingresos."

3. **Signal system**: The automatic signaling in Step 4.3 (methodology lines 159-173) would flag the cost of sales line as unfavorable with the appropriate signal.

4. **Anti-Pattern #4** (SKILL.md line 394): "Don't just explain favorable variations. The Alerts section exists to surface uncomfortable truths." This pushes the analysis to flag the margin erosion even if technically below exact thresholds.

**Minor gap**: The 3pp yellow-alert threshold would not auto-trigger at 2.7pp. However, the combination of benchmark proximity, anti-pattern #4, and the cost-vs-revenue growth differential provides enough guidance for an LLM to flag this deterioration. The skill could benefit from an explicit "approaching threshold" rule (e.g., within 1pp of alert threshold = early warning).

**Verdict**: PASS with a minor observation. The skill has sufficient overlapping mechanisms to ensure this gets flagged, though an explicit "approaching threshold" rule would strengthen it.

---

### 5. FX Isolation for Multi-Entity Analysis — PASS

**Evidence**: SKILL.md lines 289-318 contain a full section "Analisis Multi-Entidad y Consolidacion" with:

- **FX isolation formula** (lines 296-303):
  ```
  Variacion Total = Variacion Organica + Efecto FX
  Efecto FX = (Monto Periodo Comp. en moneda local) x (Tasa Periodo Comp. - Tasa Periodo Base)
  ```
- **Intercompany eliminations** guidance (lines 308-313)
- **NIC 21 treatment** for horizontal analysis (lines 315-318)
- **HENKA-specific context** in `references/henka-financial-context.md` (lines 1-10): "Company Code CO opera en COP; Company Code EC opera en USD. Consolidacion en COP como moneda de grupo."

Quality Criteria #5 (line 386): "Multi-entity analysis isolates organic growth from FX effect."

Anti-Pattern #2 (line 392): "Ignoring FX effects in multi-currency entities — Reporting 'revenue grew 15%' when 10% is FX and 5% is organic misleads management."

The test prompt says "opera en CO y EC con facturacion cross-border," which directly activates these sections.

**Verdict**: Comprehensive FX isolation guidance with formulas, anti-patterns, and project-specific context. Fully sufficient.

---

### 6. Anti-Patterns Guidance — PASS

**Evidence**: SKILL.md lines 389-395 define 4 explicit anti-patterns:

1. **Generic recommendations disconnected from data** — Every recommendation must trace to a specific finding.
2. **Ignoring FX effects in multi-currency entities** — Always decompose organic vs FX.
3. **Treating all variations as equally important** — "A 200% increase on a COP 1M line matters less than a 3% decrease on a COP 500M line." Materiality thresholds must filter.
4. **Happy-path analysis only** — Alerts section must surface uncomfortable truths.

Anti-Pattern #3 is directly relevant to this test case: Cost of Sales absolute variation (+COP 5,000M) equals Revenue absolute variation (+COP 5,000M), but the relative variation differs (14.3% vs 10.0%). The materiality index from `metodologia-paso-a-paso.md` (line 183) would properly weight these.

Additionally, the methodology's "Recomendaciones a evitar" section (lines 357-362) reinforces anti-pattern #1 with specific examples of generic recommendations to avoid.

**Verdict**: Anti-patterns are well-defined, actionable, and directly applicable to the test scenario.

---

### 7. Quality Criteria Section — PASS

**Evidence**: SKILL.md lines 380-387 contain an explicit "Quality Criteria" section with 6 numbered criteria:

1. All 10 report sections present in every output
2. Variations calculated with correct formulas (absolute, relative, zero-division handling)
3. Top 10 material variations each include driver, classification, and managerial interpretation
4. IT Services benchmarks applied when analyzing staffing/professional services companies
5. Multi-entity analysis isolates organic growth from FX effect
6. Recommendations are derived from findings (not generic advice)

These are complemented by the validation checklist in `metodologia-paso-a-paso.md` Section 9 (lines 366-392) which provides a detailed 16-item checklist across 4 categories: numerical integrity, narrative coherence, completeness, and formatting.

**Verdict**: Quality criteria are explicit, measurable, and cross-referenced with the validation methodology.

---

## Overall Assessment: PASS (7/7 criteria met)

The skill provides comprehensive, well-structured guidance sufficient to handle the test prompt. The 10-section template, calculation formulas, IT Services benchmarks, multi-entity FX isolation, anti-patterns, and quality criteria are all explicitly documented and cross-referenced between `SKILL.md` and the three reference files.

The skill's layered architecture works well:
- `SKILL.md` provides the overall framework, template, benchmarks, and quality gates
- `metodologia-paso-a-paso.md` provides the detailed step-by-step process and formulas
- `henka-financial-context.md` provides project-specific financial context
- `plantilla-excel-spec.md` provides the Excel output specification

## Gaps Identified

### Gap 1: "Approaching Threshold" Early Warning (Severity: Low)

The yellow alert for gross margin triggers at >3pp drop. In the test case, the 2.7pp drop would technically not trigger the automatic yellow alert, even though it is material and trending toward the alert zone. The skill compensates through overlapping mechanisms (benchmark proximity, anti-pattern #4, cost-growing-faster-than-revenue), but an explicit "early warning" tier (e.g., "within 1pp of threshold = monitor") would eliminate reliance on LLM judgment.

**Recommendation**: Add a "Pre-Alert" tier in `metodologia-paso-a-paso.md` Section 7.1 for when indicators are within 80% of alert thresholds.

### Gap 2: Incomplete Data Handling (Severity: Low)

The test prompt provides only Revenue and Cost of Sales — no OpEx, no financial items, no taxes. The skill's Step 2.2 (validation of sufficiency) says to request missing data before proceeding, but does not provide explicit guidance on how to produce a partial report when the user clearly has limited data and expects an analysis. Should the skill produce all 10 sections with "Insufficient data" markers, or should it reduce scope?

**Recommendation**: Add a "Partial Data Protocol" that defines which sections can be populated with available data and which should be explicitly marked as "Not calculable — data required: [list]."

### Gap 3: No Explicit Worked Example (Severity: Low)

The skill provides formulas, templates, and benchmarks, but no worked example showing a complete mini-analysis. Including one (even 3-4 line items) would reduce variance in LLM output quality and serve as a calibration anchor.

**Recommendation**: Add a "Worked Example" appendix in the references folder showing the complete flow for a simplified P&L.
