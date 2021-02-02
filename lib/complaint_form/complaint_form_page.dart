import 'package:dayton_human_relations_council/complaint_form/complaint_form_bloc.dart';
import 'package:dayton_human_relations_council/constants.dart';
import 'package:dayton_human_relations_council/widgets/custom_button.dart';
import 'package:dayton_human_relations_council/widgets/custom_spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ComplaintFormPage extends StatefulWidget {
  @override
  State createState() => _ComplaintFormPageState();
}

class _ComplaintFormPageState extends State<ComplaintFormPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  Map<String, FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();

    _focusNodes = {
      'first_name': FocusNode(),
      'last_name': FocusNode(),
      'organization_name': FocusNode(),
      'street_address': FocusNode(),
      'city': FocusNode(),
      'state': FocusNode(),
      'zip': FocusNode(),
    };
  }

  void submitForm() async {
    final FormBuilderState formBuilderState = _formKey.currentState;

    if (!formBuilderState.saveAndValidate()) return;

    // final bool confirm = await locator<ModalService>()
    //     .showConfirmation(
    //         context: context,
    //         title: 'Submit Critique',
    //         message: 'Are you sure?');

    // if (!confirm) return;
    //todo: uncomment this.

    Map<String, dynamic> formData = formBuilderState.value;

    context.read<ComplaintFormBloc>().add(
          SubmitComplaintFormEvent(formData: formData),
        );
  }

  @override
  Widget build(BuildContext context) {
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
            ),
            body: FormBuilder(
              key: _formKey,
              child: ListView(
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
                    padding: EdgeInsets.all(20),
                    child: FormBuilderTextField(
                      onSubmitted: (value) {
                        FocusScope.of(context)
                            .requestFocus(_focusNodes['last_name']);
                      },
                      focusNode: _focusNodes['first_name'],
                      name: 'first_name',
                      decoration: InputDecoration(
                        labelText: 'First Name',
                      ),
                      onChanged: (value) {},
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(context),
                          // FormBuilderValidators.numeric(context),
                          // FormBuilderValidators.max(context, 70),
                        ],
                      ),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: FormBuilderTextField(
                      onSubmitted: (value) {
                        FocusScope.of(context)
                            .requestFocus(_focusNodes['organization_name']);
                      },
                      focusNode: _focusNodes['last_name'],
                      name: 'last_name',
                      decoration: InputDecoration(
                        labelText: 'Last Name',
                      ),
                      onChanged: (value) {},
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(context),
                        ],
                      ),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      '-- or --',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: FormBuilderTextField(
                      onSubmitted: (value) {
                        FocusScope.of(context)
                            .requestFocus(_focusNodes['street_address']);
                      },
                      focusNode: _focusNodes['organization_name'],
                      name: 'organization_name',
                      decoration: InputDecoration(
                        labelText: 'Organization Name',
                      ),
                      onChanged: (value) {},
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(context),
                        ],
                      ),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: FormBuilderTextField(
                      onSubmitted: (value) {
                        FocusScope.of(context)
                            .requestFocus(_focusNodes['city']);
                      },
                      focusNode: _focusNodes['street_address'],
                      name: 'street_address',
                      decoration: InputDecoration(
                        labelText: 'Street Address',
                      ),
                      onChanged: (value) {},
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(context),
                        ],
                      ),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: FormBuilderTextField(
                      onSubmitted: (value) {
                        FocusScope.of(context)
                            .requestFocus(_focusNodes['state']);
                      },
                      focusNode: _focusNodes['city'],
                      name: 'city',
                      decoration: InputDecoration(
                        labelText: 'City',
                      ),
                      onChanged: (value) {},
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(context),
                        ],
                      ),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                          child: FormBuilderDropdown(
                            onChanged: (state) {
                              FocusScope.of(context)
                                  .requestFocus(_focusNodes['zip']);
                            },
                            name: 'state',
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
                            focusNode: _focusNodes['zip'],
                            name: 'zip',
                            decoration: InputDecoration(
                              labelText: 'Zip',
                            ),
                            onChanged: (value) {},
                            // valueTransformer: (text) => num.tryParse(text),
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
                    padding: EdgeInsets.all(20),
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
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }

  Widget biggerTextWidget({@required String text}) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
