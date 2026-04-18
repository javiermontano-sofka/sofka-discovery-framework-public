# Service types — reference

The 10 canonical `{TIPO_SERVICIO}` values. Governed by [ADR-0007](../../adr/0007-service-type-routing.md).

| # | Type | Spec | Typical engagement |
|---|------|------|--------------------|
| 1 | SDA | [sda.md](sda.md) | Software Development / App modernization |
| 2 | QA | [qa.md](qa.md) | Quality-as-a-service |
| 3 | RPA | [rpa.md](rpa.md) | Process automation |
| 4 | Data-AI | [data-ai.md](data-ai.md) | Data platforms, ML, analytics |
| 5 | Cloud | [cloud.md](cloud.md) | Migration, landing zone, FinOps |
| 6 | SAS | [sas.md](sas.md) | Staff augmentation |
| 7 | Management | [management.md](management.md) | PMO, governance, portfolio |
| 8 | UX-Design | [ux-design.md](ux-design.md) | UX research + design systems |
| 9 | Digital-Transformation | [digital-transformation.md](digital-transformation.md) | Cross-cutting multi-service |
| 10 | Multi-Service | [multi-service.md](multi-service.md) | Fallback for true multi-workstream |

Each spec follows the same structure:

- **Scope signal** — what the user says that routes here.
- **Committee** — which specialist agents are activated.
- **Pipeline variant** — any phase-level adaptations from the generic pipeline.
- **Typical deliverables** — beyond the canonical P0-P9.
- **Anti-patterns** — engagements that look like this type but route elsewhere.
