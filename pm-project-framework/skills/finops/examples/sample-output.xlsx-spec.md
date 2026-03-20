# Excel Specification — FinOps Cost Data

> Especificacion para la generacion de archivo Excel con datos de costos cloud.
> Usar cuando `{FORMATO}=xlsx` o como complemento al reporte markdown/html.

---

## Estructura del Workbook

| # | Sheet | Proposito | Filas Esperadas |
|---|-------|----------|----------------|
| 1 | Cost Breakdown | Desglose de costos por servicio, equipo, entorno | 50-200 |
| 2 | Waste Inventory | Inventario de recursos desperdiciados | 20-100 |
| 3 | Optimization Opportunities | Oportunidades con ROI y prioridad | 10-30 |
| 4 | Unit Economics | Metricas de costo por unidad de negocio (historico) | 6-24 (meses) |
| 5 | Reservation Coverage | Cobertura de compromisos (RI/SP/CUD) | 10-50 |
| 6 | Summary Dashboard | KPIs resumen para vista ejecutiva | 1 (fila de datos) |

---

## Sheet 1: Cost Breakdown

### Columnas

| Col | Header | Tipo | Formato | Descripcion |
|-----|--------|------|---------|-------------|
| A | service | Text | — | Nombre del servicio cloud (e.g., EC2, RDS, S3) |
| B | category | Text | — | Categoria: Compute, Storage, Database, Network, Analytics, Other |
| C | team | Text | — | Equipo responsable (del tag `team`) |
| D | environment | Text | — | prod, staging, dev, sandbox |
| E | account_id | Text | — | ID de cuenta cloud |
| F | monthly_cost_low | Number | $#,##0 | Rango bajo del costo mensual |
| G | monthly_cost_high | Number | $#,##0 | Rango alto del costo mensual |
| H | pct_of_total | Percentage | 0.0% | Porcentaje del gasto total |
| I | trend_6m | Text | — | Estable, +X%, -X% |
| J | tagged | Boolean | Yes/No | Si el recurso tiene tags completos |
| K | notes | Text | — | Observaciones |

### Conditional Formatting

