---
skill: metodologia-architecture-tobe
title: "State of the Art — Arquitectura TO-BE (2024-2026)"
author: Javier Montaño
copyright: "© Comunidad MetodologIA"
updated: 2026-03-13
---

# State of the Art: Arquitectura TO-BE (2024–2026)

> Tendencias actuales que impactan el diseño de arquitecturas objetivo en contextos de modernización y transformación enterprise.

---

## Tendencia 1: Platform Engineering como Capa de Aceleración (2024-2026)

**Descripción:** Platform Engineering consolida las capacidades de infraestructura, observabilidad, CI/CD y gestión de secretos en una Internal Developer Platform (IDP) que los equipos de producto consumen como servicio. Herramientas como Backstage (Spotify), Port, y Cortex han madurado significativamente desde 2024, con adopción masiva en enterprises con más de 100 desarrolladores.

**Impacto en la práctica de discovery:** El TO-BE arquitectónico ya no diseña infraestructura desde cero; asume la existencia (o el plan de construcción) de un IDP. Esto redefine la capa de Infra & Observability del C4 L2: en lugar de K8s "a pelo", se diseña sobre el IDP. Los ADRs de despliegue cambian de "cómo operamos Kubernetes" a "qué capacidades del platform consumimos vs. construimos".

**Madurez:** Alto. Gartner ubicó Platform Engineering como práctica mainstream en 2024. El 80% de las organizaciones con >200 desarrolladores adoptará IDPs antes de 2026 (Gartner, 2024).

---

## Tendencia 2: eBPF para Observabilidad y Seguridad Sin Código de Aplicación (2024-2026)

**Descripción:** eBPF (extended Berkeley Packet Filter) permite observabilidad, seguridad y networking a nivel de kernel Linux sin instrumentar el código de la aplicación. Herramientas como Cilium, Pixie, y Tetragon proveen distributed tracing, network policies y threat detection sin sidecars adicionales. En 2025, Cilium se convirtió en el CNI (Container Network Interface) recomendado por la CNCF para producción.

**Impacto en la práctica de discovery:** El diseño del service mesh y la observabilidad del TO-BE se simplifica: menos sidecars (Envoy/Istio) y más eBPF-native networking. Los ADRs de service mesh deben evaluar la trade-off eBPF vs. sidecar proxy considerando madurez del equipo, compatibilidad del kernel, y overhead operativo.

**Madurez:** Medio-Alto. eBPF en networking y observabilidad es producción-ready. eBPF para security enforcement (Tetragon) está en adopción temprana enterprise.

---

## Tendencia 3: AI-Augmented Architecture Design (2025-2026)

**Descripción:** Herramientas de IA generativa se integran en el flujo de diseño arquitectónico: GitHub Copilot para código, pero también asistentes especializados en ADRs (como Amazon Q Developer), análisis de dependencias (Cortex AI), y generación de diagramas C4 desde descripciones naturales. En 2025, el 40% de los arquitectos en enterprises Fortune 500 reportan usar IA como co-piloto en decisiones de diseño (ThoughtWorks Technology Radar, 2025).

**Impacto en la práctica de discovery:** El rol del arquitecto evoluciona de "generador" a "validador crítico" de opciones arquitectónicas. El valor diferencial está en el contexto de negocio, las restricciones reales, y la validación de los trade-offs — no en la generación del catálogo de patrones. Los ADRs generados por IA requieren revisión experta obligatoria antes de aprobación.

**Madurez:** En adopción acelerada. Las organizaciones líderes ya integran IA en sus Architecture Review Boards como herramienta de soporte, no como tomadora de decisiones.

---

## Tendencia 4: Modular Monolith como Primer Paso Validado (2024-2026)

**Descripción:** Tras años de "microservicios por default", hay un retorno pragmático al monolito modular (o "majestic monolith") como punto de partida antes de la extracción incremental de servicios. Sam Newman (_Building Microservices_, 2nd ed., 2021) y Martin Fowler han argumentado desde 2023 que el monolito modular con boundaries DDD bien definidos es más fácil de operar y produce mejores arquitecturas de microservicios cuando la extracción ocurre. En 2024-2025, Shopify y Stack Overflow publicaron post-mortems documentando el retorno parcial a monolitos tras sobrecarga operativa de microservicios.

