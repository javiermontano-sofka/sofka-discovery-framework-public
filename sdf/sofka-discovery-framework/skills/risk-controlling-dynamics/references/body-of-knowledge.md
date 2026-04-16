# Body of Knowledge — Risk & Controlling Dynamics

> **Autor:** Javier Montaño | **Fecha:** 13 de marzo de 2026
> **© Comunidad MetodologIA** — Todos los derechos reservados

---

## TL;DR

- PMBOK Risk Management provee la estructura formal del risk register, la matriz probabilidad/impacto, y el ciclo de vida del riesgo.
- ISO 31000 establece los principios universales de gestión de riesgos y el framework de apetito/tolerancia.
- COSO ERM Framework integra riesgo con estrategia y performance, alineando el controlling con objetivos de negocio.
- Thinking in Bets (Annie Duke) aporta la disciplina de separar calidad de decisión de calidad de resultado.
- Black Swan (Taleb) fundamenta la humildad epistémica: los riesgos que no ves son los que te destruyen.

---

## 1. PMBOK Guide — Risk Management (PMI, 7th Edition, 2021)

### Relevancia para el Skill

PMBOK proporciona el framework estándar de la industria para gestión de riesgos en proyectos. Las secciones S4 (Risk Register) y S2 (Per-Phase Risk Scanning) se fundamentan directamente en los procesos de PMBOK.

### Conceptos Clave Aplicados

| Concepto | Aplicación en risk-controlling-dynamics |
|---|---|
| **Plan Risk Management** | S1: Risk Appetite & Tolerance Framework — definir las reglas del juego antes de jugar |
| **Identify Risks** | S2: Per-Phase Risk Scanning — preguntas incómodas en cada fase del pipeline |
| **Qualitative Risk Analysis** | S4: Risk Register con Probabilidad × Impacto = Exposure |
| **Quantitative Risk Analysis** | S6: Financial Controls — Monte Carlo, Cone of Uncertainty, magnitude drift |
| **Plan Risk Responses** | S7: Proposal Hardening — mitigaciones, cláusulas de escape, kill criteria |
| **Monitor Risks** | Modo operacional `vigilancia` — risk register como organismo vivo |
| **Risk Categories (RBS)** | 8 categorías: técnico, organizacional, vendor, timeline, financial, regulatorio, gobernanza, reputacional |
| **Risk Triggers** | Señales tempranas en el pre-mortem (S5) — indicadores de materialización |
| **Risk Owner** | Cada riesgo tiene owner con autoridad para mitigar y deadline para actuar |
| **Residual Risk** | Riesgo remanente después de aplicar mitigación — documentado honestamente |

### Procesos del PMBOK Mapeados

```
PMBOK Process          → Sección del Skill
────────────────────────────────────────────
Plan Risk Management   → S1 (Appetite Framework)
Identify Risks         → S2 (Per-Phase Scanning)
Qualitative Analysis   → S4 (Risk Register)
Quantitative Analysis  → S6 (Financial Controls)
Plan Risk Responses    → S4 (Mitigaciones) + S7 (Hardening)
Implement Responses    → Cross-referencia con pipeline-governance
Monitor Risks          → Modo vigilancia
```

### Referencia Bibliográfica

- Project Management Institute. (2021). *A Guide to the Project Management Body of Knowledge (PMBOK Guide)* (7th ed.). PMI.
- Project Management Institute. (2019). *The Standard for Risk Management in Portfolios, Programs, and Projects*. PMI.
- Hillson, D. (2009). *Managing Risk in Projects*. Gower Publishing.

---

## 2. ISO 31000:2018 — Risk Management Guidelines

### Relevancia para el Skill

ISO 31000 provee los principios fundamentales que sustentan el framework de apetito y tolerancia de riesgo (S1). A diferencia de PMBOK que es project-specific, ISO 31000 es universal — aplicable a cualquier tipo de riesgo en cualquier contexto.

### Conceptos Clave Aplicados

| Concepto ISO 31000 | Aplicación en risk-controlling-dynamics |
|---|---|
| **Principio: Integrado** | El controller opera transversalmente en TODAS las fases del pipeline |
| **Principio: Estructurado y exhaustivo** | 7 secciones con scanning sistemático por fase |
| **Principio: Inclusivo** | Múltiples perspectivas (48 skills monitoreados, comité de expertos) |
| **Principio: Dinámico** | Risk register como organismo vivo, actualización continua |
| **Principio: Basado en mejor información disponible** | Evidence tags en todas las aserciones de riesgo |
| **Principio: Factores humanos y culturales** | Riesgos organizacionales, change resistance, sesgo de confirmación |
| **Risk Appetite** | S1: Cuánto riesgo está dispuesta a aceptar la organización |
| **Risk Tolerance** | S1: Variación aceptable alrededor del apetito |
| **Risk Criteria** | S1: Umbrales inaceptables que activan STOP |
| **Risk Treatment** | Evitar, reducir, transferir, aceptar — taxonomía de respuestas |

### Framework ISO 31000 Adaptado

