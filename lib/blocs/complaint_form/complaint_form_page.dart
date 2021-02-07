part of 'complaint_form_bloc.dart';

class ComplaintFormPage extends StatefulWidget {
  @override
  State createState() => _ComplaintFormPageState();
}

class _ComplaintFormPageState extends State<ComplaintFormPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final NumberTextInputFormatter _mobileFormatter = NumberTextInputFormatter();

  bool attemptedSubmit = false;

  Map<String, FocusNode> _focusNodes;

  Map<String, dynamic> initialValues = {
    COMPLAINT_FIRST_NAME: null,
    COMPLAINT_LAST_NAME: null,
    COMPLAINT_ORGANIZATION_NAME: null,
    COMPLAINT_STREET_ADDRESS: null,
    COMPLAINT_CITY: null,
    COMPLAINT_STATE: null,
    COMPLAINT_ZIP: null,
    COMPLAINT_PHONE: null,
    COMPLAINT_EMAIL: null,
    COMPLAINT_PREFERRED_CONTACT: null,
    RESPONDENT_FIRST_NAME: null,
    RESPONDENT_LAST_NAME: null,
    RESPONDENT_ORGANIZATION_NAME: null,
    RESPONDENT_STREET_ADDRESS: null,
    RESPONDENT_CITY: null,
    RESPONDENT_STATE: null,
    RESPONDENT_ZIP: null,
    RESPONDENT_PHONE: null,
    RESPONDENT_EMAIL: null,
  };

  @override
  void initState() {
    super.initState();

    _focusNodes = {
      COMPLAINT_FIRST_NAME: FocusNode(),
      COMPLAINT_LAST_NAME: FocusNode(),
      COMPLAINT_ORGANIZATION_NAME: FocusNode(),
      COMPLAINT_STREET_ADDRESS: FocusNode(),
      COMPLAINT_CITY: FocusNode(),
      COMPLAINT_STATE: FocusNode(),
      COMPLAINT_ZIP: FocusNode(),
      COMPLAINT_PHONE: FocusNode(),
      COMPLAINT_EMAIL: FocusNode(),
      COMPLAINT_PREFERRED_CONTACT: FocusNode(),
      RESPONDENT_FIRST_NAME: FocusNode(),
      RESPONDENT_LAST_NAME: FocusNode(),
      RESPONDENT_ORGANIZATION_NAME: FocusNode(),
      RESPONDENT_STREET_ADDRESS: FocusNode(),
      RESPONDENT_CITY: FocusNode(),
      RESPONDENT_STATE: FocusNode(),
      RESPONDENT_ZIP: FocusNode(),
      RESPONDENT_PHONE: FocusNode(),
      RESPONDENT_EMAIL: FocusNode(),
      TYPE_OF_COMPLAINT: FocusNode(),
      DISCRIMINATION_CLASS: FocusNode(),
      LAST_DISCRIMINATORY_ACT: FocusNode(),
      WHY_RESPONDENT_DESCRIMINATED: FocusNode(),
      COMPLAINT_FILED_WITH_OTHER_ORG: FocusNode(),
    };
  }

  void fillFormWithDummyData() {
    initialValues = {
      COMPLAINT_FIRST_NAME: 'Chris',
      COMPLAINT_LAST_NAME: 'Farwell',
      COMPLAINT_ORGANIZATION_NAME: 'Water Co.',
      COMPLAINT_STREET_ADDRESS: '38 Stillwater Mill Street',
      COMPLAINT_CITY: 'Jensonburg',
      COMPLAINT_ZIP: '02933',
      COMPLAINT_PHONE: '2003949200',
      COMPLAINT_EMAIL: 'farwellc@aol.com',
      COMPLAINT_PREFERRED_CONTACT: 'Phone',
      RESPONDENT_FIRST_NAME: 'Marcus',
      RESPONDENT_LAST_NAME: 'Stillwater',
      RESPONDENT_ORGANIZATION_NAME: 'Wahoo Co.',
      RESPONDENT_STREET_ADDRESS: '2080 Valley Forge Dr.',
      RESPONDENT_CITY: 'Kettering',
      RESPONDENT_ZIP: '45480',
      RESPONDENT_PHONE: '9378849494',
      RESPONDENT_EMAIL: 'mstillwater@gmail.com',
      LAST_DISCRIMINATORY_ACT:
          'I\'m not completely sure, but I feel like it was sometime last year.',
      WHY_RESPONDENT_DESCRIMINATED:
          'The reason he did that was because he has no control.',
      COMPLAINT_FILED_WITH_OTHER_ORG: 'No I have not.'
    };
  }

  void submitForm() async {
    _formKey.currentState.save();

    final FormBuilderState formBuilderState = _formKey.currentState;

    if (!formBuilderState.saveAndValidate()) {
      setState(() {
        attemptedSubmit = true;
      });

      return;
    }

    final bool confirm = await locator<ModalService>().showConfirmation(
        context: context, title: 'Submit Form', message: 'Are you sure?');

    if (!confirm) return;

    Map<String, dynamic> formData = formBuilderState.value;

    context.read<ComplaintFormBloc>().add(
          SubmitComplaintFormEvent(formData: formData),
        );
  }

  @override
  Widget build(BuildContext context) {
    fillFormWithDummyData(); //todo: delete this in production.

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Dayton Human Relations Council'),
        backgroundColor: Colors.brown,
      ),
      body: BlocConsumer<ComplaintFormBloc, ComplaintFormState>(
        builder: (context, state) {
          if (state is ComplaintFormLoadingState) {
            return CustomSpinner();
          }

          if (state is ComplaintFormInitialState) {
            return FormBuilder(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    biggerTextWidget(
                        text: 'Civil Rights Discrimination Complaint Form'),
                    generalTextWidget(
                        text:
                            'The City of Dayton Human Relations Council accepts complaints of unlawful discrimination in housing, employment, credit transactions, and public accommodations. If you feel that you have been discriminated against in one of these areas based on one or more of the protected classes listed below, you may be eligible to file a complaint against the person or organization that discriminated against you.'),
                    generalTextWidget(
                        text:
                            'If you believe that you have been the victim of discrimination, you can download and fill this complaint form or file a complaint in person at:'),
                    generalTextWidget(
                        text:
                            'The Human Relations Council, 371 West Second Street, Suite 100, Dayton, Ohio 45402'),
                    generalTextWidget(
                        text:
                            'You can also fill out the online form below and a member of our Civil Rights team will contact you as soon as possible.'),
                    biggerTextWidget(
                        text: 'Complainant Information (Your Information)'),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: FormBuilderTextField(
                        onSubmitted: (value) {
                          FocusScope.of(context)
                              .requestFocus(_focusNodes[COMPLAINT_LAST_NAME]);
                        },
                        initialValue: initialValues[COMPLAINT_FIRST_NAME],
                        focusNode: _focusNodes[COMPLAINT_FIRST_NAME],
                        name: COMPLAINT_FIRST_NAME,
                        decoration: InputDecoration(
                          labelText: 'First Name',
                        ),
                        onChanged: (value) {},
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(context),
                          ],
                        ),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: FormBuilderTextField(
                        onSubmitted: (value) {
                          FocusScope.of(context).requestFocus(
                              _focusNodes[COMPLAINT_ORGANIZATION_NAME]);
                        },
                        onEditingComplete: () {
                          //_formKey.currentState.save();
                        },
                        initialValue: initialValues[COMPLAINT_LAST_NAME],
                        focusNode: _focusNodes[COMPLAINT_LAST_NAME],
                        name: COMPLAINT_LAST_NAME,
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                        ),
                        onChanged: (value) {},
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(context),
                          ],
                        ),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        '-- or --',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: FormBuilderTextField(
                        onSubmitted: (value) {
                          FocusScope.of(context).requestFocus(
                              _focusNodes[COMPLAINT_STREET_ADDRESS]);
                        },
                        initialValue:
                            initialValues[COMPLAINT_ORGANIZATION_NAME],
                        focusNode: _focusNodes[COMPLAINT_ORGANIZATION_NAME],
                        name: COMPLAINT_ORGANIZATION_NAME,
                        decoration: InputDecoration(
                          labelText: 'Organization Name',
                        ),
                        onChanged: (value) {},
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(context),
                          ],
                        ),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: FormBuilderTextField(
                        onSubmitted: (value) {
                          FocusScope.of(context)
                              .requestFocus(_focusNodes[COMPLAINT_CITY]);
                        },
                        initialValue: initialValues[COMPLAINT_STREET_ADDRESS],
                        focusNode: _focusNodes[COMPLAINT_STREET_ADDRESS],
                        name: COMPLAINT_STREET_ADDRESS,
                        decoration: InputDecoration(
                          labelText: 'Street Address',
                        ),
                        onChanged: (value) {},
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(context),
                          ],
                        ),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: FormBuilderTextField(
                        onSubmitted: (value) {
                          FocusScope.of(context)
                              .requestFocus(_focusNodes[COMPLAINT_STATE]);
                        },
                        initialValue: initialValues[COMPLAINT_CITY],
                        focusNode: _focusNodes[COMPLAINT_CITY],
                        name: COMPLAINT_CITY,
                        decoration: InputDecoration(
                          labelText: 'City',
                        ),
                        onChanged: (value) {},
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(context),
                          ],
                        ),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Expanded(
                            child: FormBuilderDropdown(
                              onChanged: (state) {
                                FocusScope.of(context)
                                    .requestFocus(_focusNodes[COMPLAINT_ZIP]);
                              },

                              name: COMPLAINT_STATE,
                              decoration: InputDecoration(
                                labelText: 'State',
                              ),
                              // initialValue: 'Male',
                              allowClear: true,
                              hint: Text(''),
                              initialValue: STATES_DROPDOWN_DATA[0]
                                  ['abbreviation'],
                              validator: FormBuilderValidators.compose(
                                  [FormBuilderValidators.required(context)]),
                              items: STATES_DROPDOWN_DATA
                                  .map((state) => DropdownMenuItem(
                                        value: state['abbreviation'],
                                        child: Text('${state['abbreviation']}'),
                                      ))
                                  .toList(),
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: FormBuilderTextField(
                              onSubmitted: (value) {
                                FocusScope.of(context)
                                    .requestFocus(_focusNodes[COMPLAINT_PHONE]);
                              },
                              focusNode: _focusNodes[COMPLAINT_ZIP],
                              name: COMPLAINT_ZIP,
                              decoration: InputDecoration(
                                labelText: 'Zip',
                              ),
                              initialValue: initialValues[COMPLAINT_ZIP],
                              validator: FormBuilderValidators.compose(
                                [
                                  FormBuilderValidators.required(context),
                                  FormBuilderValidators.maxLength(context, 5),
                                  FormBuilderValidators.minLength(context, 5),
                                ],
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: FormBuilderTextField(
                        onSubmitted: (value) {
                          FocusScope.of(context)
                              .requestFocus(_focusNodes[COMPLAINT_EMAIL]);
                        },
                        initialValue: initialValues[COMPLAINT_PHONE],
                        focusNode: _focusNodes[COMPLAINT_PHONE],
                        name: COMPLAINT_PHONE,
                        decoration: InputDecoration(
                          labelText: 'Phone',
                        ),
                        onChanged: (value) {},
                        maxLength: 10,
                        inputFormatters: [
                          _mobileFormatter,
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(context),
                          ],
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: FormBuilderTextField(
                        onSubmitted: (value) {
                          FocusScope.of(context).requestFocus(
                              _focusNodes[COMPLAINT_PREFERRED_CONTACT]);
                        },
                        initialValue: initialValues[COMPLAINT_EMAIL],
                        focusNode: _focusNodes[COMPLAINT_EMAIL],
                        name: COMPLAINT_EMAIL,
                        decoration: InputDecoration(
                          labelText: 'Email',
                        ),
                        onChanged: (value) {},
                        inputFormatters: [],
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.email(context)
                          ],
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text('Preferred Contact'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: FormBuilderRadioGroup(
                        onChanged: (value) {
                          FocusScope.of(context).requestFocus(_focusNodes['?']);
                        },
                        initialValue:
                            initialValues[COMPLAINT_PREFERRED_CONTACT],
                        name: COMPLAINT_PREFERRED_CONTACT,
                        validator: FormBuilderValidators.required(context),
                        options: [
                          'Phone',
                          'Email',
                          'US Mail',
                        ]
                            .map(
                              (option) => FormBuilderFieldOption(
                                value: option,
                              ),
                            )
                            .toList(
                              growable: false,
                            ),
                      ),
                    ),
                    biggerTextWidget(
                      text:
                          'Respondent Information (Person or Organization that Discriminated)',
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: FormBuilderTextField(
                        onSubmitted: (value) {
                          FocusScope.of(context)
                              .requestFocus(_focusNodes[RESPONDENT_LAST_NAME]);
                        },
                        initialValue: initialValues[RESPONDENT_FIRST_NAME],
                        focusNode: _focusNodes[RESPONDENT_FIRST_NAME],
                        name: RESPONDENT_FIRST_NAME,
                        decoration: InputDecoration(
                          labelText: 'First Name',
                        ),
                        onChanged: (value) {},
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(context),
                          ],
                        ),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: FormBuilderTextField(
                        onSubmitted: (value) {
                          FocusScope.of(context).requestFocus(
                              _focusNodes[RESPONDENT_ORGANIZATION_NAME]);
                        },
                        onEditingComplete: () {
                          //_formKey.currentState.save();
                        },
                        initialValue: initialValues[RESPONDENT_LAST_NAME],
                        focusNode: _focusNodes[RESPONDENT_LAST_NAME],
                        name: RESPONDENT_LAST_NAME,
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                        ),
                        onChanged: (value) {},
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(context),
                          ],
                        ),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        '-- or --',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: FormBuilderTextField(
                        onSubmitted: (value) {
                          FocusScope.of(context).requestFocus(
                              _focusNodes[RESPONDENT_STREET_ADDRESS]);
                        },
                        initialValue:
                            initialValues[RESPONDENT_ORGANIZATION_NAME],
                        focusNode: _focusNodes[RESPONDENT_ORGANIZATION_NAME],
                        name: RESPONDENT_ORGANIZATION_NAME,
                        decoration: InputDecoration(
                          labelText: 'Organization Name',
                        ),
                        onChanged: (value) {},
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(context),
                          ],
                        ),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: FormBuilderTextField(
                        onSubmitted: (value) {
                          FocusScope.of(context)
                              .requestFocus(_focusNodes[RESPONDENT_CITY]);
                        },
                        initialValue: initialValues[RESPONDENT_STREET_ADDRESS],
                        focusNode: _focusNodes[RESPONDENT_STREET_ADDRESS],
                        name: RESPONDENT_STREET_ADDRESS,
                        decoration: InputDecoration(
                          labelText: 'Street Address',
                        ),
                        onChanged: (value) {},
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(context),
                          ],
                        ),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: FormBuilderTextField(
                        onSubmitted: (value) {
                          FocusScope.of(context)
                              .requestFocus(_focusNodes[RESPONDENT_STATE]);
                        },
                        initialValue: initialValues[RESPONDENT_CITY],
                        focusNode: _focusNodes[RESPONDENT_CITY],
                        name: RESPONDENT_CITY,
                        decoration: InputDecoration(
                          labelText: 'City',
                        ),
                        onChanged: (value) {},
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(context),
                          ],
                        ),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Expanded(
                            child: FormBuilderDropdown(
                              onChanged: (state) {
                                FocusScope.of(context)
                                    .requestFocus(_focusNodes[RESPONDENT_ZIP]);
                              },

                              name: RESPONDENT_STATE,
                              decoration: InputDecoration(
                                labelText: 'State',
                              ),
                              // initialValue: 'Male',
                              allowClear: true,
                              hint: Text(''),
                              initialValue: STATES_DROPDOWN_DATA[0]
                                  ['abbreviation'],
                              validator: FormBuilderValidators.compose(
                                  [FormBuilderValidators.required(context)]),
                              items: STATES_DROPDOWN_DATA
                                  .map((state) => DropdownMenuItem(
                                        value: state['abbreviation'],
                                        child: Text('${state['abbreviation']}'),
                                      ))
                                  .toList(),
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: FormBuilderTextField(
                              onSubmitted: (value) {
                                FocusScope.of(context).requestFocus(
                                    _focusNodes[RESPONDENT_PHONE]);
                              },
                              focusNode: _focusNodes[RESPONDENT_ZIP],
                              name: RESPONDENT_ZIP,
                              decoration: InputDecoration(
                                labelText: 'Zip',
                              ),
                              initialValue: initialValues[RESPONDENT_ZIP],
                              validator: FormBuilderValidators.compose(
                                [
                                  FormBuilderValidators.required(context),
                                  FormBuilderValidators.maxLength(context, 5),
                                  FormBuilderValidators.minLength(context, 5),
                                ],
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: FormBuilderTextField(
                        onSubmitted: (value) {
                          FocusScope.of(context)
                              .requestFocus(_focusNodes[RESPONDENT_EMAIL]);
                        },
                        initialValue: initialValues[RESPONDENT_PHONE],
                        focusNode: _focusNodes[RESPONDENT_PHONE],
                        name: RESPONDENT_PHONE,
                        decoration: InputDecoration(
                          labelText: 'Phone',
                        ),
                        onChanged: (value) {},
                        maxLength: 10,
                        inputFormatters: [
                          _mobileFormatter,
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(context),
                          ],
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: FormBuilderTextField(
                        onSubmitted: (value) {
                          FocusScope.of(context).requestFocus(_focusNodes['?']);
                        },
                        initialValue: initialValues[RESPONDENT_EMAIL],
                        focusNode: _focusNodes[RESPONDENT_EMAIL],
                        name: RESPONDENT_EMAIL,
                        decoration: InputDecoration(
                          labelText: 'Email',
                        ),
                        onChanged: (value) {},
                        inputFormatters: [],
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.email(context)
                          ],
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text('Type of Complaint'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: FormBuilderCheckboxGroup(
                        onChanged: (value) {
                          FocusScope.of(context).requestFocus(_focusNodes['?']);
                        },
                        options: [
                          'Employment',
                          'Housing',
                          'Credit Transaction',
                          'Public Accomodation'
                        ]
                            .map(
                              (option) => FormBuilderFieldOption(
                                value: option,
                              ),
                            )
                            .toList(
                              growable: false,
                            ),
                        name: TYPE_OF_COMPLAINT,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                          'I have been discriminated against because of my membership in the following protected class(es):'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: FormBuilderCheckboxGroup(
                        onChanged: (value) {
                          FocusScope.of(context).requestFocus(_focusNodes['?']);
                        },
                        options: [
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
                        ]
                            .map(
                              (option) => FormBuilderFieldOption(
                                value: option,
                              ),
                            )
                            .toList(
                              growable: false,
                            ),
                        name: DISCRIMINATION_CLASS,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child:
                          Text('When did the last discriminatory act occur?'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        20,
                        0,
                        20,
                        20,
                      ),
                      child: FormBuilderTextField(
                        maxLines: 5,
                        onSubmitted: (value) {
                          FocusScope.of(context).requestFocus(
                              _focusNodes[WHY_RESPONDENT_DESCRIMINATED]);
                        },
                        initialValue: initialValues[LAST_DISCRIMINATORY_ACT],
                        focusNode: _focusNodes[LAST_DISCRIMINATORY_ACT],
                        name: LAST_DISCRIMINATORY_ACT,
                        onChanged: (value) {},
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(context),
                          ],
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                          'Please explain how the Respondent discriminated against you. For example, were you refused the right to rent a house because you have children? Were you fired from a job because of your disability? Were you refused service at a restaurant because of your race? Please describe below.'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        20,
                        0,
                        20,
                        20,
                      ),
                      child: FormBuilderTextField(
                        maxLines: 5,
                        onSubmitted: (value) {
                          FocusScope.of(context).requestFocus(
                              _focusNodes[COMPLAINT_FILED_WITH_OTHER_ORG]);
                        },
                        initialValue:
                            initialValues[WHY_RESPONDENT_DESCRIMINATED],
                        focusNode: _focusNodes[WHY_RESPONDENT_DESCRIMINATED],
                        name: WHY_RESPONDENT_DESCRIMINATED,
                        onChanged: (value) {},
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(context),
                          ],
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                          'Have you filed a complaint with any other organization? If so, which organization, when was it filed, and what is the status or outcome of the investigation?'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        20,
                        0,
                        20,
                        20,
                      ),
                      child: FormBuilderTextField(
                        maxLines: 5,
                        onSubmitted: (value) {
                          FocusScope.of(context).requestFocus(_focusNodes['?']);
                        },
                        initialValue:
                            initialValues[COMPLAINT_FILED_WITH_OTHER_ORG],
                        focusNode: _focusNodes[COMPLAINT_FILED_WITH_OTHER_ORG],
                        name: COMPLAINT_FILED_WITH_OTHER_ORG,
                        onChanged: (value) {},
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(context),
                          ],
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Visibility(
                        visible: attemptedSubmit,
                        child: Center(
                          child: Text(
                            'Sorry, looks like there\'s an error in your form.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.red.shade700,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: CustomButton(
                          buttonColor: Colors.blueGrey,
                          text: 'SUBMIT',
                          textColor: Colors.white,
                          onPressed: submitForm,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }

          if (state is ComplaintFormErrorState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.thumb_down_sharp,
                  color: Colors.red,
                  size: 100,
                ),
                Text(
                  'Sorry!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 21,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'We had trouble submitting your form; please try again later.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  buttonColor: Colors.blueGrey,
                  text: 'Back To Form',
                  textColor: Colors.white,
                  onPressed: () {
                    context.read<ComplaintFormBloc>().add(
                          ReturnToFormEvent(),
                        );
                  },
                ),
              ],
            );
          }

          if (state is ComplaintFormSuccessState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.thumb_up_sharp,
                  color: Colors.green,
                  size: 100,
                ),
                Text(
                  'Got It!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 21,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Your form has been successfully submitted; we will respond shortly!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  buttonColor: Colors.blueGrey,
                  text: 'Back To Form',
                  textColor: Colors.white,
                  onPressed: () {
                    context.read<ComplaintFormBloc>().add(
                          ReturnToFormEvent(),
                        );
                  },
                ),
              ],
            );
          }

          return Container();
        },
        listener: (context, state) {
          if (state is ComplaintFormErrorState) {}
        },
      ),
    );
  }

  Widget generalTextWidget({@required String text}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }

  Widget biggerTextWidget({@required String text}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}

class NumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = new StringBuffer();
    if (newTextLength >= 1) {
      newText.write('+');
      if (newValue.selection.end >= 1) selectionIndex++;
    }
    if (newTextLength >= 3) {
      newText.write(newValue.text.substring(0, usedSubstringIndex = 2) + ' ');
      if (newValue.selection.end >= 2) selectionIndex += 1;
    }
    // Dump the rest.
    if (newTextLength >= usedSubstringIndex)
      newText.write(newValue.text.substring(usedSubstringIndex));
    return new TextEditingValue(
      text: newText.toString(),
      selection: new TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
