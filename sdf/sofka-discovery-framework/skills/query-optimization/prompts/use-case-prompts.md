# Use Case Prompts — Query Optimization

## Scenario 1: Read EXPLAIN ANALYZE and Prescribe Fix

```
Read this EXPLAIN ANALYZE output and identify the bottleneck:

Seq Scan on orders  (cost=0.00..285432.00 rows=1234 width=8)
                    (actual time=0.052..2847.123 rows=1234 loops=1)
  Filter: (user_id = 42 AND status = 'pending')
  Rows Removed by Filter: 9998766
Planning Time: 0.3 ms
Execution Time: 2847.4 ms

Table: orders (10M rows)
Available columns: id, user_id, status, created_at, total_cents

Deliver:
1. Root cause analysis
2. Recommended index type and definition
3. Expected plan after index creation
4. CREATE INDEX CONCURRENTLY statement
5. How to verify the fix worked
```

## Scenario 2: Detect and Fix N+1 in Prisma

```
Scan the following service code for N+1 query patterns and fix them:

async function getDashboard(orgId: string) {
  const projects = await db.project.findMany({
    where: { organizationId: orgId },
    take: 50,
  });

  const projectsWithStats = await Promise.all(
    projects.map(async (project) => {
      const taskCount = await db.task.count({
        where: { projectId: project.id },
      });
      const recentActivity = await db.activity.findFirst({
        where: { projectId: project.id },
        orderBy: { createdAt: 'desc' },
      });
      return { ...project, taskCount, recentActivity };
    })
  );

  return projectsWithStats;
}

Deliver:
1. N+1 analysis — how many queries current code runs for 50 projects
2. Optimized version using Prisma include/_count
3. Query count comparison (before vs. after)
4. Edge cases to handle in optimized version
```

## Scenario 3: Design Indexes for Complex Query

```
Design the optimal index strategy for these 3 queries on the 'events' table
(50M rows: id, user_id, event_type, properties JSONB, created_at):

Query 1: WHERE user_id = ? ORDER BY created_at DESC LIMIT 20
Query 2: WHERE event_type = 'page_view' AND created_at > NOW() - INTERVAL '7 days'
Query 3: WHERE properties @> '{"campaign_id": "abc123"}'

For each query:
1. Identify what index type is needed
2. Provide CREATE INDEX CONCURRENTLY statement
3. Explain the column order decision for composite indexes
4. Estimate query performance improvement
```

## Scenario 4: Optimize High-Traffic API Endpoint

```
This API endpoint is called 500 times/second and takes 200ms average.
EXPLAIN shows a Seq Scan despite an index existing. pg_stat_statements shows
this query accounts for 40% of total database time.

SELECT p.*, u.name as author_name, COUNT(c.id) as comment_count
FROM posts p
JOIN users u ON u.id = p.author_id
LEFT JOIN comments c ON c.post_id = p.id
WHERE p.status = 'published'
  AND p.published_at > NOW() - INTERVAL '30 days'
GROUP BY p.id, u.name
ORDER BY p.published_at DESC
LIMIT 20;

Investigate:
1. Why might the planner choose Seq Scan despite existing index?
2. How does stale statistics contribute?
3. What is the N+1 risk in the GROUP BY + COUNT pattern?
4. Design the optimal index(es) for this query
5. Consider: should comment_count be a materialized counter instead?
```

## Scenario 5: Set Up Query Monitoring

```
Set up comprehensive query monitoring for a production PostgreSQL database.
The team currently has zero visibility into slow queries.

Requirements:
- Identify top 10 slowest queries by total time
- Alert when a query exceeds 500ms average
- Track query plan changes over time
- Integrate with existing Grafana/Prometheus stack

Deliver:
1. pg_stat_statements setup and configuration
2. Grafana dashboard queries for pg_stat_statements data
3. Prometheus postgres_exporter configuration
4. Alert rules for slow queries
5. SQL query for weekly slow query report
6. Recommended connection to pganalyze or similar SaaS (with vs. DIY trade-off)
```
