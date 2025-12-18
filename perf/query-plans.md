# Old DB

## List People, Small

### Count

```
PREPARE people_ccd_count(text, text, integer) AS
SELECT COUNT(*) AS "_count._all"
FROM (
  SELECT "public"."Voter"."id"
  FROM "public"."Voter"
  WHERE "public"."Voter"."State" = $1
    AND "public"."Voter"."County_Commissioner_District" = $2
  OFFSET $3
) AS "sub";


EXPLAIN (ANALYZE, BUFFERS)
EXECUTE people_ccd_count(
  'WY',
  'SWEETWATER CNTY-ROCK SPRINGS NORTH CCD (EST.)',
  0
);
```

Aggregate (cost=2867.25..2867.26 rows=1 width=8) (actual time=43.188..43.190 rows=1 loops=1)
Buffers: shared hit=3760 read=51
I/O Timings: shared read=14.558
" -> Bitmap Heap Scan on ""Voter"" (cost=2774.67..2866.96 rows=23 width=16) (actual time=33.027..42.188 rows=13320 loops=1)"
" Recheck Cond: ((""County_Commissioner_District"" = 'SWEETWATER CNTY-ROCK SPRINGS NORTH CCD (EST.)'::text) AND (""State"" = 'WY'::text))"
Heap Blocks: exact=3409
Buffers: shared hit=3760 read=51
I/O Timings: shared read=14.558
-> BitmapAnd (cost=2774.67..2774.67 rows=23 width=0) (actual time=32.658..32.659 rows=0 loops=1)
Buffers: shared hit=351 read=51
I/O Timings: shared read=14.558
" -> Bitmap Index Scan on ""Voter_County_Commissioner_District_idx"" (cost=0.00..373.24 rows=23022 width=0) (actual time=11.150..11.150 rows=13320 loops=1)"
" Index Cond: (""County_Commissioner_District"" = 'SWEETWATER CNTY-ROCK SPRINGS NORTH CCD (EST.)'::text)"
Buffers: shared hit=26 read=51
I/O Timings: shared read=12.938
" -> Bitmap Index Scan on ""Voter_State_updated_at_idx"" (cost=0.00..2401.18 rows=219281 width=0) (actual time=21.313..21.313 rows=359752 loops=1)"
" Index Cond: (""State"" = 'WY'::text)"
Buffers: shared hit=325
I/O Timings: shared read=1.620
Planning:
Buffers: shared hit=3595
Planning Time: 8.448 ms
Execution Time: 43.342 ms

---

### List

