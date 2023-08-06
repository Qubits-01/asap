part of 'sign_up_data_preservation_bloc.dart';

sealed class SignUpDataPreservationState extends Equatable {
  const SignUpDataPreservationState();

  @override
  List<Object> get props => [];
}

final class SignUpDataPreservationInitial extends SignUpDataPreservationState {}

final class SignUpDataPreservationInProgress
    extends SignUpDataPreservationState {}

final class SignUpDataPreservationSuccess extends SignUpDataPreservationState {}

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