```
Contexto Externo          Contexto Interno
(Industria, regulación)   (Capacidades, cultura)
        ↓                        ↓
    ┌──────────────────────────────┐
    │   RISK APPETITE FRAMEWORK    │  ← S1
    │   (Apetito, Tolerancia,     │
    │    Umbrales Inaceptables)   │
    └──────────────────────────────┘
                ↓
    ┌──────────────────────────────┐
    │   RISK ASSESSMENT            │
    │   Identificar → S2           │
    │   Analizar → S3, S4          │
    │   Evaluar → S5               │
    └──────────────────────────────┘
                ↓
    ┌──────────────────────────────┐
    │   RISK TREATMENT             │
    │   Financial Controls → S6    │
    │   Proposal Hardening → S7    │
    └──────────────────────────────┘
                ↓
         MONITOREO CONTINUO
         (Modo vigilancia)
```

### Referencia Bibliográfica

- International Organization for Standardization. (2018). *ISO 31000:2018 Risk Management — Guidelines*. ISO.
- International Organization for Standardization. (2019). *IEC 31010:2019 Risk Management — Risk Assessment Techniques*. ISO/IEC.

---

## 3. COSO ERM Framework (2017)

### Relevancia para el Skill

COSO Enterprise Risk Management integra riesgo con estrategia y performance. Mientras ISO 31000 es genérico y PMBOK es project-focused, COSO conecta el riesgo con los objetivos de negocio — esencial para S6 (Financial Controls) y S7 (Proposal Hardening).

### Conceptos Clave Aplicados

| Concepto COSO | Aplicación en risk-controlling-dynamics |
|---|---|
| **Risk in Strategy and Objective-Setting** | El controlling evalúa si la estrategia de discovery alinea con el apetito de riesgo |
| **Performance Integration** | S6: Financial Controls conecta riesgos con impacto en magnitudes y presupuesto |
| **Risk Appetite Statement** | S1: Declaración formal por dimensión (técnico, timeline, costo, calidad, reputacional) |
| **Severity Assessment** | S4: Exposure = Probabilidad × Impacto con categorización 🔴🟠🟡🟢 |
| **Pursuing Risk** | No todo riesgo es malo — innovación requiere aceptar cierto nivel de riesgo |
| **Risk Culture** | La "paranoia productiva" como cultura del controller — preocuparse es profesional |
| **Governance and Culture** | Steering committee, escalation paths, decision logs |
| **Review and Revision** | Risk register actualizado en cada gate y cada hallazgo nuevo |

### Componentes COSO Mapeados

1. **Governance & Culture** → Steering committee, risk culture documentation
2. **Strategy & Objective-Setting** → S1 Risk Appetite calibrado al engagement
3. **Performance** → S4 Risk Register + S6 Financial Controls
4. **Review & Revision** → Modo vigilancia + gate evaluations
5. **Information, Communication & Reporting** → S7 Proposal Hardening + disclosures

### Referencia Bibliográfica

- Committee of Sponsoring Organizations of the Treadway Commission. (2017). *Enterprise Risk Management — Integrating with Strategy and Performance*. AICPA.
- Moeller, R. R. (2011). *COSO Enterprise Risk Management* (2nd ed.). Wiley.

---

## 4. Thinking in Bets — Annie Duke (2018)

### Relevancia para el Skill

Duke aporta la disciplina cognitiva que separa "buena decisión" de "buen resultado". Un PoC que fracasó puede haber tenido una planificación excelente (buena decisión, mal resultado por factores externos). Y un PoC exitoso puede haber tenido mala planificación (mala decisión, buen resultado por suerte). El controller debe evaluar la CALIDAD de las decisiones, no solo sus resultados.

### Conceptos Clave Aplicados

| Concepto | Aplicación en risk-controlling-dynamics |
|---|---|
| **Resulting** | No juzgar la calidad del plan por el resultado del PoC — evaluar proceso |
| **Decision Quality vs Outcome Quality** | S3: Evaluar supuestos por la calidad de la evidencia, no por intuición |
| **Calibration** | S3: Niveles de confianza 0-100% deben ser honestos — 70% confianza significa que 30% de las veces estará mal |
| **Pre-mortem** | S5: Técnica directamente adoptada de Duke — imaginar el fracaso antes de que ocurra |
| **Backcasting** | Generar roadmaps "hacia atrás" desde el éxito deseado |
| **Outcome Fielding** | Clasificar resultados: ¿fue skill o suerte? ¿decisión o circunstancia? |
| **Truth-Seeking Groups** | Comité de expertos con diversidad de perspectiva — el controller cuestiona el consenso |
| **Bet Sizing** | Gate criteria como sizing de apuesta — cuánto invertir antes de validar |
| **10-10-10 Rule** | Evaluar impacto del riesgo en 10 minutos, 10 meses, 10 años |

### Aplicación Práctica

```
Antes de cada gate, el controller pregunta:

1. "¿Esta decisión es buena independientemente del resultado?"
   → Evalúa proceso, no outcome

2. "¿Con qué nivel de confianza hacemos esta afirmación?"
   → Calibración honesta — el 60% real es mejor que el 90% falso

3. "Si esto sale mal, ¿fue mala suerte o mala decisión?"
   → Separar lo controlable de lo no controlable

4. "¿Cuánto apostaríamos de nuestro propio dinero a que esto funciona?"
   → Skin in the game test para supuestos
```

