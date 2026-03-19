# DUA Adaptation Patterns Reference

> Domain knowledge for the `adapt-dua` skill. Covers the 3 DUA principles, adaptation examples by modality, NEE profile considerations, and a compliance checklist.

## The 3 DUA Principles

### Principle I: Multiple Means of Representation (the "WHAT" of learning)

Provide information through multiple sensory channels so learners can perceive and comprehend content regardless of sensory or perceptual differences.

| Guideline | Adaptation Example | Target NEE |
|-----------|--------------------|------------|
| 1.1 Perception options | Provide audio narration alongside text | Visual impairment |
| 1.1 Perception options | Use high-contrast color schemes in diagrams | Low vision |
| 1.2 Language/symbols | Define technical terms inline on first use | Cognitive, TEA |
| 1.2 Language/symbols | Provide visual glossary with icons | TDAH, cognitive |
| 1.3 Comprehension | Include advance organizers before complex content | TDAH, cognitive |
| 1.3 Comprehension | Provide worked examples before practice problems | Cognitive |

### Principle II: Multiple Means of Engagement (the "WHY" of learning)

Offer varied ways to motivate and sustain student interest, effort, and self-regulation.

| Guideline | Adaptation Example | Target NEE |
|-----------|--------------------|------------|
| 2.1 Interest recruitment | Offer choice of activity themes (sports, art, nature) | TDAH, TEA |
| 2.1 Interest recruitment | Connect activity to real-world local context | All profiles |
| 2.2 Sustained effort | Break long tasks into timed micro-steps | TDAH |
| 2.2 Sustained effort | Provide progress checklist students can mark off | Cognitive, TDAH |
| 2.3 Self-regulation | Include metacognitive prompts ("How did you solve it?") | All profiles |
| 2.3 Self-regulation | Offer emotion check-in before/after activity | TEA |

### Principle III: Multiple Means of Action and Expression (the "HOW" of learning)

Allow learners to demonstrate understanding through varied means -- not just written text.

| Guideline | Adaptation Example | Target NEE |
|-----------|--------------------|------------|
| 3.1 Physical action | Allow voice-to-text or dictation for written responses | Motor impairment |
| 3.1 Physical action | Provide drag-and-drop digital alternatives to writing | Motor, cognitive |
| 3.2 Expression/communication | Accept oral presentation instead of written report | Motor, visual |
| 3.2 Expression/communication | Allow drawing or diagramming as a response | Cognitive, TEA |
| 3.3 Executive functions | Provide graphic organizer templates | TDAH, cognitive |
| 3.3 Executive functions | Offer step-by-step procedure cards | TEA, cognitive |

## NEE Profiles Reference

| Profile Code | Description | Primary Barriers | Priority DUA Principles |
|-------------|-------------|------------------|------------------------|
| Visual | Visual impairment (low vision, blindness) | Cannot perceive visual content | I (Representation), III (Action) |
| Auditory | Hearing impairment | Cannot perceive audio content | I (Representation) |
| Motor | Motor/physical disability | Cannot write or manipulate physical objects | III (Action/Expression) |
| Cognitive | Intellectual disability, learning difficulties | Processing speed, working memory | I (Representation), II (Engagement) |
| TEA | Autism spectrum | Social interaction, sensory sensitivity, routine | II (Engagement), III (Action) |
| TDAH | Attention deficit hyperactivity | Sustained attention, impulsivity, organization | II (Engagement), I (Representation) |

## Compliance Checklist

For each activity, verify:

- [ ] At least 2 DUA adaptations are present.
- [ ] Adaptations cover at least 2 of the 3 DUA principles.
- [ ] Each adaptation names the principle it serves.
- [ ] Each adaptation names the target NEE profile(s).
- [ ] Each adaptation describes a concrete, actionable modification (not vague).
- [ ] Across the unit, at least 3 distinct NEE profiles are addressed.
- [ ] Adaptations are integrated into the activity flow, not appended as an afterthought.

## Adaptation Quality Criteria

**Strong adaptation**: "Provide an audio recording of the reading passage so students with visual impairment can access the content independently." (Principle I, NEE: Visual, actionable)

**Weak adaptation**: "Use different colors." (No principle, no NEE, not actionable -- REJECT)

**Strong adaptation**: "Offer a graphic organizer template with pre-filled categories so students with TDAH can structure their analysis without losing focus on the content." (Principle III, NEE: TDAH, actionable)

**Weak adaptation**: "Let students work in groups." (Not a DUA adaptation -- this is a pedagogical strategy without accessibility targeting -- REJECT)

## Sinapsis Section Markers for DUA

Insert adaptations using these markers within the activity block:

```markdown
#### Adaptaciones DUA
- **Representacion**: [adaptation text] `[NEE: profile]`
- **Compromiso**: [adaptation text] `[NEE: profile]`
- **Accion/Expresion**: [adaptation text] `[NEE: profile]`
```