**Impacto en la práctica de discovery:** El diseño TO-BE en escenarios Conservative ya no asume microservicios. El ADR de "Service Decomposition Strategy" debe evaluar explícitamente monolito modular como alternativa viable, especialmente cuando el equipo tiene <10 personas o cuando el sistema no tiene volumen que justifique despliegue independiente de servicios.

**Madurez:** Alto como patrón. La discusión "monolito vs. microservicios" ha madurado hacia "el patrón correcto para el contexto correcto".

---

## Tendencia 5: GitOps y Supply Chain Security como Estándar No-Negociable (2024-2026)

**Descripción:** GitOps (Weaveworks, 2017) ha alcanzado adopción mainstream con Flux y ArgoCD como implementaciones de referencia. En 2024, el estándar SLSA (Supply-chain Levels for Software Artifacts) de Google alcanzó la versión 1.0, estableciendo un framework para medir y mejorar la integridad de la cadena de suministro de software. Organizaciones reguladas (banca, salud, gobierno) comenzaron a exigir SLSA Level 2+ en 2025.

**Impacto en la práctica de discovery:** El ADR de "Deployment Platform" en el TO-BE debe incluir SLSA compliance como constraint, no como opcional. El pipeline de GitOps debe tener attestations de provenance (quién construyó qué, con qué dependencias). Esto afecta la arquitectura del CI/CD y el diseño de la capa de infraestructura.

**Madurez:** Alto para GitOps básico. SLSA compliance como exigencia regulatoria: en adopción temprana pero con aceleración en 2025-2026.

---

## Tendencia 6: Event-Driven Architecture con Schema Registry como Infraestructura Crítica (2024-2026)

**Descripción:** La proliferación de Kafka y sistemas event-driven ha elevado el Schema Registry (Confluent Schema Registry, AWS Glue Schema Registry) a infraestructura de primera clase. Los contratos de eventos, análogos a las APIs REST en versiones y compatibilidad, requieren governance explícito. En 2025, la práctica de "event storming + schema-first event design" se ha establecido como el flujo estándar en organizaciones con más de 20 productores/consumidores de eventos.

**Impacto en la práctica de discovery:** El TO-BE debe incluir el Schema Registry como componente explícito en el C4 L2 cuando la arquitectura es event-driven. El ADR de "Event Streaming" debe definir la estrategia de evolución de schemas (backward/forward compatibility) y el proceso de change control para eventos. Esto mitiga directamente el nightmare scenario de "Schema Drift".

**Madurez:** Alto. Schema Registry como infraestructura crítica es production-ready y best practice establecida para 2024+.

---

## Tendencia 7: Durable Execution como Sucesor Práctico del Saga Pattern (2025-2026)

**Descripción:** Frameworks de "Durable Execution" como Temporal.io y AWS Step Functions con Express Workflows abstraen la complejidad de los Saga patterns y la gestión de estado en flujos de larga duración. En lugar de implementar manualmente orquestadores de saga, compensaciones y retries, estos frameworks proveen un runtime que persiste el estado del flujo y lo recupera automáticamente. Temporal.io reporta adopción enterprise significativa desde 2024 (Netflix, Uber, Snap, Stripe).

**Impacto en la práctica de discovery:** El ADR de "Distributed Transaction Strategy" debe evaluar Durable Execution frameworks como alternativa de primera clase frente a la implementación manual de sagas. Para equipos sin experiencia en saga patterns, Temporal puede reducir el riesgo técnico significativamente. El trade-off es la dependencia de una plataforma adicional.

**Madurez:** Medio-Alto. Temporal.io es producción-ready con ecosistema maduro. La categoría "Durable Execution" fue adoptada por ThoughtWorks Technology Radar en 2024.

---

*© Comunidad MetodologIA — Autor: Javier Montaño — Actualizado: 13 de marzo de 2026*
