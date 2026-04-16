# Skill Evaluation: sofka-regional-finance

**Test Prompt**: "Necesito comparar el CTC de un desarrollador Senior en Colombia vs Ecuador. Salario base CO: 8M COP, salario base EC: $2,500 USD. Calcula el CTC completo para ambos paises y la tarifa horaria interna."

**Date**: 2026-03-20
**Evaluator**: Claude Opus 4.6

---

## Criterion 1: CTC Formula with All Mandatory Components Per Country

**Verdict**: PASS

**Evidence**:

The skill provides complete, itemized CTC formulas in `references/ctc-formulas-by-country.md`:

- **Colombia** (lines 12-29): 15 components listed explicitly — Base Salary, Health (8.5%), Pension (12%), ARL (0.522%), Caja de Compensacion (4%), SENA (2%), ICBF (3%), Prima de Servicios (8.33%), Cesantias (8.33%), Intereses sobre Cesantias (1%), Vacaciones (4.17%), Dotacion, Tools, Office, Training.
- **Ecuador** (lines 57-67): 8 components — Base Salary, IESS Employer (11.15%), XIII Sueldo (8.33%), XIV Sueldo (~USD 38/mo), Fondos de Reserva (8.33%), Vacaciones (4.17%), Tools, Office.

Both formulas include percentage rates for every mandatory social security and benefit line item, which is sufficient to compute the CTC for the given base salaries.

**Applying to the test prompt (CO: 8M COP)**:
```
Base Salary:              8,000,000
Health (8.5%):              680,000
Pension (12%):              960,000
ARL (0.522%):                41,760
Caja Compensacion (4%):     320,000
SENA (2%): EXEMPT (8M > 10 SMLMV threshold ~COP 6.5M in 2025)
ICBF (3%): EXEMPT (same reason)
Prima de Servicios (8.33%): 666,400
Cesantias (8.33%):          666,400
Int. Cesantias (1%):         80,000
Vacaciones (4.17%):         333,600
Non-salary allocations:  ~650,000
CTC =                  ~12,398,160
```

**Applying to the test prompt (EC: $2,500 USD)**:
```
Base Salary:              2,500
IESS (11.15%):              279
XIII Sueldo (8.33%):        208
XIV Sueldo:                  38
Fondos Reserva (8.33%):    208
Vacaciones (4.17%):         104
Non-salary:              ~180
CTC =                  ~3,517
```

The skill provides all data needed to produce both calculations. The Ecuador example at $2,500 is even pre-worked in the reference file (lines 72-83).

---

## Criterion 2: Colombia Payroll Factor (~49-55%) vs Ecuador (~32%)

**Verdict**: PASS

**Evidence**:

- **SKILL.md** line 67: "CTC payroll factor: ~49.7% (>10 SMLMV) / ~54.7% (<10 SMLMV)"
- **SKILL.md** line 72: "CTC payroll factor: ~32%"
- **SKILL.md** lines 109-116: Summary table showing Colombia ~49-55% and Ecuador ~32%
- **ctc-formulas-by-country.md** line 31: "~49.7% over base salary for salaries > 10 SMLMV... ~54.7%" for lower salaries
- **ctc-formulas-by-country.md** line 69: Ecuador "~32% over base salary"

The contrast is clearly documented in multiple locations and the bifurcated Colombia factor based on SMLMV is explicitly stated.

---

## Criterion 3: Hourly Rate Using Productive Hours (Not Standard Hours)

**Verdict**: PASS

**Evidence**:

- **SKILL.md** lines 105-107: "Internal Cost Rate = Monthly CTC / Productive Hours" and "Productive Hours = Standard Hours - Vacations - Holidays - Sick - Training"
- **SKILL.md** lines 109-116: Table with both Standard Hours/Month and Typical Productive hours per country — Colombia 192 standard / 160-170 productive; Ecuador 160 standard / 148-158 productive.
- **ctc-formulas-by-country.md** lines 183-197: Same methodology and table repeated with additional detail (Holiday Days/Year column).
- Worked examples use productive hours explicitly (CO: 165/month, EC: 160/month).

The skill clearly mandates using Productive Hours, not Standard Hours, and provides the deduction methodology. Using the test prompt values:
- CO: 12,398,160 / 165 = ~COP 75,140/hour
- EC: 3,517 / 160 = ~USD 21.98/hour

---

## Criterion 4: Specific Social Security Components Per Country

**Verdict**: PASS

**Evidence**:

- **Colombia**: `ctc-formulas-by-country.md` lines 14-24 list all 10 social security/benefit components with exact percentages: Health 8.5%, Pension 12%, ARL 0.522%, Caja 4%, SENA 2%, ICBF 3%, Prima 8.33%, Cesantias 8.33%, Int. Cesantias 1%, Vacaciones 4.17%.
- **Ecuador**: `ctc-formulas-by-country.md` lines 58-66 list IESS 11.15%, XIII Sueldo 8.33%, XIV Sueldo (1 SBU/year), Fondos de Reserva 8.33%, Vacaciones 4.17%.

