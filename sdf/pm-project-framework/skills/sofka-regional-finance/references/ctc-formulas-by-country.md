# CTC Formulas by Country — Detailed Reference

## Purpose

Complete Cost-to-Company (CTC) calculation formulas for IT services employees across the 5 target countries. Includes payroll factor breakdowns, worked examples, and hourly rate conversion methodology.

---

## Colombia (COP)

### Formula (15 components)
```
Base Salary (monthly)
+ Health (employer: 8.5% of salary)
+ Pension (employer: 12% of salary)
+ ARL (risk level: 0.522% for office IT work, Level I)
+ Caja de Compensacion (4%)
+ SENA (2%) [if applicable — exempt if salary > 10 SMLMV]
+ ICBF (3%) [if applicable — exempt if salary > 10 SMLMV]
+ Prima de Servicios (1 salary/year = 8.33%/month)
+ Cesantias (1 salary/year = 8.33%/month)
+ Intereses sobre Cesantias (12% of cesantias = 1%/month)
+ Vacaciones (15 days/year = 4.17%/month)
+ Dotacion (if salary < 2 SMLMV, ~COP 130,000/quarter)
+ Tools/Equipment allocation (laptop, licenses: ~COP 300,000-500,000/month amortized)
+ Office/Infrastructure allocation (~COP 200,000-400,000/month)
+ Training/Certification budget (~COP 150,000-300,000/month)
= TOTAL CTC per month
```

**Payroll factor (legal charges only)**: ~49.7% over base salary for salaries > 10 SMLMV (no SENA/ICBF). For salaries < 10 SMLMV: ~54.7%.

### Worked Example (Senior developer)
```
Base Salary = COP 6,000,000/month (below 10 SMLMV → includes SENA/ICBF)
Payroll factor = 54.7% -> Legal charges = COP 3,282,000
Non-salary allocations = COP 650,000
CTC = COP 9,932,000/month
Productive hours = 165/month
Internal Cost Rate = COP 60,194/hour
```

### Transfer Pricing
- **Regulation**: Estatuto Tributario Art. 260-1 a 260-11, Decree 3030, OECD aligned
- **Documentation**: Master File + Local File mandatory for intercompany transactions
- **Methods**: CUP, Cost-Plus, TNMM, Resale Price, Profit Split
- **Filing**: Informativa de precios de transferencia (Form 120) annually
- **Penalties**: Up to 20,000 UVT for non-compliance (~COP 900M)
- **Safe harbor**: Servicios de bajo valor anadido (OECD Par. 7.45): Cost-Plus 5-10% is strongly defensible

---

## Ecuador (USD)

### Formula
```
Base Salary (monthly, USD)
+ IESS Employer (11.15% of salary)
+ XIII Sueldo / Decimo Tercero (1 salary/year = 8.33%/month)
+ XIV Sueldo / Decimo Cuarto (1 SBU/year, prorated monthly: ~USD 38/month at SBU USD 460)
+ Fondos de Reserva (8.33% after first year of employment)
+ Vacaciones (15 days/year = 4.17%/month)
+ Utilidades provision (15% profit sharing, allocated per-employee)
+ Tools/Equipment allocation (laptop, licenses: ~USD 80-120/month amortized)
+ Office/Infrastructure allocation (~USD 50-100/month)
= TOTAL CTC per month (USD)
```

**Payroll factor**: ~32% over base salary.

### Worked Example (Senior developer)
```
Base Salary = USD 2,500/month
IESS = USD 279
XIII Sueldo = USD 208
XIV Sueldo = USD 38
Fondos Reserva = USD 208
Vacaciones = USD 104
Non-salary = USD 180
CTC = USD 3,517/month
Productive hours = 160/month
Internal Cost Rate = USD 21.98/hour
```

### Intercompany with Colombia — Key Mechanics
- Ecuador entity bills in USD, Colombia entity operates in COP
- Revenue recognition based on actual hours worked per month (not staffing model)
- Rate variability: billable amount varies monthly (e.g., 160h Jan, 144h Feb due to holidays)
- Tariff structure: rates may change by volume of resources per profile/seniority
- CTC association: Ecuador associates CTC per record for gross margin visibility
- Transfer pricing: must comply with both OECD and local SRI requirements
- FX treatment: COP-USD conversion at transaction date rate per NIC 21

