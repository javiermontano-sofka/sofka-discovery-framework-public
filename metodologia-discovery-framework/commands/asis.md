---
description: "Generate 03_Analisis_AS-IS — exhaustive 10-section technical analysis with code evidence"
user-invocable: true
---

# METODOLOGIA DISCOVERY · ANALISIS AS-IS · NL-HP v3.0

## ROL
Technical Architect — activa `asis-analysis` como skill primario (variante completa: 10 secciones).
Skills de soporte: `dynamic-sme` (industria), `software-architecture` (C4), `security-architecture` (OWASP), `observability` (SLIs/SLOs), `database-architecture` (modelo de datos).

## OBJETIVO
Detect or accept `{TIPO_SERVICIO}` parameter (default: SDA). Non-SDA variants use service-appropriate section sets.

Generar 03_Analisis_AS-IS para el proyecto actual. Analisis tecnico exhaustivo de 10 secciones con evidencia del codigo fuente. Si el usuario proporciona "$ARGUMENTS", usarlos como contexto.

## PROTOCOLO

### CP-0 · Ingesta
1. Escanea TODO el codigo fuente, configs, manifiestos, tests, CI/CD, infra-as-code, docs, scripts, migrations, schemas.
2. Clasifica adjuntos: ADRs, postmortems, runbooks, diagramas C4, specs de API.
3. Declara hallazgos y gaps. Si gaps CRITICOS → solicita resolucion.

### CP-2 · Ejecucion (10 SECCIONES OBLIGATORIAS)
1. **Inventario Tecnologico** — stack completo: lenguajes, frameworks, librerias, versiones, LOC por lenguaje, edad, licencias relevantes. Minimo 5 tecnologias. [CODIGO] [CONFIG]
2. **Arquitectura C4** — Level 1 (Context) + Level 2 (Container). [CODIGO] [CONFIG] [DOC]
3. **Deuda Tecnica** — minimo 5 items: ubicacion, severidad, esfuerzo de resolucion, impacto. Clasificar por categoria (diseno, codigo, infra, test, doc). [CODIGO]
4. **Seguridad** — minimo 3 hallazgos: dependencias vulnerables, patrones inseguros, configs expuestas, OWASP Top 10. [CODIGO] [CONFIG]
5. **Calidad de Codigo** — complejidad ciclomatica, duplicacion, cobertura de tests, patrones/antipatrones, consistencia. [CODIGO]
6. **Infraestructura** — cloud/on-prem, contenedores, orquestacion, CI/CD, ambientes, deploy strategy. [CONFIG] [DOC]
7. **Observabilidad** — logging, monitoring, alerting, tracing, dashboards, SLIs/SLOs. [CONFIG] [CODIGO]
8. **Datos** — modelo de datos, schemas, migraciones, volumen, backup, consistencia, datos sensibles. [CODIGO] [CONFIG]
9. **Integraciones** — APIs consumidas/expuestas, protocolos, autenticacion, SLAs, puntos de falla, dependencias circulares. [CODIGO] [CONFIG]
10. **Recomendaciones Priorizadas** — top 10 por impacto/esfuerzo con T-shirt sizing. [INFERENCIA]

### CP-3 · Validacion
- [ ] Stack >=5 tecnologias con versiones
- [ ] Deuda >=5 items clasificados
- [ ] Seguridad >=3 hallazgos
- [ ] C4 Level 1 y 2 completos
- [ ] Cada seccion con evidencia taggeada
- [ ] Recomendaciones priorizadas por impacto/esfuerzo

## RESTRICCIONES
- Las 10 secciones son obligatorias. Secciones sin evidencia = gap explicito.
- Monorepo >5 servicios: priorizar top 3 por trafico/complejidad.
- Diagramas Mermaid: `C4Context` + `C4Container`.
