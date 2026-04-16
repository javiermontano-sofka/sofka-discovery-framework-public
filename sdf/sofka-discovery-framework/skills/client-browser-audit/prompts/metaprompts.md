# Client Browser Audit — Metaprompts

## Metaprompt 1: Bias Check — Perspectiva del Stakeholder

```
Revisa la auditoria desde la perspectiva de cada rol de stakeholder:

1. **Executive**: Ve la informacion de alto nivel que necesita para decidir?
   Puede encontrarla en ≤3 clicks?
2. **PM**: Tiene acceso a todos los datos operativos? Los filtros son utiles?
3. **Team Member**: El board refleja su workflow real? Es intuitivo?
4. **External Stakeholder**: Puede ver solo lo que debe ver? Datos sensibles
   estan protegidos?

Para cada rol:
- Documenta puntos de friccion encontrados
- Evalua usabilidad 1-5
- Identifica data leaks potenciales (datos sensibles visibles al rol equivocado)
```

## Metaprompt 2: Progressive Disclosure — Profundidad de Auditoria

```
Adapta la profundidad de la auditoria segun el contexto:

**Quick Check (15 min)**: Pre-demo o pre-steering
- Frescura de datos en widgets principales
- Errores visuales obvios
- Funcionalidad de navegacion basica

**Standard Audit (1h)**: Revision periodica de gobernanza
- Frescura y precision de todos los widgets
- Permisos por rol
- Accesibilidad basica
- Screenshots de hallazgos

**Deep Audit (4h+)**: Seleccion de herramienta o compliance
- Todas las verificaciones standard
- WCAG 2.2 AA completo
- Performance testing
- Cross-device validation
- Integridad de datos contra fuentes
- Reporte completo con roadmap de remediacion

Ejecuta nivel {DEPTH} para {TOOL_URL}.
```

## Metaprompt 3: Validation — Completitud de la Auditoria

```
Valida que la auditoria cubre todos los criterios requeridos:

[ ] Cada hallazgo respaldado por ≥1 screenshot o captura de configuracion
[ ] Issues clasificados por severidad (Critico/Alto/Medio/Bajo) con criterio consistente
[ ] ≥80% de hallazgos incluyen instrucciones de remediacion paso a paso
[ ] Scorecard de conformidad producido por seccion auditada
[ ] Ningun hallazgo sin vinculo a best practice especifica violada
[ ] Issues Criticos y Altos con prioridad de remediacion y esfuerzo estimado
[ ] Roadmap de optimizacion con fases ordenadas por severidad y dependencia
[ ] Reporte accionable tanto por PM leads como por administradores de herramienta
[ ] Criterios de auditoria alineados con metodologia declarada del proyecto
[ ] Impacto de misconfiguraciones en delivery cuantificado donde sea posible

Si algun criterio falla, completa la seccion faltante.
```

*PMO-APEX v1.0 — Metaprompts - Client Browser Audit*
