# Análisis de Métricas — Modernización Plataforma Core RetailCo

> **Contexto**: Evaluación AS-IS de la plataforma core de RetailCo, empresa de retail con 120 tiendas y operación e-commerce. Monolito Java de 8 años, equipo de 35 desarrolladores. Datos recolectados durante discovery de 3 semanas.

---

## TL;DR

- La plataforma tiene **deuda técnica equivalente a 54 FTE-meses** (equipo de 9 personas dedicado exclusivamente durante 6 meses) concentrada en 3 de 8 módulos [CÓDIGO]
- Las métricas DORA ubican al equipo en el **percentil 15** del benchmark — la brecha más crítica es deployment frequency (1/mes vs. referencia elite de múltiples/día) [CÓDIGO][CONFIG]
- De las **6 dimensiones evaluadas, 2 están en rojo** y comparten causa raíz: acoplamiento entre el módulo de autenticación y el core de inventario [CÓDIGO]
- El escenario de modernización proyecta **reducción de 65% en time-to-market** en 4 fases, con quick wins visibles en Fase 1 (Q2) [INFERENCIA]

---

## 1. Scoring Matrix — Evaluación Arquitectónica 6D

### Matriz de Resultados

| Dimensión | Score | Nivel | Evidencia |
|-----------|-------|-------|-----------|
| Mantenibilidad | 42% | Rojo | Complejidad ciclomática promedio 38, 3 módulos >60 [CÓDIGO] |
| Escalabilidad | 55% | Amarillo | Escala vertical funciona hasta 2x carga actual [CONFIG] |
| Seguridad | 78% | Amarillo | OWASP Top 10 cubierto excepto A03 y A07 [CÓDIGO] |
| Observabilidad | 35% | Rojo | Sin tracing distribuido, logs no estructurados [CONFIG] |
| Testeabilidad | 71% | Amarillo | 71% cobertura global, pero módulo de pagos al 23% [CÓDIGO] |
| Disponibilidad | 82% | Verde | 99.2% uptime últimos 12 meses [DOC] |

> **Criterio semáforo**: Verde >80% | Amarillo 50-80% | Rojo <50%

### Narrativa Interpretativa

**El patrón dominante no son los scores individuales, sino lo que revelan en conjunto.** De las 6 dimensiones evaluadas, las 2 en rojo (mantenibilidad y observabilidad) comparten una causa raíz: el monolito no fue diseñado para ser instrumentado ni modularizado. No es negligencia del equipo — es una decisión arquitectónica de 2018 que era razonable en su momento pero que ahora genera fricción en todas las dimensiones [INFERENCIA].

**La anomalía positiva es disponibilidad (82%, verde).** Sorprende dado el estado de mantenibilidad y observabilidad. La explicación: el equipo ha desarrollado expertise operacional compensatoria — conocen el sistema tan bien que resuelven incidentes por intuición, no por instrumentación [STAKEHOLDER]. Esto es simultáneamente una fortaleza (el equipo es excelente) y un riesgo (conocimiento tácito no documentado, bus factor de 3 personas).

**Las 3 dimensiones en amarillo (escalabilidad, seguridad, testeabilidad) comparten una característica**: son funcionales hoy pero no soportan el crecimiento proyectado de 3x en transacciones para 2027 [DOC]. Escalabilidad topa su límite a 2x; seguridad necesita cubrir 2 gaps OWASP antes de la regulación de pagos digitales de Q4; testeabilidad tiene un agujero crítico exactamente en pagos (23% cobertura en el módulo de mayor riesgo) [CÓDIGO].

**Conexión a acción:** Los 2 rojos se abordan con el Escenario B (Strangler Fig) en Fase 1 (Q2). Los 3 amarillos mejoran orgánicamente con la nueva arquitectura: la modularización habilita tracing, la separación de concerns mejora testeabilidad, y el desacoplamiento permite escalar por servicio. → Ver 05_Escenarios § Escenario B para detalle.