| Regla | Rango | Formato |
|-------|-------|---------|
| pct_of_total > 15% | H:H | Bold + fill amarillo (#22D3EE) |
| tagged = "No" | J:J | Fill rojo claro (#FFCDD2) |
| trend_6m contiene "+" y valor > 20% | I:I | Font rojo (#DC2626) |

---

## Sheet 2: Waste Inventory

### Columnas

| Col | Header | Tipo | Formato | Descripcion |
|-----|--------|------|---------|-------------|
| A | resource_id | Text | — | ARN o ID del recurso |
| B | resource_type | Text | — | EC2, RDS, EBS, EIP, ALB, etc. |
| C | waste_category | Text | — | oversized, idle, unattached, zombie, over-provisioned, misconfigured |
| D | team | Text | — | Equipo responsable |
| E | environment | Text | — | prod, staging, dev, sandbox |
| F | monthly_waste_low | Number | $#,##0 | Rango bajo del waste mensual |
| G | monthly_waste_high | Number | $#,##0 | Rango alto del waste mensual |
| H | remediation_action | Text | — | Accion correctiva recomendada |
| I | effort | Text | — | Low, Medium, High |
| J | risk | Text | — | Low, Medium, High |
| K | confidence | Text | — | Alta, Media, Baja |
| L | evidence_tag | Text | — | [CONFIG], [INFERENCIA], [DOC] |

### Conditional Formatting

| Regla | Rango | Formato |
|-------|-------|---------|
| monthly_waste_high > $5,000 | G:G | Bold + fill amarillo (#22D3EE) |
| risk = "High" | J:J | Fill rojo claro (#FFCDD2) |
| effort = "Low" AND risk = "Low" | I:J | Fill verde claro (#C8E6C9) — quick win indicator |

---

## Sheet 3: Optimization Opportunities

### Columnas

| Col | Header | Tipo | Formato | Descripcion |
|-----|--------|------|---------|-------------|
| A | id | Number | — | Numero secuencial |
| B | tier | Text | — | Quick Win, Medium-term, Strategic |
| C | opportunity | Text | — | Descripcion de la oportunidad |
| D | monthly_savings_low | Number | $#,##0 | Rango bajo del ahorro mensual |
| E | monthly_savings_high | Number | $#,##0 | Rango alto del ahorro mensual |
| F | annual_savings_low | Number | $#,##0 | =D*12 |
| G | annual_savings_high | Number | $#,##0 | =E*12 |
| H | implementation_effort | Text | — | Dias estimados |
| I | risk_level | Text | — | Low, Medium, High |
| J | roi_timeline | Text | — | Inmediato, 1-2 meses, 3-6 meses, 6-12 meses |
| K | owner | Text | — | Equipo/persona responsable |
| L | status | Text | — | Not Started, In Progress, Completed, Deferred |

### Conditional Formatting

| Regla | Rango | Formato |
|-------|-------|---------|
| tier = "Quick Win" | B:B | Fill amarillo (#22D3EE) |
| tier = "Strategic" | B:B | Fill azul claro (#BBDEFB) |
| status = "Completed" | L:L | Fill verde claro + strikethrough |
| annual_savings_high > $50,000 | G:G | Bold + fill amarillo (#22D3EE) |

---

## Sheet 4: Unit Economics

### Columnas

| Col | Header | Tipo | Formato | Descripcion |
|-----|--------|------|---------|-------------|
| A | month | Date | MMM YYYY | Mes del dato |
| B | total_cloud_cost | Number | $#,##0 | Gasto cloud total del mes |
| C | total_transactions | Number | #,##0 | Transacciones totales |
| D | cost_per_transaction | Number | $#,##0.0000 | B/C |
| E | active_users | Number | #,##0 | Usuarios activos mensuales |
| F | cost_per_user | Number | $#,##0.00 | B/E |
| G | total_api_calls | Number | #,##0 | API calls totales |
| H | cost_per_api_call | Number | $#,##0.000000 | B/G |
| I | gb_processed | Number | #,##0 | GB procesados |
| J | cost_per_gb | Number | $#,##0.00 | B/I |
| K | revenue | Number | $#,##0 | Revenue del mes (si disponible) |
| L | infra_pct_revenue | Percentage | 0.0% | B/K |

### Conditional Formatting

| Regla | Rango | Formato |
|-------|-------|---------|
| cost_per_transaction crece >10% vs mes anterior | D:D | Font rojo (#DC2626) |
| infra_pct_revenue > 10% | L:L | Fill rojo claro (#FFCDD2) |

### Charts Recomendados

- **Line chart:** cost_per_transaction y cost_per_user over time (dual axis)
- **Bar chart:** total_cloud_cost por mes con overlay de active_users

---

## Sheet 5: Reservation Coverage

### Columnas

| Col | Header | Tipo | Formato | Descripcion |
|-----|--------|------|---------|-------------|
| A | commitment_id | Text | — | ID de la reserva o savings plan |
| B | type | Text | — | RI, Savings Plan, CUD, Spot |
| C | instance_family | Text | — | m5, r6g, c6i, etc. (o "Compute" para SP) |
| D | region | Text | — | us-east-1, eu-west-1, etc. |
| E | term | Text | — | 1yr, 3yr |
| F | payment_option | Text | — | No Upfront, Partial Upfront, All Upfront |
| G | monthly_commitment | Number | $#,##0 | Costo mensual del compromiso |
| H | monthly_on_demand_equivalent | Number | $#,##0 | Lo que costaria on-demand |
| I | savings_pct | Percentage | 0% | (H-G)/H |
| J | utilization_pct | Percentage | 0% | Utilizacion del compromiso |
| K | expiry_date | Date | YYYY-MM-DD | Fecha de expiracion |
| L | status | Text | — | Active, Expiring Soon (<90d), Expired |

### Conditional Formatting

| Regla | Rango | Formato |
|-------|-------|---------|
| utilization_pct < 70% | J:J | Fill rojo claro (#FFCDD2) |
| status = "Expiring Soon" | L:L | Fill amarillo (#22D3EE) |
| savings_pct > 30% | I:I | Bold |

---

## Sheet 6: Summary Dashboard

### Layout

| Celda | KPI | Formato |
|-------|-----|---------|
| B2 | Total Monthly Cloud Spend (rango) | $#,##0 |
| B4 | Monthly Waste Identified (rango) | $#,##0 |
| B6 | Waste as % of Total | 0% |
| B8 | FinOps Maturity Score | 0.0/5.0 |
| D2 | Quick Win Savings Potential (rango) | $#,##0 |
| D4 | Total Optimization Potential (rango) | $#,##0 |
| D6 | Commitment Coverage | 0% |
| D8 | Cost per Transaction | $0.0000 |
| F2 | Untagged Spend % | 0% |
| F4 | Non-prod Cost % | 0% |
| F6 | Infrastructure % of Revenue | 0% |
| F8 | YoY Cost Trend | +0% |

### Conditional Formatting (Dashboard)

| KPI | Green (#C8E6C9) | Yellow (#22D3EE) | Red (#FFCDD2) |
|-----|----------------|-----------------|---------------|
| Waste % | <15% | 15-30% | >30% |
| Maturity Score | >3.5 | 2.0-3.5 | <2.0 |
| Commitment Coverage | >55% | 35-55% | <35% |
| Untagged Spend | <5% | 5-15% | >15% |
| Infra % Revenue | <8% | 8-12% | >12% |

---

## Notas de Implementacion

1. **Magnitudes, no precios exactos:** Las columnas `_low` y `_high` reflejan rangos. NUNCA incluir precios exactos negociados.
2. **Disclaimers obligatorios:** Incluir en el footer de cada sheet: "Cifras expresadas en magnitudes estimadas. No representan valores contractuales."
3. **Proteccion:** Sheet "Summary Dashboard" protegido (solo lectura). Sheets de datos editables.
4. **Actualizacion:** Diseno pensado para actualizacion mensual. Las formulas de Unit Economics se auto-calculan al agregar filas.

---

**Autor:** Javier Montaño | **Última actualización:** 13 de marzo de 2026
