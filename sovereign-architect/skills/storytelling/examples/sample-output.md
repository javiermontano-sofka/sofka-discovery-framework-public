# Storytelling — Sample Output

## Context

A team completed a 6-month platform modernization. The CTO wants a presentation
for the all-hands meeting that communicates what was achieved and why it matters.

## Output

### Narrative Arc Design

**Structure**: Three-Act (Contrast Narrative)

### Act 1 — The Breaking Point (Setup)

**Hook**: Last March, our checkout service went down for 3 hours during a flash sale.
We lost an estimated 12,000 orders. The engineering team spent 47 minutes just
finding the right logs. That incident was not an anomaly — it was the symptom of
an architecture that had outgrown its design.

**The World Before**: Our monolith served us well for five years. But by 2025,
every deployment was a 4-hour ceremony involving 6 teams. Our deployment frequency
had dropped to twice per month. New features that should have taken days were taking
weeks because every change touched shared code.

### Act 2 — The Journey (Confrontation)

**The Decision**: We could keep patching the monolith, or we could invest 6 months
in extracting the three highest-value domains: Checkout, Inventory, and Notifications.
We chose to invest — and the first month was the hardest.

**The Struggle**: Domain extraction revealed 47 hidden dependencies we did not know
existed. Our dependency analysis showed that Checkout was coupled to 12 other modules
through shared database tables. The team had to make difficult decisions about data
ownership that challenged five years of convention.

**The Turning Point**: In month 3, the first extracted service (Notifications) went
live independently. For the first time, one team could deploy without coordinating
with five others. Deployment time dropped from 4 hours to 12 minutes for that service.

### Act 3 — The New World (Resolution)

**The Result**: Six months later, three services run independently. Deployment
frequency: from 2x/month to 47x/month. Mean time to recovery: from 3 hours to
14 minutes. The checkout flash sale we dreaded? It happened last month. Zero downtime.
18,000 orders processed without a single page.

**What Comes Next**: We are applying the same pattern to three more domains in Q2.
The platform team is building the self-service tooling that will make future
extractions 3x faster.

**The Lesson**: Modernization is not a technology project. It is a capability
investment. The architecture serves the team, and the team serves the customer.