---

## 2. Métricas DORA — Before/After

### Estado Actual vs. Benchmark

| Métrica DORA | RetailCo Actual | Benchmark Elite | Brecha | Interpretación |
|-------------|----------------|----------------|--------|---------------|
| Deployment Frequency | 1/mes | Múltiples/día | 30x | Proceso manual, miedo al cambio, sin pipeline automatizado [CONFIG] |
| Lead Time for Changes | 45 días | <1 día | 45x | Cola de espera + QA manual + ventanas de deploy mensuales [STAKEHOLDER] |
| Change Failure Rate | 18% | <5% | 3.6x | 1 de cada 5 deploys causa incidente — rollback manual [DOC] |
| MTTR | 4 horas | <1 hora | 4x | Sin observabilidad, diagnóstico depende de 3 personas clave [STAKEHOLDER] |

### Narrativa de Métricas DORA

**RetailCo opera en el percentil 15 del benchmark DORA**, equivalente al cluster "low performer" del State of DevOps Report 2024 [DOC]. Pero el número solo no cuenta la historia completa.

**La brecha más reveladora es deployment frequency (30x).** No es que el equipo no quiera desplegar más frecuentemente — es que **no puede**. El monolito requiere deploy completo (45 minutos de build, 20 minutos de smoke tests manuales, ventana de mantenimiento nocturna). Cada deploy es un evento de riesgo que involucra a 4 personas durante 3 horas [STAKEHOLDER]. Con una change failure rate del 18%, la aversión al deploy es una respuesta racional, no un problema cultural.

**El lead time de 45 días tiene un componente oculto**: solo 5 días son desarrollo real. Los otros 40 son cola de espera (15 días), QA manual (10 días), coordinación de deploy (8 días) y buffer "por si acaso" (7 días) [STAKEHOLDER]. Esto significa que **el 89% del lead time es desperdicio sistémico**, no trabajo productivo.

**El MTTR de 4 horas parece tolerable hasta que se descompone**: 2.5 horas son diagnóstico (sin tracing, sin logs estructurados, dependencia de memoria humana) y 1.5 horas son resolución [STAKEHOLDER]. Con observabilidad adecuada, el diagnóstico se reduce a minutos — el equipo sabe resolver, el problema es encontrar dónde está la falla.

### Proyección After (Post-Modernización Fase 1-2)

| Métrica DORA | Actual | Proyectado Fase 2 | Delta | Evidencia |
|-------------|--------|-------------------|-------|-----------|
| Deployment Frequency | 1/mes | 2-3/semana | 8-12x mejora | Pipeline CI/CD + feature flags [INFERENCIA] |
| Lead Time for Changes | 45 días | 5-8 días | 6-9x mejora | Eliminación de cola + QA automatizado [INFERENCIA] |
| Change Failure Rate | 18% | 5-8% | 2-3x mejora | Test coverage >80% + canary deploys [INFERENCIA] |
| MTTR | 4 horas | 30-45 min | 5-8x mejora | Tracing distribuido + alertas inteligentes [INFERENCIA] |

> **Nota**: Proyecciones basadas en resultados observados en modernizaciones similares del portafolio MetodologIA (N=12 proyectos, vertical retail/e-commerce). Tendencia indicativa, no garantía. Resultados reales dependen de adopción del equipo y gestión del cambio. [SUPUESTO]

### Impacto Tangibilizado

La mejora proyectada en lead time — **de 45 días a 5-8 días** — tiene consecuencia directa en negocio:

- **Hoy**: Una funcionalidad solicitada por negocio (ej: nueva promoción navideña) tarda 45 días en llegar a producción. Si la decisión comercial se toma en octubre, la funcionalidad llega en diciembre — **potencialmente después de la ventana comercial** [INFERENCIA].
- **Proyectado**: La misma funcionalidad tarda 5-8 días. Decisión en octubre, funcionalidad live la segunda semana de octubre. **35-40 días de ventaja competitiva recuperados por cada feature** [INFERENCIA].

