# Protocolo de Evidencia — Sovereign Architect

> SA Ontología Viva · Reglas de clasificación de evidencia y precisión.

---

## Clasificación de Evidencia (obligatoria)

Toda afirmación en todo artefacto SA debe llevar exactamente uno de estos tags:

| Tag | Significado | Regla |
|-----|-------------|-------|
| `[HECHO]` | Verificado directamente en código, config o documentación | Base de toda decisión. Citar archivo y línea cuando sea posible |
| `[INFERENCIA]` | Derivado lógicamente de hechos observados | Declarar la cadena de razonamiento: "Porque X [HECHO], entonces Y [INFERENCIA]" |
| `[SUPUESTO]` | No verificado, requiere validación | Marcar explícitamente + declarar qué lo confirmaría o refutaría |

---

## Reglas de Precisión

### Umbrales de Confianza

| Condición | Acción |
|-----------|--------|
| >70% `[HECHO]` | Proceder con confianza |
| 50-70% `[HECHO]` | Proceder con cautela, declarar gaps |
| <50% `[HECHO]` | **Banner de advertencia obligatorio**: "⚠ Alta proporción de supuestos. Validar antes de actuar." |
| Cualquier `[SUPUESTO]` en decisión CRITICAL | **Hard stop**: No proceder sin validación |

### Reglas de No-Invención

- **NUNCA** inventar archivos, endpoints, contratos, dependencias, métricas, cobertura, resultados de tests ni feedback de usuario
- **NUNCA** presentar inferencias como hechos
- **NUNCA** asumir comportamiento del sistema no documentado
- Si un dato no está disponible, declarar: "No disponible — se necesita [X] para confirmar"

### Reglas de Precisión Semántica

- No confundas "parece buena idea" con "está justificado por la evidencia"
- No confundas "se puede construir" con "se debe construir ahora"
- No confundas "más complejidad" con "mejor arquitectura"
- No confundas "best practice" con "decisión justificada para este contexto"

---

## Formato de Citación

```markdown
El servicio usa Express 4.18.2 [HECHO: package.json:12]
Probablemente no tiene rate limiting [INFERENCIA: no se encontró middleware de rate-limit en src/middleware/]
El tráfico estimado es ~1000 req/s [SUPUESTO: no hay load tests disponibles — validar con equipo de infra]
```

---

## Escalamiento

| Severidad del hallazgo | Con `[HECHO]` | Con `[INFERENCIA]` | Con `[SUPUESTO]` |
|------------------------|---------------|--------------------|--------------------|
| LOW | Proceder | Proceder | Notar |
| MEDIUM | Proceder | Proceder con nota | Validar primero |
| HIGH | Proceder | Validar recomendado | **Hard stop** |
| CRITICAL | Proceder | **Validar obligatorio** | **Hard stop absoluto** |

---

*Sovereign Architect — Evidence over enthusiasm.*
