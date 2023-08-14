part of 'sign_up_form_data_bloc.dart';

sealed class SignUpFormDataState extends Equatable {
  const SignUpFormDataState();

  @override
  List<Object> get props => [];
}

final class SignUpFormDataInitial extends SignUpFormDataState {
  const SignUpFormDataInitial();
}

final class SignUpFormDataSavingInProgress extends SignUpFormDataState {
  const SignUpFormDataSavingInProgress();
}

final class SignUpFormDataSavingSuccess extends SignUpFormDataState {
  const SignUpFormDataSavingSuccess();
}

final class SignUpFormDataSavingFailure extends SignUpFormDataState {
  const SignUpFormDataSavingFailure({
    required String errorTitle,
    required String errorMessage,
  })  : _errorTitle = errorTitle,
        _errorMessage = errorMessage;

  final String _errorTitle;
  final String _errorMessage;

  // Getters.
  String get errorTitle => _errorTitle;
  String get errorMessage => _errorMessage;

  /// [Equatable] package setup requirements.
  @override
  List<Object> get props => [errorTitle, errorMessage];
}
