# Scalability Assessor — Sample Output

## Context
Assessing scalability of a Node.js API serving 5,000 concurrent users, targeting 50,000.

## Output

### Component Scalability Matrix

| Component | Stateful? | H-Scalable | V-Scalable | Bottleneck at |
|-----------|----------|-----------|-----------|---------------|
| API Server (Express) | No | Yes | Yes | 10k conn/instance `[HECHO]` |
| Session Store | **Yes (in-memory)** | **No** | Yes | Current scale `[HECHO]` |
| PostgreSQL (primary) | Yes | Read replicas | Yes | 500 connections `[HECHO]` |
| Redis Cache | No (external) | Cluster mode | Yes | 100k ops/s `[HECHO]` |
| File Uploads | **Yes (local disk)** | **No** | Limited | Current scale `[HECHO]` |
| Background Workers | No | Yes | Yes | Queue throughput `[HECHO]` |

### Scaling Bottleneck Order (what breaks first)
1. **In-memory sessions** — Cannot add API instances without losing sessions `[HECHO]`
2. **Local file storage** — Uploads only accessible from the instance that received them `[HECHO]`
3. **Database connections** — 500 max connections / 10 per instance = max 50 instances `[INFERENCIA]`
4. **Single write database** — Write throughput limited to single instance `[INFERENCIA]`

### Scaling Strategy to 50,000 Users

| Action | Effort | Impact | Priority |
|--------|--------|--------|----------|
| Move sessions to Redis | 1 day | Unblocks horizontal scaling | **P0** |
| Move file uploads to S3 | 2 days | Eliminates local state | **P0** |
| Add PgBouncer connection pooler | 0.5 days | 10x connection capacity | **P1** |
| Add read replicas (2x) | 1 day | 3x read throughput | **P1** |
| Configure HPA (3-15 pods) | 0.5 days | Auto-scaling | **P2** |

### Capacity Estimate
After P0+P1 changes: system can support ~60,000 concurrent users `[SUPUESTO]` (assumes 80% read traffic, avg 2 DB queries per request).
