---
skill: metodologia-architecture-tobe
title: "Body of Knowledge — Arquitectura TO-BE"
author: Javier Montaño
copyright: "© Comunidad MetodologIA"
updated: 2026-03-13
---

# Body of Knowledge: Arquitectura TO-BE

> Fundamento teórico y corpus de conocimiento para el diseño de arquitecturas objetivo en contextos de modernización de sistemas legados.

---

## 1. Fundamentos Conceptuales

### 1.1 ¿Qué es una Arquitectura TO-BE?

La arquitectura TO-BE (estado futuro deseado) define la estructura objetivo de un sistema una vez completada la transformación. Se distingue del AS-IS (estado actual) en que no describe lo que existe, sino lo que debe existir para satisfacer los objetivos estratégicos del negocio con las restricciones reales de equipo, presupuesto y regulación.

Una arquitectura TO-BE de calidad incluye:
- Diagrama de contenedores C4 Level 2 con sus relaciones y protocolos
- Architecture Decision Records (ADRs) para cada decisión significativa
- Análisis de escenarios de falla (nightmare scenarios) con mitigaciones
- Componente MVP validable como primer despliegue
- Plan de migración gradual (típicamente Strangler Fig)

### 1.2 El Principio de Evidencia Arquitectónica

Toda decisión arquitectónica debe estar anclada en evidencia del estado actual (AS-IS), en los constraints del escenario aprobado, y en la factibilidad técnica validada. Una arquitectura generada sin esta base es "ficción arquitectónica" (Simon Brown, 2020). El ADR es el mecanismo que hace explícita la cadena de razonamiento.

---

## 2. El Modelo C4 (Simon Brown)

### 2.1 Niveles del Modelo C4

El modelo C4 (Context, Containers, Components, Code) de Simon Brown (2018) provee un conjunto jerárquico de abstracciones para describir sistemas de software:

| Nivel | Abstracción | Audiencia |
|-------|-------------|-----------|
| L1 — Context | Sistema en el mundo, usuarios y sistemas externos | Ejecutivos, stakeholders no técnicos |
| L2 — Containers | Aplicaciones, servicios, bases de datos, frontends | Arquitectos, líderes técnicos |
| L3 — Components | Módulos internos de un container | Desarrolladores del servicio |
| L4 — Code | Clases, funciones, relaciones | Desarrolladores individuales |

En la práctica de discovery de MetodologIA, el scope del TO-BE es L2. L3 y L4 son artefactos de diseño detallado, fuera del alcance de este deliverable.

### 2.2 Capas Arquitectónicas en C4 L2

La arquitectura L2 se organiza en capas lógicas:
1. **Consumer Layer**: SPA, apps móviles, APIs para terceros
2. **API Gateway Layer**: autenticación, autorización, rate limiting, routing, mTLS
3. **Microservices Mesh**: servicios de dominio con service mesh (Istio/Linkerd)
4. **Anti-Corruption Layer (ACL)**: adaptadores de protocolo, sidecars, normalización de datos
5. **Legacy System Layer**: sistemas existentes en proceso de retiro gradual
6. **Data Layer**: persistencia políglota (PostgreSQL, Redis, Elasticsearch, S3)
7. **Infrastructure & Observability**: K8s, GitOps, logging, tracing, métricas

---

## 3. Architecture Decision Records (ADRs)

### 3.1 Origen y Propósito

Los ADRs fueron propuestos por Michael Nygard (2011) en su artículo "Documenting Architecture Decisions". Son registros concisos de una decisión arquitectónica significativa: qué se decidió, qué alternativas se evaluaron, cuáles fueron los trade-offs, y cuáles las consecuencias esperadas.

El principio central: **las decisiones son tan importantes como el diseño resultante**. Sin ADRs, el conocimiento tácito se pierde con la rotación de equipo.

### 3.2 Estructura de un ADR MetodologIA

```
## ADR-NNN: [Título de la Decisión]
**Estado:** Propuesto | Aceptado | Reemplazado | Obsoleto
**Contexto:** [Problema que motiva la decisión]
**Decisión:** [Qué se decidió hacer]
**Alternativas Consideradas:**
  - Opción A: pros, contras, razón de rechazo
  - Opción B: pros, contras, razón de rechazo
**Trade-off:** [Qué se gana, qué se pierde, qué se asume]
**Consecuencias:** [Positivas, negativas, neutras]
```

### 3.3 ADRs Mínimos para TO-BE Enterprise

1. Estrategia de transacción distribuida (Saga vs 2PC)
2. Patrón de integración con legado (ACL + Sidecar)
3. Modelo de seguridad (Zero Trust, mTLS)
4. Estrategia de datos y auditoría (Event Sourcing + CQRS)
5. Plataforma de despliegue (Kubernetes + GitOps)
6. Gestión de caché y sesiones (Redis)

---

## 4. Patrones de Migración de Sistemas Legados

### 4.1 Strangler Fig Pattern

Introducido por Martin Fowler (2004) inspirado en la higuera estranguladora (_Ficus microcarpa_), que crece alrededor del árbol huésped hasta reemplazarlo gradualmente. En el contexto de software:

- El sistema legacy continúa operando
- Nuevas funcionalidades se construyen en la arquitectura moderna
- Las funcionalidades existentes se migran incrementalmente
- El legado se retira cuando ya no tiene dependencias activas

**Fases típicas en contextos enterprise:**
| Fase | Contenido |
|------|-----------|
| Assessment & Wrapping | Inventario de integraciones, build de sidecars y ACL |
| Modern Service Introduction | Deploy del MVP con canary (10%), shadow mode |
| Capability Migration | Migración de servicios de dominio, event streaming |
| Legacy Sunset | Modo read-only, archivo a data lake, decommission |

