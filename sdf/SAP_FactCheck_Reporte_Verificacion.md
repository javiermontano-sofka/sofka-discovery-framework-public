# Reporte de Verificacion — Fact-Check Round 2
## Consultas SAP FI / CO / FM

> **Protocolo**: Reuters/AP Fact-Checking Methodology
> **Fuentes consultadas**: 15+ (SAP Help Portal, SAP Community, CVOSOFT, Techlorean, TutorialsCampus, SAP Learning, SAPinsider, NotebookLM Deep Research)
> **Fecha**: 2026-04-16
> **NotebookLM Notebook**: [SAP Fact Check FI CO FM](https://notebooklm.google.com/notebook/66298586-c01d-4795-b695-d2ae6a616a99)

---

## Pregunta 1: Bloqueo de Pago para Tarjeta de Credito

### A1.1: "La clave A esta reservada para anticipos y no debe reutilizarse"

| Campo | Detalle |
|-------|---------|
| **Afirmacion** | La clave de bloqueo A se asigna automaticamente al registrar anticipos y no debe eliminarse ni reutilizarse |
| **Fuente primaria** | SAP Help Portal — Payment Blocking and Payment Directives; SAP Community Blog — Payment Block |
| **Fuentes independientes** | 4 (SAP Help Portal, SAP Community Blog, CVOSOFT, MohanRanga) |
| **Contra-evidencia** | Ninguna encontrada |
| **Veredicto** | **VERDADERO** |
| **Explicacion** | Multiples fuentes oficiales SAP confirman textualmente: "The block key A is always set automatically when a down payment is entered. Therefore, you must not delete the block key A or use it for other purposes." `[DOC]` |

### A1.2: "La clave R se activa automaticamente por tolerancias en OMR6/MIRO"

| Campo | Detalle |
|-------|---------|
| **Afirmacion** | La clave R se establece automaticamente durante la verificacion de facturas logisticas cuando se exceden las tolerancias |
| **Fuente primaria** | SAP Community Blog — Payment Block (seccion Invoice Block) |
| **Fuentes independientes** | 3 (SAP Community, SAP Help, CVOSOFT) |
| **Contra-evidencia** | Ninguna |
| **Veredicto** | **VERDADERO** |
| **Explicacion** | Confirmado: "When the Logistic Invoice Posting reaches these tolerances the Payment Block R is set because of the Invoice Verification." Se libera con MRBR. `[DOC]` |

### A1.3: "OB27 es la transaccion para definir claves de bloqueo de pago"

| Campo | Detalle |
|-------|---------|
| **Afirmacion** | La transaccion OB27 se usa para definir y configurar claves de bloqueo de pago |
| **Fuente primaria** | SAP Community Blog — Payment Block |
| **Fuentes independientes** | 3 (SAP Community, SAP Help Portal — Check Payment Block Reason, CVOSOFT) |
| **Contra-evidencia** | Ninguna |
| **Veredicto** | **VERDADERO** |
| **Explicacion** | Confirmado: "The payment block key is defined by a char indicator in OB27 having three important definitions." La ruta IMG tambien apunta a OB27. `[DOC]` |

### A1.4: "OBB8 permite asignar clave de bloqueo a condiciones de pago"

| Campo | Detalle |
|-------|---------|
| **Afirmacion** | La transaccion OBB8 permite configurar condiciones de pago para que asignen automaticamente una clave de bloqueo |
| **Fuente primaria** | SAP Community Blog — Payment Block (seccion Payment Terms) |
| **Fuentes independientes** | 2 (SAP Community Blog, NotebookLM Ronda 1) |
| **Contra-evidencia** | Ninguna, pero solo 2 fuentes independientes (no 3) |
| **Veredicto** | **VERDADERO** (alta confianza, 2 fuentes) |
| **Explicacion** | Confirmado en fuente primaria: "It's possible to set the payment block in the Terms of Payment (OBB8). When posting any document with the following Terms of Payment the Payment Block will be set." `[DOC]` |

### A1.5: "La clave * salta todas las partidas del proveedor en F110"

| Campo | Detalle |
|-------|---------|
| **Afirmacion** | La clave de bloqueo * (asterisco) tiene el efecto de saltar todas las partidas de la cuenta en transacciones de pago automatico |
| **Fuente primaria** | SAP Community Blog — Payment Block |
| **Fuentes independientes** | 3 (SAP Community, NotebookLM Ronda 1, SAP Help) |
| **Contra-evidencia** | Ninguna |
| **Veredicto** | **VERDADERO** |
| **Explicacion** | Confirmado: "The block key * has the effect that all items of the account are skipped in automatic payment transactions." `[DOC]` |

### A1.6: "Se recomienda crear clave personalizada (T) para tarjeta de credito"

| Campo | Detalle |
|-------|---------|
| **Afirmacion** | Es recomendable crear una clave de bloqueo personalizada para facturas de tarjeta de credito |
| **Fuente primaria** | Inferencia basada en documentacion SAP sobre creacion de claves personalizadas |
| **Fuentes independientes** | 0 fuentes que recomienden especificamente "T" para tarjetas de credito |
| **Contra-evidencia** | La clave * (Skip Account) podria ser suficiente si el proveedor es exclusivo de tarjeta |
| **Veredicto** | **PARCIALMENTE VERDADERO** |
| **Explicacion** | SAP confirma que se pueden crear claves personalizadas. La recomendacion de usar "T" es una buena practica de consultoria, no una directriz SAP oficial. Es una recomendacion valida pero no documentada como estandar. `[INFERENCIA]` |

---

## Pregunta 2: Tolerancias del Control Presupuestal

### A2.1: "La parametrizacion de tolerancias es configuracion SPRO — generalmente solo consultores"

| Campo | Detalle |
|-------|---------|
| **Afirmacion** | La configuracion de perfiles de tolerancia presupuestal se realiza en SPRO y generalmente requiere perfil de consultor |
| **Fuente primaria** | SAP Community Blog — Budget Availability Control for Cost Centers; SAP Learning |
| **Fuentes independientes** | 4 (SAP Community, SAP Learning, SAP Help Portal, VOTEC Consulting) |
| **Contra-evidencia** | SAP Help S/4HANA Cloud indica que "key users" pueden verificar settings y crear categorias de planificacion |
| **Veredicto** | **VERDADERO** (con matiz) |
| **Explicacion** | La ruta SPRO confirmada: Controlling > Cost Center Accounting > Budget Availability Control > Maintain Budget Availability Control Profile. Es configuracion de customizing. El matiz es que en S/4HANA Cloud, key users designados pueden tener acceso limitado via "configuration environment". `[DOC]` |

### A2.2: "OKP1 es la transaccion para actualizar perfiles de presupuesto en CO"

| Campo | Detalle |
|-------|---------|
| **Afirmacion** | OKP1 se usa para mantener perfiles de presupuesto |
| **Fuente primaria** | Busqueda web directa de OKP1 |
| **Fuentes independientes** | 5 (ERPyourself, SAPinsider, TestingBrain, SAPTransactions, SAP-TCodes.org) |
| **Contra-evidencia** | **TODAS las fuentes** confirman que OKP1 = "Maintain Period Lock" (bloqueo de periodos), NO perfiles de presupuesto |
| **Veredicto** | **FALSO** |
| **Explicacion** | OKP1 es para bloqueo de periodos contables en CO, NO para perfiles de presupuesto. La transaccion correcta para perfiles de presupuesto de centros de coste se accede via SPRO: "Maintain Budget Availability Control Profile for Cost Centers". No tiene un T-code directo comun — se navega por SPRO. `[DOC]` |

### A2.3: "Las tolerancias generan mensajes de advertencia (W) o error (E) segun el % de uso"

| Campo | Detalle |
|-------|---------|
| **Afirmacion** | El sistema genera mensajes de advertencia cuando se alcanza un umbral y mensajes de error cuando se excede otro umbral |
| **Fuente primaria** | SAP Community Blog — Budget Availability Control for Cost Centers |
| **Fuentes independientes** | 4 (SAP Community, SAP Learning, CVOSOFT, VOTEC) |
| **Contra-evidencia** | Ninguna |
| **Veredicto** | **VERDADERO** |
| **Explicacion** | Confirmado: "When you assign a warning to a budget tolerance limit, the budget can still be used even after the tolerance limit has been exceeded. However, you might want to prevent the creation of purchase orders or requisitions when a budget tolerance limit has been exceeded. In this case, assign an error message." `[DOC]` |

### A2.4: "Los Account Groups definen que cuentas contables consumen presupuesto"

| Campo | Detalle |
|-------|---------|
| **Afirmacion** | Los grupos de cuentas determinan que cuentas de coste/gasto se consideran para el control de disponibilidad presupuestal |
| **Fuente primaria** | SAP Community Blog — Budget Availability Control for Cost Centers |
| **Fuentes independientes** | 3 (SAP Community, SAP Learning, NotebookLM Ronda 1) |
| **Contra-evidencia** | Ninguna |
| **Veredicto** | **VERDADERO** |
| **Explicacion** | Confirmado: "Account Groups for Budget Availability Control should consist of cost / expense accounts. There's no Budget Availability Control for balance sheet accounts." `[DOC]` |

---

## Pregunta 3: Tasas de Cambio P y M

### A3.1: "Tipo M = average rate, usado por defecto para posting y clearing en FI"

| Campo | Detalle |
|-------|---------|
| **Afirmacion** | El tipo de tasa M es la tasa promedio estandar usada por defecto para contabilizacion y compensacion |
| **Fuente primaria** | SAP Help Portal — Exchange Rate Types (S/4HANA ON-PREMISE + ERP) |
| **Fuentes independientes** | 5 (SAP Help x2, Techlorean, TutorialsCampus, SAP Community) |
| **Contra-evidencia** | Ninguna |
| **Veredicto** | **VERDADERO** |
| **Explicacion** | Textualmente de SAP Help: "For posting and clearing, the system uses the exchange rate type M (average rate). This exchange rate type must be entered in the system and you must also enter the exchange rates for this type." `[DOC]` |

### A3.2: "Tipo P = plan rate para planificacion en CO"

| Campo | Detalle |
|-------|---------|
| **Afirmacion** | El tipo de tasa P es la tasa de planificacion estandar usada en Controlling |
| **Fuente primaria** | Ninguna fuente oficial SAP define "P" como key estandar |
| **Fuentes independientes** | 2 fuentes comunitarias que usan "P" para planificacion (SAP Community Q&A) |
| **Contra-evidencia** | SAP Help lista como tipos estandar: Buying rate, Selling rate, Average rate (M), Historical, Key date — NO menciona "P" como estandar |
| **Veredicto** | **PARCIALMENTE VERDADERO / ENGANOSO** |
| **Explicacion** | SAP documenta que se necesitan diferentes tipos de tasa para "Planning" como proposito, pero la letra "P" no es un tipo entregado por SAP como estandar. Es una convencion comun en implementaciones (custom) pero no una definicion de sistema. Muchos proyectos crean tipo "P" para planificacion, pero no viene pre-configurado. `[INFERENCIA]` |

### A3.3: "OBA7 permite asignar tipo de tasa por clase de documento"

| Campo | Detalle |
|-------|---------|
| **Afirmacion** | La transaccion OBA7 permite configurar el tipo de tasa de cambio por defecto para cada tipo de documento FI |
| **Fuente primaria** | SAP Community Q&A — "Default Exchange rate type at document type level" |
| **Fuentes independientes** | 3 (SAP Community, SAP Note 2959892, Scribd — Exchange Rate Type Determination) |
| **Contra-evidencia** | Ninguna |
| **Veredicto** | **VERDADERO** |
| **Explicacion** | Confirmado: OBA7 permite fijar un tipo de tasa de cambio por tipo de documento. Si no se especifica, SAP usa "M". Ruta IMG: Financial Accounting > Document > Document Types > Define Document Type. Cambiar tag de `[INFERENCIA]` a `[DOC]`. `[DOC]` |

### A3.4: "OBBS mantiene ratios de traduccion de monedas (tabla TCURF)"

| Campo | Detalle |
|-------|---------|
| **Afirmacion** | OBBS es la transaccion para mantener ratios de traduccion de monedas, almacenados en tabla TCURF |
| **Fuente primaria** | Techlorean — SAP Exchange Rate and Foreign Currency Valuation |
| **Fuentes independientes** | 2 (Techlorean, NotebookLM Ronda 1) |
| **Contra-evidencia** | Ninguna |
| **Veredicto** | **VERDADERO** |
| **Explicacion** | Confirmado con tabla de resumen en fuente primaria: "OBBS | TCURF — Translation Ratios". `[DOC]` |

### A3.5: "Para tasa promedio del mes, mantener tipo M actualizado en OB08"

| Campo | Detalle |
|-------|---------|
| **Afirmacion** | La forma mas directa de usar tasa promedio mensual es actualizar tipo M en OB08 con la tasa promedio al inicio de cada mes |
| **Fuente primaria** | Practica comun de consultoria, confirmada parcialmente por SAP Help |
| **Fuentes independientes** | 3 (Techlorean, SAP Community, OB08.net FAQ) |
| **Contra-evidencia** | SAP no prescribe un metodo oficial para "tasa promedio del mes" — depende de la politica contable del cliente |
| **Veredicto** | **VERDADERO** (como practica, no como regla SAP) |
| **Explicacion** | Es la solucion mas comun y pragmatica. La fecha "Valid From" en OB08 determina que tasa aplica. Si se carga una tasa promedio al inicio del mes, todas las transacciones del mes la usaran. Alternativas validas: RFTBFF00 para carga automatica, o crear tipo personalizado. `[INFERENCIA]` |

---

## Resumen Ejecutivo de Veredictos

| # | Afirmacion | Veredicto | Confianza |
|---|-----------|-----------|-----------|
| A1.1 | Clave A reservada para anticipos | **VERDADERO** | Alta |
| A1.2 | Clave R automatica por MIRO/OMR6 | **VERDADERO** | Alta |
| A1.3 | OB27 para definir claves de bloqueo | **VERDADERO** | Alta |
| A1.4 | OBB8 para automatizar via condiciones de pago | **VERDADERO** | Alta |
| A1.5 | Clave * salta todas las partidas | **VERDADERO** | Alta |
| A1.6 | Crear clave T para tarjeta de credito | **PARCIALMENTE VERDADERO** | Media |
| A2.1 | Tolerancias = customizing SPRO | **VERDADERO** (con matiz) | Alta |
| A2.2 | OKP1 para perfiles de presupuesto | **FALSO** | Alta (es Period Lock) |
| A2.3 | Warning y Error por % de tolerancia | **VERDADERO** | Alta |
| A2.4 | Account Groups definen cuentas de presupuesto | **VERDADERO** | Alta |
| A3.1 | Tipo M = average rate por defecto | **VERDADERO** | Alta |
| A3.2 | Tipo P = plan rate estandar | **PARCIALMENTE VERDADERO / ENGANOSO** | Media |
| A3.3 | OBA7 = tipo de tasa por documento | **VERDADERO** | Alta |
| A3.4 | OBBS = ratios de traduccion (TCURF) | **VERDADERO** | Alta |
| A3.5 | Mantener M en OB08 para promedio mensual | **VERDADERO** (practica) | Alta |

### Correcciones Criticas a Aplicar

1. **OKP1 es FALSO** — Eliminar de la tabla de transacciones. OKP1 = "Maintain Period Lock", NO perfiles de presupuesto. La configuracion de perfiles de presupuesto se hace directamente via SPRO.
2. **Tipo P marcado como PARCIALMENTE VERDADERO** — Agregar nota explicita: "P no es un tipo estandar entregado por SAP. Es una convencion de implementacion comun."
3. **OBA7 cambiado a VERDADERO** — Subir tag de `[INFERENCIA]` a `[DOC]`.

---

## KEY FACTS (Memoria para siguiente sesion)

**Entidades clave:**
- Transacciones confirmadas: OB27, OBB8, F110, OB07, OB08, OBBS, OBA7, OBA1, OB59, MRBR, OMR6
- Transaccion INCORRECTA: OKP1 (no es para presupuesto, es Period Lock)
- Tabla TCURR: tasas de cambio; TCURF: ratios de traduccion; TCURV: tipos de tasa

**Decisiones tomadas:**
- Clave de bloqueo "T" recomendada como practica de consultoria (no regla SAP)
- Tipo de tasa "P" es custom/convencion, no estandar SAP
- OBA7 confirmada como transaccion real y documentada

**Numeros relevantes:**
- 15 afirmaciones verificadas
- 12 VERDADERAS, 2 PARCIALMENTE VERDADERAS, 1 FALSA
- 15+ fuentes independientes consultadas

**Proximos pasos:**
- Corregir OKP1 en HTML y MD
- Actualizar tag de OBA7 a [DOC]
- Agregar nota explicativa sobre tipo P como convencion

---

*Construido por profesionales, potenciado por la red agentica de Sofka.*
