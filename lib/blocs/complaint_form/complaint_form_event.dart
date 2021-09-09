part of 'complaint_form_bloc.dart';

abstract class ComplaintFormEvent extends Equatable {
  const ComplaintFormEvent();

  @override
  List<Object> get props => [];
}

class SubmitComplaintFormEvent extends ComplaintFormEvent {
  final Map<String, dynamic> formData;

  SubmitComplaintFormEvent({
    required this.formData,
  });

  List<Object> get props => [
        formData,
      ];
}

class ReturnToFormEvent extends ComplaintFormEvent {}