```
PREPARE people_ccd_select(text, text, integer, integer) AS
SELECT "public"."Voter"."id",
       "public"."Voter"."LALVOTERID",
       "public"."Voter"."State",
       "public"."Voter"."FirstName",
       "public"."Voter"."MiddleName",
       "public"."Voter"."LastName",
       "public"."Voter"."NameSuffix",
       "public"."Voter"."Residence_Addresses_AddressLine",
       "public"."Voter"."Residence_Addresses_ExtraAddressLine",
       "public"."Voter"."Residence_Addresses_City",
       "public"."Voter"."Residence_Addresses_State",
       "public"."Voter"."Residence_Addresses_Zip",
       "public"."Voter"."Residence_Addresses_ZipPlus4",
       "public"."Voter"."Mailing_Addresses_AddressLine",
       "public"."Voter"."Mailing_Addresses_ExtraAddressLine",
       "public"."Voter"."Mailing_Addresses_City",
       "public"."Voter"."Mailing_Addresses_State",
       "public"."Voter"."Mailing_Addresses_Zip",
       "public"."Voter"."Mailing_Addresses_ZipPlus4",
       "public"."Voter"."VoterTelephones_LandlineFormatted",
       "public"."Voter"."VoterTelephones_CellPhoneFormatted",
       "public"."Voter"."Age",
       "public"."Voter"."Gender",
       "public"."Voter"."Parties_Description",
       "public"."Voter"."US_Congressional_District",
       "public"."Voter"."State_Senate_District",
       "public"."Voter"."State_House_District",
       "public"."Voter"."County",
       "public"."Voter"."City",
       "public"."Voter"."Precinct",
       "public"."Voter"."AnyElection_2025",
       "public"."Voter"."Business_Owner",
       "public"."Voter"."Education_Of_Person",
       "public"."Voter"."Estimated_Income_Amount",
       "public"."Voter"."Homeowner_Probability_Model",
       "public"."Voter"."Language_Code",
       "public"."Voter"."Marital_Status",
       "public"."Voter"."Presence_Of_Children",
       "public"."Voter"."Veteran_Status",
       "public"."Voter"."Voter_Status",
       "public"."Voter"."EthnicGroups_EthnicGroup1Desc",
       "public"."Voter"."Age_Int",
       "public"."Voter"."VotingPerformanceEvenYearGeneral",
       "public"."Voter"."VotingPerformanceMinorElection"
FROM "public"."Voter"
WHERE "public"."Voter"."State" = $1
  AND "public"."Voter"."County_Commissioner_District" = $2
ORDER BY "public"."Voter"."id" ASC
LIMIT $3 OFFSET $4;


EXPLAIN (ANALYZE, BUFFERS)
EXECUTE people_ccd_select(
  'WY',
  'SWEETWATER CNTY-ROCK SPRINGS NORTH CCD (EST.)',
  50,
  0
);
```

Limit (cost=2867.48..2867.54 rows=23 width=361) (actual time=58.932..58.944 rows=50 loops=1)
Buffers: shared hit=3768
-> Sort (cost=2867.48..2867.54 rows=23 width=361) (actual time=58.930..58.936 rows=50 loops=1)
Sort Key: id
Sort Method: top-N heapsort Memory: 64kB
Buffers: shared hit=3768
" -> Bitmap Heap Scan on ""Voter"" (cost=2774.67..2866.96 rows=23 width=361) (actual time=20.975..48.145 rows=13320 loops=1)"
" Recheck Cond: ((""County_Commissioner_District"" = 'SWEETWATER CNTY-ROCK SPRINGS NORTH CCD (EST.)'::text) AND (""State"" = 'WY'::text))"
Heap Blocks: exact=3409
Buffers: shared hit=3765
-> BitmapAnd (cost=2774.67..2774.67 rows=23 width=0) (actual time=20.596..20.598 rows=0 loops=1)
Buffers: shared hit=356
" -> Bitmap Index Scan on ""Voter_County_Commissioner_District_idx"" (cost=0.00..373.24 rows=23022 width=0) (actual time=0.661..0.661 rows=13320 loops=1)"
" Index Cond: (""County_Commissioner_District"" = 'SWEETWATER CNTY-ROCK SPRINGS NORTH CCD (EST.)'::text)"
Buffers: shared hit=31
" -> Bitmap Index Scan on ""Voter_State_updated_at_idx"" (cost=0.00..2401.18 rows=219281 width=0) (actual time=19.743..19.743 rows=359752 loops=1)"
" Index Cond: (""State"" = 'WY'::text)"
Buffers: shared hit=325
Planning:
Buffers: shared hit=199
Planning Time: 1.602 ms
Execution Time: 59.071 ms

## List People, Large

### Count

```
PREPARE people_city_tx_count(text, text, integer) AS
SELECT COUNT(*) AS "_count._all"
FROM (
  SELECT "public"."Voter"."id"
  FROM "public"."Voter"
  WHERE "public"."Voter"."State" = $1
    AND "public"."Voter"."City" = $2
  OFFSET $3
) AS "sub";


EXPLAIN (ANALYZE, BUFFERS)
EXECUTE people_city_tx_count(
  'TX',
  'DALLAS CITY (EST.)',
  0
);
```

