# Incident Analyzer — Use Case Prompts

## Prompt 1: Production Outage Post-Mortem
> "We had a 90-minute production outage yesterday. The payment service stopped processing transactions after a deployment. The immediate fix was a rollback. Analyze the codebase for what caused this, what made detection slow, and what similar risks exist elsewhere."

## Prompt 2: Intermittent Failure Investigation
> "Our users are reporting intermittent 500 errors on the checkout flow, happening roughly 5% of the time. We can't reproduce it locally. Analyze the codebase for race conditions, timeout misconfigurations, and retry logic that could cause intermittent failures in the checkout path."

## Prompt 3: Near-Miss Analysis
> "Our monitoring caught a memory spike that almost caused an OOM kill on the worker service. It self-recovered when traffic dropped. Treat this as a near-miss incident: identify the contributing factors, search for similar patterns, and recommend preventive measures before it becomes a real outage."
