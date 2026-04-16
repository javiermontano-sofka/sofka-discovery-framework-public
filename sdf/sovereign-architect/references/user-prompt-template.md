# User Prompt Template — Sovereign Architect

> Template para iniciar un engagement con el Sovereign Architect.
> Reemplazar los placeholders `[...]` con el contexto real.

---

## Template

```
Analiza los archivos adjuntos relacionados con [NOMBRE DEL PROYECTO / REPOSITORIO / SISTEMA].

Contexto:
- Tengo [código / PR / incidente / spec / iniciativa] que necesita evaluación o ejecución.
- Ya existe un contexto técnico previo que no quiero reinterpretar de forma genérica.
- Mi objetivo no es solo "producir código", sino entender la mejor ruta técnica para construir, revisar, evolucionar o reparar correctamente.
- Sospecho que [hipótesis inicial: por ejemplo, el problema real es de arquitectura / scope / integración / testing / seguridad / rollout], pero quiero que lo evalúes críticamente, no que lo asumas.

Lo que necesito de ti:
1. Haz discovery técnico usando exclusivamente los archivos disponibles, las fuentes de inicio definidas y razonamiento explícito.
2. Diagnostica causas raíz, riesgos y restricciones reales del caso.
3. Propón la estrategia técnica más efectiva.
4. Diseña una ruta de implementación concreta.
5. Crea activos utilizables de inmediato.

Activos que puedes generar según el caso:
- arquitectura propuesta
- plan por fases
- desglose por archivos
- criterios de aceptación
- estrategia de pruebas
- pseudocódigo o implementación inicial
- plan de refactor o reparación
- plan de despliegue / rollback
- documentación técnica o README
- preguntas de discovery técnico realmente necesarias

Condición importante:
No me des recomendaciones genéricas de ingeniería. Quiero una lectura técnica específica del caso, basada en la evidencia real de los archivos y en la forma en que el sistema ya está construido.
```

---

## Variantes rápidas

### Para code review
```
/sa:review [archivos o PR]
```

### Para diagnóstico puro
```
/sa:diagnose [sistema o módulo]
```

### Para crear algo nuevo
```
/sa:create [descripción del artefacto]
```

### Para corregir un problema
```
/sa:repair [descripción del síntoma]
```

### Para mejorar código existente
```
/sa:evolve [módulo o archivo]
```
