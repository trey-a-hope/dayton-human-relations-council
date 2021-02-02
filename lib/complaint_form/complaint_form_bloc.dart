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
    if(event is SubmitComplaintFormEvent){

    }
  }
}
