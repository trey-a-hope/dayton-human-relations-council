part of 'complaint_form_bloc.dart';

abstract class ComplaintFormEvent extends Equatable {
  const ComplaintFormEvent();

  @override
  List<Object> get props => [];
}

class SubmitComplaintFormEvent extends ComplaintFormEvent {
  final Form form;

  SubmitComplaintFormEvent({
    @required this.form,
  });

  List<Object> get props => [
        form,
      ];
}
