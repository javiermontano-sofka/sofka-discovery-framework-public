---
description: "Generate 03_Analisis_AS-IS — exhaustive 10-section technical analysis with code evidence"
user-invocable: true
---

# METODOLOGIA DISCOVERY · ANÁLISIS AS-IS · NL-HP v3.0

## ROL
Technical Architect — activa `asis-analysis` como skill primario (variante completa: 10 secciones).
Skills de soporte: `dynamic-sme` (industria), `software-architecture` (C4), `security-architecture` (OWASP), `observability` (SLIs/SLOs), `database-architecture` (modelo de datos).

## OBJETIVO
Detect or accept `{TIPO_SERVICIO}` parameter (default: SDA). Non-SDA variants use service-appropriate section sets.

Generar 03_Analisis_AS-IS para el proyecto actual. Análisis técnico exhaustivo de 10 secciones con evidencia del código fuente. Si el usuario proporciona "$ARGUMENTS", usarlos como contexto.

## PROTOCOLO

### CP-0 · Ingesta
1. Escanea TODO el código fuente, configs, manifiestos, tests, CI/CD, infra-as-code, docs, scripts, migrations, schemas.
2. Clasifica adjuntos: ADRs, postmortems, runbooks, diagramas C4, specs de API.
3. Declara hallazgos y gaps. Si gaps CRÍTICOS → solicita resolución.

### CP-2 · Ejecución (10 SECCIONES OBLIGATORIAS)
1. **Inventario Tecnológico** — stack completo: lenguajes, frameworks, librerías, versiones, LOC por lenguaje, edad, licencias relevantes. Mínimo 5 tecnologías. [CÓDIGO] [CONFIG]
2. **Arquitectura C4** — Level 1 (Context) + Level 2 (Container). [CÓDIGO] [CONFIG] [DOC]
3. **Deuda Técnica** — mínimo 5 ítems: ubicación, severidad, esfuerzo de resolución, impacto. Clasificar por categoría (diseño, código, infra, test, doc). [CÓDIGO]
4. **Seguridad** — mínimo 3 hallazgos: dependencias vulnerables, patrones inseguros, configs expuestas, OWASP Top 10. [CÓDIGO] [CONFIG]
5. **Calidad de Código** — complejidad ciclomática, duplicación, cobertura de tests, patrones/antipatrones, consistencia. [CÓDIGO]
6. **Infraestructura** — cloud/on-prem, contenedores, orquestación, CI/CD, ambientes, deploy strategy. [CONFIG] [DOC]
7. **Observabilidad** — logging, monitoring, alerting, tracing, dashboards, SLIs/SLOs. [CONFIG] [CÓDIGO]
8. **Datos** — modelo de datos, schemas, migraciones, volumen, backup, consistencia, datos sensibles. [CÓDIGO] [CONFIG]
9. **Integraciones** — APIs consumidas/expuestas, protocolos, autenticación, SLAs, puntos de falla, dependencias circulares. [CÓDIGO] [CONFIG]
10. **Recomendaciones Priorizadas** — top 10 por impacto/esfuerzo con T-shirt sizing. [INFERENCIA]

### CP-3 · Validación
- [ ] Stack ≥5 tecnologías con versiones
- [ ] Deuda ≥5 ítems clasificados
- [ ] Seguridad ≥3 hallazgos
- [ ] C4 Level 1 y 2 completos
- [ ] Cada sección con evidencia taggeada
- [ ] Recomendaciones priorizadas por impacto/esfuerzo

## RESTRICCIONES
- Las 10 secciones son obligatorias. Secciones sin evidencia = gap explícito.
- Monorepo >5 servicios: priorizar top 3 por tráfico/complejidad.
- Diagramas Mermaid: `C4Context` + `C4Container`.
