# Client Browser Audit — Body of Knowledge

## 1. Fundamentos de Auditoria Visual de Herramientas PM

La auditoria visual de herramientas PM mediante automatizacion de navegador cierra la brecha entre la configuracion tecnica y la experiencia real del usuario. Lo que el stakeholder ve en su pantalla es la realidad del proyecto para el. [DOC]

### 1.1 Dominios de Auditoria

| Dominio | Que Auditar | Herramientas | Criterio de Exito |
|---------|-------------|--------------|-------------------|
| Configuracion de Tool | Boards, workflows, campos, estados | Playwright, MCP Browser [METRIC] | Alineado con metodologia |
| Dashboards de Stakeholders | Precision de datos, frescura, navegacion | MCP Browser tools [STAKEHOLDER] | Datos <24h de antiguedad |
| Accesibilidad | Conformidad WCAG 2.2 de artefactos PM | axe-core, Lighthouse [METRIC] | Nivel AA minimo |
| Rendimiento | Tiempos de carga, responsividad | Lighthouse, WebPageTest [METRIC] | <3 segundos de carga |
| Seguridad de Permisos | Control de acceso por rol | Navegacion con diferentes roles [PLAN] | Sin data leaks |
| Integridad de Datos | Consistencia entre fuente y display | Comparacion automatizada [METRIC] | Delta <1% |

### 1.2 Checklist de Auditoria por Herramienta

#### Jira
| Area | Verificacion | Severidad |
|------|-------------|-----------|
| Board Columns | Coinciden con workflow states | Critico [PLAN] |
| Swimlanes | Configurados por equipo/tipo | Medio [PLAN] |
| Custom Fields | Poblados y consistentes | Alto [METRIC] |
| Sprint Configuration | Duracion, velocity tracking | Alto [METRIC] |
| Dashboard Filters | Correctos y actualizados | Medio [METRIC] |
| Permissions | Por proyecto y rol | Critico [STAKEHOLDER] |

#### Azure DevOps
| Area | Verificacion | Severidad |
|------|-------------|-----------|
| Work Item Types | Definidos segun metodologia | Critico [PLAN] |
| Board Customization | Columnas, estados, reglas | Alto [PLAN] |
| Pipeline Integration | CI/CD vinculado a work items | Medio [METRIC] |
| Wiki/Docs | Documentacion del proyecto accesible | Medio [DOC] |
| Analytics Views | Dashboards de burndown y velocity | Alto [METRIC] |

#### Monday.com / Asana / ClickUp
| Area | Verificacion | Severidad |
|------|-------------|-----------|
| Board Structure | Grupos y columnas alineados a proceso | Critico [PLAN] |
| Automations | Reglas activas y funcionales | Alto [PLAN] |
| Integrations | Sincronizacion con otras herramientas | Medio [METRIC] |
| Views | Gantt, Kanban, Timeline configurados | Medio [PLAN] |
| Dashboards | Widgets actualizados y precisos | Alto [METRIC] |

### 1.3 Patrones de Automatizacion

| Patron | Caso de Uso | Implementacion |
|--------|------------|----------------|
| Screenshot comparison | Regression visual de dashboards | Playwright screenshot API [METRIC] |
| Data extraction | Scraping de metricas para validacion | DOM queries via MCP [METRIC] |
| Form testing | Validar workflows de input | Fill + submit automatizado [PLAN] |
| Link checking | Verificar navegacion funcional | Crawl + verify responses [METRIC] |
| Role-based audit | Verificar permisos por rol | Login con diferentes credenciales [STAKEHOLDER] |

## 2. Escalas de Severidad de Hallazgos

| Severidad | Criterio | Accion Requerida | SLA |
|-----------|----------|-----------------|-----|
| Critico | Dato incorrecto visible a stakeholders, brecha de seguridad | Correccion inmediata | 24h [SCHEDULE] |
| Alto | Funcionalidad rota, dato desactualizado >48h | Correccion esta semana | 5 dias [SCHEDULE] |
| Medio | UX deficiente, datos parcialmente correctos | Planificar correccion | 2 sprints [PLAN] |
| Bajo | Cosmetico, mejora menor | Backlog | Sin SLA [PLAN] |

## 3. Protocolo MCP Playwright para Auditorias

| Paso | Accion MCP | Proposito |
|------|-----------|-----------|
| 1 | `browser_navigate` | Navegar a URL de la herramienta |
| 2 | `browser_snapshot` | Capturar estado inicial del DOM |
| 3 | `browser_take_screenshot` | Evidencia visual |
| 4 | `browser_click` + `browser_fill_form` | Interaccion con elementos |
| 5 | `browser_evaluate` | Extraer datos del DOM para validacion |
| 6 | `browser_console_messages` | Detectar errores JavaScript |
| 7 | `browser_network_requests` | Verificar APIs y tiempos de respuesta |

## 4. Referencias Normativas

| Fuente | Documento | Relevancia |
|--------|-----------|------------|
| W3C | WCAG 2.2 | Estandares de accesibilidad |
| Google | Lighthouse Documentation | Auditoria de rendimiento |
| Playwright | MCP Integration Guide | Automatizacion de navegador |
| Atlassian | Jira Admin Best Practices | Configuracion optima de Jira |
| Microsoft | Azure DevOps Best Practices | Configuracion optima de ADO |
| OWASP | Testing Guide | Seguridad de aplicaciones web |

*PMO-APEX v1.0 — Body of Knowledge - Client Browser Audit*
