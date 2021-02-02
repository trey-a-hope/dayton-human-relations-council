import 'package:cached_network_image/cached_network_image.dart';
import 'package:dayton_human_relations_council/complaint_form/complaint_form_bloc.dart';
import 'package:dayton_human_relations_council/service_locator.dart';
import 'package:dayton_human_relations_council/services/modal_service.dart';
import 'package:dayton_human_relations_council/services/validation_service.dart';
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
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
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

    final String firstName = formData['first_name'];
    final String lastName = formData['last_name'];

    print('Hello, $firstName $lastName');

    //TODO: Submit the form.
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
