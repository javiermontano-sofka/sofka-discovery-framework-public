# State of the Art — Cross-Platform Skill Conversion (2024-2026)

## Tendencia 1: Convergencia de Formatos de Instrucción AI
Las plataformas de coding AI están convergiendo hacia formatos basados en Markdown con instrucciones declarativas. Cursor adoptó archivos `.mdc` (Markdown Components), Codex adoptó `AGENTS.md`, y Copilot usa Markdown instructions. Esta convergencia facilita la portabilidad. [INFERENCIA]

## Tendencia 2: Multi-Agent Skill Portability
Frameworks como CrewAI, AutoGen y LangGraph definen skills como configuraciones JSON/YAML que son inherentemente portátiles. La tendencia es hacia definiciones de skills agnósticas de plataforma que se compilan a formato nativo. [INFERENCIA]

## Tendencia 3: Plugin Marketplaces Cross-Platform
GitHub Marketplace, Cursor Directory y Claude Plugin Registry están creando ecosistemas de plugins. Skills bien estructurados pueden publicarse en múltiples marketplaces simultáneamente, multiplicando alcance. [SUPUESTO]

## Tendencia 4: Conversion-as-Code Pipelines
Equipos avanzados automatizan la conversión con scripts CI/CD que transpilan skills de un formato canónico a múltiples plataformas. Similar a cómo Sass compila a CSS, skill definitions compilan a formatos específicos. [INFERENCIA]

## Tendencia 5: Standard Skill Definition Language (SDL)
Iniciativas emergentes buscan definir un lenguaje estándar para instrucciones de asistentes AI, similar a cómo OpenAPI estandarizó APIs REST. Aún en etapa temprana pero con tracción en la comunidad open-source. [SUPUESTO]

## Implicaciones para PMO-APEX

| Tendencia | Impacto en APEX | Acción Recomendada |
|-----------|-----------------|-------------------|
| Convergencia de formatos | Conversión más sencilla | Mantener SKILL.md como formato canónico |
| Multi-agent portability | Skills reutilizables entre frameworks | Estructurar skills como configuraciones declarativas |
| Plugin marketplaces | Mayor distribución | Publicar en múltiples registros |
| Conversion pipelines | Automatización viable | Crear script de transpilación |
| SDL emergente | Futuro estándar | Monitorear y adaptar cuando madure |
