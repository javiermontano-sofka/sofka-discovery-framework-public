# Use Case Prompts — Technical Feasibility: Fact-Checking & 6D Analysis

> Prompts listos para usar en los casos de uso más frecuentes de esta skill.
> Cada prompt incluye contexto de cuándo usarlo y parámetros variables.

---

## 1. Análisis de Viabilidad 6D Completo

**Cuándo:** Post Gate 1 (escenario aprobado). Antes de comprometer presupuesto en Phase 4 (roadmap y costos).

```
Ejecutar análisis de viabilidad técnica 6D del escenario aprobado "{NOMBRE_ESCENARIO}"
para el proyecto {NOMBRE_PROYECTO}.

Inputs disponibles:
- Escenario aprobado: {PATH_ESCENARIO} (Phase 3)
- Análisis AS-IS: {PATH_ASIS} (Phase 1)
- Mapeo de flujos: {PATH_FLUJOS} (Phase 2)
- Acceso al codebase: {PATH_CODEBASE}

Contexto:
- Industria: {INDUSTRIA}
- Tamaño del equipo actual: {NUM_DEVS} personas
- Stack propuesto: {STACK_PROPUESTO}
- Timeline propuesto: {MESES} meses
- Presupuesto estimado: {MAGNITUD} (ej: 15-20 FTE-months)
- Regulaciones aplicables: {REGULACIONES}

Parámetros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
- {VARIANTE}: técnica
- {MODO_OPERACIONAL}: integral

Entregar A-02_Technical_Feasibility con las 6 secciones completas:
S1: Claim Inventory, S2: 6D Analysis, S3: Spike/PoC Recs,
S4: Blockers, S5: Verdict, S6: Updated Risk Register.

Evidence tags obligatorios en TODAS las assertions.
```

---

## 2. Validación de Claims Técnicos (Fact-Checking Focalizado)

**Cuándo:** El escenario contiene claims técnicos específicos que generan dudas. Se necesita fact-checking sin el análisis 6D completo.

```
Ejecutar fact-checking de claims técnicos del escenario "{NOMBRE_ESCENARIO}"
para el proyecto {NOMBRE_PROYECTO}.

Claims a validar:
1. "{CLAIM_1}" — Fuente: {FUENTE_1}
2. "{CLAIM_2}" — Fuente: {FUENTE_2}
3. "{CLAIM_3}" — Fuente: {FUENTE_3}
4. "{CLAIM_4}" — Fuente: {FUENTE_4}
5. "{CLAIM_5}" — Fuente: {FUENTE_5}

Codebase: {PATH_CODEBASE}

Para cada claim:
- Buscar evidencia en código, configuración, documentación, benchmarks
- Clasificar: ✅ VALIDATED / ⚠️ UNVALIDATED / 🔴 AT RISK / ❌ REFUTED
- Documentar la evidencia encontrada con evidence tags
- Si UNVALIDATED o AT RISK: recomendar spike/PoC con effort estimate

Parámetros:
- {MODO_OPERACIONAL}: verificacion-claims
- {MODO}: desatendido

Output: tabla de claims con veredicto + evidencia + recomendaciones de validación.
```

---

## 3. Viabilidad de Migración (Monolito a Microservicios / Cloud)

**Cuándo:** El escenario propone una migración arquitectónica significativa. Necesita validar si es técnica y organizacionalmente viable.

```
Ejecutar análisis de viabilidad de migración del escenario "{NOMBRE_ESCENARIO}"
para el proyecto {NOMBRE_PROYECTO}.

Migración propuesta: {TIPO_MIGRACION}
(ej: monolith-to-microservices, on-prem-to-cloud, legacy-to-modern-stack)

Origen: {ARQUITECTURA_ACTUAL}
Destino: {ARQUITECTURA_PROPUESTA}

Codebase actual: {PATH_CODEBASE}

Enfoque especial en:
- D1 (Technical): ¿la descomposición propuesta es viable? ¿hay bounded contexts naturales?
  ¿las integraciones actuales sobreviven la migración? ¿hay data migration path?
- D2 (Organizational): ¿el equipo tiene skills para el target stack?
  ¿Conway's Law es compatible? ¿hay capacity para aprender + entregar?
- D3 (Timeline): ¿el timeline propuesto es realista dada la complejidad de migración?
  ¿cuál es el critical path? ¿hay hard deadlines que restringen?
- D6 (Operational): ¿la organización puede operar la arquitectura target?
  ¿hay monitoring, CI/CD, incident response para el nuevo stack?

Para cada claim de migración: evidence tag + veredicto.
Para cada AT RISK: spike/PoC obligatorio con kill criteria.

Parámetros:
- {MODO}: supervisado
- {VARIANTE}: técnica
```

---

## 4. Viabilidad de Proyecto Greenfield

**Cuándo:** El escenario propone construir un sistema nuevo (no migración). Necesita validar si las decisiones tecnológicas y organizacionales son viables.

