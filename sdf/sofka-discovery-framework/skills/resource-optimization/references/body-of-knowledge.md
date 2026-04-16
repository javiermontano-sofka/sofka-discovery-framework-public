# Body of Knowledge — Resource Optimization

## 1. Definition and Scope

Resource optimization encompasses techniques for adjusting activity start and finish dates to balance resource demand with available supply. It includes resource leveling (adjusting schedule to resolve overallocation) and resource smoothing (optimizing within float without extending the critical path). [DOC]

## 2. Foundational Frameworks

| Framework | Source | Key Contribution |
|-----------|--------|-----------------|
| PMBOK Resource Management | PMI, 2021 | Leveling and smoothing techniques |
| Critical Chain PM | Goldratt, 1997 | Buffer-based resource management |
| Theory of Constraints | Goldratt, 1984 | Bottleneck identification |
| Lean Resource Management | Womack & Jones, 1996 | Waste elimination in allocation |
| Agile Capacity Planning | SAFe, 2023 | Iterative resource balancing |

## 3. Optimization Techniques

| Technique | Goal | Trade-off | Best For |
|-----------|------|-----------|----------|
| Resource Leveling | Eliminate overallocation | May extend schedule | Fixed resources |
| Resource Smoothing | Even distribution within float | Limited optimization | Fixed deadline |
| Fast Tracking | Parallelize activities | Increased risk | Schedule compression |
| Crashing | Add resources to compress | Increased cost | Critical activities |
| Resource Pooling | Share resources across projects | Coordination overhead | Multi-project |

## 4. Optimization Process

1. **Demand analysis** — Map resource needs per activity per period [PLAN]
2. **Supply assessment** — Document available resources, skills, capacity
3. **Gap identification** — Compare demand vs. supply, identify over/under allocation
4. **Optimization execution** — Apply leveling/smoothing algorithms
5. **Impact analysis** — Assess schedule and cost impact of optimization
6. **Stakeholder agreement** — Confirm optimized plan with resource owners [STAKEHOLDER]

## 5. Resource Utilization Targets

| Role Type | Optimal Utilization | Rationale |
|-----------|-------------------|-----------|
| Individual contributor | 75-85% | Buffer for meetings, learning, unexpected work |
| Technical lead | 60-70% | Mentoring, reviews, architecture decisions |
| Manager | 40-50% | People management, planning, stakeholder engagement |
| Shared specialist | 70-80% | Cross-project context switching overhead |

## 6. Multi-Project Optimization

| Challenge | Approach | Tool |
|-----------|----------|------|
| Resource contention | Priority-based allocation matrix | Portfolio resource view |
| Context switching | Minimize project assignments per person | WIP limits |
| Skill bottlenecks | Cross-training, knowledge transfer | Skills matrix |
| Seasonal demand | Flexible staffing, contractors | Capacity planning |

## 7. Key Metrics

| Metric | Formula | Target |
|--------|---------|--------|
| Resource Utilization | Productive hours / Available hours | 75-85% |
| Allocation Efficiency | Value-producing work / Total allocated time | ≥ 60% |
| Overallocation Index | Overallocated periods / Total periods | < 10% |
| Bench Time | Unallocated hours / Available hours | < 15% |
| Context Switch Rate | Project transitions per week per person | ≤ 2 |

## 8. Academic and Industry References

1. PMI. *PMBOK Guide — Resource Management*, 2021
2. Goldratt, E. *Critical Chain*, North River Press, 1997
3. Goldratt, E. *The Goal*, North River Press, 1984
4. Womack, J. & Jones, D. *Lean Thinking*, Free Press, 1996
5. SAFe. *Agile Capacity Planning*, Scaled Agile, 2023
6. Leach, L. *Critical Chain Project Management*, Artech House, 2014
7. Meredith, J. & Mantel, S. *Project Management: A Managerial Approach*, Wiley, 2017

*PMO-APEX v1.0 — Body of Knowledge · Resource Optimization*
