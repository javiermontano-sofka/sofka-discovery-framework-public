# Body of Knowledge — Compliance Tracking

## 1. Foundations

Compliance tracking ensures project activities, deliverables, and processes adhere to regulatory, contractual, and organizational requirements throughout the project lifecycle. [DOC]

### 1.1 Compliance Domains

| Domain | Examples | Regulatory Body |
|--------|---------|----------------|
| Data Protection | GDPR, CCPA, LGPD | EU/State regulators [DOC] |
| Financial | SOX, IFRS, Basel III | SEC, financial regulators [METRIC] |
| Industry | HIPAA (health), PCI-DSS (payments) | Industry-specific bodies [DOC] |
| Accessibility | WCAG 2.2, ADA, Section 508 | W3C, DOJ [METRIC] |
| Security | ISO 27001, SOC 2, NIST | Certification bodies [DOC] |
| Contractual | SLAs, deliverable specs, acceptance criteria | Contract terms [STAKEHOLDER] |

### 1.2 Compliance Tracking Matrix

| Requirement | Source | Owner | Verification Method | Status | Evidence |
|-------------|--------|-------|-------------------|--------|----------|
| Data encryption at rest | GDPR Art. 32 | Security Lead | Architecture review | Compliant [METRIC] | Audit report |
| Accessibility AA | Contract | Frontend Lead | Lighthouse scan | Partial [PLAN] | Score 78/100 |
| Code review policy | Org standard | Tech Lead | PR metrics | Compliant [METRIC] | 100% PRs reviewed |

## 2. Tracking Methods

| Method | Frequency | Automation Level |
|--------|-----------|-----------------|
| Automated scans (security, accessibility) | Per commit/daily | Full [METRIC] |
| Manual audits | Quarterly | None [DOC] |
| Self-assessment checklists | Per sprint | Low [PLAN] |
| Third-party audits | Annual | None [STAKEHOLDER] |
| Continuous monitoring | Real-time | Full [METRIC] |

## 3. Non-Compliance Response

| Severity | Response | Timeline | Authority |
|----------|----------|----------|-----------|
| Critical | Stop work, immediate remediation | 24h | Sponsor + Legal [STAKEHOLDER] |
| High | Remediation plan within sprint | 1 sprint | PM + Compliance Officer [PLAN] |
| Medium | Backlog remediation | 2-3 sprints | PM [PLAN] |
| Low | Accept risk with documentation | Next quarter | PM [PLAN] |

## 4. Standards & References

| Source | Document | Relevance |
|--------|----------|-----------|
| ISO | ISO 37301:2021 | Compliance management systems |
| PMI | PMBOK 7th Ed. | Quality and compliance integration |
| NIST | Cybersecurity Framework | Security compliance |
| ISACA | COBIT 2019 | IT governance and compliance |

> *Principio Rector: "El compliance no es un checkbox; es un compromiso continuo con la confianza del stakeholder."*

*PMO-APEX v1.0 — Body of Knowledge · Compliance Tracking*
