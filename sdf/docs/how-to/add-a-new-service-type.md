# How to add a new service type

**When you need this**: An engagement pattern emerges that doesn't fit the existing 10 `{TIPO_SERVICIO}` values.

**Warning**: Service types are a routing key. Adding one needs alignment with committee composition + pipeline variants. Not a casual change.

**Time**: 2-3 h including ADR.

## Steps

1. **Write an ADR** justifying the new type:

   - Context — why existing 10 don't cover it.
   - Decision — new value + slug.
   - Consequences — committee composition, pipeline variants.
   - Alternatives — why not extending an existing type.

2. **Create the service-type spec**: `sdf/docs/reference/service-types/<slug>.md` following the pattern of existing specs (scope signal, committee, pipeline variant, typical deliverables, anti-patterns).

3. **Update routing**: `sdf/references/ontology/service-routing.md` — add the new type + committee.

4. **Update agent-committee**: `sdf/references/ontology/agent-committee.md` — which specialists activate for this type.

5. **Update validator manifest**: `sdf/scripts/validators/_manifest.yaml` → `counts.service_types: 11`.

6. **Update service-types README**: `sdf/docs/reference/service-types/README.md` — add row.

7. **Update prompts** where the orchestrator asks for `{TIPO_SERVICIO}`: add the new value to the choice list.

8. **Run validators**:

   ```bash
   bash sdf/scripts/validators/run-all.sh
   ```

## Verification

- `count-parity.py` passes with updated count.
- `/sdf:run-auto --tipo <new>` routes to the expected committee.
- Service-type README lists 11.

## Common pitfalls

- Adding a type that overlaps with an existing one — prefer extending (service-routing rules can refine within a type).
- Forgetting the committee update → orchestrator uses default committee, defeating the routing point.
- Missing the prompt list update → users can't set the new type without manually editing state.

## See also

- [ADR-0007](../adr/0007-service-type-routing.md)
- [`../reference/service-types/`](../reference/service-types/README.md)
