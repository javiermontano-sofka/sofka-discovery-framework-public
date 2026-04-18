# `[CONFIG]`

- **Priority**: 3 / 8
- **Class (CSS)**: `t td`

## When to use

A claim grounded in a configuration file or environment declaration: `.env`, `*.yaml`, `*.yml`, `*.json`, `pom.xml`, `package.json`, `settings.py`, `application.properties`, Terraform HCL, Kubernetes manifests, docker-compose, SAP transport configs.

## Locator format

```
[CONFIG:<path>:<key-or-line>]
[CONFIG:.env.prod:DB_POOL_SIZE]
[CONFIG:k8s/deploy.yaml:spec.replicas]
[CONFIG:pom.xml:line=84]
```

Prefer key-path over line number when structure is clear (survives reformatting).

## Examples

- `El pool de conexiones es 50 [CONFIG:.env.prod:DB_POOL_SIZE]`
- `El cluster corre 3 réplicas [CONFIG:k8s/payments.yaml:spec.replicas]`

## NOT to use for

- Runtime values (actual env seen during execution) — that's `[CÓDIGO]` from the boot logs.
- Infrastructure-as-code with conditional logic — the conditional is code; the rendered config is config. Tag the layer you're reading.

## Reviewer check

File opens at the key. Value matches claim. If multiple environments exist, cite the one relevant to the claim (prod, staging, dev).
