CREATE TABLE green."DistrictVoter_new" (
    "district_id" uuid        NOT NULL,
    "voter_id"    uuid        NOT NULL,
    "created_at"  timestamptz NOT NULL DEFAULT now(),
    "updated_at"  timestamptz NOT NULL DEFAULT now(),
    "State"       "USState"   NOT NULL

    
) PARTITION BY LIST ("State");

-- Partitions:
CREATE TABLE green."DistrictVoter_new_AL" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('AL');
CREATE TABLE green."DistrictVoter_new_AK" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('AK');
CREATE TABLE green."DistrictVoter_new_AZ" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('AZ');
CREATE TABLE green."DistrictVoter_new_AR" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('AR');
CREATE TABLE green."DistrictVoter_new_CA" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('CA');
CREATE TABLE green."DistrictVoter_new_CO" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('CO');
CREATE TABLE green."DistrictVoter_new_CT" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('CT');
CREATE TABLE green."DistrictVoter_new_DC" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('DC');
CREATE TABLE green."DistrictVoter_new_DE" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('DE');
CREATE TABLE green."DistrictVoter_new_FL" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('FL');
CREATE TABLE green."DistrictVoter_new_GA" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('GA');
CREATE TABLE green."DistrictVoter_new_HI" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('HI');
CREATE TABLE green."DistrictVoter_new_ID" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('ID');
CREATE TABLE green."DistrictVoter_new_IL" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('IL');
CREATE TABLE green."DistrictVoter_new_IN" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('IN');
CREATE TABLE green."DistrictVoter_new_IA" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('IA');
CREATE TABLE green."DistrictVoter_new_KS" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('KS');
CREATE TABLE green."DistrictVoter_new_KY" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('KY');
CREATE TABLE green."DistrictVoter_new_LA" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('LA');
CREATE TABLE green."DistrictVoter_new_ME" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('ME');
CREATE TABLE green."DistrictVoter_new_MD" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('MD');
CREATE TABLE green."DistrictVoter_new_MA" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('MA');
CREATE TABLE green."DistrictVoter_new_MI" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('MI');
CREATE TABLE green."DistrictVoter_new_MN" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('MN');
CREATE TABLE green."DistrictVoter_new_MS" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('MS');
CREATE TABLE green."DistrictVoter_new_MO" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('MO');
CREATE TABLE green."DistrictVoter_new_MT" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('MT');
CREATE TABLE green."DistrictVoter_new_NE" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('NE');
CREATE TABLE green."DistrictVoter_new_NV" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('NV');
CREATE TABLE green."DistrictVoter_new_NH" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('NH');
CREATE TABLE green."DistrictVoter_new_NJ" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('NJ');
CREATE TABLE green."DistrictVoter_new_NM" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('NM');
CREATE TABLE green."DistrictVoter_new_NY" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('NY');
CREATE TABLE green."DistrictVoter_new_NC" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('NC');
CREATE TABLE green."DistrictVoter_new_ND" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('ND');
CREATE TABLE green."DistrictVoter_new_OH" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('OH');
CREATE TABLE green."DistrictVoter_new_OK" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('OK');
CREATE TABLE green."DistrictVoter_new_OR" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('OR');
CREATE TABLE green."DistrictVoter_new_PA" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('PA');
CREATE TABLE green."DistrictVoter_new_RI" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('RI');
CREATE TABLE green."DistrictVoter_new_SC" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('SC');
CREATE TABLE green."DistrictVoter_new_SD" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('SD');
CREATE TABLE green."DistrictVoter_new_TN" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('TN');
CREATE TABLE green."DistrictVoter_new_TX" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('TX');
CREATE TABLE green."DistrictVoter_new_UT" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('UT');
CREATE TABLE green."DistrictVoter_new_VT" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('VT');
CREATE TABLE green."DistrictVoter_new_VA" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('VA');
CREATE TABLE green."DistrictVoter_new_WA" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('WA');
CREATE TABLE green."DistrictVoter_new_WV" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('WV');
CREATE TABLE green."DistrictVoter_new_WI" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('WI');
CREATE TABLE green."DistrictVoter_new_WY" PARTITION OF green."DistrictVoter_new" FOR VALUES IN ('WY');