Aggregate (cost=403052.67..403052.68 rows=1 width=8) (actual time=10957.688..10957.691 rows=1 loops=1)
Buffers: shared hit=168899 read=430699
I/O Timings: shared read=5364.698
" -> Bitmap Heap Scan on ""Voter"" (cost=199011.51..402399.43 rows=52259 width=16) (actual time=1167.213..10903.174 rows=668283 loops=1)"
" Recheck Cond: ((""City"" = 'DALLAS CITY (EST.)'::text) AND (""State"" = 'TX'::text))"
Rows Removed by Index Recheck: 3863970
Heap Blocks: exact=178 lossy=582119
Buffers: shared hit=168899 read=430699
I/O Timings: shared read=5364.698
-> BitmapAnd (cost=199011.51..199011.51 rows=52259 width=0) (actual time=1156.153..1156.155 rows=0 loops=1)
Buffers: shared hit=15172 read=2131
I/O Timings: shared read=210.188
" -> Bitmap Index Scan on ""Voter_City_idx"" (cost=0.00..10489.21 rows=665152 width=0) (actual time=218.271..218.271 rows=1326867 loops=1)"
" Index Cond: (""City"" = 'DALLAS CITY (EST.)'::text)"
Buffers: shared hit=8 read=2131
I/O Timings: shared read=182.687
" -> Bitmap Index Scan on ""Voter_State_updated_at_idx"" (cost=0.00..188495.92 rows=17228180 width=0) (actual time=880.720..880.721 rows=17736031 loops=1)"
" Index Cond: (""State"" = 'TX'::text)"
Buffers: shared hit=15164
I/O Timings: shared read=27.500
Planning Time: 0.822 ms
Execution Time: 10959.347 ms

---

### List

```
PREPARE people_city_tx_select(text, text, integer, integer) AS
SELECT "public"."Voter"."id",
       "public"."Voter"."LALVOTERID",
       "public"."Voter"."State",
       "public"."Voter"."FirstName",
       "public"."Voter"."MiddleName",
       "public"."Voter"."LastName",
       "public"."Voter"."NameSuffix",
       "public"."Voter"."Residence_Addresses_AddressLine",
       "public"."Voter"."Residence_Addresses_ExtraAddressLine",
       "public"."Voter"."Residence_Addresses_City",
       "public"."Voter"."Residence_Addresses_State",
       "public"."Voter"."Residence_Addresses_Zip",
       "public"."Voter"."Residence_Addresses_ZipPlus4",
       "public"."Voter"."Mailing_Addresses_AddressLine",
       "public"."Voter"."Mailing_Addresses_ExtraAddressLine",
       "public"."Voter"."Mailing_Addresses_City",
       "public"."Voter"."Mailing_Addresses_State",
       "public"."Voter"."Mailing_Addresses_Zip",
       "public"."Voter"."Mailing_Addresses_ZipPlus4",
       "public"."Voter"."VoterTelephones_LandlineFormatted",
       "public"."Voter"."VoterTelephones_CellPhoneFormatted",
       "public"."Voter"."Age",
       "public"."Voter"."Gender",
       "public"."Voter"."Parties_Description",
       "public"."Voter"."US_Congressional_District",
       "public"."Voter"."State_Senate_District",
       "public"."Voter"."State_House_District",
       "public"."Voter"."County",
       "public"."Voter"."City",
       "public"."Voter"."Precinct",
       "public"."Voter"."AnyElection_2025",
       "public"."Voter"."Business_Owner",
       "public"."Voter"."Education_Of_Person",
       "public"."Voter"."Estimated_Income_Amount",
       "public"."Voter"."Homeowner_Probability_Model",
       "public"."Voter"."Language_Code",
       "public"."Voter"."Marital_Status",
       "public"."Voter"."Presence_Of_Children",
       "public"."Voter"."Veteran_Status",
       "public"."Voter"."Voter_Status",
       "public"."Voter"."EthnicGroups_EthnicGroup1Desc",
       "public"."Voter"."Age_Int",
       "public"."Voter"."VotingPerformanceEvenYearGeneral",
       "public"."Voter"."VotingPerformanceMinorElection"
FROM "public"."Voter"
WHERE "public"."Voter"."State" = $1
  AND "public"."Voter"."City" = $2
ORDER BY "public"."Voter"."id" ASC
LIMIT $3 OFFSET $4;


EXPLAIN (ANALYZE, BUFFERS)
EXECUTE people_city_tx_select(
  'TX',
  'DALLAS CITY (EST.)',
  50,
  0
);
```

