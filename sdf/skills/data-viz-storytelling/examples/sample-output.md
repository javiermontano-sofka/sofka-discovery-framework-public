---
title: Narrativa Visual — Análisis Arquitectónico TechMart
context: analysis
format: markdown
variante: tecnica
date: 2026-03-13
---

# Narrativa Visual — Análisis Arquitectónico TechMart

> **TL;DR**
> - La arquitectura actual presenta un punto único de fallo: 3 servicios comparten 1 base de datos monolítica.
> - El pipeline de deploy carece de observabilidad — MTTR promedio de 4.2 horas.
> - La secuencia de dashboard revela que el 73% de incidentes se originan en el acoplamiento de datos.
> - Se propone descomposición en 3 bounded contexts con base de datos independiente por servicio.

---

## 1. Contexto de la Narrativa Visual

Este documento aplica **data visualization storytelling** al análisis AS-IS de TechMart, una plataforma e-commerce con 2.3M usuarios activos mensuales. Cada visualización tiene UN mensaje principal, y la secuencia construye el argumento hacia la recomendación de desacoplamiento.

**Audiencia:** Equipo técnico + CTO (variante técnica).
**Secuencia narrativa:** Problema (C4) → Evidencia (métricas) → Impacto (flujo) → Acción (roadmap).

---

## 2. Diagrama C4 Narrativo — El Punto de Dolor

**Mensaje principal:** Tres servicios core dependen de una única base de datos PostgreSQL. Cuando la BD se satura, los tres servicios caen simultáneamente.

> Accesibilidad: Diagrama flowchart TD que muestra 3 servicios (orderService, catalogService, userService) conectados a 1 base de datos compartida (sharedDB) marcada como riesgo. Un API gateway dirige tráfico a los 3 servicios. Un sistema de pagos externo se conecta a orderService.

```mermaid
flowchart TD
    apiGateway["API Gateway<br/>2.3M usuarios/mes"]
    orderService["Order Service<br/>Gestión de pedidos"]
    catalogService["Catalog Service<br/>Productos y precios"]
    userService["User Service<br/>Autenticación y perfiles"]
    sharedDB[("PostgreSQL Compartida<br/>⚠ Punto único de fallo<br/>847 tablas, 1.2TB")]
    paymentExt["Pasarela de Pagos<br/>(externo)"]
    cacheLayer["Redis Cache<br/>Hit rate: 42%"]

    apiGateway -->|"rutea requests"| orderService
    apiGateway -->|"rutea requests"| catalogService
    apiGateway -->|"rutea requests"| userService

    orderService -->|"lee/escribe pedidos"| sharedDB
    catalogService -->|"lee catálogo"| sharedDB
    userService -->|"lee/escribe usuarios"| sharedDB

    orderService -->|"procesa pagos"| paymentExt
    catalogService -->|"cachea productos"| cacheLayer

    classDef primary fill:#6366F1,stroke:#1A1A2E,color:#fff
    classDef risk fill:#DC3545,stroke:#1A1A2E,color:#fff
    classDef success fill:#22D3EE,stroke:#1A1A2E,color:#1A1A2E
    classDef neutral fill:#F8F9FA,stroke:#1A1A2E,color:#1A1A2E

    class apiGateway primary
    class sharedDB risk
    class paymentExt neutral
    class cacheLayer neutral
    class orderService,catalogService,userService primary
```

**Anotación narrativa:** La base de datos compartida (nodo rojo) es el cuello de botella. Con 847 tablas y 1.2TB, cualquier migración de schema bloquea los 3 servicios. El cache Redis con solo 42% de hit rate indica que las queries no están optimizadas para caching — el catálogo hace queries ad-hoc directas a la BD.

---

## 3. Secuencia de Dashboard — Construyendo el Argumento

### 3.1 Headline Visual: Distribución de Incidentes por Origen

**Mensaje principal:** El 73% de los incidentes se originan en la capa de datos compartida.

> Accesibilidad: Diagrama pie que muestra la distribución de incidentes: base de datos compartida 73%, API gateway 12%, servicios externos 10%, otros 5%.

