-- SCHEMA: adjust "green" if needed
CREATE TABLE green."Voter_new" (
    -- Core Voter Information
    "id"                        uuid        NOT NULL,
    "created_at"                timestamptz NOT NULL DEFAULT now(),
    "updated_at"                timestamptz NOT NULL DEFAULT now(),
    "LALVOTERID"                text        NOT NULL,
    "State"                     "USState"   NOT NULL, -- enum, new type

    "AbsenteeTypes_Description" text,
    "Active"                    text,
    "Age"                       text,
    "Age_Int"                   integer,
    "FirstName"                 text,
    "MiddleName"                text,
    "LastName"                  text,
    "Gender"                    text,

    -- Demographics
    "Business_Owner"                         text,
    "CalculatedRegDate"                      date,
    "CountyEthnic_Description"               text,
    "CountyEthnic_LALEthnicCode"             text,
    "CountyVoterID"                          text,
    "Education_Of_Person"                    text,
    "Estimated_Income_Amount"                text,
    "Estimated_Income_Amount_Int"            integer,
    "EthnicGroups_EthnicGroup1Desc"          text,
    "Ethnic_Description"                     text,
    "Homeowner_Probability_Model"            text,
    "Language_Code"                          text,
    "Mailing_Addresses_AddressLine"          text,
    "Mailing_Addresses_ApartmentNum"         text,
    "Mailing_Addresses_ApartmentType"        text,
    "Mailing_Addresses_CassErrStatCode"      text,
    "Mailing_Addresses_CheckDigit"           integer,
    "Mailing_Addresses_City"                 text,
    "Mailing_Addresses_Designator"           text,
    "Mailing_Addresses_DPBC"                 text,
    "Mailing_Addresses_ExtraAddressLine"     text,
    "Mailing_Addresses_HouseNumber"          text,
    "Mailing_Addresses_PrefixDirection"      integer,
    "Mailing_Addresses_State"                text,
    "Mailing_Addresses_StreetName"           text,
    "Mailing_Addresses_SuffixDirection"      integer,
    "Mailing_Addresses_Zip"                  text,
    "Mailing_Addresses_ZipPlus4"             text,
    "Mailing_Families_FamilyID"              text,
    "Mailing_HHGender_Description"           text,
    "Marital_Status"                         text,
    "MovedFrom_Date"                         date,
    "MovedFrom_Party_Description"            text,
    "MovedFrom_State"                        text,
    "NameSuffix"                             text,
    "OfficialRegDate"                        text,
    "Parties_Description"                    text,
    "PlaceOfBirth"                           text,
    "Presence_Of_Children"                   text,
    "Residence_Addresses_AddressLine"        text,
    "Residence_Addresses_ApartmentNum"       text,
    "Residence_Addresses_ApartmentType"      text,
    "Residence_Addresses_CassErrStatCode"    text,
    "Residence_Addresses_CheckDigit"         integer,
    "Residence_Addresses_City"               text,
    "Residence_Addresses_Designator"         text,
    "Residence_Addresses_DPBC"               text,
    "Residence_Addresses_ExtraAddressLine"   text,
    "Residence_Addresses_HouseNumber"        text,
    "Residence_Addresses_LatLongAccuracy"    text,
    "Residence_Addresses_Latitude"           text,
    "Residence_Addresses_Longitude"          text,
    "Residence_Addresses_PrefixDirection"    integer,
    "Residence_Addresses_State"              text,
    "Residence_Addresses_StreetName"         text,
    "Residence_Addresses_SuffixDirection"    integer,
    "Residence_Addresses_Zip"                text,
    "Residence_Addresses_ZipPlus4"           text,
    "Residence_HHParties_Description"        text,
    "SequenceOddEven"                        text,
    "SequenceZigZag"                         text,
    "StateVoterID"                           text,
    "Veteran_Status"                         text,
    "VoterParties_Change_Changed_Party"      text,
    "Voter_Status"                           text,
    "Voter_Status_UpdatedAt"                 timestamptz,
    "VoterTelephones_CellConfidenceCode"     integer,
    "VoterTelephones_CellPhoneFormatted"     text,
    "VoterTelephones_LandlineConfidenceCode" integer,
    "VoterTelephones_LandlineFormatted"      text,

    -- Voter Turnout
    "AnyElection_2017"                           text,
    "AnyElection_2019"                           text,
    "AnyElection_2021"                           text,
    "AnyElection_2023"                           text,
    "AnyElection_2025"                           text,
    "General_2016"                               text,
    "General_2018"                               text,
    "General_2020"                               text,
    "General_2022"                               text,
    "General_2024"                               text,
    "General_2026"                               text,
    "OtherElection_2016"                         text,
    "OtherElection_2018"                         text,
    "OtherElection_2020"                         text,
    "OtherElection_2022"                         text,
    "OtherElection_2024"                         text,
    "OtherElection_2026"                         text,
    "PresidentialPrimary_2016"                   text,
    "PresidentialPrimary_2020"                   text,
    "PresidentialPrimary_2024"                   text,
    "Primary_2016"                               text,
    "Primary_2018"                               text,
    "Primary_2020"                               text,
    "Primary_2022"                               text,
    "Primary_2024"                               text,
    "Primary_2026"                               text,
    "VotingPerformanceEvenYearGeneral"           text,
    "VotingPerformanceEvenYearGeneralAndPrimary" text,
    "VotingPerformanceEvenYearPrimary"           text,
    "VotingPerformanceMinorElection"             text

    -- PK & constraints will be added later (after load)
    
) PARTITION BY LIST ("State");

