# Design System — Body of Knowledge

## Core Concepts

1. **Design Tokens**: Named, platform-agnostic variables that store visual design attributes (color, typography, spacing). The single source of truth for the visual system.
2. **Atomic Design**: Brad Frost's methodology decomposing UI into atoms (buttons), molecules (search bars), organisms (headers), templates, and pages.
3. **Semantic Naming**: Naming tokens by purpose (color-danger) rather than appearance (color-red). Enables theme switching and maintains meaning across contexts.
4. **Component API**: The public interface of a design component — its props, variants, and composition rules. Well-designed APIs prevent misuse.
5. **Visual Consistency**: The cognitive benefit of predictable patterns. When headers, tables, and diagrams follow the same rules, readers process content faster.
6. **Design System Governance**: The process for evolving the system: proposing changes, reviewing impact, versioning, and communicating updates.

## Patterns

1. **Token Hierarchy**: Global tokens (brand colors) feed semantic tokens (color-primary) which feed component tokens (button-background). Three-level cascade.
2. **Variant Matrix**: Each component has a matrix of variants (size x style x state). The matrix defines the complete API surface.
3. **Composition Rules**: Guidelines for combining components. A card can contain a badge; a badge cannot contain a card. Rules prevent invalid compositions.
4. **Theme Switching**: Using semantic tokens enables switching between light/dark themes or brand variants without changing components.

## Tools

1. **CSS Custom Properties**: Native browser support for design tokens as CSS variables.
2. **Style Dictionary**: Amazon's tool for transforming design tokens into platform-specific outputs.
3. **Storybook**: Component development environment with documentation and visual testing.
4. **Figma Token Plugin**: Design-to-code token synchronization for design-development alignment.

## References

1. Frost, B. — *Atomic Design* (bradfrost.com, 2016).
2. Saarinen, K. — *Design Systems* (Smashing Magazine, 2017).
3. Suarez, M. et al. — *Design Systems Handbook* (DesignBetter.co, InVision).