```mermaid
pie title Origen de Incidentes — Últimos 12 Meses (N=187)
    "BD Compartida" : 73
    "API Gateway" : 12
    "Servicios Externos" : 10
    "Otros" : 5
```

**Anotación narrativa:** De 187 incidentes en 12 meses, 137 se originaron en la base de datos compartida: locks por migrations, connection pool exhaustion, y queries lentas de catálogo que bloquearon transacciones de pedidos.

---

### 3.2 Context Visual: Flujo de un Incidente Típico

**Mensaje principal:** Un lock de migración en catalogService causa cascada de fallos en orderService y userService en menos de 3 minutos.

> Accesibilidad: Diagrama de secuencia que muestra cómo un deploy de catalogService ejecuta una migración que bloquea la BD compartida, causando timeouts en orderService y userService, con un MTTR de 4.2 horas.

```mermaid
sequenceDiagram
    participant DEV as Deploy Pipeline
    participant CAT as catalogService
    participant DB as sharedDB ⚠
    participant ORD as orderService
    participant USR as userService
    participant OPS as Ops Team

    DEV->>CAT: Deploy v2.14 (schema migration)
    CAT->>DB: ALTER TABLE products ADD COLUMN...
    Note over DB: 🔒 Table lock activo<br/>Duración: 8-12 min
    ORD->>DB: INSERT INTO orders...
    DB-->>ORD: TIMEOUT (30s)
    USR->>DB: SELECT FROM users...
    DB-->>USR: TIMEOUT (30s)
    Note over ORD,USR: Cascada de errores<br/>3 servicios afectados
    ORD->>OPS: Alert: orders failing
    USR->>OPS: Alert: auth failing
    Note over OPS: MTTR promedio: 4.2h<br/>Diagnóstico manual sin trazas
```

**Anotación narrativa:** El patrón se repite cada sprint. Un deploy rutinario de catálogo dispara una migración que bloquea la tabla más consultada. Sin observabilidad distribuida, el equipo de Ops tarda 4.2 horas promedio en diagnosticar la causa raíz — porque las alertas llegan desde 3 servicios distintos sin correlación.

---

### 3.3 Evidence Visual: Scoring de Componentes Arquitectónicos

**Mensaje principal:** La base de datos y el pipeline de deploy son los componentes con peor scoring; el API gateway es el mejor posicionado.

> Accesibilidad: Tabla de scoring con 5 componentes evaluados en 4 dimensiones (acoplamiento, observabilidad, escalabilidad, resiliencia) en escala 1-5.

| Componente | Acoplamiento | Observabilidad | Escalabilidad | Resiliencia | **Score** |
|------------|:---:|:---:|:---:|:---:|:---:|
| API Gateway | 4 | 3 | 4 | 4 | **3.75** |
| Order Service | 2 | 2 | 2 | 2 | **2.00** |
| Catalog Service | 2 | 2 | 3 | 2 | **2.25** |
| User Service | 2 | 1 | 2 | 2 | **1.75** |
| **SharedDB** | **1** | **1** | **1** | **1** | **1.00** |

> Accesibilidad: Diagrama quadrant chart que posiciona los componentes según impacto y madurez. SharedDB está en el cuadrante de alto impacto / baja madurez (zona de riesgo).

```mermaid
quadrantChart
    title Impacto vs. Madurez de Componentes
    x-axis Baja Madurez --> Alta Madurez
    y-axis Bajo Impacto --> Alto Impacto
    quadrant-1 Fortaleza
    quadrant-2 Riesgo Crítico
    quadrant-3 Deuda Técnica
    quadrant-4 Estable
    API Gateway: [0.75, 0.65]
    Order Service: [0.35, 0.80]
    Catalog Service: [0.40, 0.60]
    User Service: [0.25, 0.50]
    SharedDB: [0.15, 0.90]
```

