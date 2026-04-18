# `[DOC]`

- **Priority**: 4 / 8
- **Class (CSS)**: `t td`

## When to use

A claim grounded in official written documentation: product docs, vendor manuals, RFCs, published API specs, internal wikis (where stable), whitepapers. Written artefacts with an owner and a published status.

## Locator format

```
[DOC:<source-id>:<locator>]
[DOC:aws-vpc-guide:section=subnets]
[DOC:rfc-7231:section=4.3.5]
[DOC:confluence:page=Deployment-Runbook]
```

Source-id should be recognizable (vendor+doc name, RFC number, confluence page title). Locator as fine-grained as possible.

## Examples

- `AWS VPC soporta peering cross-region desde 2017 [DOC:aws-vpc-guide:section=peering]`
- `HTTP DELETE debe ser idempotente [DOC:rfc-7231:section=4.3.5]`

## NOT to use for

- Marketing pages or blog posts (weaker than `[INFERENCIA]`).
- Internal wikis known to be stale — downgrade to `[INFERENCIA]` with a note.
- User-supplied documents — that's `[ADJUNTO]`.

## Reviewer check

Source exists at the locator. Claim matches the cited content (not a paraphrase that drifts in meaning).
