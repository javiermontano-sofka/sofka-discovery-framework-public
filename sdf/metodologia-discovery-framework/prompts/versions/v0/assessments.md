# Prompts de Assessment — MetodologIA Discovery Framework

> Evaluaciones especializadas. Deep-dives independientes del pipeline principal.
> Pueden ejecutarse standalone o como complemento de un discovery en curso.
> Cada assessment genera un entregable autocontenido con evidencia trazable.

---

## Architecture Deep-Dive

**Cuándo:** Necesitas una evaluación arquitectónica exhaustiva que va más allá de la sección S2 del AS-IS. Ideal cuando la decisión de inversión depende de la salud arquitectónica del sistema.
**Dependencias:** Acceso al código fuente. Opcionalmente, 03_AS-IS como input.
**Criterio de aceptación:** C4 multinivel (L1 Context, L2 Container, L3 Component) en Mermaid, quality attributes evaluados (performance, scalability, security, maintainability, reliability), deuda arquitectónica cuantificada con índice de severidad, ≥3 ADRs formales con opciones evaluadas, TO-BE target state con path de migración.
**Caso borde:** Si el sistema es un monolito >500K LOC, priorizar análisis por bounded context en lugar de vista global.

```
/mao:assess-architecture

Evaluación profunda de arquitectura del sistema en {RUTA}.
C4 multinivel (L1–L3) con diagramas Mermaid,
quality attributes (ISO 25010: rendimiento, seguridad, mantenibilidad, fiabilidad, escalabilidad),
deuda arquitectónica cuantificada (severidad × impacto × esfuerzo de remediación),
≥3 ADRs formales (contexto → opciones → decisión → consecuencias),
TO-BE target state con milestones de transición.
Evidencia etiquetada: [CODIGO], [CONFIG], [INFERENCIA], [SUPUESTO].

MODO=piloto-auto | FORMATO=markdown | PROFUNDIDAD=exhaustivo
{RUTA}: .
```

---

## Data Landscape

**Cuándo:** Necesitas entender el ecosistema de datos completo: cómo se almacena, mueve, transforma y gobierna la información. Crítico para proyectos de modernización, migración o data strategy.
**Dependencias:** Acceso al código + configuraciones de DB/pipelines.
**Criterio de aceptación:** Gobernanza de datos (ownership, clasificación, políticas), pipelines mapeados (ingesta → transformación → consumo), modelo de datos (ER + relaciones cross-schema), MDM assessment (golden records, duplicados, inconsistencias), calidad de datos (completitud, accuracy, freshness), integraciones de datos (ETL/ELT/CDC/streaming), data mesh readiness score.
**Caso borde:** Si no hay pipelines de datos formales (todo manual/ad-hoc), documentar el estado actual como baseline y recomendar data engineering foundations.

```
/mao:assess-data

Landscape completo de datos del sistema en {RUTA}.
Gobernanza (ownership × clasificación × políticas existentes),
pipelines (ingesta → transformación → consumo, con SLAs si existen),
modelo de datos (ER en Mermaid, relaciones cross-schema, anomalías),
MDM (golden records, duplicados, estrategia de dedup),
calidad (completitud, accuracy, freshness por entidad crítica),
integraciones (ETL/ELT/CDC/streaming — protocolo + latencia + fiabilidad),
data mesh readiness (4 principios: domain ownership, data-as-product, self-serve, federated governance).

MODO=piloto-auto | FORMATO=markdown | PROFUNDIDAD=exhaustivo
{RUTA}: .
```

---

## Cloud Readiness

**Cuándo:** Evaluación de preparación para migración o modernización cloud. Aplica framework 7R para cada workload.
**Dependencias:** Acceso al código + configuraciones de infra (Dockerfiles, IaC, CI/CD).
**Criterio de aceptación:** Framework 7R por componente (Retain, Retire, Rehost, Replatform, Refactor, Repurchase, Relocate), DORA metrics baseline (si CI/CD existe), cloud-native maturity score (12-factor assessment), FinOps readiness (cost visibility, allocation, optimization), migration path priorizado con dependencias.
**Trade-off:** 7R es por workload — un monolito puede tener una R diferente por módulo si se descompone.

```
/mao:assess-cloud

Readiness cloud del sistema en {RUTA}.
Framework 7R aplicado por componente/workload
(Retain/Retire/Rehost/Replatform/Refactor/Repurchase/Relocate),
DORA metrics baseline (deployment frequency, lead time, MTTR, change failure rate),
cloud-native maturity (12-factor assessment por servicio),
FinOps readiness (cost visibility, allocation tags, optimization opportunities),
migration path priorizado (quick wins primero, dependencias mapeadas).

MODO=piloto-auto | FORMATO=markdown | PROFUNDIDAD=técnico
{RUTA}: .
```

---

## Security Posture

**Cuándo:** Evaluación de postura de seguridad. Identifica vulnerabilidades, gaps de compliance y propone remediación priorizada.
**Dependencias:** Acceso al código + configuraciones + dependencias.
**Criterio de aceptación:** Threat model (STRIDE por componente), OWASP Top 10 assessment (hallazgos con evidencia de código), zero trust evaluation (identity, network, data, workload), supply chain security (SLSA nivel actual vs target, dependencias vulnerables), remediación priorizada por riesgo residual (probabilidad × impacto × facilidad de explotación).
**Límite:** Este assessment no reemplaza un pentest formal. Identifica riesgos desde el código y la configuración, no desde pruebas de penetración activas.

```
/mao:assess-security

Postura de seguridad del sistema en {RUTA}.
Threat model STRIDE por componente (diagrama de amenazas Mermaid),
OWASP Top 10 (hallazgo × evidencia de código × severidad CVSS),
zero trust evaluation (identity, network, data, workload — score por pilar),
supply chain (SLSA nivel actual, dependencias con CVEs conocidos, SBom gaps),
remediación priorizada (riesgo residual = probabilidad × impacto × facilidad de explotación).
⚠️ No reemplaza pentest formal — assessment basado en código y configuración.

MODO=piloto-auto | FORMATO=markdown | PROFUNDIDAD=exhaustivo
{RUTA}: .
```

---

## Change Readiness

**Cuándo:** Evaluación de preparación organizacional para el cambio propuesto. Identifica resistencias, gaps de capacidad y diseña estrategia de adopción.
**Dependencias:** Idealmente, 01_Stakeholder_Map + contexto organizacional (org chart, cultura).
**Criterio de aceptación:** ADKAR assessment (Awareness, Desire, Knowledge, Ability, Reinforcement) por grupo de stakeholders, mapa de resistencia (fuentes, intensidad, estrategia de mitigación), curva de adopción proyectada (innovators → laggards), plan de training (audiencia × contenido × formato × timeline), intervenciones recomendadas por fase de cambio.
**Caso borde:** Sin acceso a stakeholders reales, el assessment se basa en [INFERENCIA] desde el código y documentación — documentar explícitamente.

```
/mao:assess-change

Readiness organizacional para el cambio propuesto.
ADKAR por grupo de stakeholders (score 1–5 por dimensión),
mapa de resistencia (fuentes × intensidad × estrategia de mitigación),
curva de adopción proyectada (distribución por segmento),
plan de training (audiencia × contenido × formato × timeline),
intervenciones por fase de cambio (descongelamiento → movimiento → recongelamiento).
Si no hay acceso a stakeholders, etiquetar como [INFERENCIA].

MODO=piloto-auto | FORMATO=markdown | VARIANTE=ejecutiva
{RUTA}: .
```
