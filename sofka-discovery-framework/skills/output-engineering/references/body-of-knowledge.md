# Body of Knowledge — Output Engineering

> PMO-APEX Skill: `output-engineering` · Dominio: Deliverable Production & Format Management
> Última actualización: 2026-03-17

---

## 1. Fundamentos Teóricos

### 1.1 Producción de Entregables Multi-Formato
La ingeniería de output transforma contenido bruto en entregables consumibles por diferentes audiencias. El principio central es **Markdown-first**: todo contenido se origina en Markdown versionable, y se transforma a HTML/PDF según la audiencia destino [DOC].

### 1.2 Pipeline de Producción
El pipeline sigue un flujo lineal con quality gates:
1. **Drafting** → Contenido en Markdown con evidence tags
2. **Validation** → Excellence Loop (10 criterios)
3. **Transformation** → Conversión a formato destino
4. **Branding** → Aplicación de tokens APEX canónicos
5. **Naming** → Convención `{fase}_{entregable}_{proyecto}_{status}.{ext}`
6. **Distribution** → Entrega según communication plan

### 1.3 Evidence Tagging como Requisito Previo
Output engineering NO genera contenido — transforma y formatea. Todo contenido debe llegar con evidence tags ya aplicados: `[PLAN]`, `[SCHEDULE]`, `[METRIC]`, `[INFERENCIA]`, `[SUPUESTO]`, `[STAKEHOLDER]`, `[DECISION]`, `[HISTORICO]` [DOC].

## 2. Marcos de Referencia

### 2.1 Design System APEX
- **Paleta primaria**: #2563EB (royal blue), #F59E0B (amber), #0F172A (dark)
- **Prohibición**: NUNCA verde como indicador de estado
- **Tipografía**: Inter (sans-serif) para web y presentaciones
- **Layout**: Markdown-Excellence (TL;DR + bullets + Mermaid + ghost menu)

### 2.2 Naming Convention
```
{fase}_{entregable}_{proyecto}_{WIP|Aprobado}.{ext}
Ejemplo: 03_Schedule_ProyectoAlfa_{WIP}.md
```
- `{WIP}` = en progreso, no aprobado
- `{Aprobado}` = aprobado por governance gate

### 2.3 Formatos y Audiencias
| Formato | Audiencia | Uso Principal |
|---------|-----------|---------------|
| Markdown | Equipos técnicos | Versionable, editable, liviano |
| HTML | Ejecutivos, stakeholders | Interactivo, branded, presentable |
| PDF | Regulatorio, contractual | Inmutable, firmable, distribuible |
| Mermaid | Arquitectos, analistas | Diagramas as code, versionables |

## 3. Estándares de Calidad

### 3.1 Excellence Loop (10 Criterios)
1. Evidencia — Toda afirmación etiquetada
2. Precisión — Datos verificados contra fuente
3. Completitud — Todas las secciones presentes
4. Consistencia — Formato uniforme entre entregables
5. Accionabilidad — Contenido impulsa decisiones
6. Claridad — Legible por audiencia destino
7. Trazabilidad — Cada afirmación rastreable a evidencia
8. Conciencia de riesgo — Riesgos explícitamente señalados
9. Valor stakeholder — Responde preguntas del sponsor
10. Alineación metodológica — Formato sirve al método

### 3.2 Ghost Menu
Todo artefacto importante incluye un ghost menu de navegación contextual que permite al usuario saltar entre secciones y acceder a recursos relacionados [DOC].

## 4. Anti-patrones

| Anti-patrón | Consecuencia | Corrección |
|-------------|-------------|------------|
| Formato antes que contenido | Entregable bonito pero vacío | Completar contenido primero |
| Naming inconsistente | Archivos perdidos, versiones confusas | Aplicar convención estricta |
| HTML sin tokens canónicos | Branding inconsistente | Usar design tokens APEX |
| {Aprobado} sin gate | Falsa confianza en calidad | Solo {Aprobado} post-gate |
| Evidence tags post-hoc | Tags inventados, no trazables | Tags durante creación de contenido |

## 5. Integración con Pipeline APEX

Output engineering se activa en **todas las fases** del pipeline, pero con diferente intensidad:
- **Fases 1-3 (Discovery)**: Markdown-only, evidence tagging pesado
- **Fases 4-5 (Planning)**: Markdown + Mermaid para diagramas
- **Fases 6-7 (Execution)**: HTML para dashboards ejecutivos
- **Fase 8 (Closure)**: Multi-formato completo para entrega final

## 6. Herramientas y Automatización

### 6.1 Conversión Automatizada
- Markdown → HTML: Rendering engine con tokens APEX
- Markdown → PDF: Exportación con branding (via `/pm:export-pdf`)
- Mermaid → SVG: Rendering integrado en HTML

### 6.2 Quality Checks Automatizados
- Escaneo de evidence tags faltantes
- Validación de naming convention
- Verificación de enlaces rotos
- Conteo de `[SUPUESTO]` para threshold 30%

## 7. Referencias Bibliográficas

- PMI (2021). *A Guide to the Project Management Body of Knowledge (PMBOK Guide)* — 7th Edition. Sección sobre Delivery Performance Domain.
- Axelos (2017). *Managing Successful Projects with PRINCE2* — Output management y quality review technique.
- SAFe (2023). *Lean-Agile Documentation* — Principio de documentación suficiente.
- ISO 21500:2021 — *Guidance on Project Management* — Sección de gestión de la información.
