/*
  Warnings:

  - You are about to drop the `Voter` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "Voter";

-- CreateTable
CREATE TABLE "VoterAL" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterAL_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterAK" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterAK_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterAZ" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterAZ_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterAR" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterAR_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterCA" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterCA_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterCO" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterCO_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterCT" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterCT_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterDE" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterDE_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterFL" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterFL_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterGA" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterGA_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterHI" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterHI_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterID" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterID_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterIL" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterIL_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterIN" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterIN_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterIA" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterIA_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterKS" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterKS_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterKY" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterKY_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterLA" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterLA_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterME" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterME_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterMD" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterMD_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterMA" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterMA_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterMI" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterMI_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterMN" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterMN_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterMS" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterMS_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterMO" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterMO_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterMT" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterMT_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterNE" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterNE_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterNV" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterNV_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterNH" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterNH_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterNJ" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterNJ_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterNM" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterNM_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterNY" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterNY_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterNC" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterNC_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterND" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterND_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterOH" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterOH_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterOK" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterOK_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterOR" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterOR_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterPA" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterPA_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterRI" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterRI_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterSC" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterSC_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterSD" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterSD_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterTN" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterTN_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterTX" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterTX_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterUT" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterUT_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterVT" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterVT_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterVA" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterVA_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterWA" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterWA_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterWV" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterWV_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterWI" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterWI_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateTable
CREATE TABLE "VoterWY" (
    "LALVOTERID" TEXT NOT NULL,
    "Voters_Active" TEXT,
    "Voters_StateVoterID" TEXT,
    "Voters_CountyVoterID" TEXT,
    "VoterTelephones_LandlineFormatted" TEXT,
    "VoterTelephones_LandlineConfidenceCode" INTEGER,
    "VoterTelephones_CellPhoneFormatted" TEXT,
    "VoterTelephones_CellConfidenceCode" INTEGER,
    "Voters_FirstName" TEXT,
    "Voters_MiddleName" TEXT,
    "Voters_LastName" TEXT,
    "Voters_NameSuffix" TEXT,
    "Residence_Addresses_AddressLine" TEXT,
    "Residence_Addresses_ExtraAddressLine" TEXT,
    "Residence_Addresses_City" TEXT,
    "Residence_Addresses_State" INTEGER,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" INTEGER,
    "Residence_Addresses_PrefixDirection" INTEGER,
    "Residence_Addresses_StreetName" TEXT,
    "Residence_Addresses_Designator" TEXT,
    "Residence_Addresses_SuffixDirection" INTEGER,
    "Residence_Addresses_ApartmentNum" TEXT,
    "Residence_Addresses_ApartmentType" TEXT,
    "Residence_Addresses_CassErrStatCode" TEXT,
    "Voters_SequenceZigZag" TEXT,
    "Voters_SequenceOddEven" TEXT,
    "Residence_Addresses_Latitude" TEXT,
    "Residence_Addresses_Longitude" TEXT,
    "Residence_Addresses_LatLongAccuracy" TEXT,
    "Residence_HHParties_Description" TEXT,
    "Mailing_Addresses_AddressLine" TEXT,
    "Mailing_Addresses_ExtraAddressLine" TEXT,
    "Mailing_Addresses_City" TEXT,
    "Mailing_Addresses_State" INTEGER,
    "Mailing_Addresses_Zip" TEXT,
    "Mailing_Addresses_ZipPlus4" TEXT,
    "Mailing_Addresses_DPBC" TEXT,
    "Mailing_Addresses_CheckDigit" INTEGER,
    "Mailing_Addresses_HouseNumber" TEXT,
    "Mailing_Addresses_PrefixDirection" INTEGER,
    "Mailing_Addresses_StreetName" TEXT,
    "Mailing_Addresses_Designator" TEXT,
    "Mailing_Addresses_SuffixDirection" INTEGER,
    "Mailing_Addresses_ApartmentNum" TEXT,
    "Mailing_Addresses_ApartmentType" TEXT,
    "Mailing_Addresses_CassErrStatCode" TEXT,
    "Mailing_Families_FamilyID" TEXT,
    "Mailing_Families_HHCount" INTEGER,
    "Mailing_HHGender_Description" TEXT,
    "Mailing_HHParties_Description" TEXT,
    "Voters_Age" TEXT,
    "DateConfidence_Description" TEXT,
    "Parties_Description" TEXT,
    "VoterParties_Change_Changed_Party" TEXT,
    "Ethnic_Description" TEXT,
    "EthnicGroups_EthnicGroup1Desc" TEXT,
    "CountyEthnic_LALEthnicCode" TEXT,
    "CountyEthnic_Description" TEXT,
    "Religions_Description" TEXT,
    "Voters_CalculatedRegDate" DATE,
    "Voters_OfficialRegDate" TEXT,
    "Voters_PlaceOfBirth" TEXT,
    "Languages_Description" TEXT,
    "AbsenteeTypes_Description" TEXT,
    "MilitaryStatus_Description" TEXT,
    "MaritalStatus_Description" TEXT,
    "Voters_MovedFrom_State" INTEGER,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2022" TEXT,
    "Primary_2022" TEXT,
    "OtherElection_2022" TEXT,
    "AnyElection_2021" TEXT,
    "General_2020" TEXT,
    "Primary_2020" TEXT,
    "PresidentialPrimary_2020" TEXT,
    "OtherElection_2020" TEXT,
    "AnyElection_2019" TEXT,
    "General_2018" TEXT,
    "Primary_2018" TEXT,
    "OtherElection_2018" TEXT,
    "AnyElection_2017" TEXT,
    "General_2016" TEXT,
    "Primary_2016" TEXT,
    "PresidentialPrimary_2016" TEXT,
    "OtherElection_2016" TEXT,
    "US_Congressional_District" TEXT,
    "AddressDistricts_Change_Changed_CD" TEXT,
    "State_Senate_District" TEXT,
    "AddressDistricts_Change_Changed_SD" TEXT,
    "State_House_District" TEXT,
    "AddressDistricts_Change_Changed_HD" TEXT,
    "State_Legislative_District" TEXT,
    "AddressDistricts_Change_Changed_LD" TEXT,
    "County" TEXT,
    "Voters_FIPS" TEXT,
    "AddressDistricts_Change_Changed_County" TEXT,
    "Precinct" TEXT,
    "County_Legislative_District" TEXT,
    "City" TEXT,
    "City_Council_Commissioner_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "Board_of_Education_District" TEXT,
    "Board_of_Education_SubDistrict" TEXT,
    "City_School_District" TEXT,
    "College_Board_District" TEXT,
    "Community_College_Commissioner_District" TEXT,
    "Community_College_SubDistrict" TEXT,
    "County_Board_of_Education_District" TEXT,
    "County_Board_of_Education_SubDistrict" TEXT,
    "County_Community_College_District" TEXT,
    "County_Superintendent_of_Schools_District" TEXT,
    "County_Unified_School_District" TEXT,
    "District_Attorney" TEXT,
    "Education_Commission_District" TEXT,
    "Educational_Service_District" TEXT,
    "Election_Commissioner_District" TEXT,
    "Elementary_School_District" TEXT,
    "Elementary_School_SubDistrict" TEXT,
    "Exempted_Village_School_District" TEXT,
    "High_School_District" TEXT,
    "High_School_SubDistrict" TEXT,
    "Judicial_Appellate_District" TEXT,
    "Judicial_Circuit_Court_District" TEXT,
    "Judicial_County_Board_of_Review_District" TEXT,
    "Judicial_County_Court_District" TEXT,
    "Judicial_District" TEXT,
    "Judicial_District_Court_District" TEXT,
    "Judicial_Family_Court_District" TEXT,
    "Judicial_Jury_District" TEXT,
    "Judicial_Juvenile_Court_District" TEXT,
    "Judicial_Magistrate_Division" TEXT,
    "Judicial_Sub_Circuit_District" TEXT,
    "Judicial_Superior_Court_District" TEXT,
    "Judicial_Supreme_Court_District" TEXT,
    "Middle_School_District" TEXT,
    "Municipal_Court_District" TEXT,
    "Proposed_City_Commissioner_District" TEXT,
    "Proposed_Elementary_School_District" TEXT,
    "Proposed_Unified_School_District" TEXT,
    "Regional_Office_of_Education_District" TEXT,
    "School_Board_District" TEXT,
    "School_District" TEXT,
    "School_District_Vocational" TEXT,
    "School_Facilities_Improvement_District" TEXT,
    "School_Subdistrict" TEXT,
    "Service_Area_District" TEXT,
    "Superintendent_of_Schools_District" TEXT,
    "Unified_School_District" TEXT,
    "Unified_School_SubDistrict" TEXT,

    CONSTRAINT "VoterWY_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateIndex
CREATE UNIQUE INDEX "VoterAL_LALVOTERID_key" ON "VoterAL"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterAL_US_Congressional_District_idx" ON "VoterAL"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterAL_State_Senate_District_idx" ON "VoterAL"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterAL_State_House_District_idx" ON "VoterAL"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterAL_County_Legislative_District_idx" ON "VoterAL"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterAL_City_idx" ON "VoterAL"("City");

-- CreateIndex
CREATE INDEX "VoterAL_County_idx" ON "VoterAL"("County");

-- CreateIndex
CREATE INDEX "VoterAL_City_Council_Commissioner_District_idx" ON "VoterAL"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterAL_City_Mayoral_District_idx" ON "VoterAL"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterAL_Town_District_idx" ON "VoterAL"("Town_District");

-- CreateIndex
CREATE INDEX "VoterAL_Town_Council_idx" ON "VoterAL"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterAL_Village_idx" ON "VoterAL"("Village");

-- CreateIndex
CREATE INDEX "VoterAL_Township_idx" ON "VoterAL"("Township");

-- CreateIndex
CREATE INDEX "VoterAL_Borough_idx" ON "VoterAL"("Borough");

-- CreateIndex
CREATE INDEX "VoterAL_Hamlet_Community_Area_idx" ON "VoterAL"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterAL_Board_of_Education_District_idx" ON "VoterAL"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterAL_Board_of_Education_SubDistrict_idx" ON "VoterAL"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterAL_City_School_District_idx" ON "VoterAL"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterAL_College_Board_District_idx" ON "VoterAL"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterAL_Community_College_Commissioner_District_idx" ON "VoterAL"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterAL_Community_College_SubDistrict_idx" ON "VoterAL"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterAL_County_Board_of_Education_District_idx" ON "VoterAL"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterAL_County_Board_of_Education_SubDistrict_idx" ON "VoterAL"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterAL_County_Community_College_District_idx" ON "VoterAL"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterAL_County_Superintendent_of_Schools_District_idx" ON "VoterAL"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterAL_County_Unified_School_District_idx" ON "VoterAL"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterAL_District_Attorney_idx" ON "VoterAL"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterAL_Education_Commission_District_idx" ON "VoterAL"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterAL_Educational_Service_District_idx" ON "VoterAL"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterAL_Election_Commissioner_District_idx" ON "VoterAL"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterAL_Elementary_School_District_idx" ON "VoterAL"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterAL_Elementary_School_SubDistrict_idx" ON "VoterAL"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterAL_Exempted_Village_School_District_idx" ON "VoterAL"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterAL_High_School_District_idx" ON "VoterAL"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterAL_High_School_SubDistrict_idx" ON "VoterAL"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterAL_Judicial_Appellate_District_idx" ON "VoterAL"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterAL_Judicial_Circuit_Court_District_idx" ON "VoterAL"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterAL_Judicial_County_Board_of_Review_District_idx" ON "VoterAL"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterAL_Judicial_County_Court_District_idx" ON "VoterAL"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterAL_Judicial_District_idx" ON "VoterAL"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterAL_Judicial_District_Court_District_idx" ON "VoterAL"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterAL_Judicial_Family_Court_District_idx" ON "VoterAL"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterAL_Judicial_Jury_District_idx" ON "VoterAL"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterAL_Judicial_Juvenile_Court_District_idx" ON "VoterAL"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterAL_Judicial_Magistrate_Division_idx" ON "VoterAL"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterAL_Judicial_Sub_Circuit_District_idx" ON "VoterAL"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterAL_Judicial_Superior_Court_District_idx" ON "VoterAL"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterAL_Judicial_Supreme_Court_District_idx" ON "VoterAL"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterAL_Middle_School_District_idx" ON "VoterAL"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterAL_Municipal_Court_District_idx" ON "VoterAL"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterAL_Proposed_City_Commissioner_District_idx" ON "VoterAL"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterAL_Proposed_Elementary_School_District_idx" ON "VoterAL"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterAL_Proposed_Unified_School_District_idx" ON "VoterAL"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterAL_Regional_Office_of_Education_District_idx" ON "VoterAL"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterAL_School_Board_District_idx" ON "VoterAL"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterAL_School_District_idx" ON "VoterAL"("School_District");

-- CreateIndex
CREATE INDEX "VoterAL_School_District_Vocational_idx" ON "VoterAL"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterAL_School_Facilities_Improvement_District_idx" ON "VoterAL"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterAL_School_Subdistrict_idx" ON "VoterAL"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterAL_Service_Area_District_idx" ON "VoterAL"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterAL_Superintendent_of_Schools_District_idx" ON "VoterAL"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterAL_Unified_School_District_idx" ON "VoterAL"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterAL_Unified_School_SubDistrict_idx" ON "VoterAL"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterAL_Voters_FirstName_idx" ON "VoterAL"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterAL_Voters_MiddleName_idx" ON "VoterAL"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterAL_Voters_LastName_idx" ON "VoterAL"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterAL_Voters_Active_idx" ON "VoterAL"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterAL_MilitaryStatus_Description_idx" ON "VoterAL"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterAL_Voters_Age_idx" ON "VoterAL"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterAL_Parties_Description_idx" ON "VoterAL"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterAL_VoterParties_Change_Changed_Party_idx" ON "VoterAL"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterAL_Voters_CalculatedRegDate_idx" ON "VoterAL"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterAL_Voters_OfficialRegDate_idx" ON "VoterAL"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterAL_VoterTelephones_CellConfidenceCode_idx" ON "VoterAL"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterAL_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterAL"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterAL_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterAL"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterAL_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterAL"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterAL_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterAL"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterAL_Voters_VotingPerformanceMinorElection_idx" ON "VoterAL"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterAL_General_2022_idx" ON "VoterAL"("General_2022");

-- CreateIndex
CREATE INDEX "VoterAL_Primary_2022_idx" ON "VoterAL"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterAL_OtherElection_2022_idx" ON "VoterAL"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterAL_AnyElection_2021_idx" ON "VoterAL"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterAL_General_2020_idx" ON "VoterAL"("General_2020");

-- CreateIndex
CREATE INDEX "VoterAL_Primary_2020_idx" ON "VoterAL"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterAL_PresidentialPrimary_2020_idx" ON "VoterAL"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterAL_OtherElection_2020_idx" ON "VoterAL"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterAL_AnyElection_2019_idx" ON "VoterAL"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterAL_General_2018_idx" ON "VoterAL"("General_2018");

-- CreateIndex
CREATE INDEX "VoterAL_Primary_2018_idx" ON "VoterAL"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterAL_OtherElection_2018_idx" ON "VoterAL"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterAL_AnyElection_2017_idx" ON "VoterAL"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterAL_General_2016_idx" ON "VoterAL"("General_2016");

-- CreateIndex
CREATE INDEX "VoterAL_Primary_2016_idx" ON "VoterAL"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterAL_PresidentialPrimary_2016_idx" ON "VoterAL"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterAL_OtherElection_2016_idx" ON "VoterAL"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterAK_LALVOTERID_key" ON "VoterAK"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterAK_US_Congressional_District_idx" ON "VoterAK"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterAK_State_Senate_District_idx" ON "VoterAK"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterAK_State_House_District_idx" ON "VoterAK"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterAK_County_Legislative_District_idx" ON "VoterAK"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterAK_City_idx" ON "VoterAK"("City");

-- CreateIndex
CREATE INDEX "VoterAK_County_idx" ON "VoterAK"("County");

-- CreateIndex
CREATE INDEX "VoterAK_City_Council_Commissioner_District_idx" ON "VoterAK"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterAK_City_Mayoral_District_idx" ON "VoterAK"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterAK_Town_District_idx" ON "VoterAK"("Town_District");

-- CreateIndex
CREATE INDEX "VoterAK_Town_Council_idx" ON "VoterAK"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterAK_Village_idx" ON "VoterAK"("Village");

-- CreateIndex
CREATE INDEX "VoterAK_Township_idx" ON "VoterAK"("Township");

-- CreateIndex
CREATE INDEX "VoterAK_Borough_idx" ON "VoterAK"("Borough");

-- CreateIndex
CREATE INDEX "VoterAK_Hamlet_Community_Area_idx" ON "VoterAK"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterAK_Board_of_Education_District_idx" ON "VoterAK"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterAK_Board_of_Education_SubDistrict_idx" ON "VoterAK"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterAK_City_School_District_idx" ON "VoterAK"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterAK_College_Board_District_idx" ON "VoterAK"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterAK_Community_College_Commissioner_District_idx" ON "VoterAK"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterAK_Community_College_SubDistrict_idx" ON "VoterAK"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterAK_County_Board_of_Education_District_idx" ON "VoterAK"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterAK_County_Board_of_Education_SubDistrict_idx" ON "VoterAK"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterAK_County_Community_College_District_idx" ON "VoterAK"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterAK_County_Superintendent_of_Schools_District_idx" ON "VoterAK"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterAK_County_Unified_School_District_idx" ON "VoterAK"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterAK_District_Attorney_idx" ON "VoterAK"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterAK_Education_Commission_District_idx" ON "VoterAK"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterAK_Educational_Service_District_idx" ON "VoterAK"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterAK_Election_Commissioner_District_idx" ON "VoterAK"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterAK_Elementary_School_District_idx" ON "VoterAK"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterAK_Elementary_School_SubDistrict_idx" ON "VoterAK"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterAK_Exempted_Village_School_District_idx" ON "VoterAK"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterAK_High_School_District_idx" ON "VoterAK"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterAK_High_School_SubDistrict_idx" ON "VoterAK"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterAK_Judicial_Appellate_District_idx" ON "VoterAK"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterAK_Judicial_Circuit_Court_District_idx" ON "VoterAK"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterAK_Judicial_County_Board_of_Review_District_idx" ON "VoterAK"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterAK_Judicial_County_Court_District_idx" ON "VoterAK"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterAK_Judicial_District_idx" ON "VoterAK"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterAK_Judicial_District_Court_District_idx" ON "VoterAK"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterAK_Judicial_Family_Court_District_idx" ON "VoterAK"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterAK_Judicial_Jury_District_idx" ON "VoterAK"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterAK_Judicial_Juvenile_Court_District_idx" ON "VoterAK"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterAK_Judicial_Magistrate_Division_idx" ON "VoterAK"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterAK_Judicial_Sub_Circuit_District_idx" ON "VoterAK"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterAK_Judicial_Superior_Court_District_idx" ON "VoterAK"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterAK_Judicial_Supreme_Court_District_idx" ON "VoterAK"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterAK_Middle_School_District_idx" ON "VoterAK"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterAK_Municipal_Court_District_idx" ON "VoterAK"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterAK_Proposed_City_Commissioner_District_idx" ON "VoterAK"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterAK_Proposed_Elementary_School_District_idx" ON "VoterAK"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterAK_Proposed_Unified_School_District_idx" ON "VoterAK"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterAK_Regional_Office_of_Education_District_idx" ON "VoterAK"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterAK_School_Board_District_idx" ON "VoterAK"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterAK_School_District_idx" ON "VoterAK"("School_District");

-- CreateIndex
CREATE INDEX "VoterAK_School_District_Vocational_idx" ON "VoterAK"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterAK_School_Facilities_Improvement_District_idx" ON "VoterAK"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterAK_School_Subdistrict_idx" ON "VoterAK"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterAK_Service_Area_District_idx" ON "VoterAK"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterAK_Superintendent_of_Schools_District_idx" ON "VoterAK"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterAK_Unified_School_District_idx" ON "VoterAK"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterAK_Unified_School_SubDistrict_idx" ON "VoterAK"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterAK_Voters_FirstName_idx" ON "VoterAK"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterAK_Voters_MiddleName_idx" ON "VoterAK"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterAK_Voters_LastName_idx" ON "VoterAK"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterAK_Voters_Active_idx" ON "VoterAK"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterAK_MilitaryStatus_Description_idx" ON "VoterAK"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterAK_Voters_Age_idx" ON "VoterAK"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterAK_Parties_Description_idx" ON "VoterAK"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterAK_VoterParties_Change_Changed_Party_idx" ON "VoterAK"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterAK_Voters_CalculatedRegDate_idx" ON "VoterAK"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterAK_Voters_OfficialRegDate_idx" ON "VoterAK"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterAK_VoterTelephones_CellConfidenceCode_idx" ON "VoterAK"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterAK_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterAK"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterAK_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterAK"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterAK_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterAK"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterAK_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterAK"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterAK_Voters_VotingPerformanceMinorElection_idx" ON "VoterAK"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterAK_General_2022_idx" ON "VoterAK"("General_2022");

-- CreateIndex
CREATE INDEX "VoterAK_Primary_2022_idx" ON "VoterAK"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterAK_OtherElection_2022_idx" ON "VoterAK"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterAK_AnyElection_2021_idx" ON "VoterAK"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterAK_General_2020_idx" ON "VoterAK"("General_2020");

-- CreateIndex
CREATE INDEX "VoterAK_Primary_2020_idx" ON "VoterAK"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterAK_PresidentialPrimary_2020_idx" ON "VoterAK"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterAK_OtherElection_2020_idx" ON "VoterAK"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterAK_AnyElection_2019_idx" ON "VoterAK"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterAK_General_2018_idx" ON "VoterAK"("General_2018");

-- CreateIndex
CREATE INDEX "VoterAK_Primary_2018_idx" ON "VoterAK"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterAK_OtherElection_2018_idx" ON "VoterAK"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterAK_AnyElection_2017_idx" ON "VoterAK"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterAK_General_2016_idx" ON "VoterAK"("General_2016");

-- CreateIndex
CREATE INDEX "VoterAK_Primary_2016_idx" ON "VoterAK"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterAK_PresidentialPrimary_2016_idx" ON "VoterAK"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterAK_OtherElection_2016_idx" ON "VoterAK"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterAZ_LALVOTERID_key" ON "VoterAZ"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterAZ_US_Congressional_District_idx" ON "VoterAZ"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterAZ_State_Senate_District_idx" ON "VoterAZ"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterAZ_State_House_District_idx" ON "VoterAZ"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterAZ_County_Legislative_District_idx" ON "VoterAZ"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterAZ_City_idx" ON "VoterAZ"("City");

-- CreateIndex
CREATE INDEX "VoterAZ_County_idx" ON "VoterAZ"("County");

-- CreateIndex
CREATE INDEX "VoterAZ_City_Council_Commissioner_District_idx" ON "VoterAZ"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterAZ_City_Mayoral_District_idx" ON "VoterAZ"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterAZ_Town_District_idx" ON "VoterAZ"("Town_District");

-- CreateIndex
CREATE INDEX "VoterAZ_Town_Council_idx" ON "VoterAZ"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterAZ_Village_idx" ON "VoterAZ"("Village");

-- CreateIndex
CREATE INDEX "VoterAZ_Township_idx" ON "VoterAZ"("Township");

-- CreateIndex
CREATE INDEX "VoterAZ_Borough_idx" ON "VoterAZ"("Borough");

-- CreateIndex
CREATE INDEX "VoterAZ_Hamlet_Community_Area_idx" ON "VoterAZ"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterAZ_Board_of_Education_District_idx" ON "VoterAZ"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterAZ_Board_of_Education_SubDistrict_idx" ON "VoterAZ"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterAZ_City_School_District_idx" ON "VoterAZ"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterAZ_College_Board_District_idx" ON "VoterAZ"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterAZ_Community_College_Commissioner_District_idx" ON "VoterAZ"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterAZ_Community_College_SubDistrict_idx" ON "VoterAZ"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterAZ_County_Board_of_Education_District_idx" ON "VoterAZ"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterAZ_County_Board_of_Education_SubDistrict_idx" ON "VoterAZ"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterAZ_County_Community_College_District_idx" ON "VoterAZ"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterAZ_County_Superintendent_of_Schools_District_idx" ON "VoterAZ"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterAZ_County_Unified_School_District_idx" ON "VoterAZ"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterAZ_District_Attorney_idx" ON "VoterAZ"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterAZ_Education_Commission_District_idx" ON "VoterAZ"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterAZ_Educational_Service_District_idx" ON "VoterAZ"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterAZ_Election_Commissioner_District_idx" ON "VoterAZ"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterAZ_Elementary_School_District_idx" ON "VoterAZ"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterAZ_Elementary_School_SubDistrict_idx" ON "VoterAZ"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterAZ_Exempted_Village_School_District_idx" ON "VoterAZ"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterAZ_High_School_District_idx" ON "VoterAZ"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterAZ_High_School_SubDistrict_idx" ON "VoterAZ"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterAZ_Judicial_Appellate_District_idx" ON "VoterAZ"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterAZ_Judicial_Circuit_Court_District_idx" ON "VoterAZ"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterAZ_Judicial_County_Board_of_Review_District_idx" ON "VoterAZ"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterAZ_Judicial_County_Court_District_idx" ON "VoterAZ"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterAZ_Judicial_District_idx" ON "VoterAZ"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterAZ_Judicial_District_Court_District_idx" ON "VoterAZ"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterAZ_Judicial_Family_Court_District_idx" ON "VoterAZ"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterAZ_Judicial_Jury_District_idx" ON "VoterAZ"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterAZ_Judicial_Juvenile_Court_District_idx" ON "VoterAZ"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterAZ_Judicial_Magistrate_Division_idx" ON "VoterAZ"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterAZ_Judicial_Sub_Circuit_District_idx" ON "VoterAZ"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterAZ_Judicial_Superior_Court_District_idx" ON "VoterAZ"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterAZ_Judicial_Supreme_Court_District_idx" ON "VoterAZ"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterAZ_Middle_School_District_idx" ON "VoterAZ"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterAZ_Municipal_Court_District_idx" ON "VoterAZ"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterAZ_Proposed_City_Commissioner_District_idx" ON "VoterAZ"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterAZ_Proposed_Elementary_School_District_idx" ON "VoterAZ"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterAZ_Proposed_Unified_School_District_idx" ON "VoterAZ"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterAZ_Regional_Office_of_Education_District_idx" ON "VoterAZ"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterAZ_School_Board_District_idx" ON "VoterAZ"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterAZ_School_District_idx" ON "VoterAZ"("School_District");

-- CreateIndex
CREATE INDEX "VoterAZ_School_District_Vocational_idx" ON "VoterAZ"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterAZ_School_Facilities_Improvement_District_idx" ON "VoterAZ"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterAZ_School_Subdistrict_idx" ON "VoterAZ"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterAZ_Service_Area_District_idx" ON "VoterAZ"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterAZ_Superintendent_of_Schools_District_idx" ON "VoterAZ"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterAZ_Unified_School_District_idx" ON "VoterAZ"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterAZ_Unified_School_SubDistrict_idx" ON "VoterAZ"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterAZ_Voters_FirstName_idx" ON "VoterAZ"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterAZ_Voters_MiddleName_idx" ON "VoterAZ"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterAZ_Voters_LastName_idx" ON "VoterAZ"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterAZ_Voters_Active_idx" ON "VoterAZ"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterAZ_MilitaryStatus_Description_idx" ON "VoterAZ"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterAZ_Voters_Age_idx" ON "VoterAZ"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterAZ_Parties_Description_idx" ON "VoterAZ"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterAZ_VoterParties_Change_Changed_Party_idx" ON "VoterAZ"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterAZ_Voters_CalculatedRegDate_idx" ON "VoterAZ"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterAZ_Voters_OfficialRegDate_idx" ON "VoterAZ"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterAZ_VoterTelephones_CellConfidenceCode_idx" ON "VoterAZ"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterAZ_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterAZ"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterAZ_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterAZ"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterAZ_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterAZ"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterAZ_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterAZ"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterAZ_Voters_VotingPerformanceMinorElection_idx" ON "VoterAZ"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterAZ_General_2022_idx" ON "VoterAZ"("General_2022");

-- CreateIndex
CREATE INDEX "VoterAZ_Primary_2022_idx" ON "VoterAZ"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterAZ_OtherElection_2022_idx" ON "VoterAZ"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterAZ_AnyElection_2021_idx" ON "VoterAZ"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterAZ_General_2020_idx" ON "VoterAZ"("General_2020");

-- CreateIndex
CREATE INDEX "VoterAZ_Primary_2020_idx" ON "VoterAZ"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterAZ_PresidentialPrimary_2020_idx" ON "VoterAZ"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterAZ_OtherElection_2020_idx" ON "VoterAZ"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterAZ_AnyElection_2019_idx" ON "VoterAZ"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterAZ_General_2018_idx" ON "VoterAZ"("General_2018");

-- CreateIndex
CREATE INDEX "VoterAZ_Primary_2018_idx" ON "VoterAZ"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterAZ_OtherElection_2018_idx" ON "VoterAZ"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterAZ_AnyElection_2017_idx" ON "VoterAZ"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterAZ_General_2016_idx" ON "VoterAZ"("General_2016");

-- CreateIndex
CREATE INDEX "VoterAZ_Primary_2016_idx" ON "VoterAZ"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterAZ_PresidentialPrimary_2016_idx" ON "VoterAZ"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterAZ_OtherElection_2016_idx" ON "VoterAZ"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterAR_LALVOTERID_key" ON "VoterAR"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterAR_US_Congressional_District_idx" ON "VoterAR"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterAR_State_Senate_District_idx" ON "VoterAR"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterAR_State_House_District_idx" ON "VoterAR"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterAR_County_Legislative_District_idx" ON "VoterAR"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterAR_City_idx" ON "VoterAR"("City");

-- CreateIndex
CREATE INDEX "VoterAR_County_idx" ON "VoterAR"("County");

-- CreateIndex
CREATE INDEX "VoterAR_City_Council_Commissioner_District_idx" ON "VoterAR"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterAR_City_Mayoral_District_idx" ON "VoterAR"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterAR_Town_District_idx" ON "VoterAR"("Town_District");

-- CreateIndex
CREATE INDEX "VoterAR_Town_Council_idx" ON "VoterAR"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterAR_Village_idx" ON "VoterAR"("Village");

-- CreateIndex
CREATE INDEX "VoterAR_Township_idx" ON "VoterAR"("Township");

-- CreateIndex
CREATE INDEX "VoterAR_Borough_idx" ON "VoterAR"("Borough");

-- CreateIndex
CREATE INDEX "VoterAR_Hamlet_Community_Area_idx" ON "VoterAR"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterAR_Board_of_Education_District_idx" ON "VoterAR"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterAR_Board_of_Education_SubDistrict_idx" ON "VoterAR"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterAR_City_School_District_idx" ON "VoterAR"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterAR_College_Board_District_idx" ON "VoterAR"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterAR_Community_College_Commissioner_District_idx" ON "VoterAR"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterAR_Community_College_SubDistrict_idx" ON "VoterAR"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterAR_County_Board_of_Education_District_idx" ON "VoterAR"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterAR_County_Board_of_Education_SubDistrict_idx" ON "VoterAR"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterAR_County_Community_College_District_idx" ON "VoterAR"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterAR_County_Superintendent_of_Schools_District_idx" ON "VoterAR"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterAR_County_Unified_School_District_idx" ON "VoterAR"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterAR_District_Attorney_idx" ON "VoterAR"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterAR_Education_Commission_District_idx" ON "VoterAR"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterAR_Educational_Service_District_idx" ON "VoterAR"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterAR_Election_Commissioner_District_idx" ON "VoterAR"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterAR_Elementary_School_District_idx" ON "VoterAR"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterAR_Elementary_School_SubDistrict_idx" ON "VoterAR"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterAR_Exempted_Village_School_District_idx" ON "VoterAR"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterAR_High_School_District_idx" ON "VoterAR"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterAR_High_School_SubDistrict_idx" ON "VoterAR"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterAR_Judicial_Appellate_District_idx" ON "VoterAR"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterAR_Judicial_Circuit_Court_District_idx" ON "VoterAR"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterAR_Judicial_County_Board_of_Review_District_idx" ON "VoterAR"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterAR_Judicial_County_Court_District_idx" ON "VoterAR"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterAR_Judicial_District_idx" ON "VoterAR"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterAR_Judicial_District_Court_District_idx" ON "VoterAR"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterAR_Judicial_Family_Court_District_idx" ON "VoterAR"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterAR_Judicial_Jury_District_idx" ON "VoterAR"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterAR_Judicial_Juvenile_Court_District_idx" ON "VoterAR"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterAR_Judicial_Magistrate_Division_idx" ON "VoterAR"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterAR_Judicial_Sub_Circuit_District_idx" ON "VoterAR"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterAR_Judicial_Superior_Court_District_idx" ON "VoterAR"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterAR_Judicial_Supreme_Court_District_idx" ON "VoterAR"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterAR_Middle_School_District_idx" ON "VoterAR"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterAR_Municipal_Court_District_idx" ON "VoterAR"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterAR_Proposed_City_Commissioner_District_idx" ON "VoterAR"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterAR_Proposed_Elementary_School_District_idx" ON "VoterAR"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterAR_Proposed_Unified_School_District_idx" ON "VoterAR"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterAR_Regional_Office_of_Education_District_idx" ON "VoterAR"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterAR_School_Board_District_idx" ON "VoterAR"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterAR_School_District_idx" ON "VoterAR"("School_District");

-- CreateIndex
CREATE INDEX "VoterAR_School_District_Vocational_idx" ON "VoterAR"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterAR_School_Facilities_Improvement_District_idx" ON "VoterAR"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterAR_School_Subdistrict_idx" ON "VoterAR"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterAR_Service_Area_District_idx" ON "VoterAR"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterAR_Superintendent_of_Schools_District_idx" ON "VoterAR"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterAR_Unified_School_District_idx" ON "VoterAR"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterAR_Unified_School_SubDistrict_idx" ON "VoterAR"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterAR_Voters_FirstName_idx" ON "VoterAR"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterAR_Voters_MiddleName_idx" ON "VoterAR"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterAR_Voters_LastName_idx" ON "VoterAR"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterAR_Voters_Active_idx" ON "VoterAR"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterAR_MilitaryStatus_Description_idx" ON "VoterAR"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterAR_Voters_Age_idx" ON "VoterAR"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterAR_Parties_Description_idx" ON "VoterAR"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterAR_VoterParties_Change_Changed_Party_idx" ON "VoterAR"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterAR_Voters_CalculatedRegDate_idx" ON "VoterAR"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterAR_Voters_OfficialRegDate_idx" ON "VoterAR"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterAR_VoterTelephones_CellConfidenceCode_idx" ON "VoterAR"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterAR_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterAR"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterAR_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterAR"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterAR_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterAR"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterAR_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterAR"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterAR_Voters_VotingPerformanceMinorElection_idx" ON "VoterAR"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterAR_General_2022_idx" ON "VoterAR"("General_2022");

-- CreateIndex
CREATE INDEX "VoterAR_Primary_2022_idx" ON "VoterAR"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterAR_OtherElection_2022_idx" ON "VoterAR"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterAR_AnyElection_2021_idx" ON "VoterAR"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterAR_General_2020_idx" ON "VoterAR"("General_2020");

-- CreateIndex
CREATE INDEX "VoterAR_Primary_2020_idx" ON "VoterAR"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterAR_PresidentialPrimary_2020_idx" ON "VoterAR"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterAR_OtherElection_2020_idx" ON "VoterAR"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterAR_AnyElection_2019_idx" ON "VoterAR"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterAR_General_2018_idx" ON "VoterAR"("General_2018");

-- CreateIndex
CREATE INDEX "VoterAR_Primary_2018_idx" ON "VoterAR"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterAR_OtherElection_2018_idx" ON "VoterAR"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterAR_AnyElection_2017_idx" ON "VoterAR"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterAR_General_2016_idx" ON "VoterAR"("General_2016");

-- CreateIndex
CREATE INDEX "VoterAR_Primary_2016_idx" ON "VoterAR"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterAR_PresidentialPrimary_2016_idx" ON "VoterAR"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterAR_OtherElection_2016_idx" ON "VoterAR"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterCA_LALVOTERID_key" ON "VoterCA"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterCA_US_Congressional_District_idx" ON "VoterCA"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterCA_State_Senate_District_idx" ON "VoterCA"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterCA_State_House_District_idx" ON "VoterCA"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterCA_County_Legislative_District_idx" ON "VoterCA"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterCA_City_idx" ON "VoterCA"("City");

-- CreateIndex
CREATE INDEX "VoterCA_County_idx" ON "VoterCA"("County");

-- CreateIndex
CREATE INDEX "VoterCA_City_Council_Commissioner_District_idx" ON "VoterCA"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterCA_City_Mayoral_District_idx" ON "VoterCA"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterCA_Town_District_idx" ON "VoterCA"("Town_District");

-- CreateIndex
CREATE INDEX "VoterCA_Town_Council_idx" ON "VoterCA"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterCA_Village_idx" ON "VoterCA"("Village");

-- CreateIndex
CREATE INDEX "VoterCA_Township_idx" ON "VoterCA"("Township");

-- CreateIndex
CREATE INDEX "VoterCA_Borough_idx" ON "VoterCA"("Borough");

-- CreateIndex
CREATE INDEX "VoterCA_Hamlet_Community_Area_idx" ON "VoterCA"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterCA_Board_of_Education_District_idx" ON "VoterCA"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterCA_Board_of_Education_SubDistrict_idx" ON "VoterCA"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterCA_City_School_District_idx" ON "VoterCA"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterCA_College_Board_District_idx" ON "VoterCA"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterCA_Community_College_Commissioner_District_idx" ON "VoterCA"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterCA_Community_College_SubDistrict_idx" ON "VoterCA"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterCA_County_Board_of_Education_District_idx" ON "VoterCA"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterCA_County_Board_of_Education_SubDistrict_idx" ON "VoterCA"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterCA_County_Community_College_District_idx" ON "VoterCA"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterCA_County_Superintendent_of_Schools_District_idx" ON "VoterCA"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterCA_County_Unified_School_District_idx" ON "VoterCA"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterCA_District_Attorney_idx" ON "VoterCA"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterCA_Education_Commission_District_idx" ON "VoterCA"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterCA_Educational_Service_District_idx" ON "VoterCA"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterCA_Election_Commissioner_District_idx" ON "VoterCA"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterCA_Elementary_School_District_idx" ON "VoterCA"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterCA_Elementary_School_SubDistrict_idx" ON "VoterCA"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterCA_Exempted_Village_School_District_idx" ON "VoterCA"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterCA_High_School_District_idx" ON "VoterCA"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterCA_High_School_SubDistrict_idx" ON "VoterCA"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterCA_Judicial_Appellate_District_idx" ON "VoterCA"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterCA_Judicial_Circuit_Court_District_idx" ON "VoterCA"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterCA_Judicial_County_Board_of_Review_District_idx" ON "VoterCA"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterCA_Judicial_County_Court_District_idx" ON "VoterCA"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterCA_Judicial_District_idx" ON "VoterCA"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterCA_Judicial_District_Court_District_idx" ON "VoterCA"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterCA_Judicial_Family_Court_District_idx" ON "VoterCA"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterCA_Judicial_Jury_District_idx" ON "VoterCA"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterCA_Judicial_Juvenile_Court_District_idx" ON "VoterCA"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterCA_Judicial_Magistrate_Division_idx" ON "VoterCA"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterCA_Judicial_Sub_Circuit_District_idx" ON "VoterCA"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterCA_Judicial_Superior_Court_District_idx" ON "VoterCA"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterCA_Judicial_Supreme_Court_District_idx" ON "VoterCA"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterCA_Middle_School_District_idx" ON "VoterCA"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterCA_Municipal_Court_District_idx" ON "VoterCA"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterCA_Proposed_City_Commissioner_District_idx" ON "VoterCA"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterCA_Proposed_Elementary_School_District_idx" ON "VoterCA"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterCA_Proposed_Unified_School_District_idx" ON "VoterCA"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterCA_Regional_Office_of_Education_District_idx" ON "VoterCA"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterCA_School_Board_District_idx" ON "VoterCA"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterCA_School_District_idx" ON "VoterCA"("School_District");

-- CreateIndex
CREATE INDEX "VoterCA_School_District_Vocational_idx" ON "VoterCA"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterCA_School_Facilities_Improvement_District_idx" ON "VoterCA"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterCA_School_Subdistrict_idx" ON "VoterCA"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterCA_Service_Area_District_idx" ON "VoterCA"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterCA_Superintendent_of_Schools_District_idx" ON "VoterCA"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterCA_Unified_School_District_idx" ON "VoterCA"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterCA_Unified_School_SubDistrict_idx" ON "VoterCA"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterCA_Voters_FirstName_idx" ON "VoterCA"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterCA_Voters_MiddleName_idx" ON "VoterCA"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterCA_Voters_LastName_idx" ON "VoterCA"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterCA_Voters_Active_idx" ON "VoterCA"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterCA_MilitaryStatus_Description_idx" ON "VoterCA"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterCA_Voters_Age_idx" ON "VoterCA"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterCA_Parties_Description_idx" ON "VoterCA"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterCA_VoterParties_Change_Changed_Party_idx" ON "VoterCA"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterCA_Voters_CalculatedRegDate_idx" ON "VoterCA"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterCA_Voters_OfficialRegDate_idx" ON "VoterCA"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterCA_VoterTelephones_CellConfidenceCode_idx" ON "VoterCA"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterCA_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterCA"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterCA_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterCA"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterCA_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterCA"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterCA_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterCA"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterCA_Voters_VotingPerformanceMinorElection_idx" ON "VoterCA"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterCA_General_2022_idx" ON "VoterCA"("General_2022");

-- CreateIndex
CREATE INDEX "VoterCA_Primary_2022_idx" ON "VoterCA"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterCA_OtherElection_2022_idx" ON "VoterCA"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterCA_AnyElection_2021_idx" ON "VoterCA"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterCA_General_2020_idx" ON "VoterCA"("General_2020");

-- CreateIndex
CREATE INDEX "VoterCA_Primary_2020_idx" ON "VoterCA"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterCA_PresidentialPrimary_2020_idx" ON "VoterCA"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterCA_OtherElection_2020_idx" ON "VoterCA"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterCA_AnyElection_2019_idx" ON "VoterCA"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterCA_General_2018_idx" ON "VoterCA"("General_2018");

-- CreateIndex
CREATE INDEX "VoterCA_Primary_2018_idx" ON "VoterCA"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterCA_OtherElection_2018_idx" ON "VoterCA"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterCA_AnyElection_2017_idx" ON "VoterCA"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterCA_General_2016_idx" ON "VoterCA"("General_2016");

-- CreateIndex
CREATE INDEX "VoterCA_Primary_2016_idx" ON "VoterCA"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterCA_PresidentialPrimary_2016_idx" ON "VoterCA"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterCA_OtherElection_2016_idx" ON "VoterCA"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterCO_LALVOTERID_key" ON "VoterCO"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterCO_US_Congressional_District_idx" ON "VoterCO"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterCO_State_Senate_District_idx" ON "VoterCO"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterCO_State_House_District_idx" ON "VoterCO"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterCO_County_Legislative_District_idx" ON "VoterCO"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterCO_City_idx" ON "VoterCO"("City");

-- CreateIndex
CREATE INDEX "VoterCO_County_idx" ON "VoterCO"("County");

-- CreateIndex
CREATE INDEX "VoterCO_City_Council_Commissioner_District_idx" ON "VoterCO"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterCO_City_Mayoral_District_idx" ON "VoterCO"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterCO_Town_District_idx" ON "VoterCO"("Town_District");

-- CreateIndex
CREATE INDEX "VoterCO_Town_Council_idx" ON "VoterCO"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterCO_Village_idx" ON "VoterCO"("Village");

-- CreateIndex
CREATE INDEX "VoterCO_Township_idx" ON "VoterCO"("Township");

-- CreateIndex
CREATE INDEX "VoterCO_Borough_idx" ON "VoterCO"("Borough");

-- CreateIndex
CREATE INDEX "VoterCO_Hamlet_Community_Area_idx" ON "VoterCO"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterCO_Board_of_Education_District_idx" ON "VoterCO"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterCO_Board_of_Education_SubDistrict_idx" ON "VoterCO"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterCO_City_School_District_idx" ON "VoterCO"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterCO_College_Board_District_idx" ON "VoterCO"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterCO_Community_College_Commissioner_District_idx" ON "VoterCO"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterCO_Community_College_SubDistrict_idx" ON "VoterCO"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterCO_County_Board_of_Education_District_idx" ON "VoterCO"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterCO_County_Board_of_Education_SubDistrict_idx" ON "VoterCO"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterCO_County_Community_College_District_idx" ON "VoterCO"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterCO_County_Superintendent_of_Schools_District_idx" ON "VoterCO"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterCO_County_Unified_School_District_idx" ON "VoterCO"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterCO_District_Attorney_idx" ON "VoterCO"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterCO_Education_Commission_District_idx" ON "VoterCO"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterCO_Educational_Service_District_idx" ON "VoterCO"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterCO_Election_Commissioner_District_idx" ON "VoterCO"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterCO_Elementary_School_District_idx" ON "VoterCO"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterCO_Elementary_School_SubDistrict_idx" ON "VoterCO"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterCO_Exempted_Village_School_District_idx" ON "VoterCO"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterCO_High_School_District_idx" ON "VoterCO"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterCO_High_School_SubDistrict_idx" ON "VoterCO"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterCO_Judicial_Appellate_District_idx" ON "VoterCO"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterCO_Judicial_Circuit_Court_District_idx" ON "VoterCO"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterCO_Judicial_County_Board_of_Review_District_idx" ON "VoterCO"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterCO_Judicial_County_Court_District_idx" ON "VoterCO"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterCO_Judicial_District_idx" ON "VoterCO"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterCO_Judicial_District_Court_District_idx" ON "VoterCO"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterCO_Judicial_Family_Court_District_idx" ON "VoterCO"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterCO_Judicial_Jury_District_idx" ON "VoterCO"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterCO_Judicial_Juvenile_Court_District_idx" ON "VoterCO"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterCO_Judicial_Magistrate_Division_idx" ON "VoterCO"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterCO_Judicial_Sub_Circuit_District_idx" ON "VoterCO"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterCO_Judicial_Superior_Court_District_idx" ON "VoterCO"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterCO_Judicial_Supreme_Court_District_idx" ON "VoterCO"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterCO_Middle_School_District_idx" ON "VoterCO"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterCO_Municipal_Court_District_idx" ON "VoterCO"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterCO_Proposed_City_Commissioner_District_idx" ON "VoterCO"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterCO_Proposed_Elementary_School_District_idx" ON "VoterCO"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterCO_Proposed_Unified_School_District_idx" ON "VoterCO"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterCO_Regional_Office_of_Education_District_idx" ON "VoterCO"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterCO_School_Board_District_idx" ON "VoterCO"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterCO_School_District_idx" ON "VoterCO"("School_District");

-- CreateIndex
CREATE INDEX "VoterCO_School_District_Vocational_idx" ON "VoterCO"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterCO_School_Facilities_Improvement_District_idx" ON "VoterCO"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterCO_School_Subdistrict_idx" ON "VoterCO"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterCO_Service_Area_District_idx" ON "VoterCO"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterCO_Superintendent_of_Schools_District_idx" ON "VoterCO"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterCO_Unified_School_District_idx" ON "VoterCO"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterCO_Unified_School_SubDistrict_idx" ON "VoterCO"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterCO_Voters_FirstName_idx" ON "VoterCO"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterCO_Voters_MiddleName_idx" ON "VoterCO"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterCO_Voters_LastName_idx" ON "VoterCO"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterCO_Voters_Active_idx" ON "VoterCO"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterCO_MilitaryStatus_Description_idx" ON "VoterCO"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterCO_Voters_Age_idx" ON "VoterCO"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterCO_Parties_Description_idx" ON "VoterCO"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterCO_VoterParties_Change_Changed_Party_idx" ON "VoterCO"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterCO_Voters_CalculatedRegDate_idx" ON "VoterCO"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterCO_Voters_OfficialRegDate_idx" ON "VoterCO"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterCO_VoterTelephones_CellConfidenceCode_idx" ON "VoterCO"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterCO_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterCO"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterCO_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterCO"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterCO_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterCO"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterCO_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterCO"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterCO_Voters_VotingPerformanceMinorElection_idx" ON "VoterCO"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterCO_General_2022_idx" ON "VoterCO"("General_2022");

-- CreateIndex
CREATE INDEX "VoterCO_Primary_2022_idx" ON "VoterCO"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterCO_OtherElection_2022_idx" ON "VoterCO"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterCO_AnyElection_2021_idx" ON "VoterCO"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterCO_General_2020_idx" ON "VoterCO"("General_2020");

-- CreateIndex
CREATE INDEX "VoterCO_Primary_2020_idx" ON "VoterCO"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterCO_PresidentialPrimary_2020_idx" ON "VoterCO"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterCO_OtherElection_2020_idx" ON "VoterCO"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterCO_AnyElection_2019_idx" ON "VoterCO"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterCO_General_2018_idx" ON "VoterCO"("General_2018");

-- CreateIndex
CREATE INDEX "VoterCO_Primary_2018_idx" ON "VoterCO"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterCO_OtherElection_2018_idx" ON "VoterCO"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterCO_AnyElection_2017_idx" ON "VoterCO"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterCO_General_2016_idx" ON "VoterCO"("General_2016");

-- CreateIndex
CREATE INDEX "VoterCO_Primary_2016_idx" ON "VoterCO"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterCO_PresidentialPrimary_2016_idx" ON "VoterCO"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterCO_OtherElection_2016_idx" ON "VoterCO"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterCT_LALVOTERID_key" ON "VoterCT"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterCT_US_Congressional_District_idx" ON "VoterCT"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterCT_State_Senate_District_idx" ON "VoterCT"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterCT_State_House_District_idx" ON "VoterCT"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterCT_County_Legislative_District_idx" ON "VoterCT"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterCT_City_idx" ON "VoterCT"("City");

-- CreateIndex
CREATE INDEX "VoterCT_County_idx" ON "VoterCT"("County");

-- CreateIndex
CREATE INDEX "VoterCT_City_Council_Commissioner_District_idx" ON "VoterCT"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterCT_City_Mayoral_District_idx" ON "VoterCT"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterCT_Town_District_idx" ON "VoterCT"("Town_District");

-- CreateIndex
CREATE INDEX "VoterCT_Town_Council_idx" ON "VoterCT"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterCT_Village_idx" ON "VoterCT"("Village");

-- CreateIndex
CREATE INDEX "VoterCT_Township_idx" ON "VoterCT"("Township");

-- CreateIndex
CREATE INDEX "VoterCT_Borough_idx" ON "VoterCT"("Borough");

-- CreateIndex
CREATE INDEX "VoterCT_Hamlet_Community_Area_idx" ON "VoterCT"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterCT_Board_of_Education_District_idx" ON "VoterCT"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterCT_Board_of_Education_SubDistrict_idx" ON "VoterCT"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterCT_City_School_District_idx" ON "VoterCT"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterCT_College_Board_District_idx" ON "VoterCT"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterCT_Community_College_Commissioner_District_idx" ON "VoterCT"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterCT_Community_College_SubDistrict_idx" ON "VoterCT"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterCT_County_Board_of_Education_District_idx" ON "VoterCT"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterCT_County_Board_of_Education_SubDistrict_idx" ON "VoterCT"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterCT_County_Community_College_District_idx" ON "VoterCT"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterCT_County_Superintendent_of_Schools_District_idx" ON "VoterCT"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterCT_County_Unified_School_District_idx" ON "VoterCT"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterCT_District_Attorney_idx" ON "VoterCT"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterCT_Education_Commission_District_idx" ON "VoterCT"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterCT_Educational_Service_District_idx" ON "VoterCT"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterCT_Election_Commissioner_District_idx" ON "VoterCT"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterCT_Elementary_School_District_idx" ON "VoterCT"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterCT_Elementary_School_SubDistrict_idx" ON "VoterCT"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterCT_Exempted_Village_School_District_idx" ON "VoterCT"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterCT_High_School_District_idx" ON "VoterCT"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterCT_High_School_SubDistrict_idx" ON "VoterCT"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterCT_Judicial_Appellate_District_idx" ON "VoterCT"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterCT_Judicial_Circuit_Court_District_idx" ON "VoterCT"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterCT_Judicial_County_Board_of_Review_District_idx" ON "VoterCT"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterCT_Judicial_County_Court_District_idx" ON "VoterCT"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterCT_Judicial_District_idx" ON "VoterCT"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterCT_Judicial_District_Court_District_idx" ON "VoterCT"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterCT_Judicial_Family_Court_District_idx" ON "VoterCT"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterCT_Judicial_Jury_District_idx" ON "VoterCT"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterCT_Judicial_Juvenile_Court_District_idx" ON "VoterCT"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterCT_Judicial_Magistrate_Division_idx" ON "VoterCT"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterCT_Judicial_Sub_Circuit_District_idx" ON "VoterCT"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterCT_Judicial_Superior_Court_District_idx" ON "VoterCT"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterCT_Judicial_Supreme_Court_District_idx" ON "VoterCT"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterCT_Middle_School_District_idx" ON "VoterCT"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterCT_Municipal_Court_District_idx" ON "VoterCT"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterCT_Proposed_City_Commissioner_District_idx" ON "VoterCT"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterCT_Proposed_Elementary_School_District_idx" ON "VoterCT"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterCT_Proposed_Unified_School_District_idx" ON "VoterCT"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterCT_Regional_Office_of_Education_District_idx" ON "VoterCT"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterCT_School_Board_District_idx" ON "VoterCT"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterCT_School_District_idx" ON "VoterCT"("School_District");

-- CreateIndex
CREATE INDEX "VoterCT_School_District_Vocational_idx" ON "VoterCT"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterCT_School_Facilities_Improvement_District_idx" ON "VoterCT"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterCT_School_Subdistrict_idx" ON "VoterCT"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterCT_Service_Area_District_idx" ON "VoterCT"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterCT_Superintendent_of_Schools_District_idx" ON "VoterCT"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterCT_Unified_School_District_idx" ON "VoterCT"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterCT_Unified_School_SubDistrict_idx" ON "VoterCT"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterCT_Voters_FirstName_idx" ON "VoterCT"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterCT_Voters_MiddleName_idx" ON "VoterCT"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterCT_Voters_LastName_idx" ON "VoterCT"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterCT_Voters_Active_idx" ON "VoterCT"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterCT_MilitaryStatus_Description_idx" ON "VoterCT"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterCT_Voters_Age_idx" ON "VoterCT"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterCT_Parties_Description_idx" ON "VoterCT"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterCT_VoterParties_Change_Changed_Party_idx" ON "VoterCT"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterCT_Voters_CalculatedRegDate_idx" ON "VoterCT"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterCT_Voters_OfficialRegDate_idx" ON "VoterCT"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterCT_VoterTelephones_CellConfidenceCode_idx" ON "VoterCT"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterCT_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterCT"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterCT_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterCT"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterCT_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterCT"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterCT_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterCT"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterCT_Voters_VotingPerformanceMinorElection_idx" ON "VoterCT"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterCT_General_2022_idx" ON "VoterCT"("General_2022");

-- CreateIndex
CREATE INDEX "VoterCT_Primary_2022_idx" ON "VoterCT"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterCT_OtherElection_2022_idx" ON "VoterCT"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterCT_AnyElection_2021_idx" ON "VoterCT"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterCT_General_2020_idx" ON "VoterCT"("General_2020");

-- CreateIndex
CREATE INDEX "VoterCT_Primary_2020_idx" ON "VoterCT"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterCT_PresidentialPrimary_2020_idx" ON "VoterCT"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterCT_OtherElection_2020_idx" ON "VoterCT"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterCT_AnyElection_2019_idx" ON "VoterCT"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterCT_General_2018_idx" ON "VoterCT"("General_2018");

-- CreateIndex
CREATE INDEX "VoterCT_Primary_2018_idx" ON "VoterCT"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterCT_OtherElection_2018_idx" ON "VoterCT"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterCT_AnyElection_2017_idx" ON "VoterCT"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterCT_General_2016_idx" ON "VoterCT"("General_2016");

-- CreateIndex
CREATE INDEX "VoterCT_Primary_2016_idx" ON "VoterCT"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterCT_PresidentialPrimary_2016_idx" ON "VoterCT"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterCT_OtherElection_2016_idx" ON "VoterCT"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterDE_LALVOTERID_key" ON "VoterDE"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterDE_US_Congressional_District_idx" ON "VoterDE"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterDE_State_Senate_District_idx" ON "VoterDE"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterDE_State_House_District_idx" ON "VoterDE"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterDE_County_Legislative_District_idx" ON "VoterDE"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterDE_City_idx" ON "VoterDE"("City");

-- CreateIndex
CREATE INDEX "VoterDE_County_idx" ON "VoterDE"("County");

-- CreateIndex
CREATE INDEX "VoterDE_City_Council_Commissioner_District_idx" ON "VoterDE"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterDE_City_Mayoral_District_idx" ON "VoterDE"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterDE_Town_District_idx" ON "VoterDE"("Town_District");

-- CreateIndex
CREATE INDEX "VoterDE_Town_Council_idx" ON "VoterDE"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterDE_Village_idx" ON "VoterDE"("Village");

-- CreateIndex
CREATE INDEX "VoterDE_Township_idx" ON "VoterDE"("Township");

-- CreateIndex
CREATE INDEX "VoterDE_Borough_idx" ON "VoterDE"("Borough");

-- CreateIndex
CREATE INDEX "VoterDE_Hamlet_Community_Area_idx" ON "VoterDE"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterDE_Board_of_Education_District_idx" ON "VoterDE"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterDE_Board_of_Education_SubDistrict_idx" ON "VoterDE"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterDE_City_School_District_idx" ON "VoterDE"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterDE_College_Board_District_idx" ON "VoterDE"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterDE_Community_College_Commissioner_District_idx" ON "VoterDE"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterDE_Community_College_SubDistrict_idx" ON "VoterDE"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterDE_County_Board_of_Education_District_idx" ON "VoterDE"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterDE_County_Board_of_Education_SubDistrict_idx" ON "VoterDE"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterDE_County_Community_College_District_idx" ON "VoterDE"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterDE_County_Superintendent_of_Schools_District_idx" ON "VoterDE"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterDE_County_Unified_School_District_idx" ON "VoterDE"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterDE_District_Attorney_idx" ON "VoterDE"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterDE_Education_Commission_District_idx" ON "VoterDE"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterDE_Educational_Service_District_idx" ON "VoterDE"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterDE_Election_Commissioner_District_idx" ON "VoterDE"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterDE_Elementary_School_District_idx" ON "VoterDE"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterDE_Elementary_School_SubDistrict_idx" ON "VoterDE"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterDE_Exempted_Village_School_District_idx" ON "VoterDE"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterDE_High_School_District_idx" ON "VoterDE"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterDE_High_School_SubDistrict_idx" ON "VoterDE"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterDE_Judicial_Appellate_District_idx" ON "VoterDE"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterDE_Judicial_Circuit_Court_District_idx" ON "VoterDE"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterDE_Judicial_County_Board_of_Review_District_idx" ON "VoterDE"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterDE_Judicial_County_Court_District_idx" ON "VoterDE"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterDE_Judicial_District_idx" ON "VoterDE"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterDE_Judicial_District_Court_District_idx" ON "VoterDE"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterDE_Judicial_Family_Court_District_idx" ON "VoterDE"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterDE_Judicial_Jury_District_idx" ON "VoterDE"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterDE_Judicial_Juvenile_Court_District_idx" ON "VoterDE"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterDE_Judicial_Magistrate_Division_idx" ON "VoterDE"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterDE_Judicial_Sub_Circuit_District_idx" ON "VoterDE"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterDE_Judicial_Superior_Court_District_idx" ON "VoterDE"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterDE_Judicial_Supreme_Court_District_idx" ON "VoterDE"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterDE_Middle_School_District_idx" ON "VoterDE"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterDE_Municipal_Court_District_idx" ON "VoterDE"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterDE_Proposed_City_Commissioner_District_idx" ON "VoterDE"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterDE_Proposed_Elementary_School_District_idx" ON "VoterDE"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterDE_Proposed_Unified_School_District_idx" ON "VoterDE"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterDE_Regional_Office_of_Education_District_idx" ON "VoterDE"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterDE_School_Board_District_idx" ON "VoterDE"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterDE_School_District_idx" ON "VoterDE"("School_District");

-- CreateIndex
CREATE INDEX "VoterDE_School_District_Vocational_idx" ON "VoterDE"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterDE_School_Facilities_Improvement_District_idx" ON "VoterDE"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterDE_School_Subdistrict_idx" ON "VoterDE"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterDE_Service_Area_District_idx" ON "VoterDE"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterDE_Superintendent_of_Schools_District_idx" ON "VoterDE"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterDE_Unified_School_District_idx" ON "VoterDE"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterDE_Unified_School_SubDistrict_idx" ON "VoterDE"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterDE_Voters_FirstName_idx" ON "VoterDE"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterDE_Voters_MiddleName_idx" ON "VoterDE"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterDE_Voters_LastName_idx" ON "VoterDE"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterDE_Voters_Active_idx" ON "VoterDE"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterDE_MilitaryStatus_Description_idx" ON "VoterDE"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterDE_Voters_Age_idx" ON "VoterDE"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterDE_Parties_Description_idx" ON "VoterDE"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterDE_VoterParties_Change_Changed_Party_idx" ON "VoterDE"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterDE_Voters_CalculatedRegDate_idx" ON "VoterDE"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterDE_Voters_OfficialRegDate_idx" ON "VoterDE"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterDE_VoterTelephones_CellConfidenceCode_idx" ON "VoterDE"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterDE_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterDE"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterDE_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterDE"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterDE_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterDE"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterDE_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterDE"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterDE_Voters_VotingPerformanceMinorElection_idx" ON "VoterDE"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterDE_General_2022_idx" ON "VoterDE"("General_2022");

-- CreateIndex
CREATE INDEX "VoterDE_Primary_2022_idx" ON "VoterDE"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterDE_OtherElection_2022_idx" ON "VoterDE"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterDE_AnyElection_2021_idx" ON "VoterDE"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterDE_General_2020_idx" ON "VoterDE"("General_2020");

-- CreateIndex
CREATE INDEX "VoterDE_Primary_2020_idx" ON "VoterDE"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterDE_PresidentialPrimary_2020_idx" ON "VoterDE"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterDE_OtherElection_2020_idx" ON "VoterDE"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterDE_AnyElection_2019_idx" ON "VoterDE"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterDE_General_2018_idx" ON "VoterDE"("General_2018");

-- CreateIndex
CREATE INDEX "VoterDE_Primary_2018_idx" ON "VoterDE"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterDE_OtherElection_2018_idx" ON "VoterDE"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterDE_AnyElection_2017_idx" ON "VoterDE"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterDE_General_2016_idx" ON "VoterDE"("General_2016");

-- CreateIndex
CREATE INDEX "VoterDE_Primary_2016_idx" ON "VoterDE"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterDE_PresidentialPrimary_2016_idx" ON "VoterDE"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterDE_OtherElection_2016_idx" ON "VoterDE"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterFL_LALVOTERID_key" ON "VoterFL"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterFL_US_Congressional_District_idx" ON "VoterFL"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterFL_State_Senate_District_idx" ON "VoterFL"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterFL_State_House_District_idx" ON "VoterFL"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterFL_County_Legislative_District_idx" ON "VoterFL"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterFL_City_idx" ON "VoterFL"("City");

-- CreateIndex
CREATE INDEX "VoterFL_County_idx" ON "VoterFL"("County");

-- CreateIndex
CREATE INDEX "VoterFL_City_Council_Commissioner_District_idx" ON "VoterFL"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterFL_City_Mayoral_District_idx" ON "VoterFL"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterFL_Town_District_idx" ON "VoterFL"("Town_District");

-- CreateIndex
CREATE INDEX "VoterFL_Town_Council_idx" ON "VoterFL"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterFL_Village_idx" ON "VoterFL"("Village");

-- CreateIndex
CREATE INDEX "VoterFL_Township_idx" ON "VoterFL"("Township");

-- CreateIndex
CREATE INDEX "VoterFL_Borough_idx" ON "VoterFL"("Borough");

-- CreateIndex
CREATE INDEX "VoterFL_Hamlet_Community_Area_idx" ON "VoterFL"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterFL_Board_of_Education_District_idx" ON "VoterFL"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterFL_Board_of_Education_SubDistrict_idx" ON "VoterFL"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterFL_City_School_District_idx" ON "VoterFL"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterFL_College_Board_District_idx" ON "VoterFL"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterFL_Community_College_Commissioner_District_idx" ON "VoterFL"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterFL_Community_College_SubDistrict_idx" ON "VoterFL"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterFL_County_Board_of_Education_District_idx" ON "VoterFL"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterFL_County_Board_of_Education_SubDistrict_idx" ON "VoterFL"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterFL_County_Community_College_District_idx" ON "VoterFL"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterFL_County_Superintendent_of_Schools_District_idx" ON "VoterFL"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterFL_County_Unified_School_District_idx" ON "VoterFL"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterFL_District_Attorney_idx" ON "VoterFL"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterFL_Education_Commission_District_idx" ON "VoterFL"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterFL_Educational_Service_District_idx" ON "VoterFL"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterFL_Election_Commissioner_District_idx" ON "VoterFL"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterFL_Elementary_School_District_idx" ON "VoterFL"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterFL_Elementary_School_SubDistrict_idx" ON "VoterFL"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterFL_Exempted_Village_School_District_idx" ON "VoterFL"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterFL_High_School_District_idx" ON "VoterFL"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterFL_High_School_SubDistrict_idx" ON "VoterFL"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterFL_Judicial_Appellate_District_idx" ON "VoterFL"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterFL_Judicial_Circuit_Court_District_idx" ON "VoterFL"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterFL_Judicial_County_Board_of_Review_District_idx" ON "VoterFL"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterFL_Judicial_County_Court_District_idx" ON "VoterFL"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterFL_Judicial_District_idx" ON "VoterFL"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterFL_Judicial_District_Court_District_idx" ON "VoterFL"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterFL_Judicial_Family_Court_District_idx" ON "VoterFL"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterFL_Judicial_Jury_District_idx" ON "VoterFL"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterFL_Judicial_Juvenile_Court_District_idx" ON "VoterFL"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterFL_Judicial_Magistrate_Division_idx" ON "VoterFL"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterFL_Judicial_Sub_Circuit_District_idx" ON "VoterFL"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterFL_Judicial_Superior_Court_District_idx" ON "VoterFL"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterFL_Judicial_Supreme_Court_District_idx" ON "VoterFL"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterFL_Middle_School_District_idx" ON "VoterFL"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterFL_Municipal_Court_District_idx" ON "VoterFL"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterFL_Proposed_City_Commissioner_District_idx" ON "VoterFL"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterFL_Proposed_Elementary_School_District_idx" ON "VoterFL"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterFL_Proposed_Unified_School_District_idx" ON "VoterFL"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterFL_Regional_Office_of_Education_District_idx" ON "VoterFL"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterFL_School_Board_District_idx" ON "VoterFL"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterFL_School_District_idx" ON "VoterFL"("School_District");

-- CreateIndex
CREATE INDEX "VoterFL_School_District_Vocational_idx" ON "VoterFL"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterFL_School_Facilities_Improvement_District_idx" ON "VoterFL"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterFL_School_Subdistrict_idx" ON "VoterFL"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterFL_Service_Area_District_idx" ON "VoterFL"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterFL_Superintendent_of_Schools_District_idx" ON "VoterFL"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterFL_Unified_School_District_idx" ON "VoterFL"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterFL_Unified_School_SubDistrict_idx" ON "VoterFL"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterFL_Voters_FirstName_idx" ON "VoterFL"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterFL_Voters_MiddleName_idx" ON "VoterFL"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterFL_Voters_LastName_idx" ON "VoterFL"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterFL_Voters_Active_idx" ON "VoterFL"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterFL_MilitaryStatus_Description_idx" ON "VoterFL"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterFL_Voters_Age_idx" ON "VoterFL"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterFL_Parties_Description_idx" ON "VoterFL"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterFL_VoterParties_Change_Changed_Party_idx" ON "VoterFL"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterFL_Voters_CalculatedRegDate_idx" ON "VoterFL"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterFL_Voters_OfficialRegDate_idx" ON "VoterFL"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterFL_VoterTelephones_CellConfidenceCode_idx" ON "VoterFL"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterFL_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterFL"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterFL_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterFL"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterFL_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterFL"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterFL_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterFL"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterFL_Voters_VotingPerformanceMinorElection_idx" ON "VoterFL"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterFL_General_2022_idx" ON "VoterFL"("General_2022");

-- CreateIndex
CREATE INDEX "VoterFL_Primary_2022_idx" ON "VoterFL"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterFL_OtherElection_2022_idx" ON "VoterFL"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterFL_AnyElection_2021_idx" ON "VoterFL"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterFL_General_2020_idx" ON "VoterFL"("General_2020");

-- CreateIndex
CREATE INDEX "VoterFL_Primary_2020_idx" ON "VoterFL"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterFL_PresidentialPrimary_2020_idx" ON "VoterFL"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterFL_OtherElection_2020_idx" ON "VoterFL"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterFL_AnyElection_2019_idx" ON "VoterFL"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterFL_General_2018_idx" ON "VoterFL"("General_2018");

-- CreateIndex
CREATE INDEX "VoterFL_Primary_2018_idx" ON "VoterFL"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterFL_OtherElection_2018_idx" ON "VoterFL"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterFL_AnyElection_2017_idx" ON "VoterFL"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterFL_General_2016_idx" ON "VoterFL"("General_2016");

-- CreateIndex
CREATE INDEX "VoterFL_Primary_2016_idx" ON "VoterFL"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterFL_PresidentialPrimary_2016_idx" ON "VoterFL"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterFL_OtherElection_2016_idx" ON "VoterFL"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterGA_LALVOTERID_key" ON "VoterGA"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterGA_US_Congressional_District_idx" ON "VoterGA"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterGA_State_Senate_District_idx" ON "VoterGA"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterGA_State_House_District_idx" ON "VoterGA"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterGA_County_Legislative_District_idx" ON "VoterGA"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterGA_City_idx" ON "VoterGA"("City");

-- CreateIndex
CREATE INDEX "VoterGA_County_idx" ON "VoterGA"("County");

-- CreateIndex
CREATE INDEX "VoterGA_City_Council_Commissioner_District_idx" ON "VoterGA"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterGA_City_Mayoral_District_idx" ON "VoterGA"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterGA_Town_District_idx" ON "VoterGA"("Town_District");

-- CreateIndex
CREATE INDEX "VoterGA_Town_Council_idx" ON "VoterGA"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterGA_Village_idx" ON "VoterGA"("Village");

-- CreateIndex
CREATE INDEX "VoterGA_Township_idx" ON "VoterGA"("Township");

-- CreateIndex
CREATE INDEX "VoterGA_Borough_idx" ON "VoterGA"("Borough");

-- CreateIndex
CREATE INDEX "VoterGA_Hamlet_Community_Area_idx" ON "VoterGA"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterGA_Board_of_Education_District_idx" ON "VoterGA"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterGA_Board_of_Education_SubDistrict_idx" ON "VoterGA"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterGA_City_School_District_idx" ON "VoterGA"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterGA_College_Board_District_idx" ON "VoterGA"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterGA_Community_College_Commissioner_District_idx" ON "VoterGA"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterGA_Community_College_SubDistrict_idx" ON "VoterGA"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterGA_County_Board_of_Education_District_idx" ON "VoterGA"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterGA_County_Board_of_Education_SubDistrict_idx" ON "VoterGA"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterGA_County_Community_College_District_idx" ON "VoterGA"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterGA_County_Superintendent_of_Schools_District_idx" ON "VoterGA"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterGA_County_Unified_School_District_idx" ON "VoterGA"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterGA_District_Attorney_idx" ON "VoterGA"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterGA_Education_Commission_District_idx" ON "VoterGA"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterGA_Educational_Service_District_idx" ON "VoterGA"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterGA_Election_Commissioner_District_idx" ON "VoterGA"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterGA_Elementary_School_District_idx" ON "VoterGA"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterGA_Elementary_School_SubDistrict_idx" ON "VoterGA"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterGA_Exempted_Village_School_District_idx" ON "VoterGA"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterGA_High_School_District_idx" ON "VoterGA"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterGA_High_School_SubDistrict_idx" ON "VoterGA"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterGA_Judicial_Appellate_District_idx" ON "VoterGA"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterGA_Judicial_Circuit_Court_District_idx" ON "VoterGA"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterGA_Judicial_County_Board_of_Review_District_idx" ON "VoterGA"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterGA_Judicial_County_Court_District_idx" ON "VoterGA"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterGA_Judicial_District_idx" ON "VoterGA"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterGA_Judicial_District_Court_District_idx" ON "VoterGA"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterGA_Judicial_Family_Court_District_idx" ON "VoterGA"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterGA_Judicial_Jury_District_idx" ON "VoterGA"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterGA_Judicial_Juvenile_Court_District_idx" ON "VoterGA"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterGA_Judicial_Magistrate_Division_idx" ON "VoterGA"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterGA_Judicial_Sub_Circuit_District_idx" ON "VoterGA"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterGA_Judicial_Superior_Court_District_idx" ON "VoterGA"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterGA_Judicial_Supreme_Court_District_idx" ON "VoterGA"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterGA_Middle_School_District_idx" ON "VoterGA"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterGA_Municipal_Court_District_idx" ON "VoterGA"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterGA_Proposed_City_Commissioner_District_idx" ON "VoterGA"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterGA_Proposed_Elementary_School_District_idx" ON "VoterGA"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterGA_Proposed_Unified_School_District_idx" ON "VoterGA"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterGA_Regional_Office_of_Education_District_idx" ON "VoterGA"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterGA_School_Board_District_idx" ON "VoterGA"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterGA_School_District_idx" ON "VoterGA"("School_District");

-- CreateIndex
CREATE INDEX "VoterGA_School_District_Vocational_idx" ON "VoterGA"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterGA_School_Facilities_Improvement_District_idx" ON "VoterGA"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterGA_School_Subdistrict_idx" ON "VoterGA"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterGA_Service_Area_District_idx" ON "VoterGA"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterGA_Superintendent_of_Schools_District_idx" ON "VoterGA"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterGA_Unified_School_District_idx" ON "VoterGA"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterGA_Unified_School_SubDistrict_idx" ON "VoterGA"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterGA_Voters_FirstName_idx" ON "VoterGA"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterGA_Voters_MiddleName_idx" ON "VoterGA"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterGA_Voters_LastName_idx" ON "VoterGA"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterGA_Voters_Active_idx" ON "VoterGA"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterGA_MilitaryStatus_Description_idx" ON "VoterGA"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterGA_Voters_Age_idx" ON "VoterGA"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterGA_Parties_Description_idx" ON "VoterGA"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterGA_VoterParties_Change_Changed_Party_idx" ON "VoterGA"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterGA_Voters_CalculatedRegDate_idx" ON "VoterGA"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterGA_Voters_OfficialRegDate_idx" ON "VoterGA"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterGA_VoterTelephones_CellConfidenceCode_idx" ON "VoterGA"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterGA_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterGA"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterGA_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterGA"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterGA_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterGA"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterGA_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterGA"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterGA_Voters_VotingPerformanceMinorElection_idx" ON "VoterGA"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterGA_General_2022_idx" ON "VoterGA"("General_2022");

-- CreateIndex
CREATE INDEX "VoterGA_Primary_2022_idx" ON "VoterGA"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterGA_OtherElection_2022_idx" ON "VoterGA"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterGA_AnyElection_2021_idx" ON "VoterGA"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterGA_General_2020_idx" ON "VoterGA"("General_2020");

-- CreateIndex
CREATE INDEX "VoterGA_Primary_2020_idx" ON "VoterGA"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterGA_PresidentialPrimary_2020_idx" ON "VoterGA"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterGA_OtherElection_2020_idx" ON "VoterGA"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterGA_AnyElection_2019_idx" ON "VoterGA"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterGA_General_2018_idx" ON "VoterGA"("General_2018");

-- CreateIndex
CREATE INDEX "VoterGA_Primary_2018_idx" ON "VoterGA"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterGA_OtherElection_2018_idx" ON "VoterGA"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterGA_AnyElection_2017_idx" ON "VoterGA"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterGA_General_2016_idx" ON "VoterGA"("General_2016");

-- CreateIndex
CREATE INDEX "VoterGA_Primary_2016_idx" ON "VoterGA"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterGA_PresidentialPrimary_2016_idx" ON "VoterGA"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterGA_OtherElection_2016_idx" ON "VoterGA"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterHI_LALVOTERID_key" ON "VoterHI"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterHI_US_Congressional_District_idx" ON "VoterHI"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterHI_State_Senate_District_idx" ON "VoterHI"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterHI_State_House_District_idx" ON "VoterHI"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterHI_County_Legislative_District_idx" ON "VoterHI"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterHI_City_idx" ON "VoterHI"("City");

-- CreateIndex
CREATE INDEX "VoterHI_County_idx" ON "VoterHI"("County");

-- CreateIndex
CREATE INDEX "VoterHI_City_Council_Commissioner_District_idx" ON "VoterHI"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterHI_City_Mayoral_District_idx" ON "VoterHI"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterHI_Town_District_idx" ON "VoterHI"("Town_District");

-- CreateIndex
CREATE INDEX "VoterHI_Town_Council_idx" ON "VoterHI"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterHI_Village_idx" ON "VoterHI"("Village");

-- CreateIndex
CREATE INDEX "VoterHI_Township_idx" ON "VoterHI"("Township");

-- CreateIndex
CREATE INDEX "VoterHI_Borough_idx" ON "VoterHI"("Borough");

-- CreateIndex
CREATE INDEX "VoterHI_Hamlet_Community_Area_idx" ON "VoterHI"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterHI_Board_of_Education_District_idx" ON "VoterHI"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterHI_Board_of_Education_SubDistrict_idx" ON "VoterHI"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterHI_City_School_District_idx" ON "VoterHI"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterHI_College_Board_District_idx" ON "VoterHI"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterHI_Community_College_Commissioner_District_idx" ON "VoterHI"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterHI_Community_College_SubDistrict_idx" ON "VoterHI"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterHI_County_Board_of_Education_District_idx" ON "VoterHI"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterHI_County_Board_of_Education_SubDistrict_idx" ON "VoterHI"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterHI_County_Community_College_District_idx" ON "VoterHI"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterHI_County_Superintendent_of_Schools_District_idx" ON "VoterHI"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterHI_County_Unified_School_District_idx" ON "VoterHI"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterHI_District_Attorney_idx" ON "VoterHI"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterHI_Education_Commission_District_idx" ON "VoterHI"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterHI_Educational_Service_District_idx" ON "VoterHI"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterHI_Election_Commissioner_District_idx" ON "VoterHI"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterHI_Elementary_School_District_idx" ON "VoterHI"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterHI_Elementary_School_SubDistrict_idx" ON "VoterHI"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterHI_Exempted_Village_School_District_idx" ON "VoterHI"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterHI_High_School_District_idx" ON "VoterHI"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterHI_High_School_SubDistrict_idx" ON "VoterHI"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterHI_Judicial_Appellate_District_idx" ON "VoterHI"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterHI_Judicial_Circuit_Court_District_idx" ON "VoterHI"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterHI_Judicial_County_Board_of_Review_District_idx" ON "VoterHI"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterHI_Judicial_County_Court_District_idx" ON "VoterHI"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterHI_Judicial_District_idx" ON "VoterHI"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterHI_Judicial_District_Court_District_idx" ON "VoterHI"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterHI_Judicial_Family_Court_District_idx" ON "VoterHI"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterHI_Judicial_Jury_District_idx" ON "VoterHI"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterHI_Judicial_Juvenile_Court_District_idx" ON "VoterHI"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterHI_Judicial_Magistrate_Division_idx" ON "VoterHI"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterHI_Judicial_Sub_Circuit_District_idx" ON "VoterHI"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterHI_Judicial_Superior_Court_District_idx" ON "VoterHI"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterHI_Judicial_Supreme_Court_District_idx" ON "VoterHI"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterHI_Middle_School_District_idx" ON "VoterHI"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterHI_Municipal_Court_District_idx" ON "VoterHI"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterHI_Proposed_City_Commissioner_District_idx" ON "VoterHI"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterHI_Proposed_Elementary_School_District_idx" ON "VoterHI"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterHI_Proposed_Unified_School_District_idx" ON "VoterHI"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterHI_Regional_Office_of_Education_District_idx" ON "VoterHI"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterHI_School_Board_District_idx" ON "VoterHI"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterHI_School_District_idx" ON "VoterHI"("School_District");

-- CreateIndex
CREATE INDEX "VoterHI_School_District_Vocational_idx" ON "VoterHI"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterHI_School_Facilities_Improvement_District_idx" ON "VoterHI"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterHI_School_Subdistrict_idx" ON "VoterHI"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterHI_Service_Area_District_idx" ON "VoterHI"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterHI_Superintendent_of_Schools_District_idx" ON "VoterHI"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterHI_Unified_School_District_idx" ON "VoterHI"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterHI_Unified_School_SubDistrict_idx" ON "VoterHI"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterHI_Voters_FirstName_idx" ON "VoterHI"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterHI_Voters_MiddleName_idx" ON "VoterHI"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterHI_Voters_LastName_idx" ON "VoterHI"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterHI_Voters_Active_idx" ON "VoterHI"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterHI_MilitaryStatus_Description_idx" ON "VoterHI"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterHI_Voters_Age_idx" ON "VoterHI"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterHI_Parties_Description_idx" ON "VoterHI"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterHI_VoterParties_Change_Changed_Party_idx" ON "VoterHI"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterHI_Voters_CalculatedRegDate_idx" ON "VoterHI"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterHI_Voters_OfficialRegDate_idx" ON "VoterHI"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterHI_VoterTelephones_CellConfidenceCode_idx" ON "VoterHI"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterHI_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterHI"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterHI_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterHI"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterHI_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterHI"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterHI_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterHI"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterHI_Voters_VotingPerformanceMinorElection_idx" ON "VoterHI"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterHI_General_2022_idx" ON "VoterHI"("General_2022");

-- CreateIndex
CREATE INDEX "VoterHI_Primary_2022_idx" ON "VoterHI"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterHI_OtherElection_2022_idx" ON "VoterHI"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterHI_AnyElection_2021_idx" ON "VoterHI"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterHI_General_2020_idx" ON "VoterHI"("General_2020");

-- CreateIndex
CREATE INDEX "VoterHI_Primary_2020_idx" ON "VoterHI"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterHI_PresidentialPrimary_2020_idx" ON "VoterHI"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterHI_OtherElection_2020_idx" ON "VoterHI"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterHI_AnyElection_2019_idx" ON "VoterHI"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterHI_General_2018_idx" ON "VoterHI"("General_2018");

-- CreateIndex
CREATE INDEX "VoterHI_Primary_2018_idx" ON "VoterHI"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterHI_OtherElection_2018_idx" ON "VoterHI"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterHI_AnyElection_2017_idx" ON "VoterHI"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterHI_General_2016_idx" ON "VoterHI"("General_2016");

-- CreateIndex
CREATE INDEX "VoterHI_Primary_2016_idx" ON "VoterHI"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterHI_PresidentialPrimary_2016_idx" ON "VoterHI"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterHI_OtherElection_2016_idx" ON "VoterHI"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterID_LALVOTERID_key" ON "VoterID"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterID_US_Congressional_District_idx" ON "VoterID"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterID_State_Senate_District_idx" ON "VoterID"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterID_State_House_District_idx" ON "VoterID"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterID_County_Legislative_District_idx" ON "VoterID"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterID_City_idx" ON "VoterID"("City");

-- CreateIndex
CREATE INDEX "VoterID_County_idx" ON "VoterID"("County");

-- CreateIndex
CREATE INDEX "VoterID_City_Council_Commissioner_District_idx" ON "VoterID"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterID_City_Mayoral_District_idx" ON "VoterID"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterID_Town_District_idx" ON "VoterID"("Town_District");

-- CreateIndex
CREATE INDEX "VoterID_Town_Council_idx" ON "VoterID"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterID_Village_idx" ON "VoterID"("Village");

-- CreateIndex
CREATE INDEX "VoterID_Township_idx" ON "VoterID"("Township");

-- CreateIndex
CREATE INDEX "VoterID_Borough_idx" ON "VoterID"("Borough");

-- CreateIndex
CREATE INDEX "VoterID_Hamlet_Community_Area_idx" ON "VoterID"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterID_Board_of_Education_District_idx" ON "VoterID"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterID_Board_of_Education_SubDistrict_idx" ON "VoterID"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterID_City_School_District_idx" ON "VoterID"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterID_College_Board_District_idx" ON "VoterID"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterID_Community_College_Commissioner_District_idx" ON "VoterID"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterID_Community_College_SubDistrict_idx" ON "VoterID"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterID_County_Board_of_Education_District_idx" ON "VoterID"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterID_County_Board_of_Education_SubDistrict_idx" ON "VoterID"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterID_County_Community_College_District_idx" ON "VoterID"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterID_County_Superintendent_of_Schools_District_idx" ON "VoterID"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterID_County_Unified_School_District_idx" ON "VoterID"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterID_District_Attorney_idx" ON "VoterID"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterID_Education_Commission_District_idx" ON "VoterID"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterID_Educational_Service_District_idx" ON "VoterID"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterID_Election_Commissioner_District_idx" ON "VoterID"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterID_Elementary_School_District_idx" ON "VoterID"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterID_Elementary_School_SubDistrict_idx" ON "VoterID"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterID_Exempted_Village_School_District_idx" ON "VoterID"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterID_High_School_District_idx" ON "VoterID"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterID_High_School_SubDistrict_idx" ON "VoterID"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterID_Judicial_Appellate_District_idx" ON "VoterID"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterID_Judicial_Circuit_Court_District_idx" ON "VoterID"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterID_Judicial_County_Board_of_Review_District_idx" ON "VoterID"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterID_Judicial_County_Court_District_idx" ON "VoterID"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterID_Judicial_District_idx" ON "VoterID"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterID_Judicial_District_Court_District_idx" ON "VoterID"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterID_Judicial_Family_Court_District_idx" ON "VoterID"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterID_Judicial_Jury_District_idx" ON "VoterID"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterID_Judicial_Juvenile_Court_District_idx" ON "VoterID"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterID_Judicial_Magistrate_Division_idx" ON "VoterID"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterID_Judicial_Sub_Circuit_District_idx" ON "VoterID"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterID_Judicial_Superior_Court_District_idx" ON "VoterID"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterID_Judicial_Supreme_Court_District_idx" ON "VoterID"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterID_Middle_School_District_idx" ON "VoterID"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterID_Municipal_Court_District_idx" ON "VoterID"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterID_Proposed_City_Commissioner_District_idx" ON "VoterID"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterID_Proposed_Elementary_School_District_idx" ON "VoterID"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterID_Proposed_Unified_School_District_idx" ON "VoterID"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterID_Regional_Office_of_Education_District_idx" ON "VoterID"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterID_School_Board_District_idx" ON "VoterID"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterID_School_District_idx" ON "VoterID"("School_District");

-- CreateIndex
CREATE INDEX "VoterID_School_District_Vocational_idx" ON "VoterID"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterID_School_Facilities_Improvement_District_idx" ON "VoterID"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterID_School_Subdistrict_idx" ON "VoterID"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterID_Service_Area_District_idx" ON "VoterID"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterID_Superintendent_of_Schools_District_idx" ON "VoterID"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterID_Unified_School_District_idx" ON "VoterID"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterID_Unified_School_SubDistrict_idx" ON "VoterID"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterID_Voters_FirstName_idx" ON "VoterID"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterID_Voters_MiddleName_idx" ON "VoterID"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterID_Voters_LastName_idx" ON "VoterID"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterID_Voters_Active_idx" ON "VoterID"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterID_MilitaryStatus_Description_idx" ON "VoterID"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterID_Voters_Age_idx" ON "VoterID"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterID_Parties_Description_idx" ON "VoterID"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterID_VoterParties_Change_Changed_Party_idx" ON "VoterID"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterID_Voters_CalculatedRegDate_idx" ON "VoterID"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterID_Voters_OfficialRegDate_idx" ON "VoterID"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterID_VoterTelephones_CellConfidenceCode_idx" ON "VoterID"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterID_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterID"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterID_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterID"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterID_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterID"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterID_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterID"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterID_Voters_VotingPerformanceMinorElection_idx" ON "VoterID"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterID_General_2022_idx" ON "VoterID"("General_2022");

-- CreateIndex
CREATE INDEX "VoterID_Primary_2022_idx" ON "VoterID"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterID_OtherElection_2022_idx" ON "VoterID"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterID_AnyElection_2021_idx" ON "VoterID"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterID_General_2020_idx" ON "VoterID"("General_2020");

-- CreateIndex
CREATE INDEX "VoterID_Primary_2020_idx" ON "VoterID"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterID_PresidentialPrimary_2020_idx" ON "VoterID"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterID_OtherElection_2020_idx" ON "VoterID"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterID_AnyElection_2019_idx" ON "VoterID"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterID_General_2018_idx" ON "VoterID"("General_2018");

-- CreateIndex
CREATE INDEX "VoterID_Primary_2018_idx" ON "VoterID"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterID_OtherElection_2018_idx" ON "VoterID"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterID_AnyElection_2017_idx" ON "VoterID"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterID_General_2016_idx" ON "VoterID"("General_2016");

-- CreateIndex
CREATE INDEX "VoterID_Primary_2016_idx" ON "VoterID"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterID_PresidentialPrimary_2016_idx" ON "VoterID"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterID_OtherElection_2016_idx" ON "VoterID"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterIL_LALVOTERID_key" ON "VoterIL"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterIL_US_Congressional_District_idx" ON "VoterIL"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterIL_State_Senate_District_idx" ON "VoterIL"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterIL_State_House_District_idx" ON "VoterIL"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterIL_County_Legislative_District_idx" ON "VoterIL"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterIL_City_idx" ON "VoterIL"("City");

-- CreateIndex
CREATE INDEX "VoterIL_County_idx" ON "VoterIL"("County");

-- CreateIndex
CREATE INDEX "VoterIL_City_Council_Commissioner_District_idx" ON "VoterIL"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterIL_City_Mayoral_District_idx" ON "VoterIL"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterIL_Town_District_idx" ON "VoterIL"("Town_District");

-- CreateIndex
CREATE INDEX "VoterIL_Town_Council_idx" ON "VoterIL"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterIL_Village_idx" ON "VoterIL"("Village");

-- CreateIndex
CREATE INDEX "VoterIL_Township_idx" ON "VoterIL"("Township");

-- CreateIndex
CREATE INDEX "VoterIL_Borough_idx" ON "VoterIL"("Borough");

-- CreateIndex
CREATE INDEX "VoterIL_Hamlet_Community_Area_idx" ON "VoterIL"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterIL_Board_of_Education_District_idx" ON "VoterIL"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterIL_Board_of_Education_SubDistrict_idx" ON "VoterIL"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterIL_City_School_District_idx" ON "VoterIL"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterIL_College_Board_District_idx" ON "VoterIL"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterIL_Community_College_Commissioner_District_idx" ON "VoterIL"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterIL_Community_College_SubDistrict_idx" ON "VoterIL"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterIL_County_Board_of_Education_District_idx" ON "VoterIL"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterIL_County_Board_of_Education_SubDistrict_idx" ON "VoterIL"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterIL_County_Community_College_District_idx" ON "VoterIL"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterIL_County_Superintendent_of_Schools_District_idx" ON "VoterIL"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterIL_County_Unified_School_District_idx" ON "VoterIL"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterIL_District_Attorney_idx" ON "VoterIL"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterIL_Education_Commission_District_idx" ON "VoterIL"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterIL_Educational_Service_District_idx" ON "VoterIL"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterIL_Election_Commissioner_District_idx" ON "VoterIL"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterIL_Elementary_School_District_idx" ON "VoterIL"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterIL_Elementary_School_SubDistrict_idx" ON "VoterIL"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterIL_Exempted_Village_School_District_idx" ON "VoterIL"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterIL_High_School_District_idx" ON "VoterIL"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterIL_High_School_SubDistrict_idx" ON "VoterIL"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterIL_Judicial_Appellate_District_idx" ON "VoterIL"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterIL_Judicial_Circuit_Court_District_idx" ON "VoterIL"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterIL_Judicial_County_Board_of_Review_District_idx" ON "VoterIL"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterIL_Judicial_County_Court_District_idx" ON "VoterIL"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterIL_Judicial_District_idx" ON "VoterIL"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterIL_Judicial_District_Court_District_idx" ON "VoterIL"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterIL_Judicial_Family_Court_District_idx" ON "VoterIL"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterIL_Judicial_Jury_District_idx" ON "VoterIL"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterIL_Judicial_Juvenile_Court_District_idx" ON "VoterIL"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterIL_Judicial_Magistrate_Division_idx" ON "VoterIL"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterIL_Judicial_Sub_Circuit_District_idx" ON "VoterIL"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterIL_Judicial_Superior_Court_District_idx" ON "VoterIL"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterIL_Judicial_Supreme_Court_District_idx" ON "VoterIL"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterIL_Middle_School_District_idx" ON "VoterIL"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterIL_Municipal_Court_District_idx" ON "VoterIL"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterIL_Proposed_City_Commissioner_District_idx" ON "VoterIL"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterIL_Proposed_Elementary_School_District_idx" ON "VoterIL"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterIL_Proposed_Unified_School_District_idx" ON "VoterIL"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterIL_Regional_Office_of_Education_District_idx" ON "VoterIL"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterIL_School_Board_District_idx" ON "VoterIL"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterIL_School_District_idx" ON "VoterIL"("School_District");

-- CreateIndex
CREATE INDEX "VoterIL_School_District_Vocational_idx" ON "VoterIL"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterIL_School_Facilities_Improvement_District_idx" ON "VoterIL"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterIL_School_Subdistrict_idx" ON "VoterIL"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterIL_Service_Area_District_idx" ON "VoterIL"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterIL_Superintendent_of_Schools_District_idx" ON "VoterIL"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterIL_Unified_School_District_idx" ON "VoterIL"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterIL_Unified_School_SubDistrict_idx" ON "VoterIL"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterIL_Voters_FirstName_idx" ON "VoterIL"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterIL_Voters_MiddleName_idx" ON "VoterIL"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterIL_Voters_LastName_idx" ON "VoterIL"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterIL_Voters_Active_idx" ON "VoterIL"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterIL_MilitaryStatus_Description_idx" ON "VoterIL"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterIL_Voters_Age_idx" ON "VoterIL"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterIL_Parties_Description_idx" ON "VoterIL"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterIL_VoterParties_Change_Changed_Party_idx" ON "VoterIL"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterIL_Voters_CalculatedRegDate_idx" ON "VoterIL"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterIL_Voters_OfficialRegDate_idx" ON "VoterIL"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterIL_VoterTelephones_CellConfidenceCode_idx" ON "VoterIL"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterIL_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterIL"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterIL_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterIL"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterIL_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterIL"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterIL_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterIL"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterIL_Voters_VotingPerformanceMinorElection_idx" ON "VoterIL"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterIL_General_2022_idx" ON "VoterIL"("General_2022");

-- CreateIndex
CREATE INDEX "VoterIL_Primary_2022_idx" ON "VoterIL"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterIL_OtherElection_2022_idx" ON "VoterIL"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterIL_AnyElection_2021_idx" ON "VoterIL"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterIL_General_2020_idx" ON "VoterIL"("General_2020");

-- CreateIndex
CREATE INDEX "VoterIL_Primary_2020_idx" ON "VoterIL"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterIL_PresidentialPrimary_2020_idx" ON "VoterIL"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterIL_OtherElection_2020_idx" ON "VoterIL"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterIL_AnyElection_2019_idx" ON "VoterIL"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterIL_General_2018_idx" ON "VoterIL"("General_2018");

-- CreateIndex
CREATE INDEX "VoterIL_Primary_2018_idx" ON "VoterIL"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterIL_OtherElection_2018_idx" ON "VoterIL"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterIL_AnyElection_2017_idx" ON "VoterIL"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterIL_General_2016_idx" ON "VoterIL"("General_2016");

-- CreateIndex
CREATE INDEX "VoterIL_Primary_2016_idx" ON "VoterIL"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterIL_PresidentialPrimary_2016_idx" ON "VoterIL"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterIL_OtherElection_2016_idx" ON "VoterIL"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterIN_LALVOTERID_key" ON "VoterIN"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterIN_US_Congressional_District_idx" ON "VoterIN"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterIN_State_Senate_District_idx" ON "VoterIN"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterIN_State_House_District_idx" ON "VoterIN"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterIN_County_Legislative_District_idx" ON "VoterIN"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterIN_City_idx" ON "VoterIN"("City");

-- CreateIndex
CREATE INDEX "VoterIN_County_idx" ON "VoterIN"("County");

-- CreateIndex
CREATE INDEX "VoterIN_City_Council_Commissioner_District_idx" ON "VoterIN"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterIN_City_Mayoral_District_idx" ON "VoterIN"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterIN_Town_District_idx" ON "VoterIN"("Town_District");

-- CreateIndex
CREATE INDEX "VoterIN_Town_Council_idx" ON "VoterIN"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterIN_Village_idx" ON "VoterIN"("Village");

-- CreateIndex
CREATE INDEX "VoterIN_Township_idx" ON "VoterIN"("Township");

-- CreateIndex
CREATE INDEX "VoterIN_Borough_idx" ON "VoterIN"("Borough");

-- CreateIndex
CREATE INDEX "VoterIN_Hamlet_Community_Area_idx" ON "VoterIN"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterIN_Board_of_Education_District_idx" ON "VoterIN"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterIN_Board_of_Education_SubDistrict_idx" ON "VoterIN"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterIN_City_School_District_idx" ON "VoterIN"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterIN_College_Board_District_idx" ON "VoterIN"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterIN_Community_College_Commissioner_District_idx" ON "VoterIN"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterIN_Community_College_SubDistrict_idx" ON "VoterIN"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterIN_County_Board_of_Education_District_idx" ON "VoterIN"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterIN_County_Board_of_Education_SubDistrict_idx" ON "VoterIN"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterIN_County_Community_College_District_idx" ON "VoterIN"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterIN_County_Superintendent_of_Schools_District_idx" ON "VoterIN"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterIN_County_Unified_School_District_idx" ON "VoterIN"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterIN_District_Attorney_idx" ON "VoterIN"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterIN_Education_Commission_District_idx" ON "VoterIN"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterIN_Educational_Service_District_idx" ON "VoterIN"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterIN_Election_Commissioner_District_idx" ON "VoterIN"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterIN_Elementary_School_District_idx" ON "VoterIN"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterIN_Elementary_School_SubDistrict_idx" ON "VoterIN"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterIN_Exempted_Village_School_District_idx" ON "VoterIN"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterIN_High_School_District_idx" ON "VoterIN"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterIN_High_School_SubDistrict_idx" ON "VoterIN"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterIN_Judicial_Appellate_District_idx" ON "VoterIN"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterIN_Judicial_Circuit_Court_District_idx" ON "VoterIN"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterIN_Judicial_County_Board_of_Review_District_idx" ON "VoterIN"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterIN_Judicial_County_Court_District_idx" ON "VoterIN"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterIN_Judicial_District_idx" ON "VoterIN"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterIN_Judicial_District_Court_District_idx" ON "VoterIN"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterIN_Judicial_Family_Court_District_idx" ON "VoterIN"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterIN_Judicial_Jury_District_idx" ON "VoterIN"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterIN_Judicial_Juvenile_Court_District_idx" ON "VoterIN"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterIN_Judicial_Magistrate_Division_idx" ON "VoterIN"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterIN_Judicial_Sub_Circuit_District_idx" ON "VoterIN"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterIN_Judicial_Superior_Court_District_idx" ON "VoterIN"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterIN_Judicial_Supreme_Court_District_idx" ON "VoterIN"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterIN_Middle_School_District_idx" ON "VoterIN"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterIN_Municipal_Court_District_idx" ON "VoterIN"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterIN_Proposed_City_Commissioner_District_idx" ON "VoterIN"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterIN_Proposed_Elementary_School_District_idx" ON "VoterIN"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterIN_Proposed_Unified_School_District_idx" ON "VoterIN"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterIN_Regional_Office_of_Education_District_idx" ON "VoterIN"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterIN_School_Board_District_idx" ON "VoterIN"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterIN_School_District_idx" ON "VoterIN"("School_District");

-- CreateIndex
CREATE INDEX "VoterIN_School_District_Vocational_idx" ON "VoterIN"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterIN_School_Facilities_Improvement_District_idx" ON "VoterIN"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterIN_School_Subdistrict_idx" ON "VoterIN"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterIN_Service_Area_District_idx" ON "VoterIN"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterIN_Superintendent_of_Schools_District_idx" ON "VoterIN"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterIN_Unified_School_District_idx" ON "VoterIN"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterIN_Unified_School_SubDistrict_idx" ON "VoterIN"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterIN_Voters_FirstName_idx" ON "VoterIN"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterIN_Voters_MiddleName_idx" ON "VoterIN"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterIN_Voters_LastName_idx" ON "VoterIN"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterIN_Voters_Active_idx" ON "VoterIN"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterIN_MilitaryStatus_Description_idx" ON "VoterIN"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterIN_Voters_Age_idx" ON "VoterIN"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterIN_Parties_Description_idx" ON "VoterIN"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterIN_VoterParties_Change_Changed_Party_idx" ON "VoterIN"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterIN_Voters_CalculatedRegDate_idx" ON "VoterIN"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterIN_Voters_OfficialRegDate_idx" ON "VoterIN"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterIN_VoterTelephones_CellConfidenceCode_idx" ON "VoterIN"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterIN_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterIN"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterIN_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterIN"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterIN_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterIN"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterIN_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterIN"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterIN_Voters_VotingPerformanceMinorElection_idx" ON "VoterIN"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterIN_General_2022_idx" ON "VoterIN"("General_2022");

-- CreateIndex
CREATE INDEX "VoterIN_Primary_2022_idx" ON "VoterIN"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterIN_OtherElection_2022_idx" ON "VoterIN"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterIN_AnyElection_2021_idx" ON "VoterIN"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterIN_General_2020_idx" ON "VoterIN"("General_2020");

-- CreateIndex
CREATE INDEX "VoterIN_Primary_2020_idx" ON "VoterIN"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterIN_PresidentialPrimary_2020_idx" ON "VoterIN"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterIN_OtherElection_2020_idx" ON "VoterIN"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterIN_AnyElection_2019_idx" ON "VoterIN"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterIN_General_2018_idx" ON "VoterIN"("General_2018");

-- CreateIndex
CREATE INDEX "VoterIN_Primary_2018_idx" ON "VoterIN"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterIN_OtherElection_2018_idx" ON "VoterIN"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterIN_AnyElection_2017_idx" ON "VoterIN"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterIN_General_2016_idx" ON "VoterIN"("General_2016");

-- CreateIndex
CREATE INDEX "VoterIN_Primary_2016_idx" ON "VoterIN"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterIN_PresidentialPrimary_2016_idx" ON "VoterIN"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterIN_OtherElection_2016_idx" ON "VoterIN"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterIA_LALVOTERID_key" ON "VoterIA"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterIA_US_Congressional_District_idx" ON "VoterIA"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterIA_State_Senate_District_idx" ON "VoterIA"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterIA_State_House_District_idx" ON "VoterIA"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterIA_County_Legislative_District_idx" ON "VoterIA"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterIA_City_idx" ON "VoterIA"("City");

-- CreateIndex
CREATE INDEX "VoterIA_County_idx" ON "VoterIA"("County");

-- CreateIndex
CREATE INDEX "VoterIA_City_Council_Commissioner_District_idx" ON "VoterIA"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterIA_City_Mayoral_District_idx" ON "VoterIA"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterIA_Town_District_idx" ON "VoterIA"("Town_District");

-- CreateIndex
CREATE INDEX "VoterIA_Town_Council_idx" ON "VoterIA"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterIA_Village_idx" ON "VoterIA"("Village");

-- CreateIndex
CREATE INDEX "VoterIA_Township_idx" ON "VoterIA"("Township");

-- CreateIndex
CREATE INDEX "VoterIA_Borough_idx" ON "VoterIA"("Borough");

-- CreateIndex
CREATE INDEX "VoterIA_Hamlet_Community_Area_idx" ON "VoterIA"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterIA_Board_of_Education_District_idx" ON "VoterIA"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterIA_Board_of_Education_SubDistrict_idx" ON "VoterIA"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterIA_City_School_District_idx" ON "VoterIA"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterIA_College_Board_District_idx" ON "VoterIA"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterIA_Community_College_Commissioner_District_idx" ON "VoterIA"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterIA_Community_College_SubDistrict_idx" ON "VoterIA"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterIA_County_Board_of_Education_District_idx" ON "VoterIA"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterIA_County_Board_of_Education_SubDistrict_idx" ON "VoterIA"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterIA_County_Community_College_District_idx" ON "VoterIA"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterIA_County_Superintendent_of_Schools_District_idx" ON "VoterIA"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterIA_County_Unified_School_District_idx" ON "VoterIA"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterIA_District_Attorney_idx" ON "VoterIA"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterIA_Education_Commission_District_idx" ON "VoterIA"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterIA_Educational_Service_District_idx" ON "VoterIA"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterIA_Election_Commissioner_District_idx" ON "VoterIA"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterIA_Elementary_School_District_idx" ON "VoterIA"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterIA_Elementary_School_SubDistrict_idx" ON "VoterIA"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterIA_Exempted_Village_School_District_idx" ON "VoterIA"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterIA_High_School_District_idx" ON "VoterIA"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterIA_High_School_SubDistrict_idx" ON "VoterIA"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterIA_Judicial_Appellate_District_idx" ON "VoterIA"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterIA_Judicial_Circuit_Court_District_idx" ON "VoterIA"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterIA_Judicial_County_Board_of_Review_District_idx" ON "VoterIA"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterIA_Judicial_County_Court_District_idx" ON "VoterIA"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterIA_Judicial_District_idx" ON "VoterIA"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterIA_Judicial_District_Court_District_idx" ON "VoterIA"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterIA_Judicial_Family_Court_District_idx" ON "VoterIA"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterIA_Judicial_Jury_District_idx" ON "VoterIA"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterIA_Judicial_Juvenile_Court_District_idx" ON "VoterIA"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterIA_Judicial_Magistrate_Division_idx" ON "VoterIA"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterIA_Judicial_Sub_Circuit_District_idx" ON "VoterIA"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterIA_Judicial_Superior_Court_District_idx" ON "VoterIA"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterIA_Judicial_Supreme_Court_District_idx" ON "VoterIA"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterIA_Middle_School_District_idx" ON "VoterIA"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterIA_Municipal_Court_District_idx" ON "VoterIA"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterIA_Proposed_City_Commissioner_District_idx" ON "VoterIA"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterIA_Proposed_Elementary_School_District_idx" ON "VoterIA"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterIA_Proposed_Unified_School_District_idx" ON "VoterIA"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterIA_Regional_Office_of_Education_District_idx" ON "VoterIA"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterIA_School_Board_District_idx" ON "VoterIA"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterIA_School_District_idx" ON "VoterIA"("School_District");

-- CreateIndex
CREATE INDEX "VoterIA_School_District_Vocational_idx" ON "VoterIA"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterIA_School_Facilities_Improvement_District_idx" ON "VoterIA"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterIA_School_Subdistrict_idx" ON "VoterIA"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterIA_Service_Area_District_idx" ON "VoterIA"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterIA_Superintendent_of_Schools_District_idx" ON "VoterIA"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterIA_Unified_School_District_idx" ON "VoterIA"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterIA_Unified_School_SubDistrict_idx" ON "VoterIA"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterIA_Voters_FirstName_idx" ON "VoterIA"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterIA_Voters_MiddleName_idx" ON "VoterIA"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterIA_Voters_LastName_idx" ON "VoterIA"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterIA_Voters_Active_idx" ON "VoterIA"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterIA_MilitaryStatus_Description_idx" ON "VoterIA"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterIA_Voters_Age_idx" ON "VoterIA"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterIA_Parties_Description_idx" ON "VoterIA"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterIA_VoterParties_Change_Changed_Party_idx" ON "VoterIA"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterIA_Voters_CalculatedRegDate_idx" ON "VoterIA"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterIA_Voters_OfficialRegDate_idx" ON "VoterIA"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterIA_VoterTelephones_CellConfidenceCode_idx" ON "VoterIA"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterIA_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterIA"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterIA_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterIA"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterIA_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterIA"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterIA_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterIA"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterIA_Voters_VotingPerformanceMinorElection_idx" ON "VoterIA"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterIA_General_2022_idx" ON "VoterIA"("General_2022");

-- CreateIndex
CREATE INDEX "VoterIA_Primary_2022_idx" ON "VoterIA"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterIA_OtherElection_2022_idx" ON "VoterIA"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterIA_AnyElection_2021_idx" ON "VoterIA"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterIA_General_2020_idx" ON "VoterIA"("General_2020");

-- CreateIndex
CREATE INDEX "VoterIA_Primary_2020_idx" ON "VoterIA"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterIA_PresidentialPrimary_2020_idx" ON "VoterIA"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterIA_OtherElection_2020_idx" ON "VoterIA"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterIA_AnyElection_2019_idx" ON "VoterIA"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterIA_General_2018_idx" ON "VoterIA"("General_2018");

-- CreateIndex
CREATE INDEX "VoterIA_Primary_2018_idx" ON "VoterIA"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterIA_OtherElection_2018_idx" ON "VoterIA"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterIA_AnyElection_2017_idx" ON "VoterIA"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterIA_General_2016_idx" ON "VoterIA"("General_2016");

-- CreateIndex
CREATE INDEX "VoterIA_Primary_2016_idx" ON "VoterIA"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterIA_PresidentialPrimary_2016_idx" ON "VoterIA"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterIA_OtherElection_2016_idx" ON "VoterIA"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterKS_LALVOTERID_key" ON "VoterKS"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterKS_US_Congressional_District_idx" ON "VoterKS"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterKS_State_Senate_District_idx" ON "VoterKS"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterKS_State_House_District_idx" ON "VoterKS"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterKS_County_Legislative_District_idx" ON "VoterKS"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterKS_City_idx" ON "VoterKS"("City");

-- CreateIndex
CREATE INDEX "VoterKS_County_idx" ON "VoterKS"("County");

-- CreateIndex
CREATE INDEX "VoterKS_City_Council_Commissioner_District_idx" ON "VoterKS"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterKS_City_Mayoral_District_idx" ON "VoterKS"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterKS_Town_District_idx" ON "VoterKS"("Town_District");

-- CreateIndex
CREATE INDEX "VoterKS_Town_Council_idx" ON "VoterKS"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterKS_Village_idx" ON "VoterKS"("Village");

-- CreateIndex
CREATE INDEX "VoterKS_Township_idx" ON "VoterKS"("Township");

-- CreateIndex
CREATE INDEX "VoterKS_Borough_idx" ON "VoterKS"("Borough");

-- CreateIndex
CREATE INDEX "VoterKS_Hamlet_Community_Area_idx" ON "VoterKS"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterKS_Board_of_Education_District_idx" ON "VoterKS"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterKS_Board_of_Education_SubDistrict_idx" ON "VoterKS"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterKS_City_School_District_idx" ON "VoterKS"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterKS_College_Board_District_idx" ON "VoterKS"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterKS_Community_College_Commissioner_District_idx" ON "VoterKS"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterKS_Community_College_SubDistrict_idx" ON "VoterKS"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterKS_County_Board_of_Education_District_idx" ON "VoterKS"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterKS_County_Board_of_Education_SubDistrict_idx" ON "VoterKS"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterKS_County_Community_College_District_idx" ON "VoterKS"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterKS_County_Superintendent_of_Schools_District_idx" ON "VoterKS"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterKS_County_Unified_School_District_idx" ON "VoterKS"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterKS_District_Attorney_idx" ON "VoterKS"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterKS_Education_Commission_District_idx" ON "VoterKS"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterKS_Educational_Service_District_idx" ON "VoterKS"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterKS_Election_Commissioner_District_idx" ON "VoterKS"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterKS_Elementary_School_District_idx" ON "VoterKS"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterKS_Elementary_School_SubDistrict_idx" ON "VoterKS"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterKS_Exempted_Village_School_District_idx" ON "VoterKS"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterKS_High_School_District_idx" ON "VoterKS"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterKS_High_School_SubDistrict_idx" ON "VoterKS"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterKS_Judicial_Appellate_District_idx" ON "VoterKS"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterKS_Judicial_Circuit_Court_District_idx" ON "VoterKS"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterKS_Judicial_County_Board_of_Review_District_idx" ON "VoterKS"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterKS_Judicial_County_Court_District_idx" ON "VoterKS"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterKS_Judicial_District_idx" ON "VoterKS"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterKS_Judicial_District_Court_District_idx" ON "VoterKS"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterKS_Judicial_Family_Court_District_idx" ON "VoterKS"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterKS_Judicial_Jury_District_idx" ON "VoterKS"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterKS_Judicial_Juvenile_Court_District_idx" ON "VoterKS"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterKS_Judicial_Magistrate_Division_idx" ON "VoterKS"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterKS_Judicial_Sub_Circuit_District_idx" ON "VoterKS"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterKS_Judicial_Superior_Court_District_idx" ON "VoterKS"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterKS_Judicial_Supreme_Court_District_idx" ON "VoterKS"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterKS_Middle_School_District_idx" ON "VoterKS"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterKS_Municipal_Court_District_idx" ON "VoterKS"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterKS_Proposed_City_Commissioner_District_idx" ON "VoterKS"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterKS_Proposed_Elementary_School_District_idx" ON "VoterKS"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterKS_Proposed_Unified_School_District_idx" ON "VoterKS"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterKS_Regional_Office_of_Education_District_idx" ON "VoterKS"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterKS_School_Board_District_idx" ON "VoterKS"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterKS_School_District_idx" ON "VoterKS"("School_District");

-- CreateIndex
CREATE INDEX "VoterKS_School_District_Vocational_idx" ON "VoterKS"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterKS_School_Facilities_Improvement_District_idx" ON "VoterKS"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterKS_School_Subdistrict_idx" ON "VoterKS"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterKS_Service_Area_District_idx" ON "VoterKS"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterKS_Superintendent_of_Schools_District_idx" ON "VoterKS"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterKS_Unified_School_District_idx" ON "VoterKS"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterKS_Unified_School_SubDistrict_idx" ON "VoterKS"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterKS_Voters_FirstName_idx" ON "VoterKS"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterKS_Voters_MiddleName_idx" ON "VoterKS"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterKS_Voters_LastName_idx" ON "VoterKS"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterKS_Voters_Active_idx" ON "VoterKS"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterKS_MilitaryStatus_Description_idx" ON "VoterKS"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterKS_Voters_Age_idx" ON "VoterKS"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterKS_Parties_Description_idx" ON "VoterKS"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterKS_VoterParties_Change_Changed_Party_idx" ON "VoterKS"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterKS_Voters_CalculatedRegDate_idx" ON "VoterKS"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterKS_Voters_OfficialRegDate_idx" ON "VoterKS"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterKS_VoterTelephones_CellConfidenceCode_idx" ON "VoterKS"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterKS_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterKS"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterKS_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterKS"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterKS_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterKS"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterKS_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterKS"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterKS_Voters_VotingPerformanceMinorElection_idx" ON "VoterKS"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterKS_General_2022_idx" ON "VoterKS"("General_2022");

-- CreateIndex
CREATE INDEX "VoterKS_Primary_2022_idx" ON "VoterKS"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterKS_OtherElection_2022_idx" ON "VoterKS"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterKS_AnyElection_2021_idx" ON "VoterKS"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterKS_General_2020_idx" ON "VoterKS"("General_2020");

-- CreateIndex
CREATE INDEX "VoterKS_Primary_2020_idx" ON "VoterKS"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterKS_PresidentialPrimary_2020_idx" ON "VoterKS"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterKS_OtherElection_2020_idx" ON "VoterKS"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterKS_AnyElection_2019_idx" ON "VoterKS"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterKS_General_2018_idx" ON "VoterKS"("General_2018");

-- CreateIndex
CREATE INDEX "VoterKS_Primary_2018_idx" ON "VoterKS"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterKS_OtherElection_2018_idx" ON "VoterKS"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterKS_AnyElection_2017_idx" ON "VoterKS"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterKS_General_2016_idx" ON "VoterKS"("General_2016");

-- CreateIndex
CREATE INDEX "VoterKS_Primary_2016_idx" ON "VoterKS"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterKS_PresidentialPrimary_2016_idx" ON "VoterKS"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterKS_OtherElection_2016_idx" ON "VoterKS"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterKY_LALVOTERID_key" ON "VoterKY"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterKY_US_Congressional_District_idx" ON "VoterKY"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterKY_State_Senate_District_idx" ON "VoterKY"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterKY_State_House_District_idx" ON "VoterKY"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterKY_County_Legislative_District_idx" ON "VoterKY"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterKY_City_idx" ON "VoterKY"("City");

-- CreateIndex
CREATE INDEX "VoterKY_County_idx" ON "VoterKY"("County");

-- CreateIndex
CREATE INDEX "VoterKY_City_Council_Commissioner_District_idx" ON "VoterKY"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterKY_City_Mayoral_District_idx" ON "VoterKY"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterKY_Town_District_idx" ON "VoterKY"("Town_District");

-- CreateIndex
CREATE INDEX "VoterKY_Town_Council_idx" ON "VoterKY"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterKY_Village_idx" ON "VoterKY"("Village");

-- CreateIndex
CREATE INDEX "VoterKY_Township_idx" ON "VoterKY"("Township");

-- CreateIndex
CREATE INDEX "VoterKY_Borough_idx" ON "VoterKY"("Borough");

-- CreateIndex
CREATE INDEX "VoterKY_Hamlet_Community_Area_idx" ON "VoterKY"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterKY_Board_of_Education_District_idx" ON "VoterKY"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterKY_Board_of_Education_SubDistrict_idx" ON "VoterKY"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterKY_City_School_District_idx" ON "VoterKY"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterKY_College_Board_District_idx" ON "VoterKY"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterKY_Community_College_Commissioner_District_idx" ON "VoterKY"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterKY_Community_College_SubDistrict_idx" ON "VoterKY"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterKY_County_Board_of_Education_District_idx" ON "VoterKY"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterKY_County_Board_of_Education_SubDistrict_idx" ON "VoterKY"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterKY_County_Community_College_District_idx" ON "VoterKY"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterKY_County_Superintendent_of_Schools_District_idx" ON "VoterKY"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterKY_County_Unified_School_District_idx" ON "VoterKY"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterKY_District_Attorney_idx" ON "VoterKY"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterKY_Education_Commission_District_idx" ON "VoterKY"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterKY_Educational_Service_District_idx" ON "VoterKY"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterKY_Election_Commissioner_District_idx" ON "VoterKY"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterKY_Elementary_School_District_idx" ON "VoterKY"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterKY_Elementary_School_SubDistrict_idx" ON "VoterKY"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterKY_Exempted_Village_School_District_idx" ON "VoterKY"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterKY_High_School_District_idx" ON "VoterKY"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterKY_High_School_SubDistrict_idx" ON "VoterKY"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterKY_Judicial_Appellate_District_idx" ON "VoterKY"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterKY_Judicial_Circuit_Court_District_idx" ON "VoterKY"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterKY_Judicial_County_Board_of_Review_District_idx" ON "VoterKY"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterKY_Judicial_County_Court_District_idx" ON "VoterKY"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterKY_Judicial_District_idx" ON "VoterKY"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterKY_Judicial_District_Court_District_idx" ON "VoterKY"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterKY_Judicial_Family_Court_District_idx" ON "VoterKY"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterKY_Judicial_Jury_District_idx" ON "VoterKY"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterKY_Judicial_Juvenile_Court_District_idx" ON "VoterKY"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterKY_Judicial_Magistrate_Division_idx" ON "VoterKY"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterKY_Judicial_Sub_Circuit_District_idx" ON "VoterKY"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterKY_Judicial_Superior_Court_District_idx" ON "VoterKY"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterKY_Judicial_Supreme_Court_District_idx" ON "VoterKY"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterKY_Middle_School_District_idx" ON "VoterKY"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterKY_Municipal_Court_District_idx" ON "VoterKY"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterKY_Proposed_City_Commissioner_District_idx" ON "VoterKY"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterKY_Proposed_Elementary_School_District_idx" ON "VoterKY"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterKY_Proposed_Unified_School_District_idx" ON "VoterKY"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterKY_Regional_Office_of_Education_District_idx" ON "VoterKY"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterKY_School_Board_District_idx" ON "VoterKY"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterKY_School_District_idx" ON "VoterKY"("School_District");

-- CreateIndex
CREATE INDEX "VoterKY_School_District_Vocational_idx" ON "VoterKY"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterKY_School_Facilities_Improvement_District_idx" ON "VoterKY"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterKY_School_Subdistrict_idx" ON "VoterKY"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterKY_Service_Area_District_idx" ON "VoterKY"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterKY_Superintendent_of_Schools_District_idx" ON "VoterKY"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterKY_Unified_School_District_idx" ON "VoterKY"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterKY_Unified_School_SubDistrict_idx" ON "VoterKY"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterKY_Voters_FirstName_idx" ON "VoterKY"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterKY_Voters_MiddleName_idx" ON "VoterKY"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterKY_Voters_LastName_idx" ON "VoterKY"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterKY_Voters_Active_idx" ON "VoterKY"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterKY_MilitaryStatus_Description_idx" ON "VoterKY"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterKY_Voters_Age_idx" ON "VoterKY"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterKY_Parties_Description_idx" ON "VoterKY"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterKY_VoterParties_Change_Changed_Party_idx" ON "VoterKY"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterKY_Voters_CalculatedRegDate_idx" ON "VoterKY"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterKY_Voters_OfficialRegDate_idx" ON "VoterKY"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterKY_VoterTelephones_CellConfidenceCode_idx" ON "VoterKY"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterKY_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterKY"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterKY_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterKY"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterKY_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterKY"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterKY_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterKY"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterKY_Voters_VotingPerformanceMinorElection_idx" ON "VoterKY"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterKY_General_2022_idx" ON "VoterKY"("General_2022");

-- CreateIndex
CREATE INDEX "VoterKY_Primary_2022_idx" ON "VoterKY"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterKY_OtherElection_2022_idx" ON "VoterKY"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterKY_AnyElection_2021_idx" ON "VoterKY"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterKY_General_2020_idx" ON "VoterKY"("General_2020");

-- CreateIndex
CREATE INDEX "VoterKY_Primary_2020_idx" ON "VoterKY"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterKY_PresidentialPrimary_2020_idx" ON "VoterKY"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterKY_OtherElection_2020_idx" ON "VoterKY"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterKY_AnyElection_2019_idx" ON "VoterKY"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterKY_General_2018_idx" ON "VoterKY"("General_2018");

-- CreateIndex
CREATE INDEX "VoterKY_Primary_2018_idx" ON "VoterKY"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterKY_OtherElection_2018_idx" ON "VoterKY"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterKY_AnyElection_2017_idx" ON "VoterKY"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterKY_General_2016_idx" ON "VoterKY"("General_2016");

-- CreateIndex
CREATE INDEX "VoterKY_Primary_2016_idx" ON "VoterKY"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterKY_PresidentialPrimary_2016_idx" ON "VoterKY"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterKY_OtherElection_2016_idx" ON "VoterKY"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterLA_LALVOTERID_key" ON "VoterLA"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterLA_US_Congressional_District_idx" ON "VoterLA"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterLA_State_Senate_District_idx" ON "VoterLA"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterLA_State_House_District_idx" ON "VoterLA"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterLA_County_Legislative_District_idx" ON "VoterLA"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterLA_City_idx" ON "VoterLA"("City");

-- CreateIndex
CREATE INDEX "VoterLA_County_idx" ON "VoterLA"("County");

-- CreateIndex
CREATE INDEX "VoterLA_City_Council_Commissioner_District_idx" ON "VoterLA"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterLA_City_Mayoral_District_idx" ON "VoterLA"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterLA_Town_District_idx" ON "VoterLA"("Town_District");

-- CreateIndex
CREATE INDEX "VoterLA_Town_Council_idx" ON "VoterLA"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterLA_Village_idx" ON "VoterLA"("Village");

-- CreateIndex
CREATE INDEX "VoterLA_Township_idx" ON "VoterLA"("Township");

-- CreateIndex
CREATE INDEX "VoterLA_Borough_idx" ON "VoterLA"("Borough");

-- CreateIndex
CREATE INDEX "VoterLA_Hamlet_Community_Area_idx" ON "VoterLA"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterLA_Board_of_Education_District_idx" ON "VoterLA"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterLA_Board_of_Education_SubDistrict_idx" ON "VoterLA"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterLA_City_School_District_idx" ON "VoterLA"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterLA_College_Board_District_idx" ON "VoterLA"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterLA_Community_College_Commissioner_District_idx" ON "VoterLA"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterLA_Community_College_SubDistrict_idx" ON "VoterLA"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterLA_County_Board_of_Education_District_idx" ON "VoterLA"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterLA_County_Board_of_Education_SubDistrict_idx" ON "VoterLA"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterLA_County_Community_College_District_idx" ON "VoterLA"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterLA_County_Superintendent_of_Schools_District_idx" ON "VoterLA"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterLA_County_Unified_School_District_idx" ON "VoterLA"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterLA_District_Attorney_idx" ON "VoterLA"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterLA_Education_Commission_District_idx" ON "VoterLA"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterLA_Educational_Service_District_idx" ON "VoterLA"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterLA_Election_Commissioner_District_idx" ON "VoterLA"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterLA_Elementary_School_District_idx" ON "VoterLA"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterLA_Elementary_School_SubDistrict_idx" ON "VoterLA"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterLA_Exempted_Village_School_District_idx" ON "VoterLA"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterLA_High_School_District_idx" ON "VoterLA"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterLA_High_School_SubDistrict_idx" ON "VoterLA"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterLA_Judicial_Appellate_District_idx" ON "VoterLA"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterLA_Judicial_Circuit_Court_District_idx" ON "VoterLA"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterLA_Judicial_County_Board_of_Review_District_idx" ON "VoterLA"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterLA_Judicial_County_Court_District_idx" ON "VoterLA"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterLA_Judicial_District_idx" ON "VoterLA"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterLA_Judicial_District_Court_District_idx" ON "VoterLA"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterLA_Judicial_Family_Court_District_idx" ON "VoterLA"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterLA_Judicial_Jury_District_idx" ON "VoterLA"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterLA_Judicial_Juvenile_Court_District_idx" ON "VoterLA"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterLA_Judicial_Magistrate_Division_idx" ON "VoterLA"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterLA_Judicial_Sub_Circuit_District_idx" ON "VoterLA"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterLA_Judicial_Superior_Court_District_idx" ON "VoterLA"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterLA_Judicial_Supreme_Court_District_idx" ON "VoterLA"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterLA_Middle_School_District_idx" ON "VoterLA"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterLA_Municipal_Court_District_idx" ON "VoterLA"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterLA_Proposed_City_Commissioner_District_idx" ON "VoterLA"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterLA_Proposed_Elementary_School_District_idx" ON "VoterLA"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterLA_Proposed_Unified_School_District_idx" ON "VoterLA"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterLA_Regional_Office_of_Education_District_idx" ON "VoterLA"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterLA_School_Board_District_idx" ON "VoterLA"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterLA_School_District_idx" ON "VoterLA"("School_District");

-- CreateIndex
CREATE INDEX "VoterLA_School_District_Vocational_idx" ON "VoterLA"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterLA_School_Facilities_Improvement_District_idx" ON "VoterLA"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterLA_School_Subdistrict_idx" ON "VoterLA"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterLA_Service_Area_District_idx" ON "VoterLA"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterLA_Superintendent_of_Schools_District_idx" ON "VoterLA"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterLA_Unified_School_District_idx" ON "VoterLA"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterLA_Unified_School_SubDistrict_idx" ON "VoterLA"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterLA_Voters_FirstName_idx" ON "VoterLA"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterLA_Voters_MiddleName_idx" ON "VoterLA"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterLA_Voters_LastName_idx" ON "VoterLA"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterLA_Voters_Active_idx" ON "VoterLA"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterLA_MilitaryStatus_Description_idx" ON "VoterLA"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterLA_Voters_Age_idx" ON "VoterLA"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterLA_Parties_Description_idx" ON "VoterLA"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterLA_VoterParties_Change_Changed_Party_idx" ON "VoterLA"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterLA_Voters_CalculatedRegDate_idx" ON "VoterLA"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterLA_Voters_OfficialRegDate_idx" ON "VoterLA"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterLA_VoterTelephones_CellConfidenceCode_idx" ON "VoterLA"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterLA_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterLA"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterLA_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterLA"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterLA_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterLA"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterLA_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterLA"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterLA_Voters_VotingPerformanceMinorElection_idx" ON "VoterLA"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterLA_General_2022_idx" ON "VoterLA"("General_2022");

-- CreateIndex
CREATE INDEX "VoterLA_Primary_2022_idx" ON "VoterLA"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterLA_OtherElection_2022_idx" ON "VoterLA"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterLA_AnyElection_2021_idx" ON "VoterLA"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterLA_General_2020_idx" ON "VoterLA"("General_2020");

-- CreateIndex
CREATE INDEX "VoterLA_Primary_2020_idx" ON "VoterLA"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterLA_PresidentialPrimary_2020_idx" ON "VoterLA"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterLA_OtherElection_2020_idx" ON "VoterLA"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterLA_AnyElection_2019_idx" ON "VoterLA"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterLA_General_2018_idx" ON "VoterLA"("General_2018");

-- CreateIndex
CREATE INDEX "VoterLA_Primary_2018_idx" ON "VoterLA"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterLA_OtherElection_2018_idx" ON "VoterLA"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterLA_AnyElection_2017_idx" ON "VoterLA"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterLA_General_2016_idx" ON "VoterLA"("General_2016");

-- CreateIndex
CREATE INDEX "VoterLA_Primary_2016_idx" ON "VoterLA"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterLA_PresidentialPrimary_2016_idx" ON "VoterLA"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterLA_OtherElection_2016_idx" ON "VoterLA"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterME_LALVOTERID_key" ON "VoterME"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterME_US_Congressional_District_idx" ON "VoterME"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterME_State_Senate_District_idx" ON "VoterME"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterME_State_House_District_idx" ON "VoterME"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterME_County_Legislative_District_idx" ON "VoterME"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterME_City_idx" ON "VoterME"("City");

-- CreateIndex
CREATE INDEX "VoterME_County_idx" ON "VoterME"("County");

-- CreateIndex
CREATE INDEX "VoterME_City_Council_Commissioner_District_idx" ON "VoterME"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterME_City_Mayoral_District_idx" ON "VoterME"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterME_Town_District_idx" ON "VoterME"("Town_District");

-- CreateIndex
CREATE INDEX "VoterME_Town_Council_idx" ON "VoterME"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterME_Village_idx" ON "VoterME"("Village");

-- CreateIndex
CREATE INDEX "VoterME_Township_idx" ON "VoterME"("Township");

-- CreateIndex
CREATE INDEX "VoterME_Borough_idx" ON "VoterME"("Borough");

-- CreateIndex
CREATE INDEX "VoterME_Hamlet_Community_Area_idx" ON "VoterME"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterME_Board_of_Education_District_idx" ON "VoterME"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterME_Board_of_Education_SubDistrict_idx" ON "VoterME"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterME_City_School_District_idx" ON "VoterME"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterME_College_Board_District_idx" ON "VoterME"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterME_Community_College_Commissioner_District_idx" ON "VoterME"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterME_Community_College_SubDistrict_idx" ON "VoterME"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterME_County_Board_of_Education_District_idx" ON "VoterME"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterME_County_Board_of_Education_SubDistrict_idx" ON "VoterME"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterME_County_Community_College_District_idx" ON "VoterME"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterME_County_Superintendent_of_Schools_District_idx" ON "VoterME"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterME_County_Unified_School_District_idx" ON "VoterME"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterME_District_Attorney_idx" ON "VoterME"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterME_Education_Commission_District_idx" ON "VoterME"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterME_Educational_Service_District_idx" ON "VoterME"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterME_Election_Commissioner_District_idx" ON "VoterME"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterME_Elementary_School_District_idx" ON "VoterME"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterME_Elementary_School_SubDistrict_idx" ON "VoterME"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterME_Exempted_Village_School_District_idx" ON "VoterME"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterME_High_School_District_idx" ON "VoterME"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterME_High_School_SubDistrict_idx" ON "VoterME"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterME_Judicial_Appellate_District_idx" ON "VoterME"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterME_Judicial_Circuit_Court_District_idx" ON "VoterME"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterME_Judicial_County_Board_of_Review_District_idx" ON "VoterME"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterME_Judicial_County_Court_District_idx" ON "VoterME"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterME_Judicial_District_idx" ON "VoterME"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterME_Judicial_District_Court_District_idx" ON "VoterME"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterME_Judicial_Family_Court_District_idx" ON "VoterME"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterME_Judicial_Jury_District_idx" ON "VoterME"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterME_Judicial_Juvenile_Court_District_idx" ON "VoterME"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterME_Judicial_Magistrate_Division_idx" ON "VoterME"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterME_Judicial_Sub_Circuit_District_idx" ON "VoterME"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterME_Judicial_Superior_Court_District_idx" ON "VoterME"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterME_Judicial_Supreme_Court_District_idx" ON "VoterME"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterME_Middle_School_District_idx" ON "VoterME"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterME_Municipal_Court_District_idx" ON "VoterME"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterME_Proposed_City_Commissioner_District_idx" ON "VoterME"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterME_Proposed_Elementary_School_District_idx" ON "VoterME"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterME_Proposed_Unified_School_District_idx" ON "VoterME"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterME_Regional_Office_of_Education_District_idx" ON "VoterME"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterME_School_Board_District_idx" ON "VoterME"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterME_School_District_idx" ON "VoterME"("School_District");

-- CreateIndex
CREATE INDEX "VoterME_School_District_Vocational_idx" ON "VoterME"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterME_School_Facilities_Improvement_District_idx" ON "VoterME"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterME_School_Subdistrict_idx" ON "VoterME"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterME_Service_Area_District_idx" ON "VoterME"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterME_Superintendent_of_Schools_District_idx" ON "VoterME"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterME_Unified_School_District_idx" ON "VoterME"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterME_Unified_School_SubDistrict_idx" ON "VoterME"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterME_Voters_FirstName_idx" ON "VoterME"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterME_Voters_MiddleName_idx" ON "VoterME"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterME_Voters_LastName_idx" ON "VoterME"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterME_Voters_Active_idx" ON "VoterME"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterME_MilitaryStatus_Description_idx" ON "VoterME"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterME_Voters_Age_idx" ON "VoterME"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterME_Parties_Description_idx" ON "VoterME"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterME_VoterParties_Change_Changed_Party_idx" ON "VoterME"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterME_Voters_CalculatedRegDate_idx" ON "VoterME"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterME_Voters_OfficialRegDate_idx" ON "VoterME"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterME_VoterTelephones_CellConfidenceCode_idx" ON "VoterME"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterME_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterME"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterME_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterME"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterME_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterME"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterME_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterME"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterME_Voters_VotingPerformanceMinorElection_idx" ON "VoterME"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterME_General_2022_idx" ON "VoterME"("General_2022");

-- CreateIndex
CREATE INDEX "VoterME_Primary_2022_idx" ON "VoterME"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterME_OtherElection_2022_idx" ON "VoterME"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterME_AnyElection_2021_idx" ON "VoterME"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterME_General_2020_idx" ON "VoterME"("General_2020");

-- CreateIndex
CREATE INDEX "VoterME_Primary_2020_idx" ON "VoterME"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterME_PresidentialPrimary_2020_idx" ON "VoterME"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterME_OtherElection_2020_idx" ON "VoterME"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterME_AnyElection_2019_idx" ON "VoterME"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterME_General_2018_idx" ON "VoterME"("General_2018");

-- CreateIndex
CREATE INDEX "VoterME_Primary_2018_idx" ON "VoterME"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterME_OtherElection_2018_idx" ON "VoterME"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterME_AnyElection_2017_idx" ON "VoterME"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterME_General_2016_idx" ON "VoterME"("General_2016");

-- CreateIndex
CREATE INDEX "VoterME_Primary_2016_idx" ON "VoterME"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterME_PresidentialPrimary_2016_idx" ON "VoterME"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterME_OtherElection_2016_idx" ON "VoterME"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterMD_LALVOTERID_key" ON "VoterMD"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterMD_US_Congressional_District_idx" ON "VoterMD"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterMD_State_Senate_District_idx" ON "VoterMD"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterMD_State_House_District_idx" ON "VoterMD"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterMD_County_Legislative_District_idx" ON "VoterMD"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterMD_City_idx" ON "VoterMD"("City");

-- CreateIndex
CREATE INDEX "VoterMD_County_idx" ON "VoterMD"("County");

-- CreateIndex
CREATE INDEX "VoterMD_City_Council_Commissioner_District_idx" ON "VoterMD"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterMD_City_Mayoral_District_idx" ON "VoterMD"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterMD_Town_District_idx" ON "VoterMD"("Town_District");

-- CreateIndex
CREATE INDEX "VoterMD_Town_Council_idx" ON "VoterMD"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterMD_Village_idx" ON "VoterMD"("Village");

-- CreateIndex
CREATE INDEX "VoterMD_Township_idx" ON "VoterMD"("Township");

-- CreateIndex
CREATE INDEX "VoterMD_Borough_idx" ON "VoterMD"("Borough");

-- CreateIndex
CREATE INDEX "VoterMD_Hamlet_Community_Area_idx" ON "VoterMD"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterMD_Board_of_Education_District_idx" ON "VoterMD"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterMD_Board_of_Education_SubDistrict_idx" ON "VoterMD"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMD_City_School_District_idx" ON "VoterMD"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterMD_College_Board_District_idx" ON "VoterMD"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterMD_Community_College_Commissioner_District_idx" ON "VoterMD"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterMD_Community_College_SubDistrict_idx" ON "VoterMD"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMD_County_Board_of_Education_District_idx" ON "VoterMD"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterMD_County_Board_of_Education_SubDistrict_idx" ON "VoterMD"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMD_County_Community_College_District_idx" ON "VoterMD"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterMD_County_Superintendent_of_Schools_District_idx" ON "VoterMD"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterMD_County_Unified_School_District_idx" ON "VoterMD"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterMD_District_Attorney_idx" ON "VoterMD"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterMD_Education_Commission_District_idx" ON "VoterMD"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterMD_Educational_Service_District_idx" ON "VoterMD"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterMD_Election_Commissioner_District_idx" ON "VoterMD"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterMD_Elementary_School_District_idx" ON "VoterMD"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterMD_Elementary_School_SubDistrict_idx" ON "VoterMD"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMD_Exempted_Village_School_District_idx" ON "VoterMD"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterMD_High_School_District_idx" ON "VoterMD"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterMD_High_School_SubDistrict_idx" ON "VoterMD"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMD_Judicial_Appellate_District_idx" ON "VoterMD"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterMD_Judicial_Circuit_Court_District_idx" ON "VoterMD"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterMD_Judicial_County_Board_of_Review_District_idx" ON "VoterMD"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterMD_Judicial_County_Court_District_idx" ON "VoterMD"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterMD_Judicial_District_idx" ON "VoterMD"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterMD_Judicial_District_Court_District_idx" ON "VoterMD"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterMD_Judicial_Family_Court_District_idx" ON "VoterMD"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterMD_Judicial_Jury_District_idx" ON "VoterMD"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterMD_Judicial_Juvenile_Court_District_idx" ON "VoterMD"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterMD_Judicial_Magistrate_Division_idx" ON "VoterMD"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterMD_Judicial_Sub_Circuit_District_idx" ON "VoterMD"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterMD_Judicial_Superior_Court_District_idx" ON "VoterMD"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterMD_Judicial_Supreme_Court_District_idx" ON "VoterMD"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterMD_Middle_School_District_idx" ON "VoterMD"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterMD_Municipal_Court_District_idx" ON "VoterMD"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterMD_Proposed_City_Commissioner_District_idx" ON "VoterMD"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterMD_Proposed_Elementary_School_District_idx" ON "VoterMD"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterMD_Proposed_Unified_School_District_idx" ON "VoterMD"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterMD_Regional_Office_of_Education_District_idx" ON "VoterMD"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterMD_School_Board_District_idx" ON "VoterMD"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterMD_School_District_idx" ON "VoterMD"("School_District");

-- CreateIndex
CREATE INDEX "VoterMD_School_District_Vocational_idx" ON "VoterMD"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterMD_School_Facilities_Improvement_District_idx" ON "VoterMD"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterMD_School_Subdistrict_idx" ON "VoterMD"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterMD_Service_Area_District_idx" ON "VoterMD"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterMD_Superintendent_of_Schools_District_idx" ON "VoterMD"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterMD_Unified_School_District_idx" ON "VoterMD"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterMD_Unified_School_SubDistrict_idx" ON "VoterMD"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMD_Voters_FirstName_idx" ON "VoterMD"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterMD_Voters_MiddleName_idx" ON "VoterMD"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterMD_Voters_LastName_idx" ON "VoterMD"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterMD_Voters_Active_idx" ON "VoterMD"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterMD_MilitaryStatus_Description_idx" ON "VoterMD"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterMD_Voters_Age_idx" ON "VoterMD"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterMD_Parties_Description_idx" ON "VoterMD"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterMD_VoterParties_Change_Changed_Party_idx" ON "VoterMD"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterMD_Voters_CalculatedRegDate_idx" ON "VoterMD"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterMD_Voters_OfficialRegDate_idx" ON "VoterMD"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterMD_VoterTelephones_CellConfidenceCode_idx" ON "VoterMD"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterMD_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterMD"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterMD_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterMD"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterMD_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterMD"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterMD_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterMD"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterMD_Voters_VotingPerformanceMinorElection_idx" ON "VoterMD"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterMD_General_2022_idx" ON "VoterMD"("General_2022");

-- CreateIndex
CREATE INDEX "VoterMD_Primary_2022_idx" ON "VoterMD"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterMD_OtherElection_2022_idx" ON "VoterMD"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterMD_AnyElection_2021_idx" ON "VoterMD"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterMD_General_2020_idx" ON "VoterMD"("General_2020");

-- CreateIndex
CREATE INDEX "VoterMD_Primary_2020_idx" ON "VoterMD"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterMD_PresidentialPrimary_2020_idx" ON "VoterMD"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterMD_OtherElection_2020_idx" ON "VoterMD"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterMD_AnyElection_2019_idx" ON "VoterMD"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterMD_General_2018_idx" ON "VoterMD"("General_2018");

-- CreateIndex
CREATE INDEX "VoterMD_Primary_2018_idx" ON "VoterMD"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterMD_OtherElection_2018_idx" ON "VoterMD"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterMD_AnyElection_2017_idx" ON "VoterMD"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterMD_General_2016_idx" ON "VoterMD"("General_2016");

-- CreateIndex
CREATE INDEX "VoterMD_Primary_2016_idx" ON "VoterMD"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterMD_PresidentialPrimary_2016_idx" ON "VoterMD"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterMD_OtherElection_2016_idx" ON "VoterMD"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterMA_LALVOTERID_key" ON "VoterMA"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterMA_US_Congressional_District_idx" ON "VoterMA"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterMA_State_Senate_District_idx" ON "VoterMA"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterMA_State_House_District_idx" ON "VoterMA"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterMA_County_Legislative_District_idx" ON "VoterMA"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterMA_City_idx" ON "VoterMA"("City");

-- CreateIndex
CREATE INDEX "VoterMA_County_idx" ON "VoterMA"("County");

-- CreateIndex
CREATE INDEX "VoterMA_City_Council_Commissioner_District_idx" ON "VoterMA"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterMA_City_Mayoral_District_idx" ON "VoterMA"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterMA_Town_District_idx" ON "VoterMA"("Town_District");

-- CreateIndex
CREATE INDEX "VoterMA_Town_Council_idx" ON "VoterMA"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterMA_Village_idx" ON "VoterMA"("Village");

-- CreateIndex
CREATE INDEX "VoterMA_Township_idx" ON "VoterMA"("Township");

-- CreateIndex
CREATE INDEX "VoterMA_Borough_idx" ON "VoterMA"("Borough");

-- CreateIndex
CREATE INDEX "VoterMA_Hamlet_Community_Area_idx" ON "VoterMA"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterMA_Board_of_Education_District_idx" ON "VoterMA"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterMA_Board_of_Education_SubDistrict_idx" ON "VoterMA"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMA_City_School_District_idx" ON "VoterMA"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterMA_College_Board_District_idx" ON "VoterMA"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterMA_Community_College_Commissioner_District_idx" ON "VoterMA"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterMA_Community_College_SubDistrict_idx" ON "VoterMA"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMA_County_Board_of_Education_District_idx" ON "VoterMA"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterMA_County_Board_of_Education_SubDistrict_idx" ON "VoterMA"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMA_County_Community_College_District_idx" ON "VoterMA"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterMA_County_Superintendent_of_Schools_District_idx" ON "VoterMA"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterMA_County_Unified_School_District_idx" ON "VoterMA"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterMA_District_Attorney_idx" ON "VoterMA"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterMA_Education_Commission_District_idx" ON "VoterMA"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterMA_Educational_Service_District_idx" ON "VoterMA"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterMA_Election_Commissioner_District_idx" ON "VoterMA"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterMA_Elementary_School_District_idx" ON "VoterMA"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterMA_Elementary_School_SubDistrict_idx" ON "VoterMA"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMA_Exempted_Village_School_District_idx" ON "VoterMA"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterMA_High_School_District_idx" ON "VoterMA"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterMA_High_School_SubDistrict_idx" ON "VoterMA"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMA_Judicial_Appellate_District_idx" ON "VoterMA"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterMA_Judicial_Circuit_Court_District_idx" ON "VoterMA"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterMA_Judicial_County_Board_of_Review_District_idx" ON "VoterMA"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterMA_Judicial_County_Court_District_idx" ON "VoterMA"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterMA_Judicial_District_idx" ON "VoterMA"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterMA_Judicial_District_Court_District_idx" ON "VoterMA"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterMA_Judicial_Family_Court_District_idx" ON "VoterMA"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterMA_Judicial_Jury_District_idx" ON "VoterMA"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterMA_Judicial_Juvenile_Court_District_idx" ON "VoterMA"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterMA_Judicial_Magistrate_Division_idx" ON "VoterMA"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterMA_Judicial_Sub_Circuit_District_idx" ON "VoterMA"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterMA_Judicial_Superior_Court_District_idx" ON "VoterMA"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterMA_Judicial_Supreme_Court_District_idx" ON "VoterMA"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterMA_Middle_School_District_idx" ON "VoterMA"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterMA_Municipal_Court_District_idx" ON "VoterMA"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterMA_Proposed_City_Commissioner_District_idx" ON "VoterMA"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterMA_Proposed_Elementary_School_District_idx" ON "VoterMA"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterMA_Proposed_Unified_School_District_idx" ON "VoterMA"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterMA_Regional_Office_of_Education_District_idx" ON "VoterMA"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterMA_School_Board_District_idx" ON "VoterMA"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterMA_School_District_idx" ON "VoterMA"("School_District");

-- CreateIndex
CREATE INDEX "VoterMA_School_District_Vocational_idx" ON "VoterMA"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterMA_School_Facilities_Improvement_District_idx" ON "VoterMA"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterMA_School_Subdistrict_idx" ON "VoterMA"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterMA_Service_Area_District_idx" ON "VoterMA"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterMA_Superintendent_of_Schools_District_idx" ON "VoterMA"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterMA_Unified_School_District_idx" ON "VoterMA"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterMA_Unified_School_SubDistrict_idx" ON "VoterMA"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMA_Voters_FirstName_idx" ON "VoterMA"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterMA_Voters_MiddleName_idx" ON "VoterMA"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterMA_Voters_LastName_idx" ON "VoterMA"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterMA_Voters_Active_idx" ON "VoterMA"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterMA_MilitaryStatus_Description_idx" ON "VoterMA"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterMA_Voters_Age_idx" ON "VoterMA"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterMA_Parties_Description_idx" ON "VoterMA"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterMA_VoterParties_Change_Changed_Party_idx" ON "VoterMA"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterMA_Voters_CalculatedRegDate_idx" ON "VoterMA"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterMA_Voters_OfficialRegDate_idx" ON "VoterMA"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterMA_VoterTelephones_CellConfidenceCode_idx" ON "VoterMA"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterMA_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterMA"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterMA_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterMA"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterMA_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterMA"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterMA_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterMA"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterMA_Voters_VotingPerformanceMinorElection_idx" ON "VoterMA"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterMA_General_2022_idx" ON "VoterMA"("General_2022");

-- CreateIndex
CREATE INDEX "VoterMA_Primary_2022_idx" ON "VoterMA"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterMA_OtherElection_2022_idx" ON "VoterMA"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterMA_AnyElection_2021_idx" ON "VoterMA"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterMA_General_2020_idx" ON "VoterMA"("General_2020");

-- CreateIndex
CREATE INDEX "VoterMA_Primary_2020_idx" ON "VoterMA"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterMA_PresidentialPrimary_2020_idx" ON "VoterMA"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterMA_OtherElection_2020_idx" ON "VoterMA"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterMA_AnyElection_2019_idx" ON "VoterMA"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterMA_General_2018_idx" ON "VoterMA"("General_2018");

-- CreateIndex
CREATE INDEX "VoterMA_Primary_2018_idx" ON "VoterMA"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterMA_OtherElection_2018_idx" ON "VoterMA"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterMA_AnyElection_2017_idx" ON "VoterMA"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterMA_General_2016_idx" ON "VoterMA"("General_2016");

-- CreateIndex
CREATE INDEX "VoterMA_Primary_2016_idx" ON "VoterMA"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterMA_PresidentialPrimary_2016_idx" ON "VoterMA"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterMA_OtherElection_2016_idx" ON "VoterMA"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterMI_LALVOTERID_key" ON "VoterMI"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterMI_US_Congressional_District_idx" ON "VoterMI"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterMI_State_Senate_District_idx" ON "VoterMI"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterMI_State_House_District_idx" ON "VoterMI"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterMI_County_Legislative_District_idx" ON "VoterMI"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterMI_City_idx" ON "VoterMI"("City");

-- CreateIndex
CREATE INDEX "VoterMI_County_idx" ON "VoterMI"("County");

-- CreateIndex
CREATE INDEX "VoterMI_City_Council_Commissioner_District_idx" ON "VoterMI"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterMI_City_Mayoral_District_idx" ON "VoterMI"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterMI_Town_District_idx" ON "VoterMI"("Town_District");

-- CreateIndex
CREATE INDEX "VoterMI_Town_Council_idx" ON "VoterMI"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterMI_Village_idx" ON "VoterMI"("Village");

-- CreateIndex
CREATE INDEX "VoterMI_Township_idx" ON "VoterMI"("Township");

-- CreateIndex
CREATE INDEX "VoterMI_Borough_idx" ON "VoterMI"("Borough");

-- CreateIndex
CREATE INDEX "VoterMI_Hamlet_Community_Area_idx" ON "VoterMI"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterMI_Board_of_Education_District_idx" ON "VoterMI"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterMI_Board_of_Education_SubDistrict_idx" ON "VoterMI"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMI_City_School_District_idx" ON "VoterMI"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterMI_College_Board_District_idx" ON "VoterMI"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterMI_Community_College_Commissioner_District_idx" ON "VoterMI"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterMI_Community_College_SubDistrict_idx" ON "VoterMI"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMI_County_Board_of_Education_District_idx" ON "VoterMI"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterMI_County_Board_of_Education_SubDistrict_idx" ON "VoterMI"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMI_County_Community_College_District_idx" ON "VoterMI"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterMI_County_Superintendent_of_Schools_District_idx" ON "VoterMI"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterMI_County_Unified_School_District_idx" ON "VoterMI"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterMI_District_Attorney_idx" ON "VoterMI"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterMI_Education_Commission_District_idx" ON "VoterMI"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterMI_Educational_Service_District_idx" ON "VoterMI"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterMI_Election_Commissioner_District_idx" ON "VoterMI"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterMI_Elementary_School_District_idx" ON "VoterMI"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterMI_Elementary_School_SubDistrict_idx" ON "VoterMI"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMI_Exempted_Village_School_District_idx" ON "VoterMI"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterMI_High_School_District_idx" ON "VoterMI"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterMI_High_School_SubDistrict_idx" ON "VoterMI"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMI_Judicial_Appellate_District_idx" ON "VoterMI"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterMI_Judicial_Circuit_Court_District_idx" ON "VoterMI"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterMI_Judicial_County_Board_of_Review_District_idx" ON "VoterMI"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterMI_Judicial_County_Court_District_idx" ON "VoterMI"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterMI_Judicial_District_idx" ON "VoterMI"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterMI_Judicial_District_Court_District_idx" ON "VoterMI"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterMI_Judicial_Family_Court_District_idx" ON "VoterMI"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterMI_Judicial_Jury_District_idx" ON "VoterMI"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterMI_Judicial_Juvenile_Court_District_idx" ON "VoterMI"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterMI_Judicial_Magistrate_Division_idx" ON "VoterMI"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterMI_Judicial_Sub_Circuit_District_idx" ON "VoterMI"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterMI_Judicial_Superior_Court_District_idx" ON "VoterMI"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterMI_Judicial_Supreme_Court_District_idx" ON "VoterMI"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterMI_Middle_School_District_idx" ON "VoterMI"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterMI_Municipal_Court_District_idx" ON "VoterMI"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterMI_Proposed_City_Commissioner_District_idx" ON "VoterMI"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterMI_Proposed_Elementary_School_District_idx" ON "VoterMI"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterMI_Proposed_Unified_School_District_idx" ON "VoterMI"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterMI_Regional_Office_of_Education_District_idx" ON "VoterMI"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterMI_School_Board_District_idx" ON "VoterMI"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterMI_School_District_idx" ON "VoterMI"("School_District");

-- CreateIndex
CREATE INDEX "VoterMI_School_District_Vocational_idx" ON "VoterMI"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterMI_School_Facilities_Improvement_District_idx" ON "VoterMI"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterMI_School_Subdistrict_idx" ON "VoterMI"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterMI_Service_Area_District_idx" ON "VoterMI"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterMI_Superintendent_of_Schools_District_idx" ON "VoterMI"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterMI_Unified_School_District_idx" ON "VoterMI"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterMI_Unified_School_SubDistrict_idx" ON "VoterMI"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMI_Voters_FirstName_idx" ON "VoterMI"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterMI_Voters_MiddleName_idx" ON "VoterMI"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterMI_Voters_LastName_idx" ON "VoterMI"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterMI_Voters_Active_idx" ON "VoterMI"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterMI_MilitaryStatus_Description_idx" ON "VoterMI"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterMI_Voters_Age_idx" ON "VoterMI"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterMI_Parties_Description_idx" ON "VoterMI"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterMI_VoterParties_Change_Changed_Party_idx" ON "VoterMI"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterMI_Voters_CalculatedRegDate_idx" ON "VoterMI"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterMI_Voters_OfficialRegDate_idx" ON "VoterMI"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterMI_VoterTelephones_CellConfidenceCode_idx" ON "VoterMI"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterMI_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterMI"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterMI_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterMI"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterMI_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterMI"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterMI_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterMI"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterMI_Voters_VotingPerformanceMinorElection_idx" ON "VoterMI"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterMI_General_2022_idx" ON "VoterMI"("General_2022");

-- CreateIndex
CREATE INDEX "VoterMI_Primary_2022_idx" ON "VoterMI"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterMI_OtherElection_2022_idx" ON "VoterMI"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterMI_AnyElection_2021_idx" ON "VoterMI"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterMI_General_2020_idx" ON "VoterMI"("General_2020");

-- CreateIndex
CREATE INDEX "VoterMI_Primary_2020_idx" ON "VoterMI"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterMI_PresidentialPrimary_2020_idx" ON "VoterMI"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterMI_OtherElection_2020_idx" ON "VoterMI"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterMI_AnyElection_2019_idx" ON "VoterMI"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterMI_General_2018_idx" ON "VoterMI"("General_2018");

-- CreateIndex
CREATE INDEX "VoterMI_Primary_2018_idx" ON "VoterMI"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterMI_OtherElection_2018_idx" ON "VoterMI"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterMI_AnyElection_2017_idx" ON "VoterMI"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterMI_General_2016_idx" ON "VoterMI"("General_2016");

-- CreateIndex
CREATE INDEX "VoterMI_Primary_2016_idx" ON "VoterMI"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterMI_PresidentialPrimary_2016_idx" ON "VoterMI"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterMI_OtherElection_2016_idx" ON "VoterMI"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterMN_LALVOTERID_key" ON "VoterMN"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterMN_US_Congressional_District_idx" ON "VoterMN"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterMN_State_Senate_District_idx" ON "VoterMN"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterMN_State_House_District_idx" ON "VoterMN"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterMN_County_Legislative_District_idx" ON "VoterMN"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterMN_City_idx" ON "VoterMN"("City");

-- CreateIndex
CREATE INDEX "VoterMN_County_idx" ON "VoterMN"("County");

-- CreateIndex
CREATE INDEX "VoterMN_City_Council_Commissioner_District_idx" ON "VoterMN"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterMN_City_Mayoral_District_idx" ON "VoterMN"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterMN_Town_District_idx" ON "VoterMN"("Town_District");

-- CreateIndex
CREATE INDEX "VoterMN_Town_Council_idx" ON "VoterMN"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterMN_Village_idx" ON "VoterMN"("Village");

-- CreateIndex
CREATE INDEX "VoterMN_Township_idx" ON "VoterMN"("Township");

-- CreateIndex
CREATE INDEX "VoterMN_Borough_idx" ON "VoterMN"("Borough");

-- CreateIndex
CREATE INDEX "VoterMN_Hamlet_Community_Area_idx" ON "VoterMN"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterMN_Board_of_Education_District_idx" ON "VoterMN"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterMN_Board_of_Education_SubDistrict_idx" ON "VoterMN"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMN_City_School_District_idx" ON "VoterMN"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterMN_College_Board_District_idx" ON "VoterMN"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterMN_Community_College_Commissioner_District_idx" ON "VoterMN"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterMN_Community_College_SubDistrict_idx" ON "VoterMN"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMN_County_Board_of_Education_District_idx" ON "VoterMN"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterMN_County_Board_of_Education_SubDistrict_idx" ON "VoterMN"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMN_County_Community_College_District_idx" ON "VoterMN"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterMN_County_Superintendent_of_Schools_District_idx" ON "VoterMN"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterMN_County_Unified_School_District_idx" ON "VoterMN"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterMN_District_Attorney_idx" ON "VoterMN"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterMN_Education_Commission_District_idx" ON "VoterMN"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterMN_Educational_Service_District_idx" ON "VoterMN"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterMN_Election_Commissioner_District_idx" ON "VoterMN"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterMN_Elementary_School_District_idx" ON "VoterMN"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterMN_Elementary_School_SubDistrict_idx" ON "VoterMN"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMN_Exempted_Village_School_District_idx" ON "VoterMN"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterMN_High_School_District_idx" ON "VoterMN"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterMN_High_School_SubDistrict_idx" ON "VoterMN"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMN_Judicial_Appellate_District_idx" ON "VoterMN"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterMN_Judicial_Circuit_Court_District_idx" ON "VoterMN"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterMN_Judicial_County_Board_of_Review_District_idx" ON "VoterMN"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterMN_Judicial_County_Court_District_idx" ON "VoterMN"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterMN_Judicial_District_idx" ON "VoterMN"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterMN_Judicial_District_Court_District_idx" ON "VoterMN"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterMN_Judicial_Family_Court_District_idx" ON "VoterMN"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterMN_Judicial_Jury_District_idx" ON "VoterMN"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterMN_Judicial_Juvenile_Court_District_idx" ON "VoterMN"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterMN_Judicial_Magistrate_Division_idx" ON "VoterMN"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterMN_Judicial_Sub_Circuit_District_idx" ON "VoterMN"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterMN_Judicial_Superior_Court_District_idx" ON "VoterMN"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterMN_Judicial_Supreme_Court_District_idx" ON "VoterMN"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterMN_Middle_School_District_idx" ON "VoterMN"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterMN_Municipal_Court_District_idx" ON "VoterMN"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterMN_Proposed_City_Commissioner_District_idx" ON "VoterMN"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterMN_Proposed_Elementary_School_District_idx" ON "VoterMN"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterMN_Proposed_Unified_School_District_idx" ON "VoterMN"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterMN_Regional_Office_of_Education_District_idx" ON "VoterMN"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterMN_School_Board_District_idx" ON "VoterMN"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterMN_School_District_idx" ON "VoterMN"("School_District");

-- CreateIndex
CREATE INDEX "VoterMN_School_District_Vocational_idx" ON "VoterMN"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterMN_School_Facilities_Improvement_District_idx" ON "VoterMN"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterMN_School_Subdistrict_idx" ON "VoterMN"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterMN_Service_Area_District_idx" ON "VoterMN"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterMN_Superintendent_of_Schools_District_idx" ON "VoterMN"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterMN_Unified_School_District_idx" ON "VoterMN"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterMN_Unified_School_SubDistrict_idx" ON "VoterMN"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMN_Voters_FirstName_idx" ON "VoterMN"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterMN_Voters_MiddleName_idx" ON "VoterMN"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterMN_Voters_LastName_idx" ON "VoterMN"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterMN_Voters_Active_idx" ON "VoterMN"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterMN_MilitaryStatus_Description_idx" ON "VoterMN"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterMN_Voters_Age_idx" ON "VoterMN"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterMN_Parties_Description_idx" ON "VoterMN"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterMN_VoterParties_Change_Changed_Party_idx" ON "VoterMN"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterMN_Voters_CalculatedRegDate_idx" ON "VoterMN"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterMN_Voters_OfficialRegDate_idx" ON "VoterMN"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterMN_VoterTelephones_CellConfidenceCode_idx" ON "VoterMN"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterMN_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterMN"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterMN_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterMN"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterMN_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterMN"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterMN_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterMN"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterMN_Voters_VotingPerformanceMinorElection_idx" ON "VoterMN"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterMN_General_2022_idx" ON "VoterMN"("General_2022");

-- CreateIndex
CREATE INDEX "VoterMN_Primary_2022_idx" ON "VoterMN"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterMN_OtherElection_2022_idx" ON "VoterMN"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterMN_AnyElection_2021_idx" ON "VoterMN"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterMN_General_2020_idx" ON "VoterMN"("General_2020");

-- CreateIndex
CREATE INDEX "VoterMN_Primary_2020_idx" ON "VoterMN"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterMN_PresidentialPrimary_2020_idx" ON "VoterMN"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterMN_OtherElection_2020_idx" ON "VoterMN"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterMN_AnyElection_2019_idx" ON "VoterMN"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterMN_General_2018_idx" ON "VoterMN"("General_2018");

-- CreateIndex
CREATE INDEX "VoterMN_Primary_2018_idx" ON "VoterMN"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterMN_OtherElection_2018_idx" ON "VoterMN"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterMN_AnyElection_2017_idx" ON "VoterMN"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterMN_General_2016_idx" ON "VoterMN"("General_2016");

-- CreateIndex
CREATE INDEX "VoterMN_Primary_2016_idx" ON "VoterMN"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterMN_PresidentialPrimary_2016_idx" ON "VoterMN"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterMN_OtherElection_2016_idx" ON "VoterMN"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterMS_LALVOTERID_key" ON "VoterMS"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterMS_US_Congressional_District_idx" ON "VoterMS"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterMS_State_Senate_District_idx" ON "VoterMS"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterMS_State_House_District_idx" ON "VoterMS"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterMS_County_Legislative_District_idx" ON "VoterMS"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterMS_City_idx" ON "VoterMS"("City");

-- CreateIndex
CREATE INDEX "VoterMS_County_idx" ON "VoterMS"("County");

-- CreateIndex
CREATE INDEX "VoterMS_City_Council_Commissioner_District_idx" ON "VoterMS"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterMS_City_Mayoral_District_idx" ON "VoterMS"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterMS_Town_District_idx" ON "VoterMS"("Town_District");

-- CreateIndex
CREATE INDEX "VoterMS_Town_Council_idx" ON "VoterMS"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterMS_Village_idx" ON "VoterMS"("Village");

-- CreateIndex
CREATE INDEX "VoterMS_Township_idx" ON "VoterMS"("Township");

-- CreateIndex
CREATE INDEX "VoterMS_Borough_idx" ON "VoterMS"("Borough");

-- CreateIndex
CREATE INDEX "VoterMS_Hamlet_Community_Area_idx" ON "VoterMS"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterMS_Board_of_Education_District_idx" ON "VoterMS"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterMS_Board_of_Education_SubDistrict_idx" ON "VoterMS"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMS_City_School_District_idx" ON "VoterMS"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterMS_College_Board_District_idx" ON "VoterMS"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterMS_Community_College_Commissioner_District_idx" ON "VoterMS"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterMS_Community_College_SubDistrict_idx" ON "VoterMS"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMS_County_Board_of_Education_District_idx" ON "VoterMS"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterMS_County_Board_of_Education_SubDistrict_idx" ON "VoterMS"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMS_County_Community_College_District_idx" ON "VoterMS"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterMS_County_Superintendent_of_Schools_District_idx" ON "VoterMS"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterMS_County_Unified_School_District_idx" ON "VoterMS"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterMS_District_Attorney_idx" ON "VoterMS"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterMS_Education_Commission_District_idx" ON "VoterMS"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterMS_Educational_Service_District_idx" ON "VoterMS"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterMS_Election_Commissioner_District_idx" ON "VoterMS"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterMS_Elementary_School_District_idx" ON "VoterMS"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterMS_Elementary_School_SubDistrict_idx" ON "VoterMS"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMS_Exempted_Village_School_District_idx" ON "VoterMS"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterMS_High_School_District_idx" ON "VoterMS"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterMS_High_School_SubDistrict_idx" ON "VoterMS"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMS_Judicial_Appellate_District_idx" ON "VoterMS"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterMS_Judicial_Circuit_Court_District_idx" ON "VoterMS"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterMS_Judicial_County_Board_of_Review_District_idx" ON "VoterMS"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterMS_Judicial_County_Court_District_idx" ON "VoterMS"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterMS_Judicial_District_idx" ON "VoterMS"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterMS_Judicial_District_Court_District_idx" ON "VoterMS"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterMS_Judicial_Family_Court_District_idx" ON "VoterMS"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterMS_Judicial_Jury_District_idx" ON "VoterMS"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterMS_Judicial_Juvenile_Court_District_idx" ON "VoterMS"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterMS_Judicial_Magistrate_Division_idx" ON "VoterMS"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterMS_Judicial_Sub_Circuit_District_idx" ON "VoterMS"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterMS_Judicial_Superior_Court_District_idx" ON "VoterMS"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterMS_Judicial_Supreme_Court_District_idx" ON "VoterMS"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterMS_Middle_School_District_idx" ON "VoterMS"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterMS_Municipal_Court_District_idx" ON "VoterMS"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterMS_Proposed_City_Commissioner_District_idx" ON "VoterMS"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterMS_Proposed_Elementary_School_District_idx" ON "VoterMS"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterMS_Proposed_Unified_School_District_idx" ON "VoterMS"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterMS_Regional_Office_of_Education_District_idx" ON "VoterMS"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterMS_School_Board_District_idx" ON "VoterMS"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterMS_School_District_idx" ON "VoterMS"("School_District");

-- CreateIndex
CREATE INDEX "VoterMS_School_District_Vocational_idx" ON "VoterMS"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterMS_School_Facilities_Improvement_District_idx" ON "VoterMS"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterMS_School_Subdistrict_idx" ON "VoterMS"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterMS_Service_Area_District_idx" ON "VoterMS"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterMS_Superintendent_of_Schools_District_idx" ON "VoterMS"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterMS_Unified_School_District_idx" ON "VoterMS"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterMS_Unified_School_SubDistrict_idx" ON "VoterMS"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMS_Voters_FirstName_idx" ON "VoterMS"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterMS_Voters_MiddleName_idx" ON "VoterMS"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterMS_Voters_LastName_idx" ON "VoterMS"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterMS_Voters_Active_idx" ON "VoterMS"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterMS_MilitaryStatus_Description_idx" ON "VoterMS"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterMS_Voters_Age_idx" ON "VoterMS"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterMS_Parties_Description_idx" ON "VoterMS"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterMS_VoterParties_Change_Changed_Party_idx" ON "VoterMS"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterMS_Voters_CalculatedRegDate_idx" ON "VoterMS"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterMS_Voters_OfficialRegDate_idx" ON "VoterMS"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterMS_VoterTelephones_CellConfidenceCode_idx" ON "VoterMS"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterMS_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterMS"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterMS_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterMS"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterMS_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterMS"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterMS_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterMS"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterMS_Voters_VotingPerformanceMinorElection_idx" ON "VoterMS"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterMS_General_2022_idx" ON "VoterMS"("General_2022");

-- CreateIndex
CREATE INDEX "VoterMS_Primary_2022_idx" ON "VoterMS"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterMS_OtherElection_2022_idx" ON "VoterMS"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterMS_AnyElection_2021_idx" ON "VoterMS"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterMS_General_2020_idx" ON "VoterMS"("General_2020");

-- CreateIndex
CREATE INDEX "VoterMS_Primary_2020_idx" ON "VoterMS"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterMS_PresidentialPrimary_2020_idx" ON "VoterMS"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterMS_OtherElection_2020_idx" ON "VoterMS"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterMS_AnyElection_2019_idx" ON "VoterMS"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterMS_General_2018_idx" ON "VoterMS"("General_2018");

-- CreateIndex
CREATE INDEX "VoterMS_Primary_2018_idx" ON "VoterMS"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterMS_OtherElection_2018_idx" ON "VoterMS"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterMS_AnyElection_2017_idx" ON "VoterMS"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterMS_General_2016_idx" ON "VoterMS"("General_2016");

-- CreateIndex
CREATE INDEX "VoterMS_Primary_2016_idx" ON "VoterMS"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterMS_PresidentialPrimary_2016_idx" ON "VoterMS"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterMS_OtherElection_2016_idx" ON "VoterMS"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterMO_LALVOTERID_key" ON "VoterMO"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterMO_US_Congressional_District_idx" ON "VoterMO"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterMO_State_Senate_District_idx" ON "VoterMO"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterMO_State_House_District_idx" ON "VoterMO"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterMO_County_Legislative_District_idx" ON "VoterMO"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterMO_City_idx" ON "VoterMO"("City");

-- CreateIndex
CREATE INDEX "VoterMO_County_idx" ON "VoterMO"("County");

-- CreateIndex
CREATE INDEX "VoterMO_City_Council_Commissioner_District_idx" ON "VoterMO"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterMO_City_Mayoral_District_idx" ON "VoterMO"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterMO_Town_District_idx" ON "VoterMO"("Town_District");

-- CreateIndex
CREATE INDEX "VoterMO_Town_Council_idx" ON "VoterMO"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterMO_Village_idx" ON "VoterMO"("Village");

-- CreateIndex
CREATE INDEX "VoterMO_Township_idx" ON "VoterMO"("Township");

-- CreateIndex
CREATE INDEX "VoterMO_Borough_idx" ON "VoterMO"("Borough");

-- CreateIndex
CREATE INDEX "VoterMO_Hamlet_Community_Area_idx" ON "VoterMO"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterMO_Board_of_Education_District_idx" ON "VoterMO"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterMO_Board_of_Education_SubDistrict_idx" ON "VoterMO"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMO_City_School_District_idx" ON "VoterMO"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterMO_College_Board_District_idx" ON "VoterMO"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterMO_Community_College_Commissioner_District_idx" ON "VoterMO"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterMO_Community_College_SubDistrict_idx" ON "VoterMO"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMO_County_Board_of_Education_District_idx" ON "VoterMO"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterMO_County_Board_of_Education_SubDistrict_idx" ON "VoterMO"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMO_County_Community_College_District_idx" ON "VoterMO"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterMO_County_Superintendent_of_Schools_District_idx" ON "VoterMO"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterMO_County_Unified_School_District_idx" ON "VoterMO"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterMO_District_Attorney_idx" ON "VoterMO"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterMO_Education_Commission_District_idx" ON "VoterMO"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterMO_Educational_Service_District_idx" ON "VoterMO"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterMO_Election_Commissioner_District_idx" ON "VoterMO"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterMO_Elementary_School_District_idx" ON "VoterMO"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterMO_Elementary_School_SubDistrict_idx" ON "VoterMO"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMO_Exempted_Village_School_District_idx" ON "VoterMO"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterMO_High_School_District_idx" ON "VoterMO"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterMO_High_School_SubDistrict_idx" ON "VoterMO"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMO_Judicial_Appellate_District_idx" ON "VoterMO"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterMO_Judicial_Circuit_Court_District_idx" ON "VoterMO"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterMO_Judicial_County_Board_of_Review_District_idx" ON "VoterMO"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterMO_Judicial_County_Court_District_idx" ON "VoterMO"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterMO_Judicial_District_idx" ON "VoterMO"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterMO_Judicial_District_Court_District_idx" ON "VoterMO"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterMO_Judicial_Family_Court_District_idx" ON "VoterMO"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterMO_Judicial_Jury_District_idx" ON "VoterMO"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterMO_Judicial_Juvenile_Court_District_idx" ON "VoterMO"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterMO_Judicial_Magistrate_Division_idx" ON "VoterMO"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterMO_Judicial_Sub_Circuit_District_idx" ON "VoterMO"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterMO_Judicial_Superior_Court_District_idx" ON "VoterMO"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterMO_Judicial_Supreme_Court_District_idx" ON "VoterMO"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterMO_Middle_School_District_idx" ON "VoterMO"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterMO_Municipal_Court_District_idx" ON "VoterMO"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterMO_Proposed_City_Commissioner_District_idx" ON "VoterMO"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterMO_Proposed_Elementary_School_District_idx" ON "VoterMO"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterMO_Proposed_Unified_School_District_idx" ON "VoterMO"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterMO_Regional_Office_of_Education_District_idx" ON "VoterMO"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterMO_School_Board_District_idx" ON "VoterMO"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterMO_School_District_idx" ON "VoterMO"("School_District");

-- CreateIndex
CREATE INDEX "VoterMO_School_District_Vocational_idx" ON "VoterMO"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterMO_School_Facilities_Improvement_District_idx" ON "VoterMO"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterMO_School_Subdistrict_idx" ON "VoterMO"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterMO_Service_Area_District_idx" ON "VoterMO"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterMO_Superintendent_of_Schools_District_idx" ON "VoterMO"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterMO_Unified_School_District_idx" ON "VoterMO"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterMO_Unified_School_SubDistrict_idx" ON "VoterMO"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMO_Voters_FirstName_idx" ON "VoterMO"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterMO_Voters_MiddleName_idx" ON "VoterMO"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterMO_Voters_LastName_idx" ON "VoterMO"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterMO_Voters_Active_idx" ON "VoterMO"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterMO_MilitaryStatus_Description_idx" ON "VoterMO"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterMO_Voters_Age_idx" ON "VoterMO"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterMO_Parties_Description_idx" ON "VoterMO"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterMO_VoterParties_Change_Changed_Party_idx" ON "VoterMO"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterMO_Voters_CalculatedRegDate_idx" ON "VoterMO"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterMO_Voters_OfficialRegDate_idx" ON "VoterMO"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterMO_VoterTelephones_CellConfidenceCode_idx" ON "VoterMO"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterMO_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterMO"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterMO_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterMO"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterMO_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterMO"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterMO_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterMO"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterMO_Voters_VotingPerformanceMinorElection_idx" ON "VoterMO"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterMO_General_2022_idx" ON "VoterMO"("General_2022");

-- CreateIndex
CREATE INDEX "VoterMO_Primary_2022_idx" ON "VoterMO"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterMO_OtherElection_2022_idx" ON "VoterMO"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterMO_AnyElection_2021_idx" ON "VoterMO"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterMO_General_2020_idx" ON "VoterMO"("General_2020");

-- CreateIndex
CREATE INDEX "VoterMO_Primary_2020_idx" ON "VoterMO"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterMO_PresidentialPrimary_2020_idx" ON "VoterMO"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterMO_OtherElection_2020_idx" ON "VoterMO"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterMO_AnyElection_2019_idx" ON "VoterMO"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterMO_General_2018_idx" ON "VoterMO"("General_2018");

-- CreateIndex
CREATE INDEX "VoterMO_Primary_2018_idx" ON "VoterMO"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterMO_OtherElection_2018_idx" ON "VoterMO"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterMO_AnyElection_2017_idx" ON "VoterMO"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterMO_General_2016_idx" ON "VoterMO"("General_2016");

-- CreateIndex
CREATE INDEX "VoterMO_Primary_2016_idx" ON "VoterMO"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterMO_PresidentialPrimary_2016_idx" ON "VoterMO"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterMO_OtherElection_2016_idx" ON "VoterMO"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterMT_LALVOTERID_key" ON "VoterMT"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterMT_US_Congressional_District_idx" ON "VoterMT"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterMT_State_Senate_District_idx" ON "VoterMT"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterMT_State_House_District_idx" ON "VoterMT"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterMT_County_Legislative_District_idx" ON "VoterMT"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterMT_City_idx" ON "VoterMT"("City");

-- CreateIndex
CREATE INDEX "VoterMT_County_idx" ON "VoterMT"("County");

-- CreateIndex
CREATE INDEX "VoterMT_City_Council_Commissioner_District_idx" ON "VoterMT"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterMT_City_Mayoral_District_idx" ON "VoterMT"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterMT_Town_District_idx" ON "VoterMT"("Town_District");

-- CreateIndex
CREATE INDEX "VoterMT_Town_Council_idx" ON "VoterMT"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterMT_Village_idx" ON "VoterMT"("Village");

-- CreateIndex
CREATE INDEX "VoterMT_Township_idx" ON "VoterMT"("Township");

-- CreateIndex
CREATE INDEX "VoterMT_Borough_idx" ON "VoterMT"("Borough");

-- CreateIndex
CREATE INDEX "VoterMT_Hamlet_Community_Area_idx" ON "VoterMT"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterMT_Board_of_Education_District_idx" ON "VoterMT"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterMT_Board_of_Education_SubDistrict_idx" ON "VoterMT"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMT_City_School_District_idx" ON "VoterMT"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterMT_College_Board_District_idx" ON "VoterMT"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterMT_Community_College_Commissioner_District_idx" ON "VoterMT"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterMT_Community_College_SubDistrict_idx" ON "VoterMT"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMT_County_Board_of_Education_District_idx" ON "VoterMT"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterMT_County_Board_of_Education_SubDistrict_idx" ON "VoterMT"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMT_County_Community_College_District_idx" ON "VoterMT"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterMT_County_Superintendent_of_Schools_District_idx" ON "VoterMT"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterMT_County_Unified_School_District_idx" ON "VoterMT"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterMT_District_Attorney_idx" ON "VoterMT"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterMT_Education_Commission_District_idx" ON "VoterMT"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterMT_Educational_Service_District_idx" ON "VoterMT"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterMT_Election_Commissioner_District_idx" ON "VoterMT"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterMT_Elementary_School_District_idx" ON "VoterMT"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterMT_Elementary_School_SubDistrict_idx" ON "VoterMT"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMT_Exempted_Village_School_District_idx" ON "VoterMT"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterMT_High_School_District_idx" ON "VoterMT"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterMT_High_School_SubDistrict_idx" ON "VoterMT"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMT_Judicial_Appellate_District_idx" ON "VoterMT"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterMT_Judicial_Circuit_Court_District_idx" ON "VoterMT"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterMT_Judicial_County_Board_of_Review_District_idx" ON "VoterMT"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterMT_Judicial_County_Court_District_idx" ON "VoterMT"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterMT_Judicial_District_idx" ON "VoterMT"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterMT_Judicial_District_Court_District_idx" ON "VoterMT"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterMT_Judicial_Family_Court_District_idx" ON "VoterMT"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterMT_Judicial_Jury_District_idx" ON "VoterMT"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterMT_Judicial_Juvenile_Court_District_idx" ON "VoterMT"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterMT_Judicial_Magistrate_Division_idx" ON "VoterMT"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterMT_Judicial_Sub_Circuit_District_idx" ON "VoterMT"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterMT_Judicial_Superior_Court_District_idx" ON "VoterMT"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterMT_Judicial_Supreme_Court_District_idx" ON "VoterMT"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterMT_Middle_School_District_idx" ON "VoterMT"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterMT_Municipal_Court_District_idx" ON "VoterMT"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterMT_Proposed_City_Commissioner_District_idx" ON "VoterMT"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterMT_Proposed_Elementary_School_District_idx" ON "VoterMT"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterMT_Proposed_Unified_School_District_idx" ON "VoterMT"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterMT_Regional_Office_of_Education_District_idx" ON "VoterMT"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterMT_School_Board_District_idx" ON "VoterMT"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterMT_School_District_idx" ON "VoterMT"("School_District");

-- CreateIndex
CREATE INDEX "VoterMT_School_District_Vocational_idx" ON "VoterMT"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterMT_School_Facilities_Improvement_District_idx" ON "VoterMT"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterMT_School_Subdistrict_idx" ON "VoterMT"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterMT_Service_Area_District_idx" ON "VoterMT"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterMT_Superintendent_of_Schools_District_idx" ON "VoterMT"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterMT_Unified_School_District_idx" ON "VoterMT"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterMT_Unified_School_SubDistrict_idx" ON "VoterMT"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterMT_Voters_FirstName_idx" ON "VoterMT"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterMT_Voters_MiddleName_idx" ON "VoterMT"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterMT_Voters_LastName_idx" ON "VoterMT"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterMT_Voters_Active_idx" ON "VoterMT"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterMT_MilitaryStatus_Description_idx" ON "VoterMT"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterMT_Voters_Age_idx" ON "VoterMT"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterMT_Parties_Description_idx" ON "VoterMT"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterMT_VoterParties_Change_Changed_Party_idx" ON "VoterMT"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterMT_Voters_CalculatedRegDate_idx" ON "VoterMT"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterMT_Voters_OfficialRegDate_idx" ON "VoterMT"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterMT_VoterTelephones_CellConfidenceCode_idx" ON "VoterMT"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterMT_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterMT"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterMT_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterMT"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterMT_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterMT"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterMT_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterMT"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterMT_Voters_VotingPerformanceMinorElection_idx" ON "VoterMT"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterMT_General_2022_idx" ON "VoterMT"("General_2022");

-- CreateIndex
CREATE INDEX "VoterMT_Primary_2022_idx" ON "VoterMT"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterMT_OtherElection_2022_idx" ON "VoterMT"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterMT_AnyElection_2021_idx" ON "VoterMT"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterMT_General_2020_idx" ON "VoterMT"("General_2020");

-- CreateIndex
CREATE INDEX "VoterMT_Primary_2020_idx" ON "VoterMT"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterMT_PresidentialPrimary_2020_idx" ON "VoterMT"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterMT_OtherElection_2020_idx" ON "VoterMT"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterMT_AnyElection_2019_idx" ON "VoterMT"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterMT_General_2018_idx" ON "VoterMT"("General_2018");

-- CreateIndex
CREATE INDEX "VoterMT_Primary_2018_idx" ON "VoterMT"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterMT_OtherElection_2018_idx" ON "VoterMT"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterMT_AnyElection_2017_idx" ON "VoterMT"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterMT_General_2016_idx" ON "VoterMT"("General_2016");

-- CreateIndex
CREATE INDEX "VoterMT_Primary_2016_idx" ON "VoterMT"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterMT_PresidentialPrimary_2016_idx" ON "VoterMT"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterMT_OtherElection_2016_idx" ON "VoterMT"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterNE_LALVOTERID_key" ON "VoterNE"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterNE_US_Congressional_District_idx" ON "VoterNE"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterNE_State_Senate_District_idx" ON "VoterNE"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterNE_State_House_District_idx" ON "VoterNE"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterNE_County_Legislative_District_idx" ON "VoterNE"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterNE_City_idx" ON "VoterNE"("City");

-- CreateIndex
CREATE INDEX "VoterNE_County_idx" ON "VoterNE"("County");

-- CreateIndex
CREATE INDEX "VoterNE_City_Council_Commissioner_District_idx" ON "VoterNE"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterNE_City_Mayoral_District_idx" ON "VoterNE"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterNE_Town_District_idx" ON "VoterNE"("Town_District");

-- CreateIndex
CREATE INDEX "VoterNE_Town_Council_idx" ON "VoterNE"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterNE_Village_idx" ON "VoterNE"("Village");

-- CreateIndex
CREATE INDEX "VoterNE_Township_idx" ON "VoterNE"("Township");

-- CreateIndex
CREATE INDEX "VoterNE_Borough_idx" ON "VoterNE"("Borough");

-- CreateIndex
CREATE INDEX "VoterNE_Hamlet_Community_Area_idx" ON "VoterNE"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterNE_Board_of_Education_District_idx" ON "VoterNE"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterNE_Board_of_Education_SubDistrict_idx" ON "VoterNE"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNE_City_School_District_idx" ON "VoterNE"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterNE_College_Board_District_idx" ON "VoterNE"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterNE_Community_College_Commissioner_District_idx" ON "VoterNE"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterNE_Community_College_SubDistrict_idx" ON "VoterNE"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNE_County_Board_of_Education_District_idx" ON "VoterNE"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterNE_County_Board_of_Education_SubDistrict_idx" ON "VoterNE"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNE_County_Community_College_District_idx" ON "VoterNE"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterNE_County_Superintendent_of_Schools_District_idx" ON "VoterNE"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterNE_County_Unified_School_District_idx" ON "VoterNE"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterNE_District_Attorney_idx" ON "VoterNE"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterNE_Education_Commission_District_idx" ON "VoterNE"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterNE_Educational_Service_District_idx" ON "VoterNE"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterNE_Election_Commissioner_District_idx" ON "VoterNE"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterNE_Elementary_School_District_idx" ON "VoterNE"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterNE_Elementary_School_SubDistrict_idx" ON "VoterNE"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNE_Exempted_Village_School_District_idx" ON "VoterNE"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterNE_High_School_District_idx" ON "VoterNE"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterNE_High_School_SubDistrict_idx" ON "VoterNE"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNE_Judicial_Appellate_District_idx" ON "VoterNE"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterNE_Judicial_Circuit_Court_District_idx" ON "VoterNE"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterNE_Judicial_County_Board_of_Review_District_idx" ON "VoterNE"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterNE_Judicial_County_Court_District_idx" ON "VoterNE"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterNE_Judicial_District_idx" ON "VoterNE"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterNE_Judicial_District_Court_District_idx" ON "VoterNE"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterNE_Judicial_Family_Court_District_idx" ON "VoterNE"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterNE_Judicial_Jury_District_idx" ON "VoterNE"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterNE_Judicial_Juvenile_Court_District_idx" ON "VoterNE"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterNE_Judicial_Magistrate_Division_idx" ON "VoterNE"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterNE_Judicial_Sub_Circuit_District_idx" ON "VoterNE"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterNE_Judicial_Superior_Court_District_idx" ON "VoterNE"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterNE_Judicial_Supreme_Court_District_idx" ON "VoterNE"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterNE_Middle_School_District_idx" ON "VoterNE"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterNE_Municipal_Court_District_idx" ON "VoterNE"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterNE_Proposed_City_Commissioner_District_idx" ON "VoterNE"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterNE_Proposed_Elementary_School_District_idx" ON "VoterNE"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterNE_Proposed_Unified_School_District_idx" ON "VoterNE"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterNE_Regional_Office_of_Education_District_idx" ON "VoterNE"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterNE_School_Board_District_idx" ON "VoterNE"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterNE_School_District_idx" ON "VoterNE"("School_District");

-- CreateIndex
CREATE INDEX "VoterNE_School_District_Vocational_idx" ON "VoterNE"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterNE_School_Facilities_Improvement_District_idx" ON "VoterNE"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterNE_School_Subdistrict_idx" ON "VoterNE"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterNE_Service_Area_District_idx" ON "VoterNE"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterNE_Superintendent_of_Schools_District_idx" ON "VoterNE"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterNE_Unified_School_District_idx" ON "VoterNE"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterNE_Unified_School_SubDistrict_idx" ON "VoterNE"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNE_Voters_FirstName_idx" ON "VoterNE"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterNE_Voters_MiddleName_idx" ON "VoterNE"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterNE_Voters_LastName_idx" ON "VoterNE"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterNE_Voters_Active_idx" ON "VoterNE"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterNE_MilitaryStatus_Description_idx" ON "VoterNE"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterNE_Voters_Age_idx" ON "VoterNE"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterNE_Parties_Description_idx" ON "VoterNE"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterNE_VoterParties_Change_Changed_Party_idx" ON "VoterNE"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterNE_Voters_CalculatedRegDate_idx" ON "VoterNE"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterNE_Voters_OfficialRegDate_idx" ON "VoterNE"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterNE_VoterTelephones_CellConfidenceCode_idx" ON "VoterNE"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterNE_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterNE"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterNE_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterNE"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterNE_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterNE"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterNE_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterNE"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterNE_Voters_VotingPerformanceMinorElection_idx" ON "VoterNE"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterNE_General_2022_idx" ON "VoterNE"("General_2022");

-- CreateIndex
CREATE INDEX "VoterNE_Primary_2022_idx" ON "VoterNE"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterNE_OtherElection_2022_idx" ON "VoterNE"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterNE_AnyElection_2021_idx" ON "VoterNE"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterNE_General_2020_idx" ON "VoterNE"("General_2020");

-- CreateIndex
CREATE INDEX "VoterNE_Primary_2020_idx" ON "VoterNE"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterNE_PresidentialPrimary_2020_idx" ON "VoterNE"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterNE_OtherElection_2020_idx" ON "VoterNE"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterNE_AnyElection_2019_idx" ON "VoterNE"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterNE_General_2018_idx" ON "VoterNE"("General_2018");

-- CreateIndex
CREATE INDEX "VoterNE_Primary_2018_idx" ON "VoterNE"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterNE_OtherElection_2018_idx" ON "VoterNE"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterNE_AnyElection_2017_idx" ON "VoterNE"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterNE_General_2016_idx" ON "VoterNE"("General_2016");

-- CreateIndex
CREATE INDEX "VoterNE_Primary_2016_idx" ON "VoterNE"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterNE_PresidentialPrimary_2016_idx" ON "VoterNE"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterNE_OtherElection_2016_idx" ON "VoterNE"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterNV_LALVOTERID_key" ON "VoterNV"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterNV_US_Congressional_District_idx" ON "VoterNV"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterNV_State_Senate_District_idx" ON "VoterNV"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterNV_State_House_District_idx" ON "VoterNV"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterNV_County_Legislative_District_idx" ON "VoterNV"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterNV_City_idx" ON "VoterNV"("City");

-- CreateIndex
CREATE INDEX "VoterNV_County_idx" ON "VoterNV"("County");

-- CreateIndex
CREATE INDEX "VoterNV_City_Council_Commissioner_District_idx" ON "VoterNV"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterNV_City_Mayoral_District_idx" ON "VoterNV"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterNV_Town_District_idx" ON "VoterNV"("Town_District");

-- CreateIndex
CREATE INDEX "VoterNV_Town_Council_idx" ON "VoterNV"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterNV_Village_idx" ON "VoterNV"("Village");

-- CreateIndex
CREATE INDEX "VoterNV_Township_idx" ON "VoterNV"("Township");

-- CreateIndex
CREATE INDEX "VoterNV_Borough_idx" ON "VoterNV"("Borough");

-- CreateIndex
CREATE INDEX "VoterNV_Hamlet_Community_Area_idx" ON "VoterNV"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterNV_Board_of_Education_District_idx" ON "VoterNV"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterNV_Board_of_Education_SubDistrict_idx" ON "VoterNV"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNV_City_School_District_idx" ON "VoterNV"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterNV_College_Board_District_idx" ON "VoterNV"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterNV_Community_College_Commissioner_District_idx" ON "VoterNV"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterNV_Community_College_SubDistrict_idx" ON "VoterNV"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNV_County_Board_of_Education_District_idx" ON "VoterNV"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterNV_County_Board_of_Education_SubDistrict_idx" ON "VoterNV"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNV_County_Community_College_District_idx" ON "VoterNV"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterNV_County_Superintendent_of_Schools_District_idx" ON "VoterNV"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterNV_County_Unified_School_District_idx" ON "VoterNV"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterNV_District_Attorney_idx" ON "VoterNV"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterNV_Education_Commission_District_idx" ON "VoterNV"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterNV_Educational_Service_District_idx" ON "VoterNV"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterNV_Election_Commissioner_District_idx" ON "VoterNV"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterNV_Elementary_School_District_idx" ON "VoterNV"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterNV_Elementary_School_SubDistrict_idx" ON "VoterNV"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNV_Exempted_Village_School_District_idx" ON "VoterNV"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterNV_High_School_District_idx" ON "VoterNV"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterNV_High_School_SubDistrict_idx" ON "VoterNV"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNV_Judicial_Appellate_District_idx" ON "VoterNV"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterNV_Judicial_Circuit_Court_District_idx" ON "VoterNV"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterNV_Judicial_County_Board_of_Review_District_idx" ON "VoterNV"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterNV_Judicial_County_Court_District_idx" ON "VoterNV"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterNV_Judicial_District_idx" ON "VoterNV"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterNV_Judicial_District_Court_District_idx" ON "VoterNV"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterNV_Judicial_Family_Court_District_idx" ON "VoterNV"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterNV_Judicial_Jury_District_idx" ON "VoterNV"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterNV_Judicial_Juvenile_Court_District_idx" ON "VoterNV"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterNV_Judicial_Magistrate_Division_idx" ON "VoterNV"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterNV_Judicial_Sub_Circuit_District_idx" ON "VoterNV"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterNV_Judicial_Superior_Court_District_idx" ON "VoterNV"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterNV_Judicial_Supreme_Court_District_idx" ON "VoterNV"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterNV_Middle_School_District_idx" ON "VoterNV"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterNV_Municipal_Court_District_idx" ON "VoterNV"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterNV_Proposed_City_Commissioner_District_idx" ON "VoterNV"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterNV_Proposed_Elementary_School_District_idx" ON "VoterNV"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterNV_Proposed_Unified_School_District_idx" ON "VoterNV"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterNV_Regional_Office_of_Education_District_idx" ON "VoterNV"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterNV_School_Board_District_idx" ON "VoterNV"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterNV_School_District_idx" ON "VoterNV"("School_District");

-- CreateIndex
CREATE INDEX "VoterNV_School_District_Vocational_idx" ON "VoterNV"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterNV_School_Facilities_Improvement_District_idx" ON "VoterNV"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterNV_School_Subdistrict_idx" ON "VoterNV"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterNV_Service_Area_District_idx" ON "VoterNV"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterNV_Superintendent_of_Schools_District_idx" ON "VoterNV"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterNV_Unified_School_District_idx" ON "VoterNV"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterNV_Unified_School_SubDistrict_idx" ON "VoterNV"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNV_Voters_FirstName_idx" ON "VoterNV"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterNV_Voters_MiddleName_idx" ON "VoterNV"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterNV_Voters_LastName_idx" ON "VoterNV"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterNV_Voters_Active_idx" ON "VoterNV"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterNV_MilitaryStatus_Description_idx" ON "VoterNV"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterNV_Voters_Age_idx" ON "VoterNV"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterNV_Parties_Description_idx" ON "VoterNV"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterNV_VoterParties_Change_Changed_Party_idx" ON "VoterNV"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterNV_Voters_CalculatedRegDate_idx" ON "VoterNV"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterNV_Voters_OfficialRegDate_idx" ON "VoterNV"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterNV_VoterTelephones_CellConfidenceCode_idx" ON "VoterNV"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterNV_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterNV"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterNV_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterNV"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterNV_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterNV"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterNV_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterNV"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterNV_Voters_VotingPerformanceMinorElection_idx" ON "VoterNV"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterNV_General_2022_idx" ON "VoterNV"("General_2022");

-- CreateIndex
CREATE INDEX "VoterNV_Primary_2022_idx" ON "VoterNV"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterNV_OtherElection_2022_idx" ON "VoterNV"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterNV_AnyElection_2021_idx" ON "VoterNV"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterNV_General_2020_idx" ON "VoterNV"("General_2020");

-- CreateIndex
CREATE INDEX "VoterNV_Primary_2020_idx" ON "VoterNV"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterNV_PresidentialPrimary_2020_idx" ON "VoterNV"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterNV_OtherElection_2020_idx" ON "VoterNV"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterNV_AnyElection_2019_idx" ON "VoterNV"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterNV_General_2018_idx" ON "VoterNV"("General_2018");

-- CreateIndex
CREATE INDEX "VoterNV_Primary_2018_idx" ON "VoterNV"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterNV_OtherElection_2018_idx" ON "VoterNV"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterNV_AnyElection_2017_idx" ON "VoterNV"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterNV_General_2016_idx" ON "VoterNV"("General_2016");

-- CreateIndex
CREATE INDEX "VoterNV_Primary_2016_idx" ON "VoterNV"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterNV_PresidentialPrimary_2016_idx" ON "VoterNV"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterNV_OtherElection_2016_idx" ON "VoterNV"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterNH_LALVOTERID_key" ON "VoterNH"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterNH_US_Congressional_District_idx" ON "VoterNH"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterNH_State_Senate_District_idx" ON "VoterNH"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterNH_State_House_District_idx" ON "VoterNH"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterNH_County_Legislative_District_idx" ON "VoterNH"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterNH_City_idx" ON "VoterNH"("City");

-- CreateIndex
CREATE INDEX "VoterNH_County_idx" ON "VoterNH"("County");

-- CreateIndex
CREATE INDEX "VoterNH_City_Council_Commissioner_District_idx" ON "VoterNH"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterNH_City_Mayoral_District_idx" ON "VoterNH"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterNH_Town_District_idx" ON "VoterNH"("Town_District");

-- CreateIndex
CREATE INDEX "VoterNH_Town_Council_idx" ON "VoterNH"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterNH_Village_idx" ON "VoterNH"("Village");

-- CreateIndex
CREATE INDEX "VoterNH_Township_idx" ON "VoterNH"("Township");

-- CreateIndex
CREATE INDEX "VoterNH_Borough_idx" ON "VoterNH"("Borough");

-- CreateIndex
CREATE INDEX "VoterNH_Hamlet_Community_Area_idx" ON "VoterNH"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterNH_Board_of_Education_District_idx" ON "VoterNH"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterNH_Board_of_Education_SubDistrict_idx" ON "VoterNH"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNH_City_School_District_idx" ON "VoterNH"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterNH_College_Board_District_idx" ON "VoterNH"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterNH_Community_College_Commissioner_District_idx" ON "VoterNH"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterNH_Community_College_SubDistrict_idx" ON "VoterNH"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNH_County_Board_of_Education_District_idx" ON "VoterNH"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterNH_County_Board_of_Education_SubDistrict_idx" ON "VoterNH"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNH_County_Community_College_District_idx" ON "VoterNH"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterNH_County_Superintendent_of_Schools_District_idx" ON "VoterNH"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterNH_County_Unified_School_District_idx" ON "VoterNH"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterNH_District_Attorney_idx" ON "VoterNH"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterNH_Education_Commission_District_idx" ON "VoterNH"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterNH_Educational_Service_District_idx" ON "VoterNH"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterNH_Election_Commissioner_District_idx" ON "VoterNH"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterNH_Elementary_School_District_idx" ON "VoterNH"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterNH_Elementary_School_SubDistrict_idx" ON "VoterNH"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNH_Exempted_Village_School_District_idx" ON "VoterNH"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterNH_High_School_District_idx" ON "VoterNH"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterNH_High_School_SubDistrict_idx" ON "VoterNH"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNH_Judicial_Appellate_District_idx" ON "VoterNH"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterNH_Judicial_Circuit_Court_District_idx" ON "VoterNH"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterNH_Judicial_County_Board_of_Review_District_idx" ON "VoterNH"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterNH_Judicial_County_Court_District_idx" ON "VoterNH"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterNH_Judicial_District_idx" ON "VoterNH"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterNH_Judicial_District_Court_District_idx" ON "VoterNH"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterNH_Judicial_Family_Court_District_idx" ON "VoterNH"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterNH_Judicial_Jury_District_idx" ON "VoterNH"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterNH_Judicial_Juvenile_Court_District_idx" ON "VoterNH"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterNH_Judicial_Magistrate_Division_idx" ON "VoterNH"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterNH_Judicial_Sub_Circuit_District_idx" ON "VoterNH"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterNH_Judicial_Superior_Court_District_idx" ON "VoterNH"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterNH_Judicial_Supreme_Court_District_idx" ON "VoterNH"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterNH_Middle_School_District_idx" ON "VoterNH"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterNH_Municipal_Court_District_idx" ON "VoterNH"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterNH_Proposed_City_Commissioner_District_idx" ON "VoterNH"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterNH_Proposed_Elementary_School_District_idx" ON "VoterNH"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterNH_Proposed_Unified_School_District_idx" ON "VoterNH"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterNH_Regional_Office_of_Education_District_idx" ON "VoterNH"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterNH_School_Board_District_idx" ON "VoterNH"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterNH_School_District_idx" ON "VoterNH"("School_District");

-- CreateIndex
CREATE INDEX "VoterNH_School_District_Vocational_idx" ON "VoterNH"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterNH_School_Facilities_Improvement_District_idx" ON "VoterNH"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterNH_School_Subdistrict_idx" ON "VoterNH"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterNH_Service_Area_District_idx" ON "VoterNH"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterNH_Superintendent_of_Schools_District_idx" ON "VoterNH"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterNH_Unified_School_District_idx" ON "VoterNH"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterNH_Unified_School_SubDistrict_idx" ON "VoterNH"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNH_Voters_FirstName_idx" ON "VoterNH"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterNH_Voters_MiddleName_idx" ON "VoterNH"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterNH_Voters_LastName_idx" ON "VoterNH"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterNH_Voters_Active_idx" ON "VoterNH"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterNH_MilitaryStatus_Description_idx" ON "VoterNH"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterNH_Voters_Age_idx" ON "VoterNH"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterNH_Parties_Description_idx" ON "VoterNH"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterNH_VoterParties_Change_Changed_Party_idx" ON "VoterNH"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterNH_Voters_CalculatedRegDate_idx" ON "VoterNH"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterNH_Voters_OfficialRegDate_idx" ON "VoterNH"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterNH_VoterTelephones_CellConfidenceCode_idx" ON "VoterNH"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterNH_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterNH"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterNH_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterNH"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterNH_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterNH"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterNH_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterNH"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterNH_Voters_VotingPerformanceMinorElection_idx" ON "VoterNH"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterNH_General_2022_idx" ON "VoterNH"("General_2022");

-- CreateIndex
CREATE INDEX "VoterNH_Primary_2022_idx" ON "VoterNH"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterNH_OtherElection_2022_idx" ON "VoterNH"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterNH_AnyElection_2021_idx" ON "VoterNH"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterNH_General_2020_idx" ON "VoterNH"("General_2020");

-- CreateIndex
CREATE INDEX "VoterNH_Primary_2020_idx" ON "VoterNH"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterNH_PresidentialPrimary_2020_idx" ON "VoterNH"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterNH_OtherElection_2020_idx" ON "VoterNH"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterNH_AnyElection_2019_idx" ON "VoterNH"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterNH_General_2018_idx" ON "VoterNH"("General_2018");

-- CreateIndex
CREATE INDEX "VoterNH_Primary_2018_idx" ON "VoterNH"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterNH_OtherElection_2018_idx" ON "VoterNH"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterNH_AnyElection_2017_idx" ON "VoterNH"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterNH_General_2016_idx" ON "VoterNH"("General_2016");

-- CreateIndex
CREATE INDEX "VoterNH_Primary_2016_idx" ON "VoterNH"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterNH_PresidentialPrimary_2016_idx" ON "VoterNH"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterNH_OtherElection_2016_idx" ON "VoterNH"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterNJ_LALVOTERID_key" ON "VoterNJ"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterNJ_US_Congressional_District_idx" ON "VoterNJ"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterNJ_State_Senate_District_idx" ON "VoterNJ"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterNJ_State_House_District_idx" ON "VoterNJ"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterNJ_County_Legislative_District_idx" ON "VoterNJ"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterNJ_City_idx" ON "VoterNJ"("City");

-- CreateIndex
CREATE INDEX "VoterNJ_County_idx" ON "VoterNJ"("County");

-- CreateIndex
CREATE INDEX "VoterNJ_City_Council_Commissioner_District_idx" ON "VoterNJ"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterNJ_City_Mayoral_District_idx" ON "VoterNJ"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterNJ_Town_District_idx" ON "VoterNJ"("Town_District");

-- CreateIndex
CREATE INDEX "VoterNJ_Town_Council_idx" ON "VoterNJ"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterNJ_Village_idx" ON "VoterNJ"("Village");

-- CreateIndex
CREATE INDEX "VoterNJ_Township_idx" ON "VoterNJ"("Township");

-- CreateIndex
CREATE INDEX "VoterNJ_Borough_idx" ON "VoterNJ"("Borough");

-- CreateIndex
CREATE INDEX "VoterNJ_Hamlet_Community_Area_idx" ON "VoterNJ"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterNJ_Board_of_Education_District_idx" ON "VoterNJ"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterNJ_Board_of_Education_SubDistrict_idx" ON "VoterNJ"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNJ_City_School_District_idx" ON "VoterNJ"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterNJ_College_Board_District_idx" ON "VoterNJ"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterNJ_Community_College_Commissioner_District_idx" ON "VoterNJ"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterNJ_Community_College_SubDistrict_idx" ON "VoterNJ"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNJ_County_Board_of_Education_District_idx" ON "VoterNJ"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterNJ_County_Board_of_Education_SubDistrict_idx" ON "VoterNJ"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNJ_County_Community_College_District_idx" ON "VoterNJ"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterNJ_County_Superintendent_of_Schools_District_idx" ON "VoterNJ"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterNJ_County_Unified_School_District_idx" ON "VoterNJ"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterNJ_District_Attorney_idx" ON "VoterNJ"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterNJ_Education_Commission_District_idx" ON "VoterNJ"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterNJ_Educational_Service_District_idx" ON "VoterNJ"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterNJ_Election_Commissioner_District_idx" ON "VoterNJ"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterNJ_Elementary_School_District_idx" ON "VoterNJ"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterNJ_Elementary_School_SubDistrict_idx" ON "VoterNJ"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNJ_Exempted_Village_School_District_idx" ON "VoterNJ"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterNJ_High_School_District_idx" ON "VoterNJ"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterNJ_High_School_SubDistrict_idx" ON "VoterNJ"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNJ_Judicial_Appellate_District_idx" ON "VoterNJ"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterNJ_Judicial_Circuit_Court_District_idx" ON "VoterNJ"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterNJ_Judicial_County_Board_of_Review_District_idx" ON "VoterNJ"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterNJ_Judicial_County_Court_District_idx" ON "VoterNJ"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterNJ_Judicial_District_idx" ON "VoterNJ"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterNJ_Judicial_District_Court_District_idx" ON "VoterNJ"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterNJ_Judicial_Family_Court_District_idx" ON "VoterNJ"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterNJ_Judicial_Jury_District_idx" ON "VoterNJ"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterNJ_Judicial_Juvenile_Court_District_idx" ON "VoterNJ"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterNJ_Judicial_Magistrate_Division_idx" ON "VoterNJ"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterNJ_Judicial_Sub_Circuit_District_idx" ON "VoterNJ"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterNJ_Judicial_Superior_Court_District_idx" ON "VoterNJ"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterNJ_Judicial_Supreme_Court_District_idx" ON "VoterNJ"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterNJ_Middle_School_District_idx" ON "VoterNJ"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterNJ_Municipal_Court_District_idx" ON "VoterNJ"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterNJ_Proposed_City_Commissioner_District_idx" ON "VoterNJ"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterNJ_Proposed_Elementary_School_District_idx" ON "VoterNJ"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterNJ_Proposed_Unified_School_District_idx" ON "VoterNJ"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterNJ_Regional_Office_of_Education_District_idx" ON "VoterNJ"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterNJ_School_Board_District_idx" ON "VoterNJ"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterNJ_School_District_idx" ON "VoterNJ"("School_District");

-- CreateIndex
CREATE INDEX "VoterNJ_School_District_Vocational_idx" ON "VoterNJ"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterNJ_School_Facilities_Improvement_District_idx" ON "VoterNJ"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterNJ_School_Subdistrict_idx" ON "VoterNJ"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterNJ_Service_Area_District_idx" ON "VoterNJ"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterNJ_Superintendent_of_Schools_District_idx" ON "VoterNJ"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterNJ_Unified_School_District_idx" ON "VoterNJ"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterNJ_Unified_School_SubDistrict_idx" ON "VoterNJ"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNJ_Voters_FirstName_idx" ON "VoterNJ"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterNJ_Voters_MiddleName_idx" ON "VoterNJ"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterNJ_Voters_LastName_idx" ON "VoterNJ"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterNJ_Voters_Active_idx" ON "VoterNJ"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterNJ_MilitaryStatus_Description_idx" ON "VoterNJ"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterNJ_Voters_Age_idx" ON "VoterNJ"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterNJ_Parties_Description_idx" ON "VoterNJ"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterNJ_VoterParties_Change_Changed_Party_idx" ON "VoterNJ"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterNJ_Voters_CalculatedRegDate_idx" ON "VoterNJ"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterNJ_Voters_OfficialRegDate_idx" ON "VoterNJ"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterNJ_VoterTelephones_CellConfidenceCode_idx" ON "VoterNJ"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterNJ_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterNJ"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterNJ_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterNJ"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterNJ_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterNJ"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterNJ_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterNJ"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterNJ_Voters_VotingPerformanceMinorElection_idx" ON "VoterNJ"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterNJ_General_2022_idx" ON "VoterNJ"("General_2022");

-- CreateIndex
CREATE INDEX "VoterNJ_Primary_2022_idx" ON "VoterNJ"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterNJ_OtherElection_2022_idx" ON "VoterNJ"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterNJ_AnyElection_2021_idx" ON "VoterNJ"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterNJ_General_2020_idx" ON "VoterNJ"("General_2020");

-- CreateIndex
CREATE INDEX "VoterNJ_Primary_2020_idx" ON "VoterNJ"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterNJ_PresidentialPrimary_2020_idx" ON "VoterNJ"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterNJ_OtherElection_2020_idx" ON "VoterNJ"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterNJ_AnyElection_2019_idx" ON "VoterNJ"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterNJ_General_2018_idx" ON "VoterNJ"("General_2018");

-- CreateIndex
CREATE INDEX "VoterNJ_Primary_2018_idx" ON "VoterNJ"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterNJ_OtherElection_2018_idx" ON "VoterNJ"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterNJ_AnyElection_2017_idx" ON "VoterNJ"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterNJ_General_2016_idx" ON "VoterNJ"("General_2016");

-- CreateIndex
CREATE INDEX "VoterNJ_Primary_2016_idx" ON "VoterNJ"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterNJ_PresidentialPrimary_2016_idx" ON "VoterNJ"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterNJ_OtherElection_2016_idx" ON "VoterNJ"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterNM_LALVOTERID_key" ON "VoterNM"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterNM_US_Congressional_District_idx" ON "VoterNM"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterNM_State_Senate_District_idx" ON "VoterNM"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterNM_State_House_District_idx" ON "VoterNM"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterNM_County_Legislative_District_idx" ON "VoterNM"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterNM_City_idx" ON "VoterNM"("City");

-- CreateIndex
CREATE INDEX "VoterNM_County_idx" ON "VoterNM"("County");

-- CreateIndex
CREATE INDEX "VoterNM_City_Council_Commissioner_District_idx" ON "VoterNM"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterNM_City_Mayoral_District_idx" ON "VoterNM"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterNM_Town_District_idx" ON "VoterNM"("Town_District");

-- CreateIndex
CREATE INDEX "VoterNM_Town_Council_idx" ON "VoterNM"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterNM_Village_idx" ON "VoterNM"("Village");

-- CreateIndex
CREATE INDEX "VoterNM_Township_idx" ON "VoterNM"("Township");

-- CreateIndex
CREATE INDEX "VoterNM_Borough_idx" ON "VoterNM"("Borough");

-- CreateIndex
CREATE INDEX "VoterNM_Hamlet_Community_Area_idx" ON "VoterNM"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterNM_Board_of_Education_District_idx" ON "VoterNM"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterNM_Board_of_Education_SubDistrict_idx" ON "VoterNM"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNM_City_School_District_idx" ON "VoterNM"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterNM_College_Board_District_idx" ON "VoterNM"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterNM_Community_College_Commissioner_District_idx" ON "VoterNM"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterNM_Community_College_SubDistrict_idx" ON "VoterNM"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNM_County_Board_of_Education_District_idx" ON "VoterNM"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterNM_County_Board_of_Education_SubDistrict_idx" ON "VoterNM"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNM_County_Community_College_District_idx" ON "VoterNM"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterNM_County_Superintendent_of_Schools_District_idx" ON "VoterNM"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterNM_County_Unified_School_District_idx" ON "VoterNM"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterNM_District_Attorney_idx" ON "VoterNM"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterNM_Education_Commission_District_idx" ON "VoterNM"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterNM_Educational_Service_District_idx" ON "VoterNM"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterNM_Election_Commissioner_District_idx" ON "VoterNM"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterNM_Elementary_School_District_idx" ON "VoterNM"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterNM_Elementary_School_SubDistrict_idx" ON "VoterNM"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNM_Exempted_Village_School_District_idx" ON "VoterNM"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterNM_High_School_District_idx" ON "VoterNM"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterNM_High_School_SubDistrict_idx" ON "VoterNM"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNM_Judicial_Appellate_District_idx" ON "VoterNM"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterNM_Judicial_Circuit_Court_District_idx" ON "VoterNM"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterNM_Judicial_County_Board_of_Review_District_idx" ON "VoterNM"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterNM_Judicial_County_Court_District_idx" ON "VoterNM"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterNM_Judicial_District_idx" ON "VoterNM"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterNM_Judicial_District_Court_District_idx" ON "VoterNM"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterNM_Judicial_Family_Court_District_idx" ON "VoterNM"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterNM_Judicial_Jury_District_idx" ON "VoterNM"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterNM_Judicial_Juvenile_Court_District_idx" ON "VoterNM"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterNM_Judicial_Magistrate_Division_idx" ON "VoterNM"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterNM_Judicial_Sub_Circuit_District_idx" ON "VoterNM"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterNM_Judicial_Superior_Court_District_idx" ON "VoterNM"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterNM_Judicial_Supreme_Court_District_idx" ON "VoterNM"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterNM_Middle_School_District_idx" ON "VoterNM"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterNM_Municipal_Court_District_idx" ON "VoterNM"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterNM_Proposed_City_Commissioner_District_idx" ON "VoterNM"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterNM_Proposed_Elementary_School_District_idx" ON "VoterNM"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterNM_Proposed_Unified_School_District_idx" ON "VoterNM"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterNM_Regional_Office_of_Education_District_idx" ON "VoterNM"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterNM_School_Board_District_idx" ON "VoterNM"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterNM_School_District_idx" ON "VoterNM"("School_District");

-- CreateIndex
CREATE INDEX "VoterNM_School_District_Vocational_idx" ON "VoterNM"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterNM_School_Facilities_Improvement_District_idx" ON "VoterNM"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterNM_School_Subdistrict_idx" ON "VoterNM"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterNM_Service_Area_District_idx" ON "VoterNM"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterNM_Superintendent_of_Schools_District_idx" ON "VoterNM"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterNM_Unified_School_District_idx" ON "VoterNM"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterNM_Unified_School_SubDistrict_idx" ON "VoterNM"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNM_Voters_FirstName_idx" ON "VoterNM"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterNM_Voters_MiddleName_idx" ON "VoterNM"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterNM_Voters_LastName_idx" ON "VoterNM"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterNM_Voters_Active_idx" ON "VoterNM"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterNM_MilitaryStatus_Description_idx" ON "VoterNM"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterNM_Voters_Age_idx" ON "VoterNM"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterNM_Parties_Description_idx" ON "VoterNM"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterNM_VoterParties_Change_Changed_Party_idx" ON "VoterNM"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterNM_Voters_CalculatedRegDate_idx" ON "VoterNM"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterNM_Voters_OfficialRegDate_idx" ON "VoterNM"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterNM_VoterTelephones_CellConfidenceCode_idx" ON "VoterNM"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterNM_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterNM"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterNM_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterNM"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterNM_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterNM"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterNM_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterNM"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterNM_Voters_VotingPerformanceMinorElection_idx" ON "VoterNM"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterNM_General_2022_idx" ON "VoterNM"("General_2022");

-- CreateIndex
CREATE INDEX "VoterNM_Primary_2022_idx" ON "VoterNM"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterNM_OtherElection_2022_idx" ON "VoterNM"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterNM_AnyElection_2021_idx" ON "VoterNM"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterNM_General_2020_idx" ON "VoterNM"("General_2020");

-- CreateIndex
CREATE INDEX "VoterNM_Primary_2020_idx" ON "VoterNM"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterNM_PresidentialPrimary_2020_idx" ON "VoterNM"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterNM_OtherElection_2020_idx" ON "VoterNM"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterNM_AnyElection_2019_idx" ON "VoterNM"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterNM_General_2018_idx" ON "VoterNM"("General_2018");

-- CreateIndex
CREATE INDEX "VoterNM_Primary_2018_idx" ON "VoterNM"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterNM_OtherElection_2018_idx" ON "VoterNM"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterNM_AnyElection_2017_idx" ON "VoterNM"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterNM_General_2016_idx" ON "VoterNM"("General_2016");

-- CreateIndex
CREATE INDEX "VoterNM_Primary_2016_idx" ON "VoterNM"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterNM_PresidentialPrimary_2016_idx" ON "VoterNM"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterNM_OtherElection_2016_idx" ON "VoterNM"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterNY_LALVOTERID_key" ON "VoterNY"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterNY_US_Congressional_District_idx" ON "VoterNY"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterNY_State_Senate_District_idx" ON "VoterNY"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterNY_State_House_District_idx" ON "VoterNY"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterNY_County_Legislative_District_idx" ON "VoterNY"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterNY_City_idx" ON "VoterNY"("City");

-- CreateIndex
CREATE INDEX "VoterNY_County_idx" ON "VoterNY"("County");

-- CreateIndex
CREATE INDEX "VoterNY_City_Council_Commissioner_District_idx" ON "VoterNY"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterNY_City_Mayoral_District_idx" ON "VoterNY"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterNY_Town_District_idx" ON "VoterNY"("Town_District");

-- CreateIndex
CREATE INDEX "VoterNY_Town_Council_idx" ON "VoterNY"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterNY_Village_idx" ON "VoterNY"("Village");

-- CreateIndex
CREATE INDEX "VoterNY_Township_idx" ON "VoterNY"("Township");

-- CreateIndex
CREATE INDEX "VoterNY_Borough_idx" ON "VoterNY"("Borough");

-- CreateIndex
CREATE INDEX "VoterNY_Hamlet_Community_Area_idx" ON "VoterNY"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterNY_Board_of_Education_District_idx" ON "VoterNY"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterNY_Board_of_Education_SubDistrict_idx" ON "VoterNY"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNY_City_School_District_idx" ON "VoterNY"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterNY_College_Board_District_idx" ON "VoterNY"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterNY_Community_College_Commissioner_District_idx" ON "VoterNY"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterNY_Community_College_SubDistrict_idx" ON "VoterNY"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNY_County_Board_of_Education_District_idx" ON "VoterNY"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterNY_County_Board_of_Education_SubDistrict_idx" ON "VoterNY"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNY_County_Community_College_District_idx" ON "VoterNY"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterNY_County_Superintendent_of_Schools_District_idx" ON "VoterNY"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterNY_County_Unified_School_District_idx" ON "VoterNY"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterNY_District_Attorney_idx" ON "VoterNY"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterNY_Education_Commission_District_idx" ON "VoterNY"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterNY_Educational_Service_District_idx" ON "VoterNY"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterNY_Election_Commissioner_District_idx" ON "VoterNY"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterNY_Elementary_School_District_idx" ON "VoterNY"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterNY_Elementary_School_SubDistrict_idx" ON "VoterNY"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNY_Exempted_Village_School_District_idx" ON "VoterNY"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterNY_High_School_District_idx" ON "VoterNY"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterNY_High_School_SubDistrict_idx" ON "VoterNY"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNY_Judicial_Appellate_District_idx" ON "VoterNY"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterNY_Judicial_Circuit_Court_District_idx" ON "VoterNY"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterNY_Judicial_County_Board_of_Review_District_idx" ON "VoterNY"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterNY_Judicial_County_Court_District_idx" ON "VoterNY"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterNY_Judicial_District_idx" ON "VoterNY"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterNY_Judicial_District_Court_District_idx" ON "VoterNY"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterNY_Judicial_Family_Court_District_idx" ON "VoterNY"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterNY_Judicial_Jury_District_idx" ON "VoterNY"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterNY_Judicial_Juvenile_Court_District_idx" ON "VoterNY"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterNY_Judicial_Magistrate_Division_idx" ON "VoterNY"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterNY_Judicial_Sub_Circuit_District_idx" ON "VoterNY"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterNY_Judicial_Superior_Court_District_idx" ON "VoterNY"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterNY_Judicial_Supreme_Court_District_idx" ON "VoterNY"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterNY_Middle_School_District_idx" ON "VoterNY"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterNY_Municipal_Court_District_idx" ON "VoterNY"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterNY_Proposed_City_Commissioner_District_idx" ON "VoterNY"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterNY_Proposed_Elementary_School_District_idx" ON "VoterNY"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterNY_Proposed_Unified_School_District_idx" ON "VoterNY"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterNY_Regional_Office_of_Education_District_idx" ON "VoterNY"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterNY_School_Board_District_idx" ON "VoterNY"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterNY_School_District_idx" ON "VoterNY"("School_District");

-- CreateIndex
CREATE INDEX "VoterNY_School_District_Vocational_idx" ON "VoterNY"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterNY_School_Facilities_Improvement_District_idx" ON "VoterNY"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterNY_School_Subdistrict_idx" ON "VoterNY"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterNY_Service_Area_District_idx" ON "VoterNY"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterNY_Superintendent_of_Schools_District_idx" ON "VoterNY"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterNY_Unified_School_District_idx" ON "VoterNY"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterNY_Unified_School_SubDistrict_idx" ON "VoterNY"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNY_Voters_FirstName_idx" ON "VoterNY"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterNY_Voters_MiddleName_idx" ON "VoterNY"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterNY_Voters_LastName_idx" ON "VoterNY"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterNY_Voters_Active_idx" ON "VoterNY"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterNY_MilitaryStatus_Description_idx" ON "VoterNY"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterNY_Voters_Age_idx" ON "VoterNY"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterNY_Parties_Description_idx" ON "VoterNY"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterNY_VoterParties_Change_Changed_Party_idx" ON "VoterNY"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterNY_Voters_CalculatedRegDate_idx" ON "VoterNY"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterNY_Voters_OfficialRegDate_idx" ON "VoterNY"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterNY_VoterTelephones_CellConfidenceCode_idx" ON "VoterNY"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterNY_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterNY"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterNY_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterNY"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterNY_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterNY"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterNY_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterNY"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterNY_Voters_VotingPerformanceMinorElection_idx" ON "VoterNY"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterNY_General_2022_idx" ON "VoterNY"("General_2022");

-- CreateIndex
CREATE INDEX "VoterNY_Primary_2022_idx" ON "VoterNY"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterNY_OtherElection_2022_idx" ON "VoterNY"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterNY_AnyElection_2021_idx" ON "VoterNY"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterNY_General_2020_idx" ON "VoterNY"("General_2020");

-- CreateIndex
CREATE INDEX "VoterNY_Primary_2020_idx" ON "VoterNY"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterNY_PresidentialPrimary_2020_idx" ON "VoterNY"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterNY_OtherElection_2020_idx" ON "VoterNY"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterNY_AnyElection_2019_idx" ON "VoterNY"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterNY_General_2018_idx" ON "VoterNY"("General_2018");

-- CreateIndex
CREATE INDEX "VoterNY_Primary_2018_idx" ON "VoterNY"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterNY_OtherElection_2018_idx" ON "VoterNY"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterNY_AnyElection_2017_idx" ON "VoterNY"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterNY_General_2016_idx" ON "VoterNY"("General_2016");

-- CreateIndex
CREATE INDEX "VoterNY_Primary_2016_idx" ON "VoterNY"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterNY_PresidentialPrimary_2016_idx" ON "VoterNY"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterNY_OtherElection_2016_idx" ON "VoterNY"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterNC_LALVOTERID_key" ON "VoterNC"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterNC_US_Congressional_District_idx" ON "VoterNC"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterNC_State_Senate_District_idx" ON "VoterNC"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterNC_State_House_District_idx" ON "VoterNC"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterNC_County_Legislative_District_idx" ON "VoterNC"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterNC_City_idx" ON "VoterNC"("City");

-- CreateIndex
CREATE INDEX "VoterNC_County_idx" ON "VoterNC"("County");

-- CreateIndex
CREATE INDEX "VoterNC_City_Council_Commissioner_District_idx" ON "VoterNC"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterNC_City_Mayoral_District_idx" ON "VoterNC"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterNC_Town_District_idx" ON "VoterNC"("Town_District");

-- CreateIndex
CREATE INDEX "VoterNC_Town_Council_idx" ON "VoterNC"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterNC_Village_idx" ON "VoterNC"("Village");

-- CreateIndex
CREATE INDEX "VoterNC_Township_idx" ON "VoterNC"("Township");

-- CreateIndex
CREATE INDEX "VoterNC_Borough_idx" ON "VoterNC"("Borough");

-- CreateIndex
CREATE INDEX "VoterNC_Hamlet_Community_Area_idx" ON "VoterNC"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterNC_Board_of_Education_District_idx" ON "VoterNC"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterNC_Board_of_Education_SubDistrict_idx" ON "VoterNC"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNC_City_School_District_idx" ON "VoterNC"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterNC_College_Board_District_idx" ON "VoterNC"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterNC_Community_College_Commissioner_District_idx" ON "VoterNC"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterNC_Community_College_SubDistrict_idx" ON "VoterNC"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNC_County_Board_of_Education_District_idx" ON "VoterNC"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterNC_County_Board_of_Education_SubDistrict_idx" ON "VoterNC"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNC_County_Community_College_District_idx" ON "VoterNC"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterNC_County_Superintendent_of_Schools_District_idx" ON "VoterNC"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterNC_County_Unified_School_District_idx" ON "VoterNC"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterNC_District_Attorney_idx" ON "VoterNC"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterNC_Education_Commission_District_idx" ON "VoterNC"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterNC_Educational_Service_District_idx" ON "VoterNC"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterNC_Election_Commissioner_District_idx" ON "VoterNC"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterNC_Elementary_School_District_idx" ON "VoterNC"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterNC_Elementary_School_SubDistrict_idx" ON "VoterNC"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNC_Exempted_Village_School_District_idx" ON "VoterNC"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterNC_High_School_District_idx" ON "VoterNC"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterNC_High_School_SubDistrict_idx" ON "VoterNC"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNC_Judicial_Appellate_District_idx" ON "VoterNC"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterNC_Judicial_Circuit_Court_District_idx" ON "VoterNC"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterNC_Judicial_County_Board_of_Review_District_idx" ON "VoterNC"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterNC_Judicial_County_Court_District_idx" ON "VoterNC"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterNC_Judicial_District_idx" ON "VoterNC"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterNC_Judicial_District_Court_District_idx" ON "VoterNC"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterNC_Judicial_Family_Court_District_idx" ON "VoterNC"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterNC_Judicial_Jury_District_idx" ON "VoterNC"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterNC_Judicial_Juvenile_Court_District_idx" ON "VoterNC"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterNC_Judicial_Magistrate_Division_idx" ON "VoterNC"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterNC_Judicial_Sub_Circuit_District_idx" ON "VoterNC"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterNC_Judicial_Superior_Court_District_idx" ON "VoterNC"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterNC_Judicial_Supreme_Court_District_idx" ON "VoterNC"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterNC_Middle_School_District_idx" ON "VoterNC"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterNC_Municipal_Court_District_idx" ON "VoterNC"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterNC_Proposed_City_Commissioner_District_idx" ON "VoterNC"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterNC_Proposed_Elementary_School_District_idx" ON "VoterNC"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterNC_Proposed_Unified_School_District_idx" ON "VoterNC"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterNC_Regional_Office_of_Education_District_idx" ON "VoterNC"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterNC_School_Board_District_idx" ON "VoterNC"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterNC_School_District_idx" ON "VoterNC"("School_District");

-- CreateIndex
CREATE INDEX "VoterNC_School_District_Vocational_idx" ON "VoterNC"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterNC_School_Facilities_Improvement_District_idx" ON "VoterNC"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterNC_School_Subdistrict_idx" ON "VoterNC"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterNC_Service_Area_District_idx" ON "VoterNC"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterNC_Superintendent_of_Schools_District_idx" ON "VoterNC"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterNC_Unified_School_District_idx" ON "VoterNC"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterNC_Unified_School_SubDistrict_idx" ON "VoterNC"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterNC_Voters_FirstName_idx" ON "VoterNC"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterNC_Voters_MiddleName_idx" ON "VoterNC"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterNC_Voters_LastName_idx" ON "VoterNC"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterNC_Voters_Active_idx" ON "VoterNC"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterNC_MilitaryStatus_Description_idx" ON "VoterNC"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterNC_Voters_Age_idx" ON "VoterNC"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterNC_Parties_Description_idx" ON "VoterNC"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterNC_VoterParties_Change_Changed_Party_idx" ON "VoterNC"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterNC_Voters_CalculatedRegDate_idx" ON "VoterNC"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterNC_Voters_OfficialRegDate_idx" ON "VoterNC"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterNC_VoterTelephones_CellConfidenceCode_idx" ON "VoterNC"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterNC_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterNC"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterNC_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterNC"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterNC_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterNC"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterNC_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterNC"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterNC_Voters_VotingPerformanceMinorElection_idx" ON "VoterNC"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterNC_General_2022_idx" ON "VoterNC"("General_2022");

-- CreateIndex
CREATE INDEX "VoterNC_Primary_2022_idx" ON "VoterNC"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterNC_OtherElection_2022_idx" ON "VoterNC"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterNC_AnyElection_2021_idx" ON "VoterNC"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterNC_General_2020_idx" ON "VoterNC"("General_2020");

-- CreateIndex
CREATE INDEX "VoterNC_Primary_2020_idx" ON "VoterNC"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterNC_PresidentialPrimary_2020_idx" ON "VoterNC"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterNC_OtherElection_2020_idx" ON "VoterNC"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterNC_AnyElection_2019_idx" ON "VoterNC"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterNC_General_2018_idx" ON "VoterNC"("General_2018");

-- CreateIndex
CREATE INDEX "VoterNC_Primary_2018_idx" ON "VoterNC"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterNC_OtherElection_2018_idx" ON "VoterNC"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterNC_AnyElection_2017_idx" ON "VoterNC"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterNC_General_2016_idx" ON "VoterNC"("General_2016");

-- CreateIndex
CREATE INDEX "VoterNC_Primary_2016_idx" ON "VoterNC"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterNC_PresidentialPrimary_2016_idx" ON "VoterNC"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterNC_OtherElection_2016_idx" ON "VoterNC"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterND_LALVOTERID_key" ON "VoterND"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterND_US_Congressional_District_idx" ON "VoterND"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterND_State_Senate_District_idx" ON "VoterND"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterND_State_House_District_idx" ON "VoterND"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterND_County_Legislative_District_idx" ON "VoterND"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterND_City_idx" ON "VoterND"("City");

-- CreateIndex
CREATE INDEX "VoterND_County_idx" ON "VoterND"("County");

-- CreateIndex
CREATE INDEX "VoterND_City_Council_Commissioner_District_idx" ON "VoterND"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterND_City_Mayoral_District_idx" ON "VoterND"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterND_Town_District_idx" ON "VoterND"("Town_District");

-- CreateIndex
CREATE INDEX "VoterND_Town_Council_idx" ON "VoterND"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterND_Village_idx" ON "VoterND"("Village");

-- CreateIndex
CREATE INDEX "VoterND_Township_idx" ON "VoterND"("Township");

-- CreateIndex
CREATE INDEX "VoterND_Borough_idx" ON "VoterND"("Borough");

-- CreateIndex
CREATE INDEX "VoterND_Hamlet_Community_Area_idx" ON "VoterND"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterND_Board_of_Education_District_idx" ON "VoterND"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterND_Board_of_Education_SubDistrict_idx" ON "VoterND"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterND_City_School_District_idx" ON "VoterND"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterND_College_Board_District_idx" ON "VoterND"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterND_Community_College_Commissioner_District_idx" ON "VoterND"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterND_Community_College_SubDistrict_idx" ON "VoterND"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterND_County_Board_of_Education_District_idx" ON "VoterND"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterND_County_Board_of_Education_SubDistrict_idx" ON "VoterND"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterND_County_Community_College_District_idx" ON "VoterND"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterND_County_Superintendent_of_Schools_District_idx" ON "VoterND"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterND_County_Unified_School_District_idx" ON "VoterND"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterND_District_Attorney_idx" ON "VoterND"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterND_Education_Commission_District_idx" ON "VoterND"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterND_Educational_Service_District_idx" ON "VoterND"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterND_Election_Commissioner_District_idx" ON "VoterND"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterND_Elementary_School_District_idx" ON "VoterND"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterND_Elementary_School_SubDistrict_idx" ON "VoterND"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterND_Exempted_Village_School_District_idx" ON "VoterND"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterND_High_School_District_idx" ON "VoterND"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterND_High_School_SubDistrict_idx" ON "VoterND"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterND_Judicial_Appellate_District_idx" ON "VoterND"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterND_Judicial_Circuit_Court_District_idx" ON "VoterND"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterND_Judicial_County_Board_of_Review_District_idx" ON "VoterND"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterND_Judicial_County_Court_District_idx" ON "VoterND"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterND_Judicial_District_idx" ON "VoterND"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterND_Judicial_District_Court_District_idx" ON "VoterND"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterND_Judicial_Family_Court_District_idx" ON "VoterND"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterND_Judicial_Jury_District_idx" ON "VoterND"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterND_Judicial_Juvenile_Court_District_idx" ON "VoterND"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterND_Judicial_Magistrate_Division_idx" ON "VoterND"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterND_Judicial_Sub_Circuit_District_idx" ON "VoterND"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterND_Judicial_Superior_Court_District_idx" ON "VoterND"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterND_Judicial_Supreme_Court_District_idx" ON "VoterND"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterND_Middle_School_District_idx" ON "VoterND"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterND_Municipal_Court_District_idx" ON "VoterND"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterND_Proposed_City_Commissioner_District_idx" ON "VoterND"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterND_Proposed_Elementary_School_District_idx" ON "VoterND"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterND_Proposed_Unified_School_District_idx" ON "VoterND"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterND_Regional_Office_of_Education_District_idx" ON "VoterND"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterND_School_Board_District_idx" ON "VoterND"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterND_School_District_idx" ON "VoterND"("School_District");

-- CreateIndex
CREATE INDEX "VoterND_School_District_Vocational_idx" ON "VoterND"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterND_School_Facilities_Improvement_District_idx" ON "VoterND"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterND_School_Subdistrict_idx" ON "VoterND"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterND_Service_Area_District_idx" ON "VoterND"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterND_Superintendent_of_Schools_District_idx" ON "VoterND"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterND_Unified_School_District_idx" ON "VoterND"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterND_Unified_School_SubDistrict_idx" ON "VoterND"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterND_Voters_FirstName_idx" ON "VoterND"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterND_Voters_MiddleName_idx" ON "VoterND"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterND_Voters_LastName_idx" ON "VoterND"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterND_Voters_Active_idx" ON "VoterND"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterND_MilitaryStatus_Description_idx" ON "VoterND"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterND_Voters_Age_idx" ON "VoterND"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterND_Parties_Description_idx" ON "VoterND"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterND_VoterParties_Change_Changed_Party_idx" ON "VoterND"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterND_Voters_CalculatedRegDate_idx" ON "VoterND"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterND_Voters_OfficialRegDate_idx" ON "VoterND"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterND_VoterTelephones_CellConfidenceCode_idx" ON "VoterND"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterND_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterND"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterND_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterND"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterND_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterND"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterND_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterND"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterND_Voters_VotingPerformanceMinorElection_idx" ON "VoterND"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterND_General_2022_idx" ON "VoterND"("General_2022");

-- CreateIndex
CREATE INDEX "VoterND_Primary_2022_idx" ON "VoterND"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterND_OtherElection_2022_idx" ON "VoterND"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterND_AnyElection_2021_idx" ON "VoterND"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterND_General_2020_idx" ON "VoterND"("General_2020");

-- CreateIndex
CREATE INDEX "VoterND_Primary_2020_idx" ON "VoterND"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterND_PresidentialPrimary_2020_idx" ON "VoterND"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterND_OtherElection_2020_idx" ON "VoterND"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterND_AnyElection_2019_idx" ON "VoterND"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterND_General_2018_idx" ON "VoterND"("General_2018");

-- CreateIndex
CREATE INDEX "VoterND_Primary_2018_idx" ON "VoterND"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterND_OtherElection_2018_idx" ON "VoterND"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterND_AnyElection_2017_idx" ON "VoterND"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterND_General_2016_idx" ON "VoterND"("General_2016");

-- CreateIndex
CREATE INDEX "VoterND_Primary_2016_idx" ON "VoterND"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterND_PresidentialPrimary_2016_idx" ON "VoterND"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterND_OtherElection_2016_idx" ON "VoterND"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterOH_LALVOTERID_key" ON "VoterOH"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterOH_US_Congressional_District_idx" ON "VoterOH"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterOH_State_Senate_District_idx" ON "VoterOH"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterOH_State_House_District_idx" ON "VoterOH"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterOH_County_Legislative_District_idx" ON "VoterOH"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterOH_City_idx" ON "VoterOH"("City");

-- CreateIndex
CREATE INDEX "VoterOH_County_idx" ON "VoterOH"("County");

-- CreateIndex
CREATE INDEX "VoterOH_City_Council_Commissioner_District_idx" ON "VoterOH"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterOH_City_Mayoral_District_idx" ON "VoterOH"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterOH_Town_District_idx" ON "VoterOH"("Town_District");

-- CreateIndex
CREATE INDEX "VoterOH_Town_Council_idx" ON "VoterOH"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterOH_Village_idx" ON "VoterOH"("Village");

-- CreateIndex
CREATE INDEX "VoterOH_Township_idx" ON "VoterOH"("Township");

-- CreateIndex
CREATE INDEX "VoterOH_Borough_idx" ON "VoterOH"("Borough");

-- CreateIndex
CREATE INDEX "VoterOH_Hamlet_Community_Area_idx" ON "VoterOH"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterOH_Board_of_Education_District_idx" ON "VoterOH"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterOH_Board_of_Education_SubDistrict_idx" ON "VoterOH"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterOH_City_School_District_idx" ON "VoterOH"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterOH_College_Board_District_idx" ON "VoterOH"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterOH_Community_College_Commissioner_District_idx" ON "VoterOH"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterOH_Community_College_SubDistrict_idx" ON "VoterOH"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterOH_County_Board_of_Education_District_idx" ON "VoterOH"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterOH_County_Board_of_Education_SubDistrict_idx" ON "VoterOH"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterOH_County_Community_College_District_idx" ON "VoterOH"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterOH_County_Superintendent_of_Schools_District_idx" ON "VoterOH"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterOH_County_Unified_School_District_idx" ON "VoterOH"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterOH_District_Attorney_idx" ON "VoterOH"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterOH_Education_Commission_District_idx" ON "VoterOH"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterOH_Educational_Service_District_idx" ON "VoterOH"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterOH_Election_Commissioner_District_idx" ON "VoterOH"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterOH_Elementary_School_District_idx" ON "VoterOH"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterOH_Elementary_School_SubDistrict_idx" ON "VoterOH"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterOH_Exempted_Village_School_District_idx" ON "VoterOH"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterOH_High_School_District_idx" ON "VoterOH"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterOH_High_School_SubDistrict_idx" ON "VoterOH"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterOH_Judicial_Appellate_District_idx" ON "VoterOH"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterOH_Judicial_Circuit_Court_District_idx" ON "VoterOH"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterOH_Judicial_County_Board_of_Review_District_idx" ON "VoterOH"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterOH_Judicial_County_Court_District_idx" ON "VoterOH"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterOH_Judicial_District_idx" ON "VoterOH"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterOH_Judicial_District_Court_District_idx" ON "VoterOH"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterOH_Judicial_Family_Court_District_idx" ON "VoterOH"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterOH_Judicial_Jury_District_idx" ON "VoterOH"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterOH_Judicial_Juvenile_Court_District_idx" ON "VoterOH"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterOH_Judicial_Magistrate_Division_idx" ON "VoterOH"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterOH_Judicial_Sub_Circuit_District_idx" ON "VoterOH"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterOH_Judicial_Superior_Court_District_idx" ON "VoterOH"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterOH_Judicial_Supreme_Court_District_idx" ON "VoterOH"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterOH_Middle_School_District_idx" ON "VoterOH"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterOH_Municipal_Court_District_idx" ON "VoterOH"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterOH_Proposed_City_Commissioner_District_idx" ON "VoterOH"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterOH_Proposed_Elementary_School_District_idx" ON "VoterOH"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterOH_Proposed_Unified_School_District_idx" ON "VoterOH"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterOH_Regional_Office_of_Education_District_idx" ON "VoterOH"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterOH_School_Board_District_idx" ON "VoterOH"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterOH_School_District_idx" ON "VoterOH"("School_District");

-- CreateIndex
CREATE INDEX "VoterOH_School_District_Vocational_idx" ON "VoterOH"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterOH_School_Facilities_Improvement_District_idx" ON "VoterOH"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterOH_School_Subdistrict_idx" ON "VoterOH"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterOH_Service_Area_District_idx" ON "VoterOH"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterOH_Superintendent_of_Schools_District_idx" ON "VoterOH"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterOH_Unified_School_District_idx" ON "VoterOH"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterOH_Unified_School_SubDistrict_idx" ON "VoterOH"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterOH_Voters_FirstName_idx" ON "VoterOH"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterOH_Voters_MiddleName_idx" ON "VoterOH"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterOH_Voters_LastName_idx" ON "VoterOH"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterOH_Voters_Active_idx" ON "VoterOH"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterOH_MilitaryStatus_Description_idx" ON "VoterOH"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterOH_Voters_Age_idx" ON "VoterOH"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterOH_Parties_Description_idx" ON "VoterOH"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterOH_VoterParties_Change_Changed_Party_idx" ON "VoterOH"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterOH_Voters_CalculatedRegDate_idx" ON "VoterOH"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterOH_Voters_OfficialRegDate_idx" ON "VoterOH"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterOH_VoterTelephones_CellConfidenceCode_idx" ON "VoterOH"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterOH_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterOH"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterOH_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterOH"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterOH_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterOH"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterOH_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterOH"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterOH_Voters_VotingPerformanceMinorElection_idx" ON "VoterOH"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterOH_General_2022_idx" ON "VoterOH"("General_2022");

-- CreateIndex
CREATE INDEX "VoterOH_Primary_2022_idx" ON "VoterOH"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterOH_OtherElection_2022_idx" ON "VoterOH"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterOH_AnyElection_2021_idx" ON "VoterOH"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterOH_General_2020_idx" ON "VoterOH"("General_2020");

-- CreateIndex
CREATE INDEX "VoterOH_Primary_2020_idx" ON "VoterOH"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterOH_PresidentialPrimary_2020_idx" ON "VoterOH"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterOH_OtherElection_2020_idx" ON "VoterOH"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterOH_AnyElection_2019_idx" ON "VoterOH"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterOH_General_2018_idx" ON "VoterOH"("General_2018");

-- CreateIndex
CREATE INDEX "VoterOH_Primary_2018_idx" ON "VoterOH"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterOH_OtherElection_2018_idx" ON "VoterOH"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterOH_AnyElection_2017_idx" ON "VoterOH"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterOH_General_2016_idx" ON "VoterOH"("General_2016");

-- CreateIndex
CREATE INDEX "VoterOH_Primary_2016_idx" ON "VoterOH"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterOH_PresidentialPrimary_2016_idx" ON "VoterOH"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterOH_OtherElection_2016_idx" ON "VoterOH"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterOK_LALVOTERID_key" ON "VoterOK"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterOK_US_Congressional_District_idx" ON "VoterOK"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterOK_State_Senate_District_idx" ON "VoterOK"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterOK_State_House_District_idx" ON "VoterOK"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterOK_County_Legislative_District_idx" ON "VoterOK"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterOK_City_idx" ON "VoterOK"("City");

-- CreateIndex
CREATE INDEX "VoterOK_County_idx" ON "VoterOK"("County");

-- CreateIndex
CREATE INDEX "VoterOK_City_Council_Commissioner_District_idx" ON "VoterOK"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterOK_City_Mayoral_District_idx" ON "VoterOK"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterOK_Town_District_idx" ON "VoterOK"("Town_District");

-- CreateIndex
CREATE INDEX "VoterOK_Town_Council_idx" ON "VoterOK"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterOK_Village_idx" ON "VoterOK"("Village");

-- CreateIndex
CREATE INDEX "VoterOK_Township_idx" ON "VoterOK"("Township");

-- CreateIndex
CREATE INDEX "VoterOK_Borough_idx" ON "VoterOK"("Borough");

-- CreateIndex
CREATE INDEX "VoterOK_Hamlet_Community_Area_idx" ON "VoterOK"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterOK_Board_of_Education_District_idx" ON "VoterOK"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterOK_Board_of_Education_SubDistrict_idx" ON "VoterOK"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterOK_City_School_District_idx" ON "VoterOK"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterOK_College_Board_District_idx" ON "VoterOK"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterOK_Community_College_Commissioner_District_idx" ON "VoterOK"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterOK_Community_College_SubDistrict_idx" ON "VoterOK"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterOK_County_Board_of_Education_District_idx" ON "VoterOK"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterOK_County_Board_of_Education_SubDistrict_idx" ON "VoterOK"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterOK_County_Community_College_District_idx" ON "VoterOK"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterOK_County_Superintendent_of_Schools_District_idx" ON "VoterOK"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterOK_County_Unified_School_District_idx" ON "VoterOK"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterOK_District_Attorney_idx" ON "VoterOK"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterOK_Education_Commission_District_idx" ON "VoterOK"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterOK_Educational_Service_District_idx" ON "VoterOK"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterOK_Election_Commissioner_District_idx" ON "VoterOK"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterOK_Elementary_School_District_idx" ON "VoterOK"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterOK_Elementary_School_SubDistrict_idx" ON "VoterOK"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterOK_Exempted_Village_School_District_idx" ON "VoterOK"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterOK_High_School_District_idx" ON "VoterOK"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterOK_High_School_SubDistrict_idx" ON "VoterOK"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterOK_Judicial_Appellate_District_idx" ON "VoterOK"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterOK_Judicial_Circuit_Court_District_idx" ON "VoterOK"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterOK_Judicial_County_Board_of_Review_District_idx" ON "VoterOK"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterOK_Judicial_County_Court_District_idx" ON "VoterOK"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterOK_Judicial_District_idx" ON "VoterOK"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterOK_Judicial_District_Court_District_idx" ON "VoterOK"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterOK_Judicial_Family_Court_District_idx" ON "VoterOK"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterOK_Judicial_Jury_District_idx" ON "VoterOK"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterOK_Judicial_Juvenile_Court_District_idx" ON "VoterOK"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterOK_Judicial_Magistrate_Division_idx" ON "VoterOK"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterOK_Judicial_Sub_Circuit_District_idx" ON "VoterOK"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterOK_Judicial_Superior_Court_District_idx" ON "VoterOK"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterOK_Judicial_Supreme_Court_District_idx" ON "VoterOK"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterOK_Middle_School_District_idx" ON "VoterOK"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterOK_Municipal_Court_District_idx" ON "VoterOK"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterOK_Proposed_City_Commissioner_District_idx" ON "VoterOK"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterOK_Proposed_Elementary_School_District_idx" ON "VoterOK"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterOK_Proposed_Unified_School_District_idx" ON "VoterOK"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterOK_Regional_Office_of_Education_District_idx" ON "VoterOK"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterOK_School_Board_District_idx" ON "VoterOK"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterOK_School_District_idx" ON "VoterOK"("School_District");

-- CreateIndex
CREATE INDEX "VoterOK_School_District_Vocational_idx" ON "VoterOK"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterOK_School_Facilities_Improvement_District_idx" ON "VoterOK"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterOK_School_Subdistrict_idx" ON "VoterOK"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterOK_Service_Area_District_idx" ON "VoterOK"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterOK_Superintendent_of_Schools_District_idx" ON "VoterOK"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterOK_Unified_School_District_idx" ON "VoterOK"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterOK_Unified_School_SubDistrict_idx" ON "VoterOK"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterOK_Voters_FirstName_idx" ON "VoterOK"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterOK_Voters_MiddleName_idx" ON "VoterOK"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterOK_Voters_LastName_idx" ON "VoterOK"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterOK_Voters_Active_idx" ON "VoterOK"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterOK_MilitaryStatus_Description_idx" ON "VoterOK"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterOK_Voters_Age_idx" ON "VoterOK"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterOK_Parties_Description_idx" ON "VoterOK"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterOK_VoterParties_Change_Changed_Party_idx" ON "VoterOK"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterOK_Voters_CalculatedRegDate_idx" ON "VoterOK"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterOK_Voters_OfficialRegDate_idx" ON "VoterOK"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterOK_VoterTelephones_CellConfidenceCode_idx" ON "VoterOK"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterOK_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterOK"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterOK_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterOK"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterOK_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterOK"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterOK_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterOK"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterOK_Voters_VotingPerformanceMinorElection_idx" ON "VoterOK"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterOK_General_2022_idx" ON "VoterOK"("General_2022");

-- CreateIndex
CREATE INDEX "VoterOK_Primary_2022_idx" ON "VoterOK"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterOK_OtherElection_2022_idx" ON "VoterOK"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterOK_AnyElection_2021_idx" ON "VoterOK"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterOK_General_2020_idx" ON "VoterOK"("General_2020");

-- CreateIndex
CREATE INDEX "VoterOK_Primary_2020_idx" ON "VoterOK"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterOK_PresidentialPrimary_2020_idx" ON "VoterOK"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterOK_OtherElection_2020_idx" ON "VoterOK"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterOK_AnyElection_2019_idx" ON "VoterOK"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterOK_General_2018_idx" ON "VoterOK"("General_2018");

-- CreateIndex
CREATE INDEX "VoterOK_Primary_2018_idx" ON "VoterOK"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterOK_OtherElection_2018_idx" ON "VoterOK"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterOK_AnyElection_2017_idx" ON "VoterOK"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterOK_General_2016_idx" ON "VoterOK"("General_2016");

-- CreateIndex
CREATE INDEX "VoterOK_Primary_2016_idx" ON "VoterOK"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterOK_PresidentialPrimary_2016_idx" ON "VoterOK"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterOK_OtherElection_2016_idx" ON "VoterOK"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterOR_LALVOTERID_key" ON "VoterOR"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterOR_US_Congressional_District_idx" ON "VoterOR"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterOR_State_Senate_District_idx" ON "VoterOR"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterOR_State_House_District_idx" ON "VoterOR"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterOR_County_Legislative_District_idx" ON "VoterOR"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterOR_City_idx" ON "VoterOR"("City");

-- CreateIndex
CREATE INDEX "VoterOR_County_idx" ON "VoterOR"("County");

-- CreateIndex
CREATE INDEX "VoterOR_City_Council_Commissioner_District_idx" ON "VoterOR"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterOR_City_Mayoral_District_idx" ON "VoterOR"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterOR_Town_District_idx" ON "VoterOR"("Town_District");

-- CreateIndex
CREATE INDEX "VoterOR_Town_Council_idx" ON "VoterOR"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterOR_Village_idx" ON "VoterOR"("Village");

-- CreateIndex
CREATE INDEX "VoterOR_Township_idx" ON "VoterOR"("Township");

-- CreateIndex
CREATE INDEX "VoterOR_Borough_idx" ON "VoterOR"("Borough");

-- CreateIndex
CREATE INDEX "VoterOR_Hamlet_Community_Area_idx" ON "VoterOR"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterOR_Board_of_Education_District_idx" ON "VoterOR"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterOR_Board_of_Education_SubDistrict_idx" ON "VoterOR"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterOR_City_School_District_idx" ON "VoterOR"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterOR_College_Board_District_idx" ON "VoterOR"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterOR_Community_College_Commissioner_District_idx" ON "VoterOR"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterOR_Community_College_SubDistrict_idx" ON "VoterOR"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterOR_County_Board_of_Education_District_idx" ON "VoterOR"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterOR_County_Board_of_Education_SubDistrict_idx" ON "VoterOR"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterOR_County_Community_College_District_idx" ON "VoterOR"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterOR_County_Superintendent_of_Schools_District_idx" ON "VoterOR"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterOR_County_Unified_School_District_idx" ON "VoterOR"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterOR_District_Attorney_idx" ON "VoterOR"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterOR_Education_Commission_District_idx" ON "VoterOR"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterOR_Educational_Service_District_idx" ON "VoterOR"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterOR_Election_Commissioner_District_idx" ON "VoterOR"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterOR_Elementary_School_District_idx" ON "VoterOR"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterOR_Elementary_School_SubDistrict_idx" ON "VoterOR"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterOR_Exempted_Village_School_District_idx" ON "VoterOR"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterOR_High_School_District_idx" ON "VoterOR"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterOR_High_School_SubDistrict_idx" ON "VoterOR"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterOR_Judicial_Appellate_District_idx" ON "VoterOR"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterOR_Judicial_Circuit_Court_District_idx" ON "VoterOR"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterOR_Judicial_County_Board_of_Review_District_idx" ON "VoterOR"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterOR_Judicial_County_Court_District_idx" ON "VoterOR"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterOR_Judicial_District_idx" ON "VoterOR"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterOR_Judicial_District_Court_District_idx" ON "VoterOR"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterOR_Judicial_Family_Court_District_idx" ON "VoterOR"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterOR_Judicial_Jury_District_idx" ON "VoterOR"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterOR_Judicial_Juvenile_Court_District_idx" ON "VoterOR"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterOR_Judicial_Magistrate_Division_idx" ON "VoterOR"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterOR_Judicial_Sub_Circuit_District_idx" ON "VoterOR"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterOR_Judicial_Superior_Court_District_idx" ON "VoterOR"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterOR_Judicial_Supreme_Court_District_idx" ON "VoterOR"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterOR_Middle_School_District_idx" ON "VoterOR"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterOR_Municipal_Court_District_idx" ON "VoterOR"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterOR_Proposed_City_Commissioner_District_idx" ON "VoterOR"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterOR_Proposed_Elementary_School_District_idx" ON "VoterOR"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterOR_Proposed_Unified_School_District_idx" ON "VoterOR"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterOR_Regional_Office_of_Education_District_idx" ON "VoterOR"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterOR_School_Board_District_idx" ON "VoterOR"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterOR_School_District_idx" ON "VoterOR"("School_District");

-- CreateIndex
CREATE INDEX "VoterOR_School_District_Vocational_idx" ON "VoterOR"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterOR_School_Facilities_Improvement_District_idx" ON "VoterOR"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterOR_School_Subdistrict_idx" ON "VoterOR"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterOR_Service_Area_District_idx" ON "VoterOR"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterOR_Superintendent_of_Schools_District_idx" ON "VoterOR"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterOR_Unified_School_District_idx" ON "VoterOR"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterOR_Unified_School_SubDistrict_idx" ON "VoterOR"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterOR_Voters_FirstName_idx" ON "VoterOR"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterOR_Voters_MiddleName_idx" ON "VoterOR"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterOR_Voters_LastName_idx" ON "VoterOR"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterOR_Voters_Active_idx" ON "VoterOR"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterOR_MilitaryStatus_Description_idx" ON "VoterOR"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterOR_Voters_Age_idx" ON "VoterOR"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterOR_Parties_Description_idx" ON "VoterOR"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterOR_VoterParties_Change_Changed_Party_idx" ON "VoterOR"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterOR_Voters_CalculatedRegDate_idx" ON "VoterOR"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterOR_Voters_OfficialRegDate_idx" ON "VoterOR"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterOR_VoterTelephones_CellConfidenceCode_idx" ON "VoterOR"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterOR_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterOR"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterOR_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterOR"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterOR_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterOR"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterOR_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterOR"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterOR_Voters_VotingPerformanceMinorElection_idx" ON "VoterOR"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterOR_General_2022_idx" ON "VoterOR"("General_2022");

-- CreateIndex
CREATE INDEX "VoterOR_Primary_2022_idx" ON "VoterOR"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterOR_OtherElection_2022_idx" ON "VoterOR"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterOR_AnyElection_2021_idx" ON "VoterOR"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterOR_General_2020_idx" ON "VoterOR"("General_2020");

-- CreateIndex
CREATE INDEX "VoterOR_Primary_2020_idx" ON "VoterOR"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterOR_PresidentialPrimary_2020_idx" ON "VoterOR"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterOR_OtherElection_2020_idx" ON "VoterOR"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterOR_AnyElection_2019_idx" ON "VoterOR"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterOR_General_2018_idx" ON "VoterOR"("General_2018");

-- CreateIndex
CREATE INDEX "VoterOR_Primary_2018_idx" ON "VoterOR"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterOR_OtherElection_2018_idx" ON "VoterOR"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterOR_AnyElection_2017_idx" ON "VoterOR"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterOR_General_2016_idx" ON "VoterOR"("General_2016");

-- CreateIndex
CREATE INDEX "VoterOR_Primary_2016_idx" ON "VoterOR"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterOR_PresidentialPrimary_2016_idx" ON "VoterOR"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterOR_OtherElection_2016_idx" ON "VoterOR"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterPA_LALVOTERID_key" ON "VoterPA"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterPA_US_Congressional_District_idx" ON "VoterPA"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterPA_State_Senate_District_idx" ON "VoterPA"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterPA_State_House_District_idx" ON "VoterPA"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterPA_County_Legislative_District_idx" ON "VoterPA"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterPA_City_idx" ON "VoterPA"("City");

-- CreateIndex
CREATE INDEX "VoterPA_County_idx" ON "VoterPA"("County");

-- CreateIndex
CREATE INDEX "VoterPA_City_Council_Commissioner_District_idx" ON "VoterPA"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterPA_City_Mayoral_District_idx" ON "VoterPA"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterPA_Town_District_idx" ON "VoterPA"("Town_District");

-- CreateIndex
CREATE INDEX "VoterPA_Town_Council_idx" ON "VoterPA"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterPA_Village_idx" ON "VoterPA"("Village");

-- CreateIndex
CREATE INDEX "VoterPA_Township_idx" ON "VoterPA"("Township");

-- CreateIndex
CREATE INDEX "VoterPA_Borough_idx" ON "VoterPA"("Borough");

-- CreateIndex
CREATE INDEX "VoterPA_Hamlet_Community_Area_idx" ON "VoterPA"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterPA_Board_of_Education_District_idx" ON "VoterPA"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterPA_Board_of_Education_SubDistrict_idx" ON "VoterPA"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterPA_City_School_District_idx" ON "VoterPA"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterPA_College_Board_District_idx" ON "VoterPA"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterPA_Community_College_Commissioner_District_idx" ON "VoterPA"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterPA_Community_College_SubDistrict_idx" ON "VoterPA"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterPA_County_Board_of_Education_District_idx" ON "VoterPA"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterPA_County_Board_of_Education_SubDistrict_idx" ON "VoterPA"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterPA_County_Community_College_District_idx" ON "VoterPA"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterPA_County_Superintendent_of_Schools_District_idx" ON "VoterPA"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterPA_County_Unified_School_District_idx" ON "VoterPA"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterPA_District_Attorney_idx" ON "VoterPA"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterPA_Education_Commission_District_idx" ON "VoterPA"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterPA_Educational_Service_District_idx" ON "VoterPA"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterPA_Election_Commissioner_District_idx" ON "VoterPA"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterPA_Elementary_School_District_idx" ON "VoterPA"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterPA_Elementary_School_SubDistrict_idx" ON "VoterPA"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterPA_Exempted_Village_School_District_idx" ON "VoterPA"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterPA_High_School_District_idx" ON "VoterPA"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterPA_High_School_SubDistrict_idx" ON "VoterPA"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterPA_Judicial_Appellate_District_idx" ON "VoterPA"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterPA_Judicial_Circuit_Court_District_idx" ON "VoterPA"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterPA_Judicial_County_Board_of_Review_District_idx" ON "VoterPA"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterPA_Judicial_County_Court_District_idx" ON "VoterPA"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterPA_Judicial_District_idx" ON "VoterPA"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterPA_Judicial_District_Court_District_idx" ON "VoterPA"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterPA_Judicial_Family_Court_District_idx" ON "VoterPA"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterPA_Judicial_Jury_District_idx" ON "VoterPA"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterPA_Judicial_Juvenile_Court_District_idx" ON "VoterPA"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterPA_Judicial_Magistrate_Division_idx" ON "VoterPA"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterPA_Judicial_Sub_Circuit_District_idx" ON "VoterPA"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterPA_Judicial_Superior_Court_District_idx" ON "VoterPA"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterPA_Judicial_Supreme_Court_District_idx" ON "VoterPA"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterPA_Middle_School_District_idx" ON "VoterPA"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterPA_Municipal_Court_District_idx" ON "VoterPA"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterPA_Proposed_City_Commissioner_District_idx" ON "VoterPA"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterPA_Proposed_Elementary_School_District_idx" ON "VoterPA"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterPA_Proposed_Unified_School_District_idx" ON "VoterPA"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterPA_Regional_Office_of_Education_District_idx" ON "VoterPA"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterPA_School_Board_District_idx" ON "VoterPA"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterPA_School_District_idx" ON "VoterPA"("School_District");

-- CreateIndex
CREATE INDEX "VoterPA_School_District_Vocational_idx" ON "VoterPA"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterPA_School_Facilities_Improvement_District_idx" ON "VoterPA"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterPA_School_Subdistrict_idx" ON "VoterPA"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterPA_Service_Area_District_idx" ON "VoterPA"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterPA_Superintendent_of_Schools_District_idx" ON "VoterPA"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterPA_Unified_School_District_idx" ON "VoterPA"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterPA_Unified_School_SubDistrict_idx" ON "VoterPA"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterPA_Voters_FirstName_idx" ON "VoterPA"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterPA_Voters_MiddleName_idx" ON "VoterPA"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterPA_Voters_LastName_idx" ON "VoterPA"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterPA_Voters_Active_idx" ON "VoterPA"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterPA_MilitaryStatus_Description_idx" ON "VoterPA"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterPA_Voters_Age_idx" ON "VoterPA"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterPA_Parties_Description_idx" ON "VoterPA"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterPA_VoterParties_Change_Changed_Party_idx" ON "VoterPA"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterPA_Voters_CalculatedRegDate_idx" ON "VoterPA"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterPA_Voters_OfficialRegDate_idx" ON "VoterPA"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterPA_VoterTelephones_CellConfidenceCode_idx" ON "VoterPA"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterPA_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterPA"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterPA_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterPA"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterPA_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterPA"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterPA_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterPA"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterPA_Voters_VotingPerformanceMinorElection_idx" ON "VoterPA"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterPA_General_2022_idx" ON "VoterPA"("General_2022");

-- CreateIndex
CREATE INDEX "VoterPA_Primary_2022_idx" ON "VoterPA"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterPA_OtherElection_2022_idx" ON "VoterPA"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterPA_AnyElection_2021_idx" ON "VoterPA"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterPA_General_2020_idx" ON "VoterPA"("General_2020");

-- CreateIndex
CREATE INDEX "VoterPA_Primary_2020_idx" ON "VoterPA"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterPA_PresidentialPrimary_2020_idx" ON "VoterPA"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterPA_OtherElection_2020_idx" ON "VoterPA"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterPA_AnyElection_2019_idx" ON "VoterPA"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterPA_General_2018_idx" ON "VoterPA"("General_2018");

-- CreateIndex
CREATE INDEX "VoterPA_Primary_2018_idx" ON "VoterPA"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterPA_OtherElection_2018_idx" ON "VoterPA"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterPA_AnyElection_2017_idx" ON "VoterPA"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterPA_General_2016_idx" ON "VoterPA"("General_2016");

-- CreateIndex
CREATE INDEX "VoterPA_Primary_2016_idx" ON "VoterPA"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterPA_PresidentialPrimary_2016_idx" ON "VoterPA"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterPA_OtherElection_2016_idx" ON "VoterPA"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterRI_LALVOTERID_key" ON "VoterRI"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterRI_US_Congressional_District_idx" ON "VoterRI"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterRI_State_Senate_District_idx" ON "VoterRI"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterRI_State_House_District_idx" ON "VoterRI"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterRI_County_Legislative_District_idx" ON "VoterRI"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterRI_City_idx" ON "VoterRI"("City");

-- CreateIndex
CREATE INDEX "VoterRI_County_idx" ON "VoterRI"("County");

-- CreateIndex
CREATE INDEX "VoterRI_City_Council_Commissioner_District_idx" ON "VoterRI"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterRI_City_Mayoral_District_idx" ON "VoterRI"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterRI_Town_District_idx" ON "VoterRI"("Town_District");

-- CreateIndex
CREATE INDEX "VoterRI_Town_Council_idx" ON "VoterRI"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterRI_Village_idx" ON "VoterRI"("Village");

-- CreateIndex
CREATE INDEX "VoterRI_Township_idx" ON "VoterRI"("Township");

-- CreateIndex
CREATE INDEX "VoterRI_Borough_idx" ON "VoterRI"("Borough");

-- CreateIndex
CREATE INDEX "VoterRI_Hamlet_Community_Area_idx" ON "VoterRI"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterRI_Board_of_Education_District_idx" ON "VoterRI"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterRI_Board_of_Education_SubDistrict_idx" ON "VoterRI"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterRI_City_School_District_idx" ON "VoterRI"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterRI_College_Board_District_idx" ON "VoterRI"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterRI_Community_College_Commissioner_District_idx" ON "VoterRI"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterRI_Community_College_SubDistrict_idx" ON "VoterRI"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterRI_County_Board_of_Education_District_idx" ON "VoterRI"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterRI_County_Board_of_Education_SubDistrict_idx" ON "VoterRI"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterRI_County_Community_College_District_idx" ON "VoterRI"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterRI_County_Superintendent_of_Schools_District_idx" ON "VoterRI"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterRI_County_Unified_School_District_idx" ON "VoterRI"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterRI_District_Attorney_idx" ON "VoterRI"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterRI_Education_Commission_District_idx" ON "VoterRI"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterRI_Educational_Service_District_idx" ON "VoterRI"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterRI_Election_Commissioner_District_idx" ON "VoterRI"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterRI_Elementary_School_District_idx" ON "VoterRI"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterRI_Elementary_School_SubDistrict_idx" ON "VoterRI"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterRI_Exempted_Village_School_District_idx" ON "VoterRI"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterRI_High_School_District_idx" ON "VoterRI"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterRI_High_School_SubDistrict_idx" ON "VoterRI"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterRI_Judicial_Appellate_District_idx" ON "VoterRI"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterRI_Judicial_Circuit_Court_District_idx" ON "VoterRI"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterRI_Judicial_County_Board_of_Review_District_idx" ON "VoterRI"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterRI_Judicial_County_Court_District_idx" ON "VoterRI"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterRI_Judicial_District_idx" ON "VoterRI"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterRI_Judicial_District_Court_District_idx" ON "VoterRI"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterRI_Judicial_Family_Court_District_idx" ON "VoterRI"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterRI_Judicial_Jury_District_idx" ON "VoterRI"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterRI_Judicial_Juvenile_Court_District_idx" ON "VoterRI"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterRI_Judicial_Magistrate_Division_idx" ON "VoterRI"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterRI_Judicial_Sub_Circuit_District_idx" ON "VoterRI"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterRI_Judicial_Superior_Court_District_idx" ON "VoterRI"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterRI_Judicial_Supreme_Court_District_idx" ON "VoterRI"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterRI_Middle_School_District_idx" ON "VoterRI"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterRI_Municipal_Court_District_idx" ON "VoterRI"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterRI_Proposed_City_Commissioner_District_idx" ON "VoterRI"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterRI_Proposed_Elementary_School_District_idx" ON "VoterRI"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterRI_Proposed_Unified_School_District_idx" ON "VoterRI"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterRI_Regional_Office_of_Education_District_idx" ON "VoterRI"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterRI_School_Board_District_idx" ON "VoterRI"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterRI_School_District_idx" ON "VoterRI"("School_District");

-- CreateIndex
CREATE INDEX "VoterRI_School_District_Vocational_idx" ON "VoterRI"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterRI_School_Facilities_Improvement_District_idx" ON "VoterRI"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterRI_School_Subdistrict_idx" ON "VoterRI"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterRI_Service_Area_District_idx" ON "VoterRI"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterRI_Superintendent_of_Schools_District_idx" ON "VoterRI"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterRI_Unified_School_District_idx" ON "VoterRI"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterRI_Unified_School_SubDistrict_idx" ON "VoterRI"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterRI_Voters_FirstName_idx" ON "VoterRI"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterRI_Voters_MiddleName_idx" ON "VoterRI"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterRI_Voters_LastName_idx" ON "VoterRI"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterRI_Voters_Active_idx" ON "VoterRI"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterRI_MilitaryStatus_Description_idx" ON "VoterRI"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterRI_Voters_Age_idx" ON "VoterRI"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterRI_Parties_Description_idx" ON "VoterRI"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterRI_VoterParties_Change_Changed_Party_idx" ON "VoterRI"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterRI_Voters_CalculatedRegDate_idx" ON "VoterRI"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterRI_Voters_OfficialRegDate_idx" ON "VoterRI"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterRI_VoterTelephones_CellConfidenceCode_idx" ON "VoterRI"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterRI_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterRI"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterRI_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterRI"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterRI_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterRI"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterRI_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterRI"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterRI_Voters_VotingPerformanceMinorElection_idx" ON "VoterRI"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterRI_General_2022_idx" ON "VoterRI"("General_2022");

-- CreateIndex
CREATE INDEX "VoterRI_Primary_2022_idx" ON "VoterRI"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterRI_OtherElection_2022_idx" ON "VoterRI"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterRI_AnyElection_2021_idx" ON "VoterRI"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterRI_General_2020_idx" ON "VoterRI"("General_2020");

-- CreateIndex
CREATE INDEX "VoterRI_Primary_2020_idx" ON "VoterRI"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterRI_PresidentialPrimary_2020_idx" ON "VoterRI"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterRI_OtherElection_2020_idx" ON "VoterRI"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterRI_AnyElection_2019_idx" ON "VoterRI"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterRI_General_2018_idx" ON "VoterRI"("General_2018");

-- CreateIndex
CREATE INDEX "VoterRI_Primary_2018_idx" ON "VoterRI"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterRI_OtherElection_2018_idx" ON "VoterRI"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterRI_AnyElection_2017_idx" ON "VoterRI"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterRI_General_2016_idx" ON "VoterRI"("General_2016");

-- CreateIndex
CREATE INDEX "VoterRI_Primary_2016_idx" ON "VoterRI"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterRI_PresidentialPrimary_2016_idx" ON "VoterRI"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterRI_OtherElection_2016_idx" ON "VoterRI"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterSC_LALVOTERID_key" ON "VoterSC"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterSC_US_Congressional_District_idx" ON "VoterSC"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterSC_State_Senate_District_idx" ON "VoterSC"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterSC_State_House_District_idx" ON "VoterSC"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterSC_County_Legislative_District_idx" ON "VoterSC"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterSC_City_idx" ON "VoterSC"("City");

-- CreateIndex
CREATE INDEX "VoterSC_County_idx" ON "VoterSC"("County");

-- CreateIndex
CREATE INDEX "VoterSC_City_Council_Commissioner_District_idx" ON "VoterSC"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterSC_City_Mayoral_District_idx" ON "VoterSC"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterSC_Town_District_idx" ON "VoterSC"("Town_District");

-- CreateIndex
CREATE INDEX "VoterSC_Town_Council_idx" ON "VoterSC"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterSC_Village_idx" ON "VoterSC"("Village");

-- CreateIndex
CREATE INDEX "VoterSC_Township_idx" ON "VoterSC"("Township");

-- CreateIndex
CREATE INDEX "VoterSC_Borough_idx" ON "VoterSC"("Borough");

-- CreateIndex
CREATE INDEX "VoterSC_Hamlet_Community_Area_idx" ON "VoterSC"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterSC_Board_of_Education_District_idx" ON "VoterSC"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterSC_Board_of_Education_SubDistrict_idx" ON "VoterSC"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterSC_City_School_District_idx" ON "VoterSC"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterSC_College_Board_District_idx" ON "VoterSC"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterSC_Community_College_Commissioner_District_idx" ON "VoterSC"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterSC_Community_College_SubDistrict_idx" ON "VoterSC"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterSC_County_Board_of_Education_District_idx" ON "VoterSC"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterSC_County_Board_of_Education_SubDistrict_idx" ON "VoterSC"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterSC_County_Community_College_District_idx" ON "VoterSC"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterSC_County_Superintendent_of_Schools_District_idx" ON "VoterSC"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterSC_County_Unified_School_District_idx" ON "VoterSC"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterSC_District_Attorney_idx" ON "VoterSC"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterSC_Education_Commission_District_idx" ON "VoterSC"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterSC_Educational_Service_District_idx" ON "VoterSC"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterSC_Election_Commissioner_District_idx" ON "VoterSC"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterSC_Elementary_School_District_idx" ON "VoterSC"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterSC_Elementary_School_SubDistrict_idx" ON "VoterSC"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterSC_Exempted_Village_School_District_idx" ON "VoterSC"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterSC_High_School_District_idx" ON "VoterSC"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterSC_High_School_SubDistrict_idx" ON "VoterSC"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterSC_Judicial_Appellate_District_idx" ON "VoterSC"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterSC_Judicial_Circuit_Court_District_idx" ON "VoterSC"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterSC_Judicial_County_Board_of_Review_District_idx" ON "VoterSC"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterSC_Judicial_County_Court_District_idx" ON "VoterSC"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterSC_Judicial_District_idx" ON "VoterSC"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterSC_Judicial_District_Court_District_idx" ON "VoterSC"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterSC_Judicial_Family_Court_District_idx" ON "VoterSC"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterSC_Judicial_Jury_District_idx" ON "VoterSC"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterSC_Judicial_Juvenile_Court_District_idx" ON "VoterSC"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterSC_Judicial_Magistrate_Division_idx" ON "VoterSC"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterSC_Judicial_Sub_Circuit_District_idx" ON "VoterSC"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterSC_Judicial_Superior_Court_District_idx" ON "VoterSC"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterSC_Judicial_Supreme_Court_District_idx" ON "VoterSC"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterSC_Middle_School_District_idx" ON "VoterSC"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterSC_Municipal_Court_District_idx" ON "VoterSC"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterSC_Proposed_City_Commissioner_District_idx" ON "VoterSC"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterSC_Proposed_Elementary_School_District_idx" ON "VoterSC"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterSC_Proposed_Unified_School_District_idx" ON "VoterSC"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterSC_Regional_Office_of_Education_District_idx" ON "VoterSC"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterSC_School_Board_District_idx" ON "VoterSC"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterSC_School_District_idx" ON "VoterSC"("School_District");

-- CreateIndex
CREATE INDEX "VoterSC_School_District_Vocational_idx" ON "VoterSC"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterSC_School_Facilities_Improvement_District_idx" ON "VoterSC"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterSC_School_Subdistrict_idx" ON "VoterSC"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterSC_Service_Area_District_idx" ON "VoterSC"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterSC_Superintendent_of_Schools_District_idx" ON "VoterSC"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterSC_Unified_School_District_idx" ON "VoterSC"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterSC_Unified_School_SubDistrict_idx" ON "VoterSC"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterSC_Voters_FirstName_idx" ON "VoterSC"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterSC_Voters_MiddleName_idx" ON "VoterSC"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterSC_Voters_LastName_idx" ON "VoterSC"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterSC_Voters_Active_idx" ON "VoterSC"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterSC_MilitaryStatus_Description_idx" ON "VoterSC"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterSC_Voters_Age_idx" ON "VoterSC"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterSC_Parties_Description_idx" ON "VoterSC"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterSC_VoterParties_Change_Changed_Party_idx" ON "VoterSC"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterSC_Voters_CalculatedRegDate_idx" ON "VoterSC"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterSC_Voters_OfficialRegDate_idx" ON "VoterSC"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterSC_VoterTelephones_CellConfidenceCode_idx" ON "VoterSC"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterSC_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterSC"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterSC_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterSC"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterSC_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterSC"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterSC_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterSC"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterSC_Voters_VotingPerformanceMinorElection_idx" ON "VoterSC"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterSC_General_2022_idx" ON "VoterSC"("General_2022");

-- CreateIndex
CREATE INDEX "VoterSC_Primary_2022_idx" ON "VoterSC"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterSC_OtherElection_2022_idx" ON "VoterSC"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterSC_AnyElection_2021_idx" ON "VoterSC"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterSC_General_2020_idx" ON "VoterSC"("General_2020");

-- CreateIndex
CREATE INDEX "VoterSC_Primary_2020_idx" ON "VoterSC"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterSC_PresidentialPrimary_2020_idx" ON "VoterSC"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterSC_OtherElection_2020_idx" ON "VoterSC"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterSC_AnyElection_2019_idx" ON "VoterSC"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterSC_General_2018_idx" ON "VoterSC"("General_2018");

-- CreateIndex
CREATE INDEX "VoterSC_Primary_2018_idx" ON "VoterSC"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterSC_OtherElection_2018_idx" ON "VoterSC"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterSC_AnyElection_2017_idx" ON "VoterSC"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterSC_General_2016_idx" ON "VoterSC"("General_2016");

-- CreateIndex
CREATE INDEX "VoterSC_Primary_2016_idx" ON "VoterSC"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterSC_PresidentialPrimary_2016_idx" ON "VoterSC"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterSC_OtherElection_2016_idx" ON "VoterSC"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterSD_LALVOTERID_key" ON "VoterSD"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterSD_US_Congressional_District_idx" ON "VoterSD"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterSD_State_Senate_District_idx" ON "VoterSD"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterSD_State_House_District_idx" ON "VoterSD"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterSD_County_Legislative_District_idx" ON "VoterSD"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterSD_City_idx" ON "VoterSD"("City");

-- CreateIndex
CREATE INDEX "VoterSD_County_idx" ON "VoterSD"("County");

-- CreateIndex
CREATE INDEX "VoterSD_City_Council_Commissioner_District_idx" ON "VoterSD"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterSD_City_Mayoral_District_idx" ON "VoterSD"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterSD_Town_District_idx" ON "VoterSD"("Town_District");

-- CreateIndex
CREATE INDEX "VoterSD_Town_Council_idx" ON "VoterSD"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterSD_Village_idx" ON "VoterSD"("Village");

-- CreateIndex
CREATE INDEX "VoterSD_Township_idx" ON "VoterSD"("Township");

-- CreateIndex
CREATE INDEX "VoterSD_Borough_idx" ON "VoterSD"("Borough");

-- CreateIndex
CREATE INDEX "VoterSD_Hamlet_Community_Area_idx" ON "VoterSD"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterSD_Board_of_Education_District_idx" ON "VoterSD"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterSD_Board_of_Education_SubDistrict_idx" ON "VoterSD"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterSD_City_School_District_idx" ON "VoterSD"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterSD_College_Board_District_idx" ON "VoterSD"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterSD_Community_College_Commissioner_District_idx" ON "VoterSD"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterSD_Community_College_SubDistrict_idx" ON "VoterSD"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterSD_County_Board_of_Education_District_idx" ON "VoterSD"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterSD_County_Board_of_Education_SubDistrict_idx" ON "VoterSD"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterSD_County_Community_College_District_idx" ON "VoterSD"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterSD_County_Superintendent_of_Schools_District_idx" ON "VoterSD"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterSD_County_Unified_School_District_idx" ON "VoterSD"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterSD_District_Attorney_idx" ON "VoterSD"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterSD_Education_Commission_District_idx" ON "VoterSD"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterSD_Educational_Service_District_idx" ON "VoterSD"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterSD_Election_Commissioner_District_idx" ON "VoterSD"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterSD_Elementary_School_District_idx" ON "VoterSD"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterSD_Elementary_School_SubDistrict_idx" ON "VoterSD"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterSD_Exempted_Village_School_District_idx" ON "VoterSD"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterSD_High_School_District_idx" ON "VoterSD"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterSD_High_School_SubDistrict_idx" ON "VoterSD"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterSD_Judicial_Appellate_District_idx" ON "VoterSD"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterSD_Judicial_Circuit_Court_District_idx" ON "VoterSD"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterSD_Judicial_County_Board_of_Review_District_idx" ON "VoterSD"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterSD_Judicial_County_Court_District_idx" ON "VoterSD"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterSD_Judicial_District_idx" ON "VoterSD"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterSD_Judicial_District_Court_District_idx" ON "VoterSD"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterSD_Judicial_Family_Court_District_idx" ON "VoterSD"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterSD_Judicial_Jury_District_idx" ON "VoterSD"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterSD_Judicial_Juvenile_Court_District_idx" ON "VoterSD"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterSD_Judicial_Magistrate_Division_idx" ON "VoterSD"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterSD_Judicial_Sub_Circuit_District_idx" ON "VoterSD"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterSD_Judicial_Superior_Court_District_idx" ON "VoterSD"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterSD_Judicial_Supreme_Court_District_idx" ON "VoterSD"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterSD_Middle_School_District_idx" ON "VoterSD"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterSD_Municipal_Court_District_idx" ON "VoterSD"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterSD_Proposed_City_Commissioner_District_idx" ON "VoterSD"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterSD_Proposed_Elementary_School_District_idx" ON "VoterSD"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterSD_Proposed_Unified_School_District_idx" ON "VoterSD"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterSD_Regional_Office_of_Education_District_idx" ON "VoterSD"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterSD_School_Board_District_idx" ON "VoterSD"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterSD_School_District_idx" ON "VoterSD"("School_District");

-- CreateIndex
CREATE INDEX "VoterSD_School_District_Vocational_idx" ON "VoterSD"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterSD_School_Facilities_Improvement_District_idx" ON "VoterSD"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterSD_School_Subdistrict_idx" ON "VoterSD"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterSD_Service_Area_District_idx" ON "VoterSD"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterSD_Superintendent_of_Schools_District_idx" ON "VoterSD"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterSD_Unified_School_District_idx" ON "VoterSD"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterSD_Unified_School_SubDistrict_idx" ON "VoterSD"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterSD_Voters_FirstName_idx" ON "VoterSD"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterSD_Voters_MiddleName_idx" ON "VoterSD"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterSD_Voters_LastName_idx" ON "VoterSD"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterSD_Voters_Active_idx" ON "VoterSD"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterSD_MilitaryStatus_Description_idx" ON "VoterSD"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterSD_Voters_Age_idx" ON "VoterSD"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterSD_Parties_Description_idx" ON "VoterSD"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterSD_VoterParties_Change_Changed_Party_idx" ON "VoterSD"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterSD_Voters_CalculatedRegDate_idx" ON "VoterSD"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterSD_Voters_OfficialRegDate_idx" ON "VoterSD"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterSD_VoterTelephones_CellConfidenceCode_idx" ON "VoterSD"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterSD_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterSD"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterSD_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterSD"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterSD_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterSD"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterSD_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterSD"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterSD_Voters_VotingPerformanceMinorElection_idx" ON "VoterSD"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterSD_General_2022_idx" ON "VoterSD"("General_2022");

-- CreateIndex
CREATE INDEX "VoterSD_Primary_2022_idx" ON "VoterSD"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterSD_OtherElection_2022_idx" ON "VoterSD"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterSD_AnyElection_2021_idx" ON "VoterSD"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterSD_General_2020_idx" ON "VoterSD"("General_2020");

-- CreateIndex
CREATE INDEX "VoterSD_Primary_2020_idx" ON "VoterSD"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterSD_PresidentialPrimary_2020_idx" ON "VoterSD"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterSD_OtherElection_2020_idx" ON "VoterSD"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterSD_AnyElection_2019_idx" ON "VoterSD"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterSD_General_2018_idx" ON "VoterSD"("General_2018");

-- CreateIndex
CREATE INDEX "VoterSD_Primary_2018_idx" ON "VoterSD"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterSD_OtherElection_2018_idx" ON "VoterSD"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterSD_AnyElection_2017_idx" ON "VoterSD"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterSD_General_2016_idx" ON "VoterSD"("General_2016");

-- CreateIndex
CREATE INDEX "VoterSD_Primary_2016_idx" ON "VoterSD"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterSD_PresidentialPrimary_2016_idx" ON "VoterSD"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterSD_OtherElection_2016_idx" ON "VoterSD"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterTN_LALVOTERID_key" ON "VoterTN"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterTN_US_Congressional_District_idx" ON "VoterTN"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterTN_State_Senate_District_idx" ON "VoterTN"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterTN_State_House_District_idx" ON "VoterTN"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterTN_County_Legislative_District_idx" ON "VoterTN"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterTN_City_idx" ON "VoterTN"("City");

-- CreateIndex
CREATE INDEX "VoterTN_County_idx" ON "VoterTN"("County");

-- CreateIndex
CREATE INDEX "VoterTN_City_Council_Commissioner_District_idx" ON "VoterTN"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterTN_City_Mayoral_District_idx" ON "VoterTN"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterTN_Town_District_idx" ON "VoterTN"("Town_District");

-- CreateIndex
CREATE INDEX "VoterTN_Town_Council_idx" ON "VoterTN"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterTN_Village_idx" ON "VoterTN"("Village");

-- CreateIndex
CREATE INDEX "VoterTN_Township_idx" ON "VoterTN"("Township");

-- CreateIndex
CREATE INDEX "VoterTN_Borough_idx" ON "VoterTN"("Borough");

-- CreateIndex
CREATE INDEX "VoterTN_Hamlet_Community_Area_idx" ON "VoterTN"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterTN_Board_of_Education_District_idx" ON "VoterTN"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterTN_Board_of_Education_SubDistrict_idx" ON "VoterTN"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterTN_City_School_District_idx" ON "VoterTN"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterTN_College_Board_District_idx" ON "VoterTN"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterTN_Community_College_Commissioner_District_idx" ON "VoterTN"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterTN_Community_College_SubDistrict_idx" ON "VoterTN"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterTN_County_Board_of_Education_District_idx" ON "VoterTN"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterTN_County_Board_of_Education_SubDistrict_idx" ON "VoterTN"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterTN_County_Community_College_District_idx" ON "VoterTN"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterTN_County_Superintendent_of_Schools_District_idx" ON "VoterTN"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterTN_County_Unified_School_District_idx" ON "VoterTN"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterTN_District_Attorney_idx" ON "VoterTN"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterTN_Education_Commission_District_idx" ON "VoterTN"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterTN_Educational_Service_District_idx" ON "VoterTN"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterTN_Election_Commissioner_District_idx" ON "VoterTN"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterTN_Elementary_School_District_idx" ON "VoterTN"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterTN_Elementary_School_SubDistrict_idx" ON "VoterTN"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterTN_Exempted_Village_School_District_idx" ON "VoterTN"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterTN_High_School_District_idx" ON "VoterTN"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterTN_High_School_SubDistrict_idx" ON "VoterTN"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterTN_Judicial_Appellate_District_idx" ON "VoterTN"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterTN_Judicial_Circuit_Court_District_idx" ON "VoterTN"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterTN_Judicial_County_Board_of_Review_District_idx" ON "VoterTN"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterTN_Judicial_County_Court_District_idx" ON "VoterTN"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterTN_Judicial_District_idx" ON "VoterTN"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterTN_Judicial_District_Court_District_idx" ON "VoterTN"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterTN_Judicial_Family_Court_District_idx" ON "VoterTN"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterTN_Judicial_Jury_District_idx" ON "VoterTN"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterTN_Judicial_Juvenile_Court_District_idx" ON "VoterTN"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterTN_Judicial_Magistrate_Division_idx" ON "VoterTN"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterTN_Judicial_Sub_Circuit_District_idx" ON "VoterTN"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterTN_Judicial_Superior_Court_District_idx" ON "VoterTN"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterTN_Judicial_Supreme_Court_District_idx" ON "VoterTN"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterTN_Middle_School_District_idx" ON "VoterTN"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterTN_Municipal_Court_District_idx" ON "VoterTN"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterTN_Proposed_City_Commissioner_District_idx" ON "VoterTN"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterTN_Proposed_Elementary_School_District_idx" ON "VoterTN"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterTN_Proposed_Unified_School_District_idx" ON "VoterTN"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterTN_Regional_Office_of_Education_District_idx" ON "VoterTN"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterTN_School_Board_District_idx" ON "VoterTN"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterTN_School_District_idx" ON "VoterTN"("School_District");

-- CreateIndex
CREATE INDEX "VoterTN_School_District_Vocational_idx" ON "VoterTN"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterTN_School_Facilities_Improvement_District_idx" ON "VoterTN"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterTN_School_Subdistrict_idx" ON "VoterTN"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterTN_Service_Area_District_idx" ON "VoterTN"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterTN_Superintendent_of_Schools_District_idx" ON "VoterTN"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterTN_Unified_School_District_idx" ON "VoterTN"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterTN_Unified_School_SubDistrict_idx" ON "VoterTN"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterTN_Voters_FirstName_idx" ON "VoterTN"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterTN_Voters_MiddleName_idx" ON "VoterTN"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterTN_Voters_LastName_idx" ON "VoterTN"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterTN_Voters_Active_idx" ON "VoterTN"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterTN_MilitaryStatus_Description_idx" ON "VoterTN"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterTN_Voters_Age_idx" ON "VoterTN"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterTN_Parties_Description_idx" ON "VoterTN"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterTN_VoterParties_Change_Changed_Party_idx" ON "VoterTN"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterTN_Voters_CalculatedRegDate_idx" ON "VoterTN"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterTN_Voters_OfficialRegDate_idx" ON "VoterTN"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterTN_VoterTelephones_CellConfidenceCode_idx" ON "VoterTN"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterTN_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterTN"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterTN_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterTN"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterTN_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterTN"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterTN_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterTN"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterTN_Voters_VotingPerformanceMinorElection_idx" ON "VoterTN"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterTN_General_2022_idx" ON "VoterTN"("General_2022");

-- CreateIndex
CREATE INDEX "VoterTN_Primary_2022_idx" ON "VoterTN"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterTN_OtherElection_2022_idx" ON "VoterTN"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterTN_AnyElection_2021_idx" ON "VoterTN"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterTN_General_2020_idx" ON "VoterTN"("General_2020");

-- CreateIndex
CREATE INDEX "VoterTN_Primary_2020_idx" ON "VoterTN"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterTN_PresidentialPrimary_2020_idx" ON "VoterTN"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterTN_OtherElection_2020_idx" ON "VoterTN"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterTN_AnyElection_2019_idx" ON "VoterTN"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterTN_General_2018_idx" ON "VoterTN"("General_2018");

-- CreateIndex
CREATE INDEX "VoterTN_Primary_2018_idx" ON "VoterTN"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterTN_OtherElection_2018_idx" ON "VoterTN"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterTN_AnyElection_2017_idx" ON "VoterTN"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterTN_General_2016_idx" ON "VoterTN"("General_2016");

-- CreateIndex
CREATE INDEX "VoterTN_Primary_2016_idx" ON "VoterTN"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterTN_PresidentialPrimary_2016_idx" ON "VoterTN"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterTN_OtherElection_2016_idx" ON "VoterTN"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterTX_LALVOTERID_key" ON "VoterTX"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterTX_US_Congressional_District_idx" ON "VoterTX"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterTX_State_Senate_District_idx" ON "VoterTX"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterTX_State_House_District_idx" ON "VoterTX"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterTX_County_Legislative_District_idx" ON "VoterTX"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterTX_City_idx" ON "VoterTX"("City");

-- CreateIndex
CREATE INDEX "VoterTX_County_idx" ON "VoterTX"("County");

-- CreateIndex
CREATE INDEX "VoterTX_City_Council_Commissioner_District_idx" ON "VoterTX"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterTX_City_Mayoral_District_idx" ON "VoterTX"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterTX_Town_District_idx" ON "VoterTX"("Town_District");

-- CreateIndex
CREATE INDEX "VoterTX_Town_Council_idx" ON "VoterTX"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterTX_Village_idx" ON "VoterTX"("Village");

-- CreateIndex
CREATE INDEX "VoterTX_Township_idx" ON "VoterTX"("Township");

-- CreateIndex
CREATE INDEX "VoterTX_Borough_idx" ON "VoterTX"("Borough");

-- CreateIndex
CREATE INDEX "VoterTX_Hamlet_Community_Area_idx" ON "VoterTX"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterTX_Board_of_Education_District_idx" ON "VoterTX"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterTX_Board_of_Education_SubDistrict_idx" ON "VoterTX"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterTX_City_School_District_idx" ON "VoterTX"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterTX_College_Board_District_idx" ON "VoterTX"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterTX_Community_College_Commissioner_District_idx" ON "VoterTX"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterTX_Community_College_SubDistrict_idx" ON "VoterTX"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterTX_County_Board_of_Education_District_idx" ON "VoterTX"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterTX_County_Board_of_Education_SubDistrict_idx" ON "VoterTX"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterTX_County_Community_College_District_idx" ON "VoterTX"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterTX_County_Superintendent_of_Schools_District_idx" ON "VoterTX"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterTX_County_Unified_School_District_idx" ON "VoterTX"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterTX_District_Attorney_idx" ON "VoterTX"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterTX_Education_Commission_District_idx" ON "VoterTX"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterTX_Educational_Service_District_idx" ON "VoterTX"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterTX_Election_Commissioner_District_idx" ON "VoterTX"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterTX_Elementary_School_District_idx" ON "VoterTX"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterTX_Elementary_School_SubDistrict_idx" ON "VoterTX"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterTX_Exempted_Village_School_District_idx" ON "VoterTX"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterTX_High_School_District_idx" ON "VoterTX"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterTX_High_School_SubDistrict_idx" ON "VoterTX"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterTX_Judicial_Appellate_District_idx" ON "VoterTX"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterTX_Judicial_Circuit_Court_District_idx" ON "VoterTX"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterTX_Judicial_County_Board_of_Review_District_idx" ON "VoterTX"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterTX_Judicial_County_Court_District_idx" ON "VoterTX"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterTX_Judicial_District_idx" ON "VoterTX"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterTX_Judicial_District_Court_District_idx" ON "VoterTX"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterTX_Judicial_Family_Court_District_idx" ON "VoterTX"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterTX_Judicial_Jury_District_idx" ON "VoterTX"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterTX_Judicial_Juvenile_Court_District_idx" ON "VoterTX"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterTX_Judicial_Magistrate_Division_idx" ON "VoterTX"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterTX_Judicial_Sub_Circuit_District_idx" ON "VoterTX"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterTX_Judicial_Superior_Court_District_idx" ON "VoterTX"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterTX_Judicial_Supreme_Court_District_idx" ON "VoterTX"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterTX_Middle_School_District_idx" ON "VoterTX"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterTX_Municipal_Court_District_idx" ON "VoterTX"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterTX_Proposed_City_Commissioner_District_idx" ON "VoterTX"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterTX_Proposed_Elementary_School_District_idx" ON "VoterTX"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterTX_Proposed_Unified_School_District_idx" ON "VoterTX"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterTX_Regional_Office_of_Education_District_idx" ON "VoterTX"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterTX_School_Board_District_idx" ON "VoterTX"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterTX_School_District_idx" ON "VoterTX"("School_District");

-- CreateIndex
CREATE INDEX "VoterTX_School_District_Vocational_idx" ON "VoterTX"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterTX_School_Facilities_Improvement_District_idx" ON "VoterTX"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterTX_School_Subdistrict_idx" ON "VoterTX"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterTX_Service_Area_District_idx" ON "VoterTX"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterTX_Superintendent_of_Schools_District_idx" ON "VoterTX"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterTX_Unified_School_District_idx" ON "VoterTX"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterTX_Unified_School_SubDistrict_idx" ON "VoterTX"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterTX_Voters_FirstName_idx" ON "VoterTX"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterTX_Voters_MiddleName_idx" ON "VoterTX"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterTX_Voters_LastName_idx" ON "VoterTX"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterTX_Voters_Active_idx" ON "VoterTX"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterTX_MilitaryStatus_Description_idx" ON "VoterTX"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterTX_Voters_Age_idx" ON "VoterTX"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterTX_Parties_Description_idx" ON "VoterTX"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterTX_VoterParties_Change_Changed_Party_idx" ON "VoterTX"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterTX_Voters_CalculatedRegDate_idx" ON "VoterTX"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterTX_Voters_OfficialRegDate_idx" ON "VoterTX"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterTX_VoterTelephones_CellConfidenceCode_idx" ON "VoterTX"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterTX_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterTX"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterTX_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterTX"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterTX_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterTX"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterTX_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterTX"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterTX_Voters_VotingPerformanceMinorElection_idx" ON "VoterTX"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterTX_General_2022_idx" ON "VoterTX"("General_2022");

-- CreateIndex
CREATE INDEX "VoterTX_Primary_2022_idx" ON "VoterTX"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterTX_OtherElection_2022_idx" ON "VoterTX"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterTX_AnyElection_2021_idx" ON "VoterTX"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterTX_General_2020_idx" ON "VoterTX"("General_2020");

-- CreateIndex
CREATE INDEX "VoterTX_Primary_2020_idx" ON "VoterTX"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterTX_PresidentialPrimary_2020_idx" ON "VoterTX"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterTX_OtherElection_2020_idx" ON "VoterTX"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterTX_AnyElection_2019_idx" ON "VoterTX"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterTX_General_2018_idx" ON "VoterTX"("General_2018");

-- CreateIndex
CREATE INDEX "VoterTX_Primary_2018_idx" ON "VoterTX"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterTX_OtherElection_2018_idx" ON "VoterTX"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterTX_AnyElection_2017_idx" ON "VoterTX"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterTX_General_2016_idx" ON "VoterTX"("General_2016");

-- CreateIndex
CREATE INDEX "VoterTX_Primary_2016_idx" ON "VoterTX"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterTX_PresidentialPrimary_2016_idx" ON "VoterTX"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterTX_OtherElection_2016_idx" ON "VoterTX"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterUT_LALVOTERID_key" ON "VoterUT"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterUT_US_Congressional_District_idx" ON "VoterUT"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterUT_State_Senate_District_idx" ON "VoterUT"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterUT_State_House_District_idx" ON "VoterUT"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterUT_County_Legislative_District_idx" ON "VoterUT"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterUT_City_idx" ON "VoterUT"("City");

-- CreateIndex
CREATE INDEX "VoterUT_County_idx" ON "VoterUT"("County");

-- CreateIndex
CREATE INDEX "VoterUT_City_Council_Commissioner_District_idx" ON "VoterUT"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterUT_City_Mayoral_District_idx" ON "VoterUT"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterUT_Town_District_idx" ON "VoterUT"("Town_District");

-- CreateIndex
CREATE INDEX "VoterUT_Town_Council_idx" ON "VoterUT"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterUT_Village_idx" ON "VoterUT"("Village");

-- CreateIndex
CREATE INDEX "VoterUT_Township_idx" ON "VoterUT"("Township");

-- CreateIndex
CREATE INDEX "VoterUT_Borough_idx" ON "VoterUT"("Borough");

-- CreateIndex
CREATE INDEX "VoterUT_Hamlet_Community_Area_idx" ON "VoterUT"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterUT_Board_of_Education_District_idx" ON "VoterUT"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterUT_Board_of_Education_SubDistrict_idx" ON "VoterUT"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterUT_City_School_District_idx" ON "VoterUT"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterUT_College_Board_District_idx" ON "VoterUT"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterUT_Community_College_Commissioner_District_idx" ON "VoterUT"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterUT_Community_College_SubDistrict_idx" ON "VoterUT"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterUT_County_Board_of_Education_District_idx" ON "VoterUT"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterUT_County_Board_of_Education_SubDistrict_idx" ON "VoterUT"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterUT_County_Community_College_District_idx" ON "VoterUT"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterUT_County_Superintendent_of_Schools_District_idx" ON "VoterUT"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterUT_County_Unified_School_District_idx" ON "VoterUT"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterUT_District_Attorney_idx" ON "VoterUT"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterUT_Education_Commission_District_idx" ON "VoterUT"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterUT_Educational_Service_District_idx" ON "VoterUT"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterUT_Election_Commissioner_District_idx" ON "VoterUT"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterUT_Elementary_School_District_idx" ON "VoterUT"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterUT_Elementary_School_SubDistrict_idx" ON "VoterUT"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterUT_Exempted_Village_School_District_idx" ON "VoterUT"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterUT_High_School_District_idx" ON "VoterUT"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterUT_High_School_SubDistrict_idx" ON "VoterUT"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterUT_Judicial_Appellate_District_idx" ON "VoterUT"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterUT_Judicial_Circuit_Court_District_idx" ON "VoterUT"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterUT_Judicial_County_Board_of_Review_District_idx" ON "VoterUT"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterUT_Judicial_County_Court_District_idx" ON "VoterUT"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterUT_Judicial_District_idx" ON "VoterUT"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterUT_Judicial_District_Court_District_idx" ON "VoterUT"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterUT_Judicial_Family_Court_District_idx" ON "VoterUT"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterUT_Judicial_Jury_District_idx" ON "VoterUT"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterUT_Judicial_Juvenile_Court_District_idx" ON "VoterUT"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterUT_Judicial_Magistrate_Division_idx" ON "VoterUT"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterUT_Judicial_Sub_Circuit_District_idx" ON "VoterUT"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterUT_Judicial_Superior_Court_District_idx" ON "VoterUT"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterUT_Judicial_Supreme_Court_District_idx" ON "VoterUT"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterUT_Middle_School_District_idx" ON "VoterUT"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterUT_Municipal_Court_District_idx" ON "VoterUT"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterUT_Proposed_City_Commissioner_District_idx" ON "VoterUT"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterUT_Proposed_Elementary_School_District_idx" ON "VoterUT"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterUT_Proposed_Unified_School_District_idx" ON "VoterUT"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterUT_Regional_Office_of_Education_District_idx" ON "VoterUT"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterUT_School_Board_District_idx" ON "VoterUT"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterUT_School_District_idx" ON "VoterUT"("School_District");

-- CreateIndex
CREATE INDEX "VoterUT_School_District_Vocational_idx" ON "VoterUT"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterUT_School_Facilities_Improvement_District_idx" ON "VoterUT"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterUT_School_Subdistrict_idx" ON "VoterUT"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterUT_Service_Area_District_idx" ON "VoterUT"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterUT_Superintendent_of_Schools_District_idx" ON "VoterUT"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterUT_Unified_School_District_idx" ON "VoterUT"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterUT_Unified_School_SubDistrict_idx" ON "VoterUT"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterUT_Voters_FirstName_idx" ON "VoterUT"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterUT_Voters_MiddleName_idx" ON "VoterUT"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterUT_Voters_LastName_idx" ON "VoterUT"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterUT_Voters_Active_idx" ON "VoterUT"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterUT_MilitaryStatus_Description_idx" ON "VoterUT"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterUT_Voters_Age_idx" ON "VoterUT"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterUT_Parties_Description_idx" ON "VoterUT"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterUT_VoterParties_Change_Changed_Party_idx" ON "VoterUT"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterUT_Voters_CalculatedRegDate_idx" ON "VoterUT"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterUT_Voters_OfficialRegDate_idx" ON "VoterUT"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterUT_VoterTelephones_CellConfidenceCode_idx" ON "VoterUT"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterUT_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterUT"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterUT_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterUT"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterUT_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterUT"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterUT_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterUT"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterUT_Voters_VotingPerformanceMinorElection_idx" ON "VoterUT"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterUT_General_2022_idx" ON "VoterUT"("General_2022");

-- CreateIndex
CREATE INDEX "VoterUT_Primary_2022_idx" ON "VoterUT"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterUT_OtherElection_2022_idx" ON "VoterUT"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterUT_AnyElection_2021_idx" ON "VoterUT"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterUT_General_2020_idx" ON "VoterUT"("General_2020");

-- CreateIndex
CREATE INDEX "VoterUT_Primary_2020_idx" ON "VoterUT"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterUT_PresidentialPrimary_2020_idx" ON "VoterUT"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterUT_OtherElection_2020_idx" ON "VoterUT"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterUT_AnyElection_2019_idx" ON "VoterUT"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterUT_General_2018_idx" ON "VoterUT"("General_2018");

-- CreateIndex
CREATE INDEX "VoterUT_Primary_2018_idx" ON "VoterUT"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterUT_OtherElection_2018_idx" ON "VoterUT"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterUT_AnyElection_2017_idx" ON "VoterUT"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterUT_General_2016_idx" ON "VoterUT"("General_2016");

-- CreateIndex
CREATE INDEX "VoterUT_Primary_2016_idx" ON "VoterUT"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterUT_PresidentialPrimary_2016_idx" ON "VoterUT"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterUT_OtherElection_2016_idx" ON "VoterUT"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterVT_LALVOTERID_key" ON "VoterVT"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterVT_US_Congressional_District_idx" ON "VoterVT"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterVT_State_Senate_District_idx" ON "VoterVT"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterVT_State_House_District_idx" ON "VoterVT"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterVT_County_Legislative_District_idx" ON "VoterVT"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterVT_City_idx" ON "VoterVT"("City");

-- CreateIndex
CREATE INDEX "VoterVT_County_idx" ON "VoterVT"("County");

-- CreateIndex
CREATE INDEX "VoterVT_City_Council_Commissioner_District_idx" ON "VoterVT"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterVT_City_Mayoral_District_idx" ON "VoterVT"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterVT_Town_District_idx" ON "VoterVT"("Town_District");

-- CreateIndex
CREATE INDEX "VoterVT_Town_Council_idx" ON "VoterVT"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterVT_Village_idx" ON "VoterVT"("Village");

-- CreateIndex
CREATE INDEX "VoterVT_Township_idx" ON "VoterVT"("Township");

-- CreateIndex
CREATE INDEX "VoterVT_Borough_idx" ON "VoterVT"("Borough");

-- CreateIndex
CREATE INDEX "VoterVT_Hamlet_Community_Area_idx" ON "VoterVT"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterVT_Board_of_Education_District_idx" ON "VoterVT"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterVT_Board_of_Education_SubDistrict_idx" ON "VoterVT"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterVT_City_School_District_idx" ON "VoterVT"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterVT_College_Board_District_idx" ON "VoterVT"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterVT_Community_College_Commissioner_District_idx" ON "VoterVT"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterVT_Community_College_SubDistrict_idx" ON "VoterVT"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterVT_County_Board_of_Education_District_idx" ON "VoterVT"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterVT_County_Board_of_Education_SubDistrict_idx" ON "VoterVT"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterVT_County_Community_College_District_idx" ON "VoterVT"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterVT_County_Superintendent_of_Schools_District_idx" ON "VoterVT"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterVT_County_Unified_School_District_idx" ON "VoterVT"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterVT_District_Attorney_idx" ON "VoterVT"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterVT_Education_Commission_District_idx" ON "VoterVT"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterVT_Educational_Service_District_idx" ON "VoterVT"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterVT_Election_Commissioner_District_idx" ON "VoterVT"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterVT_Elementary_School_District_idx" ON "VoterVT"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterVT_Elementary_School_SubDistrict_idx" ON "VoterVT"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterVT_Exempted_Village_School_District_idx" ON "VoterVT"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterVT_High_School_District_idx" ON "VoterVT"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterVT_High_School_SubDistrict_idx" ON "VoterVT"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterVT_Judicial_Appellate_District_idx" ON "VoterVT"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterVT_Judicial_Circuit_Court_District_idx" ON "VoterVT"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterVT_Judicial_County_Board_of_Review_District_idx" ON "VoterVT"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterVT_Judicial_County_Court_District_idx" ON "VoterVT"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterVT_Judicial_District_idx" ON "VoterVT"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterVT_Judicial_District_Court_District_idx" ON "VoterVT"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterVT_Judicial_Family_Court_District_idx" ON "VoterVT"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterVT_Judicial_Jury_District_idx" ON "VoterVT"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterVT_Judicial_Juvenile_Court_District_idx" ON "VoterVT"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterVT_Judicial_Magistrate_Division_idx" ON "VoterVT"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterVT_Judicial_Sub_Circuit_District_idx" ON "VoterVT"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterVT_Judicial_Superior_Court_District_idx" ON "VoterVT"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterVT_Judicial_Supreme_Court_District_idx" ON "VoterVT"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterVT_Middle_School_District_idx" ON "VoterVT"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterVT_Municipal_Court_District_idx" ON "VoterVT"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterVT_Proposed_City_Commissioner_District_idx" ON "VoterVT"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterVT_Proposed_Elementary_School_District_idx" ON "VoterVT"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterVT_Proposed_Unified_School_District_idx" ON "VoterVT"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterVT_Regional_Office_of_Education_District_idx" ON "VoterVT"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterVT_School_Board_District_idx" ON "VoterVT"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterVT_School_District_idx" ON "VoterVT"("School_District");

-- CreateIndex
CREATE INDEX "VoterVT_School_District_Vocational_idx" ON "VoterVT"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterVT_School_Facilities_Improvement_District_idx" ON "VoterVT"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterVT_School_Subdistrict_idx" ON "VoterVT"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterVT_Service_Area_District_idx" ON "VoterVT"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterVT_Superintendent_of_Schools_District_idx" ON "VoterVT"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterVT_Unified_School_District_idx" ON "VoterVT"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterVT_Unified_School_SubDistrict_idx" ON "VoterVT"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterVT_Voters_FirstName_idx" ON "VoterVT"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterVT_Voters_MiddleName_idx" ON "VoterVT"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterVT_Voters_LastName_idx" ON "VoterVT"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterVT_Voters_Active_idx" ON "VoterVT"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterVT_MilitaryStatus_Description_idx" ON "VoterVT"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterVT_Voters_Age_idx" ON "VoterVT"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterVT_Parties_Description_idx" ON "VoterVT"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterVT_VoterParties_Change_Changed_Party_idx" ON "VoterVT"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterVT_Voters_CalculatedRegDate_idx" ON "VoterVT"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterVT_Voters_OfficialRegDate_idx" ON "VoterVT"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterVT_VoterTelephones_CellConfidenceCode_idx" ON "VoterVT"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterVT_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterVT"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterVT_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterVT"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterVT_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterVT"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterVT_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterVT"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterVT_Voters_VotingPerformanceMinorElection_idx" ON "VoterVT"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterVT_General_2022_idx" ON "VoterVT"("General_2022");

-- CreateIndex
CREATE INDEX "VoterVT_Primary_2022_idx" ON "VoterVT"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterVT_OtherElection_2022_idx" ON "VoterVT"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterVT_AnyElection_2021_idx" ON "VoterVT"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterVT_General_2020_idx" ON "VoterVT"("General_2020");

-- CreateIndex
CREATE INDEX "VoterVT_Primary_2020_idx" ON "VoterVT"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterVT_PresidentialPrimary_2020_idx" ON "VoterVT"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterVT_OtherElection_2020_idx" ON "VoterVT"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterVT_AnyElection_2019_idx" ON "VoterVT"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterVT_General_2018_idx" ON "VoterVT"("General_2018");

-- CreateIndex
CREATE INDEX "VoterVT_Primary_2018_idx" ON "VoterVT"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterVT_OtherElection_2018_idx" ON "VoterVT"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterVT_AnyElection_2017_idx" ON "VoterVT"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterVT_General_2016_idx" ON "VoterVT"("General_2016");

-- CreateIndex
CREATE INDEX "VoterVT_Primary_2016_idx" ON "VoterVT"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterVT_PresidentialPrimary_2016_idx" ON "VoterVT"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterVT_OtherElection_2016_idx" ON "VoterVT"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterVA_LALVOTERID_key" ON "VoterVA"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterVA_US_Congressional_District_idx" ON "VoterVA"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterVA_State_Senate_District_idx" ON "VoterVA"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterVA_State_House_District_idx" ON "VoterVA"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterVA_County_Legislative_District_idx" ON "VoterVA"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterVA_City_idx" ON "VoterVA"("City");

-- CreateIndex
CREATE INDEX "VoterVA_County_idx" ON "VoterVA"("County");

-- CreateIndex
CREATE INDEX "VoterVA_City_Council_Commissioner_District_idx" ON "VoterVA"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterVA_City_Mayoral_District_idx" ON "VoterVA"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterVA_Town_District_idx" ON "VoterVA"("Town_District");

-- CreateIndex
CREATE INDEX "VoterVA_Town_Council_idx" ON "VoterVA"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterVA_Village_idx" ON "VoterVA"("Village");

-- CreateIndex
CREATE INDEX "VoterVA_Township_idx" ON "VoterVA"("Township");

-- CreateIndex
CREATE INDEX "VoterVA_Borough_idx" ON "VoterVA"("Borough");

-- CreateIndex
CREATE INDEX "VoterVA_Hamlet_Community_Area_idx" ON "VoterVA"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterVA_Board_of_Education_District_idx" ON "VoterVA"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterVA_Board_of_Education_SubDistrict_idx" ON "VoterVA"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterVA_City_School_District_idx" ON "VoterVA"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterVA_College_Board_District_idx" ON "VoterVA"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterVA_Community_College_Commissioner_District_idx" ON "VoterVA"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterVA_Community_College_SubDistrict_idx" ON "VoterVA"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterVA_County_Board_of_Education_District_idx" ON "VoterVA"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterVA_County_Board_of_Education_SubDistrict_idx" ON "VoterVA"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterVA_County_Community_College_District_idx" ON "VoterVA"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterVA_County_Superintendent_of_Schools_District_idx" ON "VoterVA"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterVA_County_Unified_School_District_idx" ON "VoterVA"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterVA_District_Attorney_idx" ON "VoterVA"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterVA_Education_Commission_District_idx" ON "VoterVA"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterVA_Educational_Service_District_idx" ON "VoterVA"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterVA_Election_Commissioner_District_idx" ON "VoterVA"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterVA_Elementary_School_District_idx" ON "VoterVA"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterVA_Elementary_School_SubDistrict_idx" ON "VoterVA"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterVA_Exempted_Village_School_District_idx" ON "VoterVA"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterVA_High_School_District_idx" ON "VoterVA"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterVA_High_School_SubDistrict_idx" ON "VoterVA"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterVA_Judicial_Appellate_District_idx" ON "VoterVA"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterVA_Judicial_Circuit_Court_District_idx" ON "VoterVA"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterVA_Judicial_County_Board_of_Review_District_idx" ON "VoterVA"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterVA_Judicial_County_Court_District_idx" ON "VoterVA"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterVA_Judicial_District_idx" ON "VoterVA"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterVA_Judicial_District_Court_District_idx" ON "VoterVA"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterVA_Judicial_Family_Court_District_idx" ON "VoterVA"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterVA_Judicial_Jury_District_idx" ON "VoterVA"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterVA_Judicial_Juvenile_Court_District_idx" ON "VoterVA"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterVA_Judicial_Magistrate_Division_idx" ON "VoterVA"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterVA_Judicial_Sub_Circuit_District_idx" ON "VoterVA"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterVA_Judicial_Superior_Court_District_idx" ON "VoterVA"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterVA_Judicial_Supreme_Court_District_idx" ON "VoterVA"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterVA_Middle_School_District_idx" ON "VoterVA"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterVA_Municipal_Court_District_idx" ON "VoterVA"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterVA_Proposed_City_Commissioner_District_idx" ON "VoterVA"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterVA_Proposed_Elementary_School_District_idx" ON "VoterVA"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterVA_Proposed_Unified_School_District_idx" ON "VoterVA"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterVA_Regional_Office_of_Education_District_idx" ON "VoterVA"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterVA_School_Board_District_idx" ON "VoterVA"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterVA_School_District_idx" ON "VoterVA"("School_District");

-- CreateIndex
CREATE INDEX "VoterVA_School_District_Vocational_idx" ON "VoterVA"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterVA_School_Facilities_Improvement_District_idx" ON "VoterVA"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterVA_School_Subdistrict_idx" ON "VoterVA"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterVA_Service_Area_District_idx" ON "VoterVA"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterVA_Superintendent_of_Schools_District_idx" ON "VoterVA"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterVA_Unified_School_District_idx" ON "VoterVA"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterVA_Unified_School_SubDistrict_idx" ON "VoterVA"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterVA_Voters_FirstName_idx" ON "VoterVA"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterVA_Voters_MiddleName_idx" ON "VoterVA"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterVA_Voters_LastName_idx" ON "VoterVA"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterVA_Voters_Active_idx" ON "VoterVA"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterVA_MilitaryStatus_Description_idx" ON "VoterVA"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterVA_Voters_Age_idx" ON "VoterVA"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterVA_Parties_Description_idx" ON "VoterVA"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterVA_VoterParties_Change_Changed_Party_idx" ON "VoterVA"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterVA_Voters_CalculatedRegDate_idx" ON "VoterVA"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterVA_Voters_OfficialRegDate_idx" ON "VoterVA"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterVA_VoterTelephones_CellConfidenceCode_idx" ON "VoterVA"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterVA_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterVA"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterVA_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterVA"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterVA_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterVA"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterVA_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterVA"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterVA_Voters_VotingPerformanceMinorElection_idx" ON "VoterVA"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterVA_General_2022_idx" ON "VoterVA"("General_2022");

-- CreateIndex
CREATE INDEX "VoterVA_Primary_2022_idx" ON "VoterVA"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterVA_OtherElection_2022_idx" ON "VoterVA"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterVA_AnyElection_2021_idx" ON "VoterVA"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterVA_General_2020_idx" ON "VoterVA"("General_2020");

-- CreateIndex
CREATE INDEX "VoterVA_Primary_2020_idx" ON "VoterVA"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterVA_PresidentialPrimary_2020_idx" ON "VoterVA"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterVA_OtherElection_2020_idx" ON "VoterVA"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterVA_AnyElection_2019_idx" ON "VoterVA"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterVA_General_2018_idx" ON "VoterVA"("General_2018");

-- CreateIndex
CREATE INDEX "VoterVA_Primary_2018_idx" ON "VoterVA"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterVA_OtherElection_2018_idx" ON "VoterVA"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterVA_AnyElection_2017_idx" ON "VoterVA"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterVA_General_2016_idx" ON "VoterVA"("General_2016");

-- CreateIndex
CREATE INDEX "VoterVA_Primary_2016_idx" ON "VoterVA"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterVA_PresidentialPrimary_2016_idx" ON "VoterVA"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterVA_OtherElection_2016_idx" ON "VoterVA"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterWA_LALVOTERID_key" ON "VoterWA"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterWA_US_Congressional_District_idx" ON "VoterWA"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterWA_State_Senate_District_idx" ON "VoterWA"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterWA_State_House_District_idx" ON "VoterWA"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterWA_County_Legislative_District_idx" ON "VoterWA"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterWA_City_idx" ON "VoterWA"("City");

-- CreateIndex
CREATE INDEX "VoterWA_County_idx" ON "VoterWA"("County");

-- CreateIndex
CREATE INDEX "VoterWA_City_Council_Commissioner_District_idx" ON "VoterWA"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterWA_City_Mayoral_District_idx" ON "VoterWA"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterWA_Town_District_idx" ON "VoterWA"("Town_District");

-- CreateIndex
CREATE INDEX "VoterWA_Town_Council_idx" ON "VoterWA"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterWA_Village_idx" ON "VoterWA"("Village");

-- CreateIndex
CREATE INDEX "VoterWA_Township_idx" ON "VoterWA"("Township");

-- CreateIndex
CREATE INDEX "VoterWA_Borough_idx" ON "VoterWA"("Borough");

-- CreateIndex
CREATE INDEX "VoterWA_Hamlet_Community_Area_idx" ON "VoterWA"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterWA_Board_of_Education_District_idx" ON "VoterWA"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterWA_Board_of_Education_SubDistrict_idx" ON "VoterWA"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterWA_City_School_District_idx" ON "VoterWA"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterWA_College_Board_District_idx" ON "VoterWA"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterWA_Community_College_Commissioner_District_idx" ON "VoterWA"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterWA_Community_College_SubDistrict_idx" ON "VoterWA"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterWA_County_Board_of_Education_District_idx" ON "VoterWA"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterWA_County_Board_of_Education_SubDistrict_idx" ON "VoterWA"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterWA_County_Community_College_District_idx" ON "VoterWA"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterWA_County_Superintendent_of_Schools_District_idx" ON "VoterWA"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterWA_County_Unified_School_District_idx" ON "VoterWA"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterWA_District_Attorney_idx" ON "VoterWA"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterWA_Education_Commission_District_idx" ON "VoterWA"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterWA_Educational_Service_District_idx" ON "VoterWA"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterWA_Election_Commissioner_District_idx" ON "VoterWA"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterWA_Elementary_School_District_idx" ON "VoterWA"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterWA_Elementary_School_SubDistrict_idx" ON "VoterWA"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterWA_Exempted_Village_School_District_idx" ON "VoterWA"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterWA_High_School_District_idx" ON "VoterWA"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterWA_High_School_SubDistrict_idx" ON "VoterWA"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterWA_Judicial_Appellate_District_idx" ON "VoterWA"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterWA_Judicial_Circuit_Court_District_idx" ON "VoterWA"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterWA_Judicial_County_Board_of_Review_District_idx" ON "VoterWA"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterWA_Judicial_County_Court_District_idx" ON "VoterWA"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterWA_Judicial_District_idx" ON "VoterWA"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterWA_Judicial_District_Court_District_idx" ON "VoterWA"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterWA_Judicial_Family_Court_District_idx" ON "VoterWA"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterWA_Judicial_Jury_District_idx" ON "VoterWA"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterWA_Judicial_Juvenile_Court_District_idx" ON "VoterWA"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterWA_Judicial_Magistrate_Division_idx" ON "VoterWA"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterWA_Judicial_Sub_Circuit_District_idx" ON "VoterWA"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterWA_Judicial_Superior_Court_District_idx" ON "VoterWA"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterWA_Judicial_Supreme_Court_District_idx" ON "VoterWA"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterWA_Middle_School_District_idx" ON "VoterWA"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterWA_Municipal_Court_District_idx" ON "VoterWA"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterWA_Proposed_City_Commissioner_District_idx" ON "VoterWA"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterWA_Proposed_Elementary_School_District_idx" ON "VoterWA"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterWA_Proposed_Unified_School_District_idx" ON "VoterWA"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterWA_Regional_Office_of_Education_District_idx" ON "VoterWA"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterWA_School_Board_District_idx" ON "VoterWA"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterWA_School_District_idx" ON "VoterWA"("School_District");

-- CreateIndex
CREATE INDEX "VoterWA_School_District_Vocational_idx" ON "VoterWA"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterWA_School_Facilities_Improvement_District_idx" ON "VoterWA"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterWA_School_Subdistrict_idx" ON "VoterWA"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterWA_Service_Area_District_idx" ON "VoterWA"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterWA_Superintendent_of_Schools_District_idx" ON "VoterWA"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterWA_Unified_School_District_idx" ON "VoterWA"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterWA_Unified_School_SubDistrict_idx" ON "VoterWA"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterWA_Voters_FirstName_idx" ON "VoterWA"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterWA_Voters_MiddleName_idx" ON "VoterWA"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterWA_Voters_LastName_idx" ON "VoterWA"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterWA_Voters_Active_idx" ON "VoterWA"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterWA_MilitaryStatus_Description_idx" ON "VoterWA"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterWA_Voters_Age_idx" ON "VoterWA"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterWA_Parties_Description_idx" ON "VoterWA"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterWA_VoterParties_Change_Changed_Party_idx" ON "VoterWA"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterWA_Voters_CalculatedRegDate_idx" ON "VoterWA"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterWA_Voters_OfficialRegDate_idx" ON "VoterWA"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterWA_VoterTelephones_CellConfidenceCode_idx" ON "VoterWA"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterWA_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterWA"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterWA_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterWA"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterWA_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterWA"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterWA_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterWA"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterWA_Voters_VotingPerformanceMinorElection_idx" ON "VoterWA"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterWA_General_2022_idx" ON "VoterWA"("General_2022");

-- CreateIndex
CREATE INDEX "VoterWA_Primary_2022_idx" ON "VoterWA"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterWA_OtherElection_2022_idx" ON "VoterWA"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterWA_AnyElection_2021_idx" ON "VoterWA"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterWA_General_2020_idx" ON "VoterWA"("General_2020");

-- CreateIndex
CREATE INDEX "VoterWA_Primary_2020_idx" ON "VoterWA"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterWA_PresidentialPrimary_2020_idx" ON "VoterWA"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterWA_OtherElection_2020_idx" ON "VoterWA"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterWA_AnyElection_2019_idx" ON "VoterWA"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterWA_General_2018_idx" ON "VoterWA"("General_2018");

-- CreateIndex
CREATE INDEX "VoterWA_Primary_2018_idx" ON "VoterWA"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterWA_OtherElection_2018_idx" ON "VoterWA"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterWA_AnyElection_2017_idx" ON "VoterWA"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterWA_General_2016_idx" ON "VoterWA"("General_2016");

-- CreateIndex
CREATE INDEX "VoterWA_Primary_2016_idx" ON "VoterWA"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterWA_PresidentialPrimary_2016_idx" ON "VoterWA"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterWA_OtherElection_2016_idx" ON "VoterWA"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterWV_LALVOTERID_key" ON "VoterWV"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterWV_US_Congressional_District_idx" ON "VoterWV"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterWV_State_Senate_District_idx" ON "VoterWV"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterWV_State_House_District_idx" ON "VoterWV"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterWV_County_Legislative_District_idx" ON "VoterWV"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterWV_City_idx" ON "VoterWV"("City");

-- CreateIndex
CREATE INDEX "VoterWV_County_idx" ON "VoterWV"("County");

-- CreateIndex
CREATE INDEX "VoterWV_City_Council_Commissioner_District_idx" ON "VoterWV"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterWV_City_Mayoral_District_idx" ON "VoterWV"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterWV_Town_District_idx" ON "VoterWV"("Town_District");

-- CreateIndex
CREATE INDEX "VoterWV_Town_Council_idx" ON "VoterWV"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterWV_Village_idx" ON "VoterWV"("Village");

-- CreateIndex
CREATE INDEX "VoterWV_Township_idx" ON "VoterWV"("Township");

-- CreateIndex
CREATE INDEX "VoterWV_Borough_idx" ON "VoterWV"("Borough");

-- CreateIndex
CREATE INDEX "VoterWV_Hamlet_Community_Area_idx" ON "VoterWV"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterWV_Board_of_Education_District_idx" ON "VoterWV"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterWV_Board_of_Education_SubDistrict_idx" ON "VoterWV"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterWV_City_School_District_idx" ON "VoterWV"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterWV_College_Board_District_idx" ON "VoterWV"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterWV_Community_College_Commissioner_District_idx" ON "VoterWV"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterWV_Community_College_SubDistrict_idx" ON "VoterWV"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterWV_County_Board_of_Education_District_idx" ON "VoterWV"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterWV_County_Board_of_Education_SubDistrict_idx" ON "VoterWV"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterWV_County_Community_College_District_idx" ON "VoterWV"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterWV_County_Superintendent_of_Schools_District_idx" ON "VoterWV"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterWV_County_Unified_School_District_idx" ON "VoterWV"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterWV_District_Attorney_idx" ON "VoterWV"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterWV_Education_Commission_District_idx" ON "VoterWV"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterWV_Educational_Service_District_idx" ON "VoterWV"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterWV_Election_Commissioner_District_idx" ON "VoterWV"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterWV_Elementary_School_District_idx" ON "VoterWV"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterWV_Elementary_School_SubDistrict_idx" ON "VoterWV"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterWV_Exempted_Village_School_District_idx" ON "VoterWV"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterWV_High_School_District_idx" ON "VoterWV"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterWV_High_School_SubDistrict_idx" ON "VoterWV"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterWV_Judicial_Appellate_District_idx" ON "VoterWV"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterWV_Judicial_Circuit_Court_District_idx" ON "VoterWV"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterWV_Judicial_County_Board_of_Review_District_idx" ON "VoterWV"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterWV_Judicial_County_Court_District_idx" ON "VoterWV"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterWV_Judicial_District_idx" ON "VoterWV"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterWV_Judicial_District_Court_District_idx" ON "VoterWV"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterWV_Judicial_Family_Court_District_idx" ON "VoterWV"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterWV_Judicial_Jury_District_idx" ON "VoterWV"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterWV_Judicial_Juvenile_Court_District_idx" ON "VoterWV"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterWV_Judicial_Magistrate_Division_idx" ON "VoterWV"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterWV_Judicial_Sub_Circuit_District_idx" ON "VoterWV"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterWV_Judicial_Superior_Court_District_idx" ON "VoterWV"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterWV_Judicial_Supreme_Court_District_idx" ON "VoterWV"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterWV_Middle_School_District_idx" ON "VoterWV"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterWV_Municipal_Court_District_idx" ON "VoterWV"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterWV_Proposed_City_Commissioner_District_idx" ON "VoterWV"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterWV_Proposed_Elementary_School_District_idx" ON "VoterWV"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterWV_Proposed_Unified_School_District_idx" ON "VoterWV"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterWV_Regional_Office_of_Education_District_idx" ON "VoterWV"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterWV_School_Board_District_idx" ON "VoterWV"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterWV_School_District_idx" ON "VoterWV"("School_District");

-- CreateIndex
CREATE INDEX "VoterWV_School_District_Vocational_idx" ON "VoterWV"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterWV_School_Facilities_Improvement_District_idx" ON "VoterWV"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterWV_School_Subdistrict_idx" ON "VoterWV"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterWV_Service_Area_District_idx" ON "VoterWV"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterWV_Superintendent_of_Schools_District_idx" ON "VoterWV"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterWV_Unified_School_District_idx" ON "VoterWV"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterWV_Unified_School_SubDistrict_idx" ON "VoterWV"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterWV_Voters_FirstName_idx" ON "VoterWV"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterWV_Voters_MiddleName_idx" ON "VoterWV"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterWV_Voters_LastName_idx" ON "VoterWV"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterWV_Voters_Active_idx" ON "VoterWV"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterWV_MilitaryStatus_Description_idx" ON "VoterWV"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterWV_Voters_Age_idx" ON "VoterWV"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterWV_Parties_Description_idx" ON "VoterWV"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterWV_VoterParties_Change_Changed_Party_idx" ON "VoterWV"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterWV_Voters_CalculatedRegDate_idx" ON "VoterWV"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterWV_Voters_OfficialRegDate_idx" ON "VoterWV"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterWV_VoterTelephones_CellConfidenceCode_idx" ON "VoterWV"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterWV_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterWV"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterWV_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterWV"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterWV_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterWV"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterWV_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterWV"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterWV_Voters_VotingPerformanceMinorElection_idx" ON "VoterWV"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterWV_General_2022_idx" ON "VoterWV"("General_2022");

-- CreateIndex
CREATE INDEX "VoterWV_Primary_2022_idx" ON "VoterWV"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterWV_OtherElection_2022_idx" ON "VoterWV"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterWV_AnyElection_2021_idx" ON "VoterWV"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterWV_General_2020_idx" ON "VoterWV"("General_2020");

-- CreateIndex
CREATE INDEX "VoterWV_Primary_2020_idx" ON "VoterWV"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterWV_PresidentialPrimary_2020_idx" ON "VoterWV"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterWV_OtherElection_2020_idx" ON "VoterWV"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterWV_AnyElection_2019_idx" ON "VoterWV"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterWV_General_2018_idx" ON "VoterWV"("General_2018");

-- CreateIndex
CREATE INDEX "VoterWV_Primary_2018_idx" ON "VoterWV"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterWV_OtherElection_2018_idx" ON "VoterWV"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterWV_AnyElection_2017_idx" ON "VoterWV"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterWV_General_2016_idx" ON "VoterWV"("General_2016");

-- CreateIndex
CREATE INDEX "VoterWV_Primary_2016_idx" ON "VoterWV"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterWV_PresidentialPrimary_2016_idx" ON "VoterWV"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterWV_OtherElection_2016_idx" ON "VoterWV"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterWI_LALVOTERID_key" ON "VoterWI"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterWI_US_Congressional_District_idx" ON "VoterWI"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterWI_State_Senate_District_idx" ON "VoterWI"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterWI_State_House_District_idx" ON "VoterWI"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterWI_County_Legislative_District_idx" ON "VoterWI"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterWI_City_idx" ON "VoterWI"("City");

-- CreateIndex
CREATE INDEX "VoterWI_County_idx" ON "VoterWI"("County");

-- CreateIndex
CREATE INDEX "VoterWI_City_Council_Commissioner_District_idx" ON "VoterWI"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterWI_City_Mayoral_District_idx" ON "VoterWI"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterWI_Town_District_idx" ON "VoterWI"("Town_District");

-- CreateIndex
CREATE INDEX "VoterWI_Town_Council_idx" ON "VoterWI"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterWI_Village_idx" ON "VoterWI"("Village");

-- CreateIndex
CREATE INDEX "VoterWI_Township_idx" ON "VoterWI"("Township");

-- CreateIndex
CREATE INDEX "VoterWI_Borough_idx" ON "VoterWI"("Borough");

-- CreateIndex
CREATE INDEX "VoterWI_Hamlet_Community_Area_idx" ON "VoterWI"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterWI_Board_of_Education_District_idx" ON "VoterWI"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterWI_Board_of_Education_SubDistrict_idx" ON "VoterWI"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterWI_City_School_District_idx" ON "VoterWI"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterWI_College_Board_District_idx" ON "VoterWI"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterWI_Community_College_Commissioner_District_idx" ON "VoterWI"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterWI_Community_College_SubDistrict_idx" ON "VoterWI"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterWI_County_Board_of_Education_District_idx" ON "VoterWI"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterWI_County_Board_of_Education_SubDistrict_idx" ON "VoterWI"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterWI_County_Community_College_District_idx" ON "VoterWI"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterWI_County_Superintendent_of_Schools_District_idx" ON "VoterWI"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterWI_County_Unified_School_District_idx" ON "VoterWI"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterWI_District_Attorney_idx" ON "VoterWI"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterWI_Education_Commission_District_idx" ON "VoterWI"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterWI_Educational_Service_District_idx" ON "VoterWI"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterWI_Election_Commissioner_District_idx" ON "VoterWI"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterWI_Elementary_School_District_idx" ON "VoterWI"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterWI_Elementary_School_SubDistrict_idx" ON "VoterWI"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterWI_Exempted_Village_School_District_idx" ON "VoterWI"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterWI_High_School_District_idx" ON "VoterWI"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterWI_High_School_SubDistrict_idx" ON "VoterWI"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterWI_Judicial_Appellate_District_idx" ON "VoterWI"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterWI_Judicial_Circuit_Court_District_idx" ON "VoterWI"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterWI_Judicial_County_Board_of_Review_District_idx" ON "VoterWI"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterWI_Judicial_County_Court_District_idx" ON "VoterWI"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterWI_Judicial_District_idx" ON "VoterWI"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterWI_Judicial_District_Court_District_idx" ON "VoterWI"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterWI_Judicial_Family_Court_District_idx" ON "VoterWI"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterWI_Judicial_Jury_District_idx" ON "VoterWI"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterWI_Judicial_Juvenile_Court_District_idx" ON "VoterWI"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterWI_Judicial_Magistrate_Division_idx" ON "VoterWI"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterWI_Judicial_Sub_Circuit_District_idx" ON "VoterWI"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterWI_Judicial_Superior_Court_District_idx" ON "VoterWI"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterWI_Judicial_Supreme_Court_District_idx" ON "VoterWI"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterWI_Middle_School_District_idx" ON "VoterWI"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterWI_Municipal_Court_District_idx" ON "VoterWI"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterWI_Proposed_City_Commissioner_District_idx" ON "VoterWI"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterWI_Proposed_Elementary_School_District_idx" ON "VoterWI"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterWI_Proposed_Unified_School_District_idx" ON "VoterWI"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterWI_Regional_Office_of_Education_District_idx" ON "VoterWI"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterWI_School_Board_District_idx" ON "VoterWI"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterWI_School_District_idx" ON "VoterWI"("School_District");

-- CreateIndex
CREATE INDEX "VoterWI_School_District_Vocational_idx" ON "VoterWI"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterWI_School_Facilities_Improvement_District_idx" ON "VoterWI"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterWI_School_Subdistrict_idx" ON "VoterWI"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterWI_Service_Area_District_idx" ON "VoterWI"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterWI_Superintendent_of_Schools_District_idx" ON "VoterWI"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterWI_Unified_School_District_idx" ON "VoterWI"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterWI_Unified_School_SubDistrict_idx" ON "VoterWI"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterWI_Voters_FirstName_idx" ON "VoterWI"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterWI_Voters_MiddleName_idx" ON "VoterWI"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterWI_Voters_LastName_idx" ON "VoterWI"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterWI_Voters_Active_idx" ON "VoterWI"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterWI_MilitaryStatus_Description_idx" ON "VoterWI"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterWI_Voters_Age_idx" ON "VoterWI"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterWI_Parties_Description_idx" ON "VoterWI"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterWI_VoterParties_Change_Changed_Party_idx" ON "VoterWI"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterWI_Voters_CalculatedRegDate_idx" ON "VoterWI"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterWI_Voters_OfficialRegDate_idx" ON "VoterWI"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterWI_VoterTelephones_CellConfidenceCode_idx" ON "VoterWI"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterWI_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterWI"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterWI_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterWI"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterWI_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterWI"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterWI_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterWI"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterWI_Voters_VotingPerformanceMinorElection_idx" ON "VoterWI"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterWI_General_2022_idx" ON "VoterWI"("General_2022");

-- CreateIndex
CREATE INDEX "VoterWI_Primary_2022_idx" ON "VoterWI"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterWI_OtherElection_2022_idx" ON "VoterWI"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterWI_AnyElection_2021_idx" ON "VoterWI"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterWI_General_2020_idx" ON "VoterWI"("General_2020");

-- CreateIndex
CREATE INDEX "VoterWI_Primary_2020_idx" ON "VoterWI"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterWI_PresidentialPrimary_2020_idx" ON "VoterWI"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterWI_OtherElection_2020_idx" ON "VoterWI"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterWI_AnyElection_2019_idx" ON "VoterWI"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterWI_General_2018_idx" ON "VoterWI"("General_2018");

-- CreateIndex
CREATE INDEX "VoterWI_Primary_2018_idx" ON "VoterWI"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterWI_OtherElection_2018_idx" ON "VoterWI"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterWI_AnyElection_2017_idx" ON "VoterWI"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterWI_General_2016_idx" ON "VoterWI"("General_2016");

-- CreateIndex
CREATE INDEX "VoterWI_Primary_2016_idx" ON "VoterWI"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterWI_PresidentialPrimary_2016_idx" ON "VoterWI"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterWI_OtherElection_2016_idx" ON "VoterWI"("OtherElection_2016");

-- CreateIndex
CREATE UNIQUE INDEX "VoterWY_LALVOTERID_key" ON "VoterWY"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterWY_US_Congressional_District_idx" ON "VoterWY"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterWY_State_Senate_District_idx" ON "VoterWY"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterWY_State_House_District_idx" ON "VoterWY"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterWY_County_Legislative_District_idx" ON "VoterWY"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterWY_City_idx" ON "VoterWY"("City");

-- CreateIndex
CREATE INDEX "VoterWY_County_idx" ON "VoterWY"("County");

-- CreateIndex
CREATE INDEX "VoterWY_City_Council_Commissioner_District_idx" ON "VoterWY"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterWY_City_Mayoral_District_idx" ON "VoterWY"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterWY_Town_District_idx" ON "VoterWY"("Town_District");

-- CreateIndex
CREATE INDEX "VoterWY_Town_Council_idx" ON "VoterWY"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterWY_Village_idx" ON "VoterWY"("Village");

-- CreateIndex
CREATE INDEX "VoterWY_Township_idx" ON "VoterWY"("Township");

-- CreateIndex
CREATE INDEX "VoterWY_Borough_idx" ON "VoterWY"("Borough");

-- CreateIndex
CREATE INDEX "VoterWY_Hamlet_Community_Area_idx" ON "VoterWY"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterWY_Board_of_Education_District_idx" ON "VoterWY"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterWY_Board_of_Education_SubDistrict_idx" ON "VoterWY"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterWY_City_School_District_idx" ON "VoterWY"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterWY_College_Board_District_idx" ON "VoterWY"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterWY_Community_College_Commissioner_District_idx" ON "VoterWY"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterWY_Community_College_SubDistrict_idx" ON "VoterWY"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterWY_County_Board_of_Education_District_idx" ON "VoterWY"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterWY_County_Board_of_Education_SubDistrict_idx" ON "VoterWY"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterWY_County_Community_College_District_idx" ON "VoterWY"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterWY_County_Superintendent_of_Schools_District_idx" ON "VoterWY"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterWY_County_Unified_School_District_idx" ON "VoterWY"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterWY_District_Attorney_idx" ON "VoterWY"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterWY_Education_Commission_District_idx" ON "VoterWY"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterWY_Educational_Service_District_idx" ON "VoterWY"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterWY_Election_Commissioner_District_idx" ON "VoterWY"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterWY_Elementary_School_District_idx" ON "VoterWY"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterWY_Elementary_School_SubDistrict_idx" ON "VoterWY"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterWY_Exempted_Village_School_District_idx" ON "VoterWY"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterWY_High_School_District_idx" ON "VoterWY"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterWY_High_School_SubDistrict_idx" ON "VoterWY"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterWY_Judicial_Appellate_District_idx" ON "VoterWY"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterWY_Judicial_Circuit_Court_District_idx" ON "VoterWY"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterWY_Judicial_County_Board_of_Review_District_idx" ON "VoterWY"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterWY_Judicial_County_Court_District_idx" ON "VoterWY"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterWY_Judicial_District_idx" ON "VoterWY"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterWY_Judicial_District_Court_District_idx" ON "VoterWY"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterWY_Judicial_Family_Court_District_idx" ON "VoterWY"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterWY_Judicial_Jury_District_idx" ON "VoterWY"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterWY_Judicial_Juvenile_Court_District_idx" ON "VoterWY"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterWY_Judicial_Magistrate_Division_idx" ON "VoterWY"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterWY_Judicial_Sub_Circuit_District_idx" ON "VoterWY"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterWY_Judicial_Superior_Court_District_idx" ON "VoterWY"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterWY_Judicial_Supreme_Court_District_idx" ON "VoterWY"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterWY_Middle_School_District_idx" ON "VoterWY"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterWY_Municipal_Court_District_idx" ON "VoterWY"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterWY_Proposed_City_Commissioner_District_idx" ON "VoterWY"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterWY_Proposed_Elementary_School_District_idx" ON "VoterWY"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterWY_Proposed_Unified_School_District_idx" ON "VoterWY"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterWY_Regional_Office_of_Education_District_idx" ON "VoterWY"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterWY_School_Board_District_idx" ON "VoterWY"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterWY_School_District_idx" ON "VoterWY"("School_District");

-- CreateIndex
CREATE INDEX "VoterWY_School_District_Vocational_idx" ON "VoterWY"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterWY_School_Facilities_Improvement_District_idx" ON "VoterWY"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterWY_School_Subdistrict_idx" ON "VoterWY"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterWY_Service_Area_District_idx" ON "VoterWY"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterWY_Superintendent_of_Schools_District_idx" ON "VoterWY"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterWY_Unified_School_District_idx" ON "VoterWY"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterWY_Unified_School_SubDistrict_idx" ON "VoterWY"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterWY_Voters_FirstName_idx" ON "VoterWY"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterWY_Voters_MiddleName_idx" ON "VoterWY"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterWY_Voters_LastName_idx" ON "VoterWY"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterWY_Voters_Active_idx" ON "VoterWY"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterWY_MilitaryStatus_Description_idx" ON "VoterWY"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterWY_Voters_Age_idx" ON "VoterWY"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterWY_Parties_Description_idx" ON "VoterWY"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterWY_VoterParties_Change_Changed_Party_idx" ON "VoterWY"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterWY_Voters_CalculatedRegDate_idx" ON "VoterWY"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterWY_Voters_OfficialRegDate_idx" ON "VoterWY"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterWY_VoterTelephones_CellConfidenceCode_idx" ON "VoterWY"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterWY_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterWY"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterWY_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterWY"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterWY_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterWY"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterWY_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterWY"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterWY_Voters_VotingPerformanceMinorElection_idx" ON "VoterWY"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterWY_General_2022_idx" ON "VoterWY"("General_2022");

-- CreateIndex
CREATE INDEX "VoterWY_Primary_2022_idx" ON "VoterWY"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterWY_OtherElection_2022_idx" ON "VoterWY"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterWY_AnyElection_2021_idx" ON "VoterWY"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterWY_General_2020_idx" ON "VoterWY"("General_2020");

-- CreateIndex
CREATE INDEX "VoterWY_Primary_2020_idx" ON "VoterWY"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterWY_PresidentialPrimary_2020_idx" ON "VoterWY"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterWY_OtherElection_2020_idx" ON "VoterWY"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterWY_AnyElection_2019_idx" ON "VoterWY"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterWY_General_2018_idx" ON "VoterWY"("General_2018");

-- CreateIndex
CREATE INDEX "VoterWY_Primary_2018_idx" ON "VoterWY"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterWY_OtherElection_2018_idx" ON "VoterWY"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterWY_AnyElection_2017_idx" ON "VoterWY"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterWY_General_2016_idx" ON "VoterWY"("General_2016");

-- CreateIndex
CREATE INDEX "VoterWY_Primary_2016_idx" ON "VoterWY"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterWY_PresidentialPrimary_2016_idx" ON "VoterWY"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterWY_OtherElection_2016_idx" ON "VoterWY"("OtherElection_2016");
