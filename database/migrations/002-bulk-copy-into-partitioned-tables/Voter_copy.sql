CREATE OR REPLACE FUNCTION green.migrate_voter_state(_state text)
RETURNS void
LANGUAGE plpgsql
AS $$
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

-- Make sure you're in auto-commit, or at least NOT wrapping this whole thing
-- in a manual BEGIN/COMMIT.

SELECT green.migrate_voter_state('AL');
SELECT green.migrate_voter_state('AK');
SELECT green.migrate_voter_state('AZ');
SELECT green.migrate_voter_state('AR');
SELECT green.migrate_voter_state('CA');
SELECT green.migrate_voter_state('CO');
SELECT green.migrate_voter_state('CT');
SELECT green.migrate_voter_state('DC');
SELECT green.migrate_voter_state('DE');
SELECT green.migrate_voter_state('FL');
SELECT green.migrate_voter_state('GA');
SELECT green.migrate_voter_state('HI');
SELECT green.migrate_voter_state('ID');
SELECT green.migrate_voter_state('IL');
SELECT green.migrate_voter_state('IN');
SELECT green.migrate_voter_state('IA');
SELECT green.migrate_voter_state('KS');
SELECT green.migrate_voter_state('KY');
SELECT green.migrate_voter_state('LA');
SELECT green.migrate_voter_state('ME');
SELECT green.migrate_voter_state('MD');
SELECT green.migrate_voter_state('MA');
SELECT green.migrate_voter_state('MI');
SELECT green.migrate_voter_state('MN');
SELECT green.migrate_voter_state('MS');
SELECT green.migrate_voter_state('MO');
SELECT green.migrate_voter_state('MT');
SELECT green.migrate_voter_state('NE');
SELECT green.migrate_voter_state('NV');
SELECT green.migrate_voter_state('NH');
SELECT green.migrate_voter_state('NJ');
SELECT green.migrate_voter_state('NM');
SELECT green.migrate_voter_state('NY');
SELECT green.migrate_voter_state('NC');
SELECT green.migrate_voter_state('ND');
SELECT green.migrate_voter_state('OH');
SELECT green.migrate_voter_state('OK');
SELECT green.migrate_voter_state('OR');
SELECT green.migrate_voter_state('PA');
SELECT green.migrate_voter_state('RI');
SELECT green.migrate_voter_state('SC');
SELECT green.migrate_voter_state('SD');
SELECT green.migrate_voter_state('TN');
SELECT green.migrate_voter_state('TX');
SELECT green.migrate_voter_state('UT');
SELECT green.migrate_voter_state('VT');
SELECT green.migrate_voter_state('VA');
SELECT green.migrate_voter_state('WA');
SELECT green.migrate_voter_state('WV');
SELECT green.migrate_voter_state('WI');
SELECT green.migrate_voter_state('WY');


