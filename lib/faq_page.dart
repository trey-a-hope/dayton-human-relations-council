import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FaqPage extends StatefulWidget {
  @override
  State createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Civil Rights FAQ'),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          biggerTextWidget(
            text:
                'The Human Relations Council attempts to resolve all issues in the timeliest manner possible. In order to save time and better serve residents of the City of Dayton, we have compiled a list of civil rights frequently asked questions. Tap a question to find your answer.',
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: ExpandablePanel(
              header: Container(
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'How do I file a complaint of discrimination?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              collapsed: SizedBox.shrink(),
              expanded: Container(
                // width: screenWidth * 0.8,
                color: Colors.grey.shade300,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                          'If you believe you have been discriminated against because of your race, color, religion, sex, ancestry, national origin, place of birth, age, marital status, familial status, sexual orientation, gender identity, or disability in the areas of employment, housing, public accommodations, and credit in violation of the City of Dayton Revised Code of General Ordinances (R.C.G.O) 32.02-32.21 and 32.99, you may contact us to discuss the filing of a complaint.'),
                      SizedBox(
                        height: 18,
                      ),
                      Text(
                          'A housing complaint must be filed within one year from the date of the occurrence of the alleged discriminatory act. There are, however, certain exemptions that housing providers may be entitled to, which would preclude the filing of your complaint. Please contact our office to discuss your situation, to ensure that the property and/or housing provider is not exempt.'),
                      SizedBox(
                        height: 18,
                      ),
                      Text(
                          'A public accommodation, credit transaction, or employment complaint must be filed within six months of the date of occurrence of the alleged discriminatory act. For employment complaints, the law covers employers with four or more employees.'),
                      SizedBox(
                        height: 18,
                      ),
                      Text(
                          'You may file your complaint by contacting the Human Relations Council (HRC) to arrange an appointment to speak to an investigator, or you may visit the HRC’s office between 8:00 a.m. and 5.00 p.m. to file complaints.'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: ExpandablePanel(
              header: Container(
                //width: screenWidth * 0.8,
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'What is the difference between a charge and a complaint?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              collapsed: SizedBox.shrink(),
              expanded: Container(
                // width: screenWidth * 0.8,
                color: Colors.grey.shade300,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                          'A complaint is filed with the HRC when an individual believes he/she has been discriminated in housing, employment, public accommodation or credit. The Complainant in a complaint is the individual alleging discrimination has occurred. A charge is filed after the HRC has found probable cause. The charge is filed by the HRC and the facts of the case are presented to a hearing examiner. The hearing examiner issues a finding based on the facts presented by the Complainant and the Respondent. The Complainant in the charge is the HRC.'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: ExpandablePanel(
              header: Container(
                //width: screenWidth * 0.8,
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Can I be fired or evicted for filing a discrimination complaint?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              collapsed: SizedBox.shrink(),
              expanded: Container(
                // width: screenWidth * 0.8,
                color: Colors.grey.shade300,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                          'No. Retaliation for filing a discrimination complaint is against the law.'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: ExpandablePanel(
              header: Container(
                //width: screenWidth * 0.8,
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Do I need a lawyer to file a complaint?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              collapsed: SizedBox.shrink(),
              expanded: Container(
                // width: screenWidth * 0.8,
                color: Colors.grey.shade300,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                          'No. It is your decision to hire an attorney. Our investigators are qualified to conduct impartial investigations using a fact finding process. However, if you have the need to appeal the decision regarding your complaint, you may decide to seek the assistance of an attorney. Should you decide to hire an attorney to handle your complaint, all communication regarding the complaint will be sent to your attorney.'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: ExpandablePanel(
              header: Container(
                //width: screenWidth * 0.8,
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'What is the cost of the HRC services?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              collapsed: SizedBox.shrink(),
              expanded: Container(
                // width: screenWidth * 0.8,
                color: Colors.grey.shade300,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('The HRC’s services are free to the public.'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: ExpandablePanel(
              header: Container(
                //width: screenWidth * 0.8,
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'When is an individual considered to have a disability?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              collapsed: SizedBox.shrink(),
              expanded: Container(
                // width: screenWidth * 0.8,
                color: Colors.grey.shade300,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                          'An individual is considered to have a disability if that person has one of the following:'),
                      SizedBox(
                        height: 18,
                      ),
                      Text(
                          '* A physical or mental impairment that substantially limits one or more major life activities;'),
                      SizedBox(
                        height: 18,
                      ),
                      Text('* A record of such an impairment; or'),
                      SizedBox(
                        height: 18,
                      ),
                      Text('* Been regarded as having such an impairment.'),
                      SizedBox(
                        height: 18,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: ExpandablePanel(
              header: Container(
                //width: screenWidth * 0.8,
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'What are major life activities?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              collapsed: SizedBox.shrink(),
              expanded: Container(
                // width: screenWidth * 0.8,
                color: Colors.grey.shade300,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                          'Examples of major life activities are self-care, performing manual tasks, seeing, sleeping, hearing, speaking, breathing, and working. An individual with a disability must be substantially limited in one or more major life activities.'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget biggerTextWidget({@required String text}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
        textAlign: TextAlign.center,
      ),
    );
  }
}