```
Ejecutar análisis de viabilidad greenfield del escenario "{NOMBRE_ESCENARIO}"
para el proyecto {NOMBRE_PROYECTO}.

Stack propuesto:
- Backend: {BACKEND}
- Frontend: {FRONTEND}
- Base de datos: {DATABASE}
- Infraestructura: {INFRA}
- Integraciones: {INTEGRACIONES}
- AI/ML (si aplica): {AI_COMPONENTS}

Equipo disponible: {NUM_DEVS} personas
Experiencia del equipo: {EXPERIENCIA_STACK}
Timeline: {MESES} meses hasta MVP

Enfoque 6D para greenfield:
- D1: ¿El stack propuesto es coherente? ¿Hay anti-patterns de arquitectura?
  ¿Las integraciones son viables con APIs/protocolos existentes?
- D2: ¿El equipo puede construir con este stack? ¿Necesita hiring o training?
  ¿Cuánto tiempo de ramp-up antes de productividad?
- D3: ¿MVP en {MESES} meses es realista? ¿Qué scope se sacrifica si el timeline se acorta?
- D4: ¿Las magnitudes de esfuerzo son razonables para el scope?
- D5: ¿Hay requisitos regulatorios que impactan decisiones de stack?
- D6: ¿Hay plan de operations desde day 1? ¿O se construye y después se piensa en ops?

Parámetros:
- {MODO}: piloto-auto
- {VARIANTE}: técnica
```

---

## 5. Viabilidad de Integración

**Cuándo:** El escenario propone integrar múltiples sistemas (propios, vendors, partners). Necesita validar que las integraciones son técnicamente viables.

```
Ejecutar análisis de viabilidad de integración del escenario "{NOMBRE_ESCENARIO}"
para el proyecto {NOMBRE_PROYECTO}.

Integraciones propuestas:
1. {SISTEMA_A} ↔ {SISTEMA_B} — Protocolo: {PROTOCOLO_1} — Dirección: {DIRECCIÓN}
2. {SISTEMA_C} ↔ {SISTEMA_D} — Protocolo: {PROTOCOLO_2} — Dirección: {DIRECCIÓN}
3. {SISTEMA_E} ↔ {SISTEMA_F} — Protocolo: {PROTOCOLO_3} — Dirección: {DIRECCIÓN}

Para cada integración evaluar:
- API availability: ¿existe la API? ¿está documentada? ¿es estable?
- Data compatibility: ¿los modelos de datos son compatibles? ¿se necesita transformación?
- Protocol compatibility: ¿sync/async? ¿REST/gRPC/eventos? ¿hay mismatch?
- Volume feasibility: ¿la integración soporta el volumen esperado?
- Error handling: ¿qué pasa cuando la integración falla? ¿hay circuit breaker? ¿retry?
- Security: ¿autenticación? ¿autorización? ¿encryption in transit?
- Vendor dependency: ¿la API puede cambiar sin aviso? ¿hay SLA?

Claims a validar por integración:
- "{CLAIM_INTEGRACION_1}"
- "{CLAIM_INTEGRACION_2}"

Parámetros:
- {MODO_OPERACIONAL}: verificacion-claims
- {FORMATO}: markdown

Output: matriz de viabilidad de integración con veredicto por integración + blocker analysis.
```

---

## 6. Análisis Dimensional Focalizado (Sin Fact-Checking)

**Cuándo:** Los claims ya están validados (o se asumen validados). Solo se necesita el scoring 6D y el veredicto.

```
Ejecutar análisis dimensional de viabilidad del escenario "{NOMBRE_ESCENARIO}"
para el proyecto {NOMBRE_PROYECTO}.

Nota: los claims técnicos ya fueron validados en {REFERENCIA_VALIDACIÓN}.
Proceder directamente al scoring 6D.

Contexto por dimensión:
- D1 (Technical): Stack = {STACK}; Integraciones = {NUM_INTEGRACIONES}
- D2 (Organizational): Equipo = {NUM_DEVS}; Skills = {SKILLS_ACTUALES}
- D3 (Timeline): Propuesto = {MESES} meses; Hard deadlines = {DEADLINES}
- D4 (Financial): Magnitud = {FTE_MONTHS}; Restricciones = {RESTRICCIONES}
- D5 (Regulatory): Regulaciones = {REGULACIONES}; Certificaciones = {CERTIFICACIONES}
- D6 (Operational): CI/CD = {SI/NO}; Monitoring = {SI/NO}; On-call = {SI/NO}

Parámetros:
- {MODO_OPERACIONAL}: analisis-dimensional
- {MODO}: desatendido
- {FORMATO}: markdown

Output: S2 (6D scores) + S5 (Verdict) + S6 (Risk Register).
Incluir composite score y recomendación clara: PROCEED / HOLD / PIVOT.
```

---

## 7. Feasibility Express para Steering Committee

**Cuándo:** El steering committee necesita un veredicto rápido de viabilidad antes de aprobar presupuesto. Variante ejecutiva.

```
Generar feasibility express del escenario "{NOMBRE_ESCENARIO}"
para presentación a steering committee del proyecto {NOMBRE_PROYECTO}.

Del análisis de feasibility ya generado en {PATH_FEASIBILITY}, producir versión ejecutiva.

Formato: {FORMATO} (markdown + html para proyectar)
Variante: ejecutiva

Estructura:
1. Veredicto visual: FEASIBLE / FEASIBLE WITH CONDITIONS / NOT FEASIBLE
2. Composite score X.X/5.0 con semáforo por dimensión
3. Top 5 claims y su estado (✅⚠️🔴❌)
4. Blockers identificados con mitigation pathway
5. Spikes/PoCs obligatorios con effort y timeline
6. Decisiones que necesitamos del comité

Reglas:
- CERO jerga técnica sin traducción a impacto de negocio
- Cada blocker tiene un "cost of delay" estimado
- Las condiciones son accionables y tienen owner propuesto
- Max 3 páginas de findings + 1 página de recomendación
```

---

**Autor:** Javier Montaño | **Última actualización:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**