Limit (cost=404135.44..404135.56 rows=50 width=361) (actual time=6385.929..6385.942 rows=50 loops=1)
Buffers: shared hit=599606
-> Sort (cost=404135.44..404266.09 rows=52259 width=361) (actual time=6385.927..6385.934 rows=50 loops=1)
Sort Key: id
Sort Method: top-N heapsort Memory: 68kB
Buffers: shared hit=599606
" -> Bitmap Heap Scan on ""Voter"" (cost=199011.51..402399.43 rows=52259 width=361) (actual time=1073.101..5841.766 rows=668283 loops=1)"
" Recheck Cond: ((""City"" = 'DALLAS CITY (EST.)'::text) AND (""State"" = 'TX'::text))"
Rows Removed by Index Recheck: 3863970
Heap Blocks: exact=178 lossy=582119
Buffers: shared hit=599606
-> BitmapAnd (cost=199011.51..199011.51 rows=52259 width=0) (actual time=1063.698..1063.699 rows=0 loops=1)
Buffers: shared hit=17309
" -> Bitmap Index Scan on ""Voter_City_idx"" (cost=0.00..10489.21 rows=665152 width=0) (actual time=179.426..179.426 rows=1326867 loops=1)"
" Index Cond: (""City"" = 'DALLAS CITY (EST.)'::text)"
Buffers: shared hit=2145
" -> Bitmap Index Scan on ""Voter_State_updated_at_idx"" (cost=0.00..188495.92 rows=17228180 width=0) (actual time=831.682..831.682 rows=17736031 loops=1)"
" Index Cond: (""State"" = 'TX'::text)"
Buffers: shared hit=15164
Planning Time: 1.137 ms
Execution Time: 6387.726 ms

---

Nested Loop (cost=2774.70..6952318.39 rows=49 width=903)
(actual time=75477.693..106175.993 rows=50 loops=1)
Buffers: shared hit=7826041 read=86708
I/O Timings: shared read=150545.735

-> Limit (cost=2774.14..2774.26 rows=50 width=16)
(actual time=0.102..0.206 rows=50 loops=1)
Buffers: shared hit=7
-> Sort (cost=2774.14..2881.42 rows=42914 width=16)
(actual time=0.102..0.150 rows=50 loops=1)
Sort Key: dv.voter_id
Sort Method: top-N heapsort Memory: 26kB
Buffers: shared hit=7
-> Index Scan using "DistrictVoter_dedup_TX_district_id_idx"
on "DistrictVoter_dedup_TX" dv
(cost=0.57..1348.56 rows=42914 width=16)
(actual time=0.035..0.073 rows=160 loops=1)
Index Cond: (district_id = 'cda49e65-...'::uuid)
Filter: (voter_id IS NOT NULL)
Buffers: shared hit=7

-> Index Scan using "Voter_new_TX_pkey" on "Voter_new_TX" v
(cost=0.56..138990.87 rows=1 width=903)
(actual time=1841.707..2123.505 rows=1 loops=50)
Index Cond: (id = dv.voter_id)
Buffers: shared hit=7826034 read=86708
I/O Timings: shared read=150545.735

Planning Time: 0.312 ms
Execution Time: 106176.243 ms
