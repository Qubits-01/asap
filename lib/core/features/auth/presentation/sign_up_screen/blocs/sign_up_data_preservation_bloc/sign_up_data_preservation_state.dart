part of 'sign_up_data_preservation_bloc.dart';

sealed class SignUpDataPreservationState extends Equatable {
  const SignUpDataPreservationState();

  @override
  List<Object> get props => [];
}

final class SignUpDataPreservationInitial extends SignUpDataPreservationState {
  const SignUpDataPreservationInitial();
}

final class SignUpDataPreservationInProgress
    extends SignUpDataPreservationState {
  const SignUpDataPreservationInProgress();
}

final class SignUpDataPreservationSuccess extends SignUpDataPreservationState {
  const SignUpDataPreservationSuccess();
}

final class SignUpDataPreservationFailure extends SignUpDataPreservationState {
  const SignUpDataPreservationFailure({
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
