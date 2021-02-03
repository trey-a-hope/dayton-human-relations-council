import 'package:dayton_human_relations_council/complaint_form/complaint_form_bloc.dart';
import 'package:dayton_human_relations_council/constants.dart';
import 'package:dayton_human_relations_council/widgets/custom_button.dart';
import 'package:dayton_human_relations_council/widgets/custom_spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ComplaintFormPage extends StatefulWidget {
  @override
  State createState() => _ComplaintFormPageState();
}

class _ComplaintFormPageState extends State<ComplaintFormPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final _mobileFormatter = NumberTextInputFormatter();

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
    };
  }

  void fillFormWithDummyData() {
    initialValues = {
      COMPLAINT_FIRST_NAME: 'Trey',
      COMPLAINT_LAST_NAME: 'Hope',
      COMPLAINT_ORGANIZATION_NAME: 'Alpha Phi Alpha',
      COMPLAINT_STREET_ADDRESS: '5 Patrick Street',
      COMPLAINT_CITY: 'Trotwood',
      COMPLAINT_ZIP: '45426',
      COMPLAINT_PHONE: '9372705527',
      COMPLAINT_EMAIL: 'trey.a.hope@gmail.com',
      COMPLAINT_PREFERRED_CONTACT: 'Phone',
    };
  }

  void submitForm() async {
    _formKey.currentState.save();

    final FormBuilderState formBuilderState = _formKey.currentState;

    if (!formBuilderState.saveAndValidate()) return;

    // final bool confirm = await locator<ModalService>()
    //     .showConfirmation(
    //         context: context,
    //         title: 'Submit Critique',
    //         message: 'Are you sure?');

    // if (!confirm) return;
    //todo: uncomment this in production.

    Map<String, dynamic> formData = formBuilderState.value;

    context.read<ComplaintFormBloc>().add(
          SubmitComplaintFormEvent(formData: formData),
        );
  }

  @override
  Widget build(BuildContext context) {
    fillFormWithDummyData(); //todo: delete this in production.

    return BlocConsumer<ComplaintFormBloc, ComplaintFormState>(
      builder: (context, state) {
        if (state is ComplaintFormLoadingState) {
          return Scaffold(
            key: _scaffoldKey,
            body: CustomSpinner(),
          );
        }

        if (state is ComplaintFormInitialState) {
          return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: Text('Dayton Human Relations Council'),
              backgroundColor: Colors.brown,
              actions: [
                IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: () {
                    submitForm();
                  },
                )
              ],
            ),
            body: FormBuilder(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
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
                        text: 'The Human Relations Council\n' +
                            '371 West Second Street, Suite 100\n' +
                            'Dayton, Ohio 45402'),
                    generalTextWidget(
                        text:
                            'You can also fill out the online form below and a member of our Civil Rights team will contact you as soon as possible.'),
                    biggerTextWidget(
                        text: 'Complaint Information (Your Information)'),
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
                              focusNode: _focusNodes[COMPLAINT_PHONE],
                              name: COMPLAINT_ZIP,
                              decoration: InputDecoration(
                                labelText: 'Zip',
                              ),
                              initialValue: initialValues[COMPLAINT_ZIP],
                              onChanged: (value) {},
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
                      padding: const EdgeInsets.all(20),
                      child: FormBuilderRadioGroup(
                        onChanged: (value) {
                          FocusScope.of(context).requestFocus(_focusNodes['?']);
                        },
                        initialValue:
                            initialValues[COMPLAINT_PREFERRED_CONTACT],
                        decoration: InputDecoration(
                          labelText: 'Preferred Contact',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
                      child: CustomButton(
                        buttonColor: Colors.blueGrey,
                        text: 'SUBMIT',
                        textColor: Colors.white,
                        onPressed: submitForm,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }

        return Container();
      },
      listener: (context, state) {
        if (state is ComplaintFormErrorState) {}
      },
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
