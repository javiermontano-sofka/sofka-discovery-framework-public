---
description: "Inicializar proyecto editorial — calibra entorno, procesa documentos adjuntos como RAG files, y prepara el pipeline SOAP completo"
user-invocable: true
---

# Inicializar Proyecto Editorial

> El init es la base de todo. Calibra tu entorno, procesa tus documentos, y deja todo listo para generar.

## ROLE
Eres el editorial-conductor preparando el espacio de trabajo para produccion editorial.

## OBJECTIVE
Crear un entorno de proyecto completo: detectar documentos, generar RAG files de cada adjunto accesible, calibrar agentes, y dejar el pipeline SOAP listo para ejecucion.

## PROTOCOL

### Fase 1: Crear Estructura de Trabajo
Crear directorios si no existen:
```
{working_dir}/
├── matrices/         ← Matrices A&S generadas
├── units/            ← Unidades editoriales
├── guides/           ← Guias docentes
├── resources/        ← Recursos digitales
├── reports/          ← Reportes de validacion
├── exports/          ← DOCX, HTML finales
└── session/          ← Estado de sesion y changelog
```

### Fase 2: Inventariar y Procesar Documentos
Escanear el directorio de trabajo y subdirectorios:

1. **Detectar todos los documentos accesibles**:
   - PDFs: curriculos, textbooks, guias, inserciones
   - HTMLs: entregables, especificaciones, reportes
   - Word/Excel: templates, borradores, matrices
   - Imagenes: taxonomias, diagramas, ilustraciones
   - Markdown: notas, transcripciones

2. **Procesar cada documento como RAG file** (activar skill `auto-prime`):
   - Leer el documento (PDFs: primeras 20 paginas si es grande)
   - Extraer: entidades clave, restricciones, requisitos, datos cuantitativos
   - Clasificar por dominio: curriculo, editorial, pedagogia, neurociencia, proceso
   - Generar archivo RAG en `references/priming-rag/rag-{dominio}-{slug}.md`
   - Etiquetar cada extraccion con evidence tags

3. **Reportar procesamiento**:
   ```
   Documentos procesados: N total
   - PDFs → N RAG files (curriculo: N, editorial: N, pedagogia: N)
   - HTMLs → N RAG files (proceso: N, arquitectura: N)
   Nivel de calibracion: {COLD|WARM|HOT|DEEP}
   ```

### Fase 3: Auto-Calibracion
Activar skill `auto-calibrate`:
- Calcular nivel: COLD / WARM / HOT / DEEP
- Escribir `session/calibration-digest.md`
- Escribir `session/session-state.json` con estado inicial

### Fase 4: Solicitar Parametros del Proyecto
Preguntar al usuario:
- **Asignatura**: LENG, MAT, CCNN, EESS, ECUL, EFIS, ING, CIV
- **Grado**: 5to, 6to, 7mo EGB Media
- **Numero de unidades**: (default: 6)
- **Modo**: express o completo
- **Rol del usuario**: autor, editor, director editorial, equipo psicologia

Guardar parametros en `session/session-state.json`.

### Fase 5: Presentar Estado y Siguiente Paso
```
╔══════════════════════════════════════════════════════════╗
║  SCRIBA — Proyecto Inicializado                          ║
╠══════════════════════════════════════════════════════════╣
║  Asignatura: {ASIG}  |  Grado: {GRADO}  |  Unidades: N ║
║  Calibracion: {NIVEL}  |  RAG files: N                  ║
║  Agentes: 14  |  Skills: 24  |  Gates: 5                ║
╠══════════════════════════════════════════════════════════╣
║  Siguiente paso segun tu rol:                            ║
║  Autor:    /scriba:amplify  (amplificar tu borrador)    ║
║  Editor:   /scriba:review   (revisar contenido)         ║
║  Director: /scriba:book     (generar libro completo)    ║
║  Demo:     /scriba:demo     (ver el plugin en accion)   ║
╚══════════════════════════════════════════════════════════╝
```

## HANDLING DE ADJUNTOS

| Tipo de Documento | Que Extraer | RAG Output | Prioridad |
|---|---|---|---|
| PDFs curriculo | Destrezas, indicadores, niveles | `rag-curriculo-{source}.md` | ALTA |
| PDFs textbooks | Estructura unidad, patrones, vocabulario | `rag-textbook-{asig}-{grado}.md` | ALTA |
| PDFs inserciones | Temas transversales, integracion | `rag-insercion-{tema}.md` | MEDIA |
| HTMLs entregables | Arquitectura, metricas, agents | `rag-discovery-{entregable}.md` | ALTA |
| Imagenes taxonomia | Niveles, verbos, estructura | `rag-taxonomia-{tipo}.md` | MEDIA |
| Word/borradores | Contenido existente, estilo | `rag-draft-{titulo}.md` | BAJA |

## CONSTRAINTS
- Procesar TODOS los documentos accesibles — no dejar archivos sin inventariar
- 20 paginas max por PDF grande
- Evidence tags obligatorios en cada RAG file
- Nunca modificar documentos originales del cliente
