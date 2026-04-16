# Metaprompts — Risk Monitoring

## Meta-Strategy 1: Monitoring Completeness Check

**Purpose:** Ensure no risk category is under-monitored

```
Audit the risk monitoring coverage:
1. Are ALL register risks being actively monitored? Flag dormant risks.
2. Does every high-severity risk have a KRI? If not, define one.
3. Are emerging risk scans happening regularly? Check last scan date.
4. Are closed risks being verified as truly resolved? Prevent zombie risks.
5. Is the monitoring cadence appropriate for risk velocity? Fast-moving risks need more frequent checks.
```

## Meta-Strategy 2: False Signal Filtering

**Purpose:** Prevent alert fatigue from excessive or inaccurate risk signals

```
For each risk alert in the current period:
1. Is the threshold appropriately calibrated? (Too tight = noise, too loose = missed signals)
2. Was the previous alert acted upon? If not, why?
3. Is this a genuine signal or a data anomaly?
4. What is the signal-to-noise ratio for this KRI over the last 5 periods?
Tune thresholds to achieve 80% actionable alert rate.
```

## Meta-Strategy 3: Response Effectiveness Audit

**Purpose:** Verify risk responses are actually reducing risk, not just documented

```
For each active risk response:
1. Has the risk probability or impact actually decreased since response implementation?
2. Is the response still appropriate or has the risk context changed?
3. Are response actions being completed on time?
4. Is the response creating secondary risks?
Rate each response: Effective / Partially effective / Ineffective. Recommend changes for non-effective responses.
```

*PMO-APEX v1.0 — Metaprompts · Risk Monitoring*
