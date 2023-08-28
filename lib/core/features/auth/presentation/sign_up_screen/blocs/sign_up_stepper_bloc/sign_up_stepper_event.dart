part of 'sign_up_stepper_bloc.dart';

sealed class SignUpStepperEvent extends Equatable {
  const SignUpStepperEvent();

  @override
  List<Object> get props => [];
}

final class SignUpStepperStarted extends SignUpStepperEvent {
  const SignUpStepperStarted();
}

final class SignUpStepperStepContinued extends SignUpStepperEvent {
  const SignUpStepperStepContinued();
}

final class SignUpStepperStepCanceled extends SignUpStepperEvent {
  const SignUpStepperStepCanceled();
}

final class SignUpStepperStepTapped extends SignUpStepperEvent {
  const SignUpStepperStepTapped({required int newIndex}) : _newIndex = newIndex;

  final int _newIndex;

  // Getters.
  int get newIndex => _newIndex;

  /// Prerequisite setup for the [Equatable] package.
  @override
  List<Object> get props => [newIndex];
}

final class SignUpStepperDropdownOnChanged extends SignUpStepperEvent {
  const SignUpStepperDropdownOnChanged({required final bool isFormValid})
      : _isFormValid = isFormValid;

  final bool _isFormValid;

  /// Getters.
  bool get isFormValid => _isFormValid;

  /// Prerequisite setup for the [Equatable] package.
  @override
  List<Object> get props => [isFormValid];
}
