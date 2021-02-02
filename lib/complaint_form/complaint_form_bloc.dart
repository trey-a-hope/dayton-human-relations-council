import 'dart:async';

import 'package:bloc/bloc.dart';
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

      final String firstName = formData['first_name'];
      final String lastName = formData['last_name'];
      final String organizationName = formData['organization_name'];
      final String streetAddress = formData['street_address'];
      final String city = formData['city'];
      final String state = formData['state'];
      final String zip = formData['zip'];

      print(formData);

      //TODO: Submit the form.
    }
  }
}
