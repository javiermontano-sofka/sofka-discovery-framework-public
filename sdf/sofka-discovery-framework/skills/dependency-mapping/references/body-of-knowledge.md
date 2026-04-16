# Body of Knowledge — Cross-Project Dependency Mapping

## Marco Teórico

La gestión de dependencias entre proyectos es una disciplina de portfolio management que identifica, clasifica, monitorea y mitiga las relaciones de dependencia entre entidades de trabajo (proyectos, equipos, sistemas, vendors). Las dependencias no gestionadas son la causa #1 de retrasos en portfolios multi-proyecto.

## Taxonomía de Dependencias

| Tipo | Definición | Ejemplo | Riesgo |
|------|-----------|---------|--------|
| Finish-to-Start (FS) | B no puede iniciar hasta que A termine | Integración después de desarrollo | Alto — bloqueo directo |
| Start-to-Start (SS) | B no puede iniciar hasta que A inicie | Desarrollo paralelo con diseño | Medio — coordinación |
| Finish-to-Finish (FF) | B no puede terminar hasta que A termine | Testing depende de desarrollo | Medio — sincronización |
| Start-to-Finish (SF) | B no puede terminar hasta que A inicie | Cutover depende de go-live | Bajo — raro |

## Clasificación por Naturaleza

| Categoría | Descripción | Ejemplos |
|-----------|-------------|----------|
| Data | Proyecto B necesita datos/output de A | API, migración, ETL |
| Resource | Mismo recurso necesario en A y B | Arquitecto compartido |
| Technology | B depende de plataforma/servicio de A | Infraestructura, middleware |
| Deliverable | B necesita un entregable de A | Documento, componente, módulo |
| Decision | B está bloqueado por decisión pendiente en A | Aprobación de diseño |
| External | Dependencia de vendor/regulador externo | Licencia, certificación |

## Métricas de Dependency Health

```
Dependency Density = Total_Dependencies / Total_Projects
Dependency Risk Index = Σ(Probability_i × Impact_i) / Total_Dependencies
Circular Dependency Count = Cycles detected in dependency graph
Unmanaged Dependency Rate = Unmanaged / Total_Dependencies

Targets:
  Density < 3.0 (avg dependencies per project)
  Risk Index < 0.4 (scale 0-1)
  Circular Count = 0
  Unmanaged Rate = 0%
```

## Dependency Matrix

```
          Proj-A  Proj-B  Proj-C  Proj-D
Proj-A      -      FS      -       SS
Proj-B      -       -      FS       -
Proj-C     FF       -       -      FS
Proj-D      -       -       -       -

Lectura: fila depende de columna
Proj-A depende FS de Proj-B (Proj-B debe terminar antes que Proj-A inicie)
```

## Detección de Ciclos

Un ciclo (dependencia circular) ocurre cuando A→B→C→A. Detección algorítmica:
1. Modelar dependencias como grafo dirigido
2. Ejecutar DFS (Depth-First Search) para detectar back edges
3. Cada back edge indica un ciclo
4. Resolver: romper el eslabón más débil o introducir intermediate deliverable

## Estrategias de Mitigación

| Estrategia | Cuándo Usar | Costo |
|------------|------------|-------|
| Buffer temporal | Dependencia con deadline flexible | Bajo |
| Parallel work streams | Dependencia FS que puede ser SS | Medio |
| Intermediate deliverable | Romper dependencia larga | Medio |
| Resource duplication | Dependencia de recurso compartido | Alto |
| Vendor acceleration | Dependencia externa en critical path | Alto |
| Scope restructuring | Dependencia circular | Variable |

## Herramientas de Visualización

| Herramienta | Formato | Fortaleza |
|-------------|---------|-----------|
| Mermaid flowchart | Code-based | Integrado en APEX, versionable |
| DSM (Design Structure Matrix) | Tabla N×N | Detecta clusters y ciclos |
| Network diagram | Nodos y aristas | Visual para presentaciones |
| Gantt con dependencias | Timeline | Muestra impacto en schedule |

## Estándares Relevantes

- **PMBOK 7th**: Dependency management como práctica de schedule management
- **SAFe 6.0**: Program board dependencies, cross-ART dependencies
- **PMI Standard for Program Management**: Inter-project dependency coordination
- **PRINCE2**: Stage boundaries y external dependencies
