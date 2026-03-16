# State of the Art: cost-estimation

> Tendencias 2024-2026 en estimacion de esfuerzo y costeo de proyectos de software.

---

## TL;DR

- La estimacion puntual esta muerta — el futuro es probabilistico y continuo.
- La IA asiste en sizing y deteccion de patrones, pero el juicio humano sigue siendo irreemplazable para drivers contextuales.
- FinOps integra el costo de cloud como driver de primera clase en la estimacion.
- El movimiento No-Estimates tiene merito en contextos especificos, pero no reemplaza la estimacion estructurada en proyectos enterprise.

---

## 1. AI-Assisted Estimation

**Estado**: Adopcion temprana (2024-2026)

La IA generativa y los modelos de codigo (GitHub Copilot, Amazon Q Developer, Cursor) estan cambiando la ecuacion de productividad, lo que impacta directamente en el sizing de esfuerzo.

**Impacto en estimacion:**
- Tareas de codigo rutinario se completan 30-55% mas rapido con asistencia de IA (fuente: GitHub Research 2024).
- Esto NO reduce el esfuerzo total proporcionalmente — la complejidad se desplaza a revision, testing, integracion y arquitectura.
- El sizing debe ajustar factores de productividad para tareas "asistibles por IA" vs tareas de juicio humano.
- Los cost drivers de licenciamiento de herramientas IA se convierten en una nueva categoria.

**Implicacion para el skill:** Incluir un multiplicador de productividad IA en COCOMO-like models. Documentar que herramientas IA se asumen disponibles y cuales son restricciones del cliente.

## 2. Continuous Estimation (Not One-Shot)

**Estado**: Practica emergente consolidada

La estimacion "big bang" al inicio del proyecto esta siendo reemplazada por re-estimacion continua en cada phase gate, alineada con el Cone of Uncertainty.

**Practicas clave:**
- **Re-estimation triggers**: cambio de scope >10%, cambio de equipo, cambio tecnologico, materializacion de riesgo.
- **Living estimates**: documentos de estimacion versionados que evolucionan con el proyecto.
- **Estimation retrospectives**: comparar estimado vs real en cada iteracion para calibrar el modelo.
- **Dual-track estimation**: el equipo de delivery re-estima en paralelo al equipo de presales, creando un check cruzado.

**Implicacion para el skill:** S7 (Governance) define triggers de re-estimacion. El output no es un documento estatico — es un baseline que se actualiza.

## 3. Probabilistic Estimation (Ranges, Not Points)

**Estado**: Practica madura en organizaciones avanzadas

La estimacion probabilistica ha pasado de ser "nice to have" a ser el estandar esperado por stakeholders informados.

**Evolucion:**
- **2020**: "El proyecto dura 12 meses" (punto unico — inaceptable).
- **2023**: "El proyecto dura 10-14 meses" (rango simple — minimo aceptable).
- **2025**: "P50: 11 meses, P80: 13 meses, P95: 16 meses" (distribucion — estandar profesional).

**Herramientas:**
- Monte Carlo via Crystal Ball, @RISK, o scripts Python/R dedicados.
- Integracion con Jira/Azure DevOps para alimentar tres-point estimates desde datos historicos.
- Visualizacion de distribuciones de probabilidad en dashboards de proyecto.

**Implicacion para el skill:** S5 usa Monte Carlo como metodo primario. Los outputs son siempre percentiles, nunca puntos.

## 4. Cloud Cost as Estimation Component (FinOps Integration)

**Estado**: Rapida adopcion (2024-2026)

Con la migracion masiva a cloud, el costo de infraestructura ya no es un CAPEX fijo sino un OPEX variable que debe estimarse como driver de primera clase.

**Tendencias FinOps:**
- **Unit economics**: costo por transaccion, por usuario, por request — no solo costo mensual total.
- **Right-sizing proactivo**: estimacion de recursos cloud desde la fase de arquitectura, no post-deployment.
- **Committed use discounts**: reservas de 1-3 anos como decision de estimacion, no solo de operaciones.
- **Multi-cloud cost modeling**: comparacion de TCO entre providers como parte del analisis de escenarios.
- **GreenOps**: costo de carbono como driver emergente en organizaciones con compromisos ESG.

**Implicacion para el skill:** S4 (Cost Driver Taxonomy) incluye infraestructura cloud como categoria con sub-drivers: compute, storage, networking, egress, managed services, licenciamiento SaaS.

## 5. Story Point Alternatives (Cycle Time, Throughput)

**Estado**: Debate activo, adopcion creciente

Los story points estan siendo cuestionados como unidad de estimacion por su subjetividad y falta de comparabilidad entre equipos.

**Alternativas emergentes:**
- **Cycle time**: tiempo medido desde que un item entra en progreso hasta que se completa. Dato objetivo, no estimado.
- **Throughput**: items completados por unidad de tiempo. Permite forecasting probabilistico via simulacion.
- **T-shirt sizing simplificado**: S/M/L sin pretension de precision numerica — util para roadmaps de alto nivel.
- **Elapsed days por tipo de trabajo**: clasificar items por tipo (feature, bug, spike, debt) y usar historicos de duracion por tipo.

**Implicacion para el skill:** S2 usa T-shirt sizing y story points como metodos complementarios, pero calibrados contra throughput real. La velocity se trata como dato historico del equipo, nunca como benchmark transferible.

## 6. No-Estimate Movement and When It Works

**Estado**: Nicho consolidado con limites claros

El movimiento #NoEstimates, popularizado por Vasco Duarte y Woody Zuill, propone que en ciertos contextos la estimacion formal destruye valor.

**Cuando funciona:**
- Equipos estables con historico de throughput medible.
- Items de trabajo razonablemente homogeneos en tamano.
- Cadencia de delivery predecible (flow metrics maduras).
- El cliente acepta forecasting basado en throughput en lugar de estimaciones de esfuerzo.

**Cuando NO funciona:**
- Proyectos enterprise con contratos fijos y penalidades.
- Equipos nuevos sin historico.
- Scope altamente variable o desconocido.
- Stakeholders que requieren compromiso presupuestario formal.
- Contexto de presales donde la estimacion es parte de la propuesta comercial.

**Implicacion para el skill:** El skill reconoce No-Estimates como valido en contextos especificos, pero opera bajo la premisa de que el contexto de presales enterprise REQUIERE estimacion estructurada. La estimacion no es burocracia — es comunicacion de incertidumbre.

---

## Matriz de Madurez en Estimacion

| Nivel | Practica | Indicador |
|-------|----------|-----------|
| 1 - Ad hoc | Estimacion por "experiencia" sin metodo | Varianza >100% entre estimado y real |
| 2 - Repetible | Un metodo consistente (e.g., analogia) | Varianza 50-100% |
| 3 - Definido | Triangulacion de metodos, rangos explicitos | Varianza 25-50% |
| 4 - Gestionado | Monte Carlo, calibracion continua, re-estimacion | Varianza 10-25% |
| 5 - Optimizado | AI-assisted, throughput-based forecasting, feedback loops | Varianza <10% |

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026
