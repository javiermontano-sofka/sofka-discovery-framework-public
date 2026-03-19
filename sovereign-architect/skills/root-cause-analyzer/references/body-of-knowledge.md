# Root Cause Analyzer — Body of Knowledge

## Core Concepts
- **5 Whys**: Iteratively asking "why?" to peel back layers of causation until reaching the root `[HECHO]`
- **Ishikawa (fishbone) diagram**: Categorizing potential causes by type: people, process, technology, environment
- **Fault tree analysis**: Top-down deductive analysis using Boolean logic to map failure combinations
- **Proximate vs. root cause**: Proximate cause is the immediate trigger; root cause is the systemic condition that allowed it
- **Contributing factors**: Conditions that didn't cause the issue but made it possible or worse
- **Systemic causes**: Organizational or process-level issues that allow classes of problems to recur

## Patterns & Practices
- **Timeline reconstruction**: Build a precise timeline of events leading to the symptom to establish causation order
- **Change correlation**: Check version control, deployment logs, and config changes within the symptom window
- **Counterfactual reasoning**: "If we removed this cause, would the symptom still occur?" validates root cause identification
- **Blame-free analysis**: Focus on system design, not individual actions; humans make errors, systems should prevent impact
- **Causal chain documentation**: Each link in the chain should answer "because" from the previous link

## Tools & Technologies
- **Version control**: Git log, blame, bisect for change correlation
- **Monitoring**: APM traces, log aggregation, error tracking (Sentry, Datadog, Elastic)
- **Debugging**: Debuggers, profilers, network inspectors
- **Diagramming**: Mermaid, draw.io for causal chain and fault tree visualization

## References
- Taiichi Ohno — "Toyota Production System" (5 Whys origin)
- Sidney Dekker — "The Field Guide to Understanding Human Error"
- John Allspaw — "Etsy Debriefing Facilitation Guide" (blameless post-mortems)
- Google SRE Book — Chapter on postmortem culture