### Referencia Bibliográfica

- Duke, A. (2018). *Thinking in Bets: Making Smarter Decisions When You Don't Have All the Facts*. Portfolio/Penguin.
- Duke, A. (2020). *How to Decide: Simple Tools for Making Better Choices*. Portfolio/Penguin.

---

## 5. The Black Swan — Nassim Nicholas Taleb (2007)

### Relevancia para el Skill

Taleb fundamenta la humildad epistémica del controller: los riesgos más destructivos son los que NO aparecen en el risk register porque son impensables. El Black Swan no es el riesgo que subestimamos — es el riesgo que ni siquiera consideramos.

### Conceptos Clave Aplicados

| Concepto | Aplicación en risk-controlling-dynamics |
|---|---|
| **Black Swan Events** | S5: Pre-mortem explora "lo impensable" — ¿qué destruiría el proyecto que nadie considera? |
| **Narrative Fallacy** | S3: Los supuestos a menudo se aceptan porque encajan en una narrativa conveniente |
| **Ludic Fallacy** | S6: Las estimaciones financieras asumen distribuciones normales — la realidad tiene fat tails |
| **Antifragility** | S7: La propuesta no solo debe sobrevivir shocks, sino beneficiarse de la incertidumbre |
| **Barbell Strategy** | Trade-off: 80% conservador (riesgos conocidos bien mitigados) + 20% exploración (aceptar lo desconocido) |
| **Skin in the Game** | Gates con go/no-go reales — si no estás dispuesto a arriesgar algo, el gate no es serio |
| **Via Negativa** | Eliminar riesgos es más poderoso que agregar mitigaciones — menos es más |
| **Epistemological Humility** | "No sabemos lo que no sabemos" — documentar los límites del risk assessment |

### Principios Operativos Derivados

1. **No confiar en el risk register como exhaustivo.** Los riesgos documentados son los conocidos. Los peligrosos son los no documentados.
2. **Preferir robustez a optimización.** Un plan robusto sobrevive lo inesperado; un plan optimizado se rompe ante cualquier desviación.
3. **Mantener opcionalidad.** Gates con go/no-go son opciones — permiten cambiar de dirección con costo limitado.
4. **Desconfiar de la precisión.** Un rango honesto (40-60%) es más útil que un punto exacto falso (52.3%).
5. **Buscar lo que falta.** La pregunta más valiosa no es "¿qué riesgos tenemos?" sino "¿qué riesgos NO estamos viendo?"

### Referencia Bibliográfica

- Taleb, N. N. (2007). *The Black Swan: The Impact of the Highly Improbable*. Random House.
- Taleb, N. N. (2012). *Antifragile: Things That Gain from Disorder*. Random House.
- Taleb, N. N. (2018). *Skin in the Game: Hidden Asymmetries in Daily Life*. Random House.

---

## Fuentes Complementarias

| Fuente | Aporte Específico |
|---|---|
| Hubbard, D. W. (2009). *The Failure of Risk Management* | Crítica a métodos cualitativos de riesgo — aboga por cuantificación real |
| Kahneman, D. (2011). *Thinking, Fast and Slow* | Sesgos cognitivos que afectan la evaluación de riesgos (optimism bias, anchoring) |
| Meadows, D. H. (2008). *Thinking in Systems* | Riesgos sistémicos, feedback loops, leverage points |
| Spetzler, C. et al. (2016). *Decision Quality* | Framework para evaluar la calidad de decisiones bajo incertidumbre |
| Flyvbjerg, B. (2021). *How Big Things Get Done* | Reference class forecasting — por qué los megaproyectos siempre exceden presupuesto |
| Klein, G. (2007). *The Power of Intuition* | Pre-mortem como técnica de prospective hindsight |
| Bernstein, P. L. (1996). *Against the Gods: The Remarkable Story of Risk* | Historia y filosofía de la gestión de riesgos |

---

## Mapeo Body of Knowledge → Secciones del Skill

| Sección del Skill | Fuente Principal | Fuentes Complementarias |
|---|---|---|
| S1: Risk Appetite & Tolerance | ISO 31000, COSO ERM | Taleb (Barbell Strategy) |
| S2: Per-Phase Risk Scanning | PMBOK (Identify Risks) | Kahneman (Sesgos), Meadows (Sistemas) |
| S3: Assumption Stress-Testing | Annie Duke (Calibration) | Hubbard (Cuantificación), Spetzler (Decision Quality) |
| S4: Risk Register | PMBOK (Risk Register) | ISO 31000 (Treatment), COSO (Severity) |
| S5: Worst-Case / Pre-Mortem | Annie Duke (Pre-mortem) | Taleb (Black Swan), Klein (Prospective Hindsight) |
| S6: Financial Controls | COSO ERM (Performance) | Flyvbjerg (Reference Class), Taleb (Fat Tails) |
| S7: Proposal Hardening | PMBOK (Response Planning) | Taleb (Antifragility), Duke (Decision Quality) |
