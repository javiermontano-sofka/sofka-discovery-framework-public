# Comprehensibility Metrics — Reference for validate-comprehensibility

> Score thresholds, profile definitions, severity classification, report template.

## Student Simulator Profiles

### Profile 1: Alto Rendimiento (AR)

| Parameter | Value | Source |
|-----------|-------|--------|
| Reading speed | 120+ words/min | [INFERENCIA] |
| Vocabulary | Broad, emerging formal register | Calibrated to 5to EGB top quartile |
| Sustained attention | 30+ min on academic task | [INFERENCIA] |
| Prior knowledge | Strong in subject area | Assumes regular study habits |
| Motivation | Intrinsic | Self-driven learner |

**Expected thresholds**: Comprehensibility >95%, Engagement High, Cognitive load Low-Medium.

**Validation purpose**: Verify sufficient cognitive challenge. If AR scores <90%, content may be too complex for all profiles.

### Profile 2: Promedio (PR) — Baseline Gatekeeper

| Parameter | Value | Source |
|-----------|-------|--------|
| Reading speed | 80-100 words/min | [INFERENCIA] |
| Vocabulary | Basic for age, needs context for new words | Calibrated to 5to EGB median |
| Sustained attention | 15-20 min before distraction | [INFERENCIA] |
| Prior knowledge | Variable, some gaps | Typical student |
| Motivation | Extrinsic (social, achievement) | Needs engagement hooks |

**Expected thresholds**: Comprehensibility >85% (critical approval threshold), Engagement Medium-High, Cognitive load Medium.

**Validation purpose**: Primary gatekeeper. If PR understands, the content works for the majority.

### Profile 3: Necesidades Educativas Especiales (NEE)

| Parameter | Value | Source |
|-----------|-------|--------|
| Reading speed | 50-70 words/min | [INFERENCIA] |
| Vocabulary | Limited, needs multiple encounters | Calibrated for mild learning difficulty |
| Sustained attention | 5-10 min before activity change needed | [INFERENCIA] |
| Prior knowledge | Weak, significant gaps | May have missed foundational content |
| Possible barriers | Mild dyslexia, mild ADHD, disadvantaged context | Representative, not exhaustive |

**Expected thresholds**: Comprehensibility >70% (with DUA adaptations), Engagement Variable, Cognitive load High without support / Medium with adaptations.

**Validation purpose**: Reveal accessibility floor. Content should not exclude this profile entirely.

## Scoring Dimensions

### 1. Legibilidad (0-100)

Composite of:

| Factor | Weight | Measurement |
|--------|--------|-------------|
| Lexical complexity | 30% | Word frequency rank, average syllables per word |
| Syntactic complexity | 30% | Average sentence length, subordination depth |
| Informational density | 20% | New concepts per paragraph |
| Visual support | 20% | Presence of diagrams, images, graphic organizers |

### 2. Carga Cognitiva (Baja / Media / Alta)

| Level | Criteria |
|-------|----------|
| Baja | 0-1 new concepts/section, concrete content, strong prior knowledge activation |
| Media | 1-2 new concepts/section, mix of concrete and abstract, adequate scaffolding |
| Alta | 3+ new concepts/section, abstract content, insufficient scaffolding |

### 3. Enganche (Bajo / Medio / Alto)

| Level | Criteria |
|-------|----------|
| Bajo | No real-world relevance, monotonous format, passive reading only |
| Medio | Some relevance, 2+ format types, occasional interactivity |
| Alto | Strong personal relevance, varied formats, active student agency |

## Severity Classification for Flagged Fragments

| Severity | Definition | Action Required |
|----------|-----------|----------------|
| Alta | Content incomprehensible for PR profile | Mandatory rewrite before Gate G2 |
| Media | Comprehensible for AR but not PR | Simplification recommended |
| Baja | Comprehensible for all but contains dense fragments | Optimization suggested |

## Readability Parameters by Grade (EGB Media)

### 5to EGB (9-10 years)

| Parameter | Limit |
|-----------|-------|
| Words per sentence | Max 15-20 |
| Average syllables per word | Max 3 |
| New concepts per paragraph | Max 1-2 |
| Technical terms per page | Max 3-5 (with contextual definition) |

### 6to EGB (10-11 years)

| Parameter | Limit |
|-----------|-------|
| Words per sentence | Max 18-22 |
| Average syllables per word | Max 3 |
| New concepts per paragraph | Max 2 |
| Technical terms per page | Max 4-6 (with contextual definition) |

### 7mo EGB (11-12 years)

| Parameter | Limit |
|-----------|-------|
| Words per sentence | Max 20-25 |
| Average syllables per word | Max 3.5 |
| New concepts per paragraph | Max 2-3 |
| Technical terms per page | Max 5-7 (with contextual definition) |

## Decision Thresholds

| Score (PR profile) | Decision | Next Step |
|-------------------|----------|-----------|
| >85% | APROBADO | Advance to Gate G2 (style review) |
| 80-85% | OBSERVACIONES | Advance with attention flags for AG-03 |
| <80% | BLOQUEO | Return to AG-02 for revision. Do not advance. |

## Impact Metrics

| Metric | Before SOAP | With Simulators |
|--------|-------------|----------------|
| Rejection rate at first review | 25% | <5% (target) |
| Comprehensibility measured | Not measured | >85% (target) |
| Rework from cognitive issues | Frequent | Detected pre-Gate G2 |
