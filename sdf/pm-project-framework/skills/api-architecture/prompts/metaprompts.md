# Metaprompts — API Architecture

> Meta-level strategies to maximize the effectiveness of this skill.
> Metaprompts don't produce deliverables — they optimize HOW they are produced.

---

## 1. Consumer-Centric Design Validation

**Purpose:** Before finalizing any API design, systematically walk through the experience from each consumer type's perspective to detect friction points invisible from the producer side.

```
Para cada tipo de consumidor identificado, simula el flujo completo de integracion:

CONSUMIDOR: {tipo} (ej: frontend SPA, mobile app, partner backend, internal service)

PASO 1 — Descubrimiento:
- Como encuentra el consumidor esta API? (portal, docs, Slack, preguntando)
- La documentacion es suficiente para entender que hace sin leer codigo?
- Hay getting started guide especifico para este tipo de consumidor?

PASO 2 — Onboarding (Time-to-First-Call):
- Cuantos pasos necesita para obtener credenciales?
- Puede hacer su primera llamada exitosa en <5 minutos?
- Si falla, el error message le dice EXACTAMENTE que hacer?
- Necesita contactar a alguien para empezar? (friction point critico)

PASO 3 — Integracion:
- El SDK en su lenguaje esta disponible y actualizado?
- Los tipos son suficientes para autocompletar en su IDE?
- La paginacion es intuitiva? (cursor-based vs offset)
- Los filtros cubren sus casos de uso comunes?
- Las respuestas incluyen datos suficientes o necesita N llamadas adicionales?

PASO 4 — Error Handling:
- Los errores siguen RFC 9457? Son accionables?
- El retry behavior esta claro? (429 con Retry-After?)
- Los edge cases estan documentados? (rate limits, timeouts, max payload)

PASO 5 — Evolucion:
- Como se entera de cambios? (changelog, email, webhook?)
- Los breaking changes tienen aviso con suficiente anticipacion?
- La migracion entre versiones tiene guia paso a paso?

RESULTADO:
- Score de friction por paso (1-5, donde 1 es sin friccion)
- Blockers que impiden adopcion
- Quick wins de DX implementables en <1 semana
- Comparacion con APIs best-in-class del sector (Stripe, Twilio)

Si el TTFC estimado es >10 minutos para CUALQUIER tipo de consumidor, es un issue critico.
```

---

## 2. Contract Evolution Stress Test

**Purpose:** Validate that the versioning strategy and API contracts support 3 common change scenarios without breaking existing consumers.

```
Toma el contrato de API actual y aplica estos escenarios de evolucion:

ESCENARIO 1 — Cambio aditivo (no-breaking):
- Agregar un campo opcional a un response: {nuevo_campo}
- Verificar: consumidores existentes ignoran el campo nuevo? (si usan additionalProperties: false, NO)
- Verificar: schema registry lo acepta como backward-compatible?
- Verificar: SDK regenerado compila sin cambios en codigo consumidor?
- Resultado esperado: deploy sin coordinacion con consumidores

ESCENARIO 2 — Cambio breaking controlado:
- Renombrar un campo existente: {campo_viejo} → {campo_nuevo}
- Verificar: la estrategia de versionamiento soporta coexistencia? (v1 y v2 simultaneos)
- Verificar: hay schema-diff en CI que alerta ANTES del merge?
- Verificar: la deprecation policy se activa automaticamente? (Sunset header)
- Verificar: existe migration guide template para consumidores?
- Resultado esperado: nueva version publicada, consumidores migran en ventana definida

ESCENARIO 3 — Cambio de tipo de dato:
- Cambiar un campo de string a object: {campo}: "value" → {campo}: { "type": "...", "value": "..." }
- Verificar: es SIEMPRE un breaking change? (si)
- Verificar: la estrategia permite "expand and contract" (period con ambos formatos)?
- Verificar: los contract tests (Pact) detectan la incompatibilidad?
- Resultado esperado: breaking change gestionado con versionamiento + migration period

Para cada escenario:
1. Tiempo de deteccion del impacto (CI: segundos, manual: dias)
2. Num de consumidores impactados (si se puede determinar)
3. Costo de coordinacion (self-service migration vs manual outreach)
4. Risk de downtime durante la transicion

Si NINGUN escenario se detecta automaticamente en CI, la gobernanza de contratos es insuficiente.
```

---

## 3. API Style Decision Framework

**Purpose:** When the design requires selecting between REST, GraphQL, gRPC, or AsyncAPI, apply a systematic framework that avoids technology bias and relies on measurable criteria.

