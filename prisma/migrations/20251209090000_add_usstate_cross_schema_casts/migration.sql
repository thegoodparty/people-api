-- Enable implicit casting between green."USState" and public."USState"
-- This allows comparisons between columns/parameters using different enum types
-- without altering existing tables or partition keys.

DO $$
BEGIN
  -- Cast from green.USState -> public.USState
  IF NOT EXISTS (
    SELECT 1
    FROM pg_cast c
    JOIN pg_type s ON c.castsource = s.oid
    JOIN pg_namespace sn ON s.typnamespace = sn.oid
    JOIN pg_type t ON c.casttarget = t.oid
    JOIN pg_namespace tn ON t.typnamespace = tn.oid
    WHERE sn.nspname = 'green' AND s.typname = 'USState'
      AND tn.nspname = 'public' AND t.typname = 'USState'
  ) THEN
    CREATE CAST ("green"."USState" AS public."USState") WITH INOUT AS IMPLICIT;
  END IF;

  -- Cast from public.USState -> green.USState (for symmetry and other callers)
  IF NOT EXISTS (
    SELECT 1
    FROM pg_cast c
    JOIN pg_type s ON c.castsource = s.oid
    JOIN pg_namespace sn ON s.typnamespace = sn.oid
    JOIN pg_type t ON c.casttarget = t.oid
    JOIN pg_namespace tn ON t.typnamespace = tn.oid
    WHERE sn.nspname = 'public' AND s.typname = 'USState'
      AND tn.nspname = 'green' AND t.typname = 'USState'
  ) THEN
    CREATE CAST (public."USState" AS "green"."USState") WITH INOUT AS IMPLICIT;
  END IF;
END $$;


