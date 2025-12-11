-- begin Voter_new
ALTER TABLE green."Voter_new"
    ADD CONSTRAINT "Voter_new_pkey"
    PRIMARY KEY ("State", "id");

ALTER TABLE green."Voter_new"
    ADD CONSTRAINT "Voter_new_LALVOTERID_state_uniq"
    UNIQUE ("State", "LALVOTERID");
-- end Voter_new
-------------------------------------------
-- begin District
ALTER TABLE green."District"
    ADD CONSTRAINT "District_pkey"
    PRIMARY KEY ("id");

ALTER TABLE green."District"
    ADD CONSTRAINT "District_type_name_state_uniq"
    UNIQUE ("state", "type", "name");
-- end District
-------------------------------------------
-- begin DistrictVoter_new
ALTER TABLE green."DistrictVoter_new"
    ADD CONSTRAINT "DistrictVoter_new_pkey"
    PRIMARY KEY ("State", "district_id", "voter_id");

-- Foreign Keys
ALTER TABLE green."DistrictVoter_new"
    ADD CONSTRAINT "DistrictVoter_new_district_fk"
    FOREIGN KEY ("district_id")
    REFERENCES green."District"("id");

ALTER TABLE green."DistrictVoter_new"
    ADD CONSTRAINT "DistrictVoter_new_voter_fk"
    FOREIGN KEY ("State", "voter_id")
    REFERENCES green."Voter_new"("State", "id");
-- end DistrictVoter_new
-------------------------------------------

CREATE INDEX "Voter_Age_Int_idx" ON green."Voter_new_AK" USING btree ("Age_Int")