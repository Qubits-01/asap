part of 'sign_up_stepper_bloc.dart';

sealed class SignUpStepperState extends Equatable {
  const SignUpStepperState({bool? a});

  final bool? a = false;

  @override
  List<Object> get props => [];
}

final class SignUpStepperInitial extends SignUpStepperState {
  const SignUpStepperInitial();

  /// Default state of the [Stepper] widget when it is first rendered.
  final StepperEntity _stepperEntity = const StepperEntity(
    currentIndex: 0,
    userInformationStepState: StepState.editing,
    isUserInformationStepActive: true,
    addressInformationStepState: StepState.indexed,
    isAddressInformationStepActive: false,
    securityInformationStepState: StepState.indexed,
    isSecurityInformationStepActive: false,
  );

  // Getters.
  StepperEntity get stepperEntity => _stepperEntity;

  /// Prerequisite setup for the [Equatable] package.
  @override
  List<Object> get props => [stepperEntity];
}

final class SignUpStepperVisualUpdateInProgress extends SignUpStepperState {
  const SignUpStepperVisualUpdateInProgress();
}

final class SignUpStepperVisualUpdateSuccess extends SignUpStepperState {
  const SignUpStepperVisualUpdateSuccess({
    required StepperEntity stepperEntity,
  }) : _stepperEntity = stepperEntity;

  final StepperEntity _stepperEntity;

  // Getters.
  StepperEntity get stepperEntity => _stepperEntity;

  /// Prerequisite setup for the [Equatable] package.
  @override
  List<Object> get props => [stepperEntity];
}

final class SignUpStepperVisualUpdateFailure extends SignUpStepperState {
  const SignUpStepperVisualUpdateFailure({
    required String title,
    required String message,
  })  : _title = title,
        _message = message;

  final String _title;
  final String _message;

  // Getters.
  String get title => _title;
  String get message => _message;

  /// Prerequisite setup for the [Equatable] package.
  @override
  List<Object> get props => [title, message];
}