---

## Mexico (MXN)

### Formula
```
Base Salary (monthly, MXN)
+ IMSS Employer (~25-30% of salary, varies by salary bracket)
  - Riesgo de Trabajo: ~1.1%
  - Enfermedades y Maternidad: ~17.3%
  - Invalidez y Vida: ~1.75%
  - Cesantia en Edad Avanzada y Vejez: ~3.15%
  - Guarderia: 1%
+ SAR/Afore (2% of salary)
+ Infonavit (5% of salary)
+ Aguinaldo (15 days/year minimum = ~4.1%/month)
+ Prima Vacacional (25% of vacation days salary)
+ PTU provision (10% profit sharing allocated per-employee)
+ Tools/Equipment allocation
+ Office/Infrastructure allocation
= TOTAL CTC per month (MXN)
```

**Payroll factor**: ~35-40% over base salary.

### Transfer Pricing
- **Regulation**: Ley del ISR Art. 76, 179-184
- **Documentation**: Master File + Local File + Country-by-Country reporting
- **Methods**: Same OECD methods
- **Note**: Maquiladora rules not applicable for IT services

---

## United States (USD)

### Formula
```
Base Salary (annual, USD) / 12
+ FICA Employer (7.65%: Social Security 6.2% + Medicare 1.45%)
  - Social Security cap: $168,600 (2024), verify annually
+ FUTA (~0.6% on first $7,000 of wages)
+ SUTA (state-specific, 0.5-5.4% on first $7,000-$56,000)
+ Health Insurance (employer contribution: ~USD 500-1,200/month per employee)
+ 401(k) Match (if applicable: typically 3-6% of salary)
+ PTO / Vacation accrual (typically 10-20 days/year, ~4-8%/month)
+ Workers Compensation (~0.5-1% for office IT)
+ Tools/Equipment allocation
= TOTAL CTC per month (USD)
```

**Payroll factor**: ~25-35% over base salary (varies significantly by benefits package and state).

### Transfer Pricing
- **Regulation**: IRC Section 482
- **Methods**: CUP, Cost-Plus, CPM, TNMM, Profit Split, Resale Price
- **Documentation**: Contemporaneous documentation required (penalty protection)
- **APA**: Advance Pricing Agreements available for certainty
- **Penalties**: 20-40% penalty on underpayment from transfer pricing adjustments

---

## Spain (EUR)

### Formula
```
Base Salary (monthly, EUR)
+ Seguridad Social Employer (~30% of salary)
  - Contingencias Comunes: ~23.6%
  - Desempleo: ~5.5%
  - FOGASA: 0.2%
  - Formacion Profesional: 0.6%
+ Pagas Extra (typically 2 extra months/year = 16.67%/month)
  NOTE: Some contracts prorate into 12 payments instead of 14
+ Vacaciones (22+ working days/year, ~8.5%/month accrual)
+ Indemnizacion provision (33 days/year for unfair dismissal)
+ Tools/Equipment allocation
+ Office/Infrastructure allocation
= TOTAL CTC per month (EUR)
```

**Payroll factor**: ~35-40% over base salary.

### EU VAT Implications
- **Reverse Charge**: B2B services between EU member states — supplier charges 0% VAT; buyer self-assesses
- **MOSS/OSS**: Not typically applicable for B2B IT services
- **Intra-community reporting**: EC Sales List (Modelo 349) quarterly

---

## CTC to Hourly Rate Conversion (All Countries)

```
Monthly CTC / Productive Hours per Month
Productive Hours = Standard Hours - Vacations - Holidays - Sick Leave - Training
```

| Country | Standard Hours/Month | Typical Productive | Holiday Days/Year |
|---------|---------------------|-------------------|-------------------|
| Colombia | 192 (48h/week) | 160-170 | ~18 public holidays |
| Ecuador | 160 (40h/week) | 148-158 | ~12 public holidays |
| Mexico | 192 (48h/week, reducing) | 155-165 | ~7 mandatory + state |
| United States | 173 (40h/week) | 155-165 | No federal mandate |
| Spain | 160 (40h/week) | 140-152 | ~14 public holidays |
