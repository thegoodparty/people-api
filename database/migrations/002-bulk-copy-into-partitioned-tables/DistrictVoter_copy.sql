DROP FUNCTION IF EXISTS green.migrate_districtvoter_state(text);

CREATE OR REPLACE FUNCTION green.migrate_districtvoter_state(_state text)
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
  RAISE NOTICE 'Migrating DistrictVoter for state %', _state;

  INSERT INTO green."DistrictVoter_new" (
      "district_id",
      "voter_id",
      "created_at",
      "updated_at",
      "State"
  )
  SELECT
      dv."district_id",
      dv."voter_id",
      dv."created_at",
      dv."updated_at",
      d.state          -- <-- lowercase, coming from District
  FROM green."DistrictVoter" dv
  JOIN green."District" d
    ON d."id" = dv."district_id"
  WHERE d.state = _state::"USState";   -- <-- lowercase here too
END;
$$;

SELECT green.migrate_districtvoter_state('AL');
SELECT green.migrate_districtvoter_state('AK');
SELECT green.migrate_districtvoter_state('AZ');
SELECT green.migrate_districtvoter_state('AR');
SELECT green.migrate_districtvoter_state('CA');
SELECT green.migrate_districtvoter_state('CO');
SELECT green.migrate_districtvoter_state('CT');
SELECT green.migrate_districtvoter_state('DC');
SELECT green.migrate_districtvoter_state('DE');
SELECT green.migrate_districtvoter_state('FL');
SELECT green.migrate_districtvoter_state('GA');
SELECT green.migrate_districtvoter_state('HI');
SELECT green.migrate_districtvoter_state('ID');
SELECT green.migrate_districtvoter_state('IL');
SELECT green.migrate_districtvoter_state('IN');
SELECT green.migrate_districtvoter_state('IA');
SELECT green.migrate_districtvoter_state('KS');
SELECT green.migrate_districtvoter_state('KY');
SELECT green.migrate_districtvoter_state('LA');
SELECT green.migrate_districtvoter_state('ME');
SELECT green.migrate_districtvoter_state('MD');
SELECT green.migrate_districtvoter_state('MA');
SELECT green.migrate_districtvoter_state('MI');
SELECT green.migrate_districtvoter_state('MN');
SELECT green.migrate_districtvoter_state('MS');
SELECT green.migrate_districtvoter_state('MO');
SELECT green.migrate_districtvoter_state('MT');
SELECT green.migrate_districtvoter_state('NE');
SELECT green.migrate_districtvoter_state('NV');
SELECT green.migrate_districtvoter_state('NH');
SELECT green.migrate_districtvoter_state('NJ');
SELECT green.migrate_districtvoter_state('NM');
SELECT green.migrate_districtvoter_state('NY');
SELECT green.migrate_districtvoter_state('NC');
SELECT green.migrate_districtvoter_state('ND');
SELECT green.migrate_districtvoter_state('OH');
SELECT green.migrate_districtvoter_state('OK');
SELECT green.migrate_districtvoter_state('OR');
SELECT green.migrate_districtvoter_state('PA');
SELECT green.migrate_districtvoter_state('RI');
SELECT green.migrate_districtvoter_state('SC');
SELECT green.migrate_districtvoter_state('SD');
SELECT green.migrate_districtvoter_state('TN');
SELECT green.migrate_districtvoter_state('TX');
SELECT green.migrate_districtvoter_state('UT');
SELECT green.migrate_districtvoter_state('VT');
SELECT green.migrate_districtvoter_state('VA');
SELECT green.migrate_districtvoter_state('WA');
SELECT green.migrate_districtvoter_state('WV');
SELECT green.migrate_districtvoter_state('WI');
SELECT green.migrate_districtvoter_state('WY');