### 4.2 Anti-Corruption Layer (ACL)

Introducido por Eric Evans en _Domain-Driven Design_ (2003). El ACL es una capa de traducción que protege al dominio moderno de los modelos y protocolos del sistema legado. Sin ACL, el sistema moderno absorbería la deuda técnica y los anti-patrones del legado.

### 4.3 Sidecar Pattern

Patrón de Kubernetes/service mesh que despliega un proceso auxiliar junto al contenedor principal para añadir capacidades transversales (logging, mTLS, retries) sin modificar el código de la aplicación. En modernización de legados, se usa para envolver sistemas que no exponen APIs.

---

## 5. Patrones de Resiliencia y Transacciones Distribuidas

### 5.1 Saga Pattern

Propuesto por Hector Garcia-Molina y Kenneth Salem (1987). En arquitecturas de microservicios, el Saga Pattern gestiona transacciones de larga duración sin bloqueos distribuidos. Cada paso de la saga tiene una transacción de compensación para revertir en caso de fallo.

**Variantes:**
- **Orchestration Saga**: Un orquestador central coordina los pasos. Mayor control, punto único de lógica.
- **Choreography Saga**: Cada servicio emite y consume eventos. Mayor desacoplamiento, mayor complejidad de rastreo.

### 5.2 CQRS (Command Query Responsibility Segregation)

Propuesto por Greg Young (2010), basado en el principio CQS de Bertrand Meyer. Separa el modelo de escritura (Commands) del modelo de lectura (Queries), permitiendo optimizar cada uno independientemente. Se combina frecuentemente con Event Sourcing.

**Cuándo usar CQRS:**
- Ratio lectura/escritura >10:1
- Consistencia eventual aceptable para lecturas
- Auditoría inmutable requerida por regulación

### 5.3 Transactional Outbox Pattern

Garantiza la entrega exactamente-una-vez de eventos a un message broker combinando la escritura en base de datos y la publicación del evento en una sola transacción local (Chris Richardson, 2018). Elimina el problema de "ghost transactions" donde el estado cambia pero el evento no se publica.

### 5.4 Circuit Breaker

Patrón de Michael Nygard (_Release It!_, 2007) que previene el cascade failure deteniendo las llamadas a un servicio degradado y permitiendo recuperación gradual. Se implementa en tres estados: Closed (normal), Open (fallo), Half-Open (prueba de recuperación).

---

## 6. Seguridad Arquitectónica

### 6.1 Zero Trust Architecture

Principio "Never trust, always verify" articulado por John Kindervag (Forrester, 2010) y formalizado en NIST SP 800-207 (2020). En arquitecturas de microservicios se implementa mediante:
- **mTLS** (mutual TLS) entre todos los servicios del mesh
- **OAuth2/OIDC** para identidad de usuarios y sistemas
- **RBAC/ABAC** para control de autorización granular
- **Secrets management** via HashiCorp Vault o servicios cloud equivalentes

### 6.2 Threat Modeling

El framework STRIDE (Spoofing, Tampering, Repudiation, Information Disclosure, Denial of Service, Elevation of Privilege), desarrollado por Microsoft (Kohnfelder & Garg, 1999), es el estándar de facto para identificar amenazas durante el diseño. Cada nightmare scenario arquitectónico tiene correspondencia directa con categorías STRIDE.

---

## 7. Metodologías de Referencia

| Metodología | Autor / Fuente | Aplicación en TO-BE |
|-------------|---------------|---------------------|
| Domain-Driven Design | Eric Evans (2003) | Definición de bounded contexts y límites de servicios |
| C4 Model | Simon Brown (2018) | Diagrama de contenedores L2 |
| ADRs | Michael Nygard (2011) | Documentación de decisiones arquitectónicas |
| Strangler Fig | Martin Fowler (2004) | Estrategia de migración gradual |
| Saga Pattern | Garcia-Molina & Salem (1987) | Transacciones distribuidas |
| CQRS | Greg Young (2010) | Separación lectura/escritura |
| Outbox Pattern | Chris Richardson (2018) | Consistencia eventual garantizada |
| Zero Trust | John Kindervag / NIST (2010/2020) | Modelo de seguridad perimetral eliminado |
| Release It! | Michael Nygard (2007) | Circuit breakers, bulkheads, timeout patterns |
| Team Topologies | Matthew Skelton & Manuel Pais (2019) | Alineación de equipos con bounded contexts |

---

## 8. Cross-References con Otros Skills del Framework

| Skill | Relación con TO-BE |
|-------|--------------------|
| `asis-analysis` | Provee el estado actual que ancla las decisiones TO-BE |
| `scenario-analysis` | El escenario aprobado (Conservative/Moderate/Aggressive) determina la profundidad del TO-BE |
| `solution-roadmap` | El TO-BE alimenta las fases de ejecución del roadmap |
| `security-architecture` | Expande el modelo Zero Trust y el threat modeling |
| `devsecops-architecture` | Define el pipeline CI/CD y GitOps que despliega el TO-BE |
| `infrastructure-architecture` | Expande la capa K8s, HA/DR, network topology |
| `database-architecture` | Expande la capa de datos (políglota, migración, CDC) |
| `functional-spec` | Deriva los contratos API del MVP Component |

---

*© Comunidad MetodologIA — Autor: Javier Montaño — Actualizado: 13 de marzo de 2026*
