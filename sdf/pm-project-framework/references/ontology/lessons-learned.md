# Lecciones Aprendidas

> PMO-APEX — Ontologia viva
> Documento vivo que se actualiza durante las sesiones de proyecto con correcciones, patrones y decisiones.

---

## Correcciones recibidas

<!-- Registrar aqui correcciones explicitas del usuario sobre comportamiento, formato, contenido o proceso. Formato: fecha, correccion, accion tomada. -->

_(vacio — se actualiza durante sesiones)_

---

## Patrones identificados

<!-- Registrar aqui patrones recurrentes observados en multiples sesiones de proyecto: preferencias del usuario, configuraciones frecuentes, flujos tipicos, decisiones comunes, metodologias preferidas. -->

_(vacio — se actualiza durante sesiones)_

---

## Anti-patrones a evitar

<!-- Registrar aqui comportamientos que generaron problemas o fueron explicitamente rechazados por el usuario. Incluir contexto para evitar repeticion. -->

_(vacio — se actualiza durante sesiones)_

---

## Decisiones del usuario

<!-- Registrar aqui decisiones explicitas del usuario que establecen precedente para futuras sesiones: preferencias de formato, tipo de proyecto predeterminado, nivel de detalle, exclusiones, metodologia preferida. -->

_(vacio — se actualiza durante sesiones)_

---

## Patrones de estimacion

<!-- Registrar aqui calibraciones de estimacion: cuando las estimaciones fueron muy optimistas o pesimistas, factores de ajuste aprendidos, contextos donde ciertas tecnicas funcionan mejor. -->

_(vacio — se actualiza durante sesiones)_

---

## Patrones de riesgo

<!-- Registrar aqui riesgos que se materializaron y su impacto real vs estimado, riesgos recurrentes que deberian estar en todo risk register, falsos positivos frecuentes. -->

_(vacio — se actualiza durante sesiones)_

---

## Instrucciones de uso

Este documento es un registro acumulativo. Las entradas se agregan al final de cada seccion correspondiente con el siguiente formato:

```markdown
### [{fecha}] {titulo breve}
- **Contexto:** {situacion que motivo el aprendizaje}
- **Aprendizaje:** {que se aprendio o corrigio}
- **Accion:** {que cambio se implemento o debe implementarse}
- **Categoria:** {Correccion | Patron | Anti-patron | Decision | Estimacion | Riesgo}
```

El `project-conductor` debe consultar este documento al inicio de cada sesion para evitar repetir errores y respetar decisiones previas del usuario.

### Reglas de actualizacion

1. **Trigger automatico:** Cada vez que el usuario corrige explicitamente un comportamiento del sistema
2. **Trigger manual:** Cuando se identifica un patron recurrente durante el proyecto
3. **Revision periodica:** Al inicio de cada sesion, revisar las ultimas 5 entradas
4. **No borrar:** Las entradas son acumulativas. Si un aprendizaje se invalida, marcarlo como `[SUPERADO]` con fecha
5. **Cross-reference:** Vincular a decision-log.md cuando la leccion genero un cambio formal

---

*PMO-APEX — La excelencia en gestion de proyectos se construye con evidencia.*
