# Metaprompts — HTML Brand

## Metaprompt 1: Brand Consistency Validator

**Strategy**: Audit generated HTML artifacts against the canonical design token specification.

**Protocol**:
1. Extract all color, typography, and spacing values from the HTML
2. Compare against the design token specification
3. Flag any hard-coded values not matching tokens
4. Check contrast ratios for WCAG 2.2 AA compliance
5. Generate a compliance report with [METRIC] tags

**Activation**:
> "Audit this HTML artifact for brand consistency. Compare every color, font, and spacing value against the APEX design tokens. Flag deviations, check WCAG 2.2 AA contrast ratios, and produce a compliance score with specific remediation steps."

## Metaprompt 2: Progressive Enhancement Layering

**Strategy**: Ensure HTML artifacts work across all delivery channels (email, browser, print, PDF).

**Protocol**:
1. Start with semantic HTML structure (works everywhere)
2. Add CSS for visual enhancement (browser/PDF)
3. Add interactive elements (browser only)
4. Test rendering in each target channel
5. Document degradation behavior per channel

**Activation**:
> "Apply progressive enhancement to this HTML artifact. Ensure it renders correctly in: (a) Outlook email, (b) modern browser, (c) print/PDF, (d) mobile device. Document what degrades in each channel and ensure core content is always accessible."

## Metaprompt 3: Accessibility-First Design Review

**Strategy**: Evaluate branded artifacts from the perspective of users with different abilities.

**Protocol**:
1. Test with screen reader simulation
2. Verify keyboard-only navigation
3. Check color-blind safe palette usage
4. Validate text scaling to 200%
5. Ensure all charts have data table alternatives

**Activation**:
> "Review this branded HTML artifact for accessibility. Simulate screen reader navigation, keyboard-only usage, and color-blind rendering. Verify all interactive elements are focusable, all images have alt text, and all data visualizations have tabular alternatives."

*PMO-APEX v1.0 — Metaprompts · HTML Brand*
