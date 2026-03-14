---
name: sofka-compliance-assessment
description: >
  Regulatory and standards compliance assessment — GDPR, SOX, PCI-DSS, HIPAA, ISO 27001, NIST CSF.
  Use when the user asks to "evaluate compliance", "audit regulatory gaps", "assess GDPR readiness",
  "review PCI-DSS compliance", or mentions regulatory frameworks, data protection, compliance matrix.
model: opus
context: fork
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Compliance Assessment: Regulatory & Standards Gap Analysis

Compliance assessment identifies gaps between an organization's current practices and applicable regulatory or standards requirements. The skill produces compliance gap matrices, remediation roadmaps, and risk heat maps that enable informed prioritization of compliance investments.

## TL;DR

- Evalua el estado de cumplimiento contra marcos regulatorios aplicables (GDPR, SOX, PCI-DSS, HIPAA, ISO 27001)
- Genera matriz de brechas con severidad, esfuerzo de remediacion y riesgo residual
- Produce hoja de ruta de remediacion priorizada por impacto regulatorio y exposicion al riesgo
- Mapea controles existentes contra requisitos normativos para identificar cobertura y vacios
- Entrega heat map de riesgo regulatorio para comunicacion ejecutiva

## Inputs

The user provides a project or system name as `$ARGUMENTS`. Parse `$1` as the **project/system name**.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40%) | `tecnica` (full, default)
- `{MARCO}`: `GDPR` | `SOX` | `PCI-DSS` | `HIPAA` | `ISO-27001` | `NIST-CSF` | `multi` (default)

## Entregables

1. **Matriz de brechas de cumplimiento** — Control-by-control gap analysis against selected framework(s)
2. **Hoja de ruta de remediacion** — Prioritized action plan with effort estimates, owners, and timelines
3. **Heat map de riesgo regulatorio** — Visual risk assessment by domain and severity
4. **Inventario de controles existentes** — Mapping of current controls to regulatory requirements
5. **Informe ejecutivo de exposicion** — C-level summary of compliance posture and key risks

## Proceso

1. **Identificar marcos aplicables** — Determine which regulations and standards apply based on industry, geography, data types, and business model
2. **Inventariar controles existentes** — Catalog current security controls, policies, procedures, and technical safeguards
3. **Mapear controles a requisitos** — Map existing controls against each requirement of the applicable framework(s)
4. **Evaluar brechas** — Identify gaps where controls are missing, partial, or ineffective; classify by severity
5. **Calcular riesgo residual** — Assess likelihood and impact of non-compliance for each gap
6. **Priorizar remediacion** — Rank remediation actions by regulatory exposure, effort, and business impact
7. **Disenar hoja de ruta** — Build phased remediation plan with quick wins (0-30 days), medium-term (30-90 days), and strategic (90-365 days)
8. **Generar heat map** — Produce visual risk heat map for executive communication

## Criterios de Calidad

- [ ] All applicable regulatory frameworks identified and justified
- [ ] Gap matrix covers 100% of framework requirements (not sampled)
- [ ] Each gap has severity classification (critical/high/medium/low)
- [ ] Remediation roadmap includes effort estimates and ownership
- [ ] Risk heat map uses consistent scoring methodology
- [ ] Evidence tags applied: [DOC], [CONFIG], [INFERENCIA], [SUPUESTO]
- [ ] No legal advice given — skill produces technical compliance assessment only
- [ ] Cross-references to related security and architecture assessments

## Supuestos y Limites

- This is a technical compliance assessment, NOT legal advice
- Assumes access to documentation of existing controls and policies
- Does not replace formal certification audits (ISO, SOC2, PCI QSA)
- Regulatory interpretations should be validated by legal counsel

## Cross-References

- **sofka-security-architecture:** Security controls that support compliance requirements
- **sofka-data-architecture:** Data governance and classification relevant to GDPR/HIPAA
- **sofka-risk-assessment:** Enterprise risk framework aligned with compliance risks

---
**Autor:** Equipo PreSales Sofka | **Version:** 1.0.0
