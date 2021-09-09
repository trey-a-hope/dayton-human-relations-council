//Endpoints
const String EMAIL_ENDPOINT =
    'https://us-central1-dayton-human-relations-council.cloudfunctions.net/testEmail';

//Emails
const String SERVICE_EMAIL = 'civilrights@daytonohio.gov';

const List<dynamic> STATES_DROPDOWN_DATA = [
  {'name': 'Alabama', 'abbreviation': 'AL'},
  {'name': 'Alaska', 'abbreviation': 'AK'},
  {'name': 'American Samoa', 'abbreviation': 'AS'},
  {'name': 'Arizona', 'abbreviation': 'AZ'},
  {'name': 'Arkansas', 'abbreviation': 'AR'},
  {'name': 'California', 'abbreviation': 'CA'},
  {'name': 'Colorado', 'abbreviation': 'CO'},
  {'name': 'Connecticut', 'abbreviation': 'CT'},
  {'name': 'Delaware', 'abbreviation': 'DE'},
  {'name': 'District Of Columbia', 'abbreviation': 'DC'},
  {'name': 'Federated States Of Micronesia', 'abbreviation': 'FM'},
  {'name': 'Florida', 'abbreviation': 'FL'},
  {'name': 'Georgia', 'abbreviation': 'GA'},
  {'name': 'Guam', 'abbreviation': 'GU'},
  {'name': 'Hawaii', 'abbreviation': 'HI'},
  {'name': 'Idaho', 'abbreviation': 'ID'},
  {'name': 'Illinois', 'abbreviation': 'IL'},
  {'name': 'Indiana', 'abbreviation': 'IN'},
  {'name': 'Iowa', 'abbreviation': 'IA'},
  {'name': 'Kansas', 'abbreviation': 'KS'},
  {'name': 'Kentucky', 'abbreviation': 'KY'},
  {'name': 'Louisiana', 'abbreviation': 'LA'},
  {'name': 'Maine', 'abbreviation': 'ME'},
  {'name': 'Marshall Islands', 'abbreviation': 'MH'},
  {'name': 'Maryland', 'abbreviation': 'MD'},
  {'name': 'Massachusetts', 'abbreviation': 'MA'},
  {'name': 'Michigan', 'abbreviation': 'MI'},
  {'name': 'Minnesota', 'abbreviation': 'MN'},
  {'name': 'Mississippi', 'abbreviation': 'MS'},
  {'name': 'Missouri', 'abbreviation': 'MO'},
  {'name': 'Montana', 'abbreviation': 'MT'},
  {'name': 'Nebraska', 'abbreviation': 'NE'},
  {'name': 'Nevada', 'abbreviation': 'NV'},
  {'name': 'New Hampshire', 'abbreviation': 'NH'},
  {'name': 'New Jersey', 'abbreviation': 'NJ'},
  {'name': 'New Mexico', 'abbreviation': 'NM'},
  {'name': 'New York', 'abbreviation': 'NY'},
  {'name': 'North Carolina', 'abbreviation': 'NC'},
  {'name': 'North Dakota', 'abbreviation': 'ND'},
  {'name': 'Northern Mariana Islands', 'abbreviation': 'MP'},
  {'name': 'Ohio', 'abbreviation': 'OH'},
  {'name': 'Oklahoma', 'abbreviation': 'OK'},
  {'name': 'Oregon', 'abbreviation': 'OR'},
  {'name': 'Palau', 'abbreviation': 'PW'},
  {'name': 'Pennsylvania', 'abbreviation': 'PA'},
  {'name': 'Puerto Rico', 'abbreviation': 'PR'},
  {'name': 'Rhode Island', 'abbreviation': 'RI'},
  {'name': 'South Carolina', 'abbreviation': 'SC'},
  {'name': 'South Dakota', 'abbreviation': 'SD'},
  {'name': 'Tennessee', 'abbreviation': 'TN'},
  {'name': 'Texas', 'abbreviation': 'TX'},
  {'name': 'Utah', 'abbreviation': 'UT'},
  {'name': 'Vermont', 'abbreviation': 'VT'},
  {'name': 'Virgin Islands', 'abbreviation': 'VI'},
  {'name': 'Virginia', 'abbreviation': 'VA'},
  {'name': 'Washington', 'abbreviation': 'WA'},
  {'name': 'West Virginia', 'abbreviation': 'WV'},
  {'name': 'Wisconsin', 'abbreviation': 'WI'},
  {'name': 'Wyoming', 'abbreviation': 'WY'},
];

