part of '../sign_up_stepper_bloc.dart';

void onSignUpStepperDropdownOnChangedEventHandler({
  required SignUpStepperDropdownOnChanged event,
  required Emitter<SignUpStepperState> emit,
  required SignUpStepperState state,
  required GlobalKey<FormState> formKey,
}) {
  /// [ Step 1.1 ]
  /// Get a copy of the [SignUpStepperEntity] from the
  /// current state of [SignUpStepperBloc].
  late SignUpStepperEntity signUpStepperEntity;
  signUpStepperEntity = state.signUpStepperEntity.copyWith();

  /// [ Step 1.2 ]
  /// Emit the [SignUpStepperVisualUpdateInProgress] state.
  emit(SignUpStepperVisualUpdateInProgress(
    signUpStepperEntity: signUpStepperEntity,
  ));

  /// [ Step 1.3 ] Initialize the other variables.
  late final bool isFormValid;
  isFormValid = event.isFormValid;

  /// [ Step 2. ] Update the step state of the Address Information Step.
  signUpStepperEntity = signUpStepperEntity.copyWith(
    addressInformationStepState:
        isFormValid ? StepState.complete : StepState.error,
  );

  /// [ Step 3. ] Emit the [SignUpStepperVisualUpdateSuccess] state.
  emit(SignUpStepperVisualUpdateSuccess(
    signUpStepperEntity: signUpStepperEntity,
  ));
}
