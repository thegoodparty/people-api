### People API – Streaming CSV Download Plan

#### Scope

- Add a streaming CSV download endpoint to `people-api` that mirrors the filters and selection logic of the list endpoint and can be proxied by `gp-api` to the end user.
- Accept parameters including state, election year, district-based scoping, and filters. Support aliases for `electionLocation` and `electionType` mapping to our existing `districtType` and `districtName` inputs.
- Stream CSV rows paginated from the database with backpressure handling, low memory footprint, and safe termination on disconnect.

#### API Contract (proposed)

- Method: GET
- Path: `v1/people/download`
- Query params:
  - `state` (required): Two-letter state code.
  - `electionYear` (optional; default current year): integer.
  - `districtType` (optional) OR alias `electionLocation` (optional): name of a district column in `Voter`.
  - `districtName` (optional) OR alias `electionType` (optional): value to match in the `districtType` column.
  - `filters` (optional; repeatable): same as list endpoint (camelCase; numeric splits use underscore like `age25_35`). Legacy snake_case accepted and normalized.
  - `full` (optional; default true): influences which columns are included.

Notes:

- `electionLocation` → map to `districtType`.
- `electionType` → map to `districtName`.

#### CSV Columns

- Base columns (always): `LALVOTERID`, `State`, `FirstName`, `LastName`, `Residence_Addresses_City`, `Residence_Addresses_State`, `Residence_Addresses_Zip`.
- Audience and demographics: `Age`, `Gender`, `Parties_Description`.
- District scoping echo: `electionLocation`, `electionType` (echo the inputs for clarity in exports).
- When `full=true`, include the full selection used in the current list `full` mode, plus relevant turnout columns for the requested `electionYear` (e.g., `General_<year>`, `Primary_<year>`, `OtherElection_<year>`; and `PresidentialPrimary_<year>` on 4-year cycles). When `full=false`, use the minimal set.

#### Implementation Tasks

1. DTO and Validation

   - Create `DownloadPeopleDTO` in `src/people/people.schema.ts` with the same validations as `ListPeopleDTO`.
   - Accept aliases: preprocess to map `electionLocation` → `districtType`, `electionType` → `districtName`.
   - Normalize `filters` to camelCase (keep numeric underscore for age ranges).

2. Controller Endpoint

   - Add `GET /people/download` in `src/people/people.controller.ts`.
   - Use Fastify `Reply` with headers:
     - `Content-Type: text/csv`
     - `Content-Disposition: attachment; filename="people.csv"`
   - Call a new service method `streamPeopleCsv(dto, reply)` and return the stream.

3. Service: Streaming Logic

   - Implement `streamPeopleCsv` in `src/people/people.service.ts`.
   - Reuse existing `buildWhere` and `buildVoterSelect(full, electionYear)` to compute Prisma where/select.
   - Pagination/streaming:
     - Use stable ordering by `LALVOTERID`.
     - Iterate with cursor-based pagination (preferred) or `skip/take` if needed; default page size ~5,000–10,000.
     - After each page, write rows to the CSV stream and flush.
   - CSV writing:
     - Option A (recommended): use `fast-csv` (streaming) to handle escaping/quoting.
     - Option B: manual CSV writer for minimal dependencies (ensure RFC 4180 escaping: quotes, commas, newlines, and nulls).
   - Write header row once based on selected columns.
   - Include `electionLocation` and `electionType` columns in every row by echoing `districtType`/`districtName` request values.
   - Backpressure and abort:
     - Check `reply.raw.aborted` / `onClose` to stop iteration early.
     - Guard against long-running queries; chunk work to maintain responsiveness.
   - Error handling:
     - On error, log and end stream gracefully; avoid partial line corruption.

4. Dependencies (if using `fast-csv`)

   - Add dependency: `fast-csv`.
   - Wire a small CSV utility to construct headers and row mapping.

5. Security & Limits

   - Consider applying the existing S2S auth guard if required for download.
   - Enforce reasonable maximum rows (optional server-side cap) or rely on campaign scoping and filters.

6. Observability

   - Log start/end, params hash, elapsed time, rows streamed, and early-termination events.

7. Documentation

   - Add endpoint to Swagger with basic description and parameters.
   - Provide example `curl` and expected CSV header.

8. Testing
   - Unit: filters normalization and DTO alias mapping.
   - Integration: small dataset streaming, cursor pagination across page boundaries, disconnect mid-stream.
   - Manual: `curl -G` download with representative filters and district scoping, confirm CSV integrity in a spreadsheet.

#### Acceptance Criteria

- Endpoint streams CSV with chunked transfer and minimal memory growth across large datasets.
- Supports `electionLocation`/`electionType` as aliases for `districtType`/`districtName`.
- Filters behave identically to the list endpoint (camelCase with numeric underscores).
- CSV includes the two alias columns and the agreed base/minimal columns; `full=true` expands to the full selection.
- Early client disconnects do not continue database work; stream closes cleanly.

#### Example

Request:
`GET /v1/people/download?state=CA&electionYear=2024&electionLocation=US_Congressional_District&electionType=12&filters=audienceSuperVoters&filters=age25_35`

First CSV row (header, minimal):
`LALVOTERID,State,FirstName,LastName,Residence_Addresses_City,Residence_Addresses_State,Residence_Addresses_Zip,Age,Gender,Parties_Description,electionLocation,electionType`

#### References

- Prior implementation inspiration: `gp-api` voter database service (CSV/streaming patterns) [`https://github.com/thegoodparty/gp-api/blob/465c3983f844f5530d49bd97fec50ce25563c57c/src/voters/services/voterDatabase.service.ts`](https://github.com/thegoodparty/gp-api/blob/465c3983f844f5530d49bd97fec50ce25563c57c/src/voters/services/voterDatabase.service.ts)
