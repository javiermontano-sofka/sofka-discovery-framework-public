# 10 Categorías de Fricción Técnica — Sovereign Architect

> SA Ontología Viva · Framework de detección de fricción en sistemas de software.

---

## Las 10 Categorías

El diagnostic-engine y todos los especialistas SA escanean estas 10 categorías sistemáticamente.

### 1. Ambigüedad

**Qué buscar**: Requisitos poco claros, comportamiento indefinido en edge cases, contratos implícitos entre módulos.

| Señal | Severidad |
|-------|-----------|
| Funciones sin documentación de contrato (inputs/outputs/errors) | MEDIUM |
| Edge cases no manejados (null, empty, overflow) | HIGH |
| Comportamiento que depende de orden de ejecución no declarado | HIGH |
| TODOs sin ticket asociado | LOW |

### 2. Deuda Técnica

**Qué buscar**: Shortcuts acumulados, patterns obsoletos, versiones desactualizadas.

| Señal | Severidad |
|-------|-----------|
| Dependencies con >2 major versions de atraso | HIGH |
| Patterns deprecated usados extensivamente | MEDIUM |
| Copy-paste code (>3 instancias del mismo bloque) | MEDIUM |
| Workarounds documentados con "temporary" que tienen >6 meses | HIGH |
| TODOs y HACKs en código sin fecha ni owner | LOW |

### 3. Acoplamiento

**Qué buscar**: Dependencias excesivas entre módulos, god objects, referencias circulares.

| Señal | Severidad |
|-------|-----------|
| Archivo importado por >50% del codebase | HIGH |
| Dependencias circulares entre módulos | CRITICAL |
| God class (>500 líneas, >10 responsabilidades) | HIGH |
| Cambiar un módulo requiere cambiar >3 otros | MEDIUM |

### 4. Seguridad

**Qué buscar**: OWASP Top 10, secrets expuestos, authentication/authorization gaps.

| Señal | Severidad |
|-------|-----------|
| Secrets hardcoded (API keys, passwords, tokens) | CRITICAL |
| SQL injection, XSS, command injection vectors | CRITICAL |
| Auth bypass posible (missing middleware, broken access control) | CRITICAL |
| Dependencies con CVEs conocidos | HIGH |
| CORS permisivo (`*`) en producción | HIGH |
| Datos sensibles en logs | HIGH |

### 5. Testing Gaps

**Qué buscar**: Paths sin tests, edge cases no cubiertos, tests frágiles.

| Señal | Severidad |
|-------|-----------|
| Módulos críticos (auth, payments, data) sin tests | CRITICAL |
| Coverage <50% en paths de negocio | HIGH |
| Tests que dependen de estado externo (DB, API, tiempo) | MEDIUM |
| Tests flaky (pasan intermitentemente) | MEDIUM |
| Mocks que no reflejan el contrato real | HIGH |

### 6. Mantenibilidad

**Qué buscar**: Complejidad excesiva, magic numbers, decisiones no documentadas.

| Señal | Severidad |
|-------|-----------|
| Funciones >50 líneas | MEDIUM |
| Complejidad ciclomática >10 | HIGH |
| Magic numbers/strings sin constantes | LOW |
| Naming inconsistente entre módulos | MEDIUM |
| Abstracciones prematuras (generics innecesarios) | MEDIUM |

### 7. Observabilidad

**Qué buscar**: Logging ausente, métricas faltantes, failures silenciosos.

| Señal | Severidad |
|-------|-----------|
| Catch blocks vacíos o con solo `console.log` | HIGH |
| No hay health checks | MEDIUM |
| Error responses genéricos (500 sin detalle) | MEDIUM |
| No hay tracing distribuido en sistema multi-servicio | HIGH |
| Alertas inexistentes para paths críticos | HIGH |

### 8. Performance

**Qué buscar**: N+1 queries, loops sin bounds, caching ausente.

| Señal | Severidad |
|-------|-----------|
| N+1 queries en loops sobre colecciones | HIGH |
| Loops sobre datasets sin límite (`findAll()` sin pagination) | HIGH |
| No hay caching en datos frecuentemente leídos | MEDIUM |
| Sync operations bloqueantes en paths de request | HIGH |
| Bundle size >1MB sin code splitting | MEDIUM |

### 9. Developer Experience (DX)

**Qué buscar**: Fricción en onboarding, tooling roto, documentación desactualizada.

| Señal | Severidad |
|-------|-----------|
| README no explica cómo correr el proyecto | HIGH |
| Setup requiere >10 pasos manuales | MEDIUM |
| Dev scripts rotos o no documentados | MEDIUM |
| .env.example ausente o incompleto | HIGH |
| No hay linter/formatter configurado | LOW |

### 10. Deployment

**Qué buscar**: Ausencia de rollback, migraciones riesgosas, feature flags faltantes.

| Señal | Severidad |
|-------|-----------|
| No hay rollback strategy documentada | HIGH |
| Migraciones de DB destructivas sin backup | CRITICAL |
| Deploy manual sin CI/CD | HIGH |
| No hay feature flags para features grandes | MEDIUM |
| Configuración hardcoded por environment | MEDIUM |

---

## Uso en Diagnóstico

El `friction-detector` skill escanea las 10 categorías y produce:

```markdown
## Fricciones Técnicas Detectadas

| # | Categoría | Hallazgo | Severidad | Evidencia |
|---|-----------|----------|-----------|-----------|
| 1 | Seguridad | API key de Stripe en .env committed | CRITICAL | [HECHO: .env:3] |
| 2 | Testing | Auth module sin tests | HIGH | [HECHO: 0 files in __tests__/auth/] |
| 3 | DX | README no menciona Docker setup | MEDIUM | [HECHO: README.md] |
```

---

*Sovereign Architect — Friction is signal. Detect it, don't ignore it.*
