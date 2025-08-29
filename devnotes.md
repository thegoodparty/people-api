Resources
https://www.census.gov/library/reference/code-lists/ansi.html

# Office Matching
- Demographic file has MSA / CBSA codes
- Each person is inside multiple varying districts for state senate, city councils, school boards, etc.
- Maybe only way to join in a determinate way without AI is a spatial join - take a MSA from someone tagged as part of our  "officeType" district that we want, and do a spatial join using the geoid from BallotReady?

## Nigel
- 3 ways
    - Address (use a geocoder to find out where that actually has)
        - Figure out geography of the district
        - GIS: point files, polygon files, line files
- https://dbc-3d8ca484-79f3.cloud.databricks.com/editor/notebooks/1188793424842144?o=3578414625112071
- google geocoder
In 21 states, the city can cross county lines, and it's parent in the geoId is the state
It can be the extreme opposite like with NYC, where the child of NYC is it's multiple counties

## Enrich with geoids
each row of Nigel's model has L2 district_type and name
    - Pull all of the voters tagged with those, run the script to pull geoids based on lat-longs
    - There will be multiple geoids. We can use our BR data to find an mtfcc for each surfaced geoid. The geoid with an MTFCC that matches our mapping for L2 district_type -> mtfcc will be considered. Most prevalent geoids can be added to an array on Nigel's model

## office match
    - We can then use these geoids on Nigel's model to create a `turnout` table on the election-api that has a 1:1 relation with the `Place` that has a matching geoid. We may run into issues if there's more than one match.


# Candidacy - columns
firstName
lastName
party (you can let me know your opinion based on the data, but likely we just need index 0 of parties)

## Person
image (again, likely just index 0 of images)
about (bioText on Person)
urls

## GP-API (P2V and topIssues)
### P2V
p2vData
projectedTurnout  
republicans   
democrats
independents
totalRegisteredVoters
### Top Issues
topIssues
### Campaign
city
state
email  
pastExperience (formerly jobHistory) 

previouslyInOffice  
priorRoles  

## Candidacy -> Position
electionFrequency (previously called term)
salary
normalizedPositionName
positionDescription

## Unknown
education
militaryService

// Vote to strike, move to officeholder feature
yearsInOffice 
---------------------
# Help Banner
firstName
lastName
office
city
state

# Candidate Card
    firstName,
    lastName,
    party,
    office,
    city,
    state,
    image,
    socialUrls,
    email,

# Content Section
p2vData

# p2vCard
office
city
state
p2vData
projectedTurnout

# TargetCard
office
city
state
republicans
democrats
indies
totalRegisteredVoters

# About Card
    firstName,
    lastName,
    about,
    jobHistory,
    education,
    militaryService,
    previouslyInOffice,
    priorRoles,
    yearsInOffice,

# Office Card
office
city
state
officeDescription
term
salary

# Top issues card
topIssues (an array of objects with 'stance' and 'issue' keys)

# Candidate Schema
    firstName,
    lastName,
    party,
    office,
    city,
    state,
    image,
    socialUrls,
    email,

# Place Level
## 'county'
G5420' = 1019
G5410' = 11
G4040' = 61
G4020' = 3007
G5400' = 19
G4110' = 21

## 'district'
'G5420' = 8206;
'G5410' = 250;
'G4020' = 1;
'G4040' = 2818;
'G5400' = 1660;
'G4110' = 1;
'G4000' = 1;

## not 'district' nor 'county'
'G5420' = 1481;
'X9000' = 1;
'G5410' = 9;
'G4020' = 139;
'G4040' = 30726;
'G5400' = 107;
'G4110' = 16950;
'G4000' = 50;

## County Bucket
G4020

## District Bucket
G5420
G5410
G5400

## Other / Municipality Bucket
G4110

## Never occurs at second level
G4040
G4000


State_Senate_District
County_Board_of_Education_District
Elementary_School_District
Elementary_School_SubDistrict
US_Congressional_District
Town_District
Hamlet_Community_Area
Unified_School_SubDistrict
High_School_District
High_School_SubDistrict
School_Subdistrict
Superintendent_of_Schools_District
City_Council_Commissioner_District
Community_College_SubDistrict
School_District
County_Supervisorial_District
City_School_District
State_House_District
County_Board_of_Education_SubDistrict
Judicial_Appellate_District
Judicial_District
Judicial_Superior_Court_District
City
Unified_School_District
Community_College_Commissioner_District
School_Facilities_Improvement_District
Town_Council