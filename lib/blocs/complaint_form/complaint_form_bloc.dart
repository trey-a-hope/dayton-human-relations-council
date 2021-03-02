import 'dart:async';
import 'dart:convert' show json;

import 'package:bloc/bloc.dart';
import 'package:dayton_human_relations_council/constants.dart';
import 'package:dayton_human_relations_council/faq_page.dart';
import 'package:dayton_human_relations_council/service_locator.dart';
import 'package:dayton_human_relations_council/services/modal_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dayton_human_relations_council/widgets/custom_button.dart';
import 'package:dayton_human_relations_council/widgets/custom_spinner.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:url_launcher/url_launcher.dart';

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

      final String individual_firstName = formData[INDIVIDUAL_FIRST_NAME];
      final String individual_lastName = formData[INDIVIDUAL_LAST_NAME];
      final String individual_organization_name =
          formData[INDIVIDUAL_ORGANIZATION_NAME];
      final String individual_street_address =
          formData[INDIVIDUAL_STREET_ADDRESS];
      final String individual_city = formData[INDIVIDUAL_CITY];
      final String individual_state = formData[INDIVIDUAL_STATE];
      final String individual_zip = formData[INDIVIDUAL_ZIP];
      final String individual_phone = formData[INDIVIDUAL_PHONE];
      final String individual_email = formData[INDIVIDUAL_EMAIL];
      final String individual_preferred_contact =
          formData[INDIVIDUAL_PREFERRED_CONTACT];
      final List<String> individual_type_of_complaint =
          formData[INDIVIDUAL_TYPE_OF_COMPLAINT] ?? [];
      final List<String> individual_discrimination_class =
          formData[INDIVIDUAL_DISCRIMINATION_CLASS] ?? [];
      final String individual_last_discriminatory_act =
          formData[INDIVIDUAL_LAST_DISCRIMINATORY_ACT];
      final String individual_why_respondent_discriminated =
          formData[INDIVIDUAL_WHY_RESPONDENT_DESCRIMINATED];
      final String individual_complaint_filed_with_other_org =
          formData[INDIVIDUAL_COMPLAINT_FILED_WITH_OTHER_ORG];

      final String organization_first_name = formData[ORGANIZATION_FIRST_NAME];
      final String organization_last_name = formData[ORGANIZATION_LAST_NAME];
      final String organization_organization_name =
          formData[ORGANIZATION_ORGANIZATION_NAME];
      final String organization_street_address =
          formData[ORGANIZATION_STREET_ADDRESS];
      final String organization_city = formData[ORGANIZATION_CITY];
      final String organization_state = formData[ORGANIZATION_STATE];
      final String organization_zip = formData[ORGANIZATION_ZIP];
      final String organization_phone = formData[ORGANIZATION_PHONE];
      final String organization_email = formData[ORGANIZATION_EMAIL];
      final String organization_preferred_contact =
          formData[ORGANIZATION_PREFERRED_CONTACT];
      final List<String> organization_type_of_complaint =
          formData[ORGANIZATION_TYPE_OF_COMPLAINT] ?? [];
      final List<String> organization_discrimination_class =
          formData[ORGANIZATION_DISCRIMINATION_CLASS] ?? [];
      final String organization_last_discriminatory_act =
          formData[ORGANIZATION_LAST_DISCRIMINATORY_ACT];
      final String organization_why_respondent_discriminated =
          formData[ORGANIZATION_WHY_RESPONDENT_DESCRIMINATED];
      final String organization_complaint_filed_with_other_org =
          formData[ORGANIZATION_COMPLAINT_FILED_WITH_OTHER_ORG];

      print(formData);

      try {
        http.Response response = await http.post(
          'https://us-central1-dayton-human-relations-council.cloudfunctions.net/testEmail',
          body: {
            'individual_firstName': individual_firstName ?? '',
            'individual_lastName': individual_lastName ?? '',
            'individual_organization_name': individual_organization_name ?? '',
            'individual_street_address': individual_street_address ?? '',
            'individual_city': individual_city ?? '',
            'individual_state': individual_state ?? '',
            'individual_zip': individual_zip ?? '',
            'individual_phone': individual_phone ?? '',
            'individual_email': individual_email ?? '',
            'individual_preferred_contact': individual_preferred_contact ?? '',
            'individual_type_of_complaint': individual_type_of_complaint != null
                ? individual_type_of_complaint.join(', ')
                : '',
            'individual_discrimination_class':
                individual_discrimination_class != null
                    ? individual_discrimination_class.join(', ')
                    : '',
            'individual_last_discriminatory_act':
                individual_last_discriminatory_act ?? '',
            'individual_why_respondent_discriminated':
                individual_why_respondent_discriminated ?? '',
            'individual_complaint_filed_with_other_org':
                individual_complaint_filed_with_other_org ?? '',
            'organization_first_name': organization_first_name ?? '',
            'organization_last_name': organization_last_name ?? '',
            'organization_organization_name':
                organization_organization_name ?? '',
            'organization_street_address': organization_street_address ?? '',
            'organization_city': organization_city ?? '',
            'organization_state': organization_state ?? '',
            'organization_zip': organization_zip ?? '',
            'organization_phone': organization_phone ?? '',
            'organization_email': organization_email ?? '',
            'organization_preferred_contact':
                organization_preferred_contact ?? '',
            'organization_type_of_complaint':
                organization_type_of_complaint != null
                    ? organization_type_of_complaint.join(', ')
                    : '',
            'organization_discrimination_class':
                organization_discrimination_class != null
                    ? organization_discrimination_class.join(', ')
                    : '',
            'organization_last_discriminatory_act':
                organization_last_discriminatory_act ?? '',
            'organization_why_respondent_discriminated':
                organization_why_respondent_discriminated ?? '',
            'organization_complaint_filed_with_other_org':
                organization_complaint_filed_with_other_org ?? '',
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
