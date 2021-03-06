part of 'complaint_form_bloc.dart';

class ComplaintFormPage extends StatefulWidget {
  @override
  State createState() => _ComplaintFormPageState();
}

class _ComplaintFormPageState extends State<ComplaintFormPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormBuilderState> _individualFormKey =
      GlobalKey<FormBuilderState>();
  final GlobalKey<FormBuilderState> _organizationFormKey =
      GlobalKey<FormBuilderState>();
  final NumberTextInputFormatter _mobileFormatter = NumberTextInputFormatter();

  late Map<String, FocusNode> _focusNodes;
  Map<String, TextEditingController> _controllers = {};

  bool _isIndividual = true;

  Map<String, dynamic> initialValues = {
    INDIVIDUAL_FIRST_NAME: null,
    INDIVIDUAL_LAST_NAME: null,
    INDIVIDUAL_ORGANIZATION_NAME: null,
    INDIVIDUAL_STREET_ADDRESS: null,
    INDIVIDUAL_CITY: null,
    INDIVIDUAL_STATE: null,
    INDIVIDUAL_ZIP: null,
    INDIVIDUAL_PHONE: null,
    INDIVIDUAL_EMAIL: null,
    INDIVIDUAL_PREFERRED_CONTACT: null,
    INDIVIDUAL_TYPE_OF_COMPLAINT: null,
    INDIVIDUAL_DISCRIMINATION_CLASS: null,
    INDIVIDUAL_LAST_DISCRIMINATORY_ACT: null,
    INDIVIDUAL_WHY_RESPONDENT_DESCRIMINATED: null,
    INDIVIDUAL_COMPLAINT_FILED_WITH_OTHER_ORG: null,
    ORGANIZATION_FIRST_NAME: null,
    ORGANIZATION_LAST_NAME: null,
    ORGANIZATION_ORGANIZATION_NAME: null,
    ORGANIZATION_STREET_ADDRESS: null,
    ORGANIZATION_CITY: null,
    ORGANIZATION_STATE: null,
    ORGANIZATION_ZIP: null,
    ORGANIZATION_PHONE: null,
    ORGANIZATION_EMAIL: null,
    ORGANIZATION_PREFERRED_CONTACT: null,
    ORGANIZATION_TYPE_OF_COMPLAINT: null,
    ORGANIZATION_DISCRIMINATION_CLASS: null,
    ORGANIZATION_LAST_DISCRIMINATORY_ACT: null,
    ORGANIZATION_WHY_RESPONDENT_DESCRIMINATED: null,
    ORGANIZATION_COMPLAINT_FILED_WITH_OTHER_ORG: null,
  };

  @override
  void initState() {
    super.initState();

    //Create focus nodes for each form field.
    _focusNodes = {
      INDIVIDUAL_FIRST_NAME: FocusNode(),
      INDIVIDUAL_LAST_NAME: FocusNode(),
      INDIVIDUAL_ORGANIZATION_NAME: FocusNode(),
      INDIVIDUAL_STREET_ADDRESS: FocusNode(),
      INDIVIDUAL_CITY: FocusNode(),
      INDIVIDUAL_STATE: FocusNode(),
      INDIVIDUAL_ZIP: FocusNode(),
      INDIVIDUAL_PHONE: FocusNode(),
      INDIVIDUAL_EMAIL: FocusNode(),
      INDIVIDUAL_PREFERRED_CONTACT: FocusNode(),
      INDIVIDUAL_TYPE_OF_COMPLAINT: FocusNode(),
      INDIVIDUAL_DISCRIMINATION_CLASS: FocusNode(),
      INDIVIDUAL_LAST_DISCRIMINATORY_ACT: FocusNode(),
      INDIVIDUAL_WHY_RESPONDENT_DESCRIMINATED: FocusNode(),
      INDIVIDUAL_COMPLAINT_FILED_WITH_OTHER_ORG: FocusNode(),
      ORGANIZATION_FIRST_NAME: FocusNode(),
      ORGANIZATION_LAST_NAME: FocusNode(),
      ORGANIZATION_ORGANIZATION_NAME: FocusNode(),
      ORGANIZATION_STREET_ADDRESS: FocusNode(),
      ORGANIZATION_CITY: FocusNode(),
      ORGANIZATION_STATE: FocusNode(),
      ORGANIZATION_ZIP: FocusNode(),
      ORGANIZATION_PHONE: FocusNode(),
      ORGANIZATION_EMAIL: FocusNode(),
      ORGANIZATION_PREFERRED_CONTACT: FocusNode(),
      ORGANIZATION_TYPE_OF_COMPLAINT: FocusNode(),
      ORGANIZATION_DISCRIMINATION_CLASS: FocusNode(),
      ORGANIZATION_LAST_DISCRIMINATORY_ACT: FocusNode(),
      ORGANIZATION_WHY_RESPONDENT_DESCRIMINATED: FocusNode(),
      ORGANIZATION_COMPLAINT_FILED_WITH_OTHER_ORG: FocusNode(),
    };

    _focusNodes.forEach((key, value) {
      _controllers.addAll({key: TextEditingController()});
    });

    // _fillFormWithDummyData();/NOTE: Only use when testing.
  }

  @override
  void dispose() {
    _focusNodes.forEach((key, value) {
      _focusNodes[key]!.dispose();
    });
    super.dispose();
  }

  void _fillFormWithDummyData() {
    initialValues = {
      INDIVIDUAL_FIRST_NAME: 'Trey',
      INDIVIDUAL_LAST_NAME: 'Hope',
      INDIVIDUAL_ORGANIZATION_NAME: 'tr3Designs',
      INDIVIDUAL_STREET_ADDRESS: '123 Street',
      INDIVIDUAL_CITY: 'Trotwood',
      INDIVIDUAL_STATE: 'OH',
      INDIVIDUAL_ZIP: '45426',
      INDIVIDUAL_PHONE: '9373052027',
      INDIVIDUAL_EMAIL: 'trey.a.hope@gmail.com',
      INDIVIDUAL_PREFERRED_CONTACT: 'phone',
      INDIVIDUAL_TYPE_OF_COMPLAINT: null,
      INDIVIDUAL_DISCRIMINATION_CLASS: null,
      INDIVIDUAL_LAST_DISCRIMINATORY_ACT: null,
      INDIVIDUAL_WHY_RESPONDENT_DESCRIMINATED: null,
      INDIVIDUAL_COMPLAINT_FILED_WITH_OTHER_ORG: null,
      ORGANIZATION_FIRST_NAME: 'abcBLocks',
      ORGANIZATION_LAST_NAME: 'null',
      ORGANIZATION_ORGANIZATION_NAME: 'null',
      ORGANIZATION_STREET_ADDRESS: '937 Ave.',
      ORGANIZATION_CITY: 'Wager',
      ORGANIZATION_STATE: 'WI',
      ORGANIZATION_ZIP: '39399',
      ORGANIZATION_PHONE: '3383338838',
      ORGANIZATION_EMAIL: 'wagerw@wull.com',
      ORGANIZATION_PREFERRED_CONTACT: null,
      ORGANIZATION_TYPE_OF_COMPLAINT: null,
      ORGANIZATION_DISCRIMINATION_CLASS: null,
      ORGANIZATION_LAST_DISCRIMINATORY_ACT: null,
      ORGANIZATION_WHY_RESPONDENT_DESCRIMINATED: null,
      ORGANIZATION_COMPLAINT_FILED_WITH_OTHER_ORG: null,
    };
  }

  void _submitIndividualForm() async {
    final FormBuilderState formBuilderState = _individualFormKey.currentState!;

    if (!formBuilderState.saveAndValidate()) return;

    final bool? confirm = await locator<ModalService>().showConfirmation(
        context: context, title: 'Submit Form', message: 'Are you sure?');

    if (confirm == null || !confirm) return;

    Map<String, dynamic> formData = formBuilderState.value;

    context.read<ComplaintFormBloc>().add(
          SubmitComplaintFormEvent(formData: formData),
        );
  }

  void _submitOrganizationForm() async {
    final FormBuilderState formBuilderState =
        _organizationFormKey.currentState!;

    if (!formBuilderState.saveAndValidate()) return;

    final bool? confirm = await locator<ModalService>().showConfirmation(
        context: context, title: 'Submit Form', message: 'Are you sure?');

    if (confirm == null || !confirm) return;

    Map<String, dynamic> formData = formBuilderState.value;

    context.read<ComplaintFormBloc>().add(
          SubmitComplaintFormEvent(formData: formData),
        );
  }

  FormBuilder _buildIndividualForm() {
    return FormBuilder(
      autoFocusOnValidationFailure: true,
      key: _individualFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomGeneralTextWidget(
            text: 'Complainant Information (Your Information)',
            style: Theme.of(context).textTheme.bodyText1!,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: FormBuilderTextField(
              controller: _controllers[INDIVIDUAL_FIRST_NAME],
              onSubmitted: (value) {
                FocusScope.of(context)
                    .requestFocus(_focusNodes[INDIVIDUAL_LAST_NAME]);
              },
              initialValue: initialValues[INDIVIDUAL_FIRST_NAME],
              focusNode: _focusNodes[INDIVIDUAL_FIRST_NAME],
              name: INDIVIDUAL_FIRST_NAME,
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
                FocusScope.of(context)
                    .requestFocus(_focusNodes[INDIVIDUAL_ORGANIZATION_NAME]);
              },
              onEditingComplete: () {
                //_formKey.currentState.save();
              },
              initialValue: initialValues[INDIVIDUAL_LAST_NAME],
              controller: _controllers[INDIVIDUAL_LAST_NAME],
              focusNode: _focusNodes[INDIVIDUAL_LAST_NAME],
              name: INDIVIDUAL_LAST_NAME,
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
                FocusScope.of(context)
                    .requestFocus(_focusNodes[INDIVIDUAL_STREET_ADDRESS]);
              },
              initialValue: initialValues[INDIVIDUAL_ORGANIZATION_NAME],
              controller: _controllers[INDIVIDUAL_ORGANIZATION_NAME],
              focusNode: _focusNodes[INDIVIDUAL_ORGANIZATION_NAME],
              name: INDIVIDUAL_ORGANIZATION_NAME,
              decoration: InputDecoration(
                labelText: 'Organization Name',
              ),
              onChanged: (value) {},
              validator: FormBuilderValidators.compose(
                [],
              ),
              keyboardType: TextInputType.name,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: FormBuilderTextField(
              onSubmitted: (value) {
                FocusScope.of(context)
                    .requestFocus(_focusNodes[INDIVIDUAL_CITY]);
              },
              initialValue: initialValues[INDIVIDUAL_STREET_ADDRESS],
              controller: _controllers[INDIVIDUAL_STREET_ADDRESS],
              focusNode: _focusNodes[INDIVIDUAL_STREET_ADDRESS],
              name: INDIVIDUAL_STREET_ADDRESS,
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
                    .requestFocus(_focusNodes[INDIVIDUAL_STATE]);
              },
              initialValue: initialValues[INDIVIDUAL_CITY],
              controller: _controllers[INDIVIDUAL_CITY],
              focusNode: _focusNodes[INDIVIDUAL_CITY],
              name: INDIVIDUAL_CITY,
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
                          .requestFocus(_focusNodes[INDIVIDUAL_ZIP]);
                    },

                    name: INDIVIDUAL_STATE,
                    decoration: InputDecoration(
                      labelText: 'State',
                    ),
                    // initialValue: 'Male',
                    allowClear: true,
                    hint: Text(''),
                    initialValue: STATES_DROPDOWN_DATA[0]['abbreviation'],

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
                          .requestFocus(_focusNodes[INDIVIDUAL_PHONE]);
                    },
                    focusNode: _focusNodes[INDIVIDUAL_ZIP],
                    name: INDIVIDUAL_ZIP,
                    decoration: InputDecoration(
                      labelText: 'Zip',
                    ),
                    initialValue: initialValues[INDIVIDUAL_ZIP],
                    controller: _controllers[INDIVIDUAL_ZIP],
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
                    .requestFocus(_focusNodes[INDIVIDUAL_EMAIL]);
              },
              initialValue: initialValues[INDIVIDUAL_PHONE],
              controller: _controllers[INDIVIDUAL_PHONE],
              focusNode: _focusNodes[INDIVIDUAL_PHONE],
              name: INDIVIDUAL_PHONE,
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
                FocusScope.of(context)
                    .requestFocus(_focusNodes[INDIVIDUAL_PREFERRED_CONTACT]);
              },
              initialValue: initialValues[INDIVIDUAL_EMAIL],
              controller: _controllers[INDIVIDUAL_EMAIL],
              focusNode: _focusNodes[INDIVIDUAL_EMAIL],
              name: INDIVIDUAL_EMAIL,
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
              initialValue: initialValues[INDIVIDUAL_PREFERRED_CONTACT],
              name: INDIVIDUAL_PREFERRED_CONTACT,
              options: preferredContactOptions
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
              options: complaintOptions
                  .map(
                    (option) => FormBuilderFieldOption(
                      value: option,
                    ),
                  )
                  .toList(
                    growable: false,
                  ),
              name: INDIVIDUAL_TYPE_OF_COMPLAINT,
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
              options: discriminationClasses
                  .map(
                    (option) => FormBuilderFieldOption(
                      value: option,
                    ),
                  )
                  .toList(
                    growable: false,
                  ),
              name: INDIVIDUAL_DISCRIMINATION_CLASS,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('When did the last discriminatory act occur?'),
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
                    _focusNodes[INDIVIDUAL_WHY_RESPONDENT_DESCRIMINATED]);
              },
              initialValue: initialValues[INDIVIDUAL_LAST_DISCRIMINATORY_ACT],
              controller: _controllers[INDIVIDUAL_LAST_DISCRIMINATORY_ACT],
              focusNode: _focusNodes[INDIVIDUAL_LAST_DISCRIMINATORY_ACT],
              name: INDIVIDUAL_LAST_DISCRIMINATORY_ACT,
              onChanged: (value) {},
              validator: FormBuilderValidators.compose(
                [],
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
                    _focusNodes[INDIVIDUAL_COMPLAINT_FILED_WITH_OTHER_ORG]);
              },
              initialValue:
                  initialValues[INDIVIDUAL_WHY_RESPONDENT_DESCRIMINATED],
              controller: _controllers[INDIVIDUAL_WHY_RESPONDENT_DESCRIMINATED],
              focusNode: _focusNodes[INDIVIDUAL_WHY_RESPONDENT_DESCRIMINATED],
              name: INDIVIDUAL_WHY_RESPONDENT_DESCRIMINATED,
              onChanged: (value) {},
              validator: FormBuilderValidators.compose(
                [],
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
                  initialValues[INDIVIDUAL_COMPLAINT_FILED_WITH_OTHER_ORG],
              controller:
                  _controllers[INDIVIDUAL_COMPLAINT_FILED_WITH_OTHER_ORG],
              focusNode: _focusNodes[INDIVIDUAL_COMPLAINT_FILED_WITH_OTHER_ORG],
              name: INDIVIDUAL_COMPLAINT_FILED_WITH_OTHER_ORG,
              onChanged: (value) {},
              validator: FormBuilderValidators.compose(
                [],
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: CustomButton(
                buttonColor: Colors.black,
                text: 'SUBMIT',
                textColor: Colors.white,
                onPressed: _submitIndividualForm,
              ),
            ),
          ),
          AppVersionText(),
        ],
      ),
    );
  }

  FormBuilder _buildOrganizationForm() {
    return FormBuilder(
      autoFocusOnValidationFailure: true,
      key: _organizationFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomGeneralTextWidget(
            text:
                'Respondent Information (Person or Organization that Discriminated)',
            style: Theme.of(context).textTheme.bodyText1!,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: FormBuilderTextField(
              onSubmitted: (value) {
                FocusScope.of(context)
                    .requestFocus(_focusNodes[ORGANIZATION_LAST_NAME]);
              },
              initialValue: initialValues[ORGANIZATION_FIRST_NAME],
              controller: _controllers[ORGANIZATION_FIRST_NAME],
              focusNode: _focusNodes[ORGANIZATION_FIRST_NAME],
              name: ORGANIZATION_FIRST_NAME,
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
                FocusScope.of(context)
                    .requestFocus(_focusNodes[ORGANIZATION_ORGANIZATION_NAME]);
              },
              onEditingComplete: () {
                //_formKey.currentState.save();
              },
              initialValue: initialValues[ORGANIZATION_LAST_NAME],
              controller: _controllers[ORGANIZATION_LAST_NAME],
              focusNode: _focusNodes[ORGANIZATION_LAST_NAME],
              name: ORGANIZATION_LAST_NAME,
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
                FocusScope.of(context)
                    .requestFocus(_focusNodes[ORGANIZATION_STREET_ADDRESS]);
              },
              initialValue: initialValues[ORGANIZATION_ORGANIZATION_NAME],
              controller: _controllers[ORGANIZATION_ORGANIZATION_NAME],
              focusNode: _focusNodes[ORGANIZATION_ORGANIZATION_NAME],
              name: ORGANIZATION_ORGANIZATION_NAME,
              decoration: InputDecoration(
                labelText: 'Organization Name',
              ),
              onChanged: (value) {},
              validator: FormBuilderValidators.compose(
                [],
              ),
              keyboardType: TextInputType.name,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: FormBuilderTextField(
              onSubmitted: (value) {
                FocusScope.of(context)
                    .requestFocus(_focusNodes[ORGANIZATION_CITY]);
              },
              initialValue: initialValues[ORGANIZATION_STREET_ADDRESS],
              controller: _controllers[ORGANIZATION_STREET_ADDRESS],
              focusNode: _focusNodes[ORGANIZATION_STREET_ADDRESS],
              name: ORGANIZATION_STREET_ADDRESS,
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
                    .requestFocus(_focusNodes[ORGANIZATION_STATE]);
              },
              initialValue: initialValues[ORGANIZATION_CITY],
              controller: _controllers[ORGANIZATION_CITY],
              focusNode: _focusNodes[ORGANIZATION_CITY],
              name: ORGANIZATION_CITY,
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
                          .requestFocus(_focusNodes[ORGANIZATION_ZIP]);
                    },

                    name: ORGANIZATION_STATE,
                    decoration: InputDecoration(
                      labelText: 'State',
                    ),
                    // initialValue: 'Male',
                    allowClear: true,
                    hint: Text(''),
                    initialValue: STATES_DROPDOWN_DATA[0]['abbreviation'],
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
                          .requestFocus(_focusNodes[ORGANIZATION_PHONE]);
                    },
                    focusNode: _focusNodes[ORGANIZATION_ZIP],
                    name: ORGANIZATION_ZIP,
                    decoration: InputDecoration(
                      labelText: 'Zip',
                    ),
                    initialValue: initialValues[ORGANIZATION_ZIP],
                    controller: _controllers[ORGANIZATION_ZIP],
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
                    .requestFocus(_focusNodes[ORGANIZATION_EMAIL]);
              },
              initialValue: initialValues[ORGANIZATION_PHONE],
              controller: _controllers[ORGANIZATION_PHONE],
              focusNode: _focusNodes[ORGANIZATION_PHONE],
              name: ORGANIZATION_PHONE,
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
              initialValue: initialValues[ORGANIZATION_EMAIL],
              controller: _controllers[ORGANIZATION_EMAIL],
              focusNode: _focusNodes[ORGANIZATION_EMAIL],
              name: ORGANIZATION_EMAIL,
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
              initialValue: initialValues[ORGANIZATION_PREFERRED_CONTACT],
              name: ORGANIZATION_PREFERRED_CONTACT,
              options: preferredContactOptions
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
              options: complaintOptions
                  .map(
                    (option) => FormBuilderFieldOption(
                      value: option,
                    ),
                  )
                  .toList(
                    growable: false,
                  ),
              name: ORGANIZATION_TYPE_OF_COMPLAINT,
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
              options: discriminationClasses
                  .map(
                    (option) => FormBuilderFieldOption(
                      value: option,
                    ),
                  )
                  .toList(
                    growable: false,
                  ),
              name: ORGANIZATION_DISCRIMINATION_CLASS,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('When did the last discriminatory act occur?'),
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
                    _focusNodes[ORGANIZATION_WHY_RESPONDENT_DESCRIMINATED]);
              },
              initialValue: initialValues[ORGANIZATION_LAST_DISCRIMINATORY_ACT],
              controller: _controllers[ORGANIZATION_LAST_DISCRIMINATORY_ACT],
              focusNode: _focusNodes[ORGANIZATION_LAST_DISCRIMINATORY_ACT],
              name: ORGANIZATION_LAST_DISCRIMINATORY_ACT,
              onChanged: (value) {},
              validator: FormBuilderValidators.compose(
                [],
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
                    _focusNodes[ORGANIZATION_COMPLAINT_FILED_WITH_OTHER_ORG]);
              },
              initialValue:
                  initialValues[ORGANIZATION_WHY_RESPONDENT_DESCRIMINATED],
              controller:
                  _controllers[ORGANIZATION_WHY_RESPONDENT_DESCRIMINATED],
              focusNode: _focusNodes[ORGANIZATION_WHY_RESPONDENT_DESCRIMINATED],
              name: ORGANIZATION_WHY_RESPONDENT_DESCRIMINATED,
              onChanged: (value) {},
              validator: FormBuilderValidators.compose(
                [],
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
                  initialValues[ORGANIZATION_COMPLAINT_FILED_WITH_OTHER_ORG],
              controller:
                  _controllers[ORGANIZATION_COMPLAINT_FILED_WITH_OTHER_ORG],
              focusNode:
                  _focusNodes[ORGANIZATION_COMPLAINT_FILED_WITH_OTHER_ORG],
              name: ORGANIZATION_COMPLAINT_FILED_WITH_OTHER_ORG,
              onChanged: (value) {},
              validator: FormBuilderValidators.compose(
                [],
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: CustomButton(
                buttonColor: Colors.black,
                text: 'SUBMIT',
                textColor: Colors.white,
                onPressed: _submitOrganizationForm,
              ),
            ),
          ),
          AppVersionText(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Dayton Human Relations Council'),
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () async {
              const url =
                  'http://daytonhrc.org/wp-content/uploads/2014/08/HRC-Complaintant-Brochure-.pdf';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            icon: Icon(Icons.book)),
        actions: [
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () {
              Route route = MaterialPageRoute(
                  builder: (BuildContext context) => FaqPage());
              Navigator.push(context, route);
            },
          )
        ],
      ),
      body: BlocConsumer<ComplaintFormBloc, ComplaintFormState>(
        builder: (context, state) {
          if (state is ComplaintFormLoadingState) {
            return CustomSpinner();
          }

          if (state is ComplaintFormInitialState) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          IMAGE_MANY_PEOPLE,
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  CustomGeneralTextWidget(
                    text: 'Civil Rights Discrimination Complaint Form',
                    style: Theme.of(context).textTheme.bodyText1!,
                  ),
                  CustomGeneralTextWidget(
                      text:
                          'The City of Dayton Human Relations Council accepts complaints of unlawful discrimination in housing, employment, credit transactions, and public accommodations. If you feel that you have been discriminated against in one of these areas based on one or more of the protected classes listed below, you may be eligible to file a complaint against the person or organization that discriminated against you.',
                      style: Theme.of(context).textTheme.headline6!),
                  CustomGeneralTextWidget(
                    text:
                        'If you believe that you have been the victim of discrimination, you can download and fill this complaint form or file a complaint in person at:',
                    style: Theme.of(context).textTheme.headline6!,
                  ),
                  CustomGeneralTextWidget(
                    text:
                        'The Human Relations Council, 371 West Second Street, Suite 100, Dayton, Ohio 45402',
                    style: Theme.of(context).textTheme.headline6!,
                  ),
                  CustomGeneralTextWidget(
                    text:
                        'You can also fill out the online form below and a member of our Civil Rights team will contact you as soon as possible.',
                    style: Theme.of(context).textTheme.headline6!,
                  ),
                  CustomGeneralTextWidget(
                    text:
                        'There is no cost to file a complaint and no attorney is needed for us to investigate your complaint.',
                    style: Theme.of(context).textTheme.headline6!,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                _isIndividual ? Colors.black : Colors.white),
                          ),
                          onPressed: () {
                            setState(
                              () {
                                _isIndividual = true;
                              },
                            );
                          },
                          child: Text(
                            'Individual',
                            style: TextStyle(
                              color:
                                  _isIndividual ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                _isIndividual ? Colors.white : Colors.black),
                          ),
                          onPressed: () {
                            setState(
                              () {
                                _isIndividual = false;
                              },
                            );
                          },
                          child: Text(
                            'Organization',
                            style: TextStyle(
                              color:
                                  _isIndividual ? Colors.black : Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  _isIndividual
                      ? _buildIndividualForm()
                      : _buildOrganizationForm()
                ],
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
          if (state is ComplaintFormInitialState) {}
          if (state is ComplaintFormErrorState) {}
        },
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
