-- Verify partition pruning and index usage

-- 1) People list ordering by LastName, FirstName within a state
EXPLAIN (ANALYZE, BUFFERS)
SELECT "id","LastName","FirstName"
FROM "Voter"
WHERE "State" = :state
ORDER BY "LastName" ASC, "FirstName" ASC
LIMIT 50;

-- 2) People search with district filter; ensure DistrictVoter partition is pruned by state
EXPLAIN (ANALYZE, BUFFERS)
SELECT count(*)
FROM "Voter" v
WHERE v."State" = :state
  AND EXISTS (
    SELECT 1
    FROM "DistrictVoter" dv
    WHERE dv."voter_id" = v."id"
      AND dv."district_id" = :districtId
      AND dv."state" = :state
  );

-- 3) Stats: Top-N example using Parties_Description
EXPLAIN (ANALYZE, BUFFERS)
SELECT "Parties_Description", count(*)
FROM "Voter"
WHERE "State" = :state
GROUP BY "Parties_Description";

-- 4) Numeric bucket counts example (Age_Int ranges)
EXPLAIN (ANALYZE, BUFFERS)
SELECT
  sum(CASE WHEN "Age_Int" BETWEEN 18 AND 25 THEN 1 ELSE 0 END) AS b1,
  sum(CASE WHEN "Age_Int" > 25 AND "Age_Int" <= 35 THEN 1 ELSE 0 END) AS b2,
  sum(CASE WHEN "Age_Int" > 35 AND "Age_Int" <= 50 THEN 1 ELSE 0 END) AS b3,
  sum(CASE WHEN "Age_Int" > 50 THEN 1 ELSE 0 END) AS b4,
  sum(CASE WHEN "Age_Int" IS NULL THEN 1 ELSE 0 END) AS unknown
FROM "Voter"
WHERE "State" = :state;

-- 5) Sampling: TABLESAMPLE within a state
EXPLAIN (ANALYZE, BUFFERS)
SELECT "id"
FROM "Voter" TABLESAMPLE SYSTEM (:percent) REPEATABLE (:seed)
WHERE "State" = :state
LIMIT :limit;