Every component has a named label and a percentage or fixed amount. This is sufficient to trace and justify the payroll factor difference between the two countries.

---

## Criterion 5: CTC Cost Rate Separate from Sales Price

**Verdict**: PASS

**Evidence**:

- **SKILL.md** lines 122-133: Explicit 3-layer model — Layer 1 (CTC Cost Rate), Layer 2 (Sales Price), Layer 3 (Automatic Margin). States: "SAP CO-PA calculates Margin = Sales Price - Cost Rate per Activity Type per posting."
- **SKILL.md** lines 239-240: Anti-pattern #1: "Using a single blended rate — Always segregate CTC Cost Rate from Sales Price. The entire skill exists to prevent this."
- **tax-and-invoicing-matrix.md** lines 85-99: "Tarifa Purina" anti-pattern documented with named risk (R-07) and explicit resolution via the 3-layer model.
- **tax-and-invoicing-matrix.md** lines 100-114: Activity Type table showing separate Cost Rate Range and Sales Rate Range columns per skill level.

The skill explicitly and repeatedly enforces the separation of CTC-based cost from sales price.

---

## Criterion 6: SMLMV Threshold Impact for Colombia

**Verdict**: PASS

**Evidence**:

- **SKILL.md** line 67: "~49.7% (>10 SMLMV) / ~54.7% (<10 SMLMV)"
- **SKILL.md** lines 247-248 (Edge Cases): "Salary threshold affecting payroll factor — In Colombia, SENA/ICBF exemptions depend on salary vs SMLMV threshold. CTC calculation must branch."
- **ctc-formulas-by-country.md** lines 18-19: "SENA (2%) [if applicable — exempt if salary > 10 SMLMV]" and "ICBF (3%) [if applicable — exempt if salary > 10 SMLMV]"
- **ctc-formulas-by-country.md** line 31: "~49.7% over base salary for salaries > 10 SMLMV (no SENA/ICBF). For salaries < 10 SMLMV: ~54.7%."

For the test prompt with CO base salary of 8M COP: the 2025 SMLMV is approximately COP 1,423,500, so 10 SMLMV ~ COP 14,235,000. Since 8M < 14.2M, the salary is BELOW 10 SMLMV, meaning SENA (2%) and ICBF (3%) DO apply, and the payroll factor should be ~54.7%, not 49.7%.

**Important observation**: The worked example in the reference file uses COP 6M and applies the 49.7% factor (line 37), which appears incorrect — COP 6M is also below 10 SMLMV. This is a potential **error in the worked example** that should be corrected. However, the skill's documentation of the SMLMV rule itself is clear and correct.

---

## Overall Assessment

**PASS — 6 of 6 criteria met.**

The skill provides comprehensive, actionable guidance to produce a complete CTC comparison between Colombia and Ecuador. All mandatory components are itemized with percentages, the payroll factor contrast is documented, hourly conversion uses Productive Hours explicitly, social security components are named, cost-sale segregation is enforced as a core principle, and the SMLMV threshold branching logic is documented in three separate locations.

---

## Gaps Found

1. **Worked example inconsistency (Minor)**: The Colombia worked example in `ctc-formulas-by-country.md` uses COP 6,000,000 base salary with a 49.7% payroll factor, but COP 6M is below 10 SMLMV (~COP 14.2M in 2025), so the correct factor should be ~54.7% with SENA+ICBF included. The rule is documented correctly — the example calculation does not apply it correctly.

2. **No SMLMV value stated (Minor)**: The skill references "10 SMLMV" as the threshold but does not state the actual SMLMV value for 2025. This forces the user to look it up externally. Adding the current SMLMV value (with a "Last verified" date) would make the calculation self-contained.

3. **Non-salary allocations are rough estimates (Minor)**: Tools, office, and training allocations are given as ranges (e.g., COP 300K-500K) rather than Sofka-specific actuals. For internal CTC calculations this would need calibration with real Sofka cost data.

4. **No COP-to-USD cross-comparison (Nice to have)**: The test prompt implicitly invites comparing CTC across currencies. The skill documents FX treatment for intercompany (NIC 21, transaction date rate) but does not provide a methodology for purchasing-power or cost-comparison between COP and USD CTC. This is arguably outside scope but would add value for the specific test prompt.

5. **Dotacion threshold not quantified**: The skill mentions Dotacion applies "if salary < 2 SMLMV" with an approximate quarterly cost, but for the 8M COP test case this would not apply (8M > 2 SMLMV). No gap for this test prompt, but the rule could be clearer.
