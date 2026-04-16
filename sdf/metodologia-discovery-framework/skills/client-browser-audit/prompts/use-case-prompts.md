# Client Browser Audit — Use Case Prompts

## Caso de Uso 1: Auditoria de Configuracion de Herramienta PM

**Contexto**: Nueva configuracion de herramienta PM o revision periodica de gobernanza.

**Prompt Template**:
```
Navega a {TOOL_URL} y audita la configuracion de la herramienta PM
contra las mejores practicas para {METHODOLOGY}.

Verifica:
1. Columnas del board coinciden con estados del workflow
2. Campos personalizados estan poblados y son consistentes
3. Permisos son correctos por rol
4. Dashboards muestran datos precisos y actualizados
5. Integraciones estan funcionando

Captura screenshots de cada hallazgo.
Genera reporte de auditoria con pass/fail por criterio.
Clasifica hallazgos por severidad (Critico/Alto/Medio/Bajo).
```

**Output esperado**: Reporte de auditoria con screenshots anotados, scorecard de conformidad, y plan de remediacion priorizado. [PLAN]

## Caso de Uso 2: Validacion de Dashboard para Stakeholders

**Contexto**: Antes de steering committee o demo a cliente, verificar precision de dashboards.

**Prompt Template**:
```
Abre {DASHBOARD_URL} y valida todas las metricas mostradas contra
los datos fuente {SOURCE_DATA}.

Verifica:
1. Frescura de datos (timestamp <24h)
2. Precision de calculos (delta <1%)
3. Graficos sin errores de renderizado
4. Layout responsivo en desktop y tablet
5. Funcionalidad de export a PDF/Excel

Genera reporte de validacion con screenshots.
```

**Output esperado**: Reporte de validacion con comparacion dato-por-dato, screenshots de discrepancias, y estado de frescura por widget. [METRIC]

## Caso de Uso 3: Auditoria de Accesibilidad WCAG

**Contexto**: Seleccion de herramienta PM o auditoria de compliance.

**Prompt Template**:
```
Ejecuta auditoria de accesibilidad en {URLS} contra el estandar {STANDARD}.

Reporta violaciones por severidad (critico, serio, moderado, menor).
Proporciona recomendaciones de remediacion para issues criticos y serios.
Incluye Lighthouse scores.
Verifica navegacion por teclado y compatibilidad con screen reader.
```

**Output esperado**: Reporte de accesibilidad con violaciones categorizadas, recommendations, y Lighthouse scores. [METRIC]

## Caso de Uso 4: Auditoria Comparativa Multi-Herramienta

**Contexto**: Evaluacion de multiples herramientas PM para seleccion o migracion.

**Prompt Template**:
```
Audita y compara {TOOLS_LIST} para el proyecto {PROJECT_NAME}
con metodologia {METHODOLOGY}.

Para cada herramienta evalua:
1. Soporte de workflow para la metodologia
2. Calidad de dashboards y reportes
3. Accesibilidad (WCAG 2.2 AA)
4. Rendimiento (tiempos de carga)
5. Integraciones disponibles

Genera matriz comparativa con scores normalizados.
```

**Output esperado**: Matriz comparativa con scores 1-5 por criterio, screenshots de cada herramienta, y recomendacion con rationale. [PLAN]

*PMO-APEX v1.0 — Use Case Prompts - Client Browser Audit*
