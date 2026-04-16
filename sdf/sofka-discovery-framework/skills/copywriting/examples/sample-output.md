# Ejemplo: Copywriting Aplicado a Pitch Ejecutivo

> Extracto realista de un pitch ejecutivo para un cliente ficticio (RetailCo) que opera una plataforma e-commerce legacy con problemas de escalabilidad y time-to-market.

---

## Resumen Ejecutivo — RetailCo Discovery

**TL;DR**

- La plataforma actual consume **15 FTE-meses/trimestre** en mantenimiento reactivo, dejando solo el 20% de capacidad para innovación `[CÓDIGO]` `[CONFIG]`
- El time-to-market de nuevas funcionalidades es **12 semanas** — 3x el benchmark del sector (4 semanas) `[DOC]` `[INFERENCIA]`
- Cada trimestre sin actuar acumula **8 FTE-meses adicionales** de deuda técnica, alcanzando el punto de no retorno en **Q1 2027** `[INFERENCIA]`
- Recomendamos el **Escenario B (Modernización Incremental)**: captura el primer quick win en 8 semanas con riesgo controlado
- **Siguiente paso:** Aprobar Sprint 0 esta semana para iniciar en Q2 2026

---

### El Problema: Una Plataforma que Frena al Negocio

RetailCo opera una plataforma e-commerce monolítica desplegada hace 7 años. Lo que fue una ventaja competitiva es hoy un lastre operativo.

**Los datos son contundentes:**

| Métrica | Valor Actual | Benchmark Sector | Brecha |
|---------|-------------|-----------------|--------|
| Time-to-market (nueva feature) | 12 semanas | 4 semanas | 3x más lento `[DOC]` |
| Cobertura de tests automatizados | 18% | 80% (mínimo viable) | -62 pp `[CÓDIGO]` |
| Incidentes críticos / mes | 4.2 | < 1 | 4x más frecuente `[CONFIG]` |
| MTTR (tiempo medio de resolución) | 6.5 horas | 1 hora (Elite DORA) | 6.5x más lento `[DOC]` |
| Deploys por semana | 0.5 | 7+ (Elite DORA) | 14x menos frecuente `[CONFIG]` |

El equipo técnico dedica el **80% de su capacidad** a mantener el sistema funcionando. Solo el **20% restante** — equivalente a 3 FTE — está disponible para innovación. En un mercado donde los competidores lanzan funcionalidades cada semana, RetailCo lanza cada tres meses. `[CÓDIGO]` `[STAKEHOLDER]`

### Lo Que Cuesta No Actuar

El costo de inacción no es hipotético — es acumulativo y medible.

**Proyección trimestral del costo de inacción:**

| Trimestre | Deuda Técnica Acumulada | FTE-meses en Mantenimiento | Capacidad para Innovación |
|-----------|------------------------|---------------------------|--------------------------|
| Q2 2026 (actual) | Baseline | 15 FTE-meses/trim | 20% |
| Q3 2026 | +8 FTE-meses | 18 FTE-meses/trim | 12% |
| Q4 2026 | +16 FTE-meses | 21 FTE-meses/trim | 5% |
| **Q1 2027** | **+24 FTE-meses** | **23 FTE-meses/trim** | **~0%** |

En **Q1 2027**, toda la capacidad del equipo se consumirá en mantenimiento. Cero innovación. A partir de ese punto, el costo de remediación supera al costo de reemplazo total. `[INFERENCIA]`

**Dicho de otra forma:** cada semana de demora no es neutral — añade 2.7 FTE-meses de deuda técnica que alguien tendrá que pagar.

### Tres Caminos, Una Recomendación

Presentamos tres escenarios evaluados por el comité de expertos en 6 dimensiones (impacto, viabilidad, riesgo, costo, velocidad, sostenibilidad):

| Dimensión | A: Optimización Puntual | B: Modernización Incremental | C: Reemplazo Total |
|-----------|------------------------|-----------------------------|--------------------|
| **Impacto en TTM** | -20% (de 12 a 9.6 sem) | -67% (de 12 a 4 sem) | -75% (de 12 a 3 sem) |
| **Riesgo de ejecución** | 🟢 Bajo | 🟡 Medio-bajo | 🔴 Alto |
| **Tiempo al primer quick win** | 4 semanas | 8 semanas | 24 semanas |
| **FTE-meses inversión (año 1)** | 12 FTE-meses | 36 FTE-meses | 72 FTE-meses |
| **Reducción de deuda técnica** | -15% | -70% | -95% |
| **Sostenibilidad a 3 años** | 🔴 Insuficiente | 🟢 Alta | 🟢 Alta |

#### Recomendamos el Escenario B: Modernización Incremental

**¿Por qué B y no A?** El Escenario A es insuficiente. Reduce síntomas pero no ataca la causa. En 12 meses, RetailCo estará en la misma posición con mayor deuda acumulada. `[INFERENCIA]`

**¿Por qué B y no C?** El Escenario C ofrece el mejor resultado final pero requiere 6 meses antes del primer resultado visible y 72 FTE-meses de inversión. El Escenario B entrega el **80% del impacto con el 50% del costo** y permite validar la dirección antes de comprometer todo el presupuesto. `[INFERENCIA]`

**El Escenario B en una frase:** Modernizar incrementalmente extrayendo los 4 dominios críticos del monolito, empezando por el catálogo de productos (dominio con mayor acoplamiento y mayor impacto en TTM). `[CÓDIGO]`

### Propuesta de Valor — Escenario B

> **Reducir el time-to-market de 12 a 4 semanas en 9 meses**, liberando 10 FTE-meses/trimestre que hoy se consumen en mantenimiento reactivo, y posicionando a RetailCo para competir en velocidad de innovación por primera vez en 3 años.

**Quick wins en los primeros 90 días:**

1. **Semana 8**: API gateway desplegado — desacopla frontend del monolito `[CÓDIGO]`
2. **Semana 10**: Servicio de catálogo extraído — primer microservicio en producción
3. **Semana 12**: Pipeline CI/CD para el nuevo servicio — deploys diarios habilitados

### Siguiente Paso

Aprobar el Escenario B esta semana permite iniciar el Sprint 0 en la primera semana de Q2 2026.

**Sprint 0 (2 semanas) incluye:**
- Taller de alineación técnica con el equipo core (8 personas)
- Definición de bounded contexts con DDD
- Setup del pipeline CI/CD base
- Primer ADR (Architecture Decision Record) documentado

**Si no se actúa:** En Q3, el costo de mantener el monolito sube a 18 FTE-meses/trimestre. La ventana para modernización incremental se estrecha. En Q1 2027, el único camino viable será el reemplazo total (Escenario C) — con el doble de costo y riesgo.

---

### Notas de Evidencia

| Tag | Cantidad | Cobertura |
|-----|---------|----------|
| `[CÓDIGO]` | 5 referencias | Análisis estático de 1,247 archivos |
| `[CONFIG]` | 3 referencias | Pipelines CI/CD, infra-as-code |
| `[DOC]` | 3 referencias | Documentación interna, métricas DORA |
| `[STAKEHOLDER]` | 1 referencia | Entrevista con Tech Lead |
| `[INFERENCIA]` | 5 referencias | Proyecciones basadas en tendencia 6 meses |
| `[SUPUESTO]` | 0 | — |

**Cobertura total de evidencia:** 100% de claims tagueados. 0 muletillas detectadas. Calibración: audiencia mixta (CEO + CTO).

---

*Ejemplo de referencia — MetodologIA Discovery Framework, skill: copywriting*
*© Comunidad MetodologIA. Todos los derechos reservados.*
