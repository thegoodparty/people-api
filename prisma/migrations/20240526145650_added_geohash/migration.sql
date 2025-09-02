-- AlterTable
ALTER TABLE "VoterAK" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterAL" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterAR" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterAZ" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterCA" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterCO" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterCT" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterDE" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterFL" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterGA" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterHI" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterIA" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterID" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterIL" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterIN" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterKS" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterKY" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterLA" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterMA" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterMD" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterME" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterMI" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterMN" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterMO" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterMS" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterMT" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterNC" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterND" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterNE" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterNH" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterNJ" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterNM" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterNV" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterNY" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterOH" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterOK" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterOR" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterPA" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterRI" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterSC" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterSD" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterTN" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterTX" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterUT" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterVA" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterVT" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterWA" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterWI" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterWV" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- AlterTable
ALTER TABLE "VoterWY" ADD COLUMN     "Residence_Addresses_GeoHash" TEXT;

-- CreateTable
CREATE TABLE "VoterDC" (
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
    "Residence_Addresses_GeoHash" TEXT,
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

    CONSTRAINT "VoterDC_pkey" PRIMARY KEY ("LALVOTERID")
);

-- CreateIndex
CREATE UNIQUE INDEX "VoterDC_LALVOTERID_key" ON "VoterDC"("LALVOTERID");

-- CreateIndex
CREATE INDEX "VoterDC_US_Congressional_District_idx" ON "VoterDC"("US_Congressional_District");

-- CreateIndex
CREATE INDEX "VoterDC_State_Senate_District_idx" ON "VoterDC"("State_Senate_District");

-- CreateIndex
CREATE INDEX "VoterDC_State_House_District_idx" ON "VoterDC"("State_House_District");

-- CreateIndex
CREATE INDEX "VoterDC_County_Legislative_District_idx" ON "VoterDC"("County_Legislative_District");

-- CreateIndex
CREATE INDEX "VoterDC_City_idx" ON "VoterDC"("City");

-- CreateIndex
CREATE INDEX "VoterDC_County_idx" ON "VoterDC"("County");