---

## 3. Comunicación de Magnitudes — Deuda Técnica

### Cuantificación

La deuda técnica total estimada es de **54 FTE-meses** [CÓDIGO][INFERENCIA].

¿Qué significa 54 FTE-meses en términos tangibles?

| Equivalencia | Traducción |
|-------------|-----------|
| Equipo dedicado | 9 personas × 6 meses exclusivamente, sin hacer nada más |
| Fracción del equipo actual | 15 de los 35 desarrolladores × 6 meses (43% del equipo) |
| Impacto en velocity | Si se aborda en paralelo con features, el equipo opera al ~60% de capacidad durante 9 meses |

### Distribución de la Deuda

| Módulo | FTE-meses | % del total | Prioridad |
|--------|-----------|-------------|-----------|
| Autenticación + Core Inventario | 28 | 52% | Crítica — causa raíz de 2 rojos en scoring |
| Módulo de Pagos | 15 | 28% | Alta — cobertura de tests al 23%, regulación Q4 |
| API Gateway (legacy) | 7 | 13% | Media — funcional pero límite de escalabilidad |
| Reporting + BI | 4 | 7% | Baja — migrable independientemente |

**El insight clave no es el total de 54 FTE-meses, sino la concentración.** El 80% de la deuda se concentra en 2 módulos (Autenticación/Inventario y Pagos) que además son los de mayor riesgo operacional y regulatorio [CÓDIGO]. Esto es simultáneamente un problema (la deuda está donde más duele) y una oportunidad (abordar 2 módulos resuelve el 80% del problema).

### No Abordar la Deuda: Costo de la Inacción

Si la deuda técnica no se aborda [INFERENCIA]:

- **Q4 2026**: El módulo de pagos no cumplirá la nueva regulación de pagos digitales. Remediación de emergencia estimada en 8 FTE-meses adicionales (vs. 4 FTE-meses si se aborda planificadamente en Q2-Q3).
- **2027**: Con crecimiento de transacciones de 3x proyectado, la escalabilidad vertical alcanza su límite. Incidentes de disponibilidad pasarán de 4/año a estimados 12-15/año [INFERENCIA].
- **Bus factor**: Las 3 personas que mantienen el monolito operacional por conocimiento tácito son riesgo de rotación. Si 1 de 3 se va, MTTR se duplica. Si 2 de 3, el sistema se vuelve inoperable para el equipo restante [STAKEHOLDER].

---

## 4. Resumen Ejecutivo de Métricas

| Área | Estado | Insight Principal | Acción Recomendada |
|------|--------|------------------|-------------------|
| Arquitectura 6D | 2 rojos, 3 amarillos, 1 verde | Causa raíz compartida: acoplamiento monolítico | Strangler Fig Pattern, Fase 1 |
| DORA Metrics | Percentil 15 | 89% del lead time es desperdicio sistémico | CI/CD + feature flags + QA automatizado |
| Deuda Técnica | 54 FTE-meses | 80% concentrada en 2 módulos críticos | Priorizar Auth/Inventario y Pagos |
| Riesgo Regulatorio | Alto | Módulo de pagos no cumple regulación Q4 | Intervención planificada Q2-Q3 |
| Riesgo Operacional | Alto | Bus factor de 3 personas | Documentación + pair programming cross-team |

> → Ver 05_Escenarios para evaluación Tree-of-Thought de escenarios de modernización.
> → Ver 06_Solution_Roadmap para plan de ejecución en 4 fases con Monte Carlo.

---

*Documento generado por el MetodologIA Discovery Framework. Métricas con evidence tags. Magnitudes en FTE-meses. NUNCA valores monetarios.*
*© Comunidad MetodologIA — Todos los derechos reservados.*
