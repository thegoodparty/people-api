// list of expected values for use facing filters

const voterStatusExpectedValues = [
  'Super',
  'Likely',
  'Unreliable',
  'Unlikely',
  'First Time',
  'Unknown',
] as const

const politicalPartyExpectedValues = [
  'Independent',
  'Democratic',
  'Republican',
  'Unknown',
] as const

const maritalStatusExpectedValues = [
  'Inferred Married',
  'Inferred Single',
  'Married',
  'Single',
  'Unknown',
] as const

const veteranStatusExpectedValues = ['Yes', 'Unknown'] as const

const educationLevelExpectedValues = [
  'None',
  'High School Diploma',
  'Technical School',
  'Some College',
  'College Degree',
  'Graduate Degree',
  'Unknown',
] as const

const ethnicityExpectedValues = [
  'Asian',
  'European',
  'Hispanic',
  'African American',
  'Other',
  'Unknown',
] as const

const businessOwnerExpectedValues = ['Yes', 'Unknown'] as const

const presenceOfChildrenExpectedValues = ['Yes', 'No', 'Unknown'] as const

const homeownerExpectedValues = ['Yes', 'Likely', 'No', 'Unknown'] as const

const genderExpectedValues = ['M', 'F', 'Unknown'] as const

const languageExpectedValues = ['English', 'Spanish', 'Other'] as const

const estimatedIncomeAmountIntExpectedValues: number[] = []

const ageIntExpectedValues: number[] = []
