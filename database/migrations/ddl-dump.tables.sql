create type "USState" as enum ('AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DC', 'DE', 'FL', 'GA', 'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD', 'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ', 'NM', 'NY', 'NC', 'ND', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA', 'WV', 'WI', 'WY');

create table "District"
(
    id         uuid                                   not null,
    created_at timestamp(3) default CURRENT_TIMESTAMP not null,
    updated_at timestamp(3)                           not null,
    type       text                                   not null,
    name       text                                   not null,
    state      green."USState"                        not null
);

create table "Voter"
(
    id                                           uuid                                   not null,
    created_at                                   timestamp with time zone default now() not null,
    updated_at                                   timestamp with time zone default now() not null,
    "LALVOTERID"                                 text                                   not null,
    "State"                                      "USState"                              not null,
    "AbsenteeTypes_Description"                  text,
    "Active"                                     text,
    "Age"                                        text,
    "Age_Int"                                    integer,
    "FirstName"                                  text,
    "MiddleName"                                 text,
    "LastName"                                   text,
    "Gender"                                     text,
    "Business_Owner"                             text,
    "CalculatedRegDate"                          date,
    "CountyEthnic_Description"                   text,
    "CountyEthnic_LALEthnicCode"                 text,
    "CountyVoterID"                              text,
    "Education_Of_Person"                        text,
    "Estimated_Income_Amount"                    text,
    "Estimated_Income_Amount_Int"                integer,
    "EthnicGroups_EthnicGroup1Desc"              text,
    "Ethnic_Description"                         text,
    "Homeowner_Probability_Model"                text,
    "Language_Code"                              text,
    "Mailing_Addresses_AddressLine"              text,
    "Mailing_Addresses_ApartmentNum"             text,
    "Mailing_Addresses_ApartmentType"            text,
    "Mailing_Addresses_CassErrStatCode"          text,
    "Mailing_Addresses_CheckDigit"               integer,
    "Mailing_Addresses_City"                     text,
    "Mailing_Addresses_Designator"               text,
    "Mailing_Addresses_DPBC"                     text,
    "Mailing_Addresses_ExtraAddressLine"         text,
    "Mailing_Addresses_HouseNumber"              text,
    "Mailing_Addresses_PrefixDirection"          integer,
    "Mailing_Addresses_State"                    text,
    "Mailing_Addresses_StreetName"               text,
    "Mailing_Addresses_SuffixDirection"          integer,
    "Mailing_Addresses_Zip"                      text,
    "Mailing_Addresses_ZipPlus4"                 text,
    "Mailing_Families_FamilyID"                  text,
    "Mailing_HHGender_Description"               text,
    "Marital_Status"                             text,
    "MovedFrom_Date"                             date,
    "MovedFrom_Party_Description"                text,
    "MovedFrom_State"                            text,
    "NameSuffix"                                 text,
    "OfficialRegDate"                            text,
    "Parties_Description"                        text,
    "PlaceOfBirth"                               text,
    "Presence_Of_Children"                       text,
    "Residence_Addresses_AddressLine"            text,
    "Residence_Addresses_ApartmentNum"           text,
    "Residence_Addresses_ApartmentType"          text,
    "Residence_Addresses_CassErrStatCode"        text,
    "Residence_Addresses_CheckDigit"             integer,
    "Residence_Addresses_City"                   text,
    "Residence_Addresses_Designator"             text,
    "Residence_Addresses_DPBC"                   text,
    "Residence_Addresses_ExtraAddressLine"       text,
    "Residence_Addresses_HouseNumber"            text,
    "Residence_Addresses_LatLongAccuracy"        text,
    "Residence_Addresses_Latitude"               text,
    "Residence_Addresses_Longitude"              text,
    "Residence_Addresses_PrefixDirection"        integer,
    "Residence_Addresses_State"                  text,
    "Residence_Addresses_StreetName"             text,
    "Residence_Addresses_SuffixDirection"        integer,
    "Residence_Addresses_Zip"                    text,
    "Residence_Addresses_ZipPlus4"               text,
    "Residence_HHParties_Description"            text,
    "SequenceOddEven"                            text,
    "SequenceZigZag"                             text,
    "StateVoterID"                               text,
    "Veteran_Status"                             text,
    "VoterParties_Change_Changed_Party"          text,
    "Voter_Status"                               text,
    "Voter_Status_UpdatedAt"                     timestamp with time zone,
    "VoterTelephones_CellConfidenceCode"         integer,
    "VoterTelephones_CellPhoneFormatted"         text,
    "VoterTelephones_LandlineConfidenceCode"     integer,
    "VoterTelephones_LandlineFormatted"          text,
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
)
    partition by LIST ("State");

create table "Voter_AL"
    partition of "Voter"
        FOR VALUES IN ('AL');

create table "Voter_AK"
    partition of "Voter"
        FOR VALUES IN ('AK');

create table "Voter_AZ"
    partition of "Voter"
        FOR VALUES IN ('AZ');

create table "Voter_AR"
    partition of "Voter"
        FOR VALUES IN ('AR');

create table "Voter_CA"
    partition of "Voter"
        FOR VALUES IN ('CA');

create table "Voter_CO"
    partition of "Voter"
        FOR VALUES IN ('CO');

create table "Voter_CT"
    partition of "Voter"
        FOR VALUES IN ('CT');

create table "Voter_DC"
    partition of "Voter"
        FOR VALUES IN ('DC');

create table "Voter_DE"
    partition of "Voter"
        FOR VALUES IN ('DE');

create table "Voter_FL"
    partition of "Voter"
        FOR VALUES IN ('FL');

create table "Voter_GA"
    partition of "Voter"
        FOR VALUES IN ('GA');

create table "Voter_HI"
    partition of "Voter"
        FOR VALUES IN ('HI');

create table "Voter_ID"
    partition of "Voter"
        FOR VALUES IN ('ID');

create table "Voter_IL"
    partition of "Voter"
        FOR VALUES IN ('IL');

create table "Voter_IN"
    partition of "Voter"
        FOR VALUES IN ('IN');

create table "Voter_IA"
    partition of "Voter"
        FOR VALUES IN ('IA');

create table "Voter_KS"
    partition of "Voter"
        FOR VALUES IN ('KS');

create table "Voter_KY"
    partition of "Voter"
        FOR VALUES IN ('KY');

create table "Voter_LA"
    partition of "Voter"
        FOR VALUES IN ('LA');

create table "Voter_ME"
    partition of "Voter"
        FOR VALUES IN ('ME');

create table "Voter_MD"
    partition of "Voter"
        FOR VALUES IN ('MD');

create table "Voter_MA"
    partition of "Voter"
        FOR VALUES IN ('MA');

create table "Voter_MI"
    partition of "Voter"
        FOR VALUES IN ('MI');

create table "Voter_MN"
    partition of "Voter"
        FOR VALUES IN ('MN');

create table "Voter_MS"
    partition of "Voter"
        FOR VALUES IN ('MS');

create table "Voter_MO"
    partition of "Voter"
        FOR VALUES IN ('MO');

create table "Voter_MT"
    partition of "Voter"
        FOR VALUES IN ('MT');

create table "Voter_NE"
    partition of "Voter"
        FOR VALUES IN ('NE');

create table "Voter_NV"
    partition of "Voter"
        FOR VALUES IN ('NV');

create table "Voter_NH"
    partition of "Voter"
        FOR VALUES IN ('NH');

create table "Voter_NJ"
    partition of "Voter"
        FOR VALUES IN ('NJ');

create table "Voter_NM"
    partition of "Voter"
        FOR VALUES IN ('NM');

create table "Voter_NY"
    partition of "Voter"
        FOR VALUES IN ('NY');

create table "Voter_NC"
    partition of "Voter"
        FOR VALUES IN ('NC');

create table "Voter_ND"
    partition of "Voter"
        FOR VALUES IN ('ND');

create table "Voter_OH"
    partition of "Voter"
        FOR VALUES IN ('OH');

create table "Voter_OK"
    partition of "Voter"
        FOR VALUES IN ('OK');

create table "Voter_OR"
    partition of "Voter"
        FOR VALUES IN ('OR');

create table "Voter_PA"
    partition of "Voter"
        FOR VALUES IN ('PA');

create table "Voter_RI"
    partition of "Voter"
        FOR VALUES IN ('RI');

create table "Voter_SC"
    partition of "Voter"
        FOR VALUES IN ('SC');

create table "Voter_SD"
    partition of "Voter"
        FOR VALUES IN ('SD');

create table "Voter_TN"
    partition of "Voter"
        FOR VALUES IN ('TN');

create table "Voter_TX"
    partition of "Voter"
        FOR VALUES IN ('TX');

create table "Voter_UT"
    partition of "Voter"
        FOR VALUES IN ('UT');

create table "Voter_VT"
    partition of "Voter"
        FOR VALUES IN ('VT');

create table "Voter_VA"
    partition of "Voter"
        FOR VALUES IN ('VA');

create table "Voter_WA"
    partition of "Voter"
        FOR VALUES IN ('WA');

create table "Voter_WV"
    partition of "Voter"
        FOR VALUES IN ('WV');

create table "Voter_WI"
    partition of "Voter"
        FOR VALUES IN ('WI');

create table "Voter_WY"
    partition of "Voter"
        FOR VALUES IN ('WY');

create table "DistrictVoter"
(
    district_id uuid                                   not null,
    voter_id    uuid                                   not null,
    created_at  timestamp with time zone default now() not null,
    updated_at  timestamp with time zone default now() not null,
    "State"     "USState"                              not null
)
    partition by LIST ("State");

create table "DistrictVoter_AL"
    partition of "DistrictVoter"
        FOR VALUES IN ('AL');

create table "DistrictVoter_AK"
    partition of "DistrictVoter"
        FOR VALUES IN ('AK');

create table "DistrictVoter_AZ"
    partition of "DistrictVoter"
        FOR VALUES IN ('AZ');

create table "DistrictVoter_AR"
    partition of "DistrictVoter"
        FOR VALUES IN ('AR');

create table "DistrictVoter_CA"
    partition of "DistrictVoter"
        FOR VALUES IN ('CA');

create table "DistrictVoter_CO"
    partition of "DistrictVoter"
        FOR VALUES IN ('CO');

create table "DistrictVoter_CT"
    partition of "DistrictVoter"
        FOR VALUES IN ('CT');

create table "DistrictVoter_DC"
    partition of "DistrictVoter"
        FOR VALUES IN ('DC');

create table "DistrictVoter_DE"
    partition of "DistrictVoter"
        FOR VALUES IN ('DE');

create table "DistrictVoter_FL"
    partition of "DistrictVoter"
        FOR VALUES IN ('FL');

create table "DistrictVoter_GA"
    partition of "DistrictVoter"
        FOR VALUES IN ('GA');

create table "DistrictVoter_HI"
    partition of "DistrictVoter"
        FOR VALUES IN ('HI');

create table "DistrictVoter_ID"
    partition of "DistrictVoter"
        FOR VALUES IN ('ID');

create table "DistrictVoter_IL"
    partition of "DistrictVoter"
        FOR VALUES IN ('IL');

create table "DistrictVoter_IN"
    partition of "DistrictVoter"
        FOR VALUES IN ('IN');

create table "DistrictVoter_IA"
    partition of "DistrictVoter"
        FOR VALUES IN ('IA');

create table "DistrictVoter_KS"
    partition of "DistrictVoter"
        FOR VALUES IN ('KS');

create table "DistrictVoter_KY"
    partition of "DistrictVoter"
        FOR VALUES IN ('KY');

create table "DistrictVoter_LA"
    partition of "DistrictVoter"
        FOR VALUES IN ('LA');

create table "DistrictVoter_ME"
    partition of "DistrictVoter"
        FOR VALUES IN ('ME');

create table "DistrictVoter_MD"
    partition of "DistrictVoter"
        FOR VALUES IN ('MD');

create table "DistrictVoter_MA"
    partition of "DistrictVoter"
        FOR VALUES IN ('MA');

create table "DistrictVoter_MI"
    partition of "DistrictVoter"
        FOR VALUES IN ('MI');

create table "DistrictVoter_MN"
    partition of "DistrictVoter"
        FOR VALUES IN ('MN');

create table "DistrictVoter_MS"
    partition of "DistrictVoter"
        FOR VALUES IN ('MS');

create table "DistrictVoter_MO"
    partition of "DistrictVoter"
        FOR VALUES IN ('MO');

create table "DistrictVoter_MT"
    partition of "DistrictVoter"
        FOR VALUES IN ('MT');

create table "DistrictVoter_NE"
    partition of "DistrictVoter"
        FOR VALUES IN ('NE');

create table "DistrictVoter_NV"
    partition of "DistrictVoter"
        FOR VALUES IN ('NV');

create table "DistrictVoter_NH"
    partition of "DistrictVoter"
        FOR VALUES IN ('NH');

create table "DistrictVoter_NJ"
    partition of "DistrictVoter"
        FOR VALUES IN ('NJ');

create table "DistrictVoter_NM"
    partition of "DistrictVoter"
        FOR VALUES IN ('NM');

create table "DistrictVoter_NY"
    partition of "DistrictVoter"
        FOR VALUES IN ('NY');

create table "DistrictVoter_NC"
    partition of "DistrictVoter"
        FOR VALUES IN ('NC');

create table "DistrictVoter_ND"
    partition of "DistrictVoter"
        FOR VALUES IN ('ND');

create table "DistrictVoter_OH"
    partition of "DistrictVoter"
        FOR VALUES IN ('OH');

create table "DistrictVoter_OK"
    partition of "DistrictVoter"
        FOR VALUES IN ('OK');

create table "DistrictVoter_OR"
    partition of "DistrictVoter"
        FOR VALUES IN ('OR');

create table "DistrictVoter_PA"
    partition of "DistrictVoter"
        FOR VALUES IN ('PA');

create table "DistrictVoter_RI"
    partition of "DistrictVoter"
        FOR VALUES IN ('RI');

create table "DistrictVoter_SC"
    partition of "DistrictVoter"
        FOR VALUES IN ('SC');

create table "DistrictVoter_SD"
    partition of "DistrictVoter"
        FOR VALUES IN ('SD');

create table "DistrictVoter_TN"
    partition of "DistrictVoter"
        FOR VALUES IN ('TN');

create table "DistrictVoter_TX"
    partition of "DistrictVoter"
        FOR VALUES IN ('TX');

create table "DistrictVoter_UT"
    partition of "DistrictVoter"
        FOR VALUES IN ('UT');

create table "DistrictVoter_VT"
    partition of "DistrictVoter"
        FOR VALUES IN ('VT');

create table "DistrictVoter_VA"
    partition of "DistrictVoter"
        FOR VALUES IN ('VA');

create table "DistrictVoter_WA"
    partition of "DistrictVoter"
        FOR VALUES IN ('WA');

create table "DistrictVoter_WV"
    partition of "DistrictVoter"
        FOR VALUES IN ('WV');

create table "DistrictVoter_WI"
    partition of "DistrictVoter"
        FOR VALUES IN ('WI');

create table "DistrictVoter_WY"
    partition of "DistrictVoter"
        FOR VALUES IN ('WY');

create function migrate_voter_state(_state text) returns void
    language plpgsql
as
$$
BEGIN
  RAISE NOTICE 'Migrating state %', _state;

  INSERT INTO green."Voter_new" (
      "id",
      "created_at",
      "updated_at",
      "LALVOTERID",
      "State",
      "AbsenteeTypes_Description",
      "Active",
      "Age",
      "Age_Int",
      "FirstName",
      "MiddleName",
      "LastName",
      "Gender",

      "Business_Owner",
      "CalculatedRegDate",
      "CountyEthnic_Description",
      "CountyEthnic_LALEthnicCode",
      "CountyVoterID",
      "Education_Of_Person",
      "Estimated_Income_Amount",
      "Estimated_Income_Amount_Int",
      "EthnicGroups_EthnicGroup1Desc",
      "Ethnic_Description",
      "Homeowner_Probability_Model",
      "Language_Code",
      "Mailing_Addresses_AddressLine",
      "Mailing_Addresses_ApartmentNum",
      "Mailing_Addresses_ApartmentType",
      "Mailing_Addresses_CassErrStatCode",
      "Mailing_Addresses_CheckDigit",
      "Mailing_Addresses_City",
      "Mailing_Addresses_Designator",
      "Mailing_Addresses_DPBC",
      "Mailing_Addresses_ExtraAddressLine",
      "Mailing_Addresses_HouseNumber",
      "Mailing_Addresses_PrefixDirection",
      "Mailing_Addresses_State",
      "Mailing_Addresses_StreetName",
      "Mailing_Addresses_SuffixDirection",
      "Mailing_Addresses_Zip",
      "Mailing_Addresses_ZipPlus4",
      "Mailing_Families_FamilyID",
      "Mailing_HHGender_Description",
      "Marital_Status",
      "MovedFrom_Date",
      "MovedFrom_Party_Description",
      "MovedFrom_State",
      "NameSuffix",
      "OfficialRegDate",
      "Parties_Description",
      "PlaceOfBirth",
      "Presence_Of_Children",
      "Residence_Addresses_AddressLine",
      "Residence_Addresses_ApartmentNum",
      "Residence_Addresses_ApartmentType",
      "Residence_Addresses_CassErrStatCode",
      "Residence_Addresses_CheckDigit",
      "Residence_Addresses_City",
      "Residence_Addresses_Designator",
      "Residence_Addresses_DPBC",
      "Residence_Addresses_ExtraAddressLine",
      "Residence_Addresses_HouseNumber",
      "Residence_Addresses_LatLongAccuracy",
      "Residence_Addresses_Latitude",
      "Residence_Addresses_Longitude",
      "Residence_Addresses_PrefixDirection",
      "Residence_Addresses_State",
      "Residence_Addresses_StreetName",
      "Residence_Addresses_SuffixDirection",
      "Residence_Addresses_Zip",
      "Residence_Addresses_ZipPlus4",
      "Residence_HHParties_Description",
      "SequenceOddEven",
      "SequenceZigZag",
      "StateVoterID",
      "Veteran_Status",
      "VoterParties_Change_Changed_Party",
      "Voter_Status",
      "Voter_Status_UpdatedAt",
      "VoterTelephones_CellConfidenceCode",
      "VoterTelephones_CellPhoneFormatted",
      "VoterTelephones_LandlineConfidenceCode",
      "VoterTelephones_LandlineFormatted",

      "AnyElection_2017",
      "AnyElection_2019",
      "AnyElection_2021",
      "AnyElection_2023",
      "AnyElection_2025",
      "General_2016",
      "General_2018",
      "General_2020",
      "General_2022",
      "General_2024",
      "General_2026",
      "OtherElection_2016",
      "OtherElection_2018",
      "OtherElection_2020",
      "OtherElection_2022",
      "OtherElection_2024",
      "OtherElection_2026",
      "PresidentialPrimary_2016",
      "PresidentialPrimary_2020",
      "PresidentialPrimary_2024",
      "Primary_2016",
      "Primary_2018",
      "Primary_2020",
      "Primary_2022",
      "Primary_2024",
      "Primary_2026",
      "VotingPerformanceEvenYearGeneral",
      "VotingPerformanceEvenYearGeneralAndPrimary",
      "VotingPerformanceEvenYearPrimary",
      "VotingPerformanceMinorElection"
  )
  SELECT
      "id",
      "created_at",
      "updated_at",
      "LALVOTERID",
      "State"::"USState",
      "AbsenteeTypes_Description",
      "Active",
      "Age",
      "Age_Int",
      "FirstName",
      "MiddleName",
      "LastName",
      "Gender",

      "Business_Owner",
      "CalculatedRegDate",
      "CountyEthnic_Description",
      "CountyEthnic_LALEthnicCode",
      "CountyVoterID",
      "Education_Of_Person",
      "Estimated_Income_Amount",
      "Estimated_Income_Amount_Int",
      "EthnicGroups_EthnicGroup1Desc",
      "Ethnic_Description",
      "Homeowner_Probability_Model",
      "Language_Code",
      "Mailing_Addresses_AddressLine",
      "Mailing_Addresses_ApartmentNum",
      "Mailing_Addresses_ApartmentType",
      "Mailing_Addresses_CassErrStatCode",
      "Mailing_Addresses_CheckDigit",
      "Mailing_Addresses_City",
      "Mailing_Addresses_Designator",
      "Mailing_Addresses_DPBC",
      "Mailing_Addresses_ExtraAddressLine",
      "Mailing_Addresses_HouseNumber",
      "Mailing_Addresses_PrefixDirection",
      "Mailing_Addresses_State",
      "Mailing_Addresses_StreetName",
      "Mailing_Addresses_SuffixDirection",
      "Mailing_Addresses_Zip",
      "Mailing_Addresses_ZipPlus4",
      "Mailing_Families_FamilyID",
      "Mailing_HHGender_Description",
      "Marital_Status",
      "MovedFrom_Date",
      "MovedFrom_Party_Description",
      "MovedFrom_State",
      "NameSuffix",
      "OfficialRegDate",
      "Parties_Description",
      "PlaceOfBirth",
      "Presence_Of_Children",
      "Residence_Addresses_AddressLine",
      "Residence_Addresses_ApartmentNum",
      "Residence_Addresses_ApartmentType",
      "Residence_Addresses_CassErrStatCode",
      "Residence_Addresses_CheckDigit",
      "Residence_Addresses_City",
      "Residence_Addresses_Designator",
      "Residence_Addresses_DPBC",
      "Residence_Addresses_ExtraAddressLine",
      "Residence_Addresses_HouseNumber",
      "Residence_Addresses_LatLongAccuracy",
      "Residence_Addresses_Latitude",
      "Residence_Addresses_Longitude",
      "Residence_Addresses_PrefixDirection",
      "Residence_Addresses_State",
      "Residence_Addresses_StreetName",
      "Residence_Addresses_SuffixDirection",
      "Residence_Addresses_Zip",
      "Residence_Addresses_ZipPlus4",
      "Residence_HHParties_Description",
      "SequenceOddEven",
      "SequenceZigZag",
      "StateVoterID",
      "Veteran_Status",
      "VoterParties_Change_Changed_Party",
      "Voter_Status",
      "Voter_Status_UpdatedAt",
      "VoterTelephones_CellConfidenceCode",
      "VoterTelephones_CellPhoneFormatted",
      "VoterTelephones_LandlineConfidenceCode",
      "VoterTelephones_LandlineFormatted",

      "AnyElection_2017",
      "AnyElection_2019",
      "AnyElection_2021",
      "AnyElection_2023",
      "AnyElection_2025",
      "General_2016",
      "General_2018",
      "General_2020",
      "General_2022",
      "General_2024",
      "General_2026",
      "OtherElection_2016",
      "OtherElection_2018",
      "OtherElection_2020",
      "OtherElection_2022",
      "OtherElection_2024",
      "OtherElection_2026",
      "PresidentialPrimary_2016",
      "PresidentialPrimary_2020",
      "PresidentialPrimary_2024",
      "Primary_2016",
      "Primary_2018",
      "Primary_2020",
      "Primary_2022",
      "Primary_2024",
      "Primary_2026",
      "VotingPerformanceEvenYearGeneral",
      "VotingPerformanceEvenYearGeneralAndPrimary",
      "VotingPerformanceEvenYearPrimary",
      "VotingPerformanceMinorElection"
  FROM green."Voter"
  WHERE "State" = _state;
END;
$$;

create function migrate_districtvoter_state(_state text) returns void
    language plpgsql
as
$$
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


