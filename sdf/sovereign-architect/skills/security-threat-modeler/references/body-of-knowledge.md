# Security Threat Modeler — Body of Knowledge

## Core Concepts
- **STRIDE**: Microsoft's threat classification — Spoofing, Tampering, Repudiation, Information Disclosure, Denial of Service, Elevation of Privilege `[HECHO]`
- **Trust boundaries**: Lines where the level of trust changes; threats concentrate at these boundaries
- **Attack surface**: The sum of all points where an attacker can try to enter or extract data from the system
- **Threat trees**: Hierarchical decomposition of how an attacker might achieve a goal, with AND/OR branches
- **DREAD scoring**: Damage, Reproducibility, Exploitability, Affected users, Discoverability — quantitative threat scoring
- **Defense in depth**: Multiple layers of security so that compromise of one layer doesn't compromise the system

## Patterns & Practices
- **Data Flow Diagrams (DFD)**: Level 0 (context) and Level 1 (detailed) DFDs showing processes, data stores, data flows, and trust boundaries
- **PASTA (Process for Attack Simulation and Threat Analysis)**: 7-stage risk-centric threat modeling methodology
- **Attack tree construction**: Root node is attacker goal; child nodes are methods; leaf nodes are atomic attack steps
- **Countermeasure mapping**: Each threat maps to one or more countermeasures with implementation priority
- **Threat modeling as code**: Threagile, PyTM, or Threat Composer for version-controlled threat models

## Tools & Technologies
- **Modeling tools**: Microsoft Threat Modeling Tool, OWASP Threat Dragon, Threagile, IriusRisk
- **As-code**: PyTM (Python), Threagile (YAML), Threat Composer (AWS)
- **Visualization**: Mermaid DFD, draw.io, Lucidchart
- **Vulnerability databases**: CVE, CWE, CAPEC (attack patterns)

## References
- Adam Shostack — "Threat Modeling: Designing for Security"
- OWASP Threat Modeling Cheat Sheet
- Microsoft SDL Threat Modeling Guide
- NIST SP 800-154 — Guide to Data-Centric System Threat Modeling
