---
description: "Paleta interactiva de comandos disponibles — 19 comandos organizados por flujo"
user-invocable: true
---

# /scriba:menu — Paleta de Comandos

## Proposito
Muestra el menu completo de comandos, organizado por flujo de trabajo.

## Flujo
Presentar el siguiente menu:

```
╔══════════════════════════════════════════════════════════╗
║  SCRIBA — Asistente Editorial Agentico K-12             ║
║  14 agentes | 24 skills | 19 comandos | 5 quality gates ║
╠══════════════════════════════════════════════════════════╣

  EMPEZAR AQUI
  /scriba:demo       Demo express 4 pasos (Aprender a Aprender o tema al vuelo)
  /scriba:init       Inicializar proyecto (procesa adjuntos → RAG)

  CREAR LIBRO
  /scriba:book       Libro express completo (matriz → unidades → DOCX + HTML)
  /scriba:create     Router de creacion (matrix/unit/guide/digital)
  /scriba:matrix     Generar Matriz de Alcance y Secuencia
  /scriba:unit       Generar unidad modelo completa
  /scriba:guide      Generar guia docente con DUA y rubricas

  COLABORACION HUMANA
  /scriba:amplify    Amplificar borrador humano (preserva 100% contenido)

  REVISAR
  /scriba:review     Revisar contenido (comprensibilidad/cobertura/estilo)
  /scriba:validate   Validacion comprensibilidad + cobertura
  /scriba:gate       Ejecutar quality gate (G0/G1/G1.5/G2/G3)
  /scriba:audit      Auditoria cross-unidad completa

  MEJORAR
  /scriba:evolve     Mejorar contenido con feedback
  /scriba:repair     Reparar issues de revision

  EXPORTAR
  /scriba:docx       Exportar a Word para maquetacion
  /scriba:html       Exportar a HTML ebook interactivo
  /scriba:publish    Publicar libro (DOCX + HTML + reporte)

  SISTEMA
  /scriba:menu       Esta paleta de comandos
  /scriba:status     Dashboard de estado del pipeline

╠══════════════════════════════════════════════════════════╣
  Flujos recomendados:

  Primera vez:     /scriba:demo
  Proyecto nuevo:  /scriba:init → /scriba:book → /scriba:publish
  Borrador humano: /scriba:init → /scriba:amplify → /scriba:publish
  Revision:        /scriba:review → /scriba:evolve → /scriba:gate
╚══════════════════════════════════════════════════════════╝
```

## Sugerencia contextual

- Sin sesion activa → sugerir `/scriba:demo` o `/scriba:init`
- Con sesion, sin matriz → sugerir `/scriba:matrix`
- Con matriz, sin unidades → sugerir `/scriba:unit` o `/scriba:book`
- Con unidades sin validar → sugerir `/scriba:validate`
- Todo validado → sugerir `/scriba:publish`
