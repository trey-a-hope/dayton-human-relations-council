import 'dart:async';
import 'dart:convert' show json;

import 'package:dayton_human_relations_council/constants.dart';
import 'package:dayton_human_relations_council/faq_page.dart';
import 'package:dayton_human_relations_council/service_locator.dart';
import 'package:dayton_human_relations_council/services/modal_service.dart';
import 'package:dayton_human_relations_council/widgets/custom_general_text_widget.dart';
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

      final String? individualFirstName = formData[INDIVIDUAL_FIRST_NAME];
      final String? individualLastName = formData[INDIVIDUAL_LAST_NAME];
      final String? individualOrganizationName =
          formData[INDIVIDUAL_ORGANIZATION_NAME];
      final String? individualStreetAddress =
          formData[INDIVIDUAL_STREET_ADDRESS];
      final String? individualCity = formData[INDIVIDUAL_CITY];
      final String? individualState = formData[INDIVIDUAL_STATE];
      final String? individualZip = formData[INDIVIDUAL_ZIP];
      final String? individualPhone = formData[INDIVIDUAL_PHONE];
      final String? individualEmail = formData[INDIVIDUAL_EMAIL];
      final String? individualPreferredContact =
          formData[INDIVIDUAL_PREFERRED_CONTACT];
      final List<String>? individualTypeOfComplaint =
          formData[INDIVIDUAL_TYPE_OF_COMPLAINT] ?? [];
      final List<String>? individualDiscriminationClass =
          formData[INDIVIDUAL_DISCRIMINATION_CLASS] ?? [];
      final String? individualLastDiscriminatoryAct =
          formData[INDIVIDUAL_LAST_DISCRIMINATORY_ACT];
      final String? individualWhyRespondentDiscriminated =
          formData[INDIVIDUAL_WHY_RESPONDENT_DESCRIMINATED];
      final String? individualComplaintFiledWithOtherOrg =
          formData[INDIVIDUAL_COMPLAINT_FILED_WITH_OTHER_ORG];

      final String? organizationFirstName = formData[ORGANIZATION_FIRST_NAME];
      final String? organizationLastName = formData[ORGANIZATION_LAST_NAME];
      final String? organizationOrganizationName =
          formData[ORGANIZATION_ORGANIZATION_NAME];
      final String? organizationStreetAddress =
          formData[ORGANIZATION_STREET_ADDRESS];
      final String? organizationCity = formData[ORGANIZATION_CITY];
      final String? organizationState = formData[ORGANIZATION_STATE];
      final String? organizationZip = formData[ORGANIZATION_ZIP];
      final String? organizationPhone = formData[ORGANIZATION_PHONE];
      final String? organizationEmail = formData[ORGANIZATION_EMAIL];
      final String? organizationPreferredContact =
          formData[ORGANIZATION_PREFERRED_CONTACT];
      final List<String>? organizationTypeOfComplaint =
          formData[ORGANIZATION_TYPE_OF_COMPLAINT] ?? [];
      final List<String>? organizationDiscriminationClass =
          formData[ORGANIZATION_DISCRIMINATION_CLASS] ?? [];
      final String? organizationLastDiscriminatoryAct =
          formData[ORGANIZATION_LAST_DISCRIMINATORY_ACT];
      final String? organizationWhyRespondentDiscriminated =
          formData[ORGANIZATION_WHY_RESPONDENT_DESCRIMINATED];
      final String? organizationComplaintFiledWithOtherOrg =
          formData[ORGANIZATION_COMPLAINT_FILED_WITH_OTHER_ORG];

      print(formData);

      try {
        http.Response response = await http.post(
          Uri.parse(EMAIL_ENDPOINT),
          body: {
            'individual_firstName': individualFirstName ?? '',
            'individual_lastName': individualLastName ?? '',
            'individual_organization_name': individualOrganizationName ?? '',
            'individual_street_address': individualStreetAddress ?? '',
            'individual_city': individualCity ?? '',
            'individual_state': individualState ?? '',
            'individual_zip': individualZip ?? '',
            'individual_phone': individualPhone ?? '',
            'individual_email': individualEmail ?? '',
            'individual_preferred_contact': individualPreferredContact ?? '',
            'individual_type_of_complaint': individualTypeOfComplaint != null
                ? individualTypeOfComplaint.join(', ')
                : '',
            'individual_discrimination_class':
                individualDiscriminationClass != null
                    ? individualDiscriminationClass.join(', ')
                    : '',
            'individual_last_discriminatory_act':
                individualLastDiscriminatoryAct ?? '',
            'individual_why_respondent_discriminated':
                individualWhyRespondentDiscriminated ?? '',
            'individual_complaint_filed_with_other_org':
                individualComplaintFiledWithOtherOrg ?? '',
            'organization_first_name': organizationFirstName ?? '',
            'organization_last_name': organizationLastName ?? '',
            'organization_organization_name':
                organizationOrganizationName ?? '',
            'organization_street_address': organizationStreetAddress ?? '',
            'organization_city': organizationCity ?? '',
            'organization_state': organizationState ?? '',
            'organization_zip': organizationZip ?? '',
            'organization_phone': organizationPhone ?? '',
            'organization_email': organizationEmail ?? '',
            'organization_preferred_contact':
                organizationPreferredContact ?? '',
            'organization_type_of_complaint':
                organizationTypeOfComplaint != null
                    ? organizationTypeOfComplaint.join(', ')
                    : '',
            'organization_discrimination_class':
                organizationDiscriminationClass != null
                    ? organizationDiscriminationClass.join(', ')
                    : '',
            'organization_last_discriminatory_act':
                organizationLastDiscriminatoryAct ?? '',
            'organization_why_respondent_discriminated':
                organizationWhyRespondentDiscriminated ?? '',
            'organization_complaint_filed_with_other_org':
                organizationComplaintFiledWithOtherOrg ?? '',
          },
          headers: {'content-type': 'application/x-www-form-urlencoded'},
        );

        dynamic res = json.decode(response.body);

        if (res[0]['statusCode'] == 200) {
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