-- CreateIndex
CREATE INDEX "VoterDC_City_Council_Commissioner_District_idx" ON "VoterDC"("City_Council_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterDC_City_Mayoral_District_idx" ON "VoterDC"("City_Mayoral_District");

-- CreateIndex
CREATE INDEX "VoterDC_Town_District_idx" ON "VoterDC"("Town_District");

-- CreateIndex
CREATE INDEX "VoterDC_Town_Council_idx" ON "VoterDC"("Town_Council");

-- CreateIndex
CREATE INDEX "VoterDC_Village_idx" ON "VoterDC"("Village");

-- CreateIndex
CREATE INDEX "VoterDC_Township_idx" ON "VoterDC"("Township");

-- CreateIndex
CREATE INDEX "VoterDC_Borough_idx" ON "VoterDC"("Borough");

-- CreateIndex
CREATE INDEX "VoterDC_Hamlet_Community_Area_idx" ON "VoterDC"("Hamlet_Community_Area");

-- CreateIndex
CREATE INDEX "VoterDC_Board_of_Education_District_idx" ON "VoterDC"("Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterDC_Board_of_Education_SubDistrict_idx" ON "VoterDC"("Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterDC_City_School_District_idx" ON "VoterDC"("City_School_District");

-- CreateIndex
CREATE INDEX "VoterDC_College_Board_District_idx" ON "VoterDC"("College_Board_District");

-- CreateIndex
CREATE INDEX "VoterDC_Community_College_Commissioner_District_idx" ON "VoterDC"("Community_College_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterDC_Community_College_SubDistrict_idx" ON "VoterDC"("Community_College_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterDC_County_Board_of_Education_District_idx" ON "VoterDC"("County_Board_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterDC_County_Board_of_Education_SubDistrict_idx" ON "VoterDC"("County_Board_of_Education_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterDC_County_Community_College_District_idx" ON "VoterDC"("County_Community_College_District");

-- CreateIndex
CREATE INDEX "VoterDC_County_Superintendent_of_Schools_District_idx" ON "VoterDC"("County_Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterDC_County_Unified_School_District_idx" ON "VoterDC"("County_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterDC_District_Attorney_idx" ON "VoterDC"("District_Attorney");

-- CreateIndex
CREATE INDEX "VoterDC_Education_Commission_District_idx" ON "VoterDC"("Education_Commission_District");

-- CreateIndex
CREATE INDEX "VoterDC_Educational_Service_District_idx" ON "VoterDC"("Educational_Service_District");

-- CreateIndex
CREATE INDEX "VoterDC_Election_Commissioner_District_idx" ON "VoterDC"("Election_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterDC_Elementary_School_District_idx" ON "VoterDC"("Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterDC_Elementary_School_SubDistrict_idx" ON "VoterDC"("Elementary_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterDC_Exempted_Village_School_District_idx" ON "VoterDC"("Exempted_Village_School_District");

-- CreateIndex
CREATE INDEX "VoterDC_High_School_District_idx" ON "VoterDC"("High_School_District");

-- CreateIndex
CREATE INDEX "VoterDC_High_School_SubDistrict_idx" ON "VoterDC"("High_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterDC_Judicial_Appellate_District_idx" ON "VoterDC"("Judicial_Appellate_District");

-- CreateIndex
CREATE INDEX "VoterDC_Judicial_Circuit_Court_District_idx" ON "VoterDC"("Judicial_Circuit_Court_District");

-- CreateIndex
CREATE INDEX "VoterDC_Judicial_County_Board_of_Review_District_idx" ON "VoterDC"("Judicial_County_Board_of_Review_District");

-- CreateIndex
CREATE INDEX "VoterDC_Judicial_County_Court_District_idx" ON "VoterDC"("Judicial_County_Court_District");

-- CreateIndex
CREATE INDEX "VoterDC_Judicial_District_idx" ON "VoterDC"("Judicial_District");

-- CreateIndex
CREATE INDEX "VoterDC_Judicial_District_Court_District_idx" ON "VoterDC"("Judicial_District_Court_District");

-- CreateIndex
CREATE INDEX "VoterDC_Judicial_Family_Court_District_idx" ON "VoterDC"("Judicial_Family_Court_District");

-- CreateIndex
CREATE INDEX "VoterDC_Judicial_Jury_District_idx" ON "VoterDC"("Judicial_Jury_District");

-- CreateIndex
CREATE INDEX "VoterDC_Judicial_Juvenile_Court_District_idx" ON "VoterDC"("Judicial_Juvenile_Court_District");

-- CreateIndex
CREATE INDEX "VoterDC_Judicial_Magistrate_Division_idx" ON "VoterDC"("Judicial_Magistrate_Division");

-- CreateIndex
CREATE INDEX "VoterDC_Judicial_Sub_Circuit_District_idx" ON "VoterDC"("Judicial_Sub_Circuit_District");

-- CreateIndex
CREATE INDEX "VoterDC_Judicial_Superior_Court_District_idx" ON "VoterDC"("Judicial_Superior_Court_District");

-- CreateIndex
CREATE INDEX "VoterDC_Judicial_Supreme_Court_District_idx" ON "VoterDC"("Judicial_Supreme_Court_District");

-- CreateIndex
CREATE INDEX "VoterDC_Middle_School_District_idx" ON "VoterDC"("Middle_School_District");

-- CreateIndex
CREATE INDEX "VoterDC_Municipal_Court_District_idx" ON "VoterDC"("Municipal_Court_District");

-- CreateIndex
CREATE INDEX "VoterDC_Proposed_City_Commissioner_District_idx" ON "VoterDC"("Proposed_City_Commissioner_District");

-- CreateIndex
CREATE INDEX "VoterDC_Proposed_Elementary_School_District_idx" ON "VoterDC"("Proposed_Elementary_School_District");

-- CreateIndex
CREATE INDEX "VoterDC_Proposed_Unified_School_District_idx" ON "VoterDC"("Proposed_Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterDC_Regional_Office_of_Education_District_idx" ON "VoterDC"("Regional_Office_of_Education_District");

-- CreateIndex
CREATE INDEX "VoterDC_School_Board_District_idx" ON "VoterDC"("School_Board_District");

-- CreateIndex
CREATE INDEX "VoterDC_School_District_idx" ON "VoterDC"("School_District");

-- CreateIndex
CREATE INDEX "VoterDC_School_District_Vocational_idx" ON "VoterDC"("School_District_Vocational");

-- CreateIndex
CREATE INDEX "VoterDC_School_Facilities_Improvement_District_idx" ON "VoterDC"("School_Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "VoterDC_School_Subdistrict_idx" ON "VoterDC"("School_Subdistrict");

-- CreateIndex
CREATE INDEX "VoterDC_Service_Area_District_idx" ON "VoterDC"("Service_Area_District");

-- CreateIndex
CREATE INDEX "VoterDC_Superintendent_of_Schools_District_idx" ON "VoterDC"("Superintendent_of_Schools_District");

-- CreateIndex
CREATE INDEX "VoterDC_Unified_School_District_idx" ON "VoterDC"("Unified_School_District");

-- CreateIndex
CREATE INDEX "VoterDC_Unified_School_SubDistrict_idx" ON "VoterDC"("Unified_School_SubDistrict");

-- CreateIndex
CREATE INDEX "VoterDC_Voters_FirstName_idx" ON "VoterDC"("Voters_FirstName");

-- CreateIndex
CREATE INDEX "VoterDC_Voters_MiddleName_idx" ON "VoterDC"("Voters_MiddleName");

-- CreateIndex
CREATE INDEX "VoterDC_Voters_LastName_idx" ON "VoterDC"("Voters_LastName");

-- CreateIndex
CREATE INDEX "VoterDC_Voters_Active_idx" ON "VoterDC"("Voters_Active");

-- CreateIndex
CREATE INDEX "VoterDC_MilitaryStatus_Description_idx" ON "VoterDC"("MilitaryStatus_Description");

-- CreateIndex
CREATE INDEX "VoterDC_Voters_Age_idx" ON "VoterDC"("Voters_Age");

-- CreateIndex
CREATE INDEX "VoterDC_Parties_Description_idx" ON "VoterDC"("Parties_Description");

-- CreateIndex
CREATE INDEX "VoterDC_VoterParties_Change_Changed_Party_idx" ON "VoterDC"("VoterParties_Change_Changed_Party");

-- CreateIndex
CREATE INDEX "VoterDC_Voters_CalculatedRegDate_idx" ON "VoterDC"("Voters_CalculatedRegDate");

-- CreateIndex
CREATE INDEX "VoterDC_Voters_OfficialRegDate_idx" ON "VoterDC"("Voters_OfficialRegDate");

-- CreateIndex
CREATE INDEX "VoterDC_VoterTelephones_CellConfidenceCode_idx" ON "VoterDC"("VoterTelephones_CellConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterDC_VoterTelephones_LandlineConfidenceCode_idx" ON "VoterDC"("VoterTelephones_LandlineConfidenceCode");

-- CreateIndex
CREATE INDEX "VoterDC_Voters_VotingPerformanceEvenYearGeneral_idx" ON "VoterDC"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "VoterDC_Voters_VotingPerformanceEvenYearPrimary_idx" ON "VoterDC"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "VoterDC_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "VoterDC"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "VoterDC_Voters_VotingPerformanceMinorElection_idx" ON "VoterDC"("Voters_VotingPerformanceMinorElection");

-- CreateIndex
CREATE INDEX "VoterDC_General_2022_idx" ON "VoterDC"("General_2022");

-- CreateIndex
CREATE INDEX "VoterDC_Primary_2022_idx" ON "VoterDC"("Primary_2022");

-- CreateIndex
CREATE INDEX "VoterDC_OtherElection_2022_idx" ON "VoterDC"("OtherElection_2022");

-- CreateIndex
CREATE INDEX "VoterDC_AnyElection_2021_idx" ON "VoterDC"("AnyElection_2021");

-- CreateIndex
CREATE INDEX "VoterDC_General_2020_idx" ON "VoterDC"("General_2020");

-- CreateIndex
CREATE INDEX "VoterDC_Primary_2020_idx" ON "VoterDC"("Primary_2020");

-- CreateIndex
CREATE INDEX "VoterDC_PresidentialPrimary_2020_idx" ON "VoterDC"("PresidentialPrimary_2020");

-- CreateIndex
CREATE INDEX "VoterDC_OtherElection_2020_idx" ON "VoterDC"("OtherElection_2020");

-- CreateIndex
CREATE INDEX "VoterDC_AnyElection_2019_idx" ON "VoterDC"("AnyElection_2019");

-- CreateIndex
CREATE INDEX "VoterDC_General_2018_idx" ON "VoterDC"("General_2018");

-- CreateIndex
CREATE INDEX "VoterDC_Primary_2018_idx" ON "VoterDC"("Primary_2018");

-- CreateIndex
CREATE INDEX "VoterDC_OtherElection_2018_idx" ON "VoterDC"("OtherElection_2018");

-- CreateIndex
CREATE INDEX "VoterDC_AnyElection_2017_idx" ON "VoterDC"("AnyElection_2017");

-- CreateIndex
CREATE INDEX "VoterDC_General_2016_idx" ON "VoterDC"("General_2016");

-- CreateIndex
CREATE INDEX "VoterDC_Primary_2016_idx" ON "VoterDC"("Primary_2016");

-- CreateIndex
CREATE INDEX "VoterDC_PresidentialPrimary_2016_idx" ON "VoterDC"("PresidentialPrimary_2016");

-- CreateIndex
CREATE INDEX "VoterDC_OtherElection_2016_idx" ON "VoterDC"("OtherElection_2016");
