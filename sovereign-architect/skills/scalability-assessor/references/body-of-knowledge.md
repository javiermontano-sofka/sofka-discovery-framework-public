# Scalability Assessor — Body of Knowledge

## Core Concepts
- **Horizontal scaling (scale-out)**: Adding more instances; requires stateless design and external state management `[HECHO]`
- **Vertical scaling (scale-up)**: Adding more resources to a single instance; simpler but has hard limits
- **CAP theorem**: In a distributed system you can have at most two of: Consistency, Availability, Partition tolerance `[HECHO]`
- **Stateless design**: No server-side session state; each request contains all necessary context
- **CQRS**: Command Query Responsibility Segregation — separate read and write paths for independent scaling
- **Eventual consistency**: In distributed systems, all replicas converge to the same state given enough time
- **Elasticity**: The ability to automatically scale resources up and down based on demand

## Patterns & Practices
- **Database scaling**: Read replicas for read-heavy workloads, sharding for write-heavy workloads
- **Caching tiers**: L1 (in-process) → L2 (distributed/Redis) → L3 (CDN) for progressive scale
- **Event-driven architecture**: Decouple producers and consumers for independent scaling via message queues
- **Microservices decomposition**: Scale individual services based on their specific resource needs
- **Auto-scaling policies**: CPU-based, request-rate-based, queue-depth-based, or custom metrics
- **Connection pooling**: PgBouncer, ProxySQL for database connection multiplexing at scale

## Tools & Technologies
- **Load balancers**: NGINX, HAProxy, AWS ALB, Envoy
- **Caching**: Redis, Memcached, Varnish, CDN (CloudFront, Cloudflare)
- **Message queues**: RabbitMQ, Kafka, SQS, NATS
- **Auto-scaling**: Kubernetes HPA/VPA, AWS Auto Scaling, KEDA

## References
- Martin Kleppmann — "Designing Data-Intensive Applications"
- Werner Vogels — "Eventually Consistent" (Amazon CTO)
- Google SRE Book — Capacity planning chapters
- AWS Well-Architected Framework — Performance efficiency pillar
