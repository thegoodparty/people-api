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

-- Language_Code
CREATE INDEX IF NOT EXISTS voter_language_code_id_idx
ON green."Voter" ("Language_Code", "id");

-- Veteran_Status
CREATE INDEX IF NOT EXISTS voter_veteran_status_id_idx
ON green."Voter" ("Veteran_Status", "id");

-- Marital_Status
CREATE INDEX IF NOT EXISTS voter_marital_status_id_idx
ON green."Voter" ("Marital_Status", "id");

-- Education_Of_Person
CREATE INDEX IF NOT EXISTS voter_education_of_person_id_idx
ON green."Voter" ("Education_Of_Person", "id");

-- Parties_Description
CREATE INDEX IF NOT EXISTS voter_parties_description_id_idx
ON green."Voter" ("Parties_Description", "id");

-- Business_Owner
CREATE INDEX IF NOT EXISTS voter_business_owner_id_idx
ON green."Voter" ("Business_Owner", "id");

-- Homeowner_Probability_Model
CREATE INDEX IF NOT EXISTS voter_homeowner_probability_model_id_idx
ON green."Voter" ("Homeowner_Probability_Model", "id");