CREATE TABLE green."Voter_new_AL" PARTITION OF green."Voter_new" FOR VALUES IN ('AL');
CREATE TABLE green."Voter_new_AK" PARTITION OF green."Voter_new" FOR VALUES IN ('AK');
CREATE TABLE green."Voter_new_AZ" PARTITION OF green."Voter_new" FOR VALUES IN ('AZ');
CREATE TABLE green."Voter_new_AR" PARTITION OF green."Voter_new" FOR VALUES IN ('AR');
CREATE TABLE green."Voter_new_CA" PARTITION OF green."Voter_new" FOR VALUES IN ('CA');
CREATE TABLE green."Voter_new_CO" PARTITION OF green."Voter_new" FOR VALUES IN ('CO');
CREATE TABLE green."Voter_new_CT" PARTITION OF green."Voter_new" FOR VALUES IN ('CT');
CREATE TABLE green."Voter_new_DC" PARTITION OF green."Voter_new" FOR VALUES IN ('DC');
CREATE TABLE green."Voter_new_DE" PARTITION OF green."Voter_new" FOR VALUES IN ('DE');
CREATE TABLE green."Voter_new_FL" PARTITION OF green."Voter_new" FOR VALUES IN ('FL');
CREATE TABLE green."Voter_new_GA" PARTITION OF green."Voter_new" FOR VALUES IN ('GA');
CREATE TABLE green."Voter_new_HI" PARTITION OF green."Voter_new" FOR VALUES IN ('HI');
CREATE TABLE green."Voter_new_ID" PARTITION OF green."Voter_new" FOR VALUES IN ('ID');
CREATE TABLE green."Voter_new_IL" PARTITION OF green."Voter_new" FOR VALUES IN ('IL');
CREATE TABLE green."Voter_new_IN" PARTITION OF green."Voter_new" FOR VALUES IN ('IN');
CREATE TABLE green."Voter_new_IA" PARTITION OF green."Voter_new" FOR VALUES IN ('IA');
CREATE TABLE green."Voter_new_KS" PARTITION OF green."Voter_new" FOR VALUES IN ('KS');
CREATE TABLE green."Voter_new_KY" PARTITION OF green."Voter_new" FOR VALUES IN ('KY');
CREATE TABLE green."Voter_new_LA" PARTITION OF green."Voter_new" FOR VALUES IN ('LA');
CREATE TABLE green."Voter_new_ME" PARTITION OF green."Voter_new" FOR VALUES IN ('ME');
CREATE TABLE green."Voter_new_MD" PARTITION OF green."Voter_new" FOR VALUES IN ('MD');
CREATE TABLE green."Voter_new_MA" PARTITION OF green."Voter_new" FOR VALUES IN ('MA');
CREATE TABLE green."Voter_new_MI" PARTITION OF green."Voter_new" FOR VALUES IN ('MI');
CREATE TABLE green."Voter_new_MN" PARTITION OF green."Voter_new" FOR VALUES IN ('MN');
CREATE TABLE green."Voter_new_MS" PARTITION OF green."Voter_new" FOR VALUES IN ('MS');
CREATE TABLE green."Voter_new_MO" PARTITION OF green."Voter_new" FOR VALUES IN ('MO');
CREATE TABLE green."Voter_new_MT" PARTITION OF green."Voter_new" FOR VALUES IN ('MT');
CREATE TABLE green."Voter_new_NE" PARTITION OF green."Voter_new" FOR VALUES IN ('NE');
CREATE TABLE green."Voter_new_NV" PARTITION OF green."Voter_new" FOR VALUES IN ('NV');
CREATE TABLE green."Voter_new_NH" PARTITION OF green."Voter_new" FOR VALUES IN ('NH');
CREATE TABLE green."Voter_new_NJ" PARTITION OF green."Voter_new" FOR VALUES IN ('NJ');
CREATE TABLE green."Voter_new_NM" PARTITION OF green."Voter_new" FOR VALUES IN ('NM');
CREATE TABLE green."Voter_new_NY" PARTITION OF green."Voter_new" FOR VALUES IN ('NY');
CREATE TABLE green."Voter_new_NC" PARTITION OF green."Voter_new" FOR VALUES IN ('NC');
CREATE TABLE green."Voter_new_ND" PARTITION OF green."Voter_new" FOR VALUES IN ('ND');
CREATE TABLE green."Voter_new_OH" PARTITION OF green."Voter_new" FOR VALUES IN ('OH');
CREATE TABLE green."Voter_new_OK" PARTITION OF green."Voter_new" FOR VALUES IN ('OK');
CREATE TABLE green."Voter_new_OR" PARTITION OF green."Voter_new" FOR VALUES IN ('OR');
CREATE TABLE green."Voter_new_PA" PARTITION OF green."Voter_new" FOR VALUES IN ('PA');
CREATE TABLE green."Voter_new_RI" PARTITION OF green."Voter_new" FOR VALUES IN ('RI');
CREATE TABLE green."Voter_new_SC" PARTITION OF green."Voter_new" FOR VALUES IN ('SC');
CREATE TABLE green."Voter_new_SD" PARTITION OF green."Voter_new" FOR VALUES IN ('SD');
CREATE TABLE green."Voter_new_TN" PARTITION OF green."Voter_new" FOR VALUES IN ('TN');
CREATE TABLE green."Voter_new_TX" PARTITION OF green."Voter_new" FOR VALUES IN ('TX');
CREATE TABLE green."Voter_new_UT" PARTITION OF green."Voter_new" FOR VALUES IN ('UT');
CREATE TABLE green."Voter_new_VT" PARTITION OF green."Voter_new" FOR VALUES IN ('VT');
CREATE TABLE green."Voter_new_VA" PARTITION OF green."Voter_new" FOR VALUES IN ('VA');
CREATE TABLE green."Voter_new_WA" PARTITION OF green."Voter_new" FOR VALUES IN ('WA');
CREATE TABLE green."Voter_new_WV" PARTITION OF green."Voter_new" FOR VALUES IN ('WV');
CREATE TABLE green."Voter_new_WI" PARTITION OF green."Voter_new" FOR VALUES IN ('WI');
CREATE TABLE green."Voter_new_WY" PARTITION OF green."Voter_new" FOR VALUES IN ('WY');
