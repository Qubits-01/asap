part of 'sign_up_stepper_bloc.dart';

sealed class SignUpStepperState extends Equatable {
  const SignUpStepperState({
    SignUpStepperEntity? signUpStepperEntity,
    FailureEntity? failureEntity,
  })  : _signUpStepperEntity = signUpStepperEntity,
        _failureEntity = failureEntity;

  final SignUpStepperEntity? _signUpStepperEntity;
  final FailureEntity? _failureEntity;

  /// Getters.
  SignUpStepperEntity? get signUpStepperEntity => _signUpStepperEntity;
  FailureEntity? get failureEntity => _failureEntity;

  /// Pre-requisite setup for the [Equatable] package.
  @override
  List<Object?> get props => [signUpStepperEntity, failureEntity];
}

final class SignUpStepperInitial extends SignUpStepperState {
  const SignUpStepperInitial({
    /// Default state of the [Stepper] widget when it is first rendered.
    super.signUpStepperEntity = const SignUpStepperEntity(
      currentIndex: 0,
      userInformationStepState: StepState.editing,
      isUserInformationStepActive: true,
      addressInformationStepState: StepState.indexed,
      isAddressInformationStepActive: false,
      securityInformationStepState: StepState.indexed,
      isSecurityInformationStepActive: false,
    ),
  });
}

final class SignUpStepperVisualUpdateInProgress extends SignUpStepperState {
  const SignUpStepperVisualUpdateInProgress();
}

final class SignUpStepperVisualUpdateSuccess extends SignUpStepperState {
  const SignUpStepperVisualUpdateSuccess({
    required SignUpStepperEntity super.signUpStepperEntity,
  });
}

final class SignUpStepperVisualUpdateFailure extends SignUpStepperState {
  const SignUpStepperVisualUpdateFailure({
    required FailureEntity super.failureEntity,
  });
}
