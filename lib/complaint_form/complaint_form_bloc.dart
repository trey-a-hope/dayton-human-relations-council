import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dayton_human_relations_council/constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'complaint_form_event.dart';
part 'complaint_form_state.dart';

class ComplaintFormBloc extends Bloc<ComplaintFormEvent, ComplaintFormState> {
  ComplaintFormBloc() : super(ComplaintFormInitialState());

  @override
  Stream<ComplaintFormState> mapEventToState(
    ComplaintFormEvent event,
  ) async* {
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

      print(formData);

      //TODO: Submit the form.
    }
  }
}
