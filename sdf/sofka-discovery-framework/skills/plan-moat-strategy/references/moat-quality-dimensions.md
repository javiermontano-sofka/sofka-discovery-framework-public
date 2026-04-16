# MOAT Quality Dimensions Scoring Rubric

> Reference for `plan-moat-strategy` skill. Defines how to score MOAT asset quality.

---

## Overview

MOAT = Materials, Ontology, Assets, Templates. Each skill's supporting assets are scored across four quality dimensions to determine whether the MOAT is sufficient for production use.

---

## Dimension 1: Completeness (0-25 points)

| Score | Criteria |
|-------|----------|
| 25 | All subdirectories present per MOAT depth. Every file has substantive content (30+ lines). No placeholder files. |
| 20 | All subdirectories present. Most files are substantive. 1-2 thin files (under 20 lines). |
| 15 | One expected subdirectory missing. Content is adequate but not thorough. |
| 10 | Multiple subdirectories missing. Content is skeletal. |
| 0-5 | SKILL.md only, despite HIGH+ complexity requiring MOAT assets. |

---

## Dimension 2: Accuracy (0-25 points)

| Score | Criteria |
|-------|----------|
| 25 | All references cite correct spec versions. Examples are tested and valid. No factual errors. |
| 20 | References are accurate. 1-2 minor inaccuracies that do not affect outcomes. |
| 15 | Some references are outdated or partially incorrect. |
| 10 | Multiple factual errors. References cite nonexistent spec sections. |
| 0-5 | Content contradicts the official specification. |

---

## Dimension 3: Actionability (0-25 points)

| Score | Criteria |
|-------|----------|
| 25 | References directly support procedure steps. Examples are copy-paste-adaptable. Prompts elicit useful answers. |
| 20 | References are useful but require interpretation. Examples need minor adaptation. |
| 15 | References provide background but do not map to specific procedure steps. |
| 10 | References are theoretical. Examples are unrealistic. Prompts are too generic. |
| 0-5 | Assets do not help the skill execute its procedure. |

---

## Dimension 4: Maintainability (0-25 points)

| Score | Criteria |
|-------|----------|
| 25 | Naming follows conventions. Files are self-describing. Cross-references use relative paths. Version notes included. |
| 20 | Good naming. Minor cross-reference issues. |
| 15 | Inconsistent naming. Some orphaned files. |
| 10 | Poor naming. Hard-coded paths. No version tracking. |
| 0-5 | Files are cryptically named. No organization pattern. |

---

## Grading Scale

| Grade | Total Score | Interpretation |
|-------|-----------|---------------|
| A | 90-100 | Production-ready MOAT. No improvements needed. |
| B | 75-89 | Good MOAT. Minor gaps to address. |
| C | 60-74 | Adequate MOAT. Noticeable gaps affecting skill quality. |
| D | 40-59 | Weak MOAT. Skill will underperform without improvements. |
| F | 0-39 | Insufficient MOAT. Skill lacks necessary supporting material. |

---

## Depth vs Quality Matrix

A skill with DEEP depth but low-quality assets scores worse than a skill with STANDARD depth and excellent assets. Depth without quality is padding.

| Scenario | Recommendation |
|----------|---------------|
| DEEP depth, Grade A | Ideal state. Maintain. |
| DEEP depth, Grade C | Reduce depth or improve content. Do not keep empty directories. |
| STANDARD depth, Grade A | May benefit from upgrading to FULL if skill evolves. |
| MINIMAL depth, HIGH complexity | Upgrade depth. The skill is underserved. |
