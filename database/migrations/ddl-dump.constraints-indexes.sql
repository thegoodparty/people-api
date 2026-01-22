alter table "District"
    add constraint district_pkey
        primary key (id);

alter table "District"
    add constraint "District_type_name_state_uniq"
        unique (state, type, name);

create index "Voter_age_int_idx"
    on "Voter" ("Age_Int");

create index "Voter_income_int_idx"
    on "Voter" ("Estimated_Income_Amount_Int");

create index "Voter_VoterTelephones_CellPhoneFormatted_idx"
    on "Voter" ("VoterTelephones_CellPhoneFormatted");

create index voter_language_code_id_idx
    on "Voter" ("Language_Code", id);

create index voter_veteran_status_id_idx
    on "Voter" ("Veteran_Status", id);

create index voter_marital_status_id_idx
    on "Voter" ("Marital_Status", id);

create index voter_education_of_person_id_idx
    on "Voter" ("Education_Of_Person", id);

create index voter_parties_description_id_idx
    on "Voter" ("Parties_Description", id);

create index voter_business_owner_id_idx
    on "Voter" ("Business_Owner", id);

create index voter_homeowner_probability_model_id_idx
    on "Voter" ("Homeowner_Probability_Model", id);

create index voter_id_has_cell_idx
    on "Voter" (id)
    where ("VoterTelephones_CellPhoneFormatted" IS NOT NULL);

alter table "Voter"
    add constraint "Voter_pkey"
        primary key ("State", id);

alter table "Voter"
    add constraint "Voter_LALVOTERID_state_uniq"
        unique ("State", "LALVOTERID");

create index "DistrictVoter_district_id_idx"
    on "DistrictVoter" (district_id);

create index "DistrictVoter_district_id_voter_id_idx"
    on "DistrictVoter" (district_id, voter_id);

alter table "DistrictVoter"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter"
    add foreign key ("State", voter_id) references "Voter_AL";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey1"
        foreign key ("State", voter_id) references "Voter_AK";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey2"
        foreign key ("State", voter_id) references "Voter_AZ";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey3"
        foreign key ("State", voter_id) references "Voter_AR";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey4"
        foreign key ("State", voter_id) references "Voter_CA";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey5"
        foreign key ("State", voter_id) references "Voter_CO";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey6"
        foreign key ("State", voter_id) references "Voter_CT";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey7"
        foreign key ("State", voter_id) references "Voter_DE";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey8"
        foreign key ("State", voter_id) references "Voter_FL";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey9"
        foreign key ("State", voter_id) references "Voter_GA";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey10"
        foreign key ("State", voter_id) references "Voter_HI";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey11"
        foreign key ("State", voter_id) references "Voter_ID";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey12"
        foreign key ("State", voter_id) references "Voter_IL";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey13"
        foreign key ("State", voter_id) references "Voter_IN";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey14"
        foreign key ("State", voter_id) references "Voter_IA";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey15"
        foreign key ("State", voter_id) references "Voter_KS";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey16"
        foreign key ("State", voter_id) references "Voter_KY";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey17"
        foreign key ("State", voter_id) references "Voter_LA";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey18"
        foreign key ("State", voter_id) references "Voter_ME";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey19"
        foreign key ("State", voter_id) references "Voter_MD";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey20"
        foreign key ("State", voter_id) references "Voter_MA";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey21"
        foreign key ("State", voter_id) references "Voter_MI";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey22"
        foreign key ("State", voter_id) references "Voter_MN";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey23"
        foreign key ("State", voter_id) references "Voter_MS";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey24"
        foreign key ("State", voter_id) references "Voter_MO";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey25"
        foreign key ("State", voter_id) references "Voter_MT";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey26"
        foreign key ("State", voter_id) references "Voter_NE";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey27"
        foreign key ("State", voter_id) references "Voter_NV";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey28"
        foreign key ("State", voter_id) references "Voter_NH";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey29"
        foreign key ("State", voter_id) references "Voter_NJ";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey30"
        foreign key ("State", voter_id) references "Voter_NM";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey31"
        foreign key ("State", voter_id) references "Voter_NY";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey32"
        foreign key ("State", voter_id) references "Voter_NC";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey33"
        foreign key ("State", voter_id) references "Voter_ND";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey34"
        foreign key ("State", voter_id) references "Voter_OH";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey35"
        foreign key ("State", voter_id) references "Voter_OK";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey36"
        foreign key ("State", voter_id) references "Voter_OR";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey37"
        foreign key ("State", voter_id) references "Voter_PA";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey38"
        foreign key ("State", voter_id) references "Voter_RI";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey39"
        foreign key ("State", voter_id) references "Voter_SC";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey40"
        foreign key ("State", voter_id) references "Voter_SD";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey41"
        foreign key ("State", voter_id) references "Voter_TN";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey42"
        foreign key ("State", voter_id) references "Voter_TX";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey43"
        foreign key ("State", voter_id) references "Voter_UT";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey44"
        foreign key ("State", voter_id) references "Voter_VT";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey45"
        foreign key ("State", voter_id) references "Voter_VA";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey46"
        foreign key ("State", voter_id) references "Voter_WA";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey47"
        foreign key ("State", voter_id) references "Voter_WV";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey48"
        foreign key ("State", voter_id) references "Voter_WI";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey49"
        foreign key ("State", voter_id) references "Voter_WY";

alter table "DistrictVoter"
    add constraint "DistrictVoter_State_voter_id_fkey50"
        foreign key ("State", voter_id) references "Voter_DC";

alter table "DistrictVoter_AL"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_AL"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_AK"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_AK"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_AZ"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_AZ"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_AR"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_AR"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_CA"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_CA"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_CO"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_CO"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_CT"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_CT"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_DC"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_DC"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_DE"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_DE"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_FL"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_FL"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_GA"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_GA"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_HI"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_HI"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_ID"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_ID"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_IL"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_IL"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_IN"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_IN"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_IA"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_IA"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_KS"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_KS"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_KY"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_KY"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_LA"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_LA"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_ME"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_ME"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_MD"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_MD"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_MA"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_MA"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_MI"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_MI"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_MN"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_MN"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_MS"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_MS"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_MO"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_MO"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_MT"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_MT"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_NE"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_NE"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_NV"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_NV"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_NH"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_NH"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_NJ"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_NJ"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_NM"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_NM"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_NY"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_NY"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_NC"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_NC"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_ND"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_ND"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_OH"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_OH"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_OK"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_OK"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_OR"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_OR"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_PA"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_PA"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_RI"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_RI"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_SC"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_SC"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_SD"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_SD"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_TN"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_TN"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_TX"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_TX"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_UT"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_UT"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_VT"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_VT"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_VA"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_VA"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_WA"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_WA"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_WV"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_WV"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_WI"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_WI"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";

alter table "DistrictVoter_WY"
    add constraint "DistrictVoter_district_fk"
        foreign key (district_id) references "District";

alter table "DistrictVoter_WY"
    add constraint "DistrictVoter_voter_fk"
        foreign key ("State", voter_id) references "Voter";


