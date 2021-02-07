import 'dart:async';
import 'dart:convert' show json;

import 'package:bloc/bloc.dart';
import 'package:dayton_human_relations_council/constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dayton_human_relations_council/service_locator.dart';
import 'package:dayton_human_relations_council/services/modal_service.dart';
import 'package:dayton_human_relations_council/widgets/custom_button.dart';
import 'package:dayton_human_relations_council/widgets/custom_spinner.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

part 'complaint_form_event.dart';
part 'complaint_form_state.dart';
part 'complaint_form_page.dart';

class ComplaintFormBloc extends Bloc<ComplaintFormEvent, ComplaintFormState> {
  ComplaintFormBloc()
      : super(
          ComplaintFormInitialState(),
        );

  @override
  Stream<ComplaintFormState> mapEventToState(
    ComplaintFormEvent event,
  ) async* {
    yield ComplaintFormLoadingState();

    if (event is SubmitComplaintFormEvent) {
      final Map<String, dynamic> formData = event.formData;

      final String complaint_firstName = formData[COMPLAINT_FIRST_NAME];
      final String complaint_lastName = formData[COMPLAINT_LAST_NAME];
      final String complaint_organizationName =
          formData[COMPLAINT_ORGANIZATION_NAME];
      final String complaint_streetAddress = formData[COMPLAINT_STREET_ADDRESS];
      final String complaint_city = formData[COMPLAINT_CITY];
      final String complaint_state = formData[COMPLAINT_STATE];
      final String complaint_zip = formData[COMPLAINT_ZIP];
      final String complaint_phone = formData[COMPLAINT_PHONE];
      final String complaint_email = formData[COMPLAINT_EMAIL];
      final String complaint_preferred_contact =
          formData[COMPLAINT_PREFERRED_CONTACT];

      final String respondent_first_name = formData[RESPONDENT_FIRST_NAME];
      final String respondent_last_name = formData[RESPONDENT_LAST_NAME];
      final String respondent_organization_name =
          formData[RESPONDENT_ORGANIZATION_NAME];
      final String respondent_street_address =
          formData[RESPONDENT_STREET_ADDRESS];
      final String respondent_city = formData[RESPONDENT_CITY];
      final String respondent_state = formData[RESPONDENT_STATE];
      final String respondent_zip = formData[RESPONDENT_ZIP];
      final String respondent_phone = formData[RESPONDENT_PHONE];
      final String respondent_email = formData[RESPONDENT_EMAIL];
      final List<String> type_of_complaint = formData[TYPE_OF_COMPLAINT];
      final List<String> discrimination_class = formData[DISCRIMINATION_CLASS];
      final String last_discriminatory_act = formData[LAST_DISCRIMINATORY_ACT];
      final String why_respondent_discriminated =
          formData[WHY_RESPONDENT_DESCRIMINATED];
      final String complaint_filed_with_other_org =
          formData[COMPLAINT_FILED_WITH_OTHER_ORG];

      print(formData);

      try {
        http.Response response = await http.post(
          'https://us-central1-dayton-human-relations-council.cloudfunctions.net/testEmail',
          body: {
            'complaint_firstName': complaint_firstName ?? '',
            'complaint_lastName': complaint_lastName ?? '',
            'complaint_organizationName': complaint_organizationName ?? '',
            'complaint_streetAddress': complaint_streetAddress ?? '',
            'complaint_city': complaint_city ?? '',
            'complaint_state': complaint_state ?? '',
            'complaint_zip': complaint_zip ?? '',
            'complaint_phone': complaint_phone ?? '',
            'complaint_email': complaint_email ?? '',
          },
          headers: {'content-type': 'application/x-www-form-urlencoded'},
        );

        if (json.decode(response.body) == true) {
          yield ComplaintFormSuccessState();
        } else {
          throw Exception('This did not work.');
        }
      } catch (error) {
        yield ComplaintFormErrorState(error: error);
      }
    }

    if (event is ReturnToFormEvent) {
      yield ComplaintFormInitialState();
    }
  }
}
