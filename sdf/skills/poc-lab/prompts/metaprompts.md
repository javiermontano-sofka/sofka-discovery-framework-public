# Metaprompts — PoC Lab

> PMO-APEX Skill: `poc-lab` · Metaprompts para adaptación de PoCs
> Última actualización: 2026-03-17

---

## MP-01: PoC para Contexto de Alta Incertidumbre

```
Eres el agente de PoC Lab del PMO-APEX. La organización
{nombre_organizacion} necesita evaluar {opciones} pero tiene alta
incertidumbre: no hay experiencia previa, no hay datos de referencia,
y los criterios de éxito son difíciles de definir.
Diseña un PoC de descubrimiento que:
1. Use criterios cualitativos convertibles a cuantitativos
2. Incluya fase de calibración de criterios
3. Permita pivotar mid-PoC si la hipótesis cambia
4. Produzca learning outcomes además de evaluation outcomes
```

## MP-02: Multi-PoC Orchestration

```
{nombre_organizacion} necesita ejecutar {numero} PoCs simultáneos
en diferentes áreas. Diseña un framework de orquestación que:
1. Estandarice el diseño de PoC (template común)
2. Coordine recursos compartidos entre PoCs
3. Sincronice timelines de decisión
4. Agregue learnings cross-PoC
5. Mantenga governance sin burocratizar la experimentación
```

## MP-03: PoC con Constraints Severos

```
La organización {nombre_organizacion} tiene budget de {budget} y
{semanas} semanas para evaluar {opciones}. Los constraints son severos.
Diseña un PoC mínimo viable que:
1. Maximice la evidencia recolectable en el tiempo disponible
2. Priorice criterios de evaluación (3 máximo)
3. Use shortcuts válidos (demos en lugar de pilots si aplica)
4. Comunique explícitamente qué NO se puede validar en este scope
```

## MP-04: PoC Failure Analysis

```
El PoC de {nombre_poc} falló: {descripcion_falla}. Ejecuta un
análisis post-mortem que determine:
1. Fue falla del PoC design o falla de la opción evaluada?
2. Qué se puede rescatar de los datos recolectados?
3. Se justifica un segundo PoC con diseño corregido?
4. Qué lecciones se capturan para futuros PoCs?
```

## MP-05: Vendor-Neutral PoC Design

```
Los vendors de {opciones} quieren participar en el PoC de
{nombre_organizacion}. Diseña un protocolo vendor-neutral que:
1. Minimice influencia del vendor en la evaluación
2. Defina boundaries claros de participación del vendor
3. Asegure que el equipo interno controla la evaluación
4. Documente cualquier asistencia del vendor para transparencia
```

## MP-06: PoC Scope Minimizer

```
El PoC propuesto tiene scope excesivo: {descripcion_scope}.
Reduce el PoC al mínimo necesario para validar la hipótesis:
"{hipotesis}". Strip every feature que no valide directamente
la hipótesis. Define el smallest possible PoC que produzca
una decisión confiable con time-box y equipo mínimo.
```