//Individual
const String INDIVIDUAL_FIRST_NAME = 'individual_first_name';
const String INDIVIDUAL_LAST_NAME = 'individual_last_name';
const String INDIVIDUAL_ORGANIZATION_NAME = 'individual_organization_name';
const String INDIVIDUAL_STREET_ADDRESS = 'individual_street_address';
const String INDIVIDUAL_CITY = 'individual_city';
const String INDIVIDUAL_STATE = 'individual_state';
const String INDIVIDUAL_ZIP = 'individual_zip';
const String INDIVIDUAL_PHONE = 'individual_phone';
const String INDIVIDUAL_EMAIL = 'individual_email';
const String INDIVIDUAL_PREFERRED_CONTACT = 'individual_preferred_contact';
const String INDIVIDUAL_TYPE_OF_COMPLAINT = 'individual_type_of_complaint';
const String INDIVIDUAL_DISCRIMINATION_CLASS =
    'individual_discrimination_class';
const String INDIVIDUAL_LAST_DISCRIMINATORY_ACT =
    'individual_last_discriminatory_act';
const String INDIVIDUAL_WHY_RESPONDENT_DESCRIMINATED =
    'individual_why_respondent_discriminated';
const String INDIVIDUAL_COMPLAINT_FILED_WITH_OTHER_ORG =
    'individual_complaint_filed_with_other_org';

//Organization
const String ORGANIZATION_FIRST_NAME = 'respondent_first_name';
const String ORGANIZATION_LAST_NAME = 'respondent_last_name';
const String ORGANIZATION_ORGANIZATION_NAME = 'respondent_organization_name';
const String ORGANIZATION_STREET_ADDRESS = 'respondent_street_address';
const String ORGANIZATION_CITY = 'respondent_city';
const String ORGANIZATION_STATE = 'respondent_state';
const String ORGANIZATION_ZIP = 'respondent_zip';
const String ORGANIZATION_PHONE = 'respondent_phone';
const String ORGANIZATION_EMAIL = 'respondent_email';
const String ORGANIZATION_PREFERRED_CONTACT = 'respondent_preferred_contact';
const String ORGANIZATION_TYPE_OF_COMPLAINT = 'respondent_type_of_complaint';
const String ORGANIZATION_DISCRIMINATION_CLASS =
    'respondent_discrimination_class';
const String ORGANIZATION_LAST_DISCRIMINATORY_ACT =
    'respondent_last_discriminatory_act';
const String ORGANIZATION_WHY_RESPONDENT_DESCRIMINATED =
    'respondent_why_respondent_discriminated';
const String ORGANIZATION_COMPLAINT_FILED_WITH_OTHER_ORG =
    'respondent_complaint_filed_with_other_org';

//Images
const String IMAGE_1 = 'assets/images/image_1.jpg';
const String IMAGE_2 = 'assets/images/image_2.jpg';
const String IMAGE_3 = 'assets/images/image_3.png';
const String IMAGE_MANY_PEOPLE = 'assets/images/many_people.jpg';

//GLOBAL VARIABLES
String? version;
String? buildNumber;

//
const List<String> discriminationClasses = [
  'Race',
  'Color',
  'Religion',
  'Sex/Gender (includes sexual harrassment)',
  'Sexual Orientation',
  'Gender Indentity',
  'National Origin',
  'Ancestry',
  'Age',
  'Marital Status',
  'Family Status (housing discrimination only)',
  'Disability/Handicap',
  'Place of Birth (employment credit transaction, and public accomodation only)'
];

const List<String> complaintOptions = [
  'Employment',
  'Housing',
  'Credit Transaction',
  'Public Accomodation'
];

const List<String> preferredContactOptions = [
  'Phone',
  'Email',
  'US Mail',
];
