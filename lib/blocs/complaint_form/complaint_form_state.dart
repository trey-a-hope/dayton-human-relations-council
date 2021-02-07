part of 'complaint_form_bloc.dart';

abstract class ComplaintFormState extends Equatable {
  const ComplaintFormState();

  @override
  List<Object> get props => [];
}

class ComplaintFormInitialState extends ComplaintFormState {
  const ComplaintFormInitialState();

  @override
  List<Object> get props => [];
}

class ComplaintFormLoadingState extends ComplaintFormState {}

class ComplaintFormSuccessState extends ComplaintFormState {}

class ComplaintFormErrorState extends ComplaintFormState {
  final dynamic error;

  ComplaintFormErrorState({
    @required this.error,
  });

  @override
  List<Object> get props => [
        error,
      ];
}