```
Para cada superficie de API identificada, evalua contra estos criterios:

SUPERFICIE: {nombre} (ej: "API de catalogo de productos", "servicio de notificaciones")

CRITERIO 1 — Consumidores:
- Cuantos tipos de consumidores? (1 = gRPC viable, N = REST/GraphQL)
- Son browser-based? (gRPC descartado sin grpc-web)
- Necesitan queries flexibles? (GraphQL gana)
- Son server-to-server? (gRPC optimiza latencia)

CRITERIO 2 — Patron de datos:
- CRUD simple? → REST (resource-oriented)
- Queries complejas con relaciones? → GraphQL (reduce round-trips)
- Binario o alto throughput? → gRPC (serialization efficient)
- Event-driven o async? → AsyncAPI (webhooks, streaming)

CRITERIO 3 — Performance requirements:
- Latencia target: {ms} p99
- Throughput: {RPS}
- Payload size: {KB promedio}
- Caching criticality: alta (REST con HTTP cache) / baja (gRPC/GraphQL ok)

CRITERIO 4 — Operacional:
- Tooling del equipo: que conocen? (REST universalmente conocido)
- Debugging: REST (curl) > GraphQL (playground) > gRPC (reflection + grpcurl)
- Monitoring: REST (standard HTTP metrics) > GraphQL (field-level) > gRPC (interceptors)

CRITERIO 5 — Lifecycle:
- Duracion estimada de la API: {anos}
- Frecuencia de cambios: {cambios/trimestre}
- Num de consumidores proyectado a 2 anos: {N}
- Public exposure plan: si/no

SCORING:
| Criterio | REST | GraphQL | gRPC | AsyncAPI |
|----------|------|---------|------|----------|
| C1       | ?/5  | ?/5     | ?/5  | ?/5      |
| C2       | ?/5  | ?/5     | ?/5  | ?/5      |
| C3       | ?/5  | ?/5     | ?/5  | ?/5      |
| C4       | ?/5  | ?/5     | ?/5  | ?/5      |
| C5       | ?/5  | ?/5     | ?/5  | ?/5      |
| TOTAL    | ?/25 | ?/25    | ?/25 | ?/25     |

DECISION: {estilo} porque {justificacion con scores}.
ADR: documentar la decision con todas las alternativas evaluadas.

Reglas:
- NUNCA elegir GraphQL "porque esta de moda" — debe resolver over/under-fetching real
- NUNCA descartar gRPC por "no lo conocemos" — el codegen reduce la curva
- REST es el default seguro — requiere evidencia para desviarse, no al reves
- Combinaciones son validas: REST para publico + gRPC para interno + AsyncAPI para eventos
```

---

## 4. Governance Maturity Assessment

**Purpose:** Assess the current state of the client's API governance to prioritize improvement investments with the highest impact.

```
Evaluar la madurez de gobernanza de APIs en 5 niveles:

NIVEL 1 — Ad Hoc (sin gobernanza):
- [ ] No hay catalogo de APIs
- [ ] No hay style guide
- [ ] No hay design review
- [ ] Cada equipo elige su propio estilo
- [ ] No hay metricas de uso ni salud

NIVEL 2 — Reactivo (gobernanza post-facto):
- [ ] Existe un catalogo informal (wiki, spreadsheet)
- [ ] Hay guidelines escritas pero no enforced
- [ ] Design review ocurre pero no es obligatorio
- [ ] Metricas basicas de uptime

NIVEL 3 — Proactivo (gobernanza en proceso):
- [ ] API catalog formal con ownership y metadata
- [ ] Style guide enforced via linting en CI (Spectral)
- [ ] Design review obligatorio pre-publicacion
- [ ] Metricas de DX (TTFC, error rates) medidas
- [ ] Deprecation policy documentada

NIVEL 4 — Optimizado (gobernanza automatizada):
- [ ] Breaking change detection automatica en PRs
- [ ] Contract tests en CI/CD
- [ ] API Health Score calculado automaticamente
- [ ] Developer portal con self-service onboarding
- [ ] Usage analytics por consumidor

NIVEL 5 — Innovador (gobernanza inteligente):
- [ ] AI-assisted design review en PRs
- [ ] Predictive deprecation (detecta APIs sin uso)
- [ ] Automated SDK generation on spec change
- [ ] API marketplace con monetizacion
- [ ] Feedback loop cerrado: metricas → mejora → validacion

Para cada nivel:
1. Evidencia de cumplimiento (checklist)
2. Esfuerzo para alcanzar el siguiente nivel (magnitud: semanas/meses)
3. Impacto esperado del avance (reduccion de incidentes, mejora de DX)
4. Quick wins inmediatos (implementables en <2 semanas)

TARGET: Nivel 4 para organizaciones con >10 APIs y >3 equipos.
Nivel 3 es el minimo aceptable para cualquier organizacion en produccion.
```

---

## 5. Security-by-Design Checklist

**Purpose:** Apply before publishing any API to ensure security is not an afterthought but a design principle.

```
Para cada API antes de publicacion, verificar:

AUTENTICACION:
- [ ] Flujo OAuth 2.0 correcto para el tipo de consumidor?
  - SPA/Mobile: Authorization Code + PKCE (NUNCA implicit)
  - Server-to-Server: Client Credentials
  - IoT/TV: Device Code
- [ ] API keys usados SOLO para identificacion, NO para autorizacion?
- [ ] JWT validation completa: signature + expiration + issuer + audience?
- [ ] Tokens de corta duracion (access: 15-60 min, refresh: 24h max)?

AUTORIZACION:
- [ ] Scope-based authorization para operaciones?
- [ ] Object-level authorization (BOLA protection)?
- [ ] Function-level authorization (admin vs user endpoints separados)?
- [ ] Rate limiting diferenciado por nivel de autorizacion?

PROTECCION:
- [ ] Rate limiting activo con Retry-After header?
- [ ] Input validation en schema (max lengths, patterns, enums)?
- [ ] SQL injection / NoSQL injection prevenido?
- [ ] SSRF protection (no fetch a URLs arbitrarias del payload)?
- [ ] Mass assignment prevenido (campos permitidos explicitados)?
- [ ] Content-Type validation (reject unexpected content types)?

DATOS:
- [ ] PII no expuesto en URLs (query params en logs)?
- [ ] Sensitive data no en responses por default (field filtering)?
- [ ] HTTPS obligatorio (redirect HTTP → HTTPS)?
- [ ] CORS configurado restrictivamente (no Access-Control-Allow-Origin: *)?

OBSERVABILIDAD:
- [ ] Request logging sin datos sensibles?
- [ ] Audit trail para operaciones criticas?
- [ ] Alertas en anomalias de trafico (posible ataque)?
- [ ] API inventory actualizado (no shadow APIs)?

Si CUALQUIER item de AUTENTICACION o AUTORIZACION falla, la API NO se publica.
Los items de PROTECCION son blockers para APIs publicas, warnings para internas.
```

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**