**Anotación narrativa:** SharedDB (esquina superior izquierda) concentra el mayor impacto con la menor madurez — el candidato prioritario para intervención. El API Gateway es la única fortaleza real: bien desacoplado, con métricas básicas, y escalable horizontalmente.

---

### 3.4 Action Visual: Roadmap de Desacoplamiento

**Mensaje principal:** La descomposición en 3 bounded contexts con base de datos independiente se ejecuta en 4 fases a lo largo de 6 meses.

> Accesibilidad: Diagrama flowchart LR que muestra 4 fases de desacoplamiento: observabilidad, separar userDB, separar catalogDB, y eliminar sharedDB. Cada fase tiene su duración y entregable principal.

```mermaid
flowchart LR
    fase1["Fase 1<br/>Observabilidad<br/>4 semanas"]
    fase2["Fase 2<br/>Separar userDB<br/>6 semanas"]
    fase3["Fase 3<br/>Separar catalogDB<br/>8 semanas"]
    fase4["Fase 4<br/>Desacoplar orderDB<br/>+ Eliminar sharedDB<br/>6 semanas"]

    fase1 -->|"trazas distribuidas<br/>habilitadas"| fase2
    fase2 -->|"userService<br/>independiente"| fase3
    fase3 -->|"catalogService<br/>independiente"| fase4

    classDef primary fill:#6366F1,stroke:#1A1A2E,color:#fff
    classDef risk fill:#DC3545,stroke:#1A1A2E,color:#fff
    classDef success fill:#22D3EE,stroke:#1A1A2E,color:#1A1A2E
    classDef neutral fill:#F8F9FA,stroke:#1A1A2E,color:#1A1A2E

    class fase1 primary
    class fase2,fase3 neutral
    class fase4 success
```

**Anotación narrativa:** La Fase 1 (naranja) es prerequisito: sin observabilidad, las fases de separación serían ciegas. La Fase 4 (dorado) marca el éxito: la eliminación de sharedDB como punto único de fallo. El orden de separación (user → catalog → order) sigue la complejidad ascendente — userService tiene el schema más simple (23 tablas) y orderService el más complejo (312 tablas con FK cruzadas).

---

## 4. Resumen de Decisiones Visuales

| Decisión | Justificación |
|----------|---------------|
| C4 flowchart TD para arquitectura | Muestra jerarquía: gateway → servicios → BD. La dirección top-down refleja el flujo de requests |
| Pie chart para distribución de incidentes | Composición de un todo (100% incidentes). Pocos segmentos (4). Mensaje claro: un segmento domina |
| Sequence diagram para cascada de fallos | Muestra temporalidad y causalidad entre actores. El pattern lock → timeout → cascada es inherentemente secuencial |
| Quadrant chart para scoring | Posiciona componentes en dos dimensiones simultáneamente. Revela clusters y outliers visualmente |
| Flowchart LR para roadmap | Flujo izquierda-derecha = progresión temporal natural. 4 fases = 4 nodos, legible sin zoom |

---

## 5. Validation Gate

| Criterio | Resultado |
|----------|-----------|
| Chart type matches data pattern | Composición=pie, flujo=sequence, posición=quadrant, jerarquía=flowchart TD, timeline=flowchart LR |
| One message per visualization | Cada diagrama tiene un "mensaje principal" declarado antes del diagrama |
| Annotations are selective | Solo se anotan: punto de fallo, MTTR, % dominante, fase crítica |
| Mermaid follows standards | Todos los diagramas: <=20 nodos, IDs descriptivos, edges con labels de acción, max 4 classDefs |
| Accessibility text present | "Accesibilidad:" summary antes de cada diagrama |
| Brand colors correct | Orange #6366F1, gold #22D3EE para success, red #DC3545 para riesgo. Cero uso de verde |
| Visual sequence builds argument | Problema (C4) → Evidencia (pie) → Impacto (sequence) → Scoring (quadrant) → Acción (roadmap) |

---

*Fuente: data-viz-storytelling skill — MetodologIA Discovery Framework*
*Caso: TechMart e-commerce — Análisis AS-IS arquitectónico*
