-- CreateTable
CREATE TABLE "Voter" (
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

    CONSTRAINT "Voter_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateIndex
CREATE UNIQUE INDEX "Voter_LALVOTERID_key" ON "Voter"("LALVOTERID");

-- CreateIndex
CREATE INDEX "Voter_US_Congressional_District_idx" ON "Voter"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "Voter_State_Senate_District_idx" ON "Voter"("State_Senate_District");

-- CreateIndex
CREATE INDEX "Voter_State_House_District_idx" ON "Voter"("State_House_District");

-- CreateIndex
CREATE INDEX "Voter_County_Legislative_District_idx" ON "Voter"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "Voter_City_idx" ON "Voter"("City");

-- CreateIndex
CREATE INDEX "Voter_County_idx" ON "Voter"("County");

-- CreateIndex
CREATE INDEX "Voter_City_Council_Commissioner_District_idx" ON "Voter"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "Voter_City_Mayoral_District_idx" ON "Voter"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "Voter_Town_District_idx" ON "Voter"("Town_District");

-- CreateIndex
CREATE INDEX "Voter_Town_Council_idx" ON "Voter"("Town_Council");

-- CreateIndex
CREATE INDEX "Voter_Village_idx" ON "Voter"("Village");

-- CreateIndex
CREATE INDEX "Voter_Township_idx" ON "Voter"("Township");

-- CreateIndex
CREATE INDEX "Voter_Borough_idx" ON "Voter"("Borough");

-- CreateIndex
CREATE INDEX "Voter_Hamlet_Community_Area_idx" ON "Voter"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "Voter_Board_of_Education_District_idx" ON "Voter"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "Voter_Board_of_Education_SubDistrict_idx" ON "Voter"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "Voter_City_School_District_idx" ON "Voter"("City_School_District");

-- CreateIndex
CREATE INDEX "Voter_College_Board_District_idx" ON "Voter"("College_Board_District");

-- CreateIndex
CREATE INDEX "Voter_Community_College_Commissioner_District_idx" ON "Voter"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "Voter_Community_College_SubDistrict_idx" ON "Voter"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "Voter_County_Board_of_Education_District_idx" ON "Voter"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "Voter_County_Board_of_Education_SubDistrict_idx" ON "Voter"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "Voter_County_Community_College_District_idx" ON "Voter"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "Voter_County_Superintendent_of_Schools_District_idx" ON "Voter"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "Voter_County_Unified_School_District_idx" ON "Voter"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "Voter_District_Attorney_idx" ON "Voter"("District_Attorney");

-- CreateIndex
CREATE INDEX "Voter_Education_Commission_District_idx" ON "Voter"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "Voter_Educational_Service_District_idx" ON "Voter"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "Voter_Election_Commissioner_District_idx" ON "Voter"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "Voter_Elementary_School_District_idx" ON "Voter"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "Voter_Elementary_School_SubDistrict_idx" ON "Voter"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "Voter_Exempted_Village_School_District_idx" ON "Voter"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "Voter_High_School_District_idx" ON "Voter"("High_School_District");

-- CreateIndex
CREATE INDEX "Voter_High_School_SubDistrict_idx" ON "Voter"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "Voter_Judicial_Appellate_District_idx" ON "Voter"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "Voter_Judicial_Circuit_Court_District_idx" ON "Voter"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "Voter_Judicial_County_Board_of_Review_District_idx" ON "Voter"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "Voter_Judicial_County_Court_District_idx" ON "Voter"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "Voter_Judicial_District_idx" ON "Voter"("Judicial_District");

-- CreateIndex
CREATE INDEX "Voter_Judicial_District_Court_District_idx" ON "Voter"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "Voter_Judicial_Family_Court_District_idx" ON "Voter"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "Voter_Judicial_Jury_District_idx" ON "Voter"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "Voter_Judicial_Juvenile_Court_District_idx" ON "Voter"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "Voter_Judicial_Magistrate_Division_idx" ON "Voter"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "Voter_Judicial_Sub_Circuit_District_idx" ON "Voter"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "Voter_Judicial_Superior_Court_District_idx" ON "Voter"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "Voter_Judicial_Supreme_Court_District_idx" ON "Voter"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "Voter_Middle_School_District_idx" ON "Voter"("Middle_School_District");

-- CreateIndex
CREATE INDEX "Voter_Municipal_Court_District_idx" ON "Voter"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "Voter_Proposed_City_Commissioner_District_idx" ON "Voter"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "Voter_Proposed_Elementary_School_District_idx" ON "Voter"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "Voter_Proposed_Unified_School_District_idx" ON "Voter"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "Voter_Regional_Office_of_Education_District_idx" ON "Voter"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "Voter_School_Board_District_idx" ON "Voter"("School_Board_District");

-- CreateIndex
CREATE INDEX "Voter_School_District_idx" ON "Voter"("School_District");

-- CreateIndex
CREATE INDEX "Voter_School_District_Vocational_idx" ON "Voter"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "Voter_School_Facilities_Improvement_District_idx" ON "Voter"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "Voter_School_Subdistrict_idx" ON "Voter"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "Voter_Service_Area_District_idx" ON "Voter"("Service_Area_District");

-- CreateIndex
CREATE INDEX "Voter_Superintendent_of_Schools_District_idx" ON "Voter"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "Voter_Unified_School_District_idx" ON "Voter"("Unified_School_District");

-- CreateIndex
CREATE INDEX "Voter_Unified_School_SubDistrict_idx" ON "Voter"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "Voter_Voters_FirstName_idx" ON "Voter"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "Voter_Voters_MiddleName_idx" ON "Voter"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "Voter_Voters_LastName_idx" ON "Voter"("Voters_LastName");

-- CreateIndex
CREATE INDEX "Voter_Voters_Active_idx" ON "Voter"("Voters_Active");

-- CreateIndex
CREATE INDEX "Voter_MilitaryStatus_Description_idx" ON "Voter"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "Voter_Voters_Age_idx" ON "Voter"("Voters_Age");

-- CreateIndex
CREATE INDEX "Voter_Parties_Description_idx" ON "Voter"("Parties_Description");

-- CreateIndex
CREATE INDEX "Voter_VoterParties_Change_Changed_Party_idx" ON "Voter"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "Voter_Voters_CalculatedRegDate_idx" ON "Voter"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "Voter_Voters_OfficialRegDate_idx" ON "Voter"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "Voter_VoterTelephones_CellConfidenceCode_idx" ON "Voter"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "Voter_VoterTelephones_LandlineConfidenceCode_idx" ON "Voter"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "Voter_Voters_VotingPerformanceEvenYearGeneral_idx" ON "Voter"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "Voter_Voters_VotingPerformanceEvenYearPrimary_idx" ON "Voter"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "Voter_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "Voter"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "Voter_Voters_VotingPerformanceMinorElection_idx" ON "Voter"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "Voter_General_2022_idx" ON "Voter"("General_2022");

-- CreateIndex
CREATE INDEX "Voter_Primary_2022_idx" ON "Voter"("Primary_2022");

-- CreateIndex
CREATE INDEX "Voter_OtherElection_2022_idx" ON "Voter"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "Voter_AnyElection_2021_idx" ON "Voter"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "Voter_General_2020_idx" ON "Voter"("General_2020");

-- CreateIndex
CREATE INDEX "Voter_Primary_2020_idx" ON "Voter"("Primary_2020");

-- CreateIndex
CREATE INDEX "Voter_PresidentialPrimary_2020_idx" ON "Voter"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "Voter_OtherElection_2020_idx" ON "Voter"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "Voter_AnyElection_2019_idx" ON "Voter"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "Voter_General_2018_idx" ON "Voter"("General_2018");

-- CreateIndex
CREATE INDEX "Voter_Primary_2018_idx" ON "Voter"("Primary_2018");

-- CreateIndex
CREATE INDEX "Voter_OtherElection_2018_idx" ON "Voter"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "Voter_AnyElection_2017_idx" ON "Voter"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "Voter_General_2016_idx" ON "Voter"("General_2016");

-- CreateIndex
CREATE INDEX "Voter_Primary_2016_idx" ON "Voter"("Primary_2016");

-- CreateIndex
CREATE INDEX "Voter_PresidentialPrimary_2016_idx" ON "Voter"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "Voter_OtherElection_2016_idx" ON "Voter"("OtherElection_2016");
