-- CreateTable
CREATE TABLE "Voter" (
    "LALVOTERID" TEXT NOT NULL,
    "State" TEXT NOT NULL,
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
    "Residence_Addresses_State" TEXT,
    "Residence_Addresses_Zip" TEXT,
    "Residence_Addresses_ZipPlus4" TEXT,
    "Residence_Addresses_DPBC" TEXT,
    "Residence_Addresses_CheckDigit" INTEGER,
    "Residence_Addresses_HouseNumber" TEXT,
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
    "Mailing_Addresses_State" TEXT,
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
    "Voters_Gender" TEXT,
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
    "Voters_MovedFrom_State" TEXT,
    "Voters_MovedFrom_Date" DATE,
    "Voters_MovedFrom_Party_Description" TEXT,
    "Voters_VotingPerformanceEvenYearGeneral" TEXT,
    "Voters_VotingPerformanceEvenYearPrimary" TEXT,
    "Voters_VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
    "Voters_VotingPerformanceMinorElection" TEXT,
    "General_2026" TEXT,
    "Primary_2026" TEXT,
    "OtherElection_2026" TEXT,
    "AnyElection_2025" TEXT,
    "General_2024" TEXT,
    "Primary_2024" TEXT,
    "PresidentialPrimary_2024" TEXT,
    "OtherElection_2024" TEXT,
    "AnyElection_2023" TEXT,
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
    "County_Commissioner_District" TEXT,
    "County_Supervisorial_District" TEXT,
    "City_Mayoral_District" TEXT,
    "Town_District" TEXT,
    "Town_Council" TEXT,
    "Village" TEXT,
    "Township" TEXT,
    "Borough" TEXT,
    "Hamlet_Community_Area" TEXT,
    "City_Ward" TEXT,
    "Town_Ward" TEXT,
    "Township_Ward" TEXT,
    "Village_Ward" TEXT,
    "Borough_Ward" TEXT,
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
    "Coast_Water_District" TEXT,
    "Consolidated_Water_District" TEXT,
    "County_Water_District" TEXT,
    "County_Water_Landowner_District" TEXT,
    "County_Water_SubDistrict" TEXT,
    "Metropolitan_Water_District" TEXT,
    "Mountain_Water_District" TEXT,
    "Municipal_Water_District" TEXT,
    "Municipal_Water_SubDistrict" TEXT,
    "River_Water_District" TEXT,
    "Water_Agency" TEXT,
    "Water_Agency_SubDistrict" TEXT,
    "Water_Conservation_District" TEXT,
    "Water_Conservation_SubDistrict" TEXT,
    "Water_Control__Water_Conservation" TEXT,
    "Water_Control__Water_Conservation_SubDistrict" TEXT,
    "Water_District" TEXT,
    "Water_Public_Utility_District" TEXT,
    "Water_Public_Utility_Subdistrict" TEXT,
    "Water_Replacement_District" TEXT,
    "Water_Replacement_SubDistrict" TEXT,
    "Water_SubDistrict" TEXT,
    "County_Fire_District" TEXT,
    "Fire_District" TEXT,
    "Fire_Maintenance_District" TEXT,
    "Fire_Protection_District" TEXT,
    "Fire_Protection_SubDistrict" TEXT,
    "Fire_Protection_Tax_Measure_District" TEXT,
    "Fire_Service_Area_District" TEXT,
    "Fire_SubDistrict" TEXT,
    "Independent_Fire_District" TEXT,
    "Proposed_Fire_District" TEXT,
    "Unprotected_Fire_District" TEXT,
    "Bay_Area_Rapid_Transit" TEXT,
    "Metro_Transit_District" TEXT,
    "Rapid_Transit_District" TEXT,
    "Rapid_Transit_SubDistrict" TEXT,
    "Transit_District" TEXT,
    "Transit_SubDistrict" TEXT,
    "Community_Service_District" TEXT,
    "Community_Service_SubDistrict" TEXT,
    "County_Service_Area" TEXT,
    "County_Service_Area_SubDistrict" TEXT,
    "TriCity_Service_District" TEXT,
    "Library_Services_District" TEXT,
    "Airport_District" TEXT,
    "Annexation_District" TEXT,
    "Aquatic_Center_District" TEXT,
    "Aquatic_District" TEXT,
    "Assessment_District" TEXT,
    "Bonds_District" TEXT,
    "Career_Center" TEXT,
    "Cemetery_District" TEXT,
    "Central_Committee_District" TEXT,
    "Chemical_Control_District" TEXT,
    "Committee_Super_District" TEXT,
    "Communications_District" TEXT,
    "Community_College_At_Large" TEXT,
    "Community_Council_District" TEXT,
    "Community_Council_SubDistrict" TEXT,
    "Community_Facilities_District" TEXT,
    "Community_Facilities_SubDistrict" TEXT,
    "Community_Hospital_District" TEXT,
    "Community_Planning_Area" TEXT,
    "Congressional_Township" TEXT,
    "Conservation_District" TEXT,
    "Conservation_SubDistrict" TEXT,
    "Control_Zone_District" TEXT,
    "Corrections_District" TEXT,
    "County_Hospital_District" TEXT,
    "County_Library_District" TEXT,
    "County_Memorial_District" TEXT,
    "County_Paramedic_District" TEXT,
    "County_Sewer_District" TEXT,
    "Democratic_Convention_Member" TEXT,
    "Democratic_Zone" TEXT,
    "Designated_Market_Area_DMA" TEXT,
    "Drainage_District" TEXT,
    "Educational_Service_Subdistrict" TEXT,
    "Emergency_Communication_911_District" TEXT,
    "Emergency_Communication_911_SubDistrict" TEXT,
    "Enterprise_Zone_District" TEXT,
    "EXT_District" TEXT,
    "Facilities_Improvement_District" TEXT,
    "Flood_Control_Zone" TEXT,
    "Forest_Preserve" TEXT,
    "Garbage_District" TEXT,
    "Geological_Hazard_Abatement_District" TEXT,
    "Health_District" TEXT,
    "Hospital_SubDistrict" TEXT,
    "Improvement_Landowner_District" TEXT,
    "Irrigation_District" TEXT,
    "Irrigation_SubDistrict" TEXT,
    "Island" TEXT,
    "Land_Commission" TEXT,
    "Landscaping_And_Lighting_Assessment_Distric" TEXT,
    "Law_Enforcement_District" TEXT,
    "Learning_Community_Coordinating_Council_District" TEXT,
    "Levee_District" TEXT,
    "Levee_Reconstruction_Assesment_District" TEXT,
    "Library_District" TEXT,
    "Library_SubDistrict" TEXT,
    "Lighting_District" TEXT,
    "Local_Hospital_District" TEXT,
    "Local_Park_District" TEXT,
    "Maintenance_District" TEXT,
    "Master_Plan_District" TEXT,
    "Memorial_District" TEXT,
    "Metro_Service_District" TEXT,
    "Metro_Service_Subdistrict" TEXT,
    "Mosquito_Abatement_District" TEXT,
    "Multi_township_Assessor" TEXT,
    "Municipal_Advisory_Council_District" TEXT,
    "Municipal_Utility_District" TEXT,
    "Municipal_Utility_SubDistrict" TEXT,
    "Museum_District" TEXT,
    "Northeast_Soil_and_Water_District" TEXT,
    "Open_Space_District" TEXT,
    "Open_Space_SubDistrict" TEXT,
    "Other" TEXT,
    "Paramedic_District" TEXT,
    "Park_Commissioner_District" TEXT,
    "Park_District" TEXT,
    "Park_SubDistrict" TEXT,
    "Planning_Area_District" TEXT,
    "Police_District" TEXT,
    "Port_District" TEXT,
    "Port_SubDistrict" TEXT,
    "Power_District" TEXT,
    "Proposed_City" TEXT,
    "Proposed_Community_College" TEXT,
    "Proposed_District" TEXT,
    "Public_Airport_District" TEXT,
    "Public_Regulation_Commission" TEXT,
    "Public_Service_Commission_District" TEXT,
    "Public_Utility_District" TEXT,
    "Public_Utility_SubDistrict" TEXT,
    "Reclamation_District" TEXT,
    "Recreation_District" TEXT,
    "Recreational_SubDistrict" TEXT,
    "Republican_Area" TEXT,
    "Republican_Convention_Member" TEXT,
    "Resort_Improvement_District" TEXT,
    "Resource_Conservation_District" TEXT,
    "Road_Maintenance_District" TEXT,
    "Rural_Service_District" TEXT,
    "Sanitary_District" TEXT,
    "Sanitary_SubDistrict" TEXT,
    "Sewer_District" TEXT,
    "Sewer_Maintenance_District" TEXT,
    "Sewer_SubDistrict" TEXT,
    "Snow_Removal_District" TEXT,
    "Soil_And_Water_District" TEXT,
    "Soil_And_Water_District_At_Large" TEXT,
    "Special_Reporting_District" TEXT,
    "Special_Tax_District" TEXT,
    "Storm_Water_District" TEXT,
    "Street_Lighting_District" TEXT,
    "TV_Translator_District" TEXT,
    "Unincorporated_District" TEXT,
    "Unincorporated_Park_District" TEXT,
    "Ute_Creek_Soil_District" TEXT,
    "Vector_Control_District" TEXT,
    "Vote_By_Mail_Area" TEXT,
    "Wastewater_District" TEXT,
    "Weed_District" TEXT,

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
CREATE INDEX "Voter_County_Commissioner_District_idx" ON "Voter"("County_Commissioner_District");

-- CreateIndex
CREATE INDEX "Voter_County_Supervisorial_District_idx" ON "Voter"("County_Supervisorial_District");

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
CREATE INDEX "Voter_City_Ward_idx" ON "Voter"("City_Ward");

-- CreateIndex
CREATE INDEX "Voter_Town_Ward_idx" ON "Voter"("Town_Ward");

-- CreateIndex
CREATE INDEX "Voter_Township_Ward_idx" ON "Voter"("Township_Ward");

-- CreateIndex
CREATE INDEX "Voter_Village_Ward_idx" ON "Voter"("Village_Ward");

-- CreateIndex
CREATE INDEX "Voter_Borough_Ward_idx" ON "Voter"("Borough_Ward");

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
CREATE INDEX "Voter_Coast_Water_District_idx" ON "Voter"("Coast_Water_District");

-- CreateIndex
CREATE INDEX "Voter_Consolidated_Water_District_idx" ON "Voter"("Consolidated_Water_District");

-- CreateIndex
CREATE INDEX "Voter_County_Water_District_idx" ON "Voter"("County_Water_District");

-- CreateIndex
CREATE INDEX "Voter_County_Water_Landowner_District_idx" ON "Voter"("County_Water_Landowner_District");

-- CreateIndex
CREATE INDEX "Voter_County_Water_SubDistrict_idx" ON "Voter"("County_Water_SubDistrict");

-- CreateIndex
CREATE INDEX "Voter_Metropolitan_Water_District_idx" ON "Voter"("Metropolitan_Water_District");

-- CreateIndex
CREATE INDEX "Voter_Mountain_Water_District_idx" ON "Voter"("Mountain_Water_District");

-- CreateIndex
CREATE INDEX "Voter_Municipal_Water_District_idx" ON "Voter"("Municipal_Water_District");

-- CreateIndex
CREATE INDEX "Voter_Municipal_Water_SubDistrict_idx" ON "Voter"("Municipal_Water_SubDistrict");

-- CreateIndex
CREATE INDEX "Voter_River_Water_District_idx" ON "Voter"("River_Water_District");

-- CreateIndex
CREATE INDEX "Voter_Water_Agency_idx" ON "Voter"("Water_Agency");

-- CreateIndex
CREATE INDEX "Voter_Water_Agency_SubDistrict_idx" ON "Voter"("Water_Agency_SubDistrict");

-- CreateIndex
CREATE INDEX "Voter_Water_Conservation_District_idx" ON "Voter"("Water_Conservation_District");

-- CreateIndex
CREATE INDEX "Voter_Water_Conservation_SubDistrict_idx" ON "Voter"("Water_Conservation_SubDistrict");

-- CreateIndex
CREATE INDEX "Voter_Water_Control__Water_Conservation_idx" ON "Voter"("Water_Control__Water_Conservation");

-- CreateIndex
CREATE INDEX "Voter_Water_Control__Water_Conservation_SubDistrict_idx" ON "Voter"("Water_Control__Water_Conservation_SubDistrict");

-- CreateIndex
CREATE INDEX "Voter_Water_District_idx" ON "Voter"("Water_District");

-- CreateIndex
CREATE INDEX "Voter_Water_Public_Utility_District_idx" ON "Voter"("Water_Public_Utility_District");

-- CreateIndex
CREATE INDEX "Voter_Water_Public_Utility_Subdistrict_idx" ON "Voter"("Water_Public_Utility_Subdistrict");

-- CreateIndex
CREATE INDEX "Voter_Water_Replacement_District_idx" ON "Voter"("Water_Replacement_District");

-- CreateIndex
CREATE INDEX "Voter_Water_Replacement_SubDistrict_idx" ON "Voter"("Water_Replacement_SubDistrict");

-- CreateIndex
CREATE INDEX "Voter_Water_SubDistrict_idx" ON "Voter"("Water_SubDistrict");

-- CreateIndex
CREATE INDEX "Voter_County_Fire_District_idx" ON "Voter"("County_Fire_District");

-- CreateIndex
CREATE INDEX "Voter_Fire_District_idx" ON "Voter"("Fire_District");

-- CreateIndex
CREATE INDEX "Voter_Fire_Maintenance_District_idx" ON "Voter"("Fire_Maintenance_District");

-- CreateIndex
CREATE INDEX "Voter_Fire_Protection_District_idx" ON "Voter"("Fire_Protection_District");

-- CreateIndex
CREATE INDEX "Voter_Fire_Protection_SubDistrict_idx" ON "Voter"("Fire_Protection_SubDistrict");

-- CreateIndex
CREATE INDEX "Voter_Fire_Protection_Tax_Measure_District_idx" ON "Voter"("Fire_Protection_Tax_Measure_District");

-- CreateIndex
CREATE INDEX "Voter_Fire_Service_Area_District_idx" ON "Voter"("Fire_Service_Area_District");

-- CreateIndex
CREATE INDEX "Voter_Fire_SubDistrict_idx" ON "Voter"("Fire_SubDistrict");

-- CreateIndex
CREATE INDEX "Voter_Independent_Fire_District_idx" ON "Voter"("Independent_Fire_District");

-- CreateIndex
CREATE INDEX "Voter_Proposed_Fire_District_idx" ON "Voter"("Proposed_Fire_District");

-- CreateIndex
CREATE INDEX "Voter_Unprotected_Fire_District_idx" ON "Voter"("Unprotected_Fire_District");

-- CreateIndex
CREATE INDEX "Voter_Bay_Area_Rapid_Transit_idx" ON "Voter"("Bay_Area_Rapid_Transit");

-- CreateIndex
CREATE INDEX "Voter_Metro_Transit_District_idx" ON "Voter"("Metro_Transit_District");

-- CreateIndex
CREATE INDEX "Voter_Rapid_Transit_District_idx" ON "Voter"("Rapid_Transit_District");

-- CreateIndex
CREATE INDEX "Voter_Rapid_Transit_SubDistrict_idx" ON "Voter"("Rapid_Transit_SubDistrict");

-- CreateIndex
CREATE INDEX "Voter_Transit_District_idx" ON "Voter"("Transit_District");

-- CreateIndex
CREATE INDEX "Voter_Transit_SubDistrict_idx" ON "Voter"("Transit_SubDistrict");

-- CreateIndex
CREATE INDEX "Voter_Community_Service_District_idx" ON "Voter"("Community_Service_District");

-- CreateIndex
CREATE INDEX "Voter_Community_Service_SubDistrict_idx" ON "Voter"("Community_Service_SubDistrict");

-- CreateIndex
CREATE INDEX "Voter_County_Service_Area_idx" ON "Voter"("County_Service_Area");

-- CreateIndex
CREATE INDEX "Voter_County_Service_Area_SubDistrict_idx" ON "Voter"("County_Service_Area_SubDistrict");

-- CreateIndex
CREATE INDEX "Voter_TriCity_Service_District_idx" ON "Voter"("TriCity_Service_District");

-- CreateIndex
CREATE INDEX "Voter_Library_Services_District_idx" ON "Voter"("Library_Services_District");

-- CreateIndex
CREATE INDEX "Voter_Airport_District_idx" ON "Voter"("Airport_District");

-- CreateIndex
CREATE INDEX "Voter_Annexation_District_idx" ON "Voter"("Annexation_District");

-- CreateIndex
CREATE INDEX "Voter_Aquatic_Center_District_idx" ON "Voter"("Aquatic_Center_District");

-- CreateIndex
CREATE INDEX "Voter_Aquatic_District_idx" ON "Voter"("Aquatic_District");

-- CreateIndex
CREATE INDEX "Voter_Assessment_District_idx" ON "Voter"("Assessment_District");

-- CreateIndex
CREATE INDEX "Voter_Bonds_District_idx" ON "Voter"("Bonds_District");

-- CreateIndex
CREATE INDEX "Voter_Career_Center_idx" ON "Voter"("Career_Center");

-- CreateIndex
CREATE INDEX "Voter_Cemetery_District_idx" ON "Voter"("Cemetery_District");

-- CreateIndex
CREATE INDEX "Voter_Central_Committee_District_idx" ON "Voter"("Central_Committee_District");

-- CreateIndex
CREATE INDEX "Voter_Chemical_Control_District_idx" ON "Voter"("Chemical_Control_District");

-- CreateIndex
CREATE INDEX "Voter_Committee_Super_District_idx" ON "Voter"("Committee_Super_District");

-- CreateIndex
CREATE INDEX "Voter_Communications_District_idx" ON "Voter"("Communications_District");

-- CreateIndex
CREATE INDEX "Voter_Community_College_At_Large_idx" ON "Voter"("Community_College_At_Large");

-- CreateIndex
CREATE INDEX "Voter_Community_Council_District_idx" ON "Voter"("Community_Council_District");

-- CreateIndex
CREATE INDEX "Voter_Community_Council_SubDistrict_idx" ON "Voter"("Community_Council_SubDistrict");

-- CreateIndex
CREATE INDEX "Voter_Community_Facilities_District_idx" ON "Voter"("Community_Facilities_District");

-- CreateIndex
CREATE INDEX "Voter_Community_Facilities_SubDistrict_idx" ON "Voter"("Community_Facilities_SubDistrict");

-- CreateIndex
CREATE INDEX "Voter_Community_Hospital_District_idx" ON "Voter"("Community_Hospital_District");

-- CreateIndex
CREATE INDEX "Voter_Community_Planning_Area_idx" ON "Voter"("Community_Planning_Area");

-- CreateIndex
CREATE INDEX "Voter_Congressional_Township_idx" ON "Voter"("Congressional_Township");

-- CreateIndex
CREATE INDEX "Voter_Control_Zone_District_idx" ON "Voter"("Control_Zone_District");

-- CreateIndex
CREATE INDEX "Voter_Corrections_District_idx" ON "Voter"("Corrections_District");

-- CreateIndex
CREATE INDEX "Voter_County_Hospital_District_idx" ON "Voter"("County_Hospital_District");

-- CreateIndex
CREATE INDEX "Voter_County_Library_District_idx" ON "Voter"("County_Library_District");

-- CreateIndex
CREATE INDEX "Voter_County_Memorial_District_idx" ON "Voter"("County_Memorial_District");

-- CreateIndex
CREATE INDEX "Voter_County_Paramedic_District_idx" ON "Voter"("County_Paramedic_District");

-- CreateIndex
CREATE INDEX "Voter_County_Sewer_District_idx" ON "Voter"("County_Sewer_District");

-- CreateIndex
CREATE INDEX "Voter_Democratic_Convention_Member_idx" ON "Voter"("Democratic_Convention_Member");

-- CreateIndex
CREATE INDEX "Voter_Democratic_Zone_idx" ON "Voter"("Democratic_Zone");

-- CreateIndex
CREATE INDEX "Voter_Designated_Market_Area_DMA_idx" ON "Voter"("Designated_Market_Area_DMA");

-- CreateIndex
CREATE INDEX "Voter_Drainage_District_idx" ON "Voter"("Drainage_District");

-- CreateIndex
CREATE INDEX "Voter_Educational_Service_Subdistrict_idx" ON "Voter"("Educational_Service_Subdistrict");

-- CreateIndex
CREATE INDEX "Voter_Emergency_Communication_911_District_idx" ON "Voter"("Emergency_Communication_911_District");

-- CreateIndex
CREATE INDEX "Voter_Emergency_Communication_911_SubDistrict_idx" ON "Voter"("Emergency_Communication_911_SubDistrict");

-- CreateIndex
CREATE INDEX "Voter_Enterprise_Zone_District_idx" ON "Voter"("Enterprise_Zone_District");

-- CreateIndex
CREATE INDEX "Voter_EXT_District_idx" ON "Voter"("EXT_District");

-- CreateIndex
CREATE INDEX "Voter_Facilities_Improvement_District_idx" ON "Voter"("Facilities_Improvement_District");

-- CreateIndex
CREATE INDEX "Voter_Flood_Control_Zone_idx" ON "Voter"("Flood_Control_Zone");

-- CreateIndex
CREATE INDEX "Voter_Forest_Preserve_idx" ON "Voter"("Forest_Preserve");

-- CreateIndex
CREATE INDEX "Voter_Garbage_District_idx" ON "Voter"("Garbage_District");

-- CreateIndex
CREATE INDEX "Voter_Geological_Hazard_Abatement_District_idx" ON "Voter"("Geological_Hazard_Abatement_District");

-- CreateIndex
CREATE INDEX "Voter_Health_District_idx" ON "Voter"("Health_District");

-- CreateIndex
CREATE INDEX "Voter_Hospital_SubDistrict_idx" ON "Voter"("Hospital_SubDistrict");

-- CreateIndex
CREATE INDEX "Voter_Improvement_Landowner_District_idx" ON "Voter"("Improvement_Landowner_District");

-- CreateIndex
CREATE INDEX "Voter_Irrigation_District_idx" ON "Voter"("Irrigation_District");

-- CreateIndex
CREATE INDEX "Voter_Irrigation_SubDistrict_idx" ON "Voter"("Irrigation_SubDistrict");

-- CreateIndex
CREATE INDEX "Voter_Island_idx" ON "Voter"("Island");

-- CreateIndex
CREATE INDEX "Voter_Land_Commission_idx" ON "Voter"("Land_Commission");

-- CreateIndex
CREATE INDEX "Voter_Landscaping_And_Lighting_Assessment_Distric_idx" ON "Voter"("Landscaping_And_Lighting_Assessment_Distric");

-- CreateIndex
CREATE INDEX "Voter_Law_Enforcement_District_idx" ON "Voter"("Law_Enforcement_District");

-- CreateIndex
CREATE INDEX "Voter_Learning_Community_Coordinating_Council_District_idx" ON "Voter"("Learning_Community_Coordinating_Council_District");

-- CreateIndex
CREATE INDEX "Voter_Levee_District_idx" ON "Voter"("Levee_District");

-- CreateIndex
CREATE INDEX "Voter_Levee_Reconstruction_Assesment_District_idx" ON "Voter"("Levee_Reconstruction_Assesment_District");

-- CreateIndex
CREATE INDEX "Voter_Library_District_idx" ON "Voter"("Library_District");

-- CreateIndex
CREATE INDEX "Voter_Library_SubDistrict_idx" ON "Voter"("Library_SubDistrict");

-- CreateIndex
CREATE INDEX "Voter_Lighting_District_idx" ON "Voter"("Lighting_District");

-- CreateIndex
CREATE INDEX "Voter_Local_Hospital_District_idx" ON "Voter"("Local_Hospital_District");

-- CreateIndex
CREATE INDEX "Voter_Local_Park_District_idx" ON "Voter"("Local_Park_District");

-- CreateIndex
CREATE INDEX "Voter_Maintenance_District_idx" ON "Voter"("Maintenance_District");

-- CreateIndex
CREATE INDEX "Voter_Master_Plan_District_idx" ON "Voter"("Master_Plan_District");

-- CreateIndex
CREATE INDEX "Voter_Memorial_District_idx" ON "Voter"("Memorial_District");

-- CreateIndex
CREATE INDEX "Voter_Metro_Service_District_idx" ON "Voter"("Metro_Service_District");

-- CreateIndex
CREATE INDEX "Voter_Metro_Service_Subdistrict_idx" ON "Voter"("Metro_Service_Subdistrict");

-- CreateIndex
CREATE INDEX "Voter_Mosquito_Abatement_District_idx" ON "Voter"("Mosquito_Abatement_District");

-- CreateIndex
CREATE INDEX "Voter_Multi_township_Assessor_idx" ON "Voter"("Multi_township_Assessor");

-- CreateIndex
CREATE INDEX "Voter_Municipal_Advisory_Council_District_idx" ON "Voter"("Municipal_Advisory_Council_District");

-- CreateIndex
CREATE INDEX "Voter_Municipal_Utility_District_idx" ON "Voter"("Municipal_Utility_District");

-- CreateIndex
CREATE INDEX "Voter_Municipal_Utility_SubDistrict_idx" ON "Voter"("Municipal_Utility_SubDistrict");

-- CreateIndex
CREATE INDEX "Voter_Museum_District_idx" ON "Voter"("Museum_District");

-- CreateIndex
CREATE INDEX "Voter_Northeast_Soil_and_Water_District_idx" ON "Voter"("Northeast_Soil_and_Water_District");

-- CreateIndex
CREATE INDEX "Voter_Open_Space_District_idx" ON "Voter"("Open_Space_District");

-- CreateIndex
CREATE INDEX "Voter_Open_Space_SubDistrict_idx" ON "Voter"("Open_Space_SubDistrict");

-- CreateIndex
CREATE INDEX "Voter_Other_idx" ON "Voter"("Other");

-- CreateIndex
CREATE INDEX "Voter_Paramedic_District_idx" ON "Voter"("Paramedic_District");

-- CreateIndex
CREATE INDEX "Voter_Park_Commissioner_District_idx" ON "Voter"("Park_Commissioner_District");

-- CreateIndex
CREATE INDEX "Voter_Park_District_idx" ON "Voter"("Park_District");

-- CreateIndex
CREATE INDEX "Voter_Park_SubDistrict_idx" ON "Voter"("Park_SubDistrict");

-- CreateIndex
CREATE INDEX "Voter_Planning_Area_District_idx" ON "Voter"("Planning_Area_District");

-- CreateIndex
CREATE INDEX "Voter_Police_District_idx" ON "Voter"("Police_District");

-- CreateIndex
CREATE INDEX "Voter_Port_District_idx" ON "Voter"("Port_District");

-- CreateIndex
CREATE INDEX "Voter_Port_SubDistrict_idx" ON "Voter"("Port_SubDistrict");

-- CreateIndex
CREATE INDEX "Voter_Power_District_idx" ON "Voter"("Power_District");

-- CreateIndex
CREATE INDEX "Voter_Proposed_City_idx" ON "Voter"("Proposed_City");

-- CreateIndex
CREATE INDEX "Voter_Proposed_Community_College_idx" ON "Voter"("Proposed_Community_College");

-- CreateIndex
CREATE INDEX "Voter_Proposed_District_idx" ON "Voter"("Proposed_District");

-- CreateIndex
CREATE INDEX "Voter_Public_Airport_District_idx" ON "Voter"("Public_Airport_District");

-- CreateIndex
CREATE INDEX "Voter_Public_Regulation_Commission_idx" ON "Voter"("Public_Regulation_Commission");

-- CreateIndex
CREATE INDEX "Voter_Public_Service_Commission_District_idx" ON "Voter"("Public_Service_Commission_District");

-- CreateIndex
CREATE INDEX "Voter_Public_Utility_District_idx" ON "Voter"("Public_Utility_District");

-- CreateIndex
CREATE INDEX "Voter_Public_Utility_SubDistrict_idx" ON "Voter"("Public_Utility_SubDistrict");

-- CreateIndex
CREATE INDEX "Voter_Reclamation_District_idx" ON "Voter"("Reclamation_District");

-- CreateIndex
CREATE INDEX "Voter_Recreation_District_idx" ON "Voter"("Recreation_District");

-- CreateIndex
CREATE INDEX "Voter_Recreational_SubDistrict_idx" ON "Voter"("Recreational_SubDistrict");

-- CreateIndex
CREATE INDEX "Voter_Republican_Area_idx" ON "Voter"("Republican_Area");

-- CreateIndex
CREATE INDEX "Voter_Republican_Convention_Member_idx" ON "Voter"("Republican_Convention_Member");

-- CreateIndex
CREATE INDEX "Voter_Resort_Improvement_District_idx" ON "Voter"("Resort_Improvement_District");

-- CreateIndex
CREATE INDEX "Voter_Resource_Conservation_District_idx" ON "Voter"("Resource_Conservation_District");

-- CreateIndex
CREATE INDEX "Voter_Road_Maintenance_District_idx" ON "Voter"("Road_Maintenance_District");

-- CreateIndex
CREATE INDEX "Voter_Rural_Service_District_idx" ON "Voter"("Rural_Service_District");

-- CreateIndex
CREATE INDEX "Voter_Sanitary_District_idx" ON "Voter"("Sanitary_District");

-- CreateIndex
CREATE INDEX "Voter_Sanitary_SubDistrict_idx" ON "Voter"("Sanitary_SubDistrict");

-- CreateIndex
CREATE INDEX "Voter_Sewer_District_idx" ON "Voter"("Sewer_District");

-- CreateIndex
CREATE INDEX "Voter_Sewer_Maintenance_District_idx" ON "Voter"("Sewer_Maintenance_District");

-- CreateIndex
CREATE INDEX "Voter_Sewer_SubDistrict_idx" ON "Voter"("Sewer_SubDistrict");

-- CreateIndex
CREATE INDEX "Voter_Snow_Removal_District_idx" ON "Voter"("Snow_Removal_District");

-- CreateIndex
CREATE INDEX "Voter_Soil_And_Water_District_idx" ON "Voter"("Soil_And_Water_District");

-- CreateIndex
CREATE INDEX "Voter_Soil_And_Water_District_At_Large_idx" ON "Voter"("Soil_And_Water_District_At_Large");

-- CreateIndex
CREATE INDEX "Voter_Special_Reporting_District_idx" ON "Voter"("Special_Reporting_District");

-- CreateIndex
CREATE INDEX "Voter_Special_Tax_District_idx" ON "Voter"("Special_Tax_District");

-- CreateIndex
CREATE INDEX "Voter_Storm_Water_District_idx" ON "Voter"("Storm_Water_District");

-- CreateIndex
CREATE INDEX "Voter_Street_Lighting_District_idx" ON "Voter"("Street_Lighting_District");

-- CreateIndex
CREATE INDEX "Voter_TV_Translator_District_idx" ON "Voter"("TV_Translator_District");

-- CreateIndex
CREATE INDEX "Voter_Unincorporated_District_idx" ON "Voter"("Unincorporated_District");

-- CreateIndex
CREATE INDEX "Voter_Unincorporated_Park_District_idx" ON "Voter"("Unincorporated_Park_District");

-- CreateIndex
CREATE INDEX "Voter_Ute_Creek_Soil_District_idx" ON "Voter"("Ute_Creek_Soil_District");

-- CreateIndex
CREATE INDEX "Voter_Vector_Control_District_idx" ON "Voter"("Vector_Control_District");

-- CreateIndex
CREATE INDEX "Voter_Vote_By_Mail_Area_idx" ON "Voter"("Vote_By_Mail_Area");

-- CreateIndex
CREATE INDEX "Voter_Wastewater_District_idx" ON "Voter"("Wastewater_District");

-- CreateIndex
CREATE INDEX "Voter_Weed_District_idx" ON "Voter"("Weed_District");

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
CREATE INDEX "Voter_Voters_Gender_idx" ON "Voter"("Voters_Gender");

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
CREATE INDEX "Voter_Mailing_Families_FamilyID_idx" ON "Voter"("Mailing_Families_FamilyID");

-- CreateIndex
CREATE INDEX "Voter_State_idx" ON "Voter"("State");

-- CreateIndex
CREATE INDEX "Voter_Voters_VotingPerformanceEvenYearGeneral_idx" ON "Voter"("Voters_VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "Voter_Voters_VotingPerformanceEvenYearPrimary_idx" ON "Voter"("Voters_VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "Voter_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "Voter"("Voters_VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "Voter_Voters_VotingPerformanceMinorElection_idx" ON "Voter"("Voters_VotingPerformanceMinorElection");
