## People API – Filtering and Full Projection Plan

### Goal

Add server-side filters to `GET /v1/people/list` and return a limited set of columns matching the "full" projection defined in gp-api.

Reference for field projection: [gp-api voterFile.util.ts (full projection)](https://github.com/thegoodparty/gp-api/blob/8a59b206fec95d69d231289bfbb8c8054ffefbdd/src/voters/voterFile/util/voterFile.util.ts#L69-L148)

### Filters to support

- audience_superVoters
- audience_likelyVoters
- audience_unreliableVoters
- audience_unlikelyVoters
- audience_firstTimeVoters
- party_independent
- party_democrat
- party_republican
- age_18_25
- age_25_35
- age_35_50
- age_50_plus
- gender_male
- gender_female
- gender_unknown
- audience_request

### Plan of Work (Todo Items)

1. Define zod schema for filters and `full` flag in `src/people/people.schema.ts` (new DTO)
2. Extract exact "full" projection field list from gp-api and codify a Prisma `select` map
3. Implement filter-to-Prisma translation in a new utility (e.g., `src/people/filters.ts`)
4. Implement age bucket filters using safe casting (SQL) or precomputed logic
5. Update `PeopleService.findPeople` to apply filters, selection (full), and keep pagination intact
6. Update `PeopleController.list` to accept new query params, wire new DTO
7. Add Swagger annotations for new params and response shape (limited fields)
8. Add basic tests (or manual query examples) verifying filters and selection
9. Update README/API docs with examples and the projection behavior

### Notes and Decisions

- Gender: map `gender_male|female|unknown` to `Voters_Gender IN ('M','F','')` across state models
- Party: map to `Parties_Description` substrings or exact matches (D/R/Independent/No Party) per data
- Age buckets: cast `Voters_Age` to integer in SQL for range filters; fall back to post-filter if needed
- Audience filters: replicate logic from gp-api (turnout/performance) to align results

### Acceptance Criteria

- Query validation rejects any filter not in the allowlist
- `full=true` returns only the documented fields; `full=false` returns a safe minimal set
- Combining multiple filters applies AND logic (documented)
- Pagination, `resultsPerPage`, and `page` still work correctly

### Review (to be completed after implementation)

- Summary of code changes
- Any deviations from gp-api and why
- Test cases and sample queries
