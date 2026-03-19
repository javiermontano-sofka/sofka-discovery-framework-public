# Asistente Scriba

Plugin de Claude Code para produccion agentica de textos escolares K-12.

## Instalacion

```bash
claude --plugin-dir ./scriba
```

## Uso rapido

```
/scriba:menu      # Ver comandos disponibles
/scriba:init      # Inicializar proyecto
/scriba:matrix    # Generar Matriz A&S
/scriba:unit      # Generar unidad modelo
/scriba:validate  # Validar contenido
```

## Arquitectura

Sistema SOAP (Sistema de Orquestacion Agentica Prolipa):
- 5 capas: Ingesta, Generacion, Validacion, Diseno, Vigilancia
- 11 agentes en 3 tiers
- 18 skills (CREAR/REVISAR/EVOLUCIONAR/REPARAR)
- 5 quality gates (G0-G3)

## Contexto

Desarrollado para Editorial Prolipa (Ecuador), linea Sinapsis — textos escolares EGB Media (5to-7mo grado), 8 asignaturas. Basado en marcos pedagogicos Bloom, Marzano, DUA y principios de neurociencia del aprendizaje (carga cognitiva, comprensibilidad, scaffolding).

## Licencia

Consultar archivo LICENSE.
