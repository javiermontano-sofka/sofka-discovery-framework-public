---
name: metodologia-dependency-analysis
description: >
  System and library dependency mapping, vulnerability scanning, upgrade risk assessment, and
  license compliance analysis. Use when the user asks to "map dependencies", "analyze dependency risk",
  "check license compliance", "assess upgrade risk", or mentions dependency graph, vulnerability scanning,
  or supply chain security.
author: Javier Montaño · Comunidad MetodologIA
version: 1.0.0
tags:
  - dependencies
  - security
  - vulnerabilities
  - license-compliance
  - supply-chain
  - moat
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - WebFetch
---

# Analisis de Dependencias

Mapeo exhaustivo de dependencias de sistema y librerias, con evaluacion de vulnerabilidades,
riesgo de upgrade y cumplimiento de licencias.

## TL;DR

- Construye grafo completo de dependencias directas y transitivas del sistema
- Identifica vulnerabilidades conocidas (CVEs) y evalua riesgo de supply chain
- Analiza compatibilidad de licencias y riesgos de compliance
- Evalua riesgo y esfuerzo de upgrades pendientes
- Genera plan de upgrade priorizado con estrategia de mitigacion

## Inputs

Parse `$1` como **nombre del proyecto**, `$2` como **repositorio o sistema a analizar**.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40%) | `tecnica` (full, default)

## Entregables

1. **Grafo de Dependencias** — Mapa visual de dependencias directas y transitivas (Mermaid)
2. **Matriz de Riesgo** — Vulnerabilidades, mantenibilidad, bus factor por dependencia
3. **Reporte de Licencias** — Inventario de licencias, compatibilidad, riesgos de compliance
4. **Plan de Upgrade** — Priorizacion de upgrades con estimacion de esfuerzo y riesgo
5. **Supply Chain Assessment** — Evaluacion de riesgo de cadena de suministro

## Proceso

1. **Extraccion de Dependencias** — Parsear manifiestos (package.json, pom.xml, build.gradle, requirements.txt, go.mod, Cargo.toml, etc.) para construir arbol completo
2. **Analisis de Profundidad** — Evaluar cada dependencia:
   | Factor | Indicador Sano | Indicador Riesgo |
   |---|---|---|
   | Ultima actualizacion | <6 meses | >18 meses |
   | Mantenedores activos | >3 | 1 (bus factor critico) |
   | Vulnerabilidades abiertas | 0 criticas | Cualquier CVE critica |
   | Versiones atrasadas | 0-1 major | >2 major versions |
3. **Scan de Vulnerabilidades** — Cruzar dependencias contra bases de datos CVE, identificar severity y exploitability
4. **Auditoria de Licencias** — Clasificar licencias (permissive, copyleft, proprietary), detectar incompatibilidades
5. **Evaluacion de Upgrade Risk** — Para cada upgrade pendiente: breaking changes, esfuerzo de migracion, dependencias afectadas
6. **Generacion de Plan** — Priorizar upgrades por riesgo de seguridad, luego mantenibilidad, luego features

## Criterios de Calidad

- [ ] 100% de dependencias directas inventariadas con version actual y latest
- [ ] Dependencias transitivas mapeadas al menos 3 niveles de profundidad
- [ ] Todas las CVEs criticas y altas documentadas con remediacion propuesta
- [ ] Matriz de compatibilidad de licencias completa
- [ ] Plan de upgrade con estimacion de esfuerzo en dias/persona
- [ ] Supply chain risks identificados con mitigacion
- [ ] Diagrama Mermaid del grafo de dependencias generado

## Edge Cases

| Escenario | Respuesta |
|---|---|
| Monorepo con multiples lenguajes | Analizar cada manifiesto por separado, consolidar riesgos |
| Dependencias internas (private registry) | Documentar como gap, evaluar con informacion disponible |
| Dependencia abandonada sin alternativa | Flag como riesgo critico, proponer fork o rewrite |
| Licencia ambigua o custom | Flag para revision legal, no asumir compatibilidad |

## Output Artifact

**Primary:** `Dependency_Analysis_{project}.md` — Grafo, matriz de riesgo, plan de upgrade.

### Diagramas (Mermaid)
- Graph: arbol de dependencias con colores por riesgo
- Heatmap table: matriz de riesgo por dependencia

---
**Autor:** Javier Montaño · Comunidad MetodologIA | **Version:** 1.0.0
